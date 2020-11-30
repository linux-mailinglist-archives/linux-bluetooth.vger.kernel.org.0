Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDEDE2C8EA0
	for <lists+linux-bluetooth@lfdr.de>; Mon, 30 Nov 2020 21:06:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729969AbgK3UEH (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 30 Nov 2020 15:04:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729876AbgK3UEG (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 30 Nov 2020 15:04:06 -0500
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BF5EC0617A6
        for <linux-bluetooth@vger.kernel.org>; Mon, 30 Nov 2020 12:03:26 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id p21so377805pjv.0
        for <linux-bluetooth@vger.kernel.org>; Mon, 30 Nov 2020 12:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qnjOyIqD02WVy6ZZ2x5bkuCTpr4hjumX5jR/HYlXCOk=;
        b=MfplBdiPStG1Nw6OuxiwO5EDOzoD11LfAogWHW6vc4EWr8VdobccQFOOb7dKh6l3tr
         5/s0964WiZ5Cm4wQ6QB6zdQ/W4DFiLtg0kIE1Z4YdIVvE3MdzjvC8pefgeM2SHBgzKsc
         RL6m+WBKRAuhpiltToFdD1yKPpJeEs29imNbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qnjOyIqD02WVy6ZZ2x5bkuCTpr4hjumX5jR/HYlXCOk=;
        b=tUUE6a+/2/gEtVRTmGr1ledkB6Mm+HYg5YjPQXEr2VjjvkN28laqYMuT2X5E3XBraX
         NnrjDA3nKbSJhYonaHfcxaFcCG7FB+gMHoQdpHTjw+pP1EAaTpQr1tPa0TZDfEb9g4c0
         tj2dcVYNI6dH4Qsj4ScS5JAvVeA/LWEbvZVqD3j0vyvhj/2MEHAG7leGPgOiUOdm531d
         Bk12HeVWK5IGGm+n1TIqpuyYbmS2kbmnuYPlsuutkX9H/plkPnUZ8AeAbbBujMaPvnZB
         05O1BG5jooltqIS6dEbDA6A93rRNXd/5tlSHY24wZycIIocAHIatasr9ptwwXCl7LDv2
         ncuA==
X-Gm-Message-State: AOAM533hh7FI+G/NGzEJdfV2b2+rUG3w3K+CWXHy21QwLShL1FyyzGjo
        sIK+sgdOUzxbX/lGMXpGlwotu3NStQdpYg==
X-Google-Smtp-Source: ABdhPJzDJ+tZYpjYzct53xxqkZF6Z8PTbKBJBiNLNBp63/w88iKXXtAaaP/Eu2eV+Zpwzgjffm4x7Q==
X-Received: by 2002:a17:90a:c6:: with SMTP id v6mr519587pjd.95.1606766605777;
        Mon, 30 Nov 2020 12:03:25 -0800 (PST)
Received: from sonnysasaka-chrome.mtv.corp.google.com ([2620:15c:202:201:4a0f:cfff:fe66:e60c])
        by smtp.gmail.com with ESMTPSA id y24sm17117184pfn.176.2020.11.30.12.03.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Nov 2020 12:03:25 -0800 (PST)
From:   Sonny Sasaka <sonnysasaka@chromium.org>
To:     linux-bluetooth@vger.kernel.org
Cc:     Sonny Sasaka <sonnysasaka@chromium.org>,
        Miao-chen Chou <mcchou@chromium.org>
Subject: [PATCH BlueZ v4 3/7] battery: Add Source property to Battery API
Date:   Mon, 30 Nov 2020 12:03:03 -0800
Message-Id: <20201130200307.386410-3-sonnysasaka@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201130200307.386410-1-sonnysasaka@chromium.org>
References: <20201130200307.386410-1-sonnysasaka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

As Battery API will be generalized for other battery reporting
protocols, the Source property is useful for diagnostics purposes.

Reviewed-by: Miao-chen Chou <mcchou@chromium.org>

---
 profiles/battery/battery.c |  3 ++-
 src/battery.c              | 35 +++++++++++++++++++++++++++++++----
 src/battery.h              |  2 +-
 3 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/profiles/battery/battery.c b/profiles/battery/battery.c
index e1a61dd0b..2478816a4 100644
--- a/profiles/battery/battery.c
+++ b/profiles/battery/battery.c
@@ -126,7 +126,8 @@ static void batt_io_ccc_written_cb(uint16_t att_ecode, void *user_data)
 		return;
 	}
 
-	batt->battery = btd_battery_register(device_get_path(batt->device));
+	batt->battery = btd_battery_register(device_get_path(batt->device),
+					     "GATT Battery Service");
 
 	if (!batt->battery) {
 		batt_reset(batt);
diff --git a/src/battery.c b/src/battery.c
index 87a6b91fb..8613d6e23 100644
--- a/src/battery.c
+++ b/src/battery.c
@@ -31,8 +31,9 @@
 #define BATTERY_MAX_PERCENTAGE 100
 
 struct btd_battery {
-	char *path; /* D-Bus object path, owns pointer */
+	char *path; /* D-Bus object path */
 	uint8_t percentage; /* valid between 0 to 100 inclusively */
+	char *source; /* Descriptive source of the battery info */
 };
 
 static struct queue *batteries = NULL;
@@ -62,13 +63,15 @@ static bool match_path(const void *data, const void *user_data)
 	return g_strcmp0(battery->path, path) == 0;
 }
 
-static struct btd_battery *battery_new(const char *path)
+static struct btd_battery *battery_new(const char *path, const char *source)
 {
 	struct btd_battery *battery;
 
 	battery = new0(struct btd_battery, 1);
 	battery->path = g_strdup(path);
 	battery->percentage = UINT8_MAX;
+	if (source)
+		battery->source = g_strdup(source);
 
 	return battery;
 }
@@ -78,6 +81,9 @@ static void battery_free(struct btd_battery *battery)
 	if (battery->path)
 		g_free(battery->path);
 
+	if (battery->source)
+		g_free(battery->source);
+
 	free(battery);
 }
 
