Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5549125B969
	for <lists+linux-bluetooth@lfdr.de>; Thu,  3 Sep 2020 05:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728291AbgICDvU (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 2 Sep 2020 23:51:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726654AbgICDvQ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 2 Sep 2020 23:51:16 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8A2BC061244
        for <linux-bluetooth@vger.kernel.org>; Wed,  2 Sep 2020 20:51:16 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id b127so1499393ybh.21
        for <linux-bluetooth@vger.kernel.org>; Wed, 02 Sep 2020 20:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=EGjzT6d+Azic/akyGX5B572G3ItSZIgHZP+YnPGKCUI=;
        b=MdTVz09dj4ZVgBGfZcDwREjhmh5T7p5N0DdqyzYfOsn2m6MkbNqub1UVCYzNg023jS
         e+Z0Q7pkFvzAEc+zgjdyCUAVQWo0vGG3mc+ZU2XSv4Ml4d/UPMAo75pAMfS2EjnQMFxs
         yYe8Nj0GBH0aviRwnvyjx8vNEVyxdNgKoMqNVLiRyViDPLmY1Tq6FQmdEYX9Qg6FRkJt
         1utJaYXUZ8hHHNLitUwIN+azMo4Xk0mPONMs7tW3F30J5lGSc02C0O9yvK6uSXjhkbKp
         /x00OIFKGG4pvbixG3J4iYcLJX14x1VgEB0sYy2g6JZJAgqQrQykss2RMxkNfrCkXfV8
         b6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=EGjzT6d+Azic/akyGX5B572G3ItSZIgHZP+YnPGKCUI=;
        b=CWldvm78iBvNO5hhuyH1Wbk/XR624iksbKoszi3iBjXAbVJ9F1sVbB3txa1eyaHKnZ
         8BNQIFsU0FFIXmDQ6kz4mwhXHNNXEQEgkPj3wHOFmVwHnbYUrd/nnannNh9mz2GQ50I3
         It8P8FCb0I60RmGwx4Fk/Kjky/d/5flGIZZLuG9m5aDN4IK4Xngfo6j+WnlIbWtbOLwe
         jKR+8rtcyBt74/KXmrzqm3HKot/1Q6bnleIrSANJ4jcDzR4O1GgskyxebV2+61Dm3yMj
         c2Cx0cjPWa/1qz85ESyixAQzwygsxLHPlw+mqk+NsJmIRNwgnZ3CWKQJc3zH5HVmbCTu
         q3pA==
X-Gm-Message-State: AOAM533FJ6wscoaetVJ49OEkmcIOKPrhvPSRpGAT6cbxUtDqesqotOKN
        sjxOYpuuIN8ppQLs82toZmFUu53Vm1ITARa9CovsIlDY3aQwL1HLsVuPg31C8WMG9iTJFp6JUSz
        CAbT9/VabMPdYdauo1VgrF+JQ4m8okakSOLkiDHpQGbHgNRb7hCkPtyfYK43lavGLQ/Ff74mqec
        yL
X-Google-Smtp-Source: ABdhPJyJ8uZdT72Sw5Qj/MBRZ+WqVFJD+f4vrn2Q88V+Qkz/icvW/yV8s5LrZ9tuTpDd8RVhV37lhWqHT9Ud
X-Received: from apusaka-p920.tpe.corp.google.com ([2401:fa00:1:10:f693:9fff:fef4:2347])
 (user=apusaka job=sendgmr) by 2002:a25:8b09:: with SMTP id
 i9mr1396988ybl.149.1599105075840; Wed, 02 Sep 2020 20:51:15 -0700 (PDT)
Date:   Thu,  3 Sep 2020 11:50:39 +0800
In-Reply-To: <20200903115020.Bluez.v3.1.I6767a68b7e7b6cfb6d8046ee8b66c8e7d008d3e6@changeid>
Message-Id: <20200903115020.Bluez.v3.2.Ia9ec99e1edde324e55c91828218268bc1b614136@changeid>
Mime-Version: 1.0
References: <20200903115020.Bluez.v3.1.I6767a68b7e7b6cfb6d8046ee8b66c8e7d008d3e6@changeid>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
Subject: [Bluez PATCH v3 2/2] avrcp: Implement Press/Hold/Release method for MediaPlayer1
From:   Archie Pusaka <apusaka@google.com>
To:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     CrosBT Upstreaming <chromeos-bluetooth-upstreaming@chromium.org>,
        Archie Pusaka <apusaka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Archie Pusaka <apusaka@chromium.org>

This allows us to send any passthrough command, complete with the
support to hold down the key. Using Press() will automatically
release the key, while using Hold() will keep the key held until
an explicit call to Release() is received.

This doesn't allow us to hold multiple keys simultaneously, since
according to the AV/C Panel Subunit Specification, part 9.4, when the
target receive a pressed command without receiving a release command
of the previous key, it will be treated as if the release command is
sent but not received.

Previously, the rewind and fast_forward keys are unique in terms that
they are treated as holdable keys, this patch preserves that behavior
of calling Rewind() and FastForward(). A rewind event which is
reported via the new Press() method will automatically be released
instead.
---

Changes in v3:
* Fix unused variable warning

Changes in v2:
* Implement Hold and Release method
* Previously only a key with the repeat_timer will be released on the
  keypress of other key, now it send release message to whatever key
  is pressed before and is not released yet.

 profiles/audio/avctp.c   | 54 +++++++++++++++++++++-----------
 profiles/audio/avctp.h   |  5 ++-
 profiles/audio/avrcp.c   | 62 +++++++++++++++++++++++++++++++------
 profiles/audio/control.c | 22 +++++++-------
 profiles/audio/player.c  | 66 ++++++++++++++++++++++++++++++++++++++++
 profiles/audio/player.h  | 33 +++++++++++---------
 6 files changed, 189 insertions(+), 53 deletions(-)

diff --git a/profiles/audio/avctp.c b/profiles/audio/avctp.c
index a58623216..f096d22b0 100644
--- a/profiles/audio/avctp.c
+++ b/profiles/audio/avctp.c
@@ -60,6 +60,8 @@
  * command with the pressed value is valid for two seconds
  */
 #define AVC_PRESS_TIMEOUT	2
+/* We need to send hold event before AVC_PRESS time runs out */
+#define AVC_HOLD_TIMEOUT	1
 
 #define CONTROL_TIMEOUT		10
 #define BROWSING_TIMEOUT	10
@@ -191,6 +193,7 @@ struct avctp_channel {
 struct key_pressed {
 	uint16_t op;
 	guint timer;
+	bool hold;
 };
 
 struct avctp {
@@ -1500,6 +1503,7 @@ static struct avctp *avctp_get_internal(struct btd_device *device)
 	session->device = btd_device_ref(device);
 	session->state = AVCTP_STATE_DISCONNECTED;
 	session->uinput = -1;
+	session->key.op = AVC_INVALID;
 
 	server->sessions = g_slist_append(server->sessions, session);
 
@@ -1846,35 +1850,32 @@ static gboolean repeat_timeout(gpointer user_data)
 {
 	struct avctp *session = user_data;
 
-	avctp_passthrough_release(session, session->key.op);
 	avctp_passthrough_press(session, session->key.op);
 
 	return TRUE;
 }
 
-static void release_pressed(struct avctp *session)
+static int release_pressed(struct avctp *session)
 {
-	avctp_passthrough_release(session, session->key.op);
+	int ret = avctp_passthrough_release(session, session->key.op);
 
 	if (session->key.timer > 0)
 		g_source_remove(session->key.timer);
 
 	session->key.timer = 0;
+	session->key.op = AVC_INVALID;
+	session->key.hold = false;
+
+	return ret;
 }
 
-static bool set_pressed(struct avctp *session, uint8_t op)
+static bool hold_pressed(struct avctp *session, uint8_t op)
 {
-	if (session->key.timer > 0) {
-		if (session->key.op == op)
-			return TRUE;
-		release_pressed(session);
-	}
-
-	if (op != AVC_FAST_FORWARD && op != AVC_REWIND)
+	if (session->key.op != op || !session->key.hold)
 		return FALSE;
 
-	session->key.op = op;
-	session->key.timer = g_timeout_add_seconds(AVC_PRESS_TIMEOUT,
+	if (session->key.timer == 0)
+		session->key.timer = g_timeout_add_seconds(AVC_HOLD_TIMEOUT,
 							repeat_timeout,
 							session);
 
@@ -1886,26 +1887,43 @@ static gboolean avctp_passthrough_rsp(struct avctp *session, uint8_t code,
 					uint8_t *operands, size_t operand_count,
 					void *user_data)
 {
+	uint8_t op = operands[0];
+
 	if (code != AVC_CTYPE_ACCEPTED)
 		return FALSE;
 
-	if (set_pressed(session, operands[0]))
+	if (hold_pressed(session, op))
 		return FALSE;
 
-	avctp_passthrough_release(session, operands[0]);
+	if (op == session->key.op)
+		release_pressed(session);
 
 	return FALSE;
 }
 
-int avctp_send_passthrough(struct avctp *session, uint8_t op)
+int avctp_send_passthrough(struct avctp *session, uint8_t op, bool hold)
 {
-	/* Auto release if key pressed */
-	if (session->key.timer > 0)
+	if (op & 0x80)
+		return -EINVAL;
+
+	/* Release previously unreleased key */
+	if (session->key.op != AVC_INVALID && session->key.op != op)
 		release_pressed(session);
 
+	session->key.op = op;
+	session->key.hold = hold;
 	return avctp_passthrough_press(session, op);
 }
 
+int avctp_send_release_passthrough(struct avctp *session)
+{
+	if (session->key.op != AVC_INVALID)
+		return release_pressed(session);
+
+	return 0;
+}
+
+
 int avctp_send_vendordep(struct avctp *session, uint8_t transaction,
 				uint8_t code, uint8_t subunit,
 				uint8_t *operands, size_t operand_count)
diff --git a/profiles/audio/avctp.h b/profiles/audio/avctp.h
index c3cd49d88..95d95bbbe 100644
--- a/profiles/audio/avctp.h
+++ b/profiles/audio/avctp.h
@@ -118,6 +118,7 @@
 #define AVC_BLUE			0x7c
 #define AVC_YELLOW			0x7c
 #define AVC_VENDOR_UNIQUE		0x7e
+#define AVC_INVALID			0xff
 
 struct avctp;
 
@@ -182,7 +183,9 @@ unsigned int avctp_register_browsing_pdu_handler(struct avctp *session,
 						GDestroyNotify destroy);
 gboolean avctp_unregister_browsing_pdu_handler(unsigned int id);
 
-int avctp_send_passthrough(struct avctp *session, uint8_t op);
+int avctp_send_passthrough(struct avctp *session, uint8_t op, bool hold);
+int avctp_send_release_passthrough(struct avctp *session);
+
 int avctp_send_vendordep(struct avctp *session, uint8_t transaction,
 				uint8_t code, uint8_t subunit,
 				uint8_t *operands, size_t operand_count);
diff --git a/profiles/audio/avrcp.c b/profiles/audio/avrcp.c
index 5d0256c52..d9471c083 100644
--- a/profiles/audio/avrcp.c
+++ b/profiles/audio/avrcp.c
@@ -2978,20 +2978,38 @@ static bool ct_set_setting(struct media_player *mp, const char *key,
 
 static int ct_press(struct avrcp_player *player, uint8_t op)
 {
-	int err;
-	struct avrcp *session;
+	struct avrcp *session = player->sessions->data;
 
-	session = player->sessions->data;
 	if (session == NULL)
 		return -ENOTCONN;
 
 	set_ct_player(session, player);
 
-	err = avctp_send_passthrough(session->conn, op);
-	if (err < 0)
-		return err;
+	return avctp_send_passthrough(session->conn, op, false);
+}
 
-	return 0;
+static int ct_hold(struct avrcp_player *player, uint8_t op)
+{
+	struct avrcp *session = player->sessions->data;
+
+	if (session == NULL)
+		return -ENOTCONN;
+
+	set_ct_player(session, player);
+
+	return avctp_send_passthrough(session->conn, op, true);
+}
+
+static int ct_release(struct avrcp_player *player)
+{
+	struct avrcp *session = player->sessions->data;
+
+	if (session == NULL)
+		return -ENOTCONN;
+
+	set_ct_player(session, player);
+
+	return avctp_send_release_passthrough(session->conn);
 }
 
 static int ct_play(struct media_player *mp, void *user_data)
@@ -3033,14 +3051,37 @@ static int ct_fast_forward(struct media_player *mp, void *user_data)
 {
 	struct avrcp_player *player = user_data;
 
-	return ct_press(player, AVC_FAST_FORWARD);
+	return ct_hold(player, AVC_FAST_FORWARD);
 }
 
 static int ct_rewind(struct media_player *mp, void *user_data)
 {
 	struct avrcp_player *player = user_data;
 
-	return ct_press(player, AVC_REWIND);
+	return ct_hold(player, AVC_REWIND);
+}
+
+static int ct_press_key(struct media_player *mp, uint8_t avc_key,
+								void *user_data)
+{
+	struct avrcp_player *player = user_data;
+
+	return ct_press(player, avc_key);
+}
+
+static int ct_hold_key(struct media_player *mp, uint8_t avc_key,
+								void *user_data)
+{
+	struct avrcp_player *player = user_data;
+
+	return ct_hold(player, avc_key);
+}
+
+static int ct_release_key(struct media_player *mp, void *user_data)
+{
+	struct avrcp_player *player = user_data;
+
+	return ct_release(player);
 }
 
 static int ct_list_items(struct media_player *mp, const char *name,
@@ -3388,6 +3429,9 @@ static const struct media_player_callback ct_cbs = {
 	.previous	= ct_previous,
 	.fast_forward	= ct_fast_forward,
 	.rewind		= ct_rewind,
+	.press		= ct_press_key,
+	.hold		= ct_hold_key,
+	.release	= ct_release_key,
 	.list_items	= ct_list_items,
 	.change_folder	= ct_change_folder,
 	.search		= ct_search,
diff --git a/profiles/audio/control.c b/profiles/audio/control.c
index 4ab1f9b0f..14744ea94 100644
--- a/profiles/audio/control.c
+++ b/profiles/audio/control.c
@@ -136,7 +136,7 @@ int control_disconnect(struct btd_service *service)
 }
 
 static DBusMessage *key_pressed(DBusConnection *conn, DBusMessage *msg,
-						uint8_t op, void *data)
+					uint8_t op, bool hold, void *data)
 {
 	struct control *control = data;
 	int err;
@@ -147,7 +147,7 @@ static DBusMessage *key_pressed(DBusConnection *conn, DBusMessage *msg,
 	if (!control->target)
 		return btd_error_not_supported(msg);
 
-	err = avctp_send_passthrough(control->session, op);
+	err = avctp_send_passthrough(control->session, op, hold);
 	if (err < 0)
 		return btd_error_failed(msg, strerror(-err));
 
@@ -157,55 +157,55 @@ static DBusMessage *key_pressed(DBusConnection *conn, DBusMessage *msg,
 static DBusMessage *control_volume_up(DBusConnection *conn, DBusMessage *msg,
 								void *data)
 {
-	return key_pressed(conn, msg, AVC_VOLUME_UP, data);
+	return key_pressed(conn, msg, AVC_VOLUME_UP, false, data);
 }
 
 static DBusMessage *control_volume_down(DBusConnection *conn, DBusMessage *msg,
 								void *data)
 {
-	return key_pressed(conn, msg, AVC_VOLUME_DOWN, data);
+	return key_pressed(conn, msg, AVC_VOLUME_DOWN, false, data);
 }
 
 static DBusMessage *control_play(DBusConnection *conn, DBusMessage *msg,
 								void *data)
 {
-	return key_pressed(conn, msg, AVC_PLAY, data);
+	return key_pressed(conn, msg, AVC_PLAY, false, data);
 }
 
 static DBusMessage *control_pause(DBusConnection *conn, DBusMessage *msg,
 								void *data)
 {
-	return key_pressed(conn, msg, AVC_PAUSE, data);
+	return key_pressed(conn, msg, AVC_PAUSE, false, data);
 }
 
 static DBusMessage *control_stop(DBusConnection *conn, DBusMessage *msg,
 								void *data)
 {
-	return key_pressed(conn, msg, AVC_STOP, data);
+	return key_pressed(conn, msg, AVC_STOP, false, data);
 }
 
 static DBusMessage *control_next(DBusConnection *conn, DBusMessage *msg,
 								void *data)
 {
-	return key_pressed(conn, msg, AVC_FORWARD, data);
+	return key_pressed(conn, msg, AVC_FORWARD, false, data);
 }
 
 static DBusMessage *control_previous(DBusConnection *conn, DBusMessage *msg,
 								void *data)
 {
-	return key_pressed(conn, msg, AVC_BACKWARD, data);
+	return key_pressed(conn, msg, AVC_BACKWARD, false, data);
 }
 
 static DBusMessage *control_fast_forward(DBusConnection *conn, DBusMessage *msg,
 								void *data)
 {
-	return key_pressed(conn, msg, AVC_FAST_FORWARD, data);
+	return key_pressed(conn, msg, AVC_FAST_FORWARD, true, data);
 }
 
 static DBusMessage *control_rewind(DBusConnection *conn, DBusMessage *msg,
 								void *data)
 {
-	return key_pressed(conn, msg, AVC_REWIND, data);
+	return key_pressed(conn, msg, AVC_REWIND, true, data);
 }
 
 static gboolean control_property_get_connected(
diff --git a/profiles/audio/player.c b/profiles/audio/player.c
index 09ee979e4..27a7efb7e 100644
--- a/profiles/audio/player.c
+++ b/profiles/audio/player.c
@@ -570,6 +570,67 @@ static DBusMessage *media_player_rewind(DBusConnection *conn, DBusMessage *msg,
 	return g_dbus_create_reply(msg, DBUS_TYPE_INVALID);
 }
 
+static DBusMessage *media_player_press(DBusConnection *conn, DBusMessage *msg,
+								void *data)
+{
+	struct media_player *mp = data;
+	struct player_callback *cb = mp->cb;
+	int err;
+	uint8_t avc_key;
+
+	if (cb->cbs->press == NULL)
+		return btd_error_not_supported(msg);
+
+	if (!dbus_message_get_args(msg, NULL, DBUS_TYPE_BYTE, &avc_key,
+							DBUS_TYPE_INVALID))
+		return btd_error_invalid_args(msg);
+
+	err = cb->cbs->press(mp, avc_key, cb->user_data);
+	if (err < 0)
+		return btd_error_failed(msg, strerror(-err));
+
+	return g_dbus_create_reply(msg, DBUS_TYPE_INVALID);
+}
+
+static DBusMessage *media_player_hold(DBusConnection *conn, DBusMessage *msg,
+								void *data)
+{
+	struct media_player *mp = data;
+	struct player_callback *cb = mp->cb;
+	int err;
+	uint8_t avc_key;
+
+	if (cb->cbs->hold == NULL)
+		return btd_error_not_supported(msg);
+
+	if (!dbus_message_get_args(msg, NULL, DBUS_TYPE_BYTE, &avc_key,
+							DBUS_TYPE_INVALID))
+		return btd_error_invalid_args(msg);
+
+	err = cb->cbs->hold(mp, avc_key, cb->user_data);
+	if (err < 0)
+		return btd_error_failed(msg, strerror(-err));
+
+	return g_dbus_create_reply(msg, DBUS_TYPE_INVALID);
+}
+
+static DBusMessage *media_player_release(DBusConnection *conn, DBusMessage *msg,
+								void *data)
+{
+	struct media_player *mp = data;
+	struct player_callback *cb = mp->cb;
+	int err;
+
+	if (cb->cbs->release == NULL)
+		return btd_error_not_supported(msg);
+
+	err = cb->cbs->release(mp, cb->user_data);
+	if (err < 0)
+		return btd_error_failed(msg, strerror(-err));
+
+	return g_dbus_create_reply(msg, DBUS_TYPE_INVALID);
+}
+
 static void parse_folder_list(gpointer data, gpointer user_data)
 {
 	struct media_item *item = data;
@@ -704,6 +765,11 @@ static const GDBusMethodTable media_player_methods[] = {
 	{ GDBUS_METHOD("Previous", NULL, NULL, media_player_previous) },
 	{ GDBUS_METHOD("FastForward", NULL, NULL, media_player_fast_forward) },
 	{ GDBUS_METHOD("Rewind", NULL, NULL, media_player_rewind) },
+	{ GDBUS_METHOD("Press", GDBUS_ARGS({"avc_key", "y"}), NULL,
+							media_player_press) },
+	{ GDBUS_METHOD("Hold", GDBUS_ARGS({"avc_key", "y"}), NULL,
+							media_player_hold) },
+	{ GDBUS_METHOD("Release", NULL, NULL, media_player_release) },
 	{ }
 };
 
diff --git a/profiles/audio/player.h b/profiles/audio/player.h
index 536394ca6..e98550064 100644
--- a/profiles/audio/player.h
+++ b/profiles/audio/player.h
@@ -45,26 +45,31 @@ struct media_player;
 struct media_item;
 
 struct media_player_callback {
-	bool (*set_setting) (struct media_player *mp, const char *key,
+	bool (*set_setting)(struct media_player *mp, const char *key,
 				const char *value, void *user_data);
-	int (*play) (struct media_player *mp, void *user_data);
-	int (*pause) (struct media_player *mp, void *user_data);
-	int (*stop) (struct media_player *mp, void *user_data);
-	int (*next) (struct media_player *mp, void *user_data);
-	int (*previous) (struct media_player *mp, void *user_data);
-	int (*fast_forward) (struct media_player *mp, void *user_data);
-	int (*rewind) (struct media_player *mp, void *user_data);
-	int (*list_items) (struct media_player *mp, const char *name,
+	int (*play)(struct media_player *mp, void *user_data);
+	int (*pause)(struct media_player *mp, void *user_data);
+	int (*stop)(struct media_player *mp, void *user_data);
+	int (*next)(struct media_player *mp, void *user_data);
+	int (*previous)(struct media_player *mp, void *user_data);
+	int (*fast_forward)(struct media_player *mp, void *user_data);
+	int (*rewind)(struct media_player *mp, void *user_data);
+	int (*press)(struct media_player *mp, uint8_t avc_key,
+							void *user_data);
+	int (*hold)(struct media_player *mp, uint8_t avc_key,
+							void *user_data);
+	int (*release)(struct media_player *mp, void *user_data);
+	int (*list_items)(struct media_player *mp, const char *name,
 				uint32_t start, uint32_t end, void *user_data);
-	int (*change_folder) (struct media_player *mp, const char *path,
+	int (*change_folder)(struct media_player *mp, const char *path,
 						uint64_t uid, void *user_data);
-	int (*search) (struct media_player *mp, const char *string,
+	int (*search)(struct media_player *mp, const char *string,
 						void *user_data);
-	int (*play_item) (struct media_player *mp, const char *name,
+	int (*play_item)(struct media_player *mp, const char *name,
 					uint64_t uid, void *user_data);
-	int (*add_to_nowplaying) (struct media_player *mp, const char *name,
+	int (*add_to_nowplaying)(struct media_player *mp, const char *name,
 					uint64_t uid, void *user_data);
-	int (*total_items) (struct media_player *mp, const char *name,
+	int (*total_items)(struct media_player *mp, const char *name,
 						void *user_data);
 };
 
-- 
2.28.0.402.g5ffc5be6b7-goog

