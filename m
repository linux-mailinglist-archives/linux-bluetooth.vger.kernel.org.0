Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAF4817A21F
	for <lists+linux-bluetooth@lfdr.de>; Thu,  5 Mar 2020 10:18:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgCEJSx (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 5 Mar 2020 04:18:53 -0500
Received: from mga14.intel.com ([192.55.52.115]:48950 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725937AbgCEJSw (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 5 Mar 2020 04:18:52 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Mar 2020 01:18:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,517,1574150400"; 
   d="scan'208";a="259126114"
Received: from unknown (HELO ajay-desktop.iind.intel.com) ([10.223.96.133])
  by orsmga002.jf.intel.com with ESMTP; 05 Mar 2020 01:18:51 -0800
From:   Ajay Kishore <ajay.kishore@intel.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v3 1/6] obexd: Add initial support for MAP conversations
Date:   Thu,  5 Mar 2020 14:25:19 +0530
Message-Id: <1583398524-18749-1-git-send-email-ajay.kishore@intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Changes made to add a new method for MAP conversation listing i.e
"ListConversations" to handle conversation listing object
"x-bt/MAP-convo-listing".
---
 obexd/client/map.c | 67 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/obexd/client/map.c b/obexd/client/map.c
index 550c5af..adf62d9 100644
--- a/obexd/client/map.c
+++ b/obexd/client/map.c
@@ -1560,6 +1560,69 @@ static DBusMessage *map_list_messages(DBusConnection *connection,
 	return get_message_listing(map, message, folder, apparam);
 }
 
+static GObexApparam *parse_conversation_filters(GObexApparam *apparam,
+							DBusMessageIter *iter)
+{
+	DBusMessageIter array;
+
+	if (dbus_message_iter_get_arg_type(iter) != DBUS_TYPE_ARRAY) {
+		DBG("Not of type array");
+		return NULL;
+	}
+
+	dbus_message_iter_recurse(iter, &array);
+
+	while (dbus_message_iter_get_arg_type(&array) == DBUS_TYPE_DICT_ENTRY) {
+		const char *key;
+		DBusMessageIter value, entry;
+
+		dbus_message_iter_recurse(&array, &entry);
+		dbus_message_iter_get_basic(&entry, &key);
+
+		dbus_message_iter_next(&entry);
+		dbus_message_iter_recurse(&entry, &value);
+
+		/* TODO: Parse conversation filters */
+
+		dbus_message_iter_next(&array);
+	}
+	return apparam;
+}
+
+static DBusMessage *map_list_conversations(DBusConnection *connection,
+						DBusMessage *message,
+						void *user_data)
+{
+	struct map_data *map = user_data;
+	const char *folder;
+	GObexApparam *apparam;
+	DBusMessageIter args;
+
+	dbus_message_iter_init(message, &args);
+
+	if (dbus_message_iter_get_arg_type(&args) != DBUS_TYPE_STRING)
+		return g_dbus_create_error(message,
+			ERROR_INTERFACE ".InvalidArguments", NULL);
+
+	dbus_message_iter_get_basic(&args, &folder);
+
+	apparam = g_obex_apparam_set_uint16(NULL, MAP_AP_MAXLISTCOUNT,
+							DEFAULT_COUNT);
+	apparam = g_obex_apparam_set_uint16(apparam, MAP_AP_STARTOFFSET,
+							DEFAULT_OFFSET);
+
+	dbus_message_iter_next(&args);
+
+	if (parse_conversation_filters(apparam, &args) == NULL) {
+		g_obex_apparam_free(apparam);
+		return g_dbus_create_error(message,
+			ERROR_INTERFACE ".InvalidArguments", NULL);
+	}
+
+	/*TODO: Return conversation listing */
+	return NULL;
+}
+
 static char **get_filter_strs(uint64_t filter, int *size)
 {
 	char **list, **item;
@@ -1817,6 +1880,10 @@ static const GDBusMethodTable map_methods[] = {
 			GDBUS_ARGS({ "folder", "s" }, { "filter", "a{sv}" }),
 			GDBUS_ARGS({ "messages", "a{oa{sv}}" }),
 			map_list_messages) },
+	{ GDBUS_ASYNC_METHOD("ListConversations",
+			GDBUS_ARGS({ "folder", "s" }, { "filter", "a{sv}" }),
+			GDBUS_ARGS({ "conversations", "a{oa{sv}}" }),
+			map_list_conversations) },
 	{ GDBUS_METHOD("ListFilterFields",
 			NULL,
 			GDBUS_ARGS({ "fields", "as" }),
-- 
2.7.4

