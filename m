Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2960C3BF581
	for <lists+linux-bluetooth@lfdr.de>; Thu,  8 Jul 2021 08:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbhGHG0i (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 8 Jul 2021 02:26:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229863AbhGHG0i (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 8 Jul 2021 02:26:38 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68BBEC061760
        for <linux-bluetooth@vger.kernel.org>; Wed,  7 Jul 2021 23:23:56 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id lb18-20020a17090b4a52b02901727f0a3730so2985325pjb.0
        for <linux-bluetooth@vger.kernel.org>; Wed, 07 Jul 2021 23:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=vyf95nCL7Sye+qsPxqCTZqDMucxaeaWHhZOvyy0owIM=;
        b=AhSRfzrZvMdTuDKAQVbH6S61F+/9PIVAGRBfkRs04QyAn93xqOE9gThwDQoy/9FPIV
         5gUSQr9EdXZzl3DIcLMEqAitLsd4e9kwxUA3/2VECefGqAzGRXrSuCDligGcahMtpKeI
         reuq0m2DzBku1QhkL9WAu4TdztWr60amwB9XhjTqT94jCW7Luf8txCZ/tedRKiiDPVwE
         hjSrKKPwK3nSsQbaGGEiiKVhMzjhud81aj179kkGH1/WGSzBnG2IrfwyIE7NV5yKn7fO
         JGP5EZNVWOJbbYEc3JvMscV4vrlz3jQu5ruMu0js50k/4in89cNCDnQvRQxZYre0gjxi
         Wl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=vyf95nCL7Sye+qsPxqCTZqDMucxaeaWHhZOvyy0owIM=;
        b=Tu41oadbAOvmujXkcLCtYbRmwJQyZ6nylHYP8EJ0QyU943aP4PkFMr3dHjRG102/UA
         Ft0f5MML6UWdxKHnibJWAVTimoW7wLLCQ6ffO3bNsloLB5NgFC+4BZwKUWXbMmiXrX0M
         5KtdSGjDYjP/fJ5J6ymZi2WiP7hcpu+QSMLgXlir8actsW9o7RVaBS+3EJXz21VBTXlF
         nnS3BUQxCXppVL5S3ifoSxTI9zcf/rkrDuzur+BzGqdgWch7/7V6J6IQrjjKhBJzOGHB
         12NPmRXxBYhmZswi+EBNS3DmZh9r0vkfn3D6L3HNKA2QZ7htBSSj8UQx6x0DVOS2H0GT
         AE0g==
X-Gm-Message-State: AOAM530xqUuNwOiddA6/ewf7uZOe01ahWoD0jvCw5bRuTsoLBQBwz0eM
        JodnTZO8ojIAPnHqGpPk5pe/7DiA+dMipHDD1FdHKF4PdEHfb30KGLydv9mlb4P/FOxlKySNtaQ
        +fabvoaeJiFmWJ5S4RtBaTpfQLJDb4f4Zu9kKKhdP4IplXkGkiEmMe+2cEtzGFuCyXK4HVyPTfg
        ohMSQZFa3gA94=
X-Google-Smtp-Source: ABdhPJw4cPPvcMC0nOhyo3G7gS2JMT96i5Iovl8L2UNLoj8vGp3ZG8bhIdKZNYJmZz3yqakqbcFV+pi+7ngMf1k4Dw==
X-Received: from howardchung-p920.tpe.corp.google.com ([2401:fa00:1:10:de70:7033:67f7:8d0b])
 (user=howardchung job=sendgmr) by 2002:a62:5285:0:b029:2e9:e0d5:67dc with
 SMTP id g127-20020a6252850000b02902e9e0d567dcmr29352694pfb.79.1625725435815;
 Wed, 07 Jul 2021 23:23:55 -0700 (PDT)
Date:   Thu,  8 Jul 2021 14:23:09 +0800
In-Reply-To: <20210708062314.245754-1-howardchung@google.com>
Message-Id: <20210708142059.Bluez.v1.9.Ifbb69dd6e371da3a914049a94615064479b9024b@changeid>
Mime-Version: 1.0
References: <20210708062314.245754-1-howardchung@google.com>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
Subject: [Bluez PATCH v1 09/14] plugins/admin_policy: add ServiceAllowList method
From:   Howard Chung <howardchung@google.com>
To:     linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
Cc:     Yun-Hao Chung <howardchung@chromium.org>,
        Miao-chen Chou <mcchou@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Yun-Hao Chung <howardchung@chromium.org>

This adds code to register interface org.bluez.AdminPolicySet1.
The interface will provide methods to limit users to operate certain
functions of bluez, such as allow/disallow user to taggle adapter power,
or only allow users to connect services in the specified list, etc.

This patch also implements ServiceAllowlist in
org.bluez.AdminPolicySet1.

Reviewed-by: Miao-chen Chou <mcchou@chromium.org>
---
The following test steps were performed:
1. Set ServiceAllowList to
   ["0x1108","0x110A","0x110B","0x110C","0x110D","0x110E",
   "0x110F","0x1112","0x111E","0x111F","0x1203"]
   ( users are only allowed to connect headset )
2. Turn on paired WF1000XM3, and listen music on Youtube.
3. Turn on paired K830 (LE device), press any key on keyboard.
4. Turn on paired Samsung Bluetooth Keyboard EE-BT550 (BREDR device),
   press any key on keyboard.
5. Set ServiceAllowList to
   ["1124","180A","180F","1812"]
   ( users are only allowed to connect HID devices )
6. Turn on paired WF1000XM3, and listen music on Youtube.
7. Turn on paired K830 (LE device), press any key on keyboard.
8. Turn on paired Samsung Bluetooth Keyboard EE-BT550 (BREDR device),
   press any key on keyboard.
9. Set ServiceAllowList to []
   ( users are only allowed to connect any device. )
10. Turn on paired WF1000XM3, and listen music on Youtube.
11. Turn on paired K830 (LE device), press any key on keyboard.
12. Turn on paired Samsung Bluetooth Keyboard EE-BT550 (BREDR device),
   press any key on keyboard.

Expected results:
Step 2,7,8,9,10,11 should success, and step 3,4,6 should fail.

 plugins/admin_policy.c | 123 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 122 insertions(+), 1 deletion(-)

diff --git a/plugins/admin_policy.c b/plugins/admin_policy.c
index 2ece871564e6..242b8d5dacb0 100644
--- a/plugins/admin_policy.c
+++ b/plugins/admin_policy.c
@@ -12,19 +12,29 @@
 #include <config.h>
 #endif
 
+#include <dbus/dbus.h>
+#include <gdbus/gdbus.h>
+
 #include "lib/bluetooth.h"
+#include "lib/uuid.h"
 
 #include "src/adapter.h"
+#include "src/dbus-common.h"
 #include "src/error.h"
 #include "src/log.h"
 #include "src/plugin.h"
 
 #include "src/shared/queue.h"
 
+#define ADMIN_POLICY_SET_INTERFACE	"org.bluez.AdminPolicySet1"
+
+static DBusConnection *dbus_conn;
+
 /* |policy_data| has the same life cycle as btd_adapter */
 static struct btd_admin_policy {
 	struct btd_adapter *adapter;
 	uint16_t adapter_id;
+	struct queue *service_allowlist;
 } *policy_data = NULL;
 
 static struct btd_admin_policy *admin_policy_new(struct btd_adapter *adapter)
@@ -40,17 +50,116 @@ static struct btd_admin_policy *admin_policy_new(struct btd_adapter *adapter)
 
 	admin_policy->adapter = adapter;
 	admin_policy->adapter_id = btd_adapter_get_index(adapter);
+	admin_policy->service_allowlist = NULL;
 
 	return admin_policy;
 }
 
+static void free_service_allowlist(struct queue *q)
+{
+	queue_destroy(q, g_free);
+}
+
 static void admin_policy_free(void *data)
 {
 	struct btd_admin_policy *admin_policy = data;
 
+	free_service_allowlist(admin_policy->service_allowlist);
 	g_free(admin_policy);
 }
 
+static struct queue *parse_allow_service_list(struct btd_adapter *adapter,
+							DBusMessage *msg)
+{
+	DBusMessageIter iter, arr_iter;
+	struct queue *uuid_list = NULL;
+
+	dbus_message_iter_init(msg, &iter);
+	if (dbus_message_iter_get_arg_type(&iter) != DBUS_TYPE_ARRAY)
+		return NULL;
+
+	uuid_list = queue_new();
+	dbus_message_iter_recurse(&iter, &arr_iter);
+	do {
+		const int type = dbus_message_iter_get_arg_type(&arr_iter);
+		char *uuid_param;
+		bt_uuid_t *uuid;
+
+		if (type == DBUS_TYPE_INVALID)
+			break;
+
+		if (type != DBUS_TYPE_STRING)
+			goto failed;
+
+		dbus_message_iter_get_basic(&arr_iter, &uuid_param);
+
+		uuid = g_try_malloc(sizeof(*uuid));
+		if (!uuid)
+			goto failed;
+
+		if (bt_string_to_uuid(uuid, uuid_param)) {
+			g_free(uuid);
+			goto failed;
+		}
+
+		queue_push_head(uuid_list, uuid);
+
+		dbus_message_iter_next(&arr_iter);
+	} while (true);
+
+	return uuid_list;
+
+failed:
+	queue_destroy(uuid_list, g_free);
+	return NULL;
+}
+
+static bool service_allowlist_set(struct btd_admin_policy *admin_policy,
+							struct queue *uuid_list)
+{
+	struct btd_adapter *adapter = admin_policy->adapter;
+
+	if (!btd_adapter_set_allowed_uuids(adapter, uuid_list))
+		return false;
+
+	free_service_allowlist(admin_policy->service_allowlist);
+	admin_policy->service_allowlist = uuid_list;
+
+	return true;
+}
+
+static DBusMessage *set_service_allowlist(DBusConnection *conn,
+					DBusMessage *msg, void *user_data)
+{
+	struct btd_admin_policy *admin_policy = user_data;
+	struct btd_adapter *adapter = admin_policy->adapter;
+	struct queue *uuid_list = NULL;
+	const char *sender = dbus_message_get_sender(msg);
+
+	DBG("sender %s", sender);
+
+	/* Parse parameters */
+	uuid_list = parse_allow_service_list(adapter, msg);
+	if (!uuid_list) {
+		btd_error(admin_policy->adapter_id,
+				"Failed on parsing allowed service list");
+		return btd_error_invalid_args(msg);
+	}
+
+	if (!service_allowlist_set(admin_policy, uuid_list)) {
+		free_service_allowlist(uuid_list);
+		return btd_error_failed(msg, "service_allowlist_set failed");
+	}
+
+	return dbus_message_new_method_return(msg);
+}
+
+static const GDBusMethodTable admin_policy_adapter_methods[] = {
+	{ GDBUS_METHOD("SetServiceAllowList", GDBUS_ARGS({ "UUIDs", "as" }),
+						NULL, set_service_allowlist) },
+	{ }
+};
+
 static int admin_policy_adapter_probe(struct btd_adapter *adapter)
 {
 	if (policy_data) {
@@ -64,8 +173,18 @@ static int admin_policy_adapter_probe(struct btd_adapter *adapter)
 	if (!policy_data)
 		return -ENOMEM;
 
-	btd_info(policy_data->adapter_id, "Admin Policy has been enabled");
+	if (!g_dbus_register_interface(dbus_conn, adapter_get_path(adapter),
+					ADMIN_POLICY_SET_INTERFACE,
+					admin_policy_adapter_methods, NULL,
+					NULL, policy_data, admin_policy_free)) {
+		btd_error(policy_data->adapter_id,
+			"Admin Policy Set interface init failed on path %s",
+						adapter_get_path(adapter));
+		return -EINVAL;
+	}
 
+	btd_info(policy_data->adapter_id,
+				"Admin Policy Set interface registered");
 	return 0;
 }
 
@@ -79,6 +198,8 @@ static int admin_policy_init(void)
 {
 	DBG("");
 
+	dbus_conn = btd_get_dbus_connection();
+
 	return btd_register_adapter_driver(&admin_policy_driver);
 }
 
-- 
2.32.0.93.g670b81a890-goog

