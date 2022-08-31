Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ADFE5A79FE
	for <lists+linux-bluetooth@lfdr.de>; Wed, 31 Aug 2022 11:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231935AbiHaJUC (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 31 Aug 2022 05:20:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230108AbiHaJTg (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 31 Aug 2022 05:19:36 -0400
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [IPv6:2001:4b98:dc4:8::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88B2ECACB7
        for <linux-bluetooth@vger.kernel.org>; Wed, 31 Aug 2022 02:19:14 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id A2BCD200012
        for <linux-bluetooth@vger.kernel.org>; Wed, 31 Aug 2022 09:19:12 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v4 1/6] adapter: Keep track of whether the adapter is rfkill'ed
Date:   Wed, 31 Aug 2022 11:19:07 +0200
Message-Id: <20220831091912.47894-1-hadess@hadess.net>
X-Mailer: git-send-email 2.37.2
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

Instead of only replying to D-Bus requests with an error saying the
adapter is blocked, keep track of the rfkill being enabled or disabled
so we know the rfkill state of the adapter at all times.
---
 src/adapter.c | 25 +++++++++++++++++++++++--
 src/adapter.h |  1 +
 src/rfkill.c  |  8 ++++++--
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/src/adapter.c b/src/adapter.c
index b453e86a0..641db67f9 100644
--- a/src/adapter.c
+++ b/src/adapter.c
@@ -250,6 +250,7 @@ struct btd_adapter {
 	uint32_t dev_class;		/* controller class of device */
 	char *name;			/* controller device name */
 	char *short_name;		/* controller short name */
+	bool blocked;			/* whether rfkill is enabled */
 	uint32_t supported_settings;	/* controller supported settings */
 	uint32_t pending_settings;	/* pending controller settings */
 	uint32_t current_settings;	/* current controller settings */
@@ -654,6 +655,8 @@ static void set_mode_complete(uint8_t status, uint16_t length,
 	if (status != MGMT_STATUS_SUCCESS) {
 		btd_error(adapter->dev_id, "Failed to set mode: %s (0x%02x)",
 						mgmt_errstr(status), status);
+		if (status == MGMT_STATUS_RFKILLED)
+			adapter->blocked = true;
 		adapter->pending_settings &= ~data->setting;
 		return;
 	}
@@ -2914,10 +2917,12 @@ static void property_set_mode_complete(uint8_t status, uint16_t length,
 		btd_error(adapter->dev_id, "Failed to set mode: %s (0x%02x)",
 						mgmt_errstr(status), status);
 
-		if (status == MGMT_STATUS_RFKILLED)
+		if (status == MGMT_STATUS_RFKILLED) {
 			dbus_err = ERROR_INTERFACE ".Blocked";
-		else
+			adapter->blocked = true;
+		} else {
 			dbus_err = ERROR_INTERFACE ".Failed";
+		}
 
 		g_dbus_pending_property_error(data->id, dbus_err,
 							mgmt_errstr(status));
@@ -7548,6 +7553,12 @@ int btd_cancel_authorization(guint id)
 
 int btd_adapter_restore_powered(struct btd_adapter *adapter)
 {
+	if (adapter->blocked) {
+		adapter->blocked = false;
+	        g_dbus_emit_property_changed(dbus_conn, adapter->path,
+					ADAPTER_INTERFACE, "PowerState");
+	}
+
 	if (btd_adapter_get_powered(adapter))
 		return 0;
 
@@ -7556,6 +7567,16 @@ int btd_adapter_restore_powered(struct btd_adapter *adapter)
 	return 0;
 }
 
+int btd_adapter_set_blocked(struct btd_adapter *adapter)
+{
+	if (!adapter->blocked) {
+		adapter->blocked = true;
+	        g_dbus_emit_property_changed(dbus_conn, adapter->path,
+					ADAPTER_INTERFACE, "PowerState");
+	}
+	return 0;
+}
+
 void btd_adapter_register_pin_cb(struct btd_adapter *adapter,
 							btd_adapter_pin_cb_t cb)
 {
diff --git a/src/adapter.h b/src/adapter.h
index b09044edd..332c0b239 100644
--- a/src/adapter.h
+++ b/src/adapter.h
@@ -143,6 +143,7 @@ guint btd_request_authorization_cable_configured(const bdaddr_t *src, const bdad
 int btd_cancel_authorization(guint id);
 
 int btd_adapter_restore_powered(struct btd_adapter *adapter);
+int btd_adapter_set_blocked(struct btd_adapter *adapter);
 
 typedef ssize_t (*btd_adapter_pin_cb_t) (struct btd_adapter *adapter,
 			struct btd_device *dev, char *out, bool *display,
diff --git a/src/rfkill.c b/src/rfkill.c
index 2099c5ac5..93f8e0e12 100644
--- a/src/rfkill.c
+++ b/src/rfkill.c
@@ -61,6 +61,7 @@ static gboolean rfkill_event(GIOChannel *chan,
 	struct rfkill_event event = { 0 };
 	struct btd_adapter *adapter;
 	char sysname[PATH_MAX];
+	bool blocked = false;
 	ssize_t len;
 	int fd, id;
 
@@ -84,7 +85,7 @@ static gboolean rfkill_event(GIOChannel *chan,
 						event.soft, event.hard);
 
 	if (event.soft || event.hard)
-		return TRUE;
+		blocked = true;
 
 	if (event.op != RFKILL_OP_CHANGE)
 		return TRUE;
@@ -122,7 +123,10 @@ static gboolean rfkill_event(GIOChannel *chan,
 
 	DBG("RFKILL unblock for hci%d", id);
 
-	btd_adapter_restore_powered(adapter);
+	if (blocked)
+		btd_adapter_set_blocked(adapter);
+	else
+		btd_adapter_restore_powered(adapter);
 
 	return TRUE;
 }
-- 
2.37.2

