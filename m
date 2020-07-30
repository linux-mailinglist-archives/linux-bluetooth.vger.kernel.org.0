Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE022339D6
	for <lists+linux-bluetooth@lfdr.de>; Thu, 30 Jul 2020 22:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728800AbgG3Ui7 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 30 Jul 2020 16:38:59 -0400
Received: from mga01.intel.com ([192.55.52.88]:35035 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728586AbgG3Ui6 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 30 Jul 2020 16:38:58 -0400
IronPort-SDR: BEs/t8hxZHPtsgA1tPXuwgb3tsG00AdkfroC+blSYwdMYFwYQ6QtS3Oi09sge78Sf8+1xFPgLt
 tLPxndyCgMMg==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="169803098"
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; 
   d="scan'208";a="169803098"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2020 13:38:57 -0700
IronPort-SDR: r/xF+Ufcky/+dtRbGi6YWSvVRC+tIn1NIfwzPDbas0aMofR52nzzOtieHUB7pA7lIAYqqvewwz
 lwDRsBqFLmVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; 
   d="scan'208";a="330864954"
Received: from wlloyd-mobl.amr.corp.intel.com (HELO ingas-nuc1.intel.com) ([10.254.79.39])
  by orsmga007.jf.intel.com with ESMTP; 30 Jul 2020 13:38:56 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 02/10] mesh: Clean up handling of config model binding messages
Date:   Thu, 30 Jul 2020 13:38:43 -0700
Message-Id: <20200730203851.32043-3-inga.stotland@intel.com>
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
 mesh/cfgmod-server.c | 128 +++++++++++--------------------------------
 mesh/model.c         |  16 +-----
 2 files changed, 35 insertions(+), 109 deletions(-)

