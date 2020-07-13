Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ACFA21E148
	for <lists+linux-bluetooth@lfdr.de>; Mon, 13 Jul 2020 22:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbgGMUPH (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 13 Jul 2020 16:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbgGMUPG (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 13 Jul 2020 16:15:06 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD936C061755
        for <linux-bluetooth@vger.kernel.org>; Mon, 13 Jul 2020 13:15:06 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id x9so6011109plr.2
        for <linux-bluetooth@vger.kernel.org>; Mon, 13 Jul 2020 13:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xuwheI+yFoySeDdqiX9Di5PWt7znOMhM8gXI0aBJuic=;
        b=b/7kWF87GiyV5+sodQkD2ZHy+FdJZqCkfuZaSd1uqlzgW7ml0CZ9XglUjlVXBnJMiK
         d0KFLvkPWxdD5R1SOQmMUisRAhke4dLNgeAvXeZgWDLV3NomZCsUB2hXNzruEvP7dpEa
         9iPbpZCLzw9OxR8OrfL4ZKWxfPUgbWRPGmnLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xuwheI+yFoySeDdqiX9Di5PWt7znOMhM8gXI0aBJuic=;
        b=QimzKJ8tfkLkErcP0QVLk3PmrteXgKxJEmwt/D7sKUPI0c8HGo+yeBf0ECiY2S44+Y
         VGYIUL9U/Y+uRFF9VrXtkuCywfKQdEGXovzcepTaLEraZLctgzp+oVgG3mMMjdPivrx0
         8soY+4PcmWiuY0M9rzuX9b2A33oKn6o27VFCvMcSpkxMDrmt3hluIo4H4grhru3gs07B
         iHbX+RKrzL1IdvQ6O7gFb+2JZwk5O1ChEi5VHvVroch8665VoYzI9qy1IfC8QFHtgyZg
         zltRsffTujcH3MkKKaeCEhtA1d49iQMvn+ZWK+ApGZVZB9WzCv6vy10EOeUfQlZBINCR
         A8xQ==
X-Gm-Message-State: AOAM5308VlQj9O0Ar2hofcyxI1nlCuaGsL2LVSMtslz/J+Jp9zpNvrIY
        gcHho4HSPrUwJTTnqxaNhNaFXQ==
X-Google-Smtp-Source: ABdhPJzFvaJiTeGC4CN3aVEEi1nv42e0gdZ8vE2aZ2MrS4fywWaBI9Oma5fj+MVBzF31gJIvfFVHLw==
X-Received: by 2002:a17:90a:9d84:: with SMTP id k4mr1084380pjp.227.1594671306331;
        Mon, 13 Jul 2020 13:15:06 -0700 (PDT)
Received: from sonnysasaka-chrome.mtv.corp.google.com ([2620:15c:202:201:4a0f:cfff:fe66:e60c])
        by smtp.gmail.com with ESMTPSA id h18sm7866135pfr.186.2020.07.13.13.15.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jul 2020 13:15:05 -0700 (PDT)
From:   Sonny Sasaka <sonnysasaka@chromium.org>
To:     linux-bluetooth-@vger.kernel.org, linux-bluetooth@vger.kernel.org
Cc:     Sonny Sasaka <sonnysasaka@chromium.org>,
        Alain Michaud <alainm@chromium.org>
Subject: [PATCH BlueZ 3/3] client: Add set-allow-internal-profiles command
Date:   Mon, 13 Jul 2020 13:14:41 -0700
Message-Id: <20200713201441.235959-4-sonnysasaka@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200713201441.235959-1-sonnysasaka@chromium.org>
References: <20200713201441.235959-1-sonnysasaka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Reviewed-by: Alain Michaud <alainm@chromium.org>

---
 client/main.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/client/main.c b/client/main.c
index 9abada69f..c2b6e21e4 100644
--- a/client/main.c
+++ b/client/main.c
@@ -1678,6 +1678,7 @@ static void cmd_info(int argc, char *argv[])
 	print_property(proxy, "Connected");
 	print_property(proxy, "WakeAllowed");
 	print_property(proxy, "LegacyPairing");
+	print_property(proxy, "AllowInternalProfiles");
 	print_uuids(proxy);
 	print_property(proxy, "Modalias");
 	print_property(proxy, "ManufacturerData");
@@ -1838,6 +1839,39 @@ static void cmd_unblock(int argc, char *argv[])
 	return bt_shell_noninteractive_quit(EXIT_FAILURE);
 }
 
+static void cmd_set_allow_internal_profiles(int argc, char *argv[])
+{
+	GDBusProxy *proxy;
+	dbus_bool_t allow_internal_profiles;
+	char *str;
+
+	proxy = find_device(argc, argv);
+	if (!proxy)
+		return bt_shell_noninteractive_quit(EXIT_FAILURE);
+
+	if (strcmp(argv[2], "true") != 0 && strcmp(argv[2], "false") != 0) {
+		bt_shell_printf("Invalid argument: %s\n", argv[2]);
+		return bt_shell_noninteractive_quit(EXIT_FAILURE);
+	}
+
+	allow_internal_profiles = strcmp(argv[2], "true") == 0 ? true : false;
+
+	str = g_strdup_printf("%s allow internal profiles",
+				proxy_address(proxy));
+
+	if (g_dbus_proxy_set_property_basic(proxy, "AllowInternalProfiles",
+						DBUS_TYPE_BOOLEAN,
+						&allow_internal_profiles,
+						generic_callback,
+						str,
+						g_free) == TRUE)
+		return;
+
+	g_free(str);
+
+	return bt_shell_noninteractive_quit(EXIT_FAILURE);
+}
+
 static void remove_device_reply(DBusMessage *message, void *user_data)
 {
 	DBusError error;
@@ -2824,6 +2858,10 @@ static const struct bt_shell_menu main_menu = {
 								dev_generator },
 	{ "unblock",      "[dev]",    cmd_unblock, "Unblock device",
 								dev_generator },
+	{ "set-allow-internal-profiles", "<dev> <true/false>",
+					cmd_set_allow_internal_profiles,
+					"Set allow internal profiles",
+					dev_generator },
 	{ "remove",       "<dev>",    cmd_remove, "Remove device",
 							dev_generator },
 	{ "connect",      "<dev>",    cmd_connect, "Connect device",
-- 
2.26.2

