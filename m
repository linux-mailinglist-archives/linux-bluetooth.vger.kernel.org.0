Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B561B75DD6
	for <lists+linux-bluetooth@lfdr.de>; Fri, 26 Jul 2019 06:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfGZEau (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 26 Jul 2019 00:30:50 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37731 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726108AbfGZEau (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 26 Jul 2019 00:30:50 -0400
Received: by mail-lf1-f68.google.com with SMTP id c9so36063384lfh.4
        for <linux-bluetooth@vger.kernel.org>; Thu, 25 Jul 2019 21:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=silvair-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NCRm1BpQjNtPjpiIkW58elwy++CG9RQuSZwLth6jubU=;
        b=rUif0vZAOSKI/tv0Z9MZddWFUEQaNFEqCYUDQdrRDfDtPSGETv+zb04sXAQkhFSrL7
         EJUOfW8tFCh0nit138wIFBPeYu/mvNlTBKjkKZKt28ZHPj/S23WBK45ymsHU3Jpl5L/G
         DnwXpxp047tASx/gH8SRpvDwsZHLCjWaXc9JLYCcuabTE+WFD+j6YCw6IQZPBx8RcW9Q
         JWTuHBayqhnZhmh5aVkqNOfeD4S1s6IgRatr/gWPJi0p7I43HgxceI1tq0bdtWW20WTH
         Lj8l+FoMcLbH79e7FAV1gCIktwz43MXaSZ9uLxywU//z9+X+9Z0uZCYB4L3uuR01u1Vx
         DdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NCRm1BpQjNtPjpiIkW58elwy++CG9RQuSZwLth6jubU=;
        b=JydQgXgVWdOzfVqKCCvAGoBdgg4ho/A4wn1ncN3BJDPu3Sd7CdknTbYNdBV8RBO1uT
         +OuMRsHnPX4/ZDn3lPDOgfzIczWGeRWrBgDjPoCD1KL3t5aoy1mX18vDLGQw9H0kVibz
         bn9VvMGxbw+F0fRvsSH6wBCOb92UmzW9wY7qHwNj0RExVyKjYBV4sJ52KiJsu4+IKkY2
         lZDGNg9/aYDv1VhNk83R23okbn2i+149qCTL9CfGVUSSO9cbZWBbk6YuT8NaDjiKvmel
         0pajaxgmumS7F7w46/OwFfDCQeG0oRHEX31ralqjagsIuh+cinl5uwytGPjIQBOJOMLf
         /RBg==
X-Gm-Message-State: APjAAAV075Wro7ZhQxcERmptN8l8nUf8+jG9ZyBuzF+upbz6OCD3CuMi
        1rHw0eg2pPCAJXGhL+hwBCJotvSEF1o=
X-Google-Smtp-Source: APXvYqwRkzQ/6kjZj9pxN8RMGD1vxvVSdrSQuCrReJK00ZrOtIUopbupkWOpwR/LZ8wcZbEIz8CviA==
X-Received: by 2002:ac2:4a78:: with SMTP id q24mr1117216lfp.59.1564115446193;
        Thu, 25 Jul 2019 21:30:46 -0700 (PDT)
Received: from kynes.internet.domowy (apn-95-40-32-72.dynamic.gprs.plus.pl. [95.40.32.72])
        by smtp.gmail.com with ESMTPSA id g5sm9792735ljj.69.2019.07.25.21.30.44
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2019 21:30:45 -0700 (PDT)
From:   =?UTF-8?q?Micha=C5=82=20Lowas-Rzechonek?= 
        <michal.lowas-rzechonek@silvair.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v5 2/5] mesh: Validate application by comparing composition data
Date:   Fri, 26 Jul 2019 06:30:32 +0200
Message-Id: <20190726043035.9417-3-michal.lowas-rzechonek@silvair.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190726043035.9417-1-michal.lowas-rzechonek@silvair.com>
References: <20190726043035.9417-1-michal.lowas-rzechonek@silvair.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Instead of validating application by enumerating D-Bus objects, create a
temporary node instance and check if composition data generated for the
temporary matches the node loaded from storage.

This allows node validation logic (primary element, mandatory models etc)
to be confined in node_generate_comp() function.

This also streamlines code implementing Attach(), Join() and
CreateNetwork() calls.
---
 mesh/mesh-defs.h |   2 +
 mesh/node.c      | 433 +++++++++++++++++++++--------------------------
 2 files changed, 196 insertions(+), 239 deletions(-)

diff --git a/mesh/mesh-defs.h b/mesh/mesh-defs.h
index 82be91d75..d14aa5af3 100644
--- a/mesh/mesh-defs.h
+++ b/mesh/mesh-defs.h
@@ -79,6 +79,8 @@
 #define MAX_MODEL_COUNT		0xff
 #define MAX_ELE_COUNT		0xff
 
+#define MAX_MSG_LEN 380
+
 #define IS_UNASSIGNED(x)	((x) == UNASSIGNED_ADDRESS)
 #define IS_UNICAST(x)		(((x) > UNASSIGNED_ADDRESS) && \
 					((x) < VIRTUAL_ADDRESS_LOW))
