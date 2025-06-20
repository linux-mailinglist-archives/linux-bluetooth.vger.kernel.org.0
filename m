Return-Path: <linux-bluetooth+bounces-13120-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 631A8AE174C
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Jun 2025 11:16:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFD9A1BC07E3
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Jun 2025 09:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9208827FD73;
	Fri, 20 Jun 2025 09:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d8fvwaFD"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C607D098
	for <linux-bluetooth@vger.kernel.org>; Fri, 20 Jun 2025 09:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750410996; cv=none; b=BMN6aFNA/9JD390pjds1VmhmQZew5RXfz4itiSLZ3Nz2wfzQ1nNkaaodQp8nxajiA3X40Z8qOIPIAWfp1QD9w/oYaWhS4ZZ+OFUz9AufEQ6j7CwO1ZNDnmAAuG3lzrCZ1CswsWc0xx47P/r3c8WWL2wLpaRPqqhW0A9Did5GaKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750410996; c=relaxed/simple;
	bh=0WYPLaIYo6TVxc2olbQdvDPFT2Y1lm1C8aN+TC38wJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rzdOwj2HhsdqaX9spHvPGUGQnqRcLIWjhWmlvJX6HAyFz5CRu3nVDom2bw8hOyPgNQhMI8+Q6qL6Hgt/kh+LnMC35VcZZ6732BAclCuWuHsbhN9doXkfegCvNXmAJhW5qLLUvqSRQM39PVa7qzI6qINE6ypznkHWizWv2VFcsuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d8fvwaFD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE25DC4CEED;
	Fri, 20 Jun 2025 09:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750410995;
	bh=0WYPLaIYo6TVxc2olbQdvDPFT2Y1lm1C8aN+TC38wJ8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=d8fvwaFDH8+FfbinuVtzt3inMpTHL/+Plq+MNS5j7/GQfQs+J2ysZjzScwMwJoQDR
	 QghoSCURsVi5ODb84Fk3VKgzsuYPB94tHNOFrlOZFkJ/rCVJmfjIi4aV/9UfnOv4wv
	 fSgdH+QZyexFCXkrtvrA+a06dP2QAfVa2O1/r9s2AxzY4zRW7TwJg6pgPVkgnqgp8D
	 YJgrpvhtl4ov7QJIUUqFdW9l2vvxf1uGNFGHGxU0bgd5dFCEMKZJwo0Lp+kB/EJfv1
	 pBoWneghIhuX+y1QOi0YfTByGaMGTyXf18ET78cOv6HEDswyX5U9bK6/6ijweEvAzZ
	 vpUXFVdTgMgpg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B02DAC7115D;
	Fri, 20 Jun 2025 09:16:35 +0000 (UTC)
From: Ye He via B4 Relay <devnull+ye.he.amlogic.com@kernel.org>
Date: Fri, 20 Jun 2025 17:16:32 +0800
Subject: [PATCH bluez v2] device: Add bearer info to Connected/Disconnected
 signals
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250620-device-bearer-level-conn-state-v2-1-a36a50c5abe3@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAO8mVWgC/42NQQ7CIBBFr2Jm7RjAtGldeQ/TBQzTloSCgUrUp
 neX9AQu3/8//22QOTnOcDttkLi47GKooM4noFmHidHZyqCEakQrO7R1RIyGdeKEngt7pBgC5lW
 vjFdWvW1aY3XXQT15Jh7d+xA8wPgXf2Go8ezyGtPn0BZ5lP8aikSJlnRjR9GTMPauFx8nRxeKC
 wz7vv8ARcHcBtUAAAA=
X-Change-ID: 20250618-device-bearer-level-conn-state-3e29d56bda88
To: Linux Bluetooth <linux-bluetooth@vger.kernel.org>
Cc: Ye He <ye.he@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750410993; l=12706;
 i=ye.he@amlogic.com; s=20250225; h=from:subject:message-id;
 bh=EocFsEFfkxdfsDp9s2x0I2sjhz5JKSqkoqypsaJFNMU=;
 b=DRVcGo/5PRb58AxQbbaQnPgvrTRgENXeE9FigHzfjIZCWIJzh8H8FvGyeu7++4xxAKKrXoJ36
 xu7BTMvQ0U5A9PXqtsT2WYPDkRneoWvwi48DxZzgYn60YLmh1yvnS2g
X-Developer-Key: i=ye.he@amlogic.com; a=ed25519;
 pk=hiK/p0mkXYSkX8Ooa496DfgjnbtdcyXSPFwK2LN49CE=
X-Endpoint-Received: by B4 Relay for ye.he@amlogic.com/20250225 with
 auth_id=348
X-Original-From: Ye He <ye.he@amlogic.com>
Reply-To: ye.he@amlogic.com

