Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C262233F09
	for <lists+linux-bluetooth@lfdr.de>; Fri, 31 Jul 2020 08:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731426AbgGaGTo (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 31 Jul 2020 02:19:44 -0400
Received: from mga06.intel.com ([134.134.136.31]:44828 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731419AbgGaGTn (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 31 Jul 2020 02:19:43 -0400
IronPort-SDR: mgRUeVbwLAgqHESCEP3xiqTos1XuuWqPXLmlxYe2ZVAdushi0aZwAW0j801+mBf6S89Wb8mlwX
 TgNIg7qdPRRQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="213269557"
X-IronPort-AV: E=Sophos;i="5.75,417,1589266800"; 
   d="scan'208";a="213269557"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2020 23:19:43 -0700
IronPort-SDR: mcYk5sxhY7yRcDTKR2w8qjRqscLTMKCeO1kGVuEnfyz6q1/sZvYRa/Sm9lgZ6iBJNu/leFqX1s
 mRJ80MYSCZDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,417,1589266800"; 
   d="scan'208";a="329163360"
Received: from wlloyd-mobl.amr.corp.intel.com (HELO ingas-nuc1.intel.com) ([10.254.79.39])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Jul 2020 23:19:43 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ v2 08/10] mesh: Clean up handling of config net transmit messages
Date:   Thu, 30 Jul 2020 23:19:34 -0700
Message-Id: <20200731061936.56952-8-inga.stotland@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200731061936.56952-1-inga.stotland@intel.com>
References: <20200731061936.56952-1-inga.stotland@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This modification allows using a single point for sending out
the composed status messages by the Config Server.
---
 mesh/cfgmod-server.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/mesh/cfgmod-server.c b/mesh/cfgmod-server.c
index e489a56cd..b27105b40 100644
--- a/mesh/cfgmod-server.c
+++ b/mesh/cfgmod-server.c
@@ -647,6 +647,28 @@ static uint16_t cfg_poll_timeout_msg(struct mesh_node *node, const uint8_t *pkt)
 	return n;
 }
 
+static uint16_t cfg_net_tx_msg(struct mesh_node *node, const uint8_t *pkt,
+								int opcode)
+{
+	uint8_t cnt;
+	uint16_t interval, n;
+	struct mesh_net *net = node_get_net(node);
+
+	cnt = (pkt[0] & 0x7) + 1;
+	interval = ((pkt[0] >> 3) + 1) * 10;
+
+	if (opcode == OP_CONFIG_NETWORK_TRANSMIT_SET &&
+			mesh_config_write_net_transmit(node_config_get(node),
+							cnt, interval))
+		mesh_net_transmit_params_set(net, cnt, interval);
+
+	n = mesh_model_opcode_set(OP_CONFIG_NETWORK_TRANSMIT_STATUS, msg);
+
+	mesh_net_transmit_params_get(net, &cnt, &interval);
+	msg[n++] = (cnt - 1) + ((interval/10 - 1) << 3);
+	return n;
+}
+
 static uint16_t get_composition(struct mesh_node *node, uint8_t page,
 								uint8_t *buf)
 {
@@ -689,8 +711,6 @@ static bool cfg_srv_pkt(uint16_t src, uint16_t dst, uint16_t app_idx,
 	uint8_t state, status;
 	uint8_t phase;
 	bool virt = false;
-	uint8_t count;
-	uint16_t interval;
 	uint16_t n;
 
 	if (app_idx != APP_IDX_DEV_LOCAL)
@@ -811,25 +831,13 @@ static bool cfg_srv_pkt(uint16_t src, uint16_t dst, uint16_t app_idx,
 	case OP_CONFIG_NETWORK_TRANSMIT_SET:
 		if (size != 1)
 			return true;
-
-		count = (pkt[0] & 0x7) + 1;
-		interval = ((pkt[0] >> 3) + 1) * 10;
-
-		if (mesh_config_write_net_transmit(node_config_get(node), count,
-								interval))
-			mesh_net_transmit_params_set(net, count, interval);
 		/* Fall Through */
 
 	case OP_CONFIG_NETWORK_TRANSMIT_GET:
 		if (opcode == OP_CONFIG_NETWORK_TRANSMIT_GET && size != 0)
 			return true;
 
-		n = mesh_model_opcode_set(OP_CONFIG_NETWORK_TRANSMIT_STATUS,
-									msg);
-		mesh_net_transmit_params_get(net, &count, &interval);
-		msg[n++] = (count - 1) + ((interval/10 - 1) << 3);
-
-		l_debug("Get/Set Network Transmit Config");
+		n = cfg_net_tx_msg(node, pkt, opcode);
 		break;
 
 	case OP_CONFIG_PROXY_SET:
-- 
2.26.2

