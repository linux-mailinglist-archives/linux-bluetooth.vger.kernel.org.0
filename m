Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD58F44B4E3
	for <lists+linux-bluetooth@lfdr.de>; Tue,  9 Nov 2021 22:44:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243830AbhKIVrj (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 9 Nov 2021 16:47:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239105AbhKIVri (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 9 Nov 2021 16:47:38 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32054C061764
        for <linux-bluetooth@vger.kernel.org>; Tue,  9 Nov 2021 13:44:52 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id n23so323106pgh.8
        for <linux-bluetooth@vger.kernel.org>; Tue, 09 Nov 2021 13:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xAeCrjPK7LSjN6yULZm/dFdUvkRk2cHGL1Oh+8+6Ciw=;
        b=lPPewnxBjhRN9TO2OrfIxKQqyoVbNs3Fsyd4/WUecPjffrDJyJC4dXMMIge1Rtxo5F
         AkkNW+e0TreSxw0I0W/gBu2+vRprfysNObRkNeIzTFeCRvOo0KXVP+Sf//p+DzuVALGV
         IkioWee9fO37lLCoaTYEk5Wb5nI+Wprc+rL9Y/IL8jO50w4CciTbL4lgVLCMMB1wduQ5
         PinCST4Ldtlg8hJGiANyMCWhPYUJZpDLImoEmyXCCorHv5Y6W0mEVRKpYpml06HKFKEK
         taZ7MKD6ixG2lBqdvR28nyFR0u/pgVuV7TjV/TIUMx9cJsboHmhr396II2tJRLGYXrxN
         wy1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xAeCrjPK7LSjN6yULZm/dFdUvkRk2cHGL1Oh+8+6Ciw=;
        b=IYDz2e1Rt065dW1BwJKMsriB6VxuBWHIRHBbEkI8SY40V6AK6ll4iE6weL0FtK8hea
         jvs9MdD/rTK4wPYqg59O0mTi3l/PUBR46v7GF9YUJ5dglyBfwMa96PxBVpxyOHIef3u1
         b5KDDY91X54QzfkrIifs57fdx8G5wlmlIzOVfBChVJJD+gmNKwpmRA6VoTz4ZL2tzqvU
         CegseE1DKX1IbVfg+o1DUO+WBtYwdhu+HSIux5qDwHcTWbldRulDR7MJeEaOd62zmtW7
         0Ri2PYymSl9YEiTjHJNe+m+hxMHcpVwighUvpHAjusvo/4kMvJBMuYHoItEdkWYdwaBS
         4zqQ==
X-Gm-Message-State: AOAM532OfSVED+jbhUCM0E1kOpPoZ9VGU/g10dVrloN9tqdxnEjafvYd
        CXLsc02xB6qQVIS24FbdR6Yg7PUJXpk=
X-Google-Smtp-Source: ABdhPJyLA/JS6BcgqgMc68w4UGMtJPKG3Go0OvGZdgNheVL/6qP1DN6hHQOewx9AWmzikdr4FQmXIw==
X-Received: by 2002:aa7:8a56:0:b0:494:6b49:cbfa with SMTP id n22-20020aa78a56000000b004946b49cbfamr45230214pfa.72.1636494291356;
        Tue, 09 Nov 2021 13:44:51 -0800 (PST)
Received: from lvondent-mobl4.. (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id v2sm148766pfg.115.2021.11.09.13.44.50
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 13:44:51 -0800 (PST)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v2 BlueZ] client/gatt: Fix using atoi
Date:   Tue,  9 Nov 2021 13:44:50 -0800
Message-Id: <20211109214450.1122581-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

atoi doesn't support values entered in hexadecimal (0x...) which is
likely the prefered format for the likes of handles, etc, so this
replaces the uses of atoi with strtoul.
---
 client/gatt.c | 71 +++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 60 insertions(+), 11 deletions(-)

diff --git a/client/gatt.c b/client/gatt.c
index 21fd38ecf..ce13b3341 100644
--- a/client/gatt.c
+++ b/client/gatt.c
@@ -647,22 +647,40 @@ static void read_attribute(GDBusProxy *proxy, uint16_t offset)
 	bt_shell_printf("Attempting to read %s\n", g_dbus_proxy_get_path(proxy));
 }
 
+static int parse_offset(const char *arg)
+{
+	char *endptr = NULL;
+	unsigned long offset;
+
+	offset = strtoul(arg, &endptr, 0);
+	if (!endptr || *endptr != '\0' || offset > UINT16_MAX) {
+		bt_shell_printf("Invalid offload: %s", arg);
+		return -EINVAL;
+	}
+
+	return offset;
+}
+
 void gatt_read_attribute(GDBusProxy *proxy, int argc, char *argv[])
 {
 	const char *iface;
-	uint16_t offset = 0;
+	int offset = 0;
 
 	iface = g_dbus_proxy_get_interface(proxy);
 	if (!strcmp(iface, "org.bluez.GattCharacteristic1") ||
 				!strcmp(iface, "org.bluez.GattDescriptor1")) {
 
-		if (argc == 2)
-			offset = atoi(argv[1]);
+		if (argc == 2) {
+			offset = parse_offset(argv[1]);
+			if (offset < 0)
+				goto fail;
+		}
 
 		read_attribute(proxy, offset);
 		return;
 	}
 
+fail:
 	bt_shell_printf("Unable to read attribute %s\n",
 						g_dbus_proxy_get_path(proxy));
 	return bt_shell_noninteractive_quit(EXIT_FAILURE);
@@ -805,8 +823,15 @@ void gatt_write_attribute(GDBusProxy *proxy, int argc, char *argv[])
 				!strcmp(iface, "org.bluez.GattDescriptor1")) {
 		data.iov.iov_base = str2bytearray(argv[1], &data.iov.iov_len);
 
-		if (argc > 2)
-			data.offset = atoi(argv[2]);
+		if (argc > 2) {
+			int offset;
+
+			offset = parse_offset(argv[2]);
+			if (offset < 0)
+				goto fail;
+
+			data.offset = offset;
+		}
 
 		if (argc > 3)
 			data.type = argv[3];
@@ -815,6 +840,7 @@ void gatt_write_attribute(GDBusProxy *proxy, int argc, char *argv[])
 		return;
 	}
 
+fail:
 	bt_shell_printf("Unable to write attribute %s\n",
 						g_dbus_proxy_get_path(proxy));
 
@@ -1469,6 +1495,20 @@ static void service_set_primary(const char *input, void *user_data)
 	}
 }
 