diff --git a/mesh/node.c b/mesh/node.c
index e51913edf..52ed74ab4 100644
--- a/mesh/node.c
+++ b/mesh/node.c
@@ -112,16 +112,16 @@ struct mesh_node {
 };
 
 struct managed_obj_request {
-	union {
-		const uint8_t *uuid;
-		struct mesh_node *node;
-	};
+	struct mesh_node *node;
 	union {
 		node_ready_func_t ready_cb;
 		node_join_ready_func_t join_ready_cb;
 	};
 	struct l_dbus_message *pending_msg;
 	enum request_type type;
+	union {
+		struct mesh_node *attach;
+	};
 };
 
 static struct l_queue *nodes;
@@ -160,14 +160,6 @@ static bool match_element_idx(const void *a, const void *b)
 	return (element->idx == index);
 }
 
-static bool match_model_id(const void *a, const void *b)
-{
-	const struct mesh_model *mod = a;
-	uint32_t mod_id = L_PTR_TO_UINT(b);
-
-	return mod_id == mesh_model_get_model_id(mod);
-}
-
 static bool match_element_path(const void *a, const void *b)
 {
 	const struct node_element *element = a;
@@ -212,11 +204,6 @@ static struct mesh_node *node_new(const uint8_t uuid[16])
 	node->net = mesh_net_new(node);
 	memcpy(node->uuid, uuid, sizeof(node->uuid));
 
-	if (!nodes)
-		nodes = l_queue_new();
-
-	l_queue_push_tail(nodes, node);
-
 	return node;
 }
 
