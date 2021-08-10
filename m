Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0A03DEC8C
	for <lists+linux-bluetooth@lfdr.de>; Tue,  3 Aug 2021 13:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235751AbhHCLoi (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 3 Aug 2021 07:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235852AbhHCLoI (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 3 Aug 2021 07:44:08 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 309D4C0613D5
        for <linux-bluetooth@vger.kernel.org>; Tue,  3 Aug 2021 04:43:56 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id e16-20020ac867100000b0290257b7db4a28so12800241qtp.9
        for <linux-bluetooth@vger.kernel.org>; Tue, 03 Aug 2021 04:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=AODxBjZj+nI2kbzDyMsrX+mfmhxGjROcT4no+1E+pG8=;
        b=ZGN1qveF9rdp1tByaWVQLN3Fo29KP4WbbR86taL9PPGZZO2lLf/aGjadh+W6cBhxzg
         hSfzPQjHeJqYnu77Vxit8X6CF/Rt8LTX6WJ/gtyC1//0Kq0eb92KO9/N/DxCB19CY80u
         GDyLbXM6MI0SeWTFiPqe6AsGQmszU1GX30PEhJhtwGRVSw12f/rQuhxUZVLWFYvrTmof
         VQlu+0ujBLTs/fqR3EzXrbCaJIsmBz5gqqazPgWU9uJwu8tugCV6hXX52EAB3Xf28jhC
         4P0YlJNolZIIIpmNes5ZU2qs6DuQv9j0IkinWM1ipKqFOkIojaQKabZXlNjIb0SLX9DY
         XCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=AODxBjZj+nI2kbzDyMsrX+mfmhxGjROcT4no+1E+pG8=;
        b=fzmu3rgnklO4hV8L5K/kvqn/uMTVMFCHfQOEuPW20SySKlxYZVeTvbGy20nasn31V9
         ztcYZFkq/Nv0jRs8kWAozEN+yg0P/+6bAWOBodEAqVb6+VVVvZOagT4Yyj6g0VFPAA+T
         h1QeIX2xtGur5eiXcRAyRIkgaIkrCE0uZ9r2ktNj122KvG5C/QSoKWUiZyy8k1+UnRMi
         /8k6eDldrpp88f5fM8rjP8qd38EApB8fPcjlqJXlU05MqS7b5FzG4RUp1/+Jt+9CYmXm
         K9BmqOW7v8yKtJf36UrvK0BhRkzdu6q0JvoslRdmSuEyBTVx3HsH7WzSby187dvyUypo
         80PA==
X-Gm-Message-State: AOAM5302bYZP9BfCtlyPPjXncrrdp8ior39fmGouNY7xEJ6EBoOP+1yN
        4ZpRiT/nb2exyxLmnZAKRNvYCkh/GetGNzcNZ2C0znNPV9pF2AAnUP3ehVoxvkEce6kMcj5Wx2K
        a7cx9en3hNB7ek1iyBlrmzxZbWrzx42+3jdGpjtUKrY4//jeHq4dW4b8OuPsQTBmLrkQCSFtov6
        GCfCVwb3Impz4=
X-Google-Smtp-Source: ABdhPJwNwE1SsXxrN1MZm0xn7yehZVPGxhT++chToWL/sxbZBjrkQxLhWLXbGNpwpNU/Ik2vXjeyWJlS2rZ8Y02YhA==
X-Received: from howardchung-p920.tpe.corp.google.com ([2401:fa00:1:10:ef55:8161:c77b:7a8d])
 (user=howardchung job=sendgmr) by 2002:a05:6214:1c47:: with SMTP id
 if7mr20848610qvb.6.1627991035368; Tue, 03 Aug 2021 04:43:55 -0700 (PDT)
Date:   Tue,  3 Aug 2021 19:43:12 +0800
In-Reply-To: <20210803114317.801840-1-howardchung@google.com>
Message-Id: <20210803194127.Bluez.v9.8.I00fd6c348e4c93501de6de0eae0d23436fd3895b@changeid>
Mime-Version: 1.0
References: <20210803114317.801840-1-howardchung@google.com>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
Subject: [Bluez PATCH v9 08/13] plugins/admin: add ServiceAllowList property
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

