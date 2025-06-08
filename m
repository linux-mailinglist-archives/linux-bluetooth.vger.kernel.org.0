Return-Path: <linux-bluetooth+bounces-12835-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C47AD14C1
	for <lists+linux-bluetooth@lfdr.de>; Sun,  8 Jun 2025 23:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A6E41652E3
	for <lists+linux-bluetooth@lfdr.de>; Sun,  8 Jun 2025 21:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A917F257AFE;
	Sun,  8 Jun 2025 21:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="Gw5Va3r7"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F56B211A00
	for <linux-bluetooth@vger.kernel.org>; Sun,  8 Jun 2025 21:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749418369; cv=pass; b=NwUwAuYu++3otbfQ57ZBCMP9bTTNbn9NrNJe0WytbgsU8Qo6fBSjLzyyH2zXVePhzaF/qS/ybaOrkKTl9RokSl6LhSz7sOEgvrvL6YRRlqxhhz5jbX3N25ajSbgh/xc/e0C643iayqbQQTp5OJjuAC2x2sdN8Va/z8etdZ2vtHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749418369; c=relaxed/simple;
	bh=ZkVyIhwZSjhvu++L2NnuuequgQ9VfQ3Vmbt6bqeT+xE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BaMCl0ntCyUXqK+D1AkEDHVcMmuejE1z0IcaYA4Tt9UIIVWSDfik2icHKDkhLifbsEX+euz5TOQ8eht6zuQ9A3oyYXzFXEGIYieN+Naol4k0NXq32F+Bw9i3mrpkMBCmWwteN9DvyDUXgUGRfuuxqG9RU9Guc7Wb+SFIiLUL64o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=Gw5Va3r7; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from monolith.lan (unknown [185.77.218.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pav)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4bFpDl1w7Jz49QDX;
	Mon,  9 Jun 2025 00:32:39 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1749418359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TEl2QIU5JdE4RYgwSugmL1TqHB0E28dBJtvfkNBKeW0=;
	b=Gw5Va3r7h1lkXQIMjTOrq15WNY4bePxuR1RuGTfPC5g3UQPivaU7C1nFKbMkLVnj3zQ3eR
	nybpfgfq9fCdvD/b1kmnJldsEgrc2ZLQBb5XHE2S3XyZP1HF4aSkkZ4WLcCREFb/1OB4IX
	Um9JwqKmIbJePutB2FNP9YBFIJng8kKdCKIKlVm2IwtTFAip1nStXT1r7eBvHwdxap3sBr
	HA2nRbQzTOUHwp6E+MMfaNED/lktQKAicjkZPvLPwRd0dT91/5WWvqhXm3xCs/ry1RkcqI
	R9EbPsEkcxPTKkTCdRVHwY02RgFOaSgXT13Q27rS+UhOc66ZHs3bhHyRLm/z4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1749418359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TEl2QIU5JdE4RYgwSugmL1TqHB0E28dBJtvfkNBKeW0=;
	b=Cm4XjvBuINN+KsWv1eUF+bBzF+eRAwrPjGIQGs1nle6adwiiPaiHbypTFJKXfKnVwA579y
	YeYqt01xb3o8iLtDN9CV1PyIHdGBcOuzcDbym9wyY99sfEzY36QFmnDC8Q5g0aEtpzTs/A
	XU2vJRc9MC9rNvze0eeo/cx3IFwsJMikfyiy5gTVrKYnUzQq7N+1viVfzlO2o1by5NIYBj
	+SseWvVpeqBJS7fCvFtIWkgkmW9PqYLpqSlhuhLc+eTlO8Z+qfWixi4sBPn8xA8LoiciUT
	QOrl7e6PIgrEeCjVOZQa9fg2smXEk/GdHCkjPoY2ZU0CkMhLLjYRrYhypwQdnA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pav smtp.mailfrom=pav@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1749418359; a=rsa-sha256;
	cv=none;
	b=EYALXvdtrJW4Sv+vqzP2tPsQ6wMUUYjEVWRvHhcndtql937FuT5GXJDlznFvqbg4ekp3T9
	BTMr9MtP3JL9y7gZwLt8knTKsk7ulWZcxrQRcnZz5+ZaJ5QLokwb9s3RPairWnfJOdFsoE
	EokIcYNHG53Id3RW2S0vQPbpz1P3G4mNZPOOuxKECqHAQQipGve3/50s+OSRgeFNnIBo8Q
	QCa8ywFid9DJzjiJf3Kc+SuhnhFP79umiqM7qPC8y4l0KB6Y8wbqIaHFh3Hv72hGmKCb39
	bG/ziDaECgLLaBqApQNgDFkQ6ROknpikcxQ7RXcKX1Y8FW0SHC6t4aO7RZgoLw==
From: Pauli Virtanen <pav@iki.fi>
To: linux-bluetooth@vger.kernel.org
Cc: Pauli Virtanen <pav@iki.fi>
Subject: [PATCH BlueZ v3 06/10] bap: support removing streams with ClearConfiguration()
Date: Mon,  9 Jun 2025 00:32:18 +0300
Message-ID: <ab7f3d77719076ca4d7a640c58e8058f7c539f1e.1749418319.git.pav@iki.fi>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749418319.git.pav@iki.fi>
References: <cover.1749418319.git.pav@iki.fi>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement removing streams via ClearConfiguration().
---
 profiles/audio/bap.c       | 184 +++++++++++++++++++++++++++++++++----
 profiles/audio/transport.c |  17 ++++
 profiles/audio/transport.h |   1 +
 3 files changed, 185 insertions(+), 17 deletions(-)

diff --git a/profiles/audio/bap.c b/profiles/audio/bap.c
index b39314fa9..648acbf30 100644
--- a/profiles/audio/bap.c
+++ b/profiles/audio/bap.c
@@ -57,6 +57,8 @@
 #include "src/log.h"
 #include "src/error.h"
 
+#include "transport.h"
+
 #define ISO_SOCKET_UUID "6fbaf188-05e0-496a-9885-d6ddfdb4e03e"
 #define PACS_UUID_STR "00001850-0000-1000-8000-00805f9b34fb"
 #define BCAAS_UUID_STR "00001852-0000-1000-8000-00805f9b34fb"
@@ -67,6 +69,7 @@ struct bap_setup;
 
 typedef void (*bap_setup_ready_func_t)(struct bap_setup *setup, int code,
 						uint8_t reason, void *data);
+typedef void (*bap_setup_close_func_t)(struct bap_setup *setup, void *data);
 
 struct bap_setup {
 	struct bap_ep *ep;
@@ -82,12 +85,15 @@ struct bap_setup {
 	uint8_t sid;
 	bool config_pending;
 	bool readying;
+	bool closing;
 	struct iovec *caps;
 	struct iovec *metadata;
 	unsigned int id;
 	struct iovec *base;
 	bap_setup_ready_func_t ready_cb;
 	void *ready_cb_data;
+	bap_setup_close_func_t close_cb;
+	void *close_cb_data;
 	void (*destroy)(struct bap_setup *setup);
 };
 
@@ -746,6 +752,8 @@ static int setup_qos(struct bap_setup *setup)
 
 	if (!stream)
 		return -EINVAL;
+	if (setup->closing)
+		return -EINVAL;
 	if (bt_bap_stream_get_state(stream) != BT_BAP_STREAM_STATE_CONFIG)
 		goto error;
 	if (setup->id)
@@ -822,12 +830,103 @@ static void setup_io_close(void *data, void *user_data)
 	bt_bap_stream_io_connecting(setup->stream, -1);
 }
 
-static void ep_close(struct bap_ep *ep)
+static bool release_stream(struct bt_bap_stream *stream)
 {
-	if (!ep)
+	if (!stream)
+		return true;
+
+	switch (bt_bap_stream_get_state(stream)) {
+	case BT_BAP_STREAM_STATE_IDLE:
+	case BT_BAP_STREAM_STATE_RELEASING:
+		return true;
+	default:
+		bt_bap_stream_release(stream, NULL, NULL);
+		return false;
+	}
+}
+
+static int setup_close(struct bap_setup *setup, bap_setup_close_func_t cb,
+								void *user_data)
+{
+	if (setup->closing)
+		return -EBUSY;
+
+	DBG("%p", setup);
+
+	setup->close_cb = cb;
+	setup->close_cb_data = user_data;
+	setup->closing = true;
+
+	bt_bap_stream_unlock(setup->stream);
+
+	if (release_stream(setup->stream)) {
+		setup_free(setup);
+		return 0;
+	}
+
+	return 0;
+}
+
+struct ep_close_data {
+	int remaining;
+	int count;
+	const char *path;
+	void (*cb)(int count, void *user_data);
+	void *user_data;
+};
+
+static void ep_close_setup_cb(struct bap_setup *setup, void *user_data)
+{
+	struct ep_close_data *epdata = user_data;
+
+	epdata->remaining--;
+
+	DBG("closed setup %p remain %d", setup, epdata->remaining);
+
+	if (epdata->remaining)
 		return;
 
-	queue_foreach(ep->setups, setup_io_close, NULL);
+	if (epdata->cb)
+		epdata->cb(epdata->count, epdata->user_data);
+
+	free(epdata);
+}
+
+static void ep_close_setup(void *data, void *user_data)
+{
+	struct bap_setup *setup = data;
+	struct ep_close_data *epdata = user_data;
+	struct bt_bap_stream *stream = setup->stream;
+	const char *path = media_transport_stream_path(stream);
+
+	if (epdata->path && (!path || strcmp(epdata->path, path)))
+		return;
+
+	epdata->remaining++;
+	if (setup_close(setup, ep_close_setup_cb, epdata))
+		epdata->remaining--;
+	else
+		epdata->count++;
+}
+
+static void ep_close(struct bap_ep *ep, const char *transport_path,
+			void (*cb)(int count, void *user_data), void *user_data)
+{
+	struct ep_close_data *epdata;
+
+	DBG("close ep %p path %s", ep, transport_path ? transport_path : "-");
+
+	epdata = new0(struct ep_close_data, 1);
+	epdata->cb = cb;
+	epdata->path = transport_path;
+	epdata->user_data = user_data;
+	epdata->remaining = 1;
+
+	if (ep)
+		queue_foreach(ep->setups, ep_close_setup, epdata);
+
+	epdata->path = NULL;
+	ep_close_setup_cb(NULL, epdata);
 }
 
 static struct bap_setup *setup_new(struct bap_ep *ep)
@@ -869,17 +968,6 @@ static struct bap_setup *setup_new(struct bap_ep *ep)
 	return setup;
 }
 