@@ -412,6 +399,11 @@ static bool init_from_storage(struct mesh_config_node *db_node,
 
 	struct mesh_node *node = node_new(uuid);
 
+	if (!nodes)
+		nodes = l_queue_new();
+
+	l_queue_push_tail(nodes, node);
+
 	node->comp = l_new(struct node_composition, 1);
 	node->comp->cid = db_node->cid;
 	node->comp->pid = db_node->pid;
@@ -436,7 +428,7 @@ static bool init_from_storage(struct mesh_config_node *db_node,
 	memcpy(node->token, db_node->token, 8);
 
 	num_ele = l_queue_length(db_node->elements);
-	if (num_ele > 0xff)
+	if (num_ele > MAX_ELE_COUNT)
 		goto fail;
 
 	node->num_ele = num_ele;
@@ -1140,58 +1132,6 @@ static void app_disc_cb(struct l_dbus *bus, void *user_data)
 	free_node_dbus_resources(node);
 }
 
-static bool validate_model_property(struct node_element *ele,
-					struct l_dbus_message_iter *property,
-					uint8_t *num_models, bool vendor)
-{
-	struct l_dbus_message_iter ids;
-	uint16_t mod_id, vendor_id;
-	uint8_t count;
-	const char *signature = !vendor ? "aq" : "a(qq)";
-
-	if (!l_dbus_message_iter_get_variant(property, signature, &ids)) {
-		/* Allow empty elements */
-		if (l_queue_length(ele->models) == 0) {
-			*num_models = 0;
-			return true;
-		} else
-			return false;
-	}
-
-	count = 0;
-	if (!vendor) {
-		/* Bluetooth SIG defined models */
-		while (l_dbus_message_iter_next_entry(&ids, &mod_id)) {
-			struct mesh_model *mod;
-
-			/* Skip internally implemented models */
-			if ((VENDOR_ID_MASK | mod_id) == CONFIG_SRV_MODEL)
-				continue;
-
-			mod = l_queue_find(ele->models, match_model_id,
-					L_UINT_TO_PTR(VENDOR_ID_MASK | mod_id));
-			if (!mod)
-				return false;
-			count++;
-		}
-	} else {
-		/* Vendor defined models */
-		while (l_dbus_message_iter_next_entry(&ids, &vendor_id,
-								&mod_id)) {
-			struct mesh_model *mod;
-
-			mod = l_queue_find(ele->models, match_model_id,
-				L_UINT_TO_PTR((vendor_id << 16) | mod_id));
-			if (!mod)
-				return false;
-			count++;
-		}
-	}
-
-	*num_models = count;
-	return true;
-}
-
 static void get_models_from_properties(struct node_element *ele,
 					struct l_dbus_message_iter *property,
 								bool vendor)
@@ -1231,94 +1171,60 @@ static void get_models_from_properties(struct node_element *ele,
 }
 
 static bool get_element_properties(struct mesh_node *node, const char *path,
-					struct l_dbus_message_iter *properties,
-								bool is_new)
+					struct l_dbus_message_iter *properties)
 {
-	struct node_element *ele;
+	struct node_element *ele = l_new(struct node_element, 1);
 	const char *key;
 	struct l_dbus_message_iter var;
-	bool have_index = false;
-	uint8_t idx, mod_cnt, vendor_cnt;
+	bool idx = false;
+	bool mods = false;
+	bool vendor_mods = false;
 
 	l_debug("path %s", path);
 
+	ele->location = DEFAULT_LOCATION;
+
 	while (l_dbus_message_iter_next_entry(properties, &key, &var)) {
-		if (!strcmp(key, "Index")) {
-			if (!l_dbus_message_iter_get_variant(&var, "y", &idx))
-				return false;
-			have_index = true;
-			break;
+		if (!idx && !strcmp(key, "Index")) {
+			if (!l_dbus_message_iter_get_variant(&var, "y",
+								&ele->idx))
+				goto fail;
+			idx = true;
+			continue;
 		}
-	}
-
-	if (!have_index) {
-		l_debug("Mandatory property \"Index\" not found");
-		return false;
-	}
 
-	if (!is_new) {
-		/* Validate composition: check the element index */
-		ele = l_queue_find(node->elements, match_element_idx,
-							L_UINT_TO_PTR(idx));
-		if (!ele) {
-			l_debug("Element with index %u not found", idx);
-			return false;
+		if (!mods && !strcmp(key, "Models")) {
+			get_models_from_properties(ele, &var, false);
+			mods = true;
+			continue;
 		}
-	} else {
-		ele = l_new(struct node_element, 1);
-		ele->location = DEFAULT_LOCATION;
-		ele->idx = idx;
-	}
 
-	mod_cnt = 0;
-	vendor_cnt = 0;
+		if (!vendor_mods && !strcmp(key, "VendorModels")) {
+			get_models_from_properties(ele, &var, true);
+			vendor_mods = true;
+			continue;
+		}
 
-	while (l_dbus_message_iter_next_entry(properties, &key, &var)) {
 		if (!strcmp(key, "Location")) {
-			uint16_t loc;
-
-			l_dbus_message_iter_get_variant(&var, "q", &loc);
-
-			/* Validate composition: location match */
-			if (!is_new && (ele->location != loc))
-				return false;
-
-			ele->location = loc;
-
-		} else if (!strcmp(key, "Models")) {
-
-			if (is_new)
-				get_models_from_properties(ele, &var, false);
-			else if (!validate_model_property(ele, &var, &mod_cnt,
-									false))
-				return false;
-
-		} else if (!strcmp(key, "VendorModels")) {
-
-			if (is_new)
-				get_models_from_properties(ele, &var, true);
-			else if (!validate_model_property(ele, &var,
-							&vendor_cnt, true))
-				return false;
-
+			if (!l_dbus_message_iter_get_variant(&var, "q",
+							&ele->location))
+				goto fail;
+			continue;
 		}
 	}
 
-	if (is_new) {
-		l_queue_push_tail(node->elements, ele);
-	} else {
-		/* Account for internal Configuration Server model */
-		if (idx == 0)
-			mod_cnt += 1;
+	if (!idx || !mods || !vendor_mods)
+		goto fail;
 
-		/* Validate composition: number of models must match */
-		if (l_queue_length(ele->models) != (mod_cnt + vendor_cnt))
-			return false;
+	l_queue_push_tail(node->elements, ele);
 
-		ele->path = l_strdup(path);
-	}
+	ele->path = l_strdup(path);
 
 	return true;
+fail:
+	l_free(ele);
+
+	return false;
 }
 
 static void convert_node_to_storage(struct mesh_node *node,
@@ -1415,65 +1321,61 @@ static void set_defaults(struct mesh_node *node)
 }
 
 static bool get_app_properties(struct mesh_node *node, const char *path,
-					struct l_dbus_message_iter *properties,
-								bool is_new)
+					struct l_dbus_message_iter *properties)
 {
 	const char *key;
 	struct l_dbus_message_iter variant;
-	uint16_t value;
+	bool cid = false;
+	bool pid = false;
+	bool vid = false;
 
 	l_debug("path %s", path);
 
-	if (is_new) {
-		node->comp = l_new(struct node_composition, 1);
-		node->comp->crpl = DEFAULT_CRPL;
-	}
+	node->comp = l_new(struct node_composition, 1);
+	node->comp->crpl = DEFAULT_CRPL;
 
 	while (l_dbus_message_iter_next_entry(properties, &key, &variant)) {
-
-		if (!strcmp(key, "CompanyID")) {
+		if (!cid && !strcmp(key, "CompanyID")) {
 			if (!l_dbus_message_iter_get_variant(&variant, "q",
-									&value))
-				return false;
-
-			if (!is_new && node->comp->cid != value)
-				return false;
-
-			node->comp->cid = value;
+							&node->comp->cid))
+				goto fail;
+			cid = true;
+			continue;
+		}
 
-		} else if (!strcmp(key, "ProductID")) {
+		if (!pid && !strcmp(key, "ProductID")) {
 			if (!l_dbus_message_iter_get_variant(&variant, "q",
-									&value))
-				return false;
-
-			if (!is_new && node->comp->pid != value)
-				return false;
-
-			node->comp->pid = value;
+							&node->comp->pid))
+				goto fail;
+			pid = true;
+			continue;
+		}
 
