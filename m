Return-Path: <linux-bluetooth+bounces-14751-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8688EB27EB7
	for <lists+linux-bluetooth@lfdr.de>; Fri, 15 Aug 2025 12:53:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3AE3188D9CF
	for <lists+linux-bluetooth@lfdr.de>; Fri, 15 Aug 2025 10:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D29F2FCC07;
	Fri, 15 Aug 2025 10:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k/NSnK0r"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE703A1D2
	for <linux-bluetooth@vger.kernel.org>; Fri, 15 Aug 2025 10:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755255175; cv=none; b=IPLuxP7UNAwNP6NfXTXoFDeFRxit65yaRejwhpXddi23INZtHVS6DdNhCUx9pqXzzVVn7KSwR/PuS+4cuSOMexiSfAQWNHHVXwoGgqTBhzeP1Rlx6sv68G0hsuO9mp12MmZTSy8+B90gc86LC6rXDwcX4db7H8fBCw093UtjPO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755255175; c=relaxed/simple;
	bh=VYJLGUL1De8eygRDhcRctBYq7SnIMEiVjULa0mPwOQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZsF9pLzJeyu73N7sZ3VFM1aFHRpDBsYv3rnyf7C2jEhSjez4j9mZ3UBDXUU89ibiKr9Iy1FYy8EX5oXTZGYlp35q1EMuqFWA0SrtiFQ4oakTZNy0EQTK3WYp/PhcwyGhV8yuRn8W9z7XyFdAauGzuEsCu1K3q8tJQG58Mwbmk1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k/NSnK0r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60EFFC4CEEB;
	Fri, 15 Aug 2025 10:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755255175;
	bh=VYJLGUL1De8eygRDhcRctBYq7SnIMEiVjULa0mPwOQ0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=k/NSnK0r8fP9amu7/2vT53JIgPk5K7RfMFAddqazEwDHwEEI4ejuyKq14U2Kmg/Un
	 R7P71ysc5T8hoeDDyrEflsPqo90FJ6PiXjGY4XvgEjpMUJOBLWHABmG2ZDgwahPnR9
	 hzh+9Z8CLWIeYllsfHnTBQhT0FFkdEbpu4lX/mvuXb7bHcruopEbjrWu0hvw73mfrO
	 ige5Fhad1ZNyAloH6ZCKfSO6OvZsPMNI/5WLUCbzro/S5L/hGAWcp0O3DhZpXS/FHq
	 BMXv9HPC/P1MALVX/2g2hGVb4ScJEO/4xm2CO5PqU9/PY0Mx2I5q8YEaLuwbPYfWIh
	 ctbqR9C9tjfCw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DE69CA0EE4;
	Fri, 15 Aug 2025 10:52:55 +0000 (UTC)
From: Ye He via B4 Relay <devnull+ye.he.amlogic.com@kernel.org>
Date: Fri, 15 Aug 2025 18:52:52 +0800
Subject: [PATCH bluez] device: allow selecting target broadcast device for
 synchronization
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250815-adapter-sync-broadcast-v1-1-40cb1c92a5d1@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAIMRn2gC/x3MwQrCMAyA4VcZORtYSyvqq4iHtM00IN1INlHH3
 n1lx+/w/ysYq7DBrVtB+SMmY21wpw7yi+qTUUoz+N7H/uIiUqFpZkX71YxJRyqZbMZrit6dQ+A
 wJGjxpDzI9xjfIb0X/sNj23bJLDKWbwAAAA==
X-Change-ID: 20250815-adapter-sync-broadcast-9b521644e4fb
To: Linux Bluetooth <linux-bluetooth@vger.kernel.org>
Cc: Ye He <ye.he@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755255172; l=7413;
 i=ye.he@amlogic.com; s=20250225; h=from:subject:message-id;
 bh=DwemcypPS4PBkhzkEjalaJxSIH9Iq/JreurztloSqYw=;
 b=lRtF+5WHMt3kU8KcGHygcigcE6n1CVDAGNzBRRaa6J4o3vKswhOb5EWOLp96mEZfP7KTCs46t
 Z9BYCzgxsv8BfN6felYNAGD6XhF28DzzMq0X5LgnJurYL5/+5O3KhlE
X-Developer-Key: i=ye.he@amlogic.com; a=ed25519;
 pk=hiK/p0mkXYSkX8Ooa496DfgjnbtdcyXSPFwK2LN49CE=
X-Endpoint-Received: by B4 Relay for ye.he@amlogic.com/20250225 with
 auth_id=348
X-Original-From: Ye He <ye.he@amlogic.com>
Reply-To: ye.he@amlogic.com

