Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE0835A9567
	for <lists+linux-bluetooth@lfdr.de>; Thu,  1 Sep 2022 13:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234508AbiIALH6 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 1 Sep 2022 07:07:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234229AbiIALHb (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 1 Sep 2022 07:07:31 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66A69138584
        for <linux-bluetooth@vger.kernel.org>; Thu,  1 Sep 2022 04:07:28 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id DA7E44000F
        for <linux-bluetooth@vger.kernel.org>; Thu,  1 Sep 2022 11:07:26 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v7 2/6] adapter: Implement PowerState property
Date:   Thu,  1 Sep 2022 13:07:15 +0200
Message-Id: <20220901110719.176944-2-hadess@hadess.net>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901110719.176944-1-hadess@hadess.net>
References: <20220901110719.176944-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This property should allow any program to show whether an adapter is in
the process of being turned on.

As turning on an adapter isn't instantaneous, it's important that the UI
reflects the transitional state of the adapter's power, and doesn't
assume the device is already turned on but not yet working, or still off
despite having requested for it to be turned on, in both cases making
the UI feel unresponsive.

This can also not be implemented in front-ends directly as, then,
the status of an adapter wouldn't be reflected correctly in the Settings
window if it's turned on in the system menu. Implementing it in the
front-ends would also preclude from having feedback about the state of
the adapter when bluetoothd is the one powering up the adapter after the
rfkill was unblocked.

See https://gitlab.gnome.org/GNOME/gnome-bluetooth/-/issues/121
and the original https://gitlab.gnome.org/GNOME/gnome-shell/-/issues/5773
---
 src/adapter.c | 139 ++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 128 insertions(+), 11 deletions(-)

diff --git a/src/adapter.c b/src/adapter.c
index 7c11a688d..59afbcb6d 100644
--- a/src/adapter.c
+++ b/src/adapter.c
@@ -239,6 +239,14 @@ struct btd_adapter_pin_cb_iter {
 	/* When the iterator reaches the end, it is NULL and attempt is 0 */
 };
 