-		} else if (!strcmp(key, "VersionID")) {
+		if (!vid && !strcmp(key, "VersionID")) {
 			if (!l_dbus_message_iter_get_variant(&variant, "q",
-									&value))
+							&node->comp->vid))
 				return false;
+			vid = true;
+			continue;
+		}
 
-			if (!is_new && node->comp->vid != value)
-				return false;
-
-			node->comp->vid = value;
-
-		} else if (!strcmp(key, "CRPL")) {
+		if (!strcmp(key, "CRPL")) {
 			if (!l_dbus_message_iter_get_variant(&variant, "q",
-									&value))
-				return false;
-
-			if (!is_new && node->comp->crpl != value)
-				return false;
-
-			node->comp->crpl = value;
+							&node->comp->crpl))
+				goto fail;
+			continue;
 		}
 	}
 
+	if (!cid || !pid || !vid)
+		goto fail;
+
 	return true;
+fail:
+	l_free(node->comp);
+	node->comp = NULL;
+
+	return false;
 }
 
 static bool add_local_node(struct mesh_node *node, uint16_t unicast, bool kr,
@@ -1552,18 +1454,82 @@ static bool init_storage_dir(struct mesh_node *node)
 	return true;
 }
 
+static bool check_req_node(struct managed_obj_request *req)
+{
+	uint8_t node_comp[MAX_MSG_LEN - 2];
+	uint8_t attach_comp[MAX_MSG_LEN - 2];
+
+	uint16_t node_len = node_generate_comp(req->node, node_comp,
+							sizeof(node_comp));
+
+	if (!node_len)
+		return false;
+
+	if (req->type == REQUEST_TYPE_ATTACH) {
+		uint16_t attach_len = node_generate_comp(req->attach,
+					attach_comp, sizeof(attach_comp));
+
+		if (node_len != attach_len ||
+				memcmp(node_comp, attach_comp, node_len)) {
+			l_debug("Failed to verify app's composition data");
+			return false;
+		}
+	}
+
+	return true;
+}
+
+static struct mesh_node *attach_req_node(struct mesh_node *attach,
+							struct mesh_node *node)
+{
+	const struct l_queue_entry *attach_entry;
+	const struct l_queue_entry *node_entry;
+
+	attach_entry = l_queue_get_entries(attach->elements);
+	node_entry = l_queue_get_entries(node->elements);
+
+	/*
+	 * Update existing node with paths collected in temporary node,
+	 * then remove the temporary.
+	 */
+	while (attach_entry && node_entry)
+	{
+		struct node_element *attach_ele = attach_entry->data;
+		struct node_element *node_ele = node_entry->data;
+
+		attach_ele->path = node_ele->path;
+		node_ele->path = NULL;
+
+		attach_entry = attach_entry->next;
+		node_entry = node_entry->next;
+	}
+
+	mesh_agent_remove(attach->agent);
+	attach->agent = node->agent;
+	node->agent = NULL;
+
+	attach->provisioner = node->provisioner;
+
+	attach->app_path = node->app_path;
+	node->app_path = NULL;
+
+	attach->owner = node->owner;
+	node->owner = NULL;
+
+	node_remove(node);
+
+	return attach;
+}
+
 static void get_managed_objects_cb(struct l_dbus_message *msg, void *user_data)
 {
 	struct l_dbus_message_iter objects, interfaces;
 	struct managed_obj_request *req = user_data;
 	const char *path;
-	struct mesh_node *node = NULL;
+	struct mesh_node *node = req->node;
 	void *agent = NULL;
 	bool have_app = false;
-	bool is_new;
-	uint8_t num_ele;
-
-	is_new = (req->type != REQUEST_TYPE_ATTACH);
+	unsigned int num_ele;
 
 	if (l_dbus_message_is_error(msg)) {
 		l_error("Failed to get app's dbus objects");
@@ -1575,14 +1541,8 @@ static void get_managed_objects_cb(struct l_dbus_message *msg, void *user_data)
 		goto fail;
 	}
 
-	if (is_new) {
-		node = l_new(struct mesh_node, 1);
+	if (!node->elements)
 		node->elements = l_queue_new();
-	} else {
-		node = req->node;
-	}
-
-	num_ele = 0;
 
 	while (l_dbus_message_iter_next_entry(&objects, &path, &interfaces)) {
 		struct l_dbus_message_iter properties;
@@ -1593,21 +1553,14 @@ static void get_managed_objects_cb(struct l_dbus_message *msg, void *user_data)
 			bool res;
 
 			if (!strcmp(MESH_ELEMENT_INTERFACE, interface)) {
-
-				if (num_ele == MAX_ELE_COUNT)
-					goto fail;
-
 				res = get_element_properties(node, path,
-							&properties, is_new);
+								&properties);
 				if (!res)
 					goto fail;
-
-				num_ele++;
-
 			} else if (!strcmp(MESH_APPLICATION_INTERFACE,
 								interface)) {
 				res = get_app_properties(node, path,
-							&properties, is_new);
+								&properties);
 				if (!res)
 					goto fail;
 
@@ -1637,7 +1590,7 @@ static void get_managed_objects_cb(struct l_dbus_message *msg, void *user_data)
 		goto fail;
 	}
 
