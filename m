Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C09732730C
	for <lists+linux-bluetooth@lfdr.de>; Thu, 23 May 2019 01:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728145AbfEVXyu (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 22 May 2019 19:54:50 -0400
Received: from mga09.intel.com ([134.134.136.24]:38125 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726218AbfEVXyu (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 22 May 2019 19:54:50 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 May 2019 16:54:50 -0700
X-ExtLoop1: 1
Received: from bgix-dell-lap.sea.intel.com ([10.255.78.4])
  by orsmga001.jf.intel.com with ESMTP; 22 May 2019 16:54:49 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     inga.stotland@intel.com, brian.gix@intel.com
Subject: [PATCH BlueZ] mesh: Implement remote dev key methods for keyring
Date:   Wed, 22 May 2019 16:54:40 -0700
Message-Id: <20190522235440.11053-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.14.5
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Affected methods:
ImportRemoteNode()
DeleteRemoteNode()
---
 mesh/manager.c | 38 +++++++++++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/mesh/manager.c b/mesh/manager.c
index 41d4e9cc6..dee66b2cb 100644
--- a/mesh/manager.c
+++ b/mesh/manager.c
@@ -54,18 +54,47 @@ static struct l_dbus_message *add_node_call(struct l_dbus *dbus,
 	return dbus_error(msg, MESH_ERROR_NOT_IMPLEMENTED, NULL);
 }
 
+
+static struct l_dbus_message *import_node_call(struct l_dbus *dbus,
+						struct l_dbus_message *msg,
+						void *user_data)
+{
+	struct mesh_node *node = user_data;
+	struct l_dbus_message_iter iter_key;
+	uint16_t primary;
+	uint8_t num_ele;
+	uint8_t *key;
+	uint32_t n;
+
+	if (!l_dbus_message_get_arguments(msg, "qyay", &primary, &num_ele,
+								&iter_key))
+		return dbus_error(msg, MESH_ERROR_INVALID_ARGS, NULL);
+
+	if (!l_dbus_message_iter_get_fixed_array(&iter_key, &key, &n)
+								|| n != 16)
+		return dbus_error(msg, MESH_ERROR_INVALID_ARGS,
+							"Bad device key");
+
+	if (!keyring_put_remote_dev_key(node, primary, num_ele, key))
+		return dbus_error(msg, MESH_ERROR_FAILED, NULL);
+
+	return l_dbus_message_new_method_return(msg);
+}
+
 static struct l_dbus_message *delete_node_call(struct l_dbus *dbus,
 						struct l_dbus_message *msg,
 						void *user_data)
 {
+	struct mesh_node *node = user_data;
 	uint16_t primary;
 	uint8_t num_ele;
 
 	if (!l_dbus_message_get_arguments(msg, "qy", &primary, &num_ele))
 		return dbus_error(msg, MESH_ERROR_INVALID_ARGS, NULL);
 
-	/* TODO */
-	return dbus_error(msg, MESH_ERROR_NOT_IMPLEMENTED, NULL);
+	keyring_del_remote_dev_key(node, primary, num_ele);
+
+	return l_dbus_message_new_method_return(msg);
 }
 
 static struct l_dbus_message *start_scan_call(struct l_dbus *dbus,
@@ -388,7 +417,10 @@ static void setup_management_interface(struct l_dbus_interface *iface)
 {
 	l_dbus_interface_method(iface, "AddNode", 0, add_node_call, "", "ay",
 								"", "uuid");
-	l_dbus_interface_method(iface, "DeleteRemodeNode", 0, delete_node_call,
+	l_dbus_interface_method(iface, "ImportRemoteNode", 0, import_node_call,
+						"", "qyay", "", "primary",
+						"count", "dev_key");
+	l_dbus_interface_method(iface, "DeleteRemoteNode", 0, delete_node_call,
 					"", "qy", "", "primary", "count");
 	l_dbus_interface_method(iface, "UnprovisionedScan", 0, start_scan_call,
 							"", "q", "", "seconds");
-- 
2.14.5

