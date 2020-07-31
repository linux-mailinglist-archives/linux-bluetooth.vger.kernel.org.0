Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90CE7233F0B
	for <lists+linux-bluetooth@lfdr.de>; Fri, 31 Jul 2020 08:19:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731429AbgGaGTq (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 31 Jul 2020 02:19:46 -0400
Received: from mga06.intel.com ([134.134.136.31]:44831 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731413AbgGaGTp (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 31 Jul 2020 02:19:45 -0400
IronPort-SDR: yKYOsThrBd3b9OPEzP5/GqiSAI68qEIVIlvzkfxFHEwk0OBqVPzNMT2qPx1I9rgBopUpBWBLTT
 o1Cx+e8EBHbQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="213269553"
X-IronPort-AV: E=Sophos;i="5.75,417,1589266800"; 
   d="scan'208";a="213269553"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2020 23:19:41 -0700
IronPort-SDR: LRT5zmBiSBJipnFM8a7MtRBphVKoHufW8oLBR/tq9U0BUmtC99tw0NsbPNp4Ng/hEsx4RhmMNK
 NO0oVyvVaWuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,417,1589266800"; 
   d="scan'208";a="329163348"
Received: from wlloyd-mobl.amr.corp.intel.com (HELO ingas-nuc1.intel.com) ([10.254.79.39])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Jul 2020 23:19:40 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ v2 05/10] mesh: Clean up handling of config net and app key messages
Date:   Thu, 30 Jul 2020 23:19:31 -0700
Message-Id: <20200731061936.56952-5-inga.stotland@intel.com>
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
 mesh/cfgmod-server.c | 147 ++++++++++++++++++++++---------------------
 1 file changed, 75 insertions(+), 72 deletions(-)

diff --git a/mesh/cfgmod-server.c b/mesh/cfgmod-server.c
index 9633b7240..9d243dd8b 100644
--- a/mesh/cfgmod-server.c
+++ b/mesh/cfgmod-server.c
@@ -537,6 +537,73 @@ static void node_reset(void *user_data)
 	node_remove(node);
 }
 
+static uint16_t cfg_appkey_msg(struct mesh_node *node, const uint8_t *pkt,
+								int opcode)
+{
+	uint16_t n_idx, a_idx, n;
+	struct mesh_net *net = node_get_net(node);
+
+	n_idx = l_get_le16(pkt) & 0xfff;
+	a_idx = l_get_le16(pkt + 1) >> 4;
+
+	n = mesh_model_opcode_set(OP_APPKEY_STATUS, msg);
+
+	if (opcode == OP_APPKEY_ADD)
+		msg[n] = appkey_key_add(net, n_idx, a_idx, pkt + 3);
+	else if (opcode == OP_APPKEY_UPDATE)
+		msg[n] = appkey_key_update(net, n_idx, a_idx, pkt + 3);
+	else
+		msg[n] = appkey_key_delete(net, n_idx, a_idx);
+
+	l_debug("AppKey Command %s: Net_Idx %3.3x, App_Idx %3.3x",
+			(msg[n] == MESH_STATUS_SUCCESS) ? "success" : "fail",
+								n_idx, a_idx);
+
+	memcpy(msg + n + 1, &pkt[0], 3);
+
+	return n + 4;
+}
+
+static uint16_t cfg_netkey_msg(struct mesh_node *node, const uint8_t *pkt,
+								int opcode)
+{
+	uint16_t n_idx, n;
+	struct mesh_net *net = node_get_net(node);
+
+	n_idx = l_get_le16(pkt);
+	n = mesh_model_opcode_set(OP_NETKEY_STATUS, msg);
+
+	if (opcode == OP_NETKEY_ADD)
+		msg[n] = mesh_net_add_key(net, n_idx, pkt + 2);
+	else if (opcode == OP_NETKEY_UPDATE)
+		msg[n] = mesh_net_update_key(net, n_idx, pkt + 2);
+	else
+		msg[n] = mesh_net_del_key(net, n_idx);
+
+	l_debug("NetKey Command %s: Net_Idx %3.3x",
+			(msg[n] == MESH_STATUS_SUCCESS) ? "success" : "fail",
+									n_idx);
+
+	memcpy(msg + n + 1, &pkt[0], 2);
+
+	return n + 3;
+}
+
+static uint16_t cfg_get_appkeys_msg(struct mesh_node *node, const uint8_t *pkt)
+{
+	uint16_t n_idx, sz, n;
+
+	n_idx = l_get_le16(pkt);
+
+	n = mesh_model_opcode_set(OP_APPKEY_LIST, msg);
+	l_put_le16(n_idx, msg + n + 1);
+
+	msg[n] = appkey_list(node_get_net(node), n_idx, msg + n + 3,
+						MAX_MSG_LEN - (n + 3), &sz);
+
+	return n + 3 + sz;
+}
+
 static uint16_t get_composition(struct mesh_node *node, uint8_t page,
 								uint8_t *buf)
 {
@@ -575,7 +642,7 @@ static bool cfg_srv_pkt(uint16_t src, uint16_t dst, uint16_t app_idx,
 	uint32_t opcode, tmp32;
 	int b_res = MESH_STATUS_SUCCESS;
 	struct mesh_net_heartbeat *hb;
-	uint16_t n_idx, a_idx;
+	uint16_t n_idx;
 	uint8_t state, status;
 	uint8_t phase;
 	bool virt = false;
@@ -846,60 +913,19 @@ static bool cfg_srv_pkt(uint16_t src, uint16_t dst, uint16_t app_idx,
 		if (size != 19)
 			return true;
 
-		n_idx = l_get_le16(pkt) & 0xfff;
-		a_idx = l_get_le16(pkt + 1) >> 4;
-
-		if (opcode == OP_APPKEY_ADD)
-			b_res = appkey_key_add(net, n_idx, a_idx, pkt + 3);
-		else
-			b_res = appkey_key_update(net, n_idx, a_idx,
-								pkt + 3);
-
-		l_debug("Add/Update AppKey %s: Net_Idx %3.3x, App_Idx %3.3x",
-			(b_res == MESH_STATUS_SUCCESS) ? "success" : "fail",
-							n_idx, a_idx);
-
-
-		n = mesh_model_opcode_set(OP_APPKEY_STATUS, msg);
-
-		msg[n++] = b_res;
-		msg[n++] = pkt[0];
-		msg[n++] = pkt[1];
-		msg[n++] = pkt[2];
-		break;
-
+		/* Fall Through */
 	case OP_APPKEY_DELETE:
-		if (size != 3)
+		if (opcode == OP_APPKEY_DELETE && size != 3)
 			return true;
 
-		n_idx = l_get_le16(pkt) & 0xfff;
-		a_idx = l_get_le16(pkt + 1) >> 4;
-		b_res = appkey_key_delete(net, n_idx, a_idx);
-		l_debug("Delete AppKey %s Net_Idx %3.3x to App_Idx %3.3x",
-			(b_res == MESH_STATUS_SUCCESS) ? "success" : "fail",
-							n_idx, a_idx);
-
-		n = mesh_model_opcode_set(OP_APPKEY_STATUS, msg);
-		msg[n++] = b_res;
-		msg[n++] = pkt[0];
-		msg[n++] = pkt[1];
-		msg[n++] = pkt[2];
+		n = cfg_appkey_msg(node, pkt, opcode);
 		break;
 
 	case OP_APPKEY_GET:
 		if (size != 2)
 			return true;
 
-		n_idx = l_get_le16(pkt);
-
-		n = mesh_model_opcode_set(OP_APPKEY_LIST, msg);
-
-		status = appkey_list(net, n_idx, msg + n + 3,
-						MAX_MSG_LEN - n - 3, &size);
-
-		msg[n] = status;
-		l_put_le16(n_idx, msg + n + 1);
-		n += (size + 3);
+		n = cfg_get_appkeys_msg(node, pkt);
 		break;
 
 	case OP_NETKEY_ADD:
@@ -907,35 +933,12 @@ static bool cfg_srv_pkt(uint16_t src, uint16_t dst, uint16_t app_idx,
 		if (size != 18)
 			return true;
 
-		n_idx = l_get_le16(pkt);
-
-		if (opcode == OP_NETKEY_ADD)
-			b_res = mesh_net_add_key(net, n_idx, pkt + 2);
-		else
-			b_res = mesh_net_update_key(net, n_idx, pkt + 2);
-
-		l_debug("NetKey Add/Update %s",
-			(b_res == MESH_STATUS_SUCCESS) ? "success" : "fail");
-
-		n = mesh_model_opcode_set(OP_NETKEY_STATUS, msg);
-		msg[n++] = b_res;
-		l_put_le16(l_get_le16(pkt), msg + n);
-		n += 2;
-		break;
-
+		/* Fall Through */
 	case OP_NETKEY_DELETE:
-		if (size != 2)
+		if (opcode == OP_NETKEY_DELETE && size != 2)
 			return true;
 
-		b_res = mesh_net_del_key(net, l_get_le16(pkt));
-
-		l_debug("NetKey delete %s",
-			(b_res == MESH_STATUS_SUCCESS) ? "success" : "fail");
-
-		n = mesh_model_opcode_set(OP_NETKEY_STATUS, msg);
-		msg[n++] = b_res;
-		l_put_le16(l_get_le16(pkt), msg + n);
-		n += 2;
+		n = cfg_netkey_msg(node, pkt, opcode);
 		break;
 
 	case OP_NETKEY_GET:
-- 
2.26.2