-	if (num_ele == 0) {
+	if (l_queue_isempty(node->elements)) {
 		l_error("Interface %s not found", MESH_ELEMENT_INTERFACE);
 		goto fail;
 	}
@@ -1649,17 +1602,23 @@ static void get_managed_objects_cb(struct l_dbus_message *msg, void *user_data)
 		goto fail;
 	}
 
+	set_defaults(node);
+	num_ele = l_queue_length(node->elements);
+
+	if (num_ele > MAX_ELE_COUNT)
+		goto fail;
+
+	node->num_ele = num_ele;
+
+	if (!check_req_node(req))
+		goto fail;
+
 	if (req->type == REQUEST_TYPE_ATTACH) {
-		if (num_ele != node->num_ele)
-			goto fail;
+		struct l_dbus *bus = dbus_get_bus();
 
-		if (register_node_object(node)) {
-			struct l_dbus *bus = dbus_get_bus();
+		node = attach_req_node(req->attach, node);
 
-			node->disc_watch = l_dbus_add_disconnect_watch(bus,
-					node->owner, app_disc_cb, node, NULL);
-			req->ready_cb(req->pending_msg, MESH_ERROR_NONE, node);
-		} else
+		if (!register_node_object(node))
 			goto fail;
 
 		/*
@@ -1670,30 +1629,24 @@ static void get_managed_objects_cb(struct l_dbus_message *msg, void *user_data)
 		 */
 		init_storage_dir(node);
 
+		node->disc_watch = l_dbus_add_disconnect_watch(bus,
+				node->owner, app_disc_cb, node, NULL);
+
 	} else if (req->type == REQUEST_TYPE_JOIN) {
-		if (!agent) {
+		if (!node->agent) {
 			l_error("Interface %s not found",
 						MESH_PROVISION_AGENT_INTERFACE);
 			goto fail;
 		}
 
-		node->num_ele = num_ele;
-		set_defaults(node);
-		memcpy(node->uuid, req->uuid, 16);
-
 		if (!create_node_config(node, node->uuid))
 			goto fail;
 
-		req->join_ready_cb(node, agent);
 	} else {
 		/* Callback for create node request */
 		struct keyring_net_key net_key;
 		uint8_t dev_key[16];
 
-		node->num_ele = num_ele;
-		set_defaults(node);
-		memcpy(node->uuid, req->uuid, 16);
-
 		if (!create_node_config(node, node->uuid))
 			goto fail;
 
@@ -1713,35 +1666,32 @@ static void get_managed_objects_cb(struct l_dbus_message *msg, void *user_data)
 		init_storage_dir(node);
 
 		if (!keyring_put_remote_dev_key(node, DEFAULT_NEW_UNICAST,
-							num_ele, dev_key))
+						node->num_ele, dev_key))
 			goto fail;
 
 		if (!keyring_put_net_key(node, PRIMARY_NET_IDX, &net_key))
 			goto fail;
 