-static void release_stream(struct bt_bap_stream *stream)
-{
-	switch (bt_bap_stream_get_state(stream)) {
-	case BT_BAP_STREAM_STATE_IDLE:
-	case BT_BAP_STREAM_STATE_RELEASING:
-		break;
-	default:
-		bt_bap_stream_release(stream, NULL, NULL);
-	}
-}
-
 static void setup_free(void *data)
 {
 	struct bap_setup *setup = data;
@@ -888,6 +976,9 @@ static void setup_free(void *data)
 
 	setup_ready(setup, -ECANCELED, 0);
 
+	if (setup->closing && setup->close_cb)
+		setup->close_cb(setup, setup->close_cb_data);
+
 	if (setup->stream && setup->id) {
 		bt_bap_stream_cancel(setup->stream, setup->id);
 		setup->id = 0;
@@ -1035,7 +1126,7 @@ static DBusMessage *set_configuration(DBusConnection *conn, DBusMessage *msg,
 	 * TO DO reconfiguration of a BIS.
 	 */
 	if (bt_bap_pac_get_type(ep->lpac) != BT_BAP_BCAST_SOURCE)
-		ep_close(ep);
+		ep_close(ep, NULL, NULL, NULL);
 
 	setup = setup_new(ep);
 
@@ -1076,6 +1167,51 @@ static DBusMessage *set_configuration(DBusConnection *conn, DBusMessage *msg,
 	return NULL;
 }
 
+struct clear_configuration_data {
+	DBusMessage *msg;
+	bool all;
+};
+
+static void clear_configuration_cb(int count, void *user_data)
+{
+	struct clear_configuration_data *data = user_data;
+	DBusMessage *reply;
+
+	DBG("%p", data);
+
+	if (!data->all && count == 0)
+		reply = btd_error_invalid_args(data->msg);
+	else
+		reply = dbus_message_new_method_return(data->msg);
+
+	g_dbus_send_message(btd_get_dbus_connection(), reply);
+	dbus_message_unref(data->msg);
+	free(data);
+}
+
+static DBusMessage *clear_configuration(DBusConnection *conn, DBusMessage *msg,
+								void *data)
+{
+	struct bap_ep *ep = data;
+	const char *path;
+	struct clear_configuration_data *cbdata;
+	DBusMessageIter args;
+
+	dbus_message_iter_init(msg, &args);
+	dbus_message_iter_get_basic(&args, &path);
+
+	if (strcmp(path, ep->path) == 0)
+		path = NULL;
+
+	cbdata = new0(struct clear_configuration_data, 1);
+	cbdata->msg = dbus_message_ref(msg);
+	cbdata->all = (path == NULL);
+
+	DBG("%p %s %s", cbdata, ep->path, path ? path : "NULL");
+	ep_close(ep, path, clear_configuration_cb, cbdata);
+	return NULL;
+}
+
 static bool stream_io_unset(const void *data, const void *user_data)
 {
 	struct bt_bap_stream *stream = (struct bt_bap_stream *)data;
@@ -1249,6 +1385,9 @@ static const GDBusMethodTable ep_methods[] = {
 					GDBUS_ARGS({ "endpoint", "o" },
 						{ "Configuration", "a{sv}" } ),
 					NULL, set_configuration) },
+	{ GDBUS_EXPERIMENTAL_ASYNC_METHOD("ClearConfiguration",
+					GDBUS_ARGS({ "transport", "o" }),
+					NULL, clear_configuration) },
 	{ },
 };
 
@@ -1259,10 +1398,9 @@ static void ep_free(void *data)
 	struct bap_ep *ep = data;
 	struct queue *setups = ep->setups;
 
-	ep_cancel_select(ep);
-
 	ep->setups = NULL;
 	queue_destroy(setups, setup_free);
+	ep_cancel_select(ep);
 	free(ep->path);
 	free(ep);
 }
@@ -1456,6 +1594,8 @@ static int setup_config(struct bap_setup *setup, bap_setup_ready_func_t cb,
 
 	if (setup->readying)
 		return -EBUSY;
+	if (setup->closing)
+		return -EINVAL;
 
 	DBG("setup %p caps %p metadata %p", setup, setup->caps,
 						setup->metadata);
@@ -2235,6 +2375,9 @@ static void setup_create_bcast_io(struct bap_data *data,
 static void setup_create_io(struct bap_data *data, struct bap_setup *setup,
 				struct bt_bap_stream *stream, int defer)
 {
+	if (setup && setup->closing)
+		return;
+
 	DBG("setup %p stream %p defer %s", setup, stream,
 				defer ? "true" : "false");
 
@@ -2267,6 +2410,13 @@ static void bap_state(struct bt_bap_stream *stream, uint8_t old_state,
 
 	setup = bap_find_setup_by_stream(data, stream);
 
+	if (setup && setup->closing) {
+		if (old_state == BT_BAP_STREAM_STATE_RELEASING) {
+			setup_free(setup);
+			return;
+		}
+	}
+
 	switch (new_state) {
 	case BT_BAP_STREAM_STATE_IDLE:
 		/* Release stream if idle */
diff --git a/profiles/audio/transport.c b/profiles/audio/transport.c
index a1fdf948b..244d2c4ae 100644
--- a/profiles/audio/transport.c
+++ b/profiles/audio/transport.c
@@ -2670,3 +2670,20 @@ void media_transport_update_device_volume(struct btd_device *dev,
 
 	btd_device_set_volume(dev, volume);
 }
+
+const char *media_transport_stream_path(void *stream)
+{
+	GSList *l;
+
+	if (!stream)
+		return NULL;
+
+	for (l = transports; l; l = l->next) {
+		struct media_transport *transport = l->data;
+
+		if (media_transport_get_stream(transport) == stream)
+			return transport->path;
+	}
+
+	return NULL;
+}
diff --git a/profiles/audio/transport.h b/profiles/audio/transport.h
index 808e1a193..7c107281a 100644
--- a/profiles/audio/transport.h
+++ b/profiles/audio/transport.h
@@ -33,3 +33,4 @@ void transport_get_properties(struct media_transport *transport,
 int media_transport_get_device_volume(struct btd_device *dev);
 void media_transport_update_device_volume(struct btd_device *dev,
 								int volume);
+const char *media_transport_stream_path(void *stream);
-- 
2.49.0