@@ -100,13 +106,34 @@ static gboolean property_percentage_exists(const GDBusPropertyTable *property,
 	return battery->percentage <= BATTERY_MAX_PERCENTAGE;
 }
 
+static gboolean property_source_get(const GDBusPropertyTable *property,
+				    DBusMessageIter *iter, void *data)
+{
+	struct btd_battery *battery = data;
+
+	dbus_message_iter_append_basic(iter, DBUS_TYPE_STRING,
+				       &battery->source);
+
+	return TRUE;
+}
+
+static gboolean property_source_exists(const GDBusPropertyTable *property,
+				       void *data)
+{
+	struct btd_battery *battery = data;
+
+	return battery->source != NULL;
+}
+
 static const GDBusPropertyTable battery_properties[] = {
 	{ "Percentage", "y", property_percentage_get, NULL,
 	  property_percentage_exists },
+	{ "Source", "s", property_source_get, NULL, property_source_exists,
+	  G_DBUS_PROPERTY_FLAG_EXPERIMENTAL },
 	{}
 };
 
-struct btd_battery *btd_battery_register(const char *path)
+struct btd_battery *btd_battery_register(const char *path, const char *source)
 {
 	struct btd_battery *battery;
 
@@ -122,7 +149,7 @@ struct btd_battery *btd_battery_register(const char *path)
 		return NULL;
 	}
 
-	battery = battery_new(path);
+	battery = battery_new(path, source);
 	battery_add(battery);
 
 	if (!g_dbus_register_interface(btd_get_dbus_connection(), battery->path,
diff --git a/src/battery.h b/src/battery.h
index 9c69b7afa..ff63454cd 100644
--- a/src/battery.h
+++ b/src/battery.h
@@ -10,6 +10,6 @@
 
 struct btd_battery;
 
-struct btd_battery *btd_battery_register(const char *path);
+struct btd_battery *btd_battery_register(const char *path, const char *source);
 bool btd_battery_unregister(struct btd_battery *battery);
 bool btd_battery_update(struct btd_battery *battery, uint8_t percentage);
-- 
2.26.2

