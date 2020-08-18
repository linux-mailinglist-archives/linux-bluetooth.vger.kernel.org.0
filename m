Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAD412490D5
	for <lists+linux-bluetooth@lfdr.de>; Wed, 19 Aug 2020 00:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726967AbgHRW31 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 18 Aug 2020 18:29:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbgHRW30 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 18 Aug 2020 18:29:26 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7DF4C061389
        for <linux-bluetooth@vger.kernel.org>; Tue, 18 Aug 2020 15:29:26 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id t11so9882448plr.5
        for <linux-bluetooth@vger.kernel.org>; Tue, 18 Aug 2020 15:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yuBC8ZYcilKT59d9GC2Zo6Yq4NAlJg5iM805qukCu2s=;
        b=ELIDr4kP+wC9QUKYuBrn4Uv9W0qWVVTjpIAbhWFRCxbM1Rzw1l3zgcB+jJ1Yg9c+op
         f6lQ5tRevzAfySjEBosnwkepZcekz8FhkxKHwg8NXoEQSPz3y5vfrq7mfWJ1ptjUvi28
         gbhCQYEgePQXR+DCG1vBEBMoQP/rLZgIEX2Rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yuBC8ZYcilKT59d9GC2Zo6Yq4NAlJg5iM805qukCu2s=;
        b=aYh3NOPLolkEnYmQKc1ZisSae0idSuug+RXAyIXhFe5iLADi32zE9xoQU/8A5sC5db
         tEpFngZOdScpZkffYGeG4dFdGSh4JlVoFz7Hb5g1dZSanO5lxkPAXC99jX/q94tCI1n1
         3xk1Un6FcDtNh8/ux1Zh1kinnkCBVtVolWE4SNjKhtl0kiMk7q0f+q3IFayUtf0v+L+n
         zXxh0Sj+Gqgd/UF1YO6sOE++HApYqF7oRtTIIPHAb0W8OXBhCGjdmNko9/gQwJavnAYG
         jO60iD9kRWDVY+gxREPV9getmsdGg6Ip7YrXTO+0p3Wwc4Z5bzK1KsTx0DEGxmXVsaik
         Mk1g==
X-Gm-Message-State: AOAM530k6K/Oy23WjO0avW88sMKx07IQhW0kr+2dVMQMWO/K5+20N7ld
        UBvSGSLSzESirXRbl8wi4QQh0mfccGxbEQ==
X-Google-Smtp-Source: ABdhPJy0JTvg8ebWc+NNgtHD6tFUL7FJCCV+DjlzbKHgJBvw40rWOGYsX3K1uZslyeBpYhaS7ek1Zw==
X-Received: by 2002:a17:902:43:: with SMTP id 61mr17599611pla.16.1597789764912;
        Tue, 18 Aug 2020 15:29:24 -0700 (PDT)
Received: from mcchou0.mtv.corp.google.com ([2620:15c:202:201:de4a:3eff:fe75:1314])
        by smtp.gmail.com with ESMTPSA id mp3sm14137286pjb.0.2020.08.18.15.29.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 15:29:23 -0700 (PDT)
From:   Miao-chen Chou <mcchou@chromium.org>
To:     Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>
Cc:     Alain Michaud <alainm@chromium.org>,
        Manish Mandlik <mmandlik@chromium.org>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Howard Chung <howardchung@google.com>,
        Miao-chen Chou <mcchou@chromium.org>
Subject: [BlueZ PATCH v1 5/7] adv_monitor: Handle D-Bus client ready events
Date:   Tue, 18 Aug 2020 15:26:43 -0700
Message-Id: <20200818152612.BlueZ.v1.5.Id5b1ced1530cb21559bc1dcf29d8764b0c7df825@changeid>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818152612.BlueZ.v1.1.I205718871f4e636958904f3cfb171cfd381c54b1@changeid>
References: <20200818152612.BlueZ.v1.1.I205718871f4e636958904f3cfb171cfd381c54b1@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This adds a handler of client ready events. The handler replies to the
RegisterMonitor() method call.

The following tests were performed.
- Call RegisterMonitor() and expect to receive a return.

Reviewed-by: Yun-Hao Chung <howardchung@google.com>
Reviewed-by: Manish Mandlik <mmandlik@chromium.org>
---

 src/adv_monitor.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/src/adv_monitor.c b/src/adv_monitor.c
index a9e2e4421..b5ea5ee99 100644
--- a/src/adv_monitor.c
+++ b/src/adv_monitor.c
@@ -127,9 +127,22 @@ static void app_disconnect_cb(DBusConnection *conn, void *user_data)
 		app_destroy(app);
 }
 
+/* Handles the ready signal of Adv Monitor app */
+static void app_ready_cb(GDBusClient *client, void *user_data)
+{
+	struct adv_monitor_app *app = user_data;
+	uint16_t adapter_id = app->manager->adapter_id;
+
+	btd_info(adapter_id, "Path %s reserved for Adv Monitor app %s",
+			app->path, app->owner);
+
+	app_reply_msg(app, dbus_message_new_method_return(app->reg));
+}
+
 /* Creates an app object, initiates it and sets D-Bus event handlers */
 static struct adv_monitor_app *app_create(DBusConnection *conn,
-					const char *sender, const char *path,
+					DBusMessage *msg, const char *sender,
+					const char *path,
 					struct btd_adv_monitor_manager *manager)
 {
 	struct adv_monitor_app *app;
@@ -154,7 +167,9 @@ static struct adv_monitor_app *app_create(DBusConnection *conn,
 
 	g_dbus_client_set_disconnect_watch(app->client, app_disconnect_cb, app);
 	g_dbus_client_set_proxy_handlers(app->client, NULL, NULL, NULL, NULL);
-	g_dbus_client_set_ready_watch(app->client, NULL, NULL);
+	g_dbus_client_set_ready_watch(app->client, app_ready_cb, app);
+
+	app->reg = dbus_message_ref(msg);
 
 	return app;
 }
@@ -199,7 +214,7 @@ static DBusMessage *register_monitor(DBusConnection *conn, DBusMessage *msg,
 	if (queue_find(manager->apps, app_match, &match))
 		return btd_error_already_exists(msg);
 
-	app = app_create(conn, match.owner, match.path, manager);
+	app = app_create(conn, msg, match.owner, match.path, manager);
 	if (!app) {
 		btd_error(manager->adapter_id,
 				"Failed to reserve %s for Adv Monitor app %s",
@@ -210,10 +225,7 @@ static DBusMessage *register_monitor(DBusConnection *conn, DBusMessage *msg,
 
 	queue_push_tail(manager->apps, app);
 
-	btd_info(manager->adapter_id, "Path %s reserved for Adv Monitor app %s",
-			match.path, match.owner);
-
-	return dbus_message_new_method_return(msg);
+	return NULL;
 }
 
 /* Handles UnregisterMonitor D-Bus call */
@@ -252,7 +264,7 @@ static DBusMessage *unregister_monitor(DBusConnection *conn,
 }
 
 static const GDBusMethodTable adv_monitor_methods[] = {
-	{ GDBUS_METHOD("RegisterMonitor",
+	{ GDBUS_ASYNC_METHOD("RegisterMonitor",
 					GDBUS_ARGS({ "application", "o" }),
 					NULL, register_monitor) },
 	{ GDBUS_ASYNC_METHOD("UnregisterMonitor",
-- 
2.26.2