From: Ye He <ye.he@amlogic.com>

When multiple broadcast devices are present, bluez currently
defaults to synchronizing with the first one encountered during
the LE discovery procedure. This behavior may not align with
user expectations.

This patch introduces a new SyncBroadcast method in device1,
allowing applications to select the desired target from cached
broadcast devices according to their own criteria — for example,
choosing the device with the strongest RSSI or one matching a
specific set of UUIDs.

Signed-off-by: Ye He <ye.he@amlogic.com>
---
 doc/org.bluez.Device.rst | 15 +++++++++++++++
 plugins/neard.c          |  2 +-
 src/adapter.c            |  4 ++--
 src/device.c             | 39 ++++++++++++++++++++++++++++++++++++---
 src/device.h             |  3 ++-
 5 files changed, 56 insertions(+), 7 deletions(-)

diff --git a/doc/org.bluez.Device.rst b/doc/org.bluez.Device.rst
index 61c394dd2d0b371fe10508b8e64087ed87a2e6e0..44d929e8850659cdfbcafa81f18dd44e4aa53d03 100644
--- a/doc/org.bluez.Device.rst
+++ b/doc/org.bluez.Device.rst
@@ -155,6 +155,21 @@ Possible errors:
 :org.bluez.Error.NotConnected:
 :org.bluez.Error.DoesNotExist:
 
