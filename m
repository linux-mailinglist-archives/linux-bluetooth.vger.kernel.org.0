Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DEF02BB7FA
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Nov 2020 21:59:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730340AbgKTU5y (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 20 Nov 2020 15:57:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729547AbgKTU5x (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 20 Nov 2020 15:57:53 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41D3DC0613CF
        for <linux-bluetooth@vger.kernel.org>; Fri, 20 Nov 2020 12:57:52 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id b63so9015765pfg.12
        for <linux-bluetooth@vger.kernel.org>; Fri, 20 Nov 2020 12:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FTvIzX7GCozO99X7SEFRSY0nTaCgNWs0wH/hjeI4kek=;
        b=guepqVMzj2Re48hjSECSCSRbbHzC8habrnFF17ghpg7qpchmEjvhtYLYbsVrWKKcwS
         etCJr9YAZPjD0D5npn9Zbt+2Wgk0QflgsR9IISfdhTqJUYtrAy0j4kR+aogUlTgYWdJt
         2aN0Fv2eYDoaoBmZVeujbQkOF5GQwKffxrbeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FTvIzX7GCozO99X7SEFRSY0nTaCgNWs0wH/hjeI4kek=;
        b=MtJRJBg377DeKf5LE6OUGJLSwSruXubBJ0Xze9FZYmNqPKBZrVBZBYmNI0HJYIz9VB
         +m7oFLNlhLmPjfWBz87hj1e7ArXhX7H5l/BvGT/LiGVnpjUu7QiB+HmceJMbgPUvEvc3
         m6nJGKo1ABYBytYxYkPpmH71D+FstpI+GilpC4muvO+DmghwGnQsiRbqjHo2P1AVi1vp
         1KE6PCvmOG8vYQHW8q8yYbwRSX40UeQ24oXboqTCSbQ2lsaccqSHw0kYEXH8UH5OBa7E
         VU9QMTdiigN133kY4AqEx3L4JLZojnl3iY/kfOemnpsOW6mcSwEs4OoUwjoV+8zpon4f
         WCqw==
X-Gm-Message-State: AOAM530+JQ1ewUOMZ33mALIJFsYB19HnITVunaC2n3P17JezcWyzTVTn
        n39PsxSKutPb8BlGsKidnqttH9rYLNYIsg==
X-Google-Smtp-Source: ABdhPJyrgRtOl9u/uhGJ8GKr6i8hHrbyDVPVk0X/cE6t9k6M1TswRoATPoRFumXAze0Whx2dANpszg==
X-Received: by 2002:a65:6896:: with SMTP id e22mr511840pgt.318.1605905871583;
        Fri, 20 Nov 2020 12:57:51 -0800 (PST)
Received: from sonnysasaka-chrome.mtv.corp.google.com ([2620:15c:202:201:4a0f:cfff:fe66:e60c])
        by smtp.gmail.com with ESMTPSA id a67sm3232080pfa.77.2020.11.20.12.57.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2020 12:57:51 -0800 (PST)
From:   Sonny Sasaka <sonnysasaka@chromium.org>
To:     linux-bluetooth@vger.kernel.org
Cc:     Sonny Sasaka <sonnysasaka@chromium.org>,
        Daniel Winkler <danielwinkler@google.com>
Subject: [PATCH BlueZ v3 2/7] profiles/battery: Refactor to use battery library
Date:   Fri, 20 Nov 2020 12:57:23 -0800
Message-Id: <20201120205728.339325-2-sonnysasaka@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120205728.339325-1-sonnysasaka@chromium.org>
References: <20201120205728.339325-1-sonnysasaka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This refactors profiles/battery to use the internal battery library that
handles the D-Bus intricacies so that profiles/battery only handles the
GATT BAS concerns.

Reviewed-by: Daniel Winkler <danielwinkler@google.com>

---
 profiles/battery/battery.c | 51 +++++++++++---------------------------
 1 file changed, 15 insertions(+), 36 deletions(-)

diff --git a/profiles/battery/battery.c b/profiles/battery/battery.c
index 13c80d05c..e1a61dd0b 100644
--- a/profiles/battery/battery.c
+++ b/profiles/battery/battery.c
@@ -23,14 +23,11 @@
 
 #include <glib.h>
 
-#include "gdbus/gdbus.h"
-
 #include "lib/bluetooth.h"
 #include "lib/hci.h"
 #include "lib/sdp.h"
 #include "lib/uuid.h"
 
-#include "src/dbus-common.h"
 #include "src/shared/util.h"
 #include "src/shared/att.h"
 #include "src/shared/queue.h"
@@ -42,6 +39,7 @@
 #include "src/profile.h"
 #include "src/service.h"
 #include "src/log.h"
+#include "src/battery.h"
 #include "attrib/att.h"
 
 #define BATTERY_INTERFACE "org.bluez.Battery1"
@@ -50,7 +48,7 @@
 
 /* Generic Attribute/Access Service */
 struct batt {
-	char *path; /* D-Bus path of device */
+	struct btd_battery *battery;
 	struct btd_device *device;
 	struct gatt_db *db;
 	struct bt_gatt_client *client;
@@ -69,6 +67,8 @@ static void batt_free(struct batt *batt)
 	bt_gatt_client_unref(batt->client);
 	btd_device_unref(batt->device);
 	g_free (batt->initial_value);
+	if (batt->battery)
+		btd_battery_unregister(batt->battery);
 	g_free(batt);
 }
 
@@ -81,11 +81,9 @@ static void batt_reset(struct batt *batt)
 	batt->client = NULL;
 	g_free (batt->initial_value);
 	batt->initial_value = NULL;
-	if (batt->path) {
-		g_dbus_unregister_interface(btd_get_dbus_connection(),
-					    batt->path, BATTERY_INTERFACE);
-		g_free(batt->path);
-		batt->path = NULL;
+	if (batt->battery) {
+		btd_battery_unregister(batt->battery);
+		batt->battery = NULL;
 	}
 }
 
@@ -98,8 +96,11 @@ static void parse_battery_level(struct batt *batt,
 	if (batt->percentage != percentage) {
 		batt->percentage = percentage;
 		DBG("Battery Level updated: %d%%", percentage);
-		g_dbus_emit_property_changed(btd_get_dbus_connection(), batt->path,
-						BATTERY_INTERFACE, "Percentage");
+		if (!batt->battery) {
+			warn("Trying to update an unregistered battery");
+			return;
+		}
+		btd_battery_update(batt->battery, batt->percentage);
 	}
 }
 
@@ -115,22 +116,6 @@ static void batt_io_value_cb(uint16_t value_handle, const uint8_t *value,
 	}
 }
 
-static gboolean property_get_percentage(
-					const GDBusPropertyTable *property,
-					DBusMessageIter *iter, void *data)
-{
-	struct batt *batt = data;
-
-	dbus_message_iter_append_basic(iter, DBUS_TYPE_BYTE, &batt->percentage);
-
-	return TRUE;
-}
-
-static const GDBusPropertyTable battery_properties[] = {
-	{ "Percentage", "y", property_get_percentage },
-	{ }
-};
-
 static void batt_io_ccc_written_cb(uint16_t att_ecode, void *user_data)
 {
 	struct batt *batt = user_data;
@@ -141,13 +126,9 @@ static void batt_io_ccc_written_cb(uint16_t att_ecode, void *user_data)
 		return;
 	}
 
-	if (g_dbus_register_interface(btd_get_dbus_connection(),
-					batt->path, BATTERY_INTERFACE,
-					NULL, NULL,
-					battery_properties, batt,
-					NULL) == FALSE) {
-		error("Unable to register %s interface for %s",
-			BATTERY_INTERFACE, batt->path);
+	batt->battery = btd_battery_register(device_get_path(batt->device));
+
+	if (!batt->battery) {
 		batt_reset(batt);
 		return;
 	}
@@ -321,8 +302,6 @@ static int batt_accept(struct btd_service *service)
 		return -1;
 	}
 
-	batt->path = g_strdup (device_get_path(device));
-
 	btd_service_connecting_complete(service, 0);
 
 	return 0;
-- 
2.26.2

