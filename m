Return-Path: <linux-bluetooth+bounces-539-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E70DF80DC6E
	for <lists+linux-bluetooth@lfdr.de>; Mon, 11 Dec 2023 22:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 166871C2166F
	for <lists+linux-bluetooth@lfdr.de>; Mon, 11 Dec 2023 21:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF29C54F84;
	Mon, 11 Dec 2023 21:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ej47JOc7"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2762D6
	for <linux-bluetooth@vger.kernel.org>; Mon, 11 Dec 2023 13:04:42 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3b8958b32a2so3818841b6e.2
        for <linux-bluetooth@vger.kernel.org>; Mon, 11 Dec 2023 13:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702328681; x=1702933481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r3yLS5fooq2D5Y1dg1H6vYS2vwrn6dOq0VjevpjIBBw=;
        b=Ej47JOc78BPkTQqYstKw6+bH3Rjs8SMC5yrhXGCH9zApG3cKqQT8cjTcz4+xDllP80
         mD2djmaS2tsEUolqLmA8YCGUyFgtbiufo1k1SIUpsXu1J3EjRThi/hppzfl85G2v/XLa
         H2eGpWq6Y0QyK9jxsSWNBhp+dcQmFJRvlDun+f6dVXuzPANZdKESn3cC/JRvLA7AWPkD
         sfEggf7TpQ6PK3JE0ZSxQANVISDKTx+Nl/O0grhFVsyPX/mneF1RMdMlvvs+Fz4RLgSP
         iGXplVUa5NuDLfb7oV2si5/mJvC7Wc2XMSwS09ESRo+SkUw0IOKmO1kmr5XQRDrMKvmt
         GFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702328681; x=1702933481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3yLS5fooq2D5Y1dg1H6vYS2vwrn6dOq0VjevpjIBBw=;
        b=YATPGcj4jYdWBo3t0UgxEjJ8VbXmRQaEycVEpfCbleh4A5fTIA/7bKEN+DkBc6kGlA
         2PRa8Rb1DHRoSBpSj7WKv9gvxbkHQ7XB7bCMSPQdcpgeHzlDQ9PoppcZfUeunO98nxHo
         9sit/FdK0QXLaZLbgEeGHErubnVHYO/+EbJNTax+PlCqSKVHXtvnZKAlOQj++hSOxWoL
         dTDl/C8NEZ/MztysX5tndHBt9byi+5K5f44bolHjKXae+PG52aASCU397trU9BWARtef
         HixxXRiUYJJFULFM0I+Egw3tpZW+997KQLkkGkOq8h6yCWlryS2wsocPOCYy2Wuyrktz
         xXKQ==
X-Gm-Message-State: AOJu0YztKBXVOnVme+HaXCXNRKpuoL5Rf7uCxSbWcvpgVseqtvjwp1JG
	HAyemJ2mTfwSQjSFbwNBWZPV29b8rms=
X-Google-Smtp-Source: AGHT+IET0iMyduv0F/ObPm0WPKcGp5SHegU7pIIZrc/S1ITRi3NIErWoFbim+z4PLMaebr1bqugbBA==
X-Received: by 2002:a05:6808:1248:b0:3b9:e828:819 with SMTP id o8-20020a056808124800b003b9e8280819mr6223711oiv.44.1702328680847;
        Mon, 11 Dec 2023 13:04:40 -0800 (PST)
Received: from lvondent-mobl4.. (071-047-239-151.res.spectrum.com. [71.47.239.151])
        by smtp.gmail.com with ESMTPSA id k23-20020a05680808d700b003b85f47a3e1sm1996852oij.43.2023.12.11.13.04.38
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 13:04:39 -0800 (PST)
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v3 5/6] shared/bap: Fix stream IO linking
Date: Mon, 11 Dec 2023 16:04:28 -0500
Message-ID: <20231211210429.530964-5-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231211210429.530964-1-luiz.dentz@gmail.com>
References: <20231211210429.530964-1-luiz.dentz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