+void SyncBroadcast() [experimental]
+```````````````````````````````````
+
+Initiates synchronization with a broadcast source device that contains Broadcast
+Announcements UUID. This method can be used on devices that are capable of
+broadcast synchronization.
+
+If the device is not capable of broadcast synchronization, this method will
+fail with `org.bluez.Error.NotSupported`.
+
+Possible errors:
+
+:org.bluez.Error.Failed:
+:org.bluez.Error.NotSupported:
+
 Signals
 -------
 
diff --git a/plugins/neard.c b/plugins/neard.c
index c84934025cd8541bf604efe9520c1c3e9c83068f..8c231a8e84b0090b450f3b61e75cc4d4c6e4a14f 100644
--- a/plugins/neard.c
+++ b/plugins/neard.c
@@ -633,7 +633,7 @@ static void store_params(struct btd_adapter *adapter, struct btd_device *device,
 	}
 
 	if (params->services)
-		device_add_eir_uuids(device, params->services);
+		device_add_eir_uuids(device, params->services, true);
 
 	if (params->hash) {
 		btd_adapter_add_remote_oob_data(adapter, &params->address,
diff --git a/src/adapter.c b/src/adapter.c
index b771cf66ade30dcfe0a6fa41cd28f1ba46bed5a4..b12d75c815ee936aeaf3210f97831eee8ee945a2 100644
--- a/src/adapter.c
+++ b/src/adapter.c
@@ -1740,7 +1740,7 @@ static void discovery_cleanup(struct btd_adapter *adapter, int timeout)
 		next = g_slist_next(l);
 
 		if (device_is_temporary(dev) && !device_is_connectable(dev)
-			&& !btd_device_is_connected(dev))
+			&& !btd_device_is_connected(dev) && !btd_device_is_bcast_syncable(dev))
 			btd_adapter_remove_device(adapter, dev);
 	}
 }
@@ -7452,7 +7452,7 @@ void btd_adapter_device_found(struct btd_adapter *adapter,
 							eir_data.did_product,
 							eir_data.did_version);
 
-	device_add_eir_uuids(dev, eir_data.services);
+	device_add_eir_uuids(dev, eir_data.services, false);
 
 	if (adapter->discovery_list)
 		g_slist_foreach(adapter->discovery_list, filter_duplicate_data,
diff --git a/src/device.c b/src/device.c
index 0179c3dab603ece0faedfd122c87b99f35a2ca6e..410a051391529799d83102d3e8b041a264fd415a 100644
--- a/src/device.c
+++ b/src/device.c
@@ -78,6 +78,8 @@
 
 #define RSSI_THRESHOLD		8
 
+#define BCAAS_UUID_STR "00001852-0000-1000-8000-00805f9b34fb"
+
 static DBusConnection *dbus_conn = NULL;
 static unsigned service_state_cb_id;
 
@@ -2356,7 +2358,7 @@ done:
 	dev->connect = NULL;
 }
 
-void device_add_eir_uuids(struct btd_device *dev, GSList *uuids)
+void device_add_eir_uuids(struct btd_device *dev, GSList *uuids, bool probe)
 {
 	GSList *l;
 	GSList *added = NULL;
@@ -2372,7 +2374,8 @@ void device_add_eir_uuids(struct btd_device *dev, GSList *uuids)
 		dev->eir_uuids = g_slist_append(dev->eir_uuids, g_strdup(str));
 	}
 
-	device_probe_profiles(dev, added);
+	if (probe)
+		device_probe_profiles(dev, added);
 }
 
 static void add_manufacturer_data(void *data, void *user_data)
@@ -2411,7 +2414,7 @@ static void add_service_data(void *data, void *user_data)
 		return;
 
 	l = g_slist_append(NULL, sd->uuid);
-	device_add_eir_uuids(dev, l);
+	device_add_eir_uuids(dev, l, false);
 	g_slist_free(l);
 
 	g_dbus_emit_property_changed(dbus_conn, dev->path,
@@ -3488,6 +3491,21 @@ static DBusMessage *get_service_records(DBusConnection *conn, DBusMessage *msg,
 	return reply;
 }
 
+static DBusMessage *sync_broadcast_device(DBusConnection *conn, DBusMessage *msg,
+							void *user_data)
+{
+	struct btd_device *dev = user_data;
+
+	DBG("Sync with broadcast device %s", batostr(&dev->bdaddr));
+
+	if (!btd_device_is_bcast_syncable(dev))
+		return btd_error_not_supported(msg);
+
+	btd_device_add_uuid(dev, BCAAS_UUID_STR);
+
+	return dbus_message_new_method_return(msg);
+}
+
 static const GDBusMethodTable device_methods[] = {
 	{ GDBUS_ASYNC_METHOD("Disconnect", NULL, NULL, dev_disconnect) },
 	{ GDBUS_ASYNC_METHOD("Connect", NULL, NULL, dev_connect) },
@@ -3500,6 +3518,7 @@ static const GDBusMethodTable device_methods[] = {
 	{ GDBUS_EXPERIMENTAL_METHOD("GetServiceRecords", NULL,
 				    GDBUS_ARGS({ "Records", "aay" }),
 				    get_service_records) },
+	{ GDBUS_EXPERIMENTAL_ASYNC_METHOD("SyncBroadcast", NULL, NULL, sync_broadcast_device) },
 	{ }
 };
 
@@ -3654,6 +3673,20 @@ bool btd_device_bdaddr_type_connected(struct btd_device *dev, uint8_t type)
 	return dev->le_state.connected;
 }
 
+bool btd_device_is_bcast_syncable(struct btd_device *dev)
+{
+	if (dev->bredr_state.connected || dev->le_state.connected)
+		return false;
+
+	for (GSList *l = dev->eir_uuids; l != NULL; l = l->next) {
+		const char *str = l->data;
+		if (bt_uuid_strcmp(str, BCAAS_UUID_STR) == 0)
+			return true;
+	}
+
+	return false;
+}
+
 static void clear_temporary_timer(struct btd_device *dev)
 {
 	if (dev->temporary_timer) {
diff --git a/src/device.h b/src/device.h
index 9e7c30ad71864932d3da2211f30e3c7ffc4b02f7..70f4dc1a11a12bce4514fcfa362c713d4d2a5235 100644
--- a/src/device.h
+++ b/src/device.h
@@ -76,7 +76,7 @@ void btd_device_gatt_set_service_changed(struct btd_device *device,
 						uint16_t start, uint16_t end);
 bool device_attach_att(struct btd_device *dev, GIOChannel *io);
 void btd_device_add_uuid(struct btd_device *device, const char *uuid);
-void device_add_eir_uuids(struct btd_device *dev, GSList *uuids);
+void device_add_eir_uuids(struct btd_device *dev, GSList *uuids, bool probe);
 void device_set_manufacturer_data(struct btd_device *dev, GSList *list,
 							bool duplicate);
 void device_set_service_data(struct btd_device *dev, GSList *list,
@@ -110,6 +110,7 @@ void device_set_tx_power(struct btd_device *device, int8_t tx_power);
 void device_set_flags(struct btd_device *device, uint8_t flags);
 bool btd_device_is_connected(struct btd_device *dev);
 bool btd_device_bearer_is_connected(struct btd_device *dev);
+bool btd_device_is_bcast_syncable(struct btd_device *dev);
 bool btd_device_bdaddr_type_connected(struct btd_device *dev, uint8_t type);
 uint8_t btd_device_get_bdaddr_type(struct btd_device *dev);
 bool device_is_retrying(struct btd_device *device);

---
base-commit: ce82168f9f708a61efaa2bac734997db01c9ffdb
change-id: 20250815-adapter-sync-broadcast-9b521644e4fb

Best regards,
-- 
Ye He <ye.he@amlogic.com>



