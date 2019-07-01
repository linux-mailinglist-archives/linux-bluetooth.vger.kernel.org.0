Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2275315DF0
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 May 2019 09:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbfEGHNt (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 7 May 2019 03:13:49 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:42870 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726297AbfEGHNs (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 7 May 2019 03:13:48 -0400
Received: by mail-lf1-f67.google.com with SMTP id w23so10994452lfc.9
        for <linux-bluetooth@vger.kernel.org>; Tue, 07 May 2019 00:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=silvair-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/JZGQXo3ZcxzWyu0Ql4fMcj3ixRa7GX0hEVVZiCQ3Eg=;
        b=NVvhRZypUZXw9LBoQg6O3/u7mo2TMJbWVzlcQsKDDqe3bdKmupEZmmZDWsjr3NjOCE
         rX+6hhcNA+boUDB+NG6qRb0ZafrZy9sckCiXOmKPRsQeG4LWEXU6W9jdm1Jj9Rrn4sCi
         1+nRG7k6OZg33nUPZKXodHWQoPLqaJp9oijbxXr3pUvEUMKQl7xAWfm+M0JkS7SKyMbx
         mpIZV9XjWsi43bfCTWLozxZJvGxaEzmgESuOoSaY5ZQz4WsB/hnZGa2FBKAvYgeFMp7f
         Lpdv/HOAEewu7L9/vx6jyjT+y1JyZOLpBWRDds9MIYbGnnyMc7tSMWMRF2EipjOI8CWZ
         2r9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/JZGQXo3ZcxzWyu0Ql4fMcj3ixRa7GX0hEVVZiCQ3Eg=;
        b=qIdTi7gsdWF15elCPOF9aL2/AfG5R91YXnxDrWdVHaLI3GbznxlHyBJs//PJ+ixuma
         o9BdwJbe02ba87HvhpWObIlJy1zkawBDWMNRzTvcRMzzJE/unmWlGPZ+U7L7pExUoUq1
         NA/5EUNj6VzG58Ne1LMA0Sqix1GPtSr/NThNZwfHf/i6GVGT5pm8fCvMN1M4pUZMF4b8
         PlADEXfG/MpOC8eNqtMdXu3Kb28KQGr5qnwBZnK1WBuRV4HHKNYl75XyYx5eC83BYWLD
         HDjdqfeK2tFfQn5YnA9qwX1ppFfFcrBepZEw2/b7wGpzJ6nacBq7GHhdv0y6wMsN9YoL
         zY1g==
X-Gm-Message-State: APjAAAVBLaIVetEh6jWh/FLpJiuf+NDaOBKe+p4Uz2Or2VKqmuKuYx98
        p200v3wVh+75Ria0I1SC4xdmj1ikNtA=
X-Google-Smtp-Source: APXvYqyfwWED87euEMdugYu0H9kh9GcKFDXhEVNaujrXBubelO8cXMKSjZOJqIKpmGunxws9aQ+8dw==
X-Received: by 2002:ac2:54a1:: with SMTP id w1mr16533957lfk.46.1557213225403;
        Tue, 07 May 2019 00:13:45 -0700 (PDT)
Received: from scytale.silvair.lan ([217.153.94.18])
        by smtp.gmail.com with ESMTPSA id m29sm372439lfj.43.2019.05.07.00.13.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 00:13:44 -0700 (PDT)
From:   =?UTF-8?q?Micha=C5=82=20Lowas-Rzechonek?= 
        <michal.lowas-rzechonek@silvair.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ v2] mesh: Use node uuids as storage directory names
Date:   Tue,  7 May 2019 09:13:39 +0200
Message-Id: <20190507071340.20675-1-michal.lowas-rzechonek@silvair.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Instead of keeping track of unique 16bit node identifiers, reuse their
UUIDs to create both storage directories and dbus objects.

Because of that:
 - UUID is no longer stored in the JSON file, it's inferred from the
   directory name instead
 - Join(), CreateNetwork() and ImportLocalNode() APIs return an error if
   given UUID already registered within the daemon
---
 doc/mesh-api.txt |  26 ++++++++---
 mesh/README      |   7 ++-
 mesh/mesh-db.c   |   4 --
 mesh/mesh-db.h   |   1 -
 mesh/mesh.c      |   7 +++
 mesh/node.c      |  39 ++++++-----------
 mesh/node.h      |   2 +-
 mesh/storage.c   | 109 +++++++++++++++++------------------------------
 8 files changed, 84 insertions(+), 111 deletions(-)

diff --git a/doc/mesh-api.txt b/doc/mesh-api.txt
index 81d1a3288..112990a5d 100644
--- a/doc/mesh-api.txt
+++ b/doc/mesh-api.txt
@@ -24,10 +24,14 @@ Methods:
 		DBus.ObjectManager interface must be available on the
 		app_defined_root path.
 
-		The uuid parameter is a 16-byte array that contains Device UUID.
+		The uuid parameter is a 16-byte array that contains Device UUID. This
+		UUID must be unique (at least from the daemon perspective), therefore
+		attempting to call this function using already registered UUID results
+		in an error.
 
 		PossibleErrors:
 			org.bluez.mesh.Error.InvalidArguments
+			org.bluez.mesh.Error.AlreadyExists,
 
 	void Cancel(void)
 
@@ -127,7 +131,10 @@ Methods:
 		interface. The standard DBus.ObjectManager interface must be
 		available on the app_root path.
 
-		The uuid parameter is a 16-byte array that contains Device UUID.
+		The uuid parameter is a 16-byte array that contains Device UUID. This
+		UUID must be unique (at least from the daemon perspective), therefore
+		attempting to call this function using already registered UUID results
+		in an error.
 
 		The returned token must be preserved by the application in
 		order to authenticate itself to the mesh daemon and attach to
@@ -142,6 +149,7 @@ Methods:
 
 		PossibleErrors:
 			org.bluez.mesh.Error.InvalidArguments
+			org.bluez.mesh.Error.AlreadyExists,
 
 	 uint64 token ImportLocalNode(string json_data)
 
@@ -160,8 +168,12 @@ Methods:
 		permanently remove the identity of the mesh node by calling
 		Leave() method.
 
+		It is an error to attempt importing a node with already registered
+		Device UUID.
+
 		PossibleErrors:
 			org.bluez.mesh.Error.InvalidArguments,
+			org.bluez.mesh.Error.AlreadyExists
 			org.bluez.mesh.Error.NotFound,
 			org.bluez.mesh.Error.Failed
 
@@ -169,8 +181,9 @@ Mesh Node Hierarchy
 ===================
 Service		org.bluez.mesh
 Interface	org.bluez.mesh.Node1
-Object path	/org/bluez/mesh/node<xxxx>
-		where xxxx is a 4-digit hexadecimal number generated by daemon
+Object path	/org/bluez/mesh/node<uuid>
+		where <uuid> is the Device UUID passed to Join(), CreateNetwork() or
+		ImportLocalNode()
 
 Methods:
 	void Send(object element_path, uint16 destination, uint16 key_index,
@@ -334,8 +347,9 @@ Mesh Provisioning Hierarchy
 ============================
 Service		org.bluez.mesh
 Interface	org.bluez.mesh.Management1
-Object path	/org/bluez/mesh/node<xxxx>
-		where xxxx is a 4-digit hexadecimal number generated by daemon
+Object path	/org/bluez/mesh/node<uuid>
+		where <uuid> is the Device UUID passed to Join(), CreateNetwork() or
+		ImportLocalNode()
 
 Methods:
 	void UnprovisionedScan(uint16 seconds)
diff --git a/mesh/README b/mesh/README
index 151a1e6a1..ca223a6d8 100644
--- a/mesh/README
+++ b/mesh/README
@@ -26,9 +26,8 @@ Storage
 Default storage directory is /var/lib/bluetooth/mesh.
 
 The directory contains the provisioned nodes configurations.
-Each node has its own subdirectory, named with a 4-digit (hexadecimal)
-identificator that is internally generated by the mesh daemon at the time
-of the node provisioning.
+Each node has its own subdirectory, named after node's Device UUID (32-digit
+hexadecimal string) that is generated by the application that created a node.
 
 Each subdirectory contains the following files:
 	- node.json:
@@ -47,4 +46,4 @@ Mailing lists:
 	linux-bluetooth@vger.kernel.org
 
 For additional information about the project visit BlueZ web site:
-	http://www.bluez.org
\ No newline at end of file
+	http://www.bluez.org
diff --git a/mesh/mesh-db.c b/mesh/mesh-db.c
index 64e33cd91..01ae63146 100644
--- a/mesh/mesh-db.c
+++ b/mesh/mesh-db.c
@@ -1466,10 +1466,6 @@ bool mesh_db_add_node(json_object *jnode, struct mesh_db_node *node) {
 	if (!mesh_db_write_uint16_hex(jnode, "crpl", node->crpl))
 		return false;
 
-	/* Device UUID */
-	if (!add_key_value(jnode, "UUID", node->uuid))
-		return false;
-
 	/* Features: relay, LPN, friend, proxy*/
 	if (!mesh_db_write_relay_mode(jnode, modes->relay.state,
 						modes->relay.cnt,
diff --git a/mesh/mesh-db.h b/mesh/mesh-db.h
index 06aba1f31..19913148e 100644
--- a/mesh/mesh-db.h
+++ b/mesh/mesh-db.h
@@ -76,7 +76,6 @@ struct mesh_db_node {
 	uint16_t unicast;
 	uint8_t ttl;
 	struct l_queue *elements;
-	uint8_t uuid[16];
 };
 
 struct mesh_db_prov {
diff --git a/mesh/mesh.c b/mesh/mesh.c
index a084f9200..4d65f266a 100644
--- a/mesh/mesh.c
+++ b/mesh/mesh.c
@@ -577,6 +577,13 @@ static struct l_dbus_message *join_network_call(struct l_dbus *dbus,
 							"Bad device UUID");
 	}
 
+	if (node_find_by_uuid(join_pending->uuid)) {
+		l_free(join_pending);
+		join_pending = NULL;
+		return dbus_error(msg, MESH_ERROR_ALREADY_EXISTS,
+							"Node already exists");
+	}
+
 	sender = l_dbus_message_get_sender(msg);
 
 	join_pending->sender = l_strdup(sender);
diff --git a/mesh/node.c b/mesh/node.c
index 774d03d45..ad444b5c5 100644
--- a/mesh/node.c
+++ b/mesh/node.c
@@ -21,6 +21,7 @@
 #include <config.h>
 #endif
 
+#define _GNU_SOURCE
 #include <stdio.h>
 #include <sys/time.h>
 #include <ell/ell.h>
@@ -83,7 +84,6 @@ struct mesh_node {
 	time_t upd_sec;
 	uint32_t seq_number;
 	uint32_t seq_min_cache;
-	uint16_t id;
 	bool provisioner;
 	uint16_t primary;
 	struct node_composition *comp;
@@ -92,7 +92,7 @@ struct mesh_node {
 		uint8_t cnt;
 		uint8_t mode;
 	} relay;
-	uint8_t dev_uuid[16];
+	uint8_t uuid[16];
 	uint8_t dev_key[16];
 	uint8_t token[8];
 	uint8_t num_ele;
@@ -126,7 +126,7 @@ static bool match_device_uuid(const void *a, const void *b)
 	const struct mesh_node *node = a;
 	const uint8_t *uuid = b;
 
-	return (memcmp(node->dev_uuid, uuid, 16) == 0);
+	return (memcmp(node->uuid, uuid, 16) == 0);
 }
 
 static bool match_token(const void *a, const void *b)
@@ -187,15 +187,16 @@ uint8_t *node_uuid_get(struct mesh_node *node)
 {
 	if (!node)
 		return NULL;
-	return node->dev_uuid;
+	return node->uuid;
 }
 
-struct mesh_node *node_new(void)
+struct mesh_node *node_new(const uint8_t uuid[16])
 {
 	struct mesh_node *node;
 
 	node = l_new(struct mesh_node, 1);
 	node->net = mesh_net_new(node);
+	memcpy(node->uuid, uuid, sizeof(node->uuid));
 
 	if (!nodes)
 		nodes = l_queue_new();
@@ -382,8 +383,6 @@ bool node_init_from_storage(struct mesh_node *node, void *data)
 
 	node->primary = db_node->unicast;
 
-	memcpy(node->dev_uuid, db_node->uuid, 16);
-
 	/* Initialize configuration server model */
 	mesh_config_srv_init(node, PRIMARY_ELE_IDX);
 
@@ -973,20 +972,6 @@ fail:
 	return false;
 }
 
-void node_id_set(struct mesh_node *node, uint16_t id)
-{
-	if (node)
-		node->id = id;
-}
-
-uint16_t node_id_get(struct mesh_node *node)
-{
-	if (!node)
-		return 0;
-
-	return node->id;
-}
-
 static void attach_io(void *a, void *b)
 {
 	struct mesh_node *node = a;
@@ -1005,9 +990,13 @@ void node_attach_io(struct mesh_io *io)
 /* Register node object with D-Bus */
 static bool register_node_object(struct mesh_node *node)
 {
-	node->path = l_malloc(strlen(MESH_NODE_PATH_PREFIX) + 5);
+	char uuid[33];
 
-	snprintf(node->path, 10, MESH_NODE_PATH_PREFIX "%4.4x", node->id);
+	if (!hex2str(node->uuid, sizeof(node->uuid), uuid, sizeof(uuid)))
+		return false;
+
+	if (asprintf(&node->path, MESH_NODE_PATH_PREFIX "%s", uuid) < 0)
+		return false;
 
 	if (!l_dbus_object_add_interface(dbus_get_bus(), node->path,
 					MESH_NODE_INTERFACE, node))
@@ -1232,8 +1221,6 @@ static void convert_node_to_storage(struct mesh_node *node,
 	db_node->modes.lpn = node->lpn;
 	db_node->modes.proxy = node->proxy;
 
-	memcpy(db_node->uuid, node->dev_uuid, 16);
-
 	db_node->modes.friend = node->friend;
 	db_node->modes.relay.state = node->relay.mode;
 	db_node->modes.relay.cnt = node->relay.cnt;
@@ -1469,7 +1456,7 @@ static void get_managed_objects_cb(struct l_dbus_message *msg, void *user_data)
 		}
 		node->num_ele = num_ele;
 		set_defaults(node);
-		memcpy(node->dev_uuid, req->data, 16);
+		memcpy(node->uuid, req->data, 16);
 
 		if (!create_node_config(node))
 			goto fail;
diff --git a/mesh/node.h b/mesh/node.h
index 20b60099e..1be4de1da 100644
--- a/mesh/node.h
+++ b/mesh/node.h
@@ -33,7 +33,7 @@ typedef void (*node_ready_func_t) (void *user_data, int status,
 typedef void (*node_join_ready_func_t) (struct mesh_node *node,
 						struct mesh_agent *agent);
 
-struct mesh_node *node_new(void);
+struct mesh_node *node_new(const uint8_t uuid[16]);
 void node_remove(struct mesh_node *node);
 void node_join(const char *app_path, const char *sender, const uint8_t *uuid,
 						node_join_ready_func_t cb);
diff --git a/mesh/storage.c b/mesh/storage.c
index 8a70b5696..6dc251344 100644
--- a/mesh/storage.c
+++ b/mesh/storage.c
@@ -45,6 +45,7 @@
 #include "mesh/model.h"
 #include "mesh/mesh-db.h"
 #include "mesh/storage.h"
+#include "mesh/util.h"
 
 struct write_info {
 	json_object *jnode;
@@ -54,12 +55,6 @@ struct write_info {
 };
 
 static const char *storage_dir;
-static struct l_queue *node_ids;
-
-static bool simple_match(const void *a, const void *b)
-{
-	return a == b;
-}
 
 static bool read_node_cb(struct mesh_db_node *db_node, void *user_data)
 {
@@ -171,7 +166,7 @@ static bool parse_node(struct mesh_node *node, json_object *jnode)
 	return true;
 }
 
-static bool parse_config(char *in_file, char *out_file, uint16_t node_id)
+static bool parse_config(char *in_file, char *out_file, const uint8_t uuid[16])
 {
 	int fd;
 	char *str;
@@ -208,7 +203,7 @@ static bool parse_config(char *in_file, char *out_file, uint16_t node_id)
 	if (!jnode)
 		goto done;
 
-	node = node_new();
+	node = node_new(uuid);
 
 	result = parse_node(node, jnode);
 
@@ -219,7 +214,6 @@ static bool parse_config(char *in_file, char *out_file, uint16_t node_id)
 
 	node_jconfig_set(node, jnode);
 	node_cfg_file_set(node, out_file);
-	node_id_set(node, node_id);
 
 done:
 	close(fd);
@@ -533,44 +527,41 @@ bool storage_load_nodes(const char *dir_name)
 	}
 
 	storage_dir = dir_name;
-	node_ids = l_queue_new();
 
 	while ((entry = readdir(dir)) != NULL) {
-		char name_buf[PATH_MAX];
-		char *filename;
-		uint32_t node_id;
-		size_t len;
+		char *cfg;
+		char *bak;
+		uint8_t uuid[16];
 
 		if (entry->d_type != DT_DIR)
 			continue;
 
-		if (sscanf(entry->d_name, "%04x", &node_id) != 1)
+		if (!str2hex(entry->d_name, strlen(entry->d_name), uuid, sizeof(uuid)))
 			continue;
 
-		snprintf(name_buf, PATH_MAX, "%s/%s/node.json", dir_name,
-								entry->d_name);
-
-		l_queue_push_tail(node_ids, L_UINT_TO_PTR(node_id));
-
-		len = strlen(name_buf);
-		filename = l_malloc(len + 1);
-
-		strncpy(filename, name_buf, len + 1);
+		if (asprintf(&cfg, "%s/%s/node.json", dir_name,
+						entry->d_name) < 0)
+			continue;
 
-		if (parse_config(name_buf, filename, node_id))
+		if (parse_config(cfg, cfg, uuid))
 			continue;
 
 		/* Fall-back to Backup version */
-		snprintf(name_buf, PATH_MAX, "%s/%s/node.json.bak", dir_name,
-								entry->d_name);
+		if (asprintf(&bak, "%s/%s/node.json.bak", dir_name,
+						entry->d_name) < 0) {
+			l_free(cfg);
+			continue;
+		}
 
-		if (parse_config(name_buf, filename, node_id)) {
-			remove(filename);
-			rename(name_buf, filename);
+		if (parse_config(bak, cfg, uuid)) {
+			remove(cfg);
+			rename(bak, cfg);
+			l_free(cfg);
 			continue;
 		}
 
-		l_free(filename);
+		l_free(cfg);
+		l_free(bak);
 	}
 
 	return true;
@@ -579,12 +570,10 @@ bool storage_load_nodes(const char *dir_name)
 bool storage_create_node_config(struct mesh_node *node, void *data)
 {
 	struct mesh_db_node *db_node = data;
-	uint16_t node_id;
-	uint8_t num_tries = 0;
+	char uuid[33];
 	char name_buf[PATH_MAX];
 	char *filename;
 	json_object *jnode;
-	size_t len;
 
 	if (!storage_dir)
 		return false;
@@ -594,28 +583,18 @@ bool storage_create_node_config(struct mesh_node *node, void *data)
 	if (!mesh_db_add_node(jnode, db_node))
 		return false;
 
-	do {
-		l_getrandom(&node_id, 2);
-		if (node_id && !l_queue_find(node_ids, simple_match,
-						L_UINT_TO_PTR(node_id)))
-			break;
-	} while (++num_tries < 10);
-
-	if (num_tries == 10)
-		l_error("Failed to generate unique node ID");
-
-	node_id_set(node, node_id);
+	if (!hex2str(node_uuid_get(node), 16, uuid, sizeof(uuid)))
+		return false;
 
-	snprintf(name_buf, PATH_MAX, "%s/%04x", storage_dir, node_id);
+	snprintf(name_buf, PATH_MAX, "%s/%s", storage_dir, uuid);
 
 	/* Create a new directory and node.json file */
 	if (mkdir(name_buf, 0755) != 0)
 		goto fail;
 
-	len = strlen(name_buf) + strlen("/node.json") + 1;
-	filename = l_malloc(len);
+	if (asprintf(&filename, "%s/node.json", name_buf) < 0)
+		goto fail;
 
-	snprintf(filename, len, "%s/node.json", name_buf);
 	l_debug("New node config %s", filename);
 
 	if (!save_config(jnode, filename)) {
@@ -626,8 +605,6 @@ bool storage_create_node_config(struct mesh_node *node, void *data)
 	node_jconfig_set(node, jnode);
 	node_cfg_file_set(node, filename);
 
-	l_queue_push_tail(node_ids, L_UINT_TO_PTR(node_id));
-
 	return true;
 fail:
 	json_object_put(jnode);
@@ -637,11 +614,9 @@ fail:
 /* Permanently remove node configuration */
 void storage_remove_node_config(struct mesh_node *node)
 {
-	char *cfgname;
+	char *cfg;
 	struct json_object *jnode;
 	const char *dir_name;
-	uint16_t node_id;
-	size_t len;
 	char *bak;
 
 	if (!node)
@@ -654,30 +629,26 @@ void storage_remove_node_config(struct mesh_node *node)
 	node_jconfig_set(node, NULL);
 
 	/* Delete node configuration file */
-	cfgname = (char *) node_cfg_file_get(node);
-	if (!cfgname)
+	cfg = node_cfg_file_get(node);
+	if (!cfg)
 		return;
 
-	l_debug("Delete node config file %s", cfgname);
-	remove(cfgname);
+	l_debug("Delete node config file %s", cfg);
+	remove(cfg);
 
 	/* Delete the backup file */
-	len = strlen(cfgname) + 5;
-	bak = l_malloc(len);
-	strncpy(bak, cfgname, len);
-	bak = strncat(bak, ".bak", 5);
-	remove(bak);
-	l_free(bak);
+	if (asprintf(&bak, "%s.bak", cfg))
+	{
+		remove(bak);
+		l_free(bak);
+	}
 
 	/* Delete the node directory */
-	dir_name = dirname(cfgname);
+	dir_name = dirname(cfg);
 
 	l_debug("Delete directory %s", dir_name);
 	rmdir(dir_name);
 
-	l_free(cfgname);
+	l_free(cfg);
 	node_cfg_file_set(node, NULL);
-
-	node_id = node_id_get(node);
-	l_queue_remove(node_ids, L_UINT_TO_PTR(node_id));
 }
-- 
2.19.1

