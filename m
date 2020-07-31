Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE3A233F04
	for <lists+linux-bluetooth@lfdr.de>; Fri, 31 Jul 2020 08:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731418AbgGaGTl (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 31 Jul 2020 02:19:41 -0400
Received: from mga06.intel.com ([134.134.136.31]:44828 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731415AbgGaGTl (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 31 Jul 2020 02:19:41 -0400
IronPort-SDR: itYisu8WiV/xmmvwm/2Om0DPJGVZqU/rw+JuPXsZ6FhzdDJWI+NtzZlwXmcvVeum1ZcPdVCQ32
 fG0/1v9Amvfw==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="213269552"
X-IronPort-AV: E=Sophos;i="5.75,417,1589266800"; 
   d="scan'208";a="213269552"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2020 23:19:40 -0700
IronPort-SDR: eBWjUGnSU3xITWeMvglJxL28Yy0wJTJayM8LVLDl1HopvbV5gT5r+ipbkXUsFW+O2pTWTuCuU3
 jQj5wbD1O2Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,417,1589266800"; 
   d="scan'208";a="329163344"
Received: from wlloyd-mobl.amr.corp.intel.com (HELO ingas-nuc1.intel.com) ([10.254.79.39])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Jul 2020 23:19:40 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ v2 04/10] mesh: Clean up handling of config publication messages
Date:   Thu, 30 Jul 2020 23:19:30 -0700
Message-Id: <20200731061936.56952-4-inga.stotland@intel.com>
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

Also, return Feature Not Supported errror code when credential
flag is set, but the node does not support LPN feature
---
 mesh/cfgmod-server.c | 95 +++++++++++++++++---------------------------
 mesh/model.c         |  7 +++-
 2 files changed, 41 insertions(+), 61 deletions(-)

diff --git a/mesh/cfgmod-server.c b/mesh/cfgmod-server.c
index 2d47429f7..9633b7240 100644
--- a/mesh/cfgmod-server.c
+++ b/mesh/cfgmod-server.c
@@ -44,11 +44,9 @@ static const uint8_t supported_pages[] = {
 
 static uint8_t msg[MAX_MSG_LEN];
 
-static void send_pub_status(struct mesh_node *node, uint16_t net_idx,
-			uint16_t src, uint16_t dst,
-			uint8_t status, uint16_t ele_addr, uint32_t id,
-			uint16_t pub_addr, uint16_t idx, bool cred_flag,
-			uint8_t ttl, uint8_t period, uint8_t retransmit)
+static uint16_t set_pub_status(uint8_t status, uint16_t ele_addr, uint32_t id,
+				uint16_t pub_addr, uint16_t idx, bool cred_flag,
+				uint8_t ttl, uint8_t period, uint8_t retransmit)
 {
 	size_t n;
 
@@ -72,46 +70,36 @@ static void send_pub_status(struct mesh_node *node, uint16_t net_idx,
 		n += 4;
 	}
 
-	mesh_model_send(node, dst, src, APP_IDX_DEV_LOCAL, net_idx, DEFAULT_TTL,
-								false, msg, n);
+	return n;
 }
 
-static void config_pub_get(struct mesh_node *node, uint16_t net_idx,
-					uint16_t src, uint16_t dst,
-					const uint8_t *pkt, uint16_t size)
+static uint16_t config_pub_get(struct mesh_node *node, const uint8_t *pkt,
+								bool vendor)
 {
 	uint32_t id;
 	uint16_t ele_addr;
 	struct mesh_model_pub *pub;
 	int status;
 
-	if (size == 4) {
-		id = SET_ID(SIG_VENDOR, l_get_le16(pkt + 2));
-	} else if (size == 6) {
-		id = SET_ID(l_get_le16(pkt + 2), l_get_le16(pkt + 4));
-	} else
-		return;
-
 	ele_addr = l_get_le16(pkt);
+	id = CFG_SET_ID(vendor, pkt + 2);
+
 	pub = mesh_model_pub_get(node, ele_addr, id, &status);
 
 	if (pub && status == MESH_STATUS_SUCCESS)
-		send_pub_status(node, net_idx, src, dst, status, ele_addr,
-				id, pub->addr, pub->idx, pub->credential,
-				pub->ttl, pub->period, pub->retransmit);
+		return set_pub_status(status, ele_addr, id, pub->addr, pub->idx,
+					pub->credential, pub->ttl, pub->period,
+					pub->retransmit);
 	else
-		send_pub_status(node, net_idx, src, dst, status, ele_addr,
-				id, 0, 0, 0, 0, 0, 0);
+		return set_pub_status(status, ele_addr, id, 0, 0, 0, 0, 0, 0);
 }
 
-static void config_pub_set(struct mesh_node *node, uint16_t net_idx,
-				uint16_t src, uint16_t dst,
-				const uint8_t *pkt, bool virt, bool vendor)
+static uint16_t config_pub_set(struct mesh_node *node, const uint8_t *pkt,
+							bool virt, bool vendor)
 {
 	uint32_t id;
-	uint16_t ele_addr, idx, ota = UNASSIGNED_ADDRESS;
+	uint16_t ele_addr, idx, pub_dst;
 	const uint8_t *pub_addr;
-	uint16_t test_addr;
 	uint8_t ttl, period, retransmit;
 	int status;
 	bool cred_flag;
@@ -119,42 +107,31 @@ static void config_pub_set(struct mesh_node *node, uint16_t net_idx,
 	ele_addr = l_get_le16(pkt);
 	pub_addr = pkt + 2;
 
-	pkt += (virt ? 14 : 0);
+	pub_dst = l_get_le16(pub_addr);
+
+	if (!virt && IS_VIRTUAL(pub_dst))
+		return 0;
 
+	pkt += (virt ? 14 : 0);
 	idx = l_get_le16(pkt + 4);
+	cred_flag = !!(CREDFLAG_MASK & idx);
+	idx &= APP_IDX_MASK;
 	ttl = pkt[6];
 	period = pkt[7];
 	retransmit = pkt[8];
-	id = l_get_le16(pkt + 9);
-
-	if (!vendor)
-		id = SET_ID(SIG_VENDOR, id);
-	else
-		id = SET_ID(id, l_get_le16(pkt + 11));
-
-	/* Don't accept virtual seeming addresses */
-	test_addr = l_get_le16(pub_addr);
-	if (!virt && IS_VIRTUAL(test_addr))
-		return;
-
-	cred_flag = !!(CREDFLAG_MASK & idx);
-	idx &= APP_IDX_MASK;
+	id = CFG_SET_ID(vendor, pkt + 9);
 
 	status = mesh_model_pub_set(node, ele_addr, id, pub_addr, idx,
 					cred_flag, ttl, period, retransmit,
-					virt, &ota);
-
-	l_debug("pub_set: status %d, ea %4.4x, ota: %4.4x, mod: %x, idx: %3.3x",
-					status, ele_addr, ota, id, idx);
+					virt, &pub_dst);
 
-	if (status != MESH_STATUS_SUCCESS) {
-		send_pub_status(node, net_idx, src, dst, status, ele_addr,
-						id, 0, 0, 0, 0, 0, 0);
+	l_debug("pub_set: status %d, ea %4.4x, ota: %4.4x, id: %x, idx: %3.3x",
+					status, ele_addr, pub_dst, id, idx);
 
-		return;
-	}
+	if (status != MESH_STATUS_SUCCESS)
+		return set_pub_status(status, ele_addr, id, 0, 0, 0, 0, 0, 0);
 
-	if (IS_UNASSIGNED(test_addr) && !virt) {
+	if (IS_UNASSIGNED(pub_dst) && !virt) {
 		ttl = period = idx = 0;
 
 		/* Remove model publication from config file */
@@ -165,7 +142,7 @@ static void config_pub_set(struct mesh_node *node, uint16_t net_idx,
 	} else {
 		struct mesh_config_pub db_pub = {
 			.virt = virt,
-			.addr = ota,
+			.addr = pub_dst,
 			.idx = idx,
 			.ttl = ttl,
 			.credential = cred_flag,
@@ -180,12 +157,12 @@ static void config_pub_set(struct mesh_node *node, uint16_t net_idx,
 		/* Save model publication to config file */
 		if (!mesh_config_model_pub_add(node_config_get(node), ele_addr,
 						vendor ? id : MODEL_ID(id),
-							vendor, &db_pub))
+						vendor, &db_pub))
 			status = MESH_STATUS_STORAGE_FAIL;
 	}
 
-	send_pub_status(node, net_idx, src, dst, status, ele_addr, id, ota,
-				idx, cred_flag, ttl, period, retransmit);
+	return set_pub_status(status, ele_addr, id, pub_dst, idx, cred_flag,
+						ttl, period, retransmit);
 }
 
 static uint16_t cfg_sub_get_msg(struct mesh_node *node, const uint8_t *pkt,
@@ -663,14 +640,14 @@ static bool cfg_srv_pkt(uint16_t src, uint16_t dst, uint16_t app_idx,
 		if (!virt && (size != 11 && size != 13))
 			return true;
 
-		config_pub_set(node, net_idx, src, dst, pkt, virt,
-						size == 13 || size == 27);
+		n = config_pub_set(node, pkt, virt, size == 13 || size == 27);
 		break;
 
 	case OP_CONFIG_MODEL_PUB_GET:
 		if (size != 4 && size != 6)
 			return true;
-		config_pub_get(node, net_idx, src, dst, pkt, size);
+
+		n = config_pub_get(node, pkt, size == 6);
 		break;
 
 	case OP_CONFIG_VEND_MODEL_SUB_GET:
diff --git a/mesh/model.c b/mesh/model.c
index e2cadfe36..a92ab6b43 100644
--- a/mesh/model.c
+++ b/mesh/model.c
@@ -1072,7 +1072,7 @@ bool mesh_model_send(struct mesh_node *node, uint16_t src, uint16_t dst,
 int mesh_model_pub_set(struct mesh_node *node, uint16_t addr, uint32_t id,
 			const uint8_t *pub_addr, uint16_t idx, bool cred_flag,
 			uint8_t ttl, uint8_t period, uint8_t retransmit,
-			bool is_virt, uint16_t *dst)
+			bool is_virt, uint16_t *pub_dst)
 {
 	struct mesh_model *mod;
 	int status, ele_idx = node_get_element_idx(node, addr);
@@ -1099,6 +1099,9 @@ int mesh_model_pub_set(struct mesh_node *node, uint16_t addr, uint32_t id,
 		return MESH_STATUS_SUCCESS;
 	}
 
+	if (cred_flag && node_lpn_mode_get(node) != MESH_MODE_ENABLED)
+		return MESH_STATUS_FEATURE_NO_SUPPORT;
+
 	/* Check if the old publication destination is a virtual label */
 	if (mod->pub && mod->pub->virt) {
 		unref_virt(mod->pub->virt);
@@ -1112,7 +1115,7 @@ int mesh_model_pub_set(struct mesh_node *node, uint16_t addr, uint32_t id,
 		status = set_virt_pub(mod, pub_addr, idx, cred_flag, ttl,
 						period, retransmit);
 
-	*dst = mod->pub->addr;
+	*pub_dst = mod->pub->addr;
 
 	if (status != MESH_STATUS_SUCCESS)
 		return status;
-- 
2.26.2