From: Ye He <ye.he@amlogic.com>

This patch adds the Connected signals and updates the Disconnected signals
to use a dictionary instead of individual arguments, allowing additional
information to be conveyed in a backward-compatible way.

Specifically, a new "bearer" key is added to both signals to indicate the
transport type ("le" or "bredr"). This is useful in dual-mode scenarios
where it is necessary to distinguish between BR/EDR and LE connections.

The original Disconnected signal was introduced in BlueZ 5.82 and has not
seen widespread usage yet, so this change minimizes the risk of breaking
existing applications. By adding both signals to a dictionary-based
format now, future extensions can be added without requiring further API
changes.

Fixes: https://github.com/bluez/bluez/issues/1350

Signed-off-by: Ye He <ye.he@amlogic.com>
---
Changes in v2:
- Use dictionary instead of individual arguments in both Connected &
Disconnected signal.
- Link to v1: https://patch.msgid.link/20250618-device-bearer-level-conn-state-v1-1-dca5df09c0bd@amlogic.com
---
 doc/org.bluez.Device.rst | 104 +++++++++++++++++++++++++++++-----------
 src/device.c             | 121 +++++++++++++++++++++++++++++++++++++++++------
 2 files changed, 183 insertions(+), 42 deletions(-)

diff --git a/doc/org.bluez.Device.rst b/doc/org.bluez.Device.rst
index 646e2c77ec2ddcbf7e6897336165d228c349fe00..27b2ef3fdafa57383e5167b30274c8b2493cd97e 100644
--- a/doc/org.bluez.Device.rst
+++ b/doc/org.bluez.Device.rst
@@ -157,56 +157,106 @@ Possible errors:
 Signals
 -------
 