+static uint16_t parse_handle(const char *arg)
+{
+	char *endptr = NULL;
+	unsigned long handle;
+
+	handle = strtoul(arg, &endptr, 0);
+	if (!endptr || *endptr != '\0' || !handle || handle > UINT16_MAX) {
+		bt_shell_printf("Invalid handle: %s", arg);
+		return 0;
+	}
+
+	return handle;
+}
+
 void gatt_register_service(DBusConnection *conn, GDBusProxy *proxy,
 						int argc, char *argv[])
 {
@@ -1482,8 +1522,11 @@ void gatt_register_service(DBusConnection *conn, GDBusProxy *proxy,
 					g_list_length(local_services));
 	service->primary = primary;
 
-	if (argc > 2)
-		service->handle = atoi(argv[2]);
+	if (argc > 2) {
+		service->handle = parse_handle(argv[2]);
+		if (!service->handle)
+			return bt_shell_noninteractive_quit(EXIT_FAILURE);
+	}
 
 	if (g_dbus_register_interface(conn, service->path,
 					SERVICE_INTERFACE, NULL, NULL,
@@ -2574,8 +2617,11 @@ void gatt_register_chrc(DBusConnection *conn, GDBusProxy *proxy,
 	chrc->flags = g_strsplit(argv[2], ",", -1);
 	chrc->authorization_req = attr_authorization_flag_exists(chrc->flags);
 
-	if (argc > 3)
-		chrc->handle = atoi(argv[3]);
+	if (argc > 3) {
+		chrc->handle = parse_handle(argv[3]);
+		if (!chrc->handle)
+			return bt_shell_noninteractive_quit(EXIT_FAILURE);
+	}
 
 	if (g_dbus_register_interface(conn, chrc->path, CHRC_INTERFACE,
 					chrc_methods, NULL, chrc_properties,
@@ -2851,8 +2897,11 @@ void gatt_register_desc(DBusConnection *conn, GDBusProxy *proxy,
 					g_list_length(desc->chrc->descs));
 	desc->flags = g_strsplit(argv[2], ",", -1);
 
-	if (argc > 3)
-		desc->handle = atoi(argv[3]);
+	if (argc > 3) {
+		desc->handle = parse_handle(argv[3]);
+		if (!desc->handle)
+			return bt_shell_noninteractive_quit(EXIT_FAILURE);
+	}
 
 	if (g_dbus_register_interface(conn, desc->path, DESC_INTERFACE,
 					desc_methods, NULL, desc_properties,
-- 
2.31.1

