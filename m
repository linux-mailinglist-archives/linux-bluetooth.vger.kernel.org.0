Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE7943D9FEE
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jul 2021 10:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235209AbhG2I54 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 29 Jul 2021 04:57:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235347AbhG2I5z (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 29 Jul 2021 04:57:55 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DE46C0613C1
        for <linux-bluetooth@vger.kernel.org>; Thu, 29 Jul 2021 01:57:51 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id q3-20020a25bfc30000b02905592911c932so5387469ybm.15
        for <linux-bluetooth@vger.kernel.org>; Thu, 29 Jul 2021 01:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=8kh0kYIyDfN7IZp2L3gpiT2YN98Q7N2b0Om3iMdzQt4=;
        b=MTcojRoY+wz3AkR+Nmp/vgn5lVkxdAlqfXc8eWrCF9fffF4OYHLdLzU7yi5I5JmGJ9
         B+ORNHG0QAI4DOFPKA+/dEOK/SVFMK7Lwqz/jxb1Mqz4uuSFEoJlI652KA6PEsy9C1DX
         whhcZ3DF5rF+AYsF/yXNalbnNmpQkr8dvqn30twGHtF6BrLtqMWUoQcN+8JDA8G0eDNo
         B7HOZ91tO9ijiYepPDIXOY1afqfwKlGIPGU66PHdnGKvCoECYxfrspRH/c2PK/VuTwsu
         OckW6rWTM1KGbquUdUhcW5oaWmdpscZVp5o/SOn1OEYfaYvbe7XK02myKF9jEIqchXh0
         yBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=8kh0kYIyDfN7IZp2L3gpiT2YN98Q7N2b0Om3iMdzQt4=;
        b=MCKzLqLXvTF6MdaXb6O3Ghhe+sbvwrkSkqtRHqui6xec6EToqkrPH7hi10aEghvq9+
         a6P2oZ1vDEHOIqNDEWBfhNOwUyk47td3VlKmuXEJEf4nW4P95FwBF2vBrFz3q8L5mNDq
         S+pxV/3OsPgkgjDCsanrXNM7+i0NVS12gLClP3YbFRe7R2H8TdDxX2Y+dJ+1pmFpSqRz
         Qu85VBBwDVjvEFQHRq5dz6QKrir3yb6+LIpA0xzr1nF32bCbWv/ORFwTk1gXU161W6cV
         JDhg2mtnN9AGEeYYShk1KEF73L1WfJJduWWpBo3CER2YZnCGnSSl3XzkZbeKTKxst9Aw
         ya0w==
X-Gm-Message-State: AOAM531wGOQsEebAPYna2Mz1X0P6ZH2ccMJ/KN6dnbsaREO/jn1lJ3dz
        cXPVTWGJyFi+1NjkE1E5lG4GRIxs1O3cdQKd8fIgn/wbaFlfGIyhCgkE4uJolSsOUkSdQgvWpb1
        qKL/wE1VoWYlUHuR4fQHDcQahGCTd6FMkaApmrtGDSGa65tWHHy5Z3NPZwWYxAlXwSZoLe+4fo1
        jcxboXxCDdNQE=
X-Google-Smtp-Source: ABdhPJxc3wJGIVa6ZVzv7lrInY8ei6yST/DmYoVE3G/rYzSJRI57PXduiYYQMDiMAI7fxqAMP99XVYruPJU3aETNKw==
X-Received: from howardchung-p920.tpe.corp.google.com ([2401:fa00:1:10:ff72:1420:4502:fdaf])
 (user=howardchung job=sendgmr) by 2002:a25:1455:: with SMTP id
 82mr5178945ybu.403.1627549070440; Thu, 29 Jul 2021 01:57:50 -0700 (PDT)
Date:   Thu, 29 Jul 2021 16:56:48 +0800
In-Reply-To: <20210729085651.3600926-1-howardchung@google.com>
Message-Id: <20210729165211.Bluez.v5.10.I517e5199ac8019b770c7ee8c92a294ec1c752748@changeid>
Mime-Version: 1.0
References: <20210729085651.3600926-1-howardchung@google.com>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
Subject: [Bluez PATCH v5 10/13] plugins/admin: add device callbacks
From:   Howard Chung <howardchung@google.com>
To:     linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
Cc:     Yun-Hao Chung <howardchung@chromium.org>,
        Miao-chen Chou <mcchou@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Yun-Hao Chung <howardchung@chromium.org>

This adds callbacks for device added and device removed. It is
necessary for implementation of "AffectedByPolicy" property since it
needs to register an interface for each device object and unregister it
once the device gets removed.

Reviewed-by: Miao-chen Chou <mcchou@chromium.org>
---
The following test steps were performed:
1. start discovery using UI
2. verify device_data were added by checking system log
3. stop discovery
4. verify device_data were removed after a few seconds by checking
system log

(no changes since v1)

 plugins/admin.c | 78 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/plugins/admin.c b/plugins/admin.c
index d89a77c8a123..37dae77ac448 100644
--- a/plugins/admin.c
+++ b/plugins/admin.c
@@ -20,6 +20,7 @@
 
 #include "src/adapter.h"
 #include "src/dbus-common.h"
+#include "src/device.h"
 #include "src/error.h"
 #include "src/log.h"
 #include "src/plugin.h"
@@ -29,7 +30,11 @@
 #define ADMIN_POLICY_SET_INTERFACE	"org.bluez.AdminPolicySet1"
 #define ADMIN_POLICY_STATUS_INTERFACE	"org.bluez.AdminPolicyStatus1"
 
+#define DBUS_BLUEZ_SERVICE		"org.bluez"
+#define BTD_DEVICE_INTERFACE		"org.bluez.Device1"
+
 static DBusConnection *dbus_conn;
+static struct queue *devices; /* List of struct device_data objects */
 
 /* |policy_data| has the same life cycle as btd_adapter */
 static struct btd_admin_policy {
@@ -38,6 +43,11 @@ static struct btd_admin_policy {
 	struct queue *service_allowlist;
 } *policy_data = NULL;
 
+struct device_data {
+	struct btd_device *device;
+	char *path;
+};
+
 static struct btd_admin_policy *admin_policy_new(struct btd_adapter *adapter)
 {
 	struct btd_admin_policy *admin_policy = NULL;
@@ -203,6 +213,37 @@ static const GDBusPropertyTable admin_policy_adapter_properties[] = {
 	{ }
 };
 
+static bool device_data_match(const void *a, const void *b)
+{
+	const struct device_data *data = a;
+	const struct btd_device *dev = b;
+
+	if (!data) {
+		error("Unexpected NULL device_data");
+		return false;
+	}
+
+	return data->device == dev;
+}
+
+static void free_device_data(void *data)
+{
+	struct device_data *device_data = data;
+
+	g_free(device_data->path);
+	g_free(device_data);
+}
+
+static void remove_device_data(void *data)
+{
+	struct device_data *device_data = data;
+
+	DBG("device_data for %s removing", device_data->path);
+
+	queue_remove(devices, device_data);
+	free_device_data(device_data);
+}
+
 static int admin_policy_adapter_probe(struct btd_adapter *adapter)
 {
 	const char *adapter_path;
@@ -250,10 +291,45 @@ static int admin_policy_adapter_probe(struct btd_adapter *adapter)
 	return 0;
 }
 
+static void admin_policy_device_added(struct btd_adapter *adapter,
+						struct btd_device *device)
+{
+	struct device_data *data;
+
+	if (queue_find(devices, device_data_match, device))
+		return;
+
+	data = g_new0(struct device_data, 1);
+	if (!data) {
+		btd_error(btd_adapter_get_index(adapter),
+				"Failed to allocate memory for device_data");
+		return;
+	}
+
+	data->device = device;
+	data->path = g_strdup(device_get_path(device));
+	queue_push_tail(devices, data);
+
+	DBG("device_data for %s added", data->path);
+}
+
+static void admin_policy_device_removed(struct btd_adapter *adapter,
+						struct btd_device *device)
+{
+	struct device_data *data;
+
+	data = queue_find(devices, device_data_match, device);
+
+	if (data)
+		remove_device_data(data);
+}
+
 static struct btd_adapter_driver admin_policy_driver = {
 	.name	= "admin_policy",
 	.probe	= admin_policy_adapter_probe,
 	.resume = NULL,
+	.device_added = admin_policy_device_added,
+	.device_removed = admin_policy_device_removed
 };
 
 static int admin_init(void)
@@ -261,6 +337,7 @@ static int admin_init(void)
 	DBG("");
 
 	dbus_conn = btd_get_dbus_connection();
+	devices = queue_new();
 
 	return btd_register_adapter_driver(&admin_policy_driver);
 }
@@ -270,6 +347,7 @@ static void admin_exit(void)
 	DBG("");
 
 	btd_unregister_adapter_driver(&admin_policy_driver);
+	queue_destroy(devices, free_device_data);
 
 	if (policy_data)
 		admin_policy_free(policy_data);
-- 
2.32.0.554.ge1b32706d8-goog

