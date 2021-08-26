Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88BDA3F8C60
	for <lists+linux-bluetooth@lfdr.de>; Thu, 26 Aug 2021 18:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242747AbhHZQnI (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 26 Aug 2021 12:43:08 -0400
Received: from vern.gendns.com ([98.142.107.122]:55776 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232835AbhHZQnI (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 26 Aug 2021 12:43:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=QSXqVfAdnZkot5M4gaZ5owQQcpSYezGdQ+MD9lWwp1U=; b=e+bj/dbT3zzoy3xQvxwVulr6yE
        oZKzb2yJ2D23LCTltWKnK/sSAKGWBPm6oO43PjGNcXgZpL6PZU8L5gdByY5zpxMVtTgyMI8It6SAz
        3EQl3wnWjieqYJkyh2rzbLxrOmx3Kl1q7a5UCEIcwVTzqVEcTBcIZVdNdWpqTO5j1vDq8MoAsGtlf
        xA4G/c/6SsVEct0iJw1sIAXMVNEchSQZrRj5aL2/HJZ2o1QYCCU0LhGHmz0XImnoR5rKq7pgVd/oV
        1+hDkWbJ3SqtvTwqEvooDCc4uTMBX1TDQYxvFy8bCdwymI4Y7oy3bAolMuSTWW+WODMkFYcsgBICz
        U1GscehQ==;
Received: from [2600:1700:4830:1658::fb2] (port=34192 helo=freyr.lechnology.com)
        by vern.gendns.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <david@lechnology.com>)
        id 1mJIS8-0006y5-Nl; Thu, 26 Aug 2021 12:42:19 -0400
From:   David Lechner <david@lechnology.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     David Lechner <david@lechnology.com>
Subject: [PATCH BlueZ] device: add MTU D-Bus property
Date:   Thu, 26 Aug 2021 11:42:11 -0500
Message-Id: <20210826164211.2936133-1-david@lechnology.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id: davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

When using GATT write without response, it is useful to know how much
data can be sent in a single write. This value is the negotiated MTU
minus 3 bytes.

The D-bus method org.bluez.GattCharacteristic1.AcquireWrite returns the
MTU exactly for this reason. However, when using the alternate API
org.bluez.GattCharacteristic1.WriteValue with the options dictionary
{ "type": "command" }, there is no current way to get the MTU value.
If the value is too large, then the method returns "Failed to initiate
write" [org.bluez.Error.Failed].

This adds an "MTU" property to the org.bluez.Device1 interface that
is emitted in gatt_client_ready_cb() which is after the MTU exchange
has taken place.

Signed-off-by: David Lechner <david@lechnology.com>
---
 client/main.c      |  1 +
 doc/device-api.txt |  4 ++++
 src/device.c       | 24 ++++++++++++++++++++++++
 3 files changed, 29 insertions(+)

diff --git a/client/main.c b/client/main.c
index 506602bbd..b12a7da3e 100644
--- a/client/main.c
+++ b/client/main.c
@@ -1754,6 +1754,7 @@ static void cmd_info(int argc, char *argv[])
 	print_property(proxy, "TxPower");
 	print_property(proxy, "AdvertisingFlags");
 	print_property(proxy, "AdvertisingData");
+	print_property(proxy, "MTU");
 
 	battery_proxy = find_proxies_by_path(battery_proxies,
 					g_dbus_proxy_get_path(proxy));
diff --git a/doc/device-api.txt b/doc/device-api.txt
index 4e824d2de..030873821 100644
--- a/doc/device-api.txt
+++ b/doc/device-api.txt
@@ -272,3 +272,7 @@ Properties	string Address [readonly]
 			Example:
 				<Transport Discovery> <Organization Flags...>
 				0x26                   0x01         0x01...
+
+		uint16 MTU [readonly, optional]
+
+			The exchanged MTU (GATT client only).
diff --git a/src/device.c b/src/device.c
index 26a01612a..898f98da7 100644
--- a/src/device.c
+++ b/src/device.c
@@ -1471,6 +1471,26 @@ static gboolean dev_property_wake_allowed_exist(
 	return device_get_wake_support(device);
 }
 
+static gboolean
+dev_property_get_mtu(const GDBusPropertyTable *property,
+		     DBusMessageIter *iter, void *data)
+{
+	struct btd_device *device = data;
+
+	dbus_uint16_t mtu = bt_gatt_client_get_mtu(device->client);
+	dbus_message_iter_append_basic(iter, DBUS_TYPE_UINT16, &mtu);
+
+	return TRUE;
+}
+
+static gboolean
+dev_property_mtu_exist(const GDBusPropertyTable *property, void *data)
+{
+	struct btd_device *device = data;
+
+	return bt_gatt_client_get_mtu(device->client) != 0;
+}
+
 static bool disconnect_all(gpointer user_data)
 {
 	struct btd_device *device = user_data;
@@ -3014,6 +3034,7 @@ static const GDBusPropertyTable device_properties[] = {
 	{ "WakeAllowed", "b", dev_property_get_wake_allowed,
 				dev_property_set_wake_allowed,
 				dev_property_wake_allowed_exist },
+	{ "MTU", "q", dev_property_get_mtu, NULL, dev_property_mtu_exist },
 	{ }
 };
 
@@ -5245,6 +5266,9 @@ static void gatt_client_ready_cb(bool success, uint8_t att_ecode,
 		return;
 	}
 
+	g_dbus_emit_property_changed(dbus_conn, device->path,
+					DEVICE_INTERFACE, "MTU");
+
 	register_gatt_services(device);
 
 	btd_gatt_client_ready(device->client_dbus);
-- 
2.25.1

