Return-Path: <linux-bluetooth+bounces-571-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1905480F8C8
	for <lists+linux-bluetooth@lfdr.de>; Tue, 12 Dec 2023 21:58:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C79C1C20D6B
	for <lists+linux-bluetooth@lfdr.de>; Tue, 12 Dec 2023 20:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E93665A83;
	Tue, 12 Dec 2023 20:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aeisHW1I"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9032FF2
	for <linux-bluetooth@vger.kernel.org>; Tue, 12 Dec 2023 12:58:16 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5d747dbf81eso54170677b3.1
        for <linux-bluetooth@vger.kernel.org>; Tue, 12 Dec 2023 12:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702414695; x=1703019495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bTEneyeVAZkpPv7iM5dhXKZa7bmviESzAdvweEGWs8s=;
        b=aeisHW1I2k7f0ycYPkQ4SLlcb4NAfpHNqt8m3q1JYLmgembNdm5xbrxzT0Mv+Dekzk
         BU4zcj9lTruQ/QoEZHndQFFmfB877PujeewFRiknyYiD6ziAFOEVU12e64PzsUpZcPxH
         Ailhc3SAx9dIaRM6O10nlm0OIvI+wTc68K79DyY3f+rqL46yVmoFcH4p/Sf4BAnpwccF
         V3/FbPDyZo2FD82tnZubOLtblLzuEmqVI4O2Bj/6bJ08g2iCR1PtHpSaWql/zfzgtWVH
         bXBAqq5HszkUSOL4tCESVpbeaDpiX9qghUCE71SPJBVJdD0zBTYB4dKrMY2QMe8BGYGx
         +kfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702414695; x=1703019495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bTEneyeVAZkpPv7iM5dhXKZa7bmviESzAdvweEGWs8s=;
        b=YF1hxPC3Mm3rPzhUDnz2f9AmgWR6JAcIDzIxPhY8VQ1z4VATWKMwQKcCJAGljIK5+r
         9zoTVtqppwHagVdvtt68sR4xqMM9DDDdTmYLetudbIUzZI4Q+Rg8bhKiq3Dn9GauIV8O
         gZKUlB9G7WYMKhifNYWoizly/ZXEGvYc/yPH+jtYwp7xvXcfE2PuyPquRKrnfD73hYci
         QCsNC/v22HlUl8RSgHqAiOM1U5BqKECQSLszYimUay1ynFbeKkeGMtPm0iSbHMLUqGyM
         SIXLgtAbtVfQaplm8KDtn4eUs72tx+8hkGTsEgkROsnmy1+BgFmuLwzYuQFl1D3zJWt4
         mcLw==
X-Gm-Message-State: AOJu0YwLkLyNROBzIUYlBCOM35uwscEgY9551aQ4xbiv+aC1mSRBWYnK
	yAdUpvYOVjtv+/wSBHQsUTXAGdvrqPs=
X-Google-Smtp-Source: AGHT+IGxPSnFdx11k2T7z8kBbROA/LZ0rZHFnLWxWvxp6qymB/M3Xt4o9fm7flTBaWXqysnC9v21YQ==
X-Received: by 2002:a0d:e904:0:b0:5d7:1941:ace with SMTP id s4-20020a0de904000000b005d719410acemr5457664ywe.105.1702414694500;
        Tue, 12 Dec 2023 12:58:14 -0800 (PST)
Received: from lvondent-mobl4.. (071-047-239-151.res.spectrum.com. [71.47.239.151])
        by smtp.gmail.com with ESMTPSA id i16-20020a0ddf10000000b005e28951e3a4sm144735ywe.51.2023.12.12.12.58.12
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 12:58:13 -0800 (PST)
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v5 5/6] shared/bap: Fix stream IO linking
Date: Tue, 12 Dec 2023 15:58:03 -0500
Message-ID: <20231212205804.881265-5-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231212205804.881265-1-luiz.dentz@gmail.com>
References: <20231212205804.881265-1-luiz.dentz@gmail.com>
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
 src/shared/bap.c           | 146 +++++++++++--------------------------
 src/shared/bap.h           |   2 +-
 4 files changed, 74 insertions(+), 123 deletions(-)

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
index af2cc1ef1eb0..078d308dc4c2 100644
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
 
