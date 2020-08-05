Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBEAA23CDCE
	for <lists+linux-bluetooth@lfdr.de>; Wed,  5 Aug 2020 19:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728858AbgHERxd (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 5 Aug 2020 13:53:33 -0400
Received: from mga05.intel.com ([192.55.52.43]:42218 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729037AbgHERuy (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 5 Aug 2020 13:50:54 -0400
IronPort-SDR: esvKMfuqqQ35u4alo5jJslvPD+eTgAbtJ5097ch/lNIHhxPrUwXSEEaqr9s7bbeWqkAmLZ6Nlw
 z9YxVvzRaqdw==
X-IronPort-AV: E=McAfee;i="6000,8403,9704"; a="237470637"
X-IronPort-AV: E=Sophos;i="5.75,438,1589266800"; 
   d="scan'208";a="237470637"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2020 10:44:59 -0700
IronPort-SDR: 6N1XZ+5AQ+p9ybhj4PqV5w43MKmz19K3TTPYTxKoSFAR5UQXG+TTOPAZiwBkwLhJE999upO5Zq
 7AogoIbVSMSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,438,1589266800"; 
   d="scan'208";a="437245732"
Received: from unknown (HELO ingas-nuc1.intel.com) ([10.254.118.189])
  by orsmga004.jf.intel.com with ESMTP; 05 Aug 2020 10:44:59 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ v4 04/10] mesh: Clean up handling of config publication messages
Date:   Wed,  5 Aug 2020 10:44:50 -0700
Message-Id: <20200805174456.49342-5-inga.stotland@intel.com>
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

Also, return Feature Not Supported errror code when credential
flag is set, but the node does not support LPN feature
---
 mesh/cfgmod-server.c | 99 ++++++++++++++++++--------------------------
 mesh/model.c         |  7 +++-
 mesh/net.h           |  2 -
 3 files changed, 46 insertions(+), 62 deletions(-)

diff --git a/mesh/cfgmod-server.c b/mesh/cfgmod-server.c
index c501b0a52..57646543d 100644
--- a/mesh/cfgmod-server.c
+++ b/mesh/cfgmod-server.c
@@ -32,6 +32,8 @@
 #include "mesh/mesh-config.h"
 #include "mesh/cfgmod.h"
 
+#define CREDFLAG_MASK	0x1000
+
 #define CFG_SET_ID(vendor, pkt)	((vendor) ?	\
 		(SET_ID(l_get_le16((pkt)), l_get_le16((pkt) + 2))) :	\
 		(SET_ID(SIG_VENDOR, l_get_le16(pkt))))
@@ -44,11 +46,9 @@ static const uint8_t supported_pages[] = {
 
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
 
@@ -72,46 +72,36 @@ static void send_pub_status(struct mesh_node *node, uint16_t net_idx,
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
@@ -119,42 +109,35 @@ static void config_pub_set(struct mesh_node *node, uint16_t net_idx,
 	ele_addr = l_get_le16(pkt);
 	pub_addr = pkt + 2;
 
-	pkt += (virt ? 14 : 0);
+	pub_dst = l_get_le16(pub_addr);
 
-	idx = l_get_le16(pkt + 4);
-	ttl = pkt[6];
-	period = pkt[7];
-	retransmit = pkt[8];
-	id = l_get_le16(pkt + 9);
+	if (!virt && IS_VIRTUAL(pub_dst))
+		return 0;
 
-	if (!vendor)
-		id = SET_ID(SIG_VENDOR, id);
-	else
-		id = SET_ID(id, l_get_le16(pkt + 11));
+	pkt += (virt ? 14 : 0);
 
-	/* Don't accept virtual seeming addresses */
-	test_addr = l_get_le16(pub_addr);
-	if (!virt && IS_VIRTUAL(test_addr))
-		return;
+	idx = l_get_le16(pkt + 4);
+	if (idx > CREDFLAG_MASK)
+		return 0;
 
 	cred_flag = !!(CREDFLAG_MASK & idx);
 	idx &= APP_IDX_MASK;
+	ttl = pkt[6];
+	period = pkt[7];
+	retransmit = pkt[8];
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
@@ -165,7 +148,7 @@ static void config_pub_set(struct mesh_node *node, uint16_t net_idx,
 	} else {
 		struct mesh_config_pub db_pub = {
 			.virt = virt,
-			.addr = ota,
+			.addr = pub_dst,
 			.idx = idx,
 			.ttl = ttl,
 			.credential = cred_flag,
@@ -180,12 +163,12 @@ static void config_pub_set(struct mesh_node *node, uint16_t net_idx,
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
@@ -667,14 +650,14 @@ static bool cfg_srv_pkt(uint16_t src, uint16_t dst, uint16_t app_idx,
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
diff --git a/mesh/net.h b/mesh/net.h
index 7117f1a47..2673b895a 100644
--- a/mesh/net.h
+++ b/mesh/net.h
@@ -32,8 +32,6 @@ struct mesh_node;
 
 #define CTL		0x80
 
-#define CREDFLAG_MASK	0x1000
-
 #define KEY_CACHE_SIZE	64
 #define FRND_CACHE_MAX	32
 
-- 
2.26.2

