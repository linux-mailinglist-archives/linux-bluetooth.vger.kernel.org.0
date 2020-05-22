Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02EE21DDC39
	for <lists+linux-bluetooth@lfdr.de>; Fri, 22 May 2020 02:35:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbgEVAfH (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 21 May 2020 20:35:07 -0400
Received: from mga14.intel.com ([192.55.52.115]:55687 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727000AbgEVAfG (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 21 May 2020 20:35:06 -0400
IronPort-SDR: VtKONQWCj8IMmUdJtpt/kcsj3d/Wmhh0K/YxrkapdAikpohKjoNlZ0P95nwYrGs7lz7axwazo0
 0SUkidbuwlew==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2020 17:35:06 -0700
IronPort-SDR: 33UzfGyGhf0MByUZX//TVzdCYpPORGLoQBMftck1WJGp+BJnLhspEYsBv+2VKWkGZLcUVQ6xsw
 OI/k1Jepxj+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,419,1583222400"; 
   d="scan'208";a="300961686"
Received: from nsalivat-mobl.amr.corp.intel.com (HELO ingas-nuc1.sea.intel.com) ([10.254.98.52])
  by orsmga008.jf.intel.com with ESMTP; 21 May 2020 17:35:06 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 07/10] mesh: Clean up Import() method call
Date:   Thu, 21 May 2020 17:34:58 -0700
Message-Id: <20200522003501.106165-8-inga.stotland@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522003501.106165-1-inga.stotland@intel.com>
References: <20200522003501.106165-1-inga.stotland@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This removes unnecessary failing conditions in Import() call and
simplifies iterations through "flags" dictionary.
---
 mesh/mesh.c | 33 +++++++--------------------------
 mesh/node.c |  3 +--
 mesh/node.h |  2 +-
 3 files changed, 9 insertions(+), 29 deletions(-)

diff --git a/mesh/mesh.c b/mesh/mesh.c
index 4a3ba171d..e5b36cd94 100644
--- a/mesh/mesh.c
+++ b/mesh/mesh.c
@@ -706,22 +706,19 @@ static void create_node_ready_cb(void *user_data, int status,
 	const char *path;
 	const uint8_t *token;
 
-	pending_msg = l_queue_find(pending_queue, simple_match, user_data);
+	pending_msg = l_queue_remove_if(pending_queue, simple_match, user_data);
 	if (!pending_msg)
 		return;
 
 	if (status != MESH_ERROR_NONE) {
 		reply = dbus_error(pending_msg, status, NULL);
-
 		l_dbus_send(dbus_get_bus(), reply);
-		l_queue_remove(pending_queue, pending_msg);
 		return;
 	}
 
 	reply = l_dbus_message_new_method_return(pending_msg);
 
 	l_dbus_send(dbus, reply);
-	l_queue_remove(pending_queue, pending_msg);
 
 	owner = l_dbus_message_get_sender(pending_msg);
 	path = node_get_app_path(node);
@@ -825,19 +822,13 @@ static struct l_dbus_message *import_call(struct l_dbus *dbus,
 							"Bad net index");
 
 	while (l_dbus_message_iter_next_entry(&iter_flags, &key, &var)) {
-		if (!strcmp(key, "IVUpdate")) {
-			if (!l_dbus_message_iter_get_variant(&var, "b",
-								&ivu))
-				goto fail;
+		if (!strcmp(key, "IVUpdate") &&
+			l_dbus_message_iter_get_variant(&var, "b", &ivu))
 			continue;
-		}
 
-		if (!strcmp(key, "KeyRefresh")) {
-			if (!l_dbus_message_iter_get_variant(&var, "b",
-								&kr))
-				goto fail;
+		if (!strcmp(key, "KeyRefresh") &&
+			l_dbus_message_iter_get_variant(&var, "b", &kr))
 			continue;
-		}
 
 		return dbus_error(msg, MESH_ERROR_INVALID_ARGS,
 							"Bad flags");
@@ -852,20 +843,10 @@ static struct l_dbus_message *import_call(struct l_dbus *dbus,
 	pending_msg = l_dbus_message_ref(msg);
 	l_queue_push_tail(pending_queue, pending_msg);
 
-	if (!node_import(app_path, sender, uuid, dev_key, net_key, net_idx,
-					kr, ivu, iv_index, unicast,
-					create_node_ready_cb, pending_msg))
-		goto fail;
+	node_import(app_path, sender, uuid, dev_key, net_key, net_idx, kr, ivu,
+			iv_index, unicast, create_node_ready_cb, pending_msg);
 
 	return NULL;
-
-fail:
-	if (pending_msg) {
-		l_dbus_message_unref(msg);
-		l_queue_remove(pending_queue, pending_msg);
-	}
-
-	return dbus_error(msg, MESH_ERROR_INVALID_ARGS, "Node import failed");
 }
 
 static void setup_network_interface(struct l_dbus_interface *iface)
diff --git a/mesh/node.c b/mesh/node.c
index 8cfe1ddc8..9ba5ad877 100644
--- a/mesh/node.c
+++ b/mesh/node.c
@@ -1693,7 +1693,7 @@ void node_join(const char *app_root, const char *sender, const uint8_t *uuid,
 					req, l_free);
 }
 
-bool node_import(const char *app_root, const char *sender, const uint8_t *uuid,
+void node_import(const char *app_root, const char *sender, const uint8_t *uuid,
 			const uint8_t dev_key[16], const uint8_t net_key[16],
 			uint16_t net_idx, bool kr, bool ivu,
 			uint32_t iv_index, uint16_t unicast,
@@ -1725,7 +1725,6 @@ bool node_import(const char *app_root, const char *sender, const uint8_t *uuid,
 						"GetManagedObjects", NULL,
 						get_managed_objects_cb,
 						req, l_free);
-	return true;
 }
 
 void node_create(const char *app_root, const char *sender, const uint8_t *uuid,
diff --git a/mesh/node.h b/mesh/node.h
index 076714e66..ca5d60b6b 100644
--- a/mesh/node.h
+++ b/mesh/node.h
@@ -87,7 +87,7 @@ void node_build_attach_reply(struct mesh_node *node,
 						struct l_dbus_message *reply);
 void node_create(const char *app_root, const char *sender, const uint8_t *uuid,
 					node_ready_func_t cb, void *user_data);
-bool node_import(const char *app_root, const char *sender, const uint8_t *uuid,
+void node_import(const char *app_root, const char *sender, const uint8_t *uuid,
 			const uint8_t dev_key[16], const uint8_t net_key[16],
 			uint16_t net_idx, bool kr, bool ivu,
 			uint32_t iv_index, uint16_t unicast,
-- 
2.26.2

