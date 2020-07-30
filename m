Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2DB82339DF
	for <lists+linux-bluetooth@lfdr.de>; Thu, 30 Jul 2020 22:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730566AbgG3UjH (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 30 Jul 2020 16:39:07 -0400
Received: from mga01.intel.com ([192.55.52.88]:35043 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730552AbgG3UjF (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 30 Jul 2020 16:39:05 -0400
IronPort-SDR: ZYoBTIQVrr45weGxRAQysws92frWjjy/4dwc3NWnq47N1h3y6skDtNQ2neFYny8IA20JC9wbIQ
 tcTK2njatHfQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="169803109"
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; 
   d="scan'208";a="169803109"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2020 13:39:04 -0700
IronPort-SDR: IG42GYL9o1wYXLviryrJKNcrYDe0A3/wiPeWaSvAqZAikcMYlIuFpXrZnwfms+yQtppH9g+9hh
 JAO4M8nOVrmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; 
   d="scan'208";a="330864997"
Received: from wlloyd-mobl.amr.corp.intel.com (HELO ingas-nuc1.intel.com) ([10.254.79.39])
  by orsmga007.jf.intel.com with ESMTP; 30 Jul 2020 13:39:04 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 09/10] mesh: Clean up handling of config KR phase messages
Date:   Thu, 30 Jul 2020 13:38:50 -0700
Message-Id: <20200730203851.32043-10-inga.stotland@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200730203851.32043-1-inga.stotland@intel.com>
References: <20200730203851.32043-1-inga.stotland@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This modification allows using a single point for sending out
the composed status messages by the Config Server.
---
 mesh/cfgmod-server.c | 55 +++++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 26 deletions(-)

diff --git a/mesh/cfgmod-server.c b/mesh/cfgmod-server.c
index a7369e435..cacc8b6ea 100644
--- a/mesh/cfgmod-server.c
+++ b/mesh/cfgmod-server.c
@@ -414,6 +414,31 @@ static uint16_t cfg_relay_msg(struct mesh_node *node, const uint8_t *pkt,
 	return n;
 }
 
+static uint16_t cfg_key_refresh_phase(struct mesh_node *node,
+						const uint8_t *pkt, int opcode)
+{
+	struct mesh_net *net = node_get_net(node);
+	uint16_t n, idx = l_get_le16(pkt);
+	uint8_t phase;
+
+	n = mesh_model_opcode_set(OP_CONFIG_KEY_REFRESH_PHASE_STATUS, msg);
+
+	if (opcode == OP_CONFIG_KEY_REFRESH_PHASE_SET) {
+		phase = pkt[2];
+		msg[n] = mesh_net_key_refresh_phase_set(net, idx, phase);
+		l_debug("Set KR Phase: net=%3.3x transition=%d", idx, phase);
+	} else {
+		msg[n] = mesh_net_key_refresh_phase_get(net, idx, &phase);
+		l_debug("Get KR Phase: net=%3.3x phase=%d", idx, phase);
+	}
+
+	l_put_le16(idx, msg + n);
+	msg[n + 2] = (msg[n] != MESH_STATUS_SUCCESS) ?
+						KEY_REFRESH_PHASE_NONE : phase;
+
+	return n + 3;
+}
+
 static void hb_pub_timeout_func(struct l_timeout *timeout, void *user_data)
 {
 	struct mesh_net *net = user_data;
@@ -712,8 +737,7 @@ static bool cfg_srv_pkt(uint16_t src, uint16_t dst, uint16_t app_idx,
 	int b_res = MESH_STATUS_SUCCESS;
 	struct mesh_net_heartbeat *hb;
 	uint16_t n_idx;
-	uint8_t state, status;
-	uint8_t phase;
+	uint8_t state;
 	bool virt = false;
 	uint16_t n;
 
@@ -920,37 +944,16 @@ static bool cfg_srv_pkt(uint16_t src, uint16_t dst, uint16_t app_idx,
 		break;
 
 	case OP_CONFIG_KEY_REFRESH_PHASE_SET:
-		if (size != 3 || pkt[2] > 0x03)
+		if (size != 3 || pkt[2] > KEY_REFRESH_PHASE_THREE)
 			return true;
 
-		b_res = mesh_net_key_refresh_phase_set(net, l_get_le16(pkt),
-							pkt[2]);
-		size = 2;
 		/* Fall Through */
 
 	case OP_CONFIG_KEY_REFRESH_PHASE_GET:
-		if (size != 2)
+		if (size != 2 && opcode == OP_CONFIG_KEY_REFRESH_PHASE_GET)
 			return true;
 
-		n_idx = l_get_le16(pkt);
-
-		n = mesh_model_opcode_set(OP_CONFIG_KEY_REFRESH_PHASE_STATUS,
-						msg);
-
-		/* State: 0x00-0x03 phase of key refresh */
-		status = mesh_net_key_refresh_phase_get(net, n_idx,
-							&phase);
-		if (status != MESH_STATUS_SUCCESS) {
-			b_res = status;
-			phase = KEY_REFRESH_PHASE_NONE;
-		}
-
-		msg[n++] = b_res;
-		l_put_le16(n_idx, msg + n);
-		n += 2;
-		msg[n++] = phase;
-
-		l_debug("Get/Set Key Refresh State (%d)", msg[n-1]);
+		n = cfg_key_refresh_phase(node, pkt, opcode);
 		break;
 
 	case OP_APPKEY_ADD:
-- 
2.26.2