-		req->ready_cb(req->pending_msg, MESH_ERROR_NONE, node);
 	}
 
+	if (req->type == REQUEST_TYPE_JOIN)
+		req->join_ready_cb(node, node->agent);
+	else
+		req->ready_cb(req->pending_msg, MESH_ERROR_NONE, node);
+
 	return;
 fail:
 	if (agent)
 		mesh_agent_remove(agent);
 
-	if (!is_new) {
-		free_node_dbus_resources(node);
+	/* Handle failed requests */
+	if (node)
+		node_remove(node);
 
-		req->ready_cb(req->pending_msg, MESH_ERROR_FAILED, node);
-	} else {
-		/* Handle failed Join and Create requests */
-		if (node)
-			node_remove(node);
-
-		if (req->type == REQUEST_TYPE_JOIN)
-			req->join_ready_cb(NULL, NULL);
-		else
-			req->ready_cb(req->pending_msg, MESH_ERROR_FAILED,
-									NULL);
-	}
+	if (req->type == REQUEST_TYPE_JOIN)
+		req->join_ready_cb(NULL, NULL);
+	else
+		req->ready_cb(req->pending_msg, MESH_ERROR_FAILED, NULL);
 }
 
 /* Establish relationship between application and mesh node */
@@ -1761,13 +1711,18 @@ int node_attach(const char *app_path, const char *sender, uint64_t token,
 		return MESH_ERROR_ALREADY_EXISTS;
 	}
 
-	node->app_path = l_strdup(app_path);
-	node->owner = l_strdup(sender);
-
 	req = l_new(struct managed_obj_request, 1);
-	req->node = node;
+
+	/*
+	 * Create a temporary node to collect composition data from attaching
+	 * application. Existing node is passed in req->attach.
+	 */
+	req->node = node_new(node->uuid);
+	req->node->app_path = l_strdup(app_path);
+	req->node->owner = l_strdup(sender);
 	req->ready_cb = cb;
 	req->pending_msg = user_data;
+	req->attach = node;
 	req->type = REQUEST_TYPE_ATTACH;
 
 	l_dbus_method_call(dbus_get_bus(), sender, app_path,
@@ -1789,7 +1744,7 @@ void node_join(const char *app_path, const char *sender, const uint8_t *uuid,
 	l_debug("");
 
 	req = l_new(struct managed_obj_request, 1);
-	req->uuid = uuid;
+	req->node = node_new(uuid);
 	req->join_ready_cb = cb;
 	req->type = REQUEST_TYPE_JOIN;
 
@@ -1808,7 +1763,7 @@ void node_create(const char *app_path, const char *sender, const uint8_t *uuid,
 	l_debug("");
 
 	req = l_new(struct managed_obj_request, 1);
-	req->uuid = uuid;
+	req->node = node_new(uuid);
 	req->ready_cb = cb;
 	req->pending_msg = user_data;
 	req->type = REQUEST_TYPE_CREATE;
-- 
2.22.0