@@ -4945,14 +4915,6 @@ static int bap_stream_metadata(struct bt_bap_stream *stream, uint8_t op,
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
@@ -4974,7 +4936,9 @@ unsigned int bt_bap_stream_enable(struct bt_bap_stream *stream,
 		if (!ret || !enable_links)
 			return ret;
 
-		queue_foreach(stream->links, bap_stream_enable_link, metadata);
+		if (stream->link)
+			bap_stream_metadata(stream->link, BT_ASCS_ENABLE,
+						metadata, NULL, NULL);
 		break;
 	case BT_BAP_STREAM_TYPE_BCAST:
 		if (!bt_bap_stream_io_dir(stream))
@@ -5037,26 +5001,6 @@ unsigned int bt_bap_stream_start(struct bt_bap_stream *stream,
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
@@ -5092,8 +5036,7 @@ unsigned int bt_bap_stream_disable(struct bt_bap_stream *stream,
 		}
 
 		if (disable_links)
-			queue_foreach(stream->links, bap_stream_disable_link,
-							NULL);
+			bt_bap_stream_disable(stream->link, false, NULL, NULL);
 
 		return req->id;
 
@@ -5300,7 +5243,8 @@ bool bt_bap_stream_set_io(struct bt_bap_stream *stream, int fd)
 
 	bap_stream_set_io(stream, INT_TO_PTR(fd));
 
-	queue_foreach(stream->links, bap_stream_set_io, INT_TO_PTR(fd));
+	if (stream->link)
+		bap_stream_set_io(stream, INT_TO_PTR(fd));
 
 	return true;
 }
@@ -5353,22 +5297,17 @@ int bt_bap_stream_io_link(struct bt_bap_stream *stream,
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
@@ -5381,12 +5320,12 @@ int bt_bap_stream_io_link(struct bt_bap_stream *stream,
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
@@ -5394,6 +5333,9 @@ static void bap_stream_get_in_qos(void *data, void *user_data)
 	struct bt_bap_stream *stream = data;
 	struct bt_bap_qos **qos = user_data;
 
+	if (!stream)
+		return;
+
 	if (!qos || *qos || stream->ep->dir != BT_BAP_SOURCE ||
 				!stream->qos.ucast.io_qos.sdu)
 		return;
@@ -5406,6 +5348,9 @@ static void bap_stream_get_out_qos(void *data, void *user_data)
 	struct bt_bap_stream *stream = data;
 	struct bt_bap_qos **qos = user_data;
 
+	if (!stream)
+		return;
+
 	if (!qos || *qos || stream->ep->dir != BT_BAP_SINK ||
 				!stream->qos.ucast.io_qos.sdu)
 		return;
@@ -5423,11 +5368,11 @@ bool bt_bap_stream_io_get_qos(struct bt_bap_stream *stream,
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
@@ -5438,14 +5383,6 @@ bool bt_bap_stream_io_get_qos(struct bt_bap_stream *stream,
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
@@ -5455,7 +5392,8 @@ uint8_t bt_bap_stream_io_dir(struct bt_bap_stream *stream)
 
 	dir = stream->ep->dir;
 
-	queue_foreach(stream->links, bap_stream_get_dir, &dir);
+	if (stream->link)
+		dir |= stream->link->ep->dir;
 
 	return dir;
 }
@@ -5466,6 +5404,9 @@ static void bap_stream_io_connecting(void *data, void *user_data)
 	int fd = PTR_TO_INT(user_data);
 	const struct queue_entry *entry;
 
+	if (!stream)
+		return;
+
 	if (fd >= 0)
 		bap_stream_io_attach(stream, fd, true);
 	else
@@ -5487,8 +5428,7 @@ int bt_bap_stream_io_connecting(struct bt_bap_stream *stream, int fd)
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