diff --git a/mesh/cfgmod-server.c b/mesh/cfgmod-server.c
index 73cf66ffd..6621d0935 100644
--- a/mesh/cfgmod-server.c
+++ b/mesh/cfgmod-server.c
@@ -112,8 +112,7 @@ static void config_pub_set(struct mesh_node *node, uint16_t net_idx,
 	uint16_t ele_addr, idx, ota = UNASSIGNED_ADDRESS;
 	const uint8_t *pub_addr;
 	uint16_t test_addr;
-	uint8_t ttl, period;
-	uint8_t retransmit;
+	uint8_t ttl, period, retransmit;
 	int status;
 	bool cred_flag;
 
@@ -363,115 +362,52 @@ static uint16_t config_sub_del_all(struct mesh_node *node, const uint8_t *pkt,
 	return n;
 }
 
-static void send_model_app_status(struct mesh_node *node, uint16_t net_idx,
-					uint16_t src, uint16_t dst,
-					uint8_t status, uint16_t addr,
-					uint32_t id, uint16_t idx)
-{
-	size_t n = mesh_model_opcode_set(OP_MODEL_APP_STATUS, msg);
-
-	msg[n++] = status;
-	l_put_le16(addr, msg + n);
-	n += 2;
-	l_put_le16(idx, msg + n);
-	n += 2;
-
-	if (IS_VENDOR(id)) {
-		l_put_le16(VENDOR_ID(id), msg + n);
-		n += 2;
-	}
-
-	l_put_le16(MODEL_ID(id), msg + n);
-	n += 2;
-
-	mesh_model_send(node, dst, src, APP_IDX_DEV_LOCAL, net_idx, DEFAULT_TTL,
-								false, msg, n);
-}
-
-static void model_app_list(struct mesh_node *node, uint16_t net_idx,
-					uint16_t src, uint16_t dst,
+static uint16_t model_app_list(struct mesh_node *node,
 					const uint8_t *pkt, uint16_t size)
 {
-	uint16_t ele_addr;
+	uint16_t ele_addr, n, bnd_len;
 	uint32_t id;
-	uint8_t *status;
-	uint16_t n;
-	int result;
+	int opcode;
 
+	opcode = (size == 4) ? OP_MODEL_APP_LIST : OP_VEND_MODEL_APP_LIST;
 	ele_addr = l_get_le16(pkt);
 
-	switch (size) {
-	default:
-		return;
-	case 4:
-		n = mesh_model_opcode_set(OP_MODEL_APP_LIST, msg);
-		status = msg + n;
-		id = l_get_le16(pkt + 2);
-		l_put_le16(ele_addr, msg + 1 + n);
-		l_put_le16((uint16_t) id, msg + 3 + n);
-		id = SET_ID(SIG_VENDOR, id);
-		n += 5;
-		break;
-	case 6:
-		n = mesh_model_opcode_set(OP_VEND_MODEL_APP_LIST, msg);
-		status = msg + n;
-		id = SET_ID(l_get_le16(pkt + 2), l_get_le16(pkt + 4));
+	n = mesh_model_opcode_set(opcode, msg);
+	memcpy(msg + n + 1, pkt, size);
 
-		l_put_le16(ele_addr, msg + 1 + n);
-		l_put_le16((uint16_t) VENDOR_ID(id), msg + 3 + n);
-		l_put_le16((uint16_t) MODEL_ID(id), msg + 5 + n);
-		n += 7;
-		break;
-	}
+	id = CFG_SET_ID(size == 6, pkt + 2);
 
-	result = mesh_model_get_bindings(node, ele_addr, id, msg + n,
-						MAX_MSG_LEN - n, &size);
-	n += size;
+	msg[n] = mesh_model_get_bindings(node, ele_addr, id, msg + n + 1 + size,
+					MAX_MSG_LEN - (n + 1 + size), &bnd_len);
 
-	if (result >= 0) {
-		*status = result;
-		mesh_model_send(node, dst, src, APP_IDX_DEV_LOCAL, net_idx,
-						DEFAULT_TTL, false, msg, n);
-	}
+	if (msg[n] == MESH_STATUS_SUCCESS)
+		n += bnd_len;
+
+	n += (size + 1);
+	return n;
 }
 
-static bool model_app_bind(struct mesh_node *node, uint16_t net_idx,
-					uint16_t src, uint16_t dst,
-					const uint8_t *pkt, uint16_t size,
-					bool unbind)
+static uint16_t model_app_bind(struct mesh_node *node, const uint8_t *pkt,
+						uint16_t size, bool unbind)
 {
-	uint16_t ele_addr;
+	uint16_t ele_addr, idx, n;
 	uint32_t id;
-	uint16_t idx;
-	int result;
-
-	switch (size) {
-	default:
-		return false;
-
-	case 6:
-		id = SET_ID(SIG_VENDOR, l_get_le16(pkt + 4));
-		break;
-	case 8:
-		id = SET_ID(l_get_le16(pkt + 4), l_get_le16(pkt + 6));
-		break;
-	}
 
 	ele_addr = l_get_le16(pkt);
 	idx = l_get_le16(pkt + 2);
+	id = CFG_SET_ID(size == 8, pkt + 4);
 
-	if (idx > 0xfff)
-		return false;
+	n = mesh_model_opcode_set(OP_MODEL_APP_STATUS, msg);
 
 	if (unbind)
-		result = mesh_model_binding_del(node, ele_addr, id, idx);
+		msg[n] = mesh_model_binding_del(node, ele_addr, id, idx);
 	else
-		result = mesh_model_binding_add(node, ele_addr, id, idx);
+		msg[n] = mesh_model_binding_add(node, ele_addr, id, idx);
 
-	send_model_app_status(node, net_idx, src, dst, result, ele_addr,
-								id, idx);
+	memcpy(msg + n + 1, pkt, size);
+	n += (size + 1);
 
-	return true;
+	return n;
 }
 
 static void hb_pub_timeout_func(struct l_timeout *timeout, void *user_data)
@@ -704,8 +640,7 @@ static bool cfg_srv_pkt(uint16_t src, uint16_t dst, uint16_t app_idx,
 		if (size != 1 || pkt[0] > TTL_MASK || pkt[0] == 1)
 			return true;
 
-		if (pkt[0] <= TTL_MASK)
-			node_default_ttl_set(node, pkt[0]);
+		node_default_ttl_set(node, pkt[0]);
 		/* Fall Through */
 
 	case OP_CONFIG_DEFAULT_TTL_GET:
@@ -1049,22 +984,25 @@ static bool cfg_srv_pkt(uint16_t src, uint16_t dst, uint16_t app_idx,
 
 	case OP_MODEL_APP_BIND:
 	case OP_MODEL_APP_UNBIND:
-		model_app_bind(node, net_idx, src, dst, pkt, size,
-				opcode != OP_MODEL_APP_BIND);
+		if (size != 6 && size != 8)
+			return true;
+
+		n = model_app_bind(node, pkt, size,
+						opcode != OP_MODEL_APP_BIND);
 		break;
 
 	case OP_VEND_MODEL_APP_GET:
 		if (size != 6)
 			return true;
 
-		model_app_list(node, net_idx, src, dst, pkt, size);
+		n = model_app_list(node, pkt, size);
 		break;
 
 	case OP_MODEL_APP_GET:
 		if (size != 4)
 			return true;
 
-		model_app_list(node, net_idx, src, dst, pkt, size);
+		n = model_app_list(node, pkt, size);
 		break;
 
 	case OP_CONFIG_HEARTBEAT_PUB_SET:
diff --git a/mesh/model.c b/mesh/model.c
index 3c9b6577a..e2cadfe36 100644
--- a/mesh/model.c
+++ b/mesh/model.c
@@ -111,13 +111,7 @@ static bool simple_match(const void *a, const void *b)
 
 static bool has_binding(struct l_queue *bindings, uint16_t idx)
 {
-	const struct l_queue_entry *l;
-
-	for (l = l_queue_get_entries(bindings); l; l = l->next) {
-		if (L_PTR_TO_UINT(l->data) == idx)
-			return true;
-	}
-	return false;
+	return l_queue_find(bindings, simple_match, L_UINT_TO_PTR(idx)) != NULL;
 }
 
 static bool find_virt_by_label(const void *a, const void *b)
@@ -628,7 +622,6 @@ static int update_binding(struct mesh_node *node, uint16_t addr, uint32_t id,
 						uint16_t app_idx, bool unbind)
 {
 	struct mesh_model *mod;
-	bool is_present;
 	int ele_idx = node_get_element_idx(node, addr);
 
 	if (ele_idx < 0)
@@ -645,12 +638,7 @@ static int update_binding(struct mesh_node *node, uint16_t addr, uint32_t id,
 	if (!appkey_have_key(node_get_net(node), app_idx))
 		return MESH_STATUS_INVALID_APPKEY;
 
-	is_present = has_binding(mod->bindings, app_idx);
-
-	if (!is_present && unbind)
-		return MESH_STATUS_SUCCESS;
-
-	if (is_present && !unbind)
+	if (unbind ^ has_binding(mod->bindings, app_idx))
 		return MESH_STATUS_SUCCESS;
 
 	if (unbind) {
-- 
2.26.2

