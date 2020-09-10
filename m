Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48F60263C34
	for <lists+linux-bluetooth@lfdr.de>; Thu, 10 Sep 2020 06:42:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbgIJEme (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 10 Sep 2020 00:42:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbgIJEmd (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 10 Sep 2020 00:42:33 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 217EFC061573
        for <linux-bluetooth@vger.kernel.org>; Wed,  9 Sep 2020 21:42:33 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id f2so1546531pgd.3
        for <linux-bluetooth@vger.kernel.org>; Wed, 09 Sep 2020 21:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cCiSbDYma1JX3/ppPcLiSTD2+RUYqgnTWTodHKHNHqE=;
        b=haz1qVZbZPnEXsN4vQYhLRUjJ1awUzhiPmtGHk4kefBufO2kofSOwDWEoIhDrvjMOS
         9QcwjfS0hchJxP0M1fbyyXAFNXav/bHJs8XsA6tBggBWaxdd92bACCvuIw+z6BgzpPYy
         YNdNgJKaDhE2Px2vthIuBC+Yc758KHkTau7iI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cCiSbDYma1JX3/ppPcLiSTD2+RUYqgnTWTodHKHNHqE=;
        b=fFkoGCKFT0uEcLR9ICX1L7bn/489qqv7hrJIbcbaOJ7kgibM7yVWFWCNLKWcccV7gK
         6ha+o5q/j1o0JN1hT76RANTbbKIEHDzoByh598zQIXdfYQHJP9Cr4ohEZy38Riw/J+rj
         A78IZKK1Dd9NLyCgAKCdSQbzzbOvWr/DLH+J1EGLlx03G4inuaW7Dxyyt2x7eD7yZ9L9
         FEZeOD1ldg6l0Qb8LzuI/T7138iOYqMXe9Mp0lGr5ADRKf0TcOIk7bkCXkbe6uv479Q1
         QS3oU7hL+6HvOWaRKLz79tr7fhJy4dSjPYDWU99VjRo05kXSbk4SUWc3Ja3d0OmkKTkE
         N+bg==
X-Gm-Message-State: AOAM532onP6eoxXKgz5XcPHqmQ95SDf6op5O9h/YVk2iunpPkdnXU2c3
        k1uLgY4ne2MZt8WGXf5OXD2eh9ztFcjLEg==
X-Google-Smtp-Source: ABdhPJw4gSvDgjFgBIbep1jp+D2wrnyBjEACi53uG2IKMyHqsnkDZd4wh/Y4awB21qgonikD1Pt9QQ==
X-Received: by 2002:a63:a70d:: with SMTP id d13mr716383pgf.65.1599712950590;
        Wed, 09 Sep 2020 21:42:30 -0700 (PDT)
Received: from mcchou0.mtv.corp.google.com ([2620:15c:202:201:de4a:3eff:fe75:1314])
        by smtp.gmail.com with ESMTPSA id k4sm644888pjl.10.2020.09.09.21.42.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Sep 2020 21:42:29 -0700 (PDT)
From:   Miao-chen Chou <mcchou@chromium.org>
To:     Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>
Cc:     Manish Mandlik <mmandlik@chromium.org>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Howard Chung <howardchung@google.com>,
        Alain Michaud <alainm@chromium.org>,
        Miao-chen Chou <mcchou@chromium.org>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Subject: [BlueZ PATCH v3 3/7] adv_monitor: Implement RegisterMonitor()
Date:   Wed,  9 Sep 2020 21:41:28 -0700
Message-Id: <20200909214058.BlueZ.v3.3.I19ff9cdbd40fe453db0e81aec8bf94dd9490dce3@changeid>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200909214058.BlueZ.v3.1.I205718871f4e636958904f3cfb171cfd381c54b1@changeid>
References: <20200909214058.BlueZ.v3.1.I205718871f4e636958904f3cfb171cfd381c54b1@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This implements the RegisterMonitor() method handler of ADV monitor
manager interface.

The following tests were performed.
- Issue a RegisterMonitor() call with a valid path and expect a
success as return.
- Issue a RegisterMonitor() call with an invalid path and expect
org.bluez.Error.InvalidArguments as return.
- Issue two Registermonitor() calls with the same path and expect
org.bluez.Error.AlreadyExists.
- Verify the values of the registered paths with logging.
- Verify D-Bus disconnection callback was triggered when the client detach
from D-Bus.

Reviewed-by: Yun-Hao Chung <howardchung@google.com>
Reviewed-by: Manish Mandlik <mmandlik@chromium.org>
Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

(no changes since v2)

Changes in v2:
- Use new0() instead of g_new0()
- Remove the reset of app members

 src/adv_monitor.c | 164 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 163 insertions(+), 1 deletion(-)

diff --git a/src/adv_monitor.c b/src/adv_monitor.c
index 54e67bf2c..b8b55d2fc 100644
--- a/src/adv_monitor.c
+++ b/src/adv_monitor.c
@@ -22,7 +22,9 @@
 #endif
 
 #define _GNU_SOURCE
+#include <errno.h>
 #include <stdint.h>
+#include <string.h>
 
 #include <glib.h>
 #include <dbus/dbus.h>
@@ -34,7 +36,9 @@
 #include "adapter.h"
 #include "dbus-common.h"
 #include "log.h"
+#include "src/error.h"
 #include "src/shared/mgmt.h"
+#include "src/shared/queue.h"
 #include "src/shared/util.h"
 
 #include "adv_monitor.h"
@@ -52,12 +56,167 @@ struct btd_adv_monitor_manager {
 	uint16_t max_num_monitors;
 	uint8_t max_num_patterns;
 
+	struct queue *apps;	/* apps who registered for Adv monitoring */
 };
 
+struct adv_monitor_app {
+	struct btd_adv_monitor_manager *manager;
+	char *owner;
+	char *path;
+
+	DBusMessage *reg;
+	GDBusClient *client;
+};
+
+struct app_match_data {
+	const char *owner;
+	const char *path;
+};
+
+/* Replies to an app's D-Bus message and unref it */
+static void app_reply_msg(struct adv_monitor_app *app, DBusMessage *reply)
+{
+	if (!app || !app->reg || !reply)
+		return;
+
+	g_dbus_send_message(btd_get_dbus_connection(), reply);
+	dbus_message_unref(app->reg);
+	app->reg = NULL;
+}
+
+/* Destroys an app object along with related D-Bus handlers */
+static void app_destroy(void *data)
+{
+	struct adv_monitor_app *app = data;
+
+	if (!app)
+		return;
+
+	DBG("Destroy Adv Monitor app %s at path %s", app->owner, app->path);
+
+	if (app->reg) {
+		app_reply_msg(app, btd_error_failed(app->reg,
+						"Adv Monitor app destroyed"));
+	}
+
+	if (app->client) {
+		g_dbus_client_set_disconnect_watch(app->client, NULL, NULL);
+		g_dbus_client_set_proxy_handlers(app->client, NULL, NULL, NULL,
+							NULL);
+		g_dbus_client_set_ready_watch(app->client, NULL, NULL);
+		g_dbus_client_unref(app->client);
+	}
+
+	g_free(app->owner);
+	g_free(app->path);
+
+	free(app);
+}
+
+/* Handles a D-Bus disconnection event of an app */
+static void app_disconnect_cb(DBusConnection *conn, void *user_data)
+{
+	struct adv_monitor_app *app = user_data;
+
+	btd_info(app->manager->adapter_id, "Adv Monitor app %s disconnected "
+			"from D-Bus", app->owner);
+	if (app && queue_remove(app->manager->apps, app))
+		app_destroy(app);
+}
+
+/* Creates an app object, initiates it and sets D-Bus event handlers */
+static struct adv_monitor_app *app_create(DBusConnection *conn,
+					const char *sender, const char *path,
+					struct btd_adv_monitor_manager *manager)
+{
+	struct adv_monitor_app *app;
+
+	if (!path || !sender || !manager)
+		return NULL;
+
+	app = new0(struct adv_monitor_app, 1);
+	if (!app)
+		return NULL;
+
+	app->owner = g_strdup(sender);
+	app->path = g_strdup(path);
+	app->manager = manager;
+	app->reg = NULL;
+
+	app->client = g_dbus_client_new(conn, sender, path);
+	if (!app->client) {
+		app_destroy(app);
+		return NULL;
+	}
+
+	g_dbus_client_set_disconnect_watch(app->client, app_disconnect_cb, app);
+	g_dbus_client_set_proxy_handlers(app->client, NULL, NULL, NULL, NULL);
+	g_dbus_client_set_ready_watch(app->client, NULL, NULL);
+
+	return app;
+}
+
+/* Matches an app based on its owner and path */
+static bool app_match(const void *a, const void *b)
+{
+	const struct adv_monitor_app *app = a;
+	const struct app_match_data *match = b;
+
+	if (match->owner && strcmp(app->owner, match->owner))
+		return false;
+
+	if (match->path && strcmp(app->path, match->path))
+		return false;
+
+	return true;
+}
+
+/* Handles a RegisterMonitor D-Bus call */
+static DBusMessage *register_monitor(DBusConnection *conn, DBusMessage *msg,
+					void *user_data)
+{
+	DBusMessageIter args;
+	struct app_match_data match;
+	struct adv_monitor_app *app;
+	struct btd_adv_monitor_manager *manager = user_data;
+
+	if (!dbus_message_iter_init(msg, &args))
+		return btd_error_invalid_args(msg);
+
+	if (dbus_message_iter_get_arg_type(&args) != DBUS_TYPE_OBJECT_PATH)
+		return btd_error_invalid_args(msg);
+
+	dbus_message_iter_get_basic(&args, &match.path);
+
+	if (!strlen(match.path) || !g_str_has_prefix(match.path, "/"))
+		return btd_error_invalid_args(msg);
+
+	match.owner = dbus_message_get_sender(msg);
+
+	if (queue_find(manager->apps, app_match, &match))
+		return btd_error_already_exists(msg);
+
+	app = app_create(conn, match.owner, match.path, manager);
+	if (!app) {
+		btd_error(manager->adapter_id,
+				"Failed to reserve %s for Adv Monitor app %s",
+				match.path, match.owner);
+		return btd_error_failed(msg,
+					"Failed to create Adv Monitor app");
+	}
+
+	queue_push_tail(manager->apps, app);
+
+	btd_info(manager->adapter_id, "Path %s reserved for Adv Monitor app %s",
+			match.path, match.owner);
+
+	return dbus_message_new_method_return(msg);
+}
+
 static const GDBusMethodTable adv_monitor_methods[] = {
 	{ GDBUS_EXPERIMENTAL_METHOD("RegisterMonitor",
 					GDBUS_ARGS({ "application", "o" }),
-					NULL, NULL) },
+					NULL, register_monitor) },
 	{ GDBUS_EXPERIMENTAL_ASYNC_METHOD("UnregisterMonitor",
 					GDBUS_ARGS({ "application", "o" }),
 					NULL, NULL) },
@@ -157,6 +316,7 @@ static struct btd_adv_monitor_manager *manager_new(
 	manager->mgmt = mgmt_ref(mgmt);
 	manager->adapter_id = btd_adapter_get_index(adapter);
 	manager->path = g_strdup(adapter_get_path(manager->adapter));
+	manager->apps = queue_new();
 
 	return manager;
 }
@@ -167,6 +327,8 @@ static void manager_free(struct btd_adv_monitor_manager *manager)
 	mgmt_unref(manager->mgmt);
 	free(manager->path);
 
+	queue_destroy(manager->apps, app_destroy);
+
 	free(manager);
 }
 
-- 
2.26.2

