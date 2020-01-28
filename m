Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60F5814C013
	for <lists+linux-bluetooth@lfdr.de>; Tue, 28 Jan 2020 19:44:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgA1SoV (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 28 Jan 2020 13:44:21 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:36544 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbgA1SoV (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 28 Jan 2020 13:44:21 -0500
Received: by mail-pj1-f65.google.com with SMTP id gv17so1504388pjb.1
        for <linux-bluetooth@vger.kernel.org>; Tue, 28 Jan 2020 10:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gDDIrXdpsxA+h/dayvrxAMPQAU0C6UW7RMmSUKmwp58=;
        b=fxTmZ9X2LrZNEsmHKo7ucxTmEqSAwMYk0LF8DaFCD2QdkFUdOxRJQIf8D0a78O9Sr3
         f8zk5CsiUQkHGgSkAToyra0HHXAPudHri1Y8WrGe0T/xG5itdzVuWw48cSCBJxkHt1UL
         H9Hz+NLij+SHEws1+byWF1qpBc4KYAXpXcJpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gDDIrXdpsxA+h/dayvrxAMPQAU0C6UW7RMmSUKmwp58=;
        b=L/DTbmCKBvAjbKHFJivSSdwdkJdYa/EVkhTGc7jxT9jn1TdrOyN6fM36iqtP+UglA7
         it9RNRa1fNWa0AANfXo5Wbw7oPNJd/zsS61B6N/es6xVqAKKpVPeIbUyPmz8OSxi3VkC
         rw47AQKemgbkbJ3QIL+nsQIF1zi0pDXd0UGASjHsvi5rQBOFMxR8TiDgM9raEkXSu+71
         DL1K8Oy+zS7Wftr8RL0nYARffqcRyhx4Aeet10TuK1rFwPjgKTSWFRBfkbYsj1rTxp5Q
         ltqhR8RhXGFVWoR2Yut+RSwLKhair6MZ6d9mGnRySJux1Es3r47jBHs4jevqdjakoci7
         EBKQ==
X-Gm-Message-State: APjAAAV9oFJcttHv2Gg+fGRys8oshZk6ZqJ6sRf8/bd0Fgor+F0gmsu6
        rCVSH6OL9FqTqdZlviX/9aLgog==
X-Google-Smtp-Source: APXvYqyJV7ZTOVf52G8N1I/w3KTIy6V6GzyqIXY/vsX5aX8N9HHfT/hYk4BOH7aYmpLMwyMLgi2t+g==
X-Received: by 2002:a17:902:968c:: with SMTP id n12mr24537921plp.144.1580237060251;
        Tue, 28 Jan 2020 10:44:20 -0800 (PST)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id f9sm20470903pfd.141.2020.01.28.10.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2020 10:44:19 -0800 (PST)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     luiz.dentz@gmail.com, marcel@holtmann.org, alainm@chromium.org
Cc:     linux-bluetooth@vger.kernel.org,
        chromeos-bluetooth-upstreaming@chromium.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Subject: [BlueZ PATCH v3 2/5] device: Allow device to be marked as wake capable
Date:   Tue, 28 Jan 2020 10:43:52 -0800
Message-Id: <20200128104327.BlueZ.v3.2.I56a225147d9cabef55f94b57129a5e37ea79d165@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

If a device is capable of waking the host system from suspend, it should
be marked as wake capable. We introduce a new management operation here
to set this property and implement the API needed to call it. We also
add the dbus endpoint to allow the wake capable setting to be
controlled.

---

Changes in v3:
* Added profile_wake_support and made wake_capable dependent on it

Changes in v2:
* Added dbus api "WakeCapable" to set value
* Update device_set_wake_capable to be called by
  adapter_set_wake_capable_complete so we can emit property changed

 lib/mgmt.h    |  9 ++++++
 src/adapter.c | 65 ++++++++++++++++++++++++++++++++++++++++
 src/adapter.h |  2 ++
 src/device.c  | 83 +++++++++++++++++++++++++++++++++++++++++++++++++++
 src/device.h  |  5 ++++
 5 files changed, 164 insertions(+)

diff --git a/lib/mgmt.h b/lib/mgmt.h
index 276445d0a..cf19dd086 100644
--- a/lib/mgmt.h
+++ b/lib/mgmt.h
@@ -599,6 +599,13 @@ struct mgmt_cp_set_blocked_keys {
 	struct mgmt_blocked_key_info keys[0];
 } __packed;
 
+#define MGMT_OP_SET_WAKE_CAPABLE			0x0047
+#define MGMT_SET_WAKE_CAPABLE_SIZE			8
+struct mgmt_cp_set_wake_capable {
+	struct mgmt_addr_info addr;
+	uint8_t wake_enable;
+} __packed;
+
 #define MGMT_EV_CMD_COMPLETE		0x0001
 struct mgmt_ev_cmd_complete {
 	uint16_t opcode;
@@ -893,6 +900,8 @@ static const char *mgmt_op[] = {
 	"Set Appearance",
 	"Get PHY Configuration",
 	"Set PHY Configuration",
+	"Set Blocked Keys",
+	"Set Wake Capable",
 };
 
 static const char *mgmt_ev[] = {
diff --git a/src/adapter.c b/src/adapter.c
index 329c3ae0b..294a9c9e4 100644
--- a/src/adapter.c
+++ b/src/adapter.c
@@ -4685,6 +4685,71 @@ void adapter_whitelist_add(struct btd_adapter *adapter, struct btd_device *dev)
 				add_whitelist_complete, adapter, NULL);
 }
 
+static void set_wake_capable_complete(uint8_t status, uint16_t length,
+					const void *param, void *user_data)
+{
+	const struct mgmt_cp_set_wake_capable *rp = param;
+	struct btd_adapter *adapter = user_data;
+	struct btd_device *dev;
+
+	char addr[18];
+
+	if (length < sizeof(*rp)) {
+		btd_error(adapter->dev_id,
+			  "Too small Set Wake Capable complete event");
+		return;
+        }
+
+	ba2str(&rp->addr.bdaddr, addr);
+
+	dev = btd_adapter_find_device(adapter, &rp->addr.bdaddr,
+				      rp->addr.type);
+	if (!dev) {
+		btd_error(adapter->dev_id,
+			  "Set Wake Capable complete for unknown device %s",
+			  addr);
+		return;
+	}
+
+	if (status != MGMT_STATUS_SUCCESS) {
+		btd_error(adapter->dev_id,
+			  "Failed to set wake capable %s(%u) = %d: %s (0x%02x)",
+			  addr, rp->addr.type, rp->wake_enable,
+			  mgmt_errstr(status), status);
+		return;
+	}
+
+	device_set_wake_capable(dev, rp->wake_enable);
+
+	DBG("Set wake capable complete %s (%u)", addr, rp->addr.type);
+}
+
+void adapter_set_wake_capable(struct btd_adapter* adapter,
+			      struct btd_device* dev,
+			      bool wake_enable)
+{
+	struct mgmt_cp_set_wake_capable cp;
+	char addr[18];
+
+	memset(&cp, 0, sizeof(cp));
+	bacpy(&cp.addr.bdaddr, device_get_address(dev));
+	cp.addr.type = btd_device_get_bdaddr_type(dev);
+	cp.wake_enable = device_get_profile_wake_support(dev) && wake_enable;
+
+	ba2strlc(&cp.addr.bdaddr, addr);
+
+	if (!mgmt_send(adapter->mgmt, MGMT_OP_SET_WAKE_CAPABLE, adapter->dev_id,
+		       sizeof(cp), &cp, set_wake_capable_complete, adapter,
+		       NULL)) {
+		btd_warn(adapter->dev_id,
+			 "Could not set wake capable = %u on %s (%u)",
+			 cp.wake_enable, addr, cp.addr.type);
+	}
+
+	DBG("Setting %s (%u) to wake capable = %u", addr,
+	    cp.addr.type, cp.wake_enable);
+}
+
 static void remove_whitelist_complete(uint8_t status, uint16_t length,
 					const void *param, void *user_data)
 {
diff --git a/src/adapter.h b/src/adapter.h
index d0a5253bd..e990279ed 100644
--- a/src/adapter.h
+++ b/src/adapter.h
@@ -221,6 +221,8 @@ void adapter_whitelist_add(struct btd_adapter *adapter,
 						struct btd_device *dev);
 void adapter_whitelist_remove(struct btd_adapter *adapter,
 						struct btd_device *dev);
+void adapter_set_wake_capable(struct btd_adapter* adapter,
+			      struct btd_device* dev, bool wake_enable);
 
 void btd_adapter_set_oob_handler(struct btd_adapter *adapter,
 						struct oob_handler *handler);
diff --git a/src/device.c b/src/device.c
index a4fe10980..7a455e1e9 100644
--- a/src/device.c
+++ b/src/device.c
@@ -189,6 +189,8 @@ struct btd_device {
 	bool		le;
 	bool		pending_paired;		/* "Paired" waiting for SDP */
 	bool		svc_refreshed;
+	bool		profile_wake_support;	/* Profile supports wake */
+	bool		wake_capable;		/* Can wake from suspend */
 	GSList		*svc_callbacks;
 	GSList		*eir_uuids;
 	struct bt_ad	*ad;
@@ -415,6 +417,9 @@ static gboolean store_device_info_cb(gpointer user_data)
 	g_key_file_set_boolean(key_file, "General", "Blocked",
 							device->blocked);
 
+	g_key_file_set_boolean(key_file, "General", "WakeCapable",
+							device->wake_capable);
+
 	if (device->uuids) {
 		GSList *l;
 		int i;
@@ -1318,6 +1323,47 @@ dev_property_advertising_data_exist(const GDBusPropertyTable *property,
 	return bt_ad_has_data(device->ad, NULL);
 }
 
+static gboolean
+dev_property_get_wake_capable(const GDBusPropertyTable *property,
+			     DBusMessageIter *iter, void *data)
+{
+	struct btd_device *device = data;
+	dbus_bool_t wake_capable =
+			device_get_wake_capable(device) ? TRUE : FALSE;
+
+	dbus_message_iter_append_basic(iter, DBUS_TYPE_BOOLEAN, &wake_capable);
+
+	return TRUE;
+}
+
+static void dev_property_set_wake_capable(const GDBusPropertyTable *property,
+					 DBusMessageIter *value,
+					 GDBusPendingPropertySet id, void *data)
+{
+	struct btd_device *device = data;
+	dbus_bool_t b;
+
+	if (dbus_message_iter_get_arg_type(value) != DBUS_TYPE_BOOLEAN) {
+		g_dbus_pending_property_error(id,
+					ERROR_INTERFACE ".InvalidArguments",
+					"Invalid arguments in method call");
+		return;
+	}
+
+	dbus_message_iter_get_basic(value, &b);
+
+	adapter_set_wake_capable(device->adapter, device, b == TRUE);
+	g_dbus_pending_property_success(id);
+}
+
+static gboolean dev_property_wake_capable_exist(
+		const GDBusPropertyTable *property, void *data)
+{
+	struct btd_device *device = data;
+
+	return device_get_profile_wake_support(device) ? TRUE : FALSE;
+}
+
 static gboolean disconnect_all(gpointer user_data)
 {
 	struct btd_device *device = user_data;
@@ -1509,6 +1555,34 @@ void device_set_ltk_enc_size(struct btd_device *device, uint8_t enc_size)
 	bt_att_set_enc_key_size(device->att, device->ltk_enc_size);
 }
 
+bool device_get_profile_wake_support(struct btd_device *device)
+{
+	return device->profile_wake_support;
+}
+
+void device_set_profile_wake_support(struct btd_device *device,
+				     bool wake_support)
+{
+	device->profile_wake_support = wake_support;
+	/* WakeCapable is only visible when wake_support is true */
+	g_dbus_emit_property_changed(dbus_conn, device->path, DEVICE_INTERFACE,
+				     "WakeCapable");
+}
+
+bool device_get_wake_capable(struct btd_device *device)
+{
+	return device->wake_capable;
+}
+
+void device_set_wake_capable(struct btd_device *device, bool wake_capable)
+{
+	device->wake_capable = wake_capable;
+
+	store_device_info(device);
+	g_dbus_emit_property_changed(dbus_conn, device->path, DEVICE_INTERFACE,
+				     "WakeCapable");
+}
+
 static void device_set_auto_connect(struct btd_device *device, gboolean enable)
 {
 	char addr[18];
@@ -2779,6 +2853,9 @@ static const GDBusPropertyTable device_properties[] = {
 	{ "AdvertisingData", "a{yv}", dev_property_get_advertising_data,
 				NULL, dev_property_advertising_data_exist,
 				G_DBUS_PROPERTY_FLAG_EXPERIMENTAL },
+	{ "WakeCapable", "b", dev_property_get_wake_capable,
+				dev_property_set_wake_capable,
+				dev_property_wake_capable_exist },
 	{ }
 };
 
@@ -3030,6 +3107,7 @@ static void load_info(struct btd_device *device, const char *local,
 	char *str;
 	gboolean store_needed = FALSE;
 	gboolean blocked;
+	gboolean wake_capable;
 	char **uuids;
 	int source, vendor, product, version;
 	char **techno, **t;
@@ -3141,6 +3219,11 @@ next:
 		btd_device_set_pnpid(device, source, vendor, product, version);
 	}
 
+	/* Mark wake capable */
+	wake_capable = g_key_file_get_boolean(key_file, "General",
+					      "WakeCapable", NULL);
+	adapter_set_wake_capable(device->adapter, device, wake_capable == TRUE);
+
 	if (store_needed)
 		store_device_info(device);
 }
diff --git a/src/device.h b/src/device.h
index 06b100499..43f633e38 100644
--- a/src/device.h
+++ b/src/device.h
@@ -139,6 +139,11 @@ void device_store_svc_chng_ccc(struct btd_device *device, uint8_t bdaddr_type,
 								uint16_t value);
 void device_load_svc_chng_ccc(struct btd_device *device, uint16_t *ccc_le,
 							uint16_t *ccc_bredr);
+bool device_get_profile_wake_support(struct btd_device *device);
+void device_set_profile_wake_support(struct btd_device *device,
+				     bool wake_support);
+bool device_get_wake_capable(struct btd_device *device);
+void device_set_wake_capable(struct btd_device *device, bool wake_capable);
 
 typedef void (*disconnect_watch) (struct btd_device *device, gboolean removal,
 					void *user_data);
-- 
2.25.0.341.g760bfbb309-goog

