Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5BC9AAE97
	for <lists+linux-bluetooth@lfdr.de>; Fri,  6 Sep 2019 00:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390326AbfIEWfa (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 5 Sep 2019 18:35:30 -0400
Received: from mga04.intel.com ([192.55.52.120]:51621 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729719AbfIEWfa (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 5 Sep 2019 18:35:30 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Sep 2019 15:35:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,471,1559545200"; 
   d="scan'208";a="199376645"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.254.24.188])
  by fmsmga001.fm.intel.com with ESMTP; 05 Sep 2019 15:35:29 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, inga.stotland@intel.com
Subject: [PATCH BlueZ v3 2/2] mesh: Automate AppKey update on KR phase 2-->3-->0
Date:   Thu,  5 Sep 2019 15:35:18 -0700
Message-Id: <20190905223518.18073-3-brian.gix@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190905223518.18073-1-brian.gix@intel.com>
References: <20190905223518.18073-1-brian.gix@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Designed so that if an unexpcted abort() occurs, the bound NetKey remains
in state 2 or 3.  If successful, the NetKey is set to Phase 0, and all
bound AppKeys are in their correct state.
---
 mesh/keyring.c | 58 ++++++++++++++++++++++++++++++++++++++++++++++++++
 mesh/keyring.h |  1 +
 mesh/manager.c | 43 +++++++++++--------------------------
 3 files changed, 71 insertions(+), 31 deletions(-)

diff --git a/mesh/keyring.c b/mesh/keyring.c
index 4b3d8b296..3a7f92f9f 100644
--- a/mesh/keyring.c
+++ b/mesh/keyring.c
@@ -23,6 +23,7 @@
 
 #define _GNU_SOURCE
 #include <fcntl.h>
+#include <dirent.h>
 #include <stdio.h>
 #include <unistd.h>
 #include <dirent.h>
@@ -105,6 +106,7 @@ bool keyring_put_app_key(struct mesh_node *node, uint16_t app_idx,
 				return false;
 			}
 		}