+enum {
+	ADAPTER_POWER_STATE_OFF,
+	ADAPTER_POWER_STATE_ON,
+	ADAPTER_POWER_STATE_ON_DISABLING,
+	ADAPTER_POWER_STATE_OFF_ENABLING,
+	ADAPTER_POWER_STATE_OFF_BLOCKED,
+};
+
 struct btd_adapter {
 	int ref_count;
 
@@ -250,9 +258,9 @@ struct btd_adapter {
 	uint32_t dev_class;		/* controller class of device */
 	char *name;			/* controller device name */
 	char *short_name;		/* controller short name */
-	bool blocked;			/* whether rfkill is enabled */
 	uint32_t supported_settings;	/* controller supported settings */
 	uint32_t pending_settings;	/* pending controller settings */
+	uint32_t power_state;		/* the power state */
 	uint32_t current_settings;	/* current controller settings */
 
 	char *path;			/* adapter object path */
@@ -326,6 +334,24 @@ struct btd_adapter {
 	struct queue *exps;
 };
 
+static char *adapter_power_state_str(uint32_t power_state)
+{
+	switch (power_state) {
+	case ADAPTER_POWER_STATE_OFF:
+		return "off";
+	case ADAPTER_POWER_STATE_ON:
+		return "on";
+	case ADAPTER_POWER_STATE_ON_DISABLING:
+		return "on-disabling";
+	case ADAPTER_POWER_STATE_OFF_ENABLING:
+		return "off-enabling";
+	case ADAPTER_POWER_STATE_OFF_BLOCKED:
+		return "off-blocked";
+	}
+	DBG("Invalid power state %d", power_state);
+	return "";
+}
+
 typedef enum {
 	ADAPTER_AUTHORIZE_DISCONNECTED = 0,
 	ADAPTER_AUTHORIZE_CHECK_CONNECTED
@@ -619,6 +645,29 @@ static void settings_changed(struct btd_adapter *adapter, uint32_t settings)
 	}
 }
 
+static void adapter_set_power_state(struct btd_adapter *adapter, uint32_t value)
+{
+	if (adapter->power_state == value)
+		return;
+
+	DBG("%s", adapter_power_state_str(value));
+	adapter->power_state = value;
+	g_dbus_emit_property_changed(dbus_conn, adapter->path,
+					ADAPTER_INTERFACE, "PowerState");
+}
+
+static void reset_power_state_target(struct btd_adapter *adapter,
+					uint32_t value)
+{
+	if (value &&
+	    adapter->power_state == ADAPTER_POWER_STATE_OFF_ENABLING) {
+		adapter_set_power_state(adapter, ADAPTER_POWER_STATE_ON);
+	} else if (!value &&
+		   adapter->power_state == ADAPTER_POWER_STATE_ON_DISABLING) {
+		adapter_set_power_state(adapter, ADAPTER_POWER_STATE_OFF);
+	}
+}
+
 static void new_settings_callback(uint16_t index, uint16_t length,
 					const void *param, void *user_data)
 {
@@ -636,6 +685,12 @@ static void new_settings_callback(uint16_t index, uint16_t length,
 	if (settings == adapter->current_settings)
 		return;
 
+	if ((adapter->current_settings ^ settings) & MGMT_SETTING_POWERED) {
+		reset_power_state_target(adapter,
+					settings & MGMT_SETTING_POWERED ?
+					0x01 : 0x00);
+	}
+
 	DBG("Settings: 0x%08x", settings);
 
 	settings_changed(adapter, settings);
@@ -644,6 +699,7 @@ static void new_settings_callback(uint16_t index, uint16_t length,
 struct set_mode_data {
 	struct btd_adapter *adapter;
 	uint32_t setting;
+	uint8_t value;
 };
 
 static void set_mode_complete(uint8_t status, uint16_t length,
@@ -656,8 +712,12 @@ static void set_mode_complete(uint8_t status, uint16_t length,
 		btd_error(adapter->dev_id, "Failed to set mode: %s (0x%02x)",
 						mgmt_errstr(status), status);
 		if (status == MGMT_STATUS_RFKILLED)
-			adapter->blocked = true;
+			adapter_set_power_state(adapter,
+					ADAPTER_POWER_STATE_OFF_BLOCKED);
 		adapter->pending_settings &= ~data->setting;
+		if (status != MGMT_STATUS_RFKILLED &&
+		    data->setting & MGMT_SETTING_POWERED)
+			reset_power_state_target(adapter, data->value);
 		return;
 	}
 
@@ -695,6 +755,11 @@ static bool set_mode(struct btd_adapter *adapter, uint16_t opcode,
 	switch (opcode) {
 	case MGMT_OP_SET_POWERED:
 		setting = MGMT_SETTING_POWERED;
+		if (adapter->power_state != ADAPTER_POWER_STATE_OFF_BLOCKED) {
+			adapter_set_power_state(adapter, mode ?
+					ADAPTER_POWER_STATE_OFF_ENABLING :
+					ADAPTER_POWER_STATE_ON_DISABLING);
+		}
 		break;
 	case MGMT_OP_SET_CONNECTABLE:
 		setting = MGMT_SETTING_CONNECTABLE;
@@ -715,6 +780,7 @@ static bool set_mode(struct btd_adapter *adapter, uint16_t opcode,
 	data = g_new0(struct set_mode_data, 1);
 	data->adapter = adapter;
 	data->setting = setting;
+	data->value = mode;
 
 	if (mgmt_send(adapter->mgmt, opcode,
 				adapter->dev_id, sizeof(cp), &cp,
@@ -722,8 +788,13 @@ static bool set_mode(struct btd_adapter *adapter, uint16_t opcode,
 		adapter->pending_settings |= setting;
 		return true;
 	}
-
 	g_free(data);
+	if (setting == MGMT_SETTING_POWERED) {
+		/* cancel the earlier setting */
+		adapter_set_power_state(adapter, mode ?
+					ADAPTER_POWER_STATE_OFF :
+					ADAPTER_POWER_STATE_ON);
+	}
 	btd_error(adapter->dev_id, "Failed to set mode for index %u",
 							adapter->dev_id);
 
@@ -2934,6 +3005,7 @@ struct property_set_data {
 	struct btd_adapter *adapter;
 	uint32_t setting;
 	GDBusPendingPropertySet id;
+	uint8_t value;
 };
 
 static void property_set_mode_complete(uint8_t status, uint16_t length,
@@ -2952,7 +3024,8 @@ static void property_set_mode_complete(uint8_t status, uint16_t length,
 
 		if (status == MGMT_STATUS_RFKILLED) {
 			dbus_err = ERROR_INTERFACE ".Blocked";
-			adapter->blocked = true;
+			adapter_set_power_state(adapter,
+					ADAPTER_POWER_STATE_OFF_BLOCKED);
 		} else {
 			dbus_err = ERROR_INTERFACE ".Failed";
 		}
@@ -2961,6 +3034,9 @@ static void property_set_mode_complete(uint8_t status, uint16_t length,
 							mgmt_errstr(status));
 
 		adapter->pending_settings &= ~data->setting;
+		if (status != MGMT_STATUS_RFKILLED &&
+		    data->setting & MGMT_SETTING_POWERED)
+			reset_power_state_target(adapter, data->value);
 		return;
 	}
 
@@ -3084,6 +3160,15 @@ static void property_set_mode(struct btd_adapter *adapter, uint32_t setting,
 	data->adapter = adapter;
 	data->setting = setting;
 	data->id = id;
+	data->setting = setting;
+	data->value = mode;
+
+	if (setting == MGMT_SETTING_POWERED &&
+	    adapter->power_state != ADAPTER_POWER_STATE_OFF_BLOCKED) {
+		adapter_set_power_state(adapter, mode ?
+					ADAPTER_POWER_STATE_OFF_ENABLING :
+					ADAPTER_POWER_STATE_ON_DISABLING);
+	}
 
 	if (mgmt_send(adapter->mgmt, opcode, adapter->dev_id, len, param,
 			property_set_mode_complete, data, g_free) > 0) {
@@ -3092,6 +3177,12 @@ static void property_set_mode(struct btd_adapter *adapter, uint32_t setting,
 	}
 
 	g_free(data);
+	if (setting == MGMT_SETTING_POWERED) {
+		/* cancel the earlier setting */
+		adapter_set_power_state(adapter, mode ?
+					ADAPTER_POWER_STATE_OFF :
+					ADAPTER_POWER_STATE_ON);
+	}
 
 failed:
 	btd_error(adapter->dev_id, "Failed to set mode for index %u",
@@ -3123,6 +3214,18 @@ static void property_set_powered(const GDBusPropertyTable *property,
 	property_set_mode(adapter, MGMT_SETTING_POWERED, iter, id);
 }
 
+static gboolean property_get_power_state(const GDBusPropertyTable *property,
+					DBusMessageIter *iter, void *user_data)
+{
+	struct btd_adapter *adapter = user_data;
+	const char *str;
+
+	str = adapter_power_state_str(adapter->power_state);
+	dbus_message_iter_append_basic(iter, DBUS_TYPE_STRING, &str);
+
+	return TRUE;
+}
+
 static gboolean property_get_discoverable(const GDBusPropertyTable *property,
 					DBusMessageIter *iter, void *user_data)
 {
@@ -3761,6 +3864,8 @@ static const GDBusPropertyTable adapter_properties[] = {
 	{ "Alias", "s", property_get_alias, property_set_alias },
 	{ "Class", "u", property_get_class },
 	{ "Powered", "b", property_get_powered, property_set_powered },
+	{ "PowerState", "s", property_get_power_state, NULL, NULL,
+			     G_DBUS_PROPERTY_FLAG_EXPERIMENTAL },
 	{ "Discoverable", "b", property_get_discoverable,
 					property_set_discoverable },
 	{ "DiscoverableTimeout", "u", property_get_discoverable_timeout,
@@ -5567,6 +5672,7 @@ static void adapter_start(struct btd_adapter *adapter)
 {
 	g_dbus_emit_property_changed(dbus_conn, adapter->path,
 						ADAPTER_INTERFACE, "Powered");
+	adapter_set_power_state(adapter, ADAPTER_POWER_STATE_ON);
 
 	DBG("adapter %s has been enabled", adapter->path);
 
@@ -6697,7 +6803,7 @@ static struct btd_adapter *btd_adapter_new(uint16_t index)
 	adapter->pincode_requested = false;
 	blocked = rfkill_get_blocked(index);
 	if (blocked > 0)
-		adapter->blocked = true;
+		adapter->power_state = ADAPTER_POWER_STATE_OFF_BLOCKED;
 
 	/*
 	 * Setup default configuration values. These are either adapter
@@ -6724,7 +6830,8 @@ static struct btd_adapter *btd_adapter_new(uint16_t index)
 	DBG("Discoverable timeout: %u seconds", adapter->discoverable_timeout);
 	DBG("Pairable timeout: %u seconds", adapter->pairable_timeout);
 	if (blocked > 0)
-		DBG("Blocked: yes");
+		DBG("Power state: %s",
+			adapter_power_state_str(adapter->power_state));
 
 	adapter->auths = g_queue_new();
 	adapter->exps = queue_new();
@@ -7316,6 +7423,9 @@ static void adapter_stop(struct btd_adapter *adapter)
 
 	g_dbus_emit_property_changed(dbus_conn, adapter->path,
 						ADAPTER_INTERFACE, "Powered");
+	g_dbus_emit_property_changed(dbus_conn, adapter->path,
+						ADAPTER_INTERFACE,
+						"PowerState");
 
 	DBG("adapter %s has been disabled", adapter->path);
 }
@@ -7592,10 +7702,18 @@ int btd_cancel_authorization(guint id)
 
 int btd_adapter_restore_powered(struct btd_adapter *adapter)
 {
-	if (adapter->blocked)
-		adapter->blocked = false;
+	bool powered;
 
-	if (btd_adapter_get_powered(adapter))
+	powered = btd_adapter_get_powered(adapter);
+	if (adapter->power_state == ADAPTER_POWER_STATE_OFF_BLOCKED &&
+	    rfkill_get_blocked(adapter->dev_id) == 0) {
+		adapter_set_power_state(adapter,
+					powered ?
+					ADAPTER_POWER_STATE_ON :
+					ADAPTER_POWER_STATE_OFF);
+	}
+
+	if (powered)
 		return 0;
 
 	set_mode(adapter, MGMT_OP_SET_POWERED, 0x01);
@@ -7605,8 +7723,7 @@ int btd_adapter_restore_powered(struct btd_adapter *adapter)
 
 int btd_adapter_set_blocked(struct btd_adapter *adapter)
 {
-	if (!adapter->blocked)
-		adapter->blocked = true;
+	adapter_set_power_state(adapter, ADAPTER_POWER_STATE_OFF_BLOCKED);
 	return 0;
 }
 
-- 
2.37.2

