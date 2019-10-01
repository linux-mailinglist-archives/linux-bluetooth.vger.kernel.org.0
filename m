Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 583DFC3A73
	for <lists+linux-bluetooth@lfdr.de>; Tue,  1 Oct 2019 18:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729188AbfJAQ1a (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 1 Oct 2019 12:27:30 -0400
Received: from mga04.intel.com ([192.55.52.120]:8674 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725843AbfJAQ1a (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 1 Oct 2019 12:27:30 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Oct 2019 09:27:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,571,1559545200"; 
   d="scan'208";a="195698787"
Received: from ingas-nuc1.sea.intel.com ([10.251.152.1])
  by orsmga006.jf.intel.com with ESMTP; 01 Oct 2019 09:27:29 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ v2] mesh: Make mesh-config API more consistent
Date:   Tue,  1 Oct 2019 09:27:28 -0700
Message-Id: <20191001162728.4434-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This changes the prototypes for mesh_config_model_binding_add() and
mesh_config_model_binding_del() to take the element's address as input
parameter instead of the element's index. The change aligns the API
with other functions that handle storage of model states.
---
 mesh/mesh-config-json.c | 34 ++++++++++++++++++++++------------
 mesh/mesh-config.h      | 11 ++++++-----
 mesh/model.c            |  7 ++-----
 3 files changed, 30 insertions(+), 22 deletions(-)

diff --git a/mesh/mesh-config-json.c b/mesh/mesh-config-json.c
index cafa2fdd7..198fef518 100644
--- a/mesh/mesh-config-json.c
+++ b/mesh/mesh-config-json.c
@@ -835,11 +835,12 @@ bool mesh_config_app_key_del(struct mesh_config *cfg, uint16_t net_idx,
 	return save_config(jnode, cfg->node_dir_path);
 }
 
-bool mesh_config_model_binding_add(struct mesh_config *cfg, uint8_t ele_idx,
-					bool vendor, uint32_t mod_id,
+bool mesh_config_model_binding_add(struct mesh_config *cfg, uint16_t ele_addr,
+						bool vendor, uint32_t mod_id,
 							uint16_t app_idx)
 {
 	json_object *jnode, *jmodel, *jstring, *jarray = NULL;
+	int ele_idx;
 	char buf[5];
 
 	if (!cfg)
@@ -847,6 +848,10 @@ bool mesh_config_model_binding_add(struct mesh_config *cfg, uint8_t ele_idx,
 
 	jnode = cfg->jnode;
 
+	ele_idx = get_element_index(jnode, ele_addr);
+	if (ele_idx < 0)
+		return false;
+
 	jmodel = get_element_model(jnode, ele_idx, mod_id, vendor);
 	if (!jmodel)
 		return false;
@@ -875,11 +880,12 @@ bool mesh_config_model_binding_add(struct mesh_config *cfg, uint8_t ele_idx,
 	return save_config(jnode, cfg->node_dir_path);
 }
 
-bool mesh_config_model_binding_del(struct mesh_config *cfg, uint8_t ele_idx,
-					bool vendor, uint32_t mod_id,
+bool mesh_config_model_binding_del(struct mesh_config *cfg, uint16_t ele_addr,
+						bool vendor, uint32_t mod_id,
 							uint16_t app_idx)
 {
 	json_object *jnode, *jmodel, *jarray, *jarray_new;
+	int ele_idx;
 	char buf[5];
 
 	if (!cfg)
@@ -887,6 +893,10 @@ bool mesh_config_model_binding_del(struct mesh_config *cfg, uint8_t ele_idx,
 
 	jnode = cfg->jnode;
 
+	ele_idx = get_element_index(jnode, ele_addr);
+	if (ele_idx < 0)
+		return false;
+
 	jmodel = get_element_model(jnode, ele_idx, mod_id, vendor);
 	if (!jmodel)
 		return false;
@@ -1818,7 +1828,7 @@ bool mesh_config_net_key_set_phase(struct mesh_config *cfg, uint16_t idx,
 	return save_config(jnode, cfg->node_dir_path);
 }
 
-bool mesh_config_model_pub_add(struct mesh_config *cfg, uint16_t addr,
+bool mesh_config_model_pub_add(struct mesh_config *cfg, uint16_t ele_addr,
 					uint32_t mod_id, bool vendor,
 					struct mesh_config_pub *pub)
 {
@@ -1831,7 +1841,7 @@ bool mesh_config_model_pub_add(struct mesh_config *cfg, uint16_t addr,
 
 	jnode = cfg->jnode;
 
-	ele_idx = get_element_index(jnode, addr);
+	ele_idx = get_element_index(jnode, ele_addr);
 	if (ele_idx < 0)
 		return false;
 
@@ -1886,13 +1896,13 @@ fail:
 	return false;
 }
 
-static bool delete_model_property(json_object *jnode, uint16_t addr,
+static bool delete_model_property(json_object *jnode, uint16_t ele_addr,
 			uint32_t mod_id, bool vendor, const char *keyword)
 {
 	json_object *jmodel;
 	int ele_idx;
 
-	ele_idx = get_element_index(jnode, addr);
+	ele_idx = get_element_index(jnode, ele_addr);
 	if (ele_idx < 0)
 		return false;
 
@@ -1915,7 +1925,7 @@ bool mesh_config_model_pub_del(struct mesh_config *cfg, uint16_t addr,
 	return save_config(cfg->jnode, cfg->node_dir_path);
 }
 
-bool mesh_config_model_sub_add(struct mesh_config *cfg, uint16_t addr,
+bool mesh_config_model_sub_add(struct mesh_config *cfg, uint16_t ele_addr,
 						uint32_t mod_id, bool vendor,
 						struct mesh_config_sub *sub)
 {
@@ -1928,7 +1938,7 @@ bool mesh_config_model_sub_add(struct mesh_config *cfg, uint16_t addr,
 
 	jnode = cfg->jnode;
 
-	ele_idx = get_element_index(jnode, addr);
+	ele_idx = get_element_index(jnode, ele_addr);
 	if (ele_idx < 0)
 		return false;
 
@@ -1966,7 +1976,7 @@ bool mesh_config_model_sub_add(struct mesh_config *cfg, uint16_t addr,
 	return save_config(jnode, cfg->node_dir_path);
 }
 
-bool mesh_config_model_sub_del(struct mesh_config *cfg, uint16_t addr,
+bool mesh_config_model_sub_del(struct mesh_config *cfg, uint16_t ele_addr,
 						uint32_t mod_id, bool vendor,
 						struct mesh_config_sub *sub)
 {
@@ -1979,7 +1989,7 @@ bool mesh_config_model_sub_del(struct mesh_config *cfg, uint16_t addr,
 
 	jnode = cfg->jnode;
 
-	ele_idx = get_element_index(jnode, addr);
+	ele_idx = get_element_index(jnode, ele_addr);
 	if (ele_idx < 0)
 		return false;
 
diff --git a/mesh/mesh-config.h b/mesh/mesh-config.h
index cf1f8b299..a5b12bbad 100644
--- a/mesh/mesh-config.h
+++ b/mesh/mesh-config.h
@@ -104,6 +104,7 @@ struct mesh_config_node {
 	uint8_t dev_key[16];
 	uint8_t token[8];
 };
+
 typedef void (*mesh_config_status_func_t)(void *user_data, bool result);
 typedef bool (*mesh_config_node_func_t)(struct mesh_config_node *node,
 							const uint8_t uuid[16],
@@ -136,10 +137,10 @@ bool mesh_config_write_relay_mode(struct mesh_config *cfg, uint8_t mode,
 bool mesh_config_write_ttl(struct mesh_config *cfg, uint8_t ttl);
 bool mesh_config_write_mode(struct mesh_config *cfg, const char *keyword,
 								int value);
-bool mesh_config_model_binding_add(struct mesh_config *cfg, uint8_t ele_idx,
+bool mesh_config_model_binding_add(struct mesh_config *cfg, uint16_t ele_addr,
 						bool vendor, uint32_t mod_id,
 							uint16_t app_idx);
-bool mesh_config_model_binding_del(struct mesh_config *cfg, uint8_t ele_idx,
+bool mesh_config_model_binding_del(struct mesh_config *cfg, uint16_t ele_addr,
 						bool vendor, uint32_t mod_id,
 							uint16_t app_idx);
 bool mesh_config_model_pub_add(struct mesh_config *cfg, uint16_t ele_addr,
@@ -147,13 +148,13 @@ bool mesh_config_model_pub_add(struct mesh_config *cfg, uint16_t ele_addr,
 						struct mesh_config_pub *pub);
 bool mesh_config_model_pub_del(struct mesh_config *cfg, uint16_t ele_addr,
 						uint32_t mod_id, bool vendor);
-bool mesh_config_model_sub_add(struct mesh_config *cfg, uint16_t addr,
+bool mesh_config_model_sub_add(struct mesh_config *cfg, uint16_t ele_addr,
 						uint32_t mod_id, bool vendor,
 						struct mesh_config_sub *sub);
-bool mesh_config_model_sub_del(struct mesh_config *cfg, uint16_t addr,
+bool mesh_config_model_sub_del(struct mesh_config *cfg, uint16_t ele_addr,
 						uint32_t mod_id, bool vendor,
 						struct mesh_config_sub *sub);
-bool mesh_config_model_sub_del_all(struct mesh_config *cfg, uint16_t addr,
+bool mesh_config_model_sub_del_all(struct mesh_config *cfg, uint16_t ele_addr,
 						uint32_t mod_id, bool vendor);
 bool mesh_config_app_key_add(struct mesh_config *cfg, uint16_t net_idx,
 				uint16_t app_idx, const uint8_t key[16]);
diff --git a/mesh/model.c b/mesh/model.c
index a06b684a5..f4b856108 100644
--- a/mesh/model.c
+++ b/mesh/model.c
@@ -561,7 +561,6 @@ static int update_binding(struct mesh_node *node, uint16_t addr, uint32_t id,
 	int status;
 	struct mesh_model *mod;
 	bool is_present, is_vendor;
-	uint8_t ele_idx;
 
 	mod = find_model(node, addr, id, &status);
 	if (!mod) {
@@ -586,12 +585,10 @@ static int update_binding(struct mesh_node *node, uint16_t addr, uint32_t id,
 	if (is_present && !unbind)
 		return MESH_STATUS_SUCCESS;
 
-	ele_idx = (uint8_t) node_get_element_idx(node, addr);
-
 	if (unbind) {
 		model_unbind_idx(node, mod, app_idx);
 		if (!mesh_config_model_binding_del(node_config_get(node),
-					ele_idx, is_vendor, id, app_idx))
+					addr, is_vendor, id, app_idx))
 			return MESH_STATUS_STORAGE_FAIL;
 
 		return MESH_STATUS_SUCCESS;
@@ -601,7 +598,7 @@ static int update_binding(struct mesh_node *node, uint16_t addr, uint32_t id,
 		return MESH_STATUS_INSUFF_RESOURCES;
 
 	if (!mesh_config_model_binding_add(node_config_get(node),
-					ele_idx, is_vendor, id, app_idx))
+					addr, is_vendor, id, app_idx))
 		return MESH_STATUS_STORAGE_FAIL;
 
 	model_bind_idx(node, mod, app_idx);
-- 
2.21.0

