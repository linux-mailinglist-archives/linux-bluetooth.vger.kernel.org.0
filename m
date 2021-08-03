Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B161E3DE84D
	for <lists+linux-bluetooth@lfdr.de>; Tue,  3 Aug 2021 10:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234613AbhHCIXm (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 3 Aug 2021 04:23:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234622AbhHCIXk (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 3 Aug 2021 04:23:40 -0400
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 141FAC06175F
        for <linux-bluetooth@vger.kernel.org>; Tue,  3 Aug 2021 01:23:29 -0700 (PDT)
Received: by mail-qv1-xf4a.google.com with SMTP id cb3-20020ad456230000b02903319321d1e3so16830888qvb.14
        for <linux-bluetooth@vger.kernel.org>; Tue, 03 Aug 2021 01:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=+YRk0e87Fy4+hULeH4RsY+6kkkKU8k2ny1F7i1QOpA0=;
        b=fg6BrFZgJqVidSZrBO+slDeUmCy3HECR+OOVBfjKjXOWT4+Hb0C1Pbp6fYfrjHsrY6
         4WMQzAqfUfiwJCKtpA7Szcv8puZ176b71H3CZziFTsZlxtXpC540vk8GCu/XSWAC0r9E
         6IFGNJ4JShGt8/eDQ5+Dmgj9nFo7OQVH0EkjVrvYKjjGDxyAUhV6a5SbEMLk2N/v5Mgz
         GuM97pGUtoZQc8hEEDW3cGYCRs3qtPiwqC9qjFTFw9jZ/bl3T6uFGr34ONDVh2QGUDHs
         JhFiXiBJFCXx7Eu86ud6HNIQaRVXATyw2rjiRh0XIEjXfSqsEUOT6wtlEK8KBkvdRpme
         fT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=+YRk0e87Fy4+hULeH4RsY+6kkkKU8k2ny1F7i1QOpA0=;
        b=jOvW0djBRsK0xB/vlNYTu3tNB2whDr32blcK3wMQCP4CI6GIPXHtVfsRsydX31JIvs
         sfKunBsFCch4fNoerHxrhKK13XQ7zGw1Wj32A/NXezn5pe2XXcX11oYd8Uu60sC9FkJ/
         WjEhd0ooy0KRE94n8RZxC+rslM917JhdctwJ2LtmlTwMft+/6KCQb33OET1o5vHdVpNB
         epDWqOWrUKHHqbMbOIx1PDEJvI//O7jDOyMEDv2dH9enK99D3Nkj+Y/5MmV3J7haafvN
         8Bl0lOtVqFyAq51LqfFcNunOZLyafg5CliSqwZUAsTmy/uo4YqENDyCCwi3T1mhxt4Ms
         ibvQ==
X-Gm-Message-State: AOAM530NUfKcT5qvdJCnq37cGd/HQ76zCkHXVF4RFA+inLSVMK0Vf6L5
        JJXUmC8kcCU9CdTlmPPOzOSnfWGaRrhWU1cpudsdftHzZ41CXeRWnluPrPST1Wv535BsRPWk0tf
        5wOn/2CJK2p7gLwEsPERIPiPQd7EwVW9QrbYZx+e4OaexXE4IjgWGKrNtgbuq1dk9sl+HjM6CYW
        rY6bqlnshPrY4=
X-Google-Smtp-Source: ABdhPJzkfEcEQLf4QLR9jL2jUyDZoagCI6gxb1ztRXnIq47wMiGZ2ups39/nLD0VbosMymRl7NvVw0B8apRtWJHw5g==
X-Received: from howardchung-p920.tpe.corp.google.com ([2401:fa00:1:10:ef55:8161:c77b:7a8d])
 (user=howardchung job=sendgmr) by 2002:ad4:4521:: with SMTP id
 l1mr20584127qvu.29.1627979008165; Tue, 03 Aug 2021 01:23:28 -0700 (PDT)
Date:   Tue,  3 Aug 2021 16:22:31 +0800
In-Reply-To: <20210803082237.723766-1-howardchung@google.com>
Message-Id: <20210803161319.Bluez.v8.7.Ifbb69dd6e371da3a914049a94615064479b9024b@changeid>
Mime-Version: 1.0
References: <20210803082237.723766-1-howardchung@google.com>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
Subject: [Bluez PATCH v8 07/13] plugins/admin: add ServiceAllowList method
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
   ["1108","110A","110B","110C","110D","110E",
   "110F","1112","111E","111F","1203"]
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

(no changes since v1)

 plugins/admin.c | 127 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 126 insertions(+), 1 deletion(-)

diff --git a/plugins/admin.c b/plugins/admin.c
index 923e08cb836b..1fe2904d93d9 100644
--- a/plugins/admin.c
+++ b/plugins/admin.c
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
@@ -40,19 +50,120 @@ static struct btd_admin_policy *admin_policy_new(struct btd_adapter *adapter)
 
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
+	const char *adapter_path;
+
 	if (policy_data) {
 		btd_warn(policy_data->adapter_id,
 						"Policy data already exists");
@@ -64,8 +175,20 @@ static int admin_policy_adapter_probe(struct btd_adapter *adapter)
 	if (!policy_data)
 		return -ENOMEM;
 
-	btd_info(policy_data->adapter_id, "Admin Policy has been enabled");
+	adapter_path = adapter_get_path(adapter);
 
+	if (!g_dbus_register_interface(dbus_conn, adapter_path,
+					ADMIN_POLICY_SET_INTERFACE,
+					admin_policy_adapter_methods, NULL,
+					NULL, policy_data, admin_policy_free)) {
+		btd_error(policy_data->adapter_id,
+			"Admin Policy Set interface init failed on path %s",
+								adapter_path);
+		return -EINVAL;
+	}
+
+	btd_info(policy_data->adapter_id,
+				"Admin Policy Set interface registered");
 	return 0;
 }
 
@@ -79,6 +202,8 @@ static int admin_init(void)
 {
 	DBG("");
 
+	dbus_conn = btd_get_dbus_connection();
+
 	return btd_register_adapter_driver(&admin_policy_driver);
 }
 
-- 
2.32.0.554.ge1b32706d8-goog