-void Disconnected(string reason, string message)
-````````````````````````````````````````````````
+void Connected(dict info)
+`````````````````````````
+
+This signal is emitted when a device is connected, with a dictionary
+containing connection metadata such as the bearer type.
+
+This signal can be used by client applications to react to bearer-specific
+connections — for example, to disable discovery or advertising when
+connected over a specific transport.
+
+Possible info values:
+
+:string bearer:
+
+	The bearer type of the connection.
+
+	Possible values:
+
+		:"le":
+
+			LE transport is connected.
+
+		:"bredr":
+
+			BR/EDR transport is connected.
+
+void Disconnected(dict info)
+````````````````````````````
 
-This signal is launched when a device is disconnected, with the reason of the
-disconnection.
+This signal is emitted when a device is disconnected, with a dictionary
+providing disconnection details, including the reason and bearer type.
 
 This could be used by client application, depending on internal policy, to try
 to reconnect to the device in case of timeout or unknown disconnection, or to
 try to connect to another device.
 
-Possible reasons:
+Possible info values:
+
+:string bearer:
+
+	The bearer type that was disconnected.
+
+	Possible bearer:
+
+	:"le":
+
+		LE transport is disconnected.
+
+	:"bredr":
+
+		BR/EDR transport is disconnected.
+
+:string reason:
+
+	The reason for disconnection.
+
+	Possible reasons:
+
+	:org.bluez.Reason.Unknown:
+
+	:org.bluez.Reason.Timeout:
 
-:org.bluez.Reason.Unknown:
+		Connection timeout.
 
-:org.bluez.Reason.Timeout:
+		The link supervision timeout has expired for a connection or the
+		synchronization timeout has expired for a broadcast.
 
-	Connection timeout.
+	:org.bluez.Reason.Local:
 
-	The link supervision timeout has expired for a connection or the
-	synchronization timeout has expired for a broadcast.
+		Connection terminated by local host.
 
-:org.bluez.Reason.Local:
+		The local device terminated the connection, terminated synchronization
+		with a broadcaster, or terminated broadcasting packets.
 
-	Connection terminated by local host.
+	:org.bluez.Reason.Remote:
 
-	The local device terminated the connection, terminated synchronization
-	with a broadcaster, or terminated broadcasting packets.
+		Connection terminated by remote host.
 
-:org.bluez.Reason.Remote:
+		This disconnection can be due to:
 
-	Connection terminated by remote host.
+		- the user on the remote device either terminated the connection or
+		stopped broadcasting packets,
 
-	This disconnection can be due to:
+		- the remote device terminated the connection because of low
+		resources,
 
-	- the user on the remote device either terminated the connection or
-	  stopped broadcasting packets,
+		- the remote device terminated the connection because the device is
+		about to power off.
 
-	- the remote device terminated the connection because of low
-	  resources,
+	:org.bluez.Reason.Authentication:
 
-	- the remote device terminated the connection because the device is
-	  about to power off.
+		Connection terminated due to an authentication failure.
 
-:org.bluez.Reason.Authentication:
+	:org.bluez.Reason.Suspend:
 
-	Connection terminated due to an authentication failure.
+		Connection terminated by local host for suspend.
 
-:org.bluez.Reason.Suspend:
+:string message:
 
-	Connection terminated by local host for suspend.
+	A human-readable message providing further context for the disconnection.
 
 Properties
 ----------
diff --git a/src/device.c b/src/device.c
index 902c4aa44d21eb89076eff3a47ffa727420967a8..3ae2950e111bd13a0462a19233dff1ceef017362 100644
--- a/src/device.c
+++ b/src/device.c
@@ -80,6 +80,15 @@
 static DBusConnection *dbus_conn = NULL;
 static unsigned service_state_cb_id;
 
+struct btd_conn_params {
+	const char *bearer;
+};
+
+struct btd_disconn_params {
+	const char *bearer;
+	uint8_t reason;
+};
+
 struct btd_disconnect_data {
 	guint id;
 	disconnect_watch watch;
@@ -3491,8 +3500,10 @@ static const GDBusMethodTable device_methods[] = {
 };
 
 static const GDBusSignalTable device_signals[] = {
+	{ GDBUS_SIGNAL("Connected",
+			GDBUS_ARGS({ "info", "a{sv}" })) },
 	{ GDBUS_SIGNAL("Disconnected",
-			GDBUS_ARGS({ "name", "s" }, { "message", "s" })) },
+			GDBUS_ARGS({ "info", "a{sv}" })) },
 	{ }
 };
 
@@ -3672,10 +3683,42 @@ static void device_update_last_used(struct btd_device *device,
 	store_device_info(device);
 }
 
+static void device_emit_connected(struct btd_device *dev,
+                                  struct btd_conn_params *params)
+{
+	DBusMessageIter iter;
+	DBusMessageIter dict;
+	DBusMessageIter entry, variant;
+	const char *key = "bearer";
+
+	DBusMessage *signal = dbus_message_new_signal(dev->path,
+	                                              DEVICE_INTERFACE,
+	                                              "Connected");
+	if (!signal) {
+		error("Failed to create Connected signal for %s", dev->path);
+		return;
+	}
+
+	dbus_message_iter_init_append(signal, &iter);
+	dbus_message_iter_open_container(&iter, DBUS_TYPE_ARRAY, "{sv}", &dict);
+
+	dbus_message_iter_open_container(&dict, DBUS_TYPE_DICT_ENTRY, NULL, &entry);
+	dbus_message_iter_append_basic(&entry, DBUS_TYPE_STRING, &key);
+	dbus_message_iter_open_container(&entry, DBUS_TYPE_VARIANT, "s", &variant);
+	dbus_message_iter_append_basic(&variant, DBUS_TYPE_STRING, &params->bearer);
+	dbus_message_iter_close_container(&entry, &variant);
+	dbus_message_iter_close_container(&dict, &entry);
+
+	dbus_message_iter_close_container(&iter, &dict);
+
+	g_dbus_send_message(dbus_conn, signal);
+}
+
 void device_add_connection(struct btd_device *dev, uint8_t bdaddr_type,
 							uint32_t flags)
 {
 	struct bearer_state *state = get_state(dev, bdaddr_type);
+	struct btd_conn_params params;
 
 	device_update_last_seen(dev, bdaddr_type, true);
 	device_update_last_used(dev, bdaddr_type);
@@ -3691,14 +3734,19 @@ void device_add_connection(struct btd_device *dev, uint8_t bdaddr_type,
 	dev->conn_bdaddr_type = dev->bdaddr_type;
 
 	/* If this is the first connection over this bearer */
-	if (bdaddr_type == BDADDR_BREDR)
+	if (bdaddr_type == BDADDR_BREDR) {
 		device_set_bredr_support(dev);
-	else
+		params.bearer = "bredr";
+	} else {
 		device_set_le_support(dev, bdaddr_type);
+		params.bearer = "le";
+	}
 
 	state->connected = true;
 	state->initiator = flags & BIT(3);
 
+	device_emit_connected(dev, &params);
+
 	if (dev->le_state.connected && dev->bredr_state.connected)
 		return;
 
@@ -3747,12 +3795,16 @@ static void set_temporary_timer(struct btd_device *dev, unsigned int timeout)
 								dev, NULL);
 }
 
-static void device_disconnected(struct btd_device *device, uint8_t reason)
+static void device_emit_disconnected(struct btd_device *dev,
+                                     struct btd_disconn_params *params)
 {
+	const char *key;
 	const char *name;
 	const char *message;
+	DBusMessage *signal;
+	DBusMessageIter iter, dict, entry, variant;
 
-	switch (reason) {
+	switch (params->reason) {
 	case MGMT_DEV_DISCONN_UNKNOWN:
 		name = "org.bluez.Reason.Unknown";
 		message = "Unspecified";
@@ -3778,16 +3830,48 @@ static void device_disconnected(struct btd_device *device, uint8_t reason)
 		message = "Connection terminated by local host for suspend";
 		break;
 	default:
-		warn("Unknown disconnection value: %u", reason);
+		warn("Unknown disconnection value: %u", params->reason);
 		name = "org.bluez.Reason.Unknown";
 		message = "Unspecified";
+		break;
 	}
 
-	g_dbus_emit_signal(dbus_conn, device->path, DEVICE_INTERFACE,
-						"Disconnected",
-						DBUS_TYPE_STRING, &name,
-						DBUS_TYPE_STRING, &message,
-						DBUS_TYPE_INVALID);
+	signal = dbus_message_new_signal(dev->path,
+	                                 DEVICE_INTERFACE,
+	                                 "Disconnected");
+	if (!signal)
+		return;
+
+	dbus_message_iter_init_append(signal, &iter);
+	dbus_message_iter_open_container(&iter, DBUS_TYPE_ARRAY, "{sv}", &dict);
+
+	key = "bearer";
+	dbus_message_iter_open_container(&dict, DBUS_TYPE_DICT_ENTRY, NULL, &entry);
+	dbus_message_iter_append_basic(&entry, DBUS_TYPE_STRING, &key);
+	dbus_message_iter_open_container(&entry, DBUS_TYPE_VARIANT, "s", &variant);
+	dbus_message_iter_append_basic(&variant, DBUS_TYPE_STRING, &params->bearer);
+	dbus_message_iter_close_container(&entry, &variant);
+	dbus_message_iter_close_container(&dict, &entry);
+
+	key = "reason";
+	dbus_message_iter_open_container(&dict, DBUS_TYPE_DICT_ENTRY, NULL, &entry);
+	dbus_message_iter_append_basic(&entry, DBUS_TYPE_STRING, &key);
+	dbus_message_iter_open_container(&entry, DBUS_TYPE_VARIANT, "s", &variant);
+	dbus_message_iter_append_basic(&variant, DBUS_TYPE_STRING, &name);
+	dbus_message_iter_close_container(&entry, &variant);
+	dbus_message_iter_close_container(&dict, &entry);
+
+	key = "message";
+	dbus_message_iter_open_container(&dict, DBUS_TYPE_DICT_ENTRY, NULL, &entry);
+	dbus_message_iter_append_basic(&entry, DBUS_TYPE_STRING, &key);
+	dbus_message_iter_open_container(&entry, DBUS_TYPE_VARIANT, "s", &variant);
+	dbus_message_iter_append_basic(&variant, DBUS_TYPE_STRING, &message);
+	dbus_message_iter_close_container(&entry, &variant);
+	dbus_message_iter_close_container(&dict, &entry);
+
+	dbus_message_iter_close_container(&iter, &dict);
+
+	g_dbus_send_message(dbus_conn, signal);
 }
 
 void device_remove_connection(struct btd_device *device, uint8_t bdaddr_type,
@@ -3798,13 +3882,20 @@ void device_remove_connection(struct btd_device *device, uint8_t bdaddr_type,
 	DBusMessage *reply;
 	bool remove_device = false;
 	bool paired_status_updated = false;
+	struct btd_disconn_params params;
 
 	if (!state->connected)
 		return;
 
+	if (bdaddr_type == BDADDR_BREDR)
+		params.bearer = "bredr";
+	else
+		params.bearer = "le";
+
 	state->connected = false;
 	state->initiator = false;
 	device->general_connect = FALSE;
+	params.reason = reason;
 
 	device_set_svc_refreshed(device, false);
 
@@ -3854,15 +3945,15 @@ void device_remove_connection(struct btd_device *device, uint8_t bdaddr_type,
 						DEVICE_INTERFACE,
 						"Paired");
 
-	if (device->bredr_state.connected || device->le_state.connected)
-		return;
-
 	device_update_last_seen(device, bdaddr_type, true);
 
 	g_slist_free_full(device->eir_uuids, g_free);
 	device->eir_uuids = NULL;
 
-	device_disconnected(device, reason);
+	device_emit_disconnected(device, &params);
+
+	if (device->bredr_state.connected || device->le_state.connected)
+		return;
 
 	g_dbus_emit_property_changed(dbus_conn, device->path,
 						DEVICE_INTERFACE, "Connected");

---
base-commit: dc8db3601001de9a085da063e0c5e456074b8963
change-id: 20250618-device-bearer-level-conn-state-3e29d56bda88

Best regards,
-- 
Ye He <ye.he@amlogic.com>