IO linking shall only be possible once, for the oposite direction as ISO
channels are bidirection, and not many times as that means multiplexing
would be used which is done within the transport payload, so this get rid
of queue links list and just use single link point instead.
---
 profiles/audio/media.c     |   6 +-
 profiles/audio/transport.c |  43 +++++++----
 src/shared/bap.c           | 149 ++++++++++++-------------------------
 src/shared/bap.h           |   2 +-
 4 files changed, 77 insertions(+), 123 deletions(-)

diff --git a/profiles/audio/media.c b/profiles/audio/media.c
index b17c555b63e4..1faa1c28969f 100644
--- a/profiles/audio/media.c
+++ b/profiles/audio/media.c
@@ -921,7 +921,7 @@ done:
 }
 
 static int pac_select(struct bt_bap_pac *lpac, struct bt_bap_pac *rpac,
-			uint32_t chan_alloc, struct bt_bap_pac_qos *qos,
+			uint32_t location, struct bt_bap_pac_qos *qos,
 			bt_bap_pac_select_t cb, void *cb_data, void *user_data)
 {
 	struct media_endpoint *endpoint = user_data;
@@ -969,9 +969,9 @@ static int pac_select(struct bt_bap_pac *lpac, struct bt_bap_pac *rpac,
 		g_dbus_dict_append_entry(&dict, "Locations", DBUS_TYPE_UINT32,
 									&loc);
 
-	if (chan_alloc)
+	if (location)
 		g_dbus_dict_append_entry(&dict, "ChannelAllocation",
-					 DBUS_TYPE_UINT32, &chan_alloc);
+					DBUS_TYPE_UINT32, &location);
 
 	if (metadata) {
 		key = "Metadata";
diff --git a/profiles/audio/transport.c b/profiles/audio/transport.c
index 23ea267f6446..e2073451cc7a 100644
--- a/profiles/audio/transport.c
+++ b/profiles/audio/transport.c
@@ -312,9 +312,12 @@ static void media_transport_remove_owner(struct media_transport *transport)
 		media_request_reply(owner->pending, EIO);
 
 	transport->owner = NULL;
-	if (bap->linked)
-		queue_foreach(bt_bap_stream_io_get_links(bap->stream),
-				linked_transport_remove_owner, owner);
+	if (bap->linked) {
+		struct bt_bap_stream *link;
+
+		link = bt_bap_stream_io_get_link(bap->stream);
+		linked_transport_remove_owner(link, owner);
+	}
 
 	if (owner->watch)
 		g_dbus_remove_watch(btd_get_dbus_connection(), owner->watch);
@@ -496,9 +499,12 @@ static void media_transport_set_owner(struct media_transport *transport,
 	DBG("Transport %s Owner %s", transport->path, owner->name);
 	transport->owner = owner;
 
-	if (bap->linked)
-		queue_foreach(bt_bap_stream_io_get_links(bap->stream),
-				linked_transport_set_owner, owner);
+	if (bap->linked) {
+		struct bt_bap_stream *link;
+
+		link = bt_bap_stream_io_get_link(bap->stream);
+		linked_transport_set_owner(link, owner);
+	}
 
 	owner->transport = transport;
 	owner->watch = g_dbus_add_disconnect_watch(btd_get_dbus_connection(),
@@ -962,12 +968,15 @@ static gboolean links_exists(const GDBusPropertyTable *property, void *data)
 	return bap->linked;
 }
 
-static void append_links(void *data, void *user_data)
+static void append_link(void *data, void *user_data)
 {
 	struct bt_bap_stream *stream = data;
 	DBusMessageIter *array = user_data;
 	struct media_transport *transport;
 
+	if (!stream)
+		return;
+
 	transport = find_transport_by_bap_stream(stream);
 	if (!transport) {
 		error("Unable to find transport");
@@ -983,14 +992,14 @@ static gboolean get_links(const GDBusPropertyTable *property,
 {
 	struct media_transport *transport = data;
 	struct bap_transport *bap = transport->data;
-	struct queue *links = bt_bap_stream_io_get_links(bap->stream);
+	struct bt_bap_stream *link = bt_bap_stream_io_get_link(bap->stream);
 	DBusMessageIter array;
 
 	dbus_message_iter_open_container(iter, DBUS_TYPE_ARRAY,
 					DBUS_TYPE_OBJECT_PATH_AS_STRING,
 					&array);
 
-	queue_foreach(links, append_links, &array);
+	append_link(link, &array);
 
 	dbus_message_iter_close_container(iter, &array);
 
@@ -1280,15 +1289,15 @@ static bool match_link_transport(const void *data, const void *user_data)
 static void bap_update_links(const struct media_transport *transport)
 {
 	struct bap_transport *bap = transport->data;
-	struct queue *links = bt_bap_stream_io_get_links(bap->stream);
+	struct bt_bap_stream *link = bt_bap_stream_io_get_link(bap->stream);
 
-	if (bap->linked == !queue_isempty(links))
+	if (bap->linked == (!!link))
 		return;
 
-	bap->linked = !queue_isempty(links);
+	bap->linked = link ? true : false;
 
 	/* Check if the links transport has been create yet */
-	if (bap->linked && !queue_find(links, match_link_transport, NULL)) {
+	if (bap->linked && !match_link_transport(link, NULL)) {
 		bap->linked = false;
 		return;
 	}
@@ -1456,13 +1465,15 @@ static void set_state_bap(struct media_transport *transport,
 					transport_state_t state)
 {
 	struct bap_transport *bap = transport->data;
+	struct bt_bap_stream *link;
 
 	if (!bap->linked)
 		return;
 
-	/* Update links */
-	queue_foreach(bt_bap_stream_io_get_links(bap->stream), link_set_state,
-							UINT_TO_PTR(state));
+	link = bt_bap_stream_io_get_link(bap->stream);
+
+	/* Update link */
+	link_set_state(link, UINT_TO_PTR(state));
 }
 
 static void bap_state_changed(struct bt_bap_stream *stream, uint8_t old_state,
diff --git a/src/shared/bap.c b/src/shared/bap.c
index e1dad95aca99..8add1348ec3c 100644
--- a/src/shared/bap.c
+++ b/src/shared/bap.c
@@ -222,7 +222,7 @@ struct bt_bap_stream {
 	struct iovec *cc;
 	struct iovec *meta;
 	struct bt_bap_qos qos;
-	struct queue *links;
+	struct bt_bap_stream *link;
 	struct bt_bap_stream_io *io;
 	bool client;
 	void *user_data;
@@ -1010,14 +1010,6 @@ static void stream_io_unref(struct bt_bap_stream_io *io)
 	stream_io_free(io);
 }
 
-static void bap_stream_unlink(void *data, void *user_data)
-{
-	struct bt_bap_stream *link = data;
-	struct bt_bap_stream *stream = user_data;
-
-	queue_remove(link->links, stream);
-}
-
 static void bap_stream_free(void *data)
 {
 	struct bt_bap_stream *stream = data;
@@ -1025,8 +1017,9 @@ static void bap_stream_free(void *data)
 	if (stream->ep)
 		stream->ep->stream = NULL;
 
-	queue_foreach(stream->links, bap_stream_unlink, stream);
-	queue_destroy(stream->links, NULL);
+	if (stream->link)
+		stream->link->link = NULL;
+
 	stream_io_unref(stream->io);
 	util_iov_free(stream->cc, 1);
 	util_iov_free(stream->meta, 1);
@@ -1050,12 +1043,12 @@ static void bap_stream_detach(struct bt_bap_stream *stream)
 	bap_stream_free(stream);
 }
 
-static void bap_stream_io_link(void *data, void *user_data)
+static bool bap_stream_io_link(const void *data, const void *user_data)
 {
-	struct bt_bap_stream *stream = data;
-	struct bt_bap_stream *link = user_data;
+	struct bt_bap_stream *stream = (void *)data;
+	struct bt_bap_stream *link = (void *)user_data;
 
-	bt_bap_stream_io_link(stream, link);
+	return !bt_bap_stream_io_link(stream, link);
 }
 
 static void bap_stream_update_io_links(struct bt_bap_stream *stream)
@@ -1064,7 +1057,7 @@ static void bap_stream_update_io_links(struct bt_bap_stream *stream)
 
 	DBG(bap, "stream %p", stream);
 
-	queue_foreach(bap->streams, bap_stream_io_link, stream);
+	queue_find(bap->streams, bap_stream_io_link, stream);
 }
 
 static struct bt_bap_stream_io *stream_io_ref(struct bt_bap_stream_io *io)
@@ -1095,31 +1088,18 @@ static struct bt_bap_stream_io *stream_io_new(struct bt_bap *bap, int fd)
 	return stream_io_ref(sio);
 }
 
-static void stream_find_io(void *data, void *user_data)
-{
-	struct bt_bap_stream *stream = data;
-	struct bt_bap_stream_io **io = user_data;
-
-	if (*io)
-		return;
-
-	*io = stream->io;
-}
-
 static struct bt_bap_stream_io *stream_get_io(struct bt_bap_stream *stream)
 {
-	struct bt_bap_stream_io *io;
-
 	if (!stream)
 		return NULL;
 
 	if (stream->io)
 		return stream->io;
 
-	io = NULL;
-	queue_foreach(stream->links, stream_find_io, &io);
+	if (stream->link)
+		return stream->link->io;
 
-	return io;
+	return NULL;
 }
 
 static bool stream_io_disconnected(struct io *io, void *user_data);
@@ -1157,17 +1137,6 @@ static bool bap_stream_io_attach(struct bt_bap_stream *stream, int fd,
 	return true;
 }
 
-static bool match_stream_io(const void *data, const void *user_data)
-{
-	const struct bt_bap_stream *stream = data;
-	const struct bt_bap_stream_io *io = user_data;
-
-	if (!stream->io)
-		return false;
-
-	return stream->io == io;
-}
-
 static bool bap_stream_io_detach(struct bt_bap_stream *stream)
 {
 	struct bt_bap_stream *link;
@@ -1181,7 +1150,7 @@ static bool bap_stream_io_detach(struct bt_bap_stream *stream)
 	io = stream->io;
 	stream->io = NULL;
 
-	link = queue_find(stream->links, match_stream_io, io);
+	link = stream->link;
 	if (link) {
 		/* Detach link if in QoS state */
 		if (link->ep->state == BT_ASCS_ASE_STATE_QOS)
@@ -2485,14 +2454,15 @@ static struct bt_bap_pac *bap_pac_new(struct bt_bap_db *bdb, const char *name,
 	pac->bdb = bdb;
 	pac->name = name ? strdup(name) : NULL;
 	pac->type = type;
+
 	if (codec)
 		pac->codec = *codec;
 
-	bap_pac_merge(pac, data, metadata);
-
 	if (qos)
 		pac->qos = *qos;
 
+	bap_pac_merge(pac, data, metadata);
+
 	return pac;
 }
 
@@ -4692,6 +4662,7 @@ int bt_bap_select(struct bt_bap_pac *lpac, struct bt_bap_pac *rpac,
 		int i;
 
 		printf("lmap 0x%02x\n", lmap);
+		printf("lc->location 0x%02x\n", lc->location);
 
 		for (i = 0, rchan = queue_get_entries(rpac->channels); rchan;
 					rchan = rchan->next, i++) {
@@ -4714,6 +4685,8 @@ int bt_bap_select(struct bt_bap_pac *lpac, struct bt_bap_pac *rpac,
 				 */
 				if (rc->count == 0x01)
 					rc->location &= BIT(i);
+
+				printf("rc->location 0x%02x\n", rc->location);
 			}
 
 			lpac->ops->select(lpac, rpac, lc->location &
@@ -4940,14 +4913,6 @@ static int bap_stream_metadata(struct bt_bap_stream *stream, uint8_t op,
 	return req->id;
 }
 
-static void bap_stream_enable_link(void *data, void *user_data)
-{
-	struct bt_bap_stream *stream = data;
-	struct iovec *metadata = user_data;
-
-	bap_stream_metadata(stream, BT_ASCS_ENABLE, metadata, NULL, NULL);
-}
-
 unsigned int bt_bap_stream_enable(struct bt_bap_stream *stream,
 					bool enable_links,
 					struct iovec *metadata,
@@ -4969,7 +4934,9 @@ unsigned int bt_bap_stream_enable(struct bt_bap_stream *stream,
 		if (!ret || !enable_links)
 			return ret;
 
-		queue_foreach(stream->links, bap_stream_enable_link, metadata);
+		if (stream->link)
+			bap_stream_metadata(stream->link, BT_ASCS_ENABLE,
+						metadata, NULL, NULL);
 		break;
 	case BT_BAP_STREAM_TYPE_BCAST:
 		if (!bt_bap_stream_io_dir(stream))
@@ -5032,26 +4999,6 @@ unsigned int bt_bap_stream_start(struct bt_bap_stream *stream,
 	return 0;
 }
 
-static void bap_stream_disable_link(void *data, void *user_data)
-{
-	struct bt_bap_stream *stream = data;
-	struct bt_bap_req *req;
-	struct iovec iov;
-	struct bt_ascs_disable disable;
-
-	memset(&disable, 0, sizeof(disable));
-
-	disable.ase = stream->ep->id;
-
-	iov.iov_base = &disable;
-	iov.iov_len = sizeof(disable);
-
-	req = bap_req_new(stream, BT_ASCS_DISABLE, &iov, 1, NULL, NULL);
-
-	if (!bap_queue_req(stream->bap, req))
-		bap_req_free(req);
-}
-
 unsigned int bt_bap_stream_disable(struct bt_bap_stream *stream,
 					bool disable_links,
 					bt_bap_stream_func_t func,
@@ -5087,8 +5034,7 @@ unsigned int bt_bap_stream_disable(struct bt_bap_stream *stream,
 		}
 
 		if (disable_links)
-			queue_foreach(stream->links, bap_stream_disable_link,
-							NULL);
+			bt_bap_stream_disable(stream->link, false, NULL, NULL);
 
 		return req->id;
 
@@ -5295,7 +5241,8 @@ bool bt_bap_stream_set_io(struct bt_bap_stream *stream, int fd)
 
 	bap_stream_set_io(stream, INT_TO_PTR(fd));
 
-	queue_foreach(stream->links, bap_stream_set_io, INT_TO_PTR(fd));
+	if (stream->link)
+		bap_stream_set_io(stream, INT_TO_PTR(fd));
 
 	return true;
 }
@@ -5348,22 +5295,17 @@ int bt_bap_stream_io_link(struct bt_bap_stream *stream,
 	if (!stream || !link || stream == link)
 		return -EINVAL;
 
-	if (queue_find(stream->links, NULL, link))
+	if (stream->link || link->link)
 		return -EALREADY;
 
 	if (stream->client != link->client ||
 			stream->qos.ucast.cig_id != link->qos.ucast.cig_id ||
-			stream->qos.ucast.cis_id != link->qos.ucast.cis_id)
+			stream->qos.ucast.cis_id != link->qos.ucast.cis_id ||
+			stream->ep->dir == link->ep->dir)
 		return -EINVAL;
 
-	if (!stream->links)
-		stream->links = queue_new();
-
-	if (!link->links)
-		link->links = queue_new();
-
-	queue_push_tail(stream->links, link);
-	queue_push_tail(link->links, stream);
+	stream->link = link;
+	link->link = stream;
 
 	/* Link IOs if already set on stream/link */
 	if (stream->io && !link->io)
@@ -5376,12 +5318,12 @@ int bt_bap_stream_io_link(struct bt_bap_stream *stream,
 	return 0;
 }
 
-struct queue *bt_bap_stream_io_get_links(struct bt_bap_stream *stream)
+struct bt_bap_stream *bt_bap_stream_io_get_link(struct bt_bap_stream *stream)
 {
 	if (!stream)
 		return NULL;
 
-	return stream->links;
+	return stream->link;
 }
 
 static void bap_stream_get_in_qos(void *data, void *user_data)
@@ -5389,6 +5331,9 @@ static void bap_stream_get_in_qos(void *data, void *user_data)
 	struct bt_bap_stream *stream = data;
 	struct bt_bap_qos **qos = user_data;
 
+	if (!stream)
+		return;
+
 	if (!qos || *qos || stream->ep->dir != BT_BAP_SOURCE ||
 				!stream->qos.ucast.io_qos.sdu)
 		return;
@@ -5401,6 +5346,9 @@ static void bap_stream_get_out_qos(void *data, void *user_data)
 	struct bt_bap_stream *stream = data;
 	struct bt_bap_qos **qos = user_data;
 
+	if (!stream)
+		return;
+
 	if (!qos || *qos || stream->ep->dir != BT_BAP_SINK ||
 				!stream->qos.ucast.io_qos.sdu)
 		return;
@@ -5418,11 +5366,11 @@ bool bt_bap_stream_io_get_qos(struct bt_bap_stream *stream,
 	switch (stream->ep->dir) {
 	case BT_BAP_SOURCE:
 		bap_stream_get_in_qos(stream, in);
-		queue_foreach(stream->links, bap_stream_get_out_qos, out);
+		bap_stream_get_out_qos(stream->link, out);
 		break;
 	case BT_BAP_SINK:
 		bap_stream_get_out_qos(stream, out);
-		queue_foreach(stream->links, bap_stream_get_in_qos, in);
+		bap_stream_get_in_qos(stream->link, in);
 		break;
 	default:
 		return false;
@@ -5433,14 +5381,6 @@ bool bt_bap_stream_io_get_qos(struct bt_bap_stream *stream,
 	return in && out;
 }
 
-static void bap_stream_get_dir(void *data, void *user_data)
-{
-	struct bt_bap_stream *stream = data;
-	uint8_t *dir = user_data;
-
-	*dir |= stream->ep->dir;
-}
-
 uint8_t bt_bap_stream_io_dir(struct bt_bap_stream *stream)
 {
 	uint8_t dir;
@@ -5450,7 +5390,8 @@ uint8_t bt_bap_stream_io_dir(struct bt_bap_stream *stream)
 
 	dir = stream->ep->dir;
 
-	queue_foreach(stream->links, bap_stream_get_dir, &dir);
+	if (stream->link)
+		dir |= stream->link->ep->dir;
 
 	return dir;
 }
@@ -5461,6 +5402,9 @@ static void bap_stream_io_connecting(void *data, void *user_data)
 	int fd = PTR_TO_INT(user_data);
 	const struct queue_entry *entry;
 
+	if (!stream)
+		return;
+
 	if (fd >= 0)
 		bap_stream_io_attach(stream, fd, true);
 	else
@@ -5482,8 +5426,7 @@ int bt_bap_stream_io_connecting(struct bt_bap_stream *stream, int fd)
 		return -EINVAL;
 
 	bap_stream_io_connecting(stream, INT_TO_PTR(fd));
-
-	queue_foreach(stream->links, bap_stream_io_connecting, INT_TO_PTR(fd));
+	bap_stream_io_connecting(stream->link, INT_TO_PTR(fd));
 
 	return 0;
 }
diff --git a/src/shared/bap.h b/src/shared/bap.h
index 9be198cec72c..51edc08ab1ac 100644
--- a/src/shared/bap.h
+++ b/src/shared/bap.h
@@ -303,7 +303,7 @@ int bt_bap_stream_cancel(struct bt_bap_stream *stream, unsigned int id);
 
 int bt_bap_stream_io_link(struct bt_bap_stream *stream,
 					struct bt_bap_stream *link);
-struct queue *bt_bap_stream_io_get_links(struct bt_bap_stream *stream);
+struct bt_bap_stream *bt_bap_stream_io_get_link(struct bt_bap_stream *stream);
 bool bt_bap_stream_io_get_qos(struct bt_bap_stream *stream,
 					struct bt_bap_qos **in,
 					struct bt_bap_qos **out);
-- 
2.43.0


