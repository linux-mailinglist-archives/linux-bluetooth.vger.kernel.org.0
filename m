Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE3F323CF67
	for <lists+linux-bluetooth@lfdr.de>; Wed,  5 Aug 2020 21:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728586AbgHETUa (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 5 Aug 2020 15:20:30 -0400
Received: from mga05.intel.com ([192.55.52.43]:42218 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729011AbgHERsd (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 5 Aug 2020 13:48:33 -0400
IronPort-SDR: Q5E0MYTINo4cbxVY4MCN83I4ln99/V5qPyP+lbfb5C4cIjZhsnkd1JBv0SUqPQ0DToxuIq31cB
 +HLEt8HcJPKw==
X-IronPort-AV: E=McAfee;i="6000,8403,9704"; a="237470672"
X-IronPort-AV: E=Sophos;i="5.75,438,1589266800"; 
   d="scan'208";a="237470672"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2020 10:45:02 -0700
IronPort-SDR: +MZaZ9ic0ukh830t1xE74snLMpFxy5pkt+TGb5EArAMw8zgeONk+hPcjaLTrMLRThC4QhdXhce
 liTCv5OH0y2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,438,1589266800"; 
   d="scan'208";a="437245790"
Received: from unknown (HELO ingas-nuc1.intel.com) ([10.254.118.189])
  by orsmga004.jf.intel.com with ESMTP; 05 Aug 2020 10:45:02 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ v4 09/10] mesh: Clean up handling of config KR phase messages
Date:   Wed,  5 Aug 2020 10:44:55 -0700
Message-Id: <20200805174456.49342-10-inga.stotland@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200805174456.49342-1-inga.stotland@intel.com>
References: <20200805174456.49342-1-inga.stotland@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This modification allows using a single point for sending out
the composed status messages by the Config Server.

Also, this checks for the correct relationship between KR transition
and KR phase values. Correct error codes are sent on unsuccessful
requests and malformed requests are ignored.
---
 mesh/cfgmod-server.c | 68 +++++++++++++++++++++++++++-----------------
 mesh/mesh-defs.h     |  3 ++
 mesh/net.c           | 53 ++++++++++++----------------------
 mesh/net.h           |  4 +--
 4 files changed, 65 insertions(+), 63 deletions(-)

diff --git a/mesh/cfgmod-server.c b/mesh/cfgmod-server.c
index 5b3ed3d97..98c04dde7 100644
--- a/mesh/cfgmod-server.c
+++ b/mesh/cfgmod-server.c
@@ -420,6 +420,43 @@ static uint16_t cfg_relay_msg(struct mesh_node *node, const uint8_t *pkt,
 	return n;
 }
 
+static uint16_t cfg_key_refresh_phase(struct mesh_node *node,
+						const uint8_t *pkt, int opcode)
+{
+	struct mesh_net *net = node_get_net(node);
+	uint16_t n, idx = l_get_le16(pkt);
+	uint8_t phase;
+	int status;
+
+	n = mesh_model_opcode_set(OP_CONFIG_KEY_REFRESH_PHASE_STATUS, msg);
+	status = mesh_net_key_refresh_phase_get(net, idx, &phase);
+
+	if (status == MESH_STATUS_SUCCESS &&
+				opcode == OP_CONFIG_KEY_REFRESH_PHASE_SET) {
+
+		if (pkt[2] == KEY_REFRESH_TRANS_TWO) {
+			if (phase == KEY_REFRESH_PHASE_TWO)
+				goto done;
+			else if (phase != KEY_REFRESH_PHASE_ONE)
+				return 0;
+		}
+
+		status = mesh_net_key_refresh_phase_set(net, idx, pkt[2]);
+		l_debug("Set KR Phase: net=%3.3x transition=%d", idx, pkt[2]);
+
+		if (status == MESH_STATUS_SUCCESS)
+			mesh_net_key_refresh_phase_get(net, idx, &phase);
+	}
+
+done:
+	msg[n] = status;
+	l_put_le16(idx, msg + n);
+	msg[n + 2] = (status != MESH_STATUS_SUCCESS) ?
+						KEY_REFRESH_PHASE_NONE : phase;
+
+	return n + 3;
+}
+
 static void hb_pub_timeout_func(struct l_timeout *timeout, void *user_data)
 {
 	struct mesh_net *net = user_data;
@@ -718,8 +755,7 @@ static bool cfg_srv_pkt(uint16_t src, uint16_t dst, uint16_t app_idx,
 	int b_res = MESH_STATUS_SUCCESS;
 	struct mesh_net_heartbeat *hb;
 	uint16_t n_idx;
-	uint8_t state, status;
-	uint8_t phase;
+	uint8_t state;
 	bool virt = false;
 	uint16_t n;
 
@@ -926,37 +962,17 @@ static bool cfg_srv_pkt(uint16_t src, uint16_t dst, uint16_t app_idx,
 		break;
 
 	case OP_CONFIG_KEY_REFRESH_PHASE_SET:
-		if (size != 3 || pkt[2] > 0x03)
+		if (size != 3 || (pkt[2] != KEY_REFRESH_TRANS_THREE &&
+					pkt[2] != KEY_REFRESH_TRANS_TWO))
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
diff --git a/mesh/mesh-defs.h b/mesh/mesh-defs.h
index bbde53303..6ceeb73f5 100644
--- a/mesh/mesh-defs.h
+++ b/mesh/mesh-defs.h
@@ -36,6 +36,9 @@
 #define KEY_REFRESH_PHASE_TWO	0x02
 #define KEY_REFRESH_PHASE_THREE	0x03
 
+#define KEY_REFRESH_TRANS_TWO	0x02
+#define KEY_REFRESH_TRANS_THREE	0x03
+
 #define DEFAULT_TTL		0xff
 #define TTL_MASK		0x7f
 
diff --git a/mesh/net.c b/mesh/net.c
index b54c647cb..9b4454fee 100644
--- a/mesh/net.c
+++ b/mesh/net.c
@@ -2433,6 +2433,10 @@ static int key_refresh_phase_two(struct mesh_net *net, uint16_t idx)
 		return MESH_STATUS_INVALID_NETKEY;
 
 	l_debug("Key refresh procedure phase 2: start using new net TX keys");
+
+	if (subnet->kr_phase == KEY_REFRESH_PHASE_TWO)
+		return MESH_STATUS_SUCCESS;
+
 	subnet->key_refresh = 1;
 	subnet->net_key_tx = subnet->net_key_upd;
 	/*
@@ -2445,8 +2449,9 @@ static int key_refresh_phase_two(struct mesh_net *net, uint16_t idx)
 
 	l_queue_foreach(net->friends, frnd_kr_phase2, net);
 
-	mesh_config_net_key_set_phase(node_config_get(net->node), idx,
-						KEY_REFRESH_PHASE_TWO);
+	if (!mesh_config_net_key_set_phase(node_config_get(net->node), idx,
+							KEY_REFRESH_PHASE_TWO))
+		return MESH_STATUS_STORAGE_FAIL;
 
 	return MESH_STATUS_SUCCESS;
 }
@@ -2479,8 +2484,9 @@ static int key_refresh_finish(struct mesh_net *net, uint16_t idx)
 
 	l_queue_foreach(net->friends, frnd_kr_phase3, net);
 
-	mesh_config_net_key_set_phase(node_config_get(net->node), idx,
-							KEY_REFRESH_PHASE_NONE);
+	if (!mesh_config_net_key_set_phase(node_config_get(net->node), idx,
+							KEY_REFRESH_PHASE_NONE))
+		return MESH_STATUS_STORAGE_FAIL;
 
 	return MESH_STATUS_SUCCESS;
 }
@@ -3168,45 +3174,22 @@ void mesh_net_transport_send(struct mesh_net *net, uint32_t key_id,
 		send_msg_pkt(net, pkt, pkt_len + 1);
 }
 
-uint8_t mesh_net_key_refresh_phase_set(struct mesh_net *net, uint16_t idx,
+int mesh_net_key_refresh_phase_set(struct mesh_net *net, uint16_t idx,
 							uint8_t transition)
 {
-	struct mesh_subnet *subnet;
-
-	if (!net)
-		return MESH_STATUS_UNSPECIFIED_ERROR;
-
-	subnet = l_queue_find(net->subnets, match_key_index,
-							L_UINT_TO_PTR(idx));
-	if (!subnet)
-		return MESH_STATUS_INVALID_NETKEY;
-
-	if (transition == subnet->kr_phase)
-		return MESH_STATUS_SUCCESS;
+	switch (transition) {
+	case KEY_REFRESH_TRANS_TWO:
+		return key_refresh_phase_two(net, idx);
 
-	if ((transition != 2 && transition != 3) ||
-						transition < subnet->kr_phase)
-		return MESH_STATUS_CANNOT_SET;
+	case KEY_REFRESH_TRANS_THREE:
+		return key_refresh_finish(net, idx);
 
-	switch (transition) {
-	case 2:
-		if (key_refresh_phase_two(net, idx)
-							!= MESH_STATUS_SUCCESS)
-			return MESH_STATUS_CANNOT_SET;
-		break;
-	case 3:
-		if (key_refresh_finish(net, idx)
-							!= MESH_STATUS_SUCCESS)
-			return MESH_STATUS_CANNOT_SET;
-		break;
 	default:
-		return MESH_STATUS_CANNOT_SET;
+		return MESH_STATUS_UNSPECIFIED_ERROR;
 	}
-
-	return MESH_STATUS_SUCCESS;
 }
 
-uint8_t mesh_net_key_refresh_phase_get(struct mesh_net *net, uint16_t idx,
+int mesh_net_key_refresh_phase_get(struct mesh_net *net, uint16_t idx,
 								uint8_t *phase)
 {
 	struct mesh_subnet *subnet;
diff --git a/mesh/net.h b/mesh/net.h
index 2673b895a..3d374280f 100644
--- a/mesh/net.h
+++ b/mesh/net.h
@@ -320,9 +320,9 @@ void mesh_friend_sub_add(struct mesh_net *net, uint16_t lpn, uint8_t ele_cnt,
 							const uint8_t *list);
 void mesh_friend_sub_del(struct mesh_net *net, uint16_t lpn, uint8_t cnt,
 						const uint8_t *del_list);
-uint8_t mesh_net_key_refresh_phase_set(struct mesh_net *net, uint16_t net_idx,
+int mesh_net_key_refresh_phase_set(struct mesh_net *net, uint16_t net_idx,
 							uint8_t transition);
-uint8_t mesh_net_key_refresh_phase_get(struct mesh_net *net, uint16_t net_idx,
+int mesh_net_key_refresh_phase_get(struct mesh_net *net, uint16_t net_idx,
 							uint8_t *phase);
 void mesh_net_send_seg(struct mesh_net *net, uint32_t key_id,
 				uint32_t iv_index, uint8_t ttl, uint32_t seq,
-- 
2.26.2

