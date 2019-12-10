Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3961186AB
	for <lists+linux-bluetooth@lfdr.de>; Tue, 10 Dec 2019 12:41:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727504AbfLJLlY (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 10 Dec 2019 06:41:24 -0500
Received: from mga07.intel.com ([134.134.136.100]:28846 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727116AbfLJLlY (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 10 Dec 2019 06:41:24 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Dec 2019 03:41:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,299,1571727600"; 
   d="scan'208";a="210420796"
Received: from unknown (HELO ajay-desktop.iind.intel.com) ([10.223.96.133])
  by fmsmga008.fm.intel.com with ESMTP; 10 Dec 2019 03:41:23 -0800
From:   Ajay Kishore <ajay.kishore@intel.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH 3/5] obexd: Get conversation listings
Date:   Tue, 10 Dec 2019 16:46:59 +0530
Message-Id: <1575976621-11019-3-git-send-email-ajay.kishore@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575976621-11019-1-git-send-email-ajay.kishore@intel.com>
References: <1575976621-11019-1-git-send-email-ajay.kishore@intel.com>
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Changes made to build get conversation listing command and its
respective callback function to handle response for conversation
listing.

Co-authored-by: Bharat Bhusan Panda <bharat.b.panda@intel.com>
Signed-off-by: Ajay Kishore <ajay.kishore@intel.com>
---
 obexd/client/map.c | 98 ++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 96 insertions(+), 2 deletions(-)

diff --git a/obexd/client/map.c b/obexd/client/map.c
index 9464606..f2f2b73 100644
--- a/obexd/client/map.c
+++ b/obexd/client/map.c
@@ -1222,6 +1222,64 @@ clean:
 	pending_request_free(request);
 }
 
+static void conversation_listing_cb(struct obc_session *session,
+						struct obc_transfer *transfer,
+						GError *err, void *user_data)
+{
+	struct pending_request *request = user_data;
+	struct map_parser *parser;
+	GMarkupParseContext *ctxt;
+	DBusMessage *reply;
+	DBusMessageIter iter, array;
+	char *contents;
+	size_t size;
+	int perr;
+
+	if (err != NULL) {
+		reply = g_dbus_create_error(request->msg,
+						ERROR_INTERFACE ".Failed",
+						"%s", err->message);
+		goto done;
+	}
+
+	perr = obc_transfer_get_contents(transfer, &contents, &size);
+	if (perr < 0) {
+		reply = g_dbus_create_error(request->msg,
+						ERROR_INTERFACE ".Failed",
+						"Error reading contents: %s",
+						strerror(-perr));
+		goto done;
+	}
+
+	reply = dbus_message_new_method_return(request->msg);
+	if (reply == NULL) {
+		g_free(contents);
+		goto clean;
+	}
+
+	dbus_message_iter_init_append(reply, &iter);
+	dbus_message_iter_open_container(&iter, DBUS_TYPE_ARRAY,
+					DBUS_DICT_ENTRY_BEGIN_CHAR_AS_STRING
+					DBUS_TYPE_OBJECT_PATH_AS_STRING
+					DBUS_TYPE_ARRAY_AS_STRING
+					DBUS_DICT_ENTRY_BEGIN_CHAR_AS_STRING
+					DBUS_TYPE_STRING_AS_STRING
+					DBUS_TYPE_VARIANT_AS_STRING
+					DBUS_DICT_ENTRY_END_CHAR_AS_STRING
+					DBUS_DICT_ENTRY_END_CHAR_AS_STRING,
+					&array);
+
+	dbus_message_iter_close_container(&iter, &array);
+	g_free(contents);
+
+done:
+	if (convo_element_end)
+		if (g_dbus_send_message(conn, reply))
+			convo_element_end = FALSE;
+clean:
+	pending_request_free(request);
+}
+
 static char *get_absolute_folder(struct map_data *map, const char *subfolder)
 {
 	const char *root = obc_session_get_folder(map->session);
@@ -1270,6 +1328,43 @@ fail:
 	return reply;
 }
 
+static DBusMessage *get_conversations_listing(struct map_data *map,
+							DBusMessage *message,
+							const char *folder,
+							GObexApparam *apparam)
+{
+	struct pending_request *request;
+	struct obc_transfer *transfer;
+	GError *err = NULL;
+	DBusMessage *reply;
+
+	transfer = obc_transfer_get("x-bt/MAP-convo-listing", folder, NULL,
+									&err);
+
+	if (transfer == NULL) {
+		g_obex_apparam_free(apparam);
+		goto fail;
+	}
+	obc_transfer_set_apparam(transfer, apparam);
+
+	request = pending_request_new(map, message);
+	request->folder = get_absolute_folder(map, folder);
+
+	if (!obc_session_queue(map->session, transfer,
+				conversation_listing_cb, request, &err)) {
+		pending_request_free(request);
+		goto fail;
+	}
+
+	return NULL;
+
+fail:
+	reply = g_dbus_create_error(message, ERROR_INTERFACE ".Failed", "%s",
+								err->message);
+	g_error_free(err);
+	return reply;
+}
+
 static GObexApparam *parse_subject_length(GObexApparam *apparam,
 							DBusMessageIter *iter)
 {
@@ -1682,8 +1777,7 @@ static DBusMessage *map_list_conversations(DBusConnection *connection,
 			ERROR_INTERFACE ".InvalidArguments", NULL);
 	}
 
-	/*TODO: Return conversation listing */
-	return NULL;
+	return get_conversations_listing(map, message, folder, apparam);
 }
 
 static char **get_filter_strs(uint64_t filter, int *size)
-- 
2.7.4

