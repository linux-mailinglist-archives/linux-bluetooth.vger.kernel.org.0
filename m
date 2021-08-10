Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 255CF3DD05C
	for <lists+linux-bluetooth@lfdr.de>; Mon,  2 Aug 2021 08:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232196AbhHBGNj (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 2 Aug 2021 02:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232182AbhHBGNj (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 2 Aug 2021 02:13:39 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 873B9C06175F
        for <linux-bluetooth@vger.kernel.org>; Sun,  1 Aug 2021 23:13:29 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id j21-20020a25d2150000b029057ac4b4e78fso17959799ybg.4
        for <linux-bluetooth@vger.kernel.org>; Sun, 01 Aug 2021 23:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=AODxBjZj+nI2kbzDyMsrX+mfmhxGjROcT4no+1E+pG8=;
        b=XZTYlyWRfgeBM/P7p+UR9bvyD80okXPD0kPclGFWBV3JvtaRWTpUAAj5l5EsAeUnYd
         bAn1Mxi2Wco/ZuVRcoKf8EhGXUwxw2jCWlUfgmjKxgHj+h1smwtSC2JCX8IsUdaaYRjK
         0RHRwlbTsVc7TRP4jMIsB7IW/H1MRwJjFNCGgF6o+J8DLN/qAetQk+j5nkQOy3C7jlFQ
         ZGew/XtiT9IIVregYuNT0Wb7URrRP2umcrJlSwn5gbnoNssfuSUpIuqtxt+nD6f1Ukc1
         GdFh7rI1DBhkGazImFkfBb4pv7Zc7FcM7+VF7z0HMFpDzaDxjM9GU5ZUgrfVb8yksA6/
         c/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=AODxBjZj+nI2kbzDyMsrX+mfmhxGjROcT4no+1E+pG8=;
        b=J+PgPEml1Vtimo+kkOv/gN1iXaR7rlyZl12yl3FcwtaG71cEly9U1bxjCX3dpTIjrg
         tRNCauinExpDL91jLl3HSuhHSVPFxGlY7S4KHMhgkI3UdFFYwKSJMu7xvq32YqDkcptl
         csBZicHAyKos9IGIN4n7IBqhZc9awf05xbLjv4H6cI4sFoNmH83RuV4Zt3q9djOYZamG
         8SLSLFoeXRmZ6zSD69n8Kr7GjtTgMDjXkSSlEGMP4Hqv601KmrZcccpFugd5+Dc0xD43
         My5O5PuDK/ZoLVqe7hUlw1uNA7hr9TGySOnq6A+H6SkTzY1Vi8cFKN06JSYbnbP10Z9l
         RIGw==
X-Gm-Message-State: AOAM5310/MWGya68gScnKVOvK/WyfwbXm624pU4+Avx7hlqR307r1vOT
        oIA4ZeDid4fKJsEfMzK5XG/VDrXd2jELElQAuiAYFmwElLwTHzreA3QKd9RwR+4TjAjqMXVz67e
        LDypDPtL3c7IyNo3o5EyGOI6g8RwP5Bt4+Uon/3AGdD3Au9lNLQ/Jj4TmCwlcX9QgtS1XAVGaJ0
        C2AwpSei3JBOg=
X-Google-Smtp-Source: ABdhPJzUAIrtJII8ia9OsAGRrt+yooAci47uut+fAXZHMcZsPT/f2RbSn49UkDoNYjb0QzkHkjSd5rCTa5fNIjoKSg==
X-Received: from howardchung-p920.tpe.corp.google.com ([2401:fa00:1:10:9f82:5515:89:f2cb])
 (user=howardchung job=sendgmr) by 2002:a25:2a8e:: with SMTP id
 q136mr19843192ybq.337.1627884808759; Sun, 01 Aug 2021 23:13:28 -0700 (PDT)
Date:   Mon,  2 Aug 2021 14:12:46 +0800
In-Reply-To: <20210802061250.170975-1-howardchung@google.com>
Message-Id: <20210802141140.Bluez.v7.9.I00fd6c348e4c93501de6de0eae0d23436fd3895b@changeid>
Mime-Version: 1.0
References: <20210802061250.170975-1-howardchung@google.com>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
Subject: [Bluez PATCH v7 09/13] plugins/admin: add ServiceAllowList property
From:   Howard Chung <howardchung@google.com>
To:     linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
Cc:     Yun-Hao Chung <howardchung@chromium.org>,
        Miao-chen Chou <mcchou@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Yun-Hao Chung <howardchung@chromium.org>

This adds code to register interface org.bluez.AdminPolicyStatus.
The interface will provide read-only properties to indicate the current
settings of admin policies. We separate this from AdminPolicySet so that
normal clients can check current policy settings while only a few
clients can change policies.

This patch also adds readonly property ServiceAllowlist to
AdminPolicyStatus1, which indicates the current setting of service
allowlist.

Reviewed-by: Miao-chen Chou <mcchou@chromium.org>
---
The following test steps were performed:
1. Set ServiceAllowList to ["1124","180A","180F","1812"]
2. Verify ServiceAllowList is ["1124","180A","180F","1812"] in UUID-128
   form
3. Set ServiceAllowList to []
4. Verify ServiceAllowList is []

(no changes since v1)

 plugins/admin.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/plugins/admin.c b/plugins/admin.c
index 1fe2904d93d9..d89a77c8a123 100644
--- a/plugins/admin.c
+++ b/plugins/admin.c
@@ -27,6 +27,7 @@
 #include "src/shared/queue.h"
 
 #define ADMIN_POLICY_SET_INTERFACE	"org.bluez.AdminPolicySet1"
+#define ADMIN_POLICY_STATUS_INTERFACE	"org.bluez.AdminPolicyStatus1"
 
 static DBusConnection *dbus_conn;
 
@@ -151,6 +152,11 @@ static DBusMessage *set_service_allowlist(DBusConnection *conn,
 		return btd_error_failed(msg, "service_allowlist_set failed");
 	}
 
+	g_dbus_emit_property_changed(dbus_conn,
+					adapter_get_path(policy_data->adapter),
+					ADMIN_POLICY_STATUS_INTERFACE,
+					"ServiceAllowList");
+
 	return dbus_message_new_method_return(msg);
 }
 
@@ -160,6 +166,43 @@ static const GDBusMethodTable admin_policy_adapter_methods[] = {
 	{ }
 };
 
+void append_service_uuid(void *data, void *user_data)
+{
+	bt_uuid_t *uuid = data;
+	DBusMessageIter *entry = user_data;
+	char uuid_str[MAX_LEN_UUID_STR];
+	const char *uuid_str_ptr = uuid_str;
+
+	if (!uuid) {
+		error("Unexpected NULL uuid data in service_allowlist");
+		return;
+	}
+
+	bt_uuid_to_string(uuid, uuid_str, MAX_LEN_UUID_STR);
+	dbus_message_iter_append_basic(entry, DBUS_TYPE_STRING, &uuid_str_ptr);
+}
+
+static gboolean property_get_service_allowlist(
+					const GDBusPropertyTable *property,
+					DBusMessageIter *iter, void *user_data)
+{
+	struct btd_admin_policy *admin_policy = user_data;
+	DBusMessageIter entry;
+
+	dbus_message_iter_open_container(iter, DBUS_TYPE_ARRAY,
+					DBUS_TYPE_STRING_AS_STRING, &entry);
+	queue_foreach(admin_policy->service_allowlist, append_service_uuid,
+									&entry);
+	dbus_message_iter_close_container(iter, &entry);
+
+	return TRUE;
+}
+
+static const GDBusPropertyTable admin_policy_adapter_properties[] = {
+	{ "ServiceAllowList", "as", property_get_service_allowlist },
+	{ }
+};
+
 static int admin_policy_adapter_probe(struct btd_adapter *adapter)
 {
 	const char *adapter_path;
@@ -189,6 +232,21 @@ static int admin_policy_adapter_probe(struct btd_adapter *adapter)
 
 	btd_info(policy_data->adapter_id,
 				"Admin Policy Set interface registered");
+
+	if (!g_dbus_register_interface(dbus_conn, adapter_path,
+					ADMIN_POLICY_STATUS_INTERFACE,
+					NULL, NULL,
+					admin_policy_adapter_properties,
+					policy_data, admin_policy_free)) {
+		btd_error(policy_data->adapter_id,
+			"Admin Policy Status interface init failed on path %s",
+								adapter_path);
+		return -EINVAL;
+	}
+
+	btd_info(policy_data->adapter_id,
+				"Admin Policy Status interface registered");
+
 	return 0;
 }
 
-- 
2.32.0.554.ge1b32706d8-goog

