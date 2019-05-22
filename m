Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18EF426F33
	for <lists+linux-bluetooth@lfdr.de>; Wed, 22 May 2019 21:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387694AbfEVTzD (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 22 May 2019 15:55:03 -0400
Received: from mga03.intel.com ([134.134.136.65]:64438 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730937AbfEVTzD (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 22 May 2019 15:55:03 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 May 2019 12:55:02 -0700
X-ExtLoop1: 1
Received: from bgix-dell-lap.sea.intel.com ([10.255.78.4])
  by fmsmga004.fm.intel.com with ESMTP; 22 May 2019 12:55:02 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     inga.stotland@intel.com, brian.gix@intel.com
Subject: [PATCH BlueZ v2 5/5] mesh: Implement Key Refresh Phasing in keyring
Date:   Wed, 22 May 2019 12:54:28 -0700
Message-Id: <20190522195428.1901-6-brian.gix@intel.com>
X-Mailer: git-send-email 2.14.5
In-Reply-To: <20190522195428.1901-1-brian.gix@intel.com>
References: <20190522195428.1901-1-brian.gix@intel.com>
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Affected methods:
CompleteAppKeyUpdate()
SetKeyPhase()
---
 mesh/manager.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 50 insertions(+), 3 deletions(-)

diff --git a/mesh/manager.c b/mesh/manager.c
index b82ad02e4..41d4e9cc6 100644
--- a/mesh/manager.c
+++ b/mesh/manager.c
@@ -289,6 +289,34 @@ static struct l_dbus_message *update_appkey_call(struct l_dbus *dbus,
 	return l_dbus_message_new_method_return(msg);
 }
 
+static struct l_dbus_message *complete_update_appkey_call(struct l_dbus *dbus,
+						struct l_dbus_message *msg,
+						void *user_data)
+{
+	struct mesh_node *node = user_data;
+	struct keyring_net_key net_key;
+	struct keyring_app_key app_key;
+	uint16_t app_idx;
+
+	if (!l_dbus_message_get_arguments(msg, "q", &app_idx) ||
+			app_idx > MAX_KEY_IDX)
+		return dbus_error(msg, MESH_ERROR_INVALID_ARGS, NULL);
+
+	if (!keyring_get_app_key(node, app_idx, &app_key) ||
+			!keyring_get_net_key(node, app_key.net_idx, &net_key))
+		return dbus_error(msg, MESH_ERROR_DOES_NOT_EXIST, NULL);
+
+	if (net_key.phase != KEY_REFRESH_PHASE_TWO)
+		return dbus_error(msg, MESH_ERROR_FAILED, "Invalid phase");
+
+	memcpy(app_key.old_key, app_key.new_key, 16);
+
+	if (!keyring_put_app_key(node, app_idx, app_key.net_idx, &app_key))
+		return dbus_error(msg, MESH_ERROR_FAILED, NULL);
+
+	return l_dbus_message_new_method_return(msg);
+}
+
 static struct l_dbus_message *delete_appkey_call(struct l_dbus *dbus,
 						struct l_dbus_message *msg,
 						void *user_data)
@@ -330,14 +358,30 @@ static struct l_dbus_message *set_key_phase_call(struct l_dbus *dbus,
 						struct l_dbus_message *msg,
 						void *user_data)
 {
+	struct mesh_node *node = user_data;
+	struct keyring_net_key key;
 	uint16_t net_idx;
 	uint8_t phase;
 
-	if (!l_dbus_message_get_arguments(msg, "qy", &net_idx, &phase))
+	if (!l_dbus_message_get_arguments(msg, "qy", &net_idx, &phase) ||
+					phase == KEY_REFRESH_PHASE_ONE ||
+					phase > KEY_REFRESH_PHASE_THREE)
 		return dbus_error(msg, MESH_ERROR_INVALID_ARGS, NULL);
 
-	/* TODO */
-	return dbus_error(msg, MESH_ERROR_NOT_IMPLEMENTED, NULL);
+	if (!keyring_get_net_key(node, net_idx, &key))
+		return dbus_error(msg, MESH_ERROR_DOES_NOT_EXIST, NULL);
+
+	if (phase == KEY_REFRESH_PHASE_THREE &&
+					key.phase != KEY_REFRESH_PHASE_NONE) {
+		memcpy(key.old_key, key.new_key, 16);
+		key.phase = KEY_REFRESH_PHASE_NONE;
+	} else
+		key.phase = phase;
+
+	if (!keyring_put_net_key(node, net_idx, &key))
+		return dbus_error(msg, MESH_ERROR_FAILED, NULL);
+
+	return l_dbus_message_new_method_return(msg);
 }
 
 static void setup_management_interface(struct l_dbus_interface *iface)
@@ -362,6 +406,9 @@ static void setup_management_interface(struct l_dbus_interface *iface)
 					"", "qq", "", "net_index", "app_index");
 	l_dbus_interface_method(iface, "UpdateAppKey", 0, update_appkey_call,
 						"", "q", "", "app_index");
+	l_dbus_interface_method(iface, "CompleteAppKeyUpdate", 0,
+					complete_update_appkey_call, "", "q",
+							"", "app_index");
 	l_dbus_interface_method(iface, "DeleteAppKey", 0, delete_appkey_call,
 						"", "q", "", "app_index");
 	l_dbus_interface_method(iface, "ImportAppKey", 0, import_appkey_call,
-- 
2.14.5