+
 		lseek(fd, 0, SEEK_SET);
 	} else
 		fd = open(key_file, O_WRONLY | O_CREAT | O_TRUNC,
@@ -120,6 +122,62 @@ bool keyring_put_app_key(struct mesh_node *node, uint16_t app_idx,
 	return result;
 }
 
+static void finalize(const char *fpath, uint16_t net_idx)
+{
+	struct keyring_app_key key;
+	int fd;
+
+	fd = open(fpath, O_RDWR);
+
+	if (fd < 0)
+		return;
+
+	if (read(fd, &key, sizeof(key)) != sizeof(key) ||
+						key.net_idx != net_idx)
+		goto done;
+
+	l_debug("Finalize %s", fpath);
+	memcpy(key.old_key, key.new_key, 16);
+	lseek(fd, 0, SEEK_SET);
+	write(fd, &key, sizeof(key));
+
+done:
+	close(fd);
+}
+
+bool keyring_finalize_app_keys(struct mesh_node *node, uint16_t net_idx)
+{
+	const char *node_path;
+	char key_dir[PATH_MAX];
+	DIR *dir;
+	struct dirent *entry;
+
+	if (!node)
+		return false;
+
+	node_path = node_get_storage_dir(node);
+
+	if (strlen(node_path) + strlen(app_key_dir) + 1 >= PATH_MAX)
+		return false;
+
+	snprintf(key_dir, PATH_MAX, "%s%s", node_path, app_key_dir);
+	dir = opendir(key_dir);
+	if (!dir) {
+		l_error("Failed to App Key storage directory: %s", key_dir);
+		return false;
+	}
+
+	while ((entry = readdir(dir)) != NULL) {
+		/* AppKeys are stored in regular files */
+		if (entry->d_type == DT_REG)
+			finalize(entry->d_name, net_idx);
+	}
+
+	closedir(dir);
+
+	return true;
+}
+
 bool keyring_put_remote_dev_key(struct mesh_node *node, uint16_t unicast,
 					uint8_t count, uint8_t dev_key[16])
 {
diff --git a/mesh/keyring.h b/mesh/keyring.h
index 167191013..2fab6b0dc 100644
--- a/mesh/keyring.h
+++ b/mesh/keyring.h
@@ -38,6 +38,7 @@ bool keyring_get_net_key(struct mesh_node *node, uint16_t net_idx,
 bool keyring_del_net_key(struct mesh_node *node, uint16_t net_idx);
 bool keyring_put_app_key(struct mesh_node *node, uint16_t app_idx,
 				uint16_t net_idx, struct keyring_app_key *key);
+bool keyring_finalize_app_keys(struct mesh_node *node, uint16_t net_id);
 bool keyring_get_app_key(struct mesh_node *node, uint16_t app_idx,
 						struct keyring_app_key *key);
 bool keyring_del_app_key(struct mesh_node *node, uint16_t app_idx);
diff --git a/mesh/manager.c b/mesh/manager.c
index cf4782c45..90093bc2c 100644
--- a/mesh/manager.c
+++ b/mesh/manager.c
@@ -434,6 +434,7 @@ static struct l_dbus_message *store_new_subnet(struct mesh_node *node,
 	}
 
 	memcpy(key.old_key, new_key, 16);
+	memcpy(key.new_key, new_key, 16);
 	key.net_idx = net_idx;
 	key.phase = KEY_REFRESH_PHASE_NONE;
 
@@ -616,34 +617,6 @@ static struct l_dbus_message *update_appkey_call(struct l_dbus *dbus,
 	return l_dbus_message_new_method_return(msg);
 }
 
-static struct l_dbus_message *complete_update_appkey_call(struct l_dbus *dbus,
-						struct l_dbus_message *msg,
-						void *user_data)
-{
-	struct mesh_node *node = user_data;
-	struct keyring_net_key net_key;
-	struct keyring_app_key app_key;
-	uint16_t app_idx;
-
-	if (!l_dbus_message_get_arguments(msg, "q", &app_idx) ||
-			app_idx > MAX_KEY_IDX)
-		return dbus_error(msg, MESH_ERROR_INVALID_ARGS, NULL);
-
-	if (!keyring_get_app_key(node, app_idx, &app_key) ||
-			!keyring_get_net_key(node, app_key.net_idx, &net_key))
-		return dbus_error(msg, MESH_ERROR_DOES_NOT_EXIST, NULL);
-
-	if (net_key.phase != KEY_REFRESH_PHASE_TWO)
-		return dbus_error(msg, MESH_ERROR_FAILED, "Invalid phase");
-
-	memcpy(app_key.old_key, app_key.new_key, 16);
-
-	if (!keyring_put_app_key(node, app_idx, app_key.net_idx, &app_key))
-		return dbus_error(msg, MESH_ERROR_FAILED, NULL);
-
-	return l_dbus_message_new_method_return(msg);
-}
-
 static struct l_dbus_message *delete_appkey_call(struct l_dbus *dbus,
 						struct l_dbus_message *msg,
 						void *user_data)
@@ -698,9 +671,20 @@ static struct l_dbus_message *set_key_phase_call(struct l_dbus *dbus,
 	if (!keyring_get_net_key(node, net_idx, &key))
 		return dbus_error(msg, MESH_ERROR_DOES_NOT_EXIST, NULL);
 
+	if (phase == KEY_REFRESH_PHASE_NONE &&
+					key.phase >= KEY_REFRESH_PHASE_TWO)
+		return dbus_error(msg, MESH_ERROR_INVALID_ARGS, NULL);
+
 	if (phase == KEY_REFRESH_PHASE_THREE &&
 					key.phase != KEY_REFRESH_PHASE_NONE) {
 		memcpy(key.old_key, key.new_key, 16);
+		key.phase = KEY_REFRESH_PHASE_THREE;
+		if (!keyring_put_net_key(node, net_idx, &key))
+			return dbus_error(msg, MESH_ERROR_FAILED, NULL);
+
+		if (!keyring_finalize_app_keys(node, net_idx))
+			return dbus_error(msg, MESH_ERROR_FAILED, NULL);
+
 		key.phase = KEY_REFRESH_PHASE_NONE;
 	} else
 		key.phase = phase;
@@ -736,9 +720,6 @@ static void setup_management_interface(struct l_dbus_interface *iface)
 					"", "qq", "", "net_index", "app_index");
 	l_dbus_interface_method(iface, "UpdateAppKey", 0, update_appkey_call,
 						"", "q", "", "app_index");
-	l_dbus_interface_method(iface, "CompleteAppKeyUpdate", 0,
-					complete_update_appkey_call, "", "q",
-							"", "app_index");
 	l_dbus_interface_method(iface, "DeleteAppKey", 0, delete_appkey_call,
 						"", "q", "", "app_index");
 	l_dbus_interface_method(iface, "ImportAppKey", 0, import_appkey_call,
-- 
2.21.0

