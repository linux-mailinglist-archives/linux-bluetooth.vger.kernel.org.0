Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3175620FC60
	for <lists+linux-bluetooth@lfdr.de>; Tue, 30 Jun 2020 21:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbgF3TAX (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 30 Jun 2020 15:00:23 -0400
Received: from mga05.intel.com ([192.55.52.43]:57132 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726192AbgF3TAX (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 30 Jun 2020 15:00:23 -0400
IronPort-SDR: Q92GSGEd+lGbTVnW66d1ocLLfAWShtrtYMQkcrvjL55qWavjsO33RxPQcYuY07ILb0v/JzsvXu
 3empO42KH4mA==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="231222956"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; 
   d="scan'208";a="231222956"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2020 11:56:21 -0700
IronPort-SDR: 1br6XPM+IpqVFw2ZfMmg0hJddXBgnLbc+949FSLPz0N4mvYkEgNIGcHEyQ3T1smqALn5ornL5q
 GhUT/KOqoSdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; 
   d="scan'208";a="355864256"
Received: from mlindstr-mobl1.amr.corp.intel.com (HELO ingas-nuc1.sea.intel.com) ([10.254.108.27])
  by orsmga001.jf.intel.com with ESMTP; 30 Jun 2020 11:56:20 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, michal.lowas-rzechonek@silvair.com,
        Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ v2 2/4] mesh: Check app model settings of pub/sub support
Date:   Tue, 30 Jun 2020 11:56:15 -0700
Message-Id: <20200630185617.14755-3-inga.stotland@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200630185617.14755-1-inga.stotland@intel.com>
References: <20200630185617.14755-1-inga.stotland@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This adds handling of new options dictionary included with
"Models" and "VendorModels" properties on org.bluez.mesh.Element1
interface.

Supported (optional) dictionary entries:
"Publish" - indicates whether the model supports publication mechanism.
                If not present, publication is enabled.
"Subscribe" - indicates whether the model supports subscription mechanism.
                If not present, subscriptions are enabled.

If a config message related to subscription state is received for a model
that does not support subscription mechanism, an error code 0x08,
("Not A Subscribe Model") is sent in response.

If a config message related to publication state is received for a model
that does not support publication mechanism, an error code 0x07
("Invalid Publish Parameters") is sent in response.
---
 mesh/mesh-config-json.c |  76 +++++++++++++++++-
 mesh/mesh-config.h      |   8 ++
 mesh/model.c            |  98 +++++++++++++++++++----
 mesh/model.h            |   6 ++
 mesh/node.c             | 168 ++++++++++++++++++++++++++++++++--------
 5 files changed, 309 insertions(+), 47 deletions(-)

diff --git a/mesh/mesh-config-json.c b/mesh/mesh-config-json.c
index 05b2a5651..661775f95 100644
--- a/mesh/mesh-config-json.c
+++ b/mesh/mesh-config-json.c
@@ -1096,6 +1096,16 @@ static bool parse_models(json_object *jmodels, struct mesh_config_element *ele)
 				goto fail;
 		}
 
+		if (json_object_object_get_ex(jmodel, "pubEnabled", &jvalue))
+			mod->pub_enabled = json_object_get_boolean(jvalue);
+		else
+			mod->pub_enabled = true;
+
+		if (json_object_object_get_ex(jmodel, "subEnabled", &jvalue))
+			mod->sub_enabled = json_object_get_boolean(jvalue);
+		else
+			mod->sub_enabled = true;
+
 		if (json_object_object_get_ex(jmodel, "publish", &jvalue)) {
 			mod->pub = parse_model_publication(jvalue);
 			if (!mod->pub)
@@ -1562,7 +1572,7 @@ bool mesh_config_write_iv_index(struct mesh_config *cfg, uint32_t idx,
 static void add_model(void *a, void *b)
 {
 	struct mesh_config_model *mod = a;
-	json_object *jmodels = b, *jmodel;
+	json_object *jmodels = b, *jmodel, *jval;
 
 	jmodel = json_object_new_object();
 	if (!jmodel)
@@ -1574,6 +1584,12 @@ static void add_model(void *a, void *b)
 	else
 		write_uint32_hex(jmodel, "modelId", mod->id);
 
+	jval = json_object_new_boolean(mod->sub_enabled);
+	json_object_object_add(jmodel, "subEnabled", jval);
+
+	jval = json_object_new_boolean(mod->pub_enabled);
+	json_object_object_add(jmodel, "pubEnabled", jval);
+
 	json_object_array_add(jmodels, jmodel);
 }
 
@@ -1974,6 +1990,64 @@ bool mesh_config_model_sub_del_all(struct mesh_config *cfg, uint16_t addr,
 	return save_config(cfg->jnode, cfg->node_dir_path);
 }
 
+bool mesh_config_model_pub_enable(struct mesh_config *cfg, uint16_t ele_addr,
+						uint32_t mod_id, bool vendor,
+						bool enable)
+{
+	json_object *jmodel, *jval;
+	int ele_idx;
+
+	if (!cfg)
+		return false;
+
+	ele_idx = get_element_index(cfg->jnode, ele_addr);
+	if (ele_idx < 0)
+		return false;
+
+	jmodel = get_element_model(cfg->jnode, ele_idx, mod_id, vendor);
+	if (!jmodel)
+		return false;
+
+	json_object_object_del(jmodel, "pubDisabled");
+
+	jval = json_object_new_boolean(!enable);
+	json_object_object_add(jmodel, "pubDisabled", jval);
+
+	if (!enable)
+		json_object_object_del(jmodel, "publish");
+
+	return save_config(cfg->jnode, cfg->node_dir_path);
+}
+
+bool mesh_config_model_sub_enable(struct mesh_config *cfg, uint16_t ele_addr,
+						uint32_t mod_id, bool vendor,
+						bool enable)
+{
+	json_object *jmodel, *jval;
+	int ele_idx;
+
+	if (!cfg)
+		return false;
+
+	ele_idx = get_element_index(cfg->jnode, ele_addr);
+	if (ele_idx < 0)
+		return false;
+
+	jmodel = get_element_model(cfg->jnode, ele_idx, mod_id, vendor);
+	if (!jmodel)
+		return false;
+
+	json_object_object_del(jmodel, "subEnabled");
+
+	jval = json_object_new_boolean(enable);
+	json_object_object_add(jmodel, "subEnabled", jval);
+
+	if (!enable)
+		json_object_object_del(jmodel, "subscribe");
+
+	return save_config(cfg->jnode, cfg->node_dir_path);
+}
+
 bool mesh_config_write_seq_number(struct mesh_config *cfg, uint32_t seq,
 								bool cache)
 {
diff --git a/mesh/mesh-config.h b/mesh/mesh-config.h
index 8ff7b63c7..9f30e693b 100644
--- a/mesh/mesh-config.h
+++ b/mesh/mesh-config.h
@@ -45,6 +45,8 @@ struct mesh_config_model {
 	uint16_t *bindings;
 	uint32_t id;
 	bool vendor;
+	bool sub_enabled;
+	bool pub_enabled;
 	uint32_t num_bindings;
 	uint32_t num_subs;
 };
@@ -156,6 +158,12 @@ bool mesh_config_model_sub_del(struct mesh_config *cfg, uint16_t ele_addr,
 						struct mesh_config_sub *sub);
 bool mesh_config_model_sub_del_all(struct mesh_config *cfg, uint16_t ele_addr,
 						uint32_t mod_id, bool vendor);
+bool mesh_config_model_pub_enable(struct mesh_config *cfg, uint16_t ele_addr,
+						uint32_t mod_id, bool vendor,
+						bool enable);
+bool mesh_config_model_sub_enable(struct mesh_config *cfg, uint16_t ele_addr,
+						uint32_t mod_id, bool vendor,
+						bool enable);
 bool mesh_config_app_key_add(struct mesh_config *cfg, uint16_t net_idx,
 				uint16_t app_idx, const uint8_t key[16]);
 bool mesh_config_app_key_update(struct mesh_config *cfg, uint16_t app_idx,
diff --git a/mesh/model.c b/mesh/model.c
index 5ed95afac..afac6ec69 100644
--- a/mesh/model.c
+++ b/mesh/model.c
@@ -51,6 +51,8 @@ struct mesh_model {
 	struct l_queue *subs;
 	struct l_queue *virtuals;
 	struct mesh_model_pub *pub;
+	bool sub_enabled;
+	bool pub_enabled;
 	uint32_t id;
 	uint8_t ele_idx;
 };
@@ -1097,7 +1099,7 @@ int mesh_model_pub_set(struct mesh_node *node, uint16_t addr, uint32_t id,
 	if (!mod)
 		return status;
 
-	if (id == CONFIG_SRV_MODEL || id == CONFIG_CLI_MODEL)
+	if (!mod->pub_enabled || (mod->cbs && !(mod->cbs->pub)))
 		return MESH_STATUS_INVALID_PUB_PARAM;
 
 	if (!appkey_have_key(node_get_net(node), idx))
@@ -1134,9 +1136,11 @@ int mesh_model_pub_set(struct mesh_node *node, uint16_t addr, uint32_t id,
 		/* External model */
 		config_update_model_pub_period(node, mod->ele_idx, id,
 						pub_period_to_ms(period));
-	else
+	else {
 		/* Internal model, call registered callbacks */
-		mod->cbs->pub(mod->pub);
+		if (mod->cbs->pub)
+			mod->cbs->pub(mod->pub);
+	}
 
 	return MESH_STATUS_SUCCESS;
 }
@@ -1150,6 +1154,11 @@ struct mesh_model_pub *mesh_model_pub_get(struct mesh_node *node, uint16_t addr,
 	if (!mod)
 		return NULL;
 
+	if (!mod->pub_enabled || (mod->cbs && !(mod->cbs->pub)))
+		*status = MESH_STATUS_INVALID_PUB_PARAM;
+	else
+		*status = MESH_STATUS_SUCCESS;
+
 	return mod->pub;
 }
 
@@ -1171,6 +1180,13 @@ struct mesh_model *mesh_model_new(uint8_t ele_idx, uint32_t id)
 	mod->id = id;
 	mod->ele_idx = ele_idx;
 	mod->virtuals = l_queue_new();
+
+	/*
+	 * Unless specifically indicated by an app, subscriptions and
+	 * publications are enabled by default
+	 */
+	mod->sub_enabled = true;
+	mod->pub_enabled = true;
 	return mod;
 }
 
@@ -1318,6 +1334,9 @@ int mesh_model_sub_get(struct mesh_node *node, uint16_t addr, uint32_t id,
 	if (!mod)
 		return status;
 
+	if (!mod->sub_enabled || (mod->cbs && !(mod->cbs->sub)))
+		return MESH_STATUS_NOT_SUB_MOD;
+
 	entry = l_queue_get_entries(mod->subs);
 	*size = 0;
 	n = 0;
@@ -1358,6 +1377,9 @@ int mesh_model_sub_add(struct mesh_node *node, uint16_t addr, uint32_t id,
 	if (!mod)
 		return status;
 
+	if (!mod->sub_enabled || (mod->cbs && !(mod->cbs->sub)))
+		return MESH_STATUS_NOT_SUB_MOD;
+
 	status = add_sub(node_get_net(node), mod, group, is_virt, dst);
 
 	if (status != MESH_STATUS_SUCCESS)
@@ -1381,6 +1403,9 @@ int mesh_model_sub_ovr(struct mesh_node *node, uint16_t addr, uint32_t id,
 	if (!mod)
 		return status;
 
+	if (!mod->sub_enabled || (mod->cbs && !(mod->cbs->sub)))
+		return MESH_STATUS_NOT_SUB_MOD;
+
 	subs = mod->subs;
 	virtuals = mod->virtuals;
 	mod->subs = l_queue_new();
@@ -1430,6 +1455,9 @@ int mesh_model_sub_del(struct mesh_node *node, uint16_t addr, uint32_t id,
 	if (!mod)
 		return status;
 
+	if (!mod->sub_enabled || (mod->cbs && !(mod->cbs->sub)))
+		return MESH_STATUS_NOT_SUB_MOD;
+
 	if (is_virt) {
 		struct mesh_virtual *virt;
 
@@ -1448,27 +1476,22 @@ int mesh_model_sub_del(struct mesh_node *node, uint16_t addr, uint32_t id,
 
 	*dst = grp;
 
-	if (l_queue_remove(mod->subs, L_UINT_TO_PTR(grp)))
+	if (l_queue_remove(mod->subs, L_UINT_TO_PTR(grp))) {
 		mesh_net_dst_unreg(node_get_net(node), grp);
 
-	if (!mod->cbs)
-		/* External models */
-		config_update_model_subscriptions(node, mod);
+		if (!mod->cbs)
+			/* External models */
+			config_update_model_subscriptions(node, mod);
+	}
 
 	return MESH_STATUS_SUCCESS;
 }
 
-int mesh_model_sub_del_all(struct mesh_node *node, uint16_t addr, uint32_t id)
+static void remove_subs(struct mesh_node *node, struct mesh_model *mod)
 {
-	int status;
-	struct mesh_model *mod;
 	const struct l_queue_entry *entry;
 	struct mesh_net *net = node_get_net(node);
 
-	mod = find_model(node, addr, id, &status);
-	if (!mod)
-		return status;
-
 	entry = l_queue_get_entries(mod->subs);
 
 	for (; entry; entry = entry->next)
@@ -1476,6 +1499,21 @@ int mesh_model_sub_del_all(struct mesh_node *node, uint16_t addr, uint32_t id)
 
 	l_queue_clear(mod->subs, NULL);
 	l_queue_clear(mod->virtuals, unref_virt);
+}
+
+int mesh_model_sub_del_all(struct mesh_node *node, uint16_t addr, uint32_t id)
+{
+	int status;
+	struct mesh_model *mod;
+
+	mod = find_model(node, addr, id, &status);
+	if (!mod)
+		return status;
+
+	if (!mod->sub_enabled || (mod->cbs && !(mod->cbs->sub)))
+		return MESH_STATUS_NOT_SUB_MOD;
+
+	remove_subs(node, mod);
 
 	if (!mod->cbs)
 		/* External models */
@@ -1677,6 +1715,38 @@ void model_build_config(void *model, void *msg_builder)
 	l_dbus_message_builder_leave_struct(builder);
 }
 
+void mesh_model_enable_pub(struct mesh_model *mod, bool enable)
+{
+	mod->pub_enabled = enable;
+
+	if (!mod->pub_enabled && mod->pub) {
+		if (mod->pub->virt)
+			unref_virt(mod->pub->virt);
+
+		l_free(mod->pub);
+		mod->pub = NULL;
+	}
+}
+
+bool mesh_model_is_pub_enabled(struct mesh_model *mod)
+{
+	return mod->pub_enabled;
+}
+
+void mesh_model_enable_sub(struct mesh_node *node, struct mesh_model *mod,
+								bool enable)
+{
+	mod->sub_enabled = enable;
+
+	if (!mod->sub_enabled)
+		remove_subs(node, mod);
+}
+
+bool mesh_model_is_sub_enabled(struct mesh_model *mod)
+{
+	return mod->sub_enabled;
+}
+
 void mesh_model_init(void)
 {
 	mesh_virtuals = l_queue_new();
diff --git a/mesh/model.h b/mesh/model.h
index f8e0f9d37..f717fb00c 100644
--- a/mesh/model.h
+++ b/mesh/model.h
@@ -112,5 +112,11 @@ bool mesh_model_opcode_get(const uint8_t *buf, uint16_t size, uint32_t *opcode,
 								uint16_t *n);
 void model_build_config(void *model, void *msg_builder);
 
+void mesh_model_enable_pub(struct mesh_model *mod, bool enable);
+bool mesh_model_is_pub_enabled(struct mesh_model *mod);
+void mesh_model_enable_sub(struct mesh_node *node, struct mesh_model *mod,
+								bool enable);
+bool mesh_model_is_sub_enabled(struct mesh_model *mod);
+
 void mesh_model_init(void);
 void mesh_model_cleanup(void);
diff --git a/mesh/node.c b/mesh/node.c
index ee6d1833f..9f0f15070 100644
--- a/mesh/node.c
+++ b/mesh/node.c
@@ -386,6 +386,12 @@ static bool add_models_from_storage(struct mesh_node *node,
 		if (!mod)
 			return false;
 
+		if (!db_mod->pub_enabled)
+			mesh_model_enable_pub(mod, false);
+
+		if (!db_mod->sub_enabled)
+			mesh_model_enable_sub(node, mod, false);
+
 		l_queue_insert(ele->models, mod, compare_model_id, NULL);
 	}
 
@@ -1041,65 +1047,99 @@ static void app_disc_cb(struct l_dbus *bus, void *user_data)
 	free_node_dbus_resources(node);
 }
 
-static bool get_sig_models_from_properties(struct node_element *ele,
+static bool get_model_options(struct mesh_node *node, struct mesh_model *mod,
+					struct l_dbus_message_iter *opts)
+{
+	const char *key;
+	struct l_dbus_message_iter var;
+	bool opt;
+
+	while (l_dbus_message_iter_next_entry(opts, &key, &var)) {
+
+		if (!strcmp(key, "Publish")) {
+			if (!l_dbus_message_iter_get_variant(&var, "b", &opt))
+				return false;
+			mesh_model_enable_pub(mod, opt);
+		} else if (!strcmp(key, "Subscribe")) {
+			if (!l_dbus_message_iter_get_variant(&var, "b", &opt))
+				return false;
+			mesh_model_enable_sub(node, mod, opt);
+		} else
+			return false;
+	}
+
+	return true;
+}
+
+static bool generate_model(struct mesh_node *node, struct node_element *ele,
+				uint32_t id, struct l_dbus_message_iter *opts)
+{
+	struct mesh_model *mod;
+
+	/* Disallow duplicates */
+	if (l_queue_find(ele->models, match_model_id,
+			 L_UINT_TO_PTR(id)))
+		return false;
+
+	mod = mesh_model_new(ele->idx, id);
+
+	if (!get_model_options(node, mod, opts)) {
+		l_free(mod);
+		return false;
+	}
+
+	l_queue_insert(ele->models, mod, compare_model_id, NULL);
+
+	return true;
+}
+
+static bool get_sig_models_from_properties(struct mesh_node *node,
+					struct node_element *ele,
 					struct l_dbus_message_iter *property)
 {
-	struct l_dbus_message_iter ids;
-	uint16_t mod_id;
+	struct l_dbus_message_iter mods, var;
+	uint16_t m_id;
 
 	if (!ele->models)
 		ele->models = l_queue_new();
 
-	if (!l_dbus_message_iter_get_variant(property, "aq", &ids))
+	if (!l_dbus_message_iter_get_variant(property, "a(qa{sv})", &mods))
 		return false;
 
 	/* Bluetooth SIG defined models */
-	while (l_dbus_message_iter_next_entry(&ids, &mod_id)) {
-		struct mesh_model *mod;
-		uint32_t id = mod_id | VENDOR_ID_MASK;
+	while (l_dbus_message_iter_next_entry(&mods, &m_id, &var)) {
+		uint32_t id = m_id | VENDOR_ID_MASK;
 
 		/* Allow Config Server Model only on the primary element */
 		if (ele->idx != PRIMARY_ELE_IDX && id == CONFIG_SRV_MODEL)
 			return false;
 
-		/* Disallow duplicates */
-		if (l_queue_find(ele->models, match_model_id,
-						L_UINT_TO_PTR(id)))
+		if (!generate_model(node, ele, id, &var))
 			return false;
-
-		mod = mesh_model_new(ele->idx, id);
-
-		l_queue_insert(ele->models, mod, compare_model_id, NULL);
 	}
 
 	return true;
 }
 
-static bool get_vendor_models_from_properties(struct node_element *ele,
+static bool get_vendor_models_from_properties(struct mesh_node *node,
+					struct node_element *ele,
 					struct l_dbus_message_iter *property)
 {
-	struct l_dbus_message_iter ids;
-	uint16_t mod_id, vendor_id;
+	struct l_dbus_message_iter mods, var;
+	uint16_t m_id, v_id;
 
 	if (!ele->models)
 		ele->models = l_queue_new();
 
-	if (!l_dbus_message_iter_get_variant(property, "a(qq)", &ids))
+	if (!l_dbus_message_iter_get_variant(property, "a(qqa{sv})", &mods))
 		return false;
 
 	/* Vendor defined models */
-	while (l_dbus_message_iter_next_entry(&ids, &vendor_id, &mod_id)) {
-		struct mesh_model *mod;
-		uint32_t id = mod_id | (vendor_id << 16);
+	while (l_dbus_message_iter_next_entry(&mods, &v_id, &m_id, &var)) {
+		uint32_t id = m_id | (v_id << 16);
 
-		/* Disallow duplicates */
-		if (l_queue_find(ele->models, match_model_id,
-							L_UINT_TO_PTR(id)))
+		if (!generate_model(node, ele, id, &var))
 			return false;
-
-		mod = mesh_model_new(ele->idx, id);
-
-		l_queue_insert(ele->models, mod, compare_model_id, NULL);
 	}
 
 	return true;
@@ -1130,14 +1170,19 @@ static bool get_element_properties(struct mesh_node *node, const char *path,
 
 		} else if (!strcmp(key, "Models")) {
 
-			if (mods || !get_sig_models_from_properties(ele, &var))
+			if (mods)
+				goto fail;
+
+			if (!get_sig_models_from_properties(node, ele, &var))
 				goto fail;
 
 			mods = true;
 		} else if (!strcmp(key, "VendorModels")) {
 
-			if (vendor_mods ||
-				!get_vendor_models_from_properties(ele, &var))
+			if (vendor_mods)
+				goto fail;
+
+			if (!get_vendor_models_from_properties(node, ele, &var))
 				goto fail;
 
 			vendor_mods = true;
@@ -1225,7 +1270,8 @@ static void convert_node_to_storage(struct mesh_node *node,
 			db_mod->id = mod_id;
 			db_mod->vendor = ((mod_id & VENDOR_ID_MASK)
 							!= VENDOR_ID_MASK);
-
+			db_mod->pub_enabled = mesh_model_is_pub_enabled(mod);
+			db_mod->sub_enabled = mesh_model_is_sub_enabled(mod);
 			l_queue_push_tail(db_ele->models, db_mod);
 		}
 		l_queue_push_tail(db_node->elements, db_ele);
@@ -1381,6 +1427,63 @@ static void update_composition(struct mesh_node *node, struct mesh_node *attach)
 	attach->comp = node->comp;
 }
 
+static void update_model_options(struct mesh_node *node,
+						struct mesh_node *attach)
+{
+	uint32_t len, i;
+	struct node_element *ele, *ele_attach;
+
+	len = l_queue_length(node->elements);
+
+	for (i = 0; i < len; i++) {
+		const struct l_queue_entry *entry;
+
+		ele = l_queue_find(node->elements, match_element_idx,
+							L_UINT_TO_PTR(i));
+		ele_attach = l_queue_find(attach->elements, match_element_idx,
+							L_UINT_TO_PTR(i));
+		if (!ele || !ele_attach)
+			continue;
+
+		entry = l_queue_get_entries(ele->models);
+
+		for (; entry; entry = entry->next) {
+			struct mesh_model *mod, *updated_mod = entry->data;
+			uint32_t id = mesh_model_get_model_id(updated_mod);
+			bool opt, updated_opt;
+			bool vendor = id < VENDOR_ID_MASK;
+
+			mod = l_queue_find(ele_attach->models, match_model_id,
+							L_UINT_TO_PTR(id));
+			if (!mod)
+				continue;
+
+			if (!vendor)
+				id &= ~VENDOR_ID_MASK;
+
+			opt = mesh_model_is_pub_enabled(mod);
+			updated_opt = mesh_model_is_pub_enabled(updated_mod);
+
+			if (updated_opt != opt) {
+				mesh_model_enable_pub(mod, updated_opt);
+				mesh_config_model_pub_enable(attach->cfg,
+							attach->primary + i, id,
+							vendor, updated_opt);
+			}
+
+			opt = mesh_model_is_sub_enabled(mod);
+			updated_opt = mesh_model_is_sub_enabled(updated_mod);
+
+			if (updated_opt != opt) {
+				mesh_model_enable_sub(node, mod, updated_opt);
+				mesh_config_model_sub_enable(attach->cfg,
+							attach->primary + i, id,
+							vendor, updated_opt);
+			}
+		}
+	}
+}
+
 static bool check_req_node(struct managed_obj_request *req)
 {
 	uint8_t node_comp[MAX_MSG_LEN - 2];
@@ -1452,6 +1555,7 @@ static bool attach_req_node(struct mesh_node *attach, struct mesh_node *node)
 	node->owner = NULL;
 
 	update_composition(node, attach);
+	update_model_options(node, attach);
 
 	node_remove(node);
 
-- 
2.26.2

