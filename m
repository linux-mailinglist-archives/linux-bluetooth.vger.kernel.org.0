Return-Path: <linux-bluetooth+bounces-12387-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70952AB740A
	for <lists+linux-bluetooth@lfdr.de>; Wed, 14 May 2025 20:07:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E348C17F0DF
	for <lists+linux-bluetooth@lfdr.de>; Wed, 14 May 2025 18:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D30ED1F8670;
	Wed, 14 May 2025 18:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UmupLg24"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05AB1EA7F9
	for <linux-bluetooth@vger.kernel.org>; Wed, 14 May 2025 18:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245709; cv=none; b=TzILVHtb0KdcBXapUxC//4w5Ds7cmp/wxRiw563u25UelN6Je3xe7mFeQxiP/x31iQPmBzxQy7epfC5XbPtHwtpdDc1uYewHq9ZQHlwd6UfWUD4gtyrmdtF2Fhwt0TbM/Mi88AqsY6nXqH3Yjf29KBGmIKwPGWLqQPMnBgUtywk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245709; c=relaxed/simple;
	bh=HVi4Tk2nYAbvBpkAz22pexCX2v6ILmdWl4ucCLM4+u8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=spbPACOM9OqneJK2EFCCjWalp1S61/Szpx53ACIlK+GuLZR9WHO/J9kg/EwC+mDu/JL1hpT+D6e2YM58lkKVAJ2812h6V+Vn4qdsKRxLLk90FoGbYkVjp8qxPaQV6e5T6PXtESbSMJN9dfAhdQjm/9Qtv1y3Pvq/9ckJrUPKV08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UmupLg24; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6f5499c21bbso2136386d6.3
        for <linux-bluetooth@vger.kernel.org>; Wed, 14 May 2025 11:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747245704; x=1747850504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2qux9eftO0zuiDlLpCXMTS1z12uhJrYwxHLX1kJHPOM=;
        b=UmupLg24gfhYoH4hrJNioEo7Le8dAVFGcv91exbJMUSZEv+YSfGmUDTCzrRluMD+OG
         CpUFQfGBcchHD4/qRqRbc4Z6wGs9DF94OmTlu7DsO4KF2c4i5FSS/iFI0bmP0AVIRhw+
         KDx9GlzKCHux+ArG+csjrCzGe+yYR1MNl56JUgHxRArW4SHrCvM44D7i0cGXvqAEznhh
         aL6TZvvXQf/XMsbkIbvOC5h+25F13xcyz872NsZ9BsIYqFRWuzdmfPwHoNHbwxL69sll
         bwPMc4Rnmbhq+pUp0huzMUlPr1aN4oLaUjXflFnJWmMq6I70esnzGNtQhs61fC+ZpyBj
         RP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747245704; x=1747850504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2qux9eftO0zuiDlLpCXMTS1z12uhJrYwxHLX1kJHPOM=;
        b=Ff9ONcO4CmlPKVPvPciOFN8cIhCdNYNCGvLM5mzayGUE/CsyxE2lmt4seOlhAaUg5e
         5hOTdrGY7UmjnuttW6zkUtZ4ljrLpa1xqmfmyqnKqbNhfUBWBXjzwOVmkVSRL49GYrU2
         o/kdXPM8aLbpqrE9rn2dKvOn6ds3o3xiJ9fcTAzJgtxt9MJmD2YM/o8ItCBYrtkEI3xs
         RXmfuvoEyOPytBn9E2NGVKqZe76KpsllAo9MaZYf9r1IOivVyQqM8tTvcncaEqL0HvtU
         j2QqHYygQn212amRhmVHsCp8nM5MEdteQc55JrbciYuKhWmN1MCLAl8fuxmOLvejSr6P
         YZ1A==
X-Gm-Message-State: AOJu0YxrKRWFDdrp/qiU1y2mPFtBN4B5f7BvSC5i15rxLSlYO32ShmlP
	aPuNF/pCX5Q61w51CMa5/8uplX0/vDwsvPU8tYCKyWftLXux9sWLH28B9eNA
X-Gm-Gg: ASbGncufzAi3Qb7rB/DofIW5xGg6uI+q/EaLJJ4/xWkwzU1KxmzQyvZhYJNp3t9pZTS
	EBSCTpFmQcJi4Js/P94tNryJ4DX98frAtmHxSQv0oFgqvr/cDpz0+PnT3xs5NDZkGwbMl+Gzhm7
	RvJR0ffSiV2qgiZeIiIBqMWodNWAoovQFXrjqXV99k7fii1BBjyIg6EmACBno77UppmKy2utiE4
	CVomaWQKFR0lPnZA8lFueVIeuzvbAHIiCOO8HnhM/NZTAfJDFy3qhEmLE7q89+/9Lg29J9jw4FA
	qRWVdDpraYWzP8+ROF5t1SDOM52/LqU4qcJY2tw9AvhCL6WPIyKmAqqT1CsZyws47KuOCGilYt2
	pF7KJS+ovbIB6aWZoiodukDjMmmlaoEs=
X-Google-Smtp-Source: AGHT+IH31dxSKwOrtXpRzW3ulqq8ViPE3Ij1Rl5dPbDrp/ZmNXjop5AlxfCmzTF6spxjtyhUOBZL+A==
X-Received: by 2002:a05:6808:6f98:b0:403:476c:ca44 with SMTP id 5614622812f47-404c1fac649mr2990596b6e.2.1747245693117;
        Wed, 14 May 2025 11:01:33 -0700 (PDT)
Received: from lvondent-mobl5.. (syn-050-089-067-214.res.spectrum.com. [50.89.67.214])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f6297d59sm9052258241.31.2025.05.14.11.01.31
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 11:01:31 -0700 (PDT)
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v2 2/2] a2dp: Fix a2dp_sep mapping to a single stream
Date: Wed, 14 May 2025 14:01:27 -0400
Message-ID: <20250514180127.1399136-2-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514180127.1399136-1-luiz.dentz@gmail.com>
References: <20250514180127.1399136-1-luiz.dentz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This removes the assumption that only 1 stream can be configured per
local sep which prevents multipoint setups where different devices can
be using the same local endpoint.

Fixes: https://github.com/bluez/bluez/issues/1037
Fixes: https://github.com/bluez/bluez/issues/1064
---
 profiles/audio/a2dp.c      | 320 ++++++++++++++++++++++++++-----------
 profiles/audio/a2dp.h      |   7 +-
 profiles/audio/avdtp.c     |   1 +
 profiles/audio/media.c     |  15 +-
 profiles/audio/transport.c |   3 +-
 5 files changed, 248 insertions(+), 98 deletions(-)

diff --git a/profiles/audio/a2dp.c b/profiles/audio/a2dp.c
index 2e68b1d6b65b..482de4a98773 100644
--- a/profiles/audio/a2dp.c
+++ b/profiles/audio/a2dp.c
@@ -63,19 +63,23 @@
 
 #define MEDIA_ENDPOINT_INTERFACE "org.bluez.MediaEndpoint1"
 
+struct a2dp_stream {
+	struct avdtp *session;
+	struct avdtp_stream *stream;
+	unsigned int suspend_timer;
+	gboolean locked;
+	gboolean suspending;
+	gboolean starting;
+};
+
 struct a2dp_sep {
 	struct a2dp_server *server;
 	struct a2dp_endpoint *endpoint;
 	uint8_t type;
 	uint8_t codec;
 	struct avdtp_local_sep *lsep;
-	struct avdtp *session;
-	struct avdtp_stream *stream;
-	unsigned int suspend_timer;
+	struct queue *streams;
 	gboolean delay_reporting;
-	gboolean locked;
-	gboolean suspending;
-	gboolean starting;
 	void *user_data;
 	GDestroyNotify destroy;
 };
@@ -513,6 +517,80 @@ static struct a2dp_setup *find_setup_by_stream(struct avdtp_stream *stream)
 	return NULL;
 }
 
+static bool match_stream_session(const void *data, const void *user_data)
+{
+	const struct a2dp_stream *stream = data;
+	const struct avdtp *session = user_data;
+
+	return stream->session == session;
+}
+
+static struct a2dp_stream *a2dp_stream_new(struct a2dp_sep *sep,
+						struct avdtp *session)
+{
+	struct a2dp_stream *stream;
+
+	if (!sep->streams)
+		sep->streams = queue_new();
+
+	stream = new0(struct a2dp_stream, 1);
+	stream->session = avdtp_ref(session);
+	queue_push_tail(sep->streams, stream);
+
+	return stream;
+}
+
+static struct a2dp_stream *a2dp_stream_get(struct a2dp_sep *sep,
+						struct avdtp *session)
+{
+	struct a2dp_stream *stream;
+
+	DBG("sep %p session %p", sep, session);
+
+	stream = queue_find(sep->streams, match_stream_session, session);
+	if (stream)
+		return stream;
+
+	return a2dp_stream_new(sep, session);
+}
+
+static void a2dp_stream_starting(struct a2dp_sep *sep, struct avdtp *session)
+{
+	struct a2dp_stream *stream;
+
+	stream = a2dp_stream_get(sep, session);
+	if (!stream)
+		return;
+
+	stream->starting = TRUE;
+}
+
+static void a2dp_stream_free(struct a2dp_stream *stream)
+{
+	avdtp_unref(stream->session);
+	free(stream);
+}
+
+static bool match_stream(const void *data, const void *user_data)
+{
+	const struct a2dp_stream *astream = data;
+	const struct avdtp_stream *stream = user_data;
+
+	return astream->stream == stream;
+}
+
+static void a2dp_stream_destroy(struct a2dp_sep *sep,
+				struct avdtp_stream *stream)
+{
+	struct a2dp_stream *astream;
+
+	DBG("sep %p stream %p", sep, stream);
+
+	astream = queue_remove_if(sep->streams, match_stream, stream);
+	if (astream)
+		a2dp_stream_free(astream);
+}
+
 static void stream_state_changed(struct avdtp_stream *stream,
 					avdtp_state_t old_state,
 					avdtp_state_t new_state,
@@ -520,6 +598,8 @@ static void stream_state_changed(struct avdtp_stream *stream,
 					void *user_data)
 {
 	struct a2dp_sep *sep = user_data;
+	struct a2dp_stream *a2dp_stream;
+	struct btd_device *dev = NULL;
 
 	if (new_state == AVDTP_STATE_OPEN) {
 		struct a2dp_setup *setup;
@@ -539,7 +619,7 @@ static void stream_state_changed(struct avdtp_stream *stream,
 			return;
 		}
 
-		sep->starting = TRUE;
+		a2dp_stream_starting(sep, setup->session);
 
 		return;
 	}
@@ -547,20 +627,14 @@ static void stream_state_changed(struct avdtp_stream *stream,
 	if (new_state != AVDTP_STATE_IDLE)
 		return;
 
-	if (sep->suspend_timer) {
-		timeout_remove(sep->suspend_timer);
-		sep->suspend_timer = 0;
+	a2dp_stream = queue_find(sep->streams, match_stream, stream);
+	if (a2dp_stream) {
+		dev = avdtp_get_device(a2dp_stream->session);
+		a2dp_stream_destroy(sep, stream);
 	}
 
-	if (sep->session) {
-		avdtp_unref(sep->session);
-		sep->session = NULL;
-	}
-
-	sep->stream = NULL;
-
 	if (sep->endpoint && sep->endpoint->clear_configuration)
-		sep->endpoint->clear_configuration(sep, sep->user_data);
+		sep->endpoint->clear_configuration(sep, dev, sep->user_data);
 }
 
 static gboolean auto_config(gpointer data)
@@ -568,9 +642,11 @@ static gboolean auto_config(gpointer data)
 	struct a2dp_setup *setup = data;
 	struct btd_device *dev = NULL;
 	struct btd_service *service;
+	struct a2dp_stream *stream;
 
 	/* Check if configuration was aborted */
-	if (setup->sep->stream == NULL)
+	stream = queue_find(setup->sep->streams, match_stream, setup->stream);
+	if (!stream)
 		return FALSE;
 
 	if (setup->err != NULL)
@@ -663,17 +739,22 @@ static gboolean endpoint_setconf_ind(struct avdtp *session,
 {
 	struct a2dp_sep *a2dp_sep = user_data;
 	struct a2dp_setup *setup;
+	struct a2dp_stream *a2dp_stream;
 
 	if (a2dp_sep->type == AVDTP_SEP_TYPE_SINK)
 		DBG("Sink %p: Set_Configuration_Ind", sep);
 	else
 		DBG("Source %p: Set_Configuration_Ind", sep);
 
+	a2dp_stream = a2dp_stream_get(a2dp_sep, session);
+	if (!a2dp_stream)
+		return FALSE;
+
 	setup = a2dp_setup_get(session);
 	if (!setup)
 		return FALSE;
 
-	a2dp_sep->stream = stream;
+	a2dp_stream->stream = stream;
 	setup->sep = a2dp_sep;
 	setup->stream = stream;
 	setup->setconf_cb = cb;
@@ -907,6 +988,7 @@ static void setconf_cfm(struct avdtp *session, struct avdtp_local_sep *sep,
 {
 	struct a2dp_sep *a2dp_sep = user_data;
 	struct a2dp_setup *setup;
+	struct a2dp_stream *a2dp_stream;
 	struct btd_device *dev;
 	struct btd_service *service;
 	int ret;
@@ -932,7 +1014,10 @@ static void setconf_cfm(struct avdtp *session, struct avdtp_local_sep *sep,
 	}
 
 	avdtp_stream_add_cb(session, stream, stream_state_changed, a2dp_sep);
-	a2dp_sep->stream = stream;
+
+	a2dp_stream = a2dp_stream_get(a2dp_sep, session);
+	if (a2dp_stream)
+		a2dp_stream->stream = stream;
 
 	if (!setup)
 		return;
@@ -1138,15 +1223,12 @@ static void open_cfm(struct avdtp *session, struct avdtp_local_sep *sep,
 	return;
 }
 
-static bool suspend_timeout(struct a2dp_sep *sep)
+static bool suspend_timeout(struct a2dp_stream *stream)
 {
-	if (avdtp_suspend(sep->session, sep->stream) == 0)
-		sep->suspending = TRUE;
+	if (avdtp_suspend(stream->session, stream->stream) == 0)
+		stream->suspending = TRUE;
 
-	sep->suspend_timer = 0;
-
-	avdtp_unref(sep->session);
-	sep->session = NULL;
+	stream->suspend_timer = 0;
 
 	return FALSE;
 }
@@ -1156,6 +1238,7 @@ static gboolean start_ind(struct avdtp *session, struct avdtp_local_sep *sep,
 				void *user_data)
 {
 	struct a2dp_sep *a2dp_sep = user_data;
+	struct a2dp_stream *a2dp_stream;
 	struct a2dp_setup *setup;
 
 	if (a2dp_sep->type == AVDTP_SEP_TYPE_SINK)
@@ -1163,17 +1246,20 @@ static gboolean start_ind(struct avdtp *session, struct avdtp_local_sep *sep,
 	else
 		DBG("Source %p: Start_Ind", sep);
 
-	if (!a2dp_sep->locked) {
-		a2dp_sep->session = avdtp_ref(session);
-		a2dp_sep->suspend_timer = timeout_add_seconds(SUSPEND_TIMEOUT,
-					(timeout_func_t) suspend_timeout,
-					a2dp_sep, NULL);
-	}
+	a2dp_stream = queue_find(a2dp_sep->streams, match_stream, stream);
+	if (!a2dp_stream)
+		return FALSE;
 
-	if (!a2dp_sep->starting)
+	if (!a2dp_stream->locked)
+		a2dp_stream->suspend_timer = timeout_add_seconds(
+					SUSPEND_TIMEOUT,
+					(timeout_func_t) suspend_timeout,
+					a2dp_stream, NULL);
+
+	if (!a2dp_stream->starting)
 		return TRUE;
 
-	a2dp_sep->starting = FALSE;
+	a2dp_stream->starting = FALSE;
 
 	setup = find_setup_by_session(session);
 	if (setup)
@@ -1187,6 +1273,7 @@ static void start_cfm(struct avdtp *session, struct avdtp_local_sep *sep,
 			void *user_data)
 {
 	struct a2dp_sep *a2dp_sep = user_data;
+	struct a2dp_stream *a2dp_stream;
 	struct a2dp_setup *setup;
 
 	if (a2dp_sep->type == AVDTP_SEP_TYPE_SINK)
@@ -1194,7 +1281,11 @@ static void start_cfm(struct avdtp *session, struct avdtp_local_sep *sep,
 	else
 		DBG("Source %p: Start_Cfm", sep);
 
-	a2dp_sep->starting = FALSE;
+	a2dp_stream = queue_find(a2dp_sep->streams, match_stream, stream);
+	if (!a2dp_stream)
+		return;
+
+	a2dp_stream->starting = FALSE;
 
 	setup = find_setup_by_session(session);
 	if (!setup)
@@ -1213,6 +1304,7 @@ static gboolean suspend_ind(struct avdtp *session, struct avdtp_local_sep *sep,
 				void *user_data)
 {
 	struct a2dp_sep *a2dp_sep = user_data;
+	struct a2dp_stream *a2dp_stream;
 	struct a2dp_setup *setup;
 	gboolean start;
 	int start_err;
@@ -1222,17 +1314,19 @@ static gboolean suspend_ind(struct avdtp *session, struct avdtp_local_sep *sep,
 	else
 		DBG("Source %p: Suspend_Ind", sep);
 
-	if (a2dp_sep->suspend_timer) {
-		timeout_remove(a2dp_sep->suspend_timer);
-		a2dp_sep->suspend_timer = 0;
-		avdtp_unref(a2dp_sep->session);
-		a2dp_sep->session = NULL;
+	a2dp_stream = queue_find(a2dp_sep->streams, match_stream, stream);
+	if (!a2dp_stream)
+		return FALSE;
+
+	if (a2dp_stream->suspend_timer) {
+		timeout_remove(a2dp_stream->suspend_timer);
+		a2dp_stream->suspend_timer = 0;
 	}
 
-	if (!a2dp_sep->suspending)
+	if (!a2dp_stream->suspending)
 		return TRUE;
 
-	a2dp_sep->suspending = FALSE;
+	a2dp_stream->suspending = FALSE;
 
 	setup = find_setup_by_session(session);
 	if (!setup)
@@ -1246,7 +1340,7 @@ static gboolean suspend_ind(struct avdtp *session, struct avdtp_local_sep *sep,
 	if (!start)
 		return TRUE;
 
-	start_err = avdtp_start(session, a2dp_sep->stream);
+	start_err = avdtp_start(session, a2dp_stream->stream);
 	if (start_err < 0 && start_err != -EINPROGRESS) {
 		error("avdtp_start: %s (%d)", strerror(-start_err),
 								-start_err);
@@ -1261,6 +1355,7 @@ static void suspend_cfm(struct avdtp *session, struct avdtp_local_sep *sep,
 			void *user_data)
 {
 	struct a2dp_sep *a2dp_sep = user_data;
+	struct a2dp_stream *a2dp_stream;
 	struct a2dp_setup *setup;
 	gboolean start;
 	int start_err;
@@ -1270,7 +1365,11 @@ static void suspend_cfm(struct avdtp *session, struct avdtp_local_sep *sep,
 	else
 		DBG("Source %p: Suspend_Cfm", sep);
 
-	a2dp_sep->suspending = FALSE;
+	a2dp_stream = queue_find(a2dp_sep->streams, match_stream, stream);
+	if (!a2dp_stream)
+		return;
+
+	a2dp_stream->suspending = FALSE;
 
 	setup = find_setup_by_session(session);
 	if (!setup)
@@ -1294,7 +1393,7 @@ static void suspend_cfm(struct avdtp *session, struct avdtp_local_sep *sep,
 		return;
 	}
 
-	start_err = avdtp_start(session, a2dp_sep->stream);
+	start_err = avdtp_start(session, a2dp_stream->stream);
 	if (start_err < 0 && start_err != -EINPROGRESS) {
 		error("avdtp_start: %s (%d)", strerror(-start_err), -start_err);
 		finalize_setup_errno(setup, start_err, finalize_suspend, NULL);
@@ -1455,7 +1554,7 @@ static void abort_ind(struct avdtp *session, struct avdtp_local_sep *sep,
 	else
 		DBG("Source %p: Abort_Ind", sep);
 
-	a2dp_sep->stream = NULL;
+	a2dp_stream_destroy(a2dp_sep, stream);
 
 	setup = find_setup_by_session(session);
 	if (!setup)
@@ -1854,14 +1953,13 @@ static int a2dp_reconfig(struct a2dp_channel *chan, const char *sender,
 			uint8_t *caps, int size, void *user_data)
 {
 	struct a2dp_setup *setup;
+	struct a2dp_stream *stream;
 	struct a2dp_setup_cb *cb_data;
 	GSList *l;
 	int err;
 
-	/* Check SEP not used by a different session */
-	if (lsep->stream && chan->session &&
-	    !avdtp_has_stream(chan->session, lsep->stream))
-		return -EBUSY;
+	if (!chan->session)
+		return -ENOTCONN;
 
 	setup = a2dp_setup_get(chan->session);
 	if (!setup)
@@ -1888,7 +1986,9 @@ static int a2dp_reconfig(struct a2dp_channel *chan, const char *sender,
 		struct a2dp_sep *tmp = l->data;
 
 		/* Attempt to reconfigure if a stream already exists */
-		if (tmp->stream) {
+		stream = queue_find(tmp->streams, match_stream_session,
+							chan->session);
+		if (stream) {
 			/* Only allow switching sep from the same sender */
 			if (strcmp(sender, tmp->endpoint->get_name(tmp,
 							tmp->user_data))) {
@@ -1897,12 +1997,13 @@ static int a2dp_reconfig(struct a2dp_channel *chan, const char *sender,
 			}
 
 			/* Check if stream is for the channel */
-			if (!avdtp_has_stream(chan->session, tmp->stream))
+			if (!avdtp_has_stream(chan->session, stream->stream))
 				continue;
 
-			err = avdtp_close(chan->session, tmp->stream, FALSE);
+			err = avdtp_close(chan->session, stream->stream, FALSE);
 			if (err < 0) {
-				err = avdtp_abort(chan->session, tmp->stream);
+				err = avdtp_abort(chan->session,
+							stream->stream);
 				if (err < 0) {
 					error("avdtp_abort: %s",
 							strerror(-err));
@@ -2752,6 +2853,13 @@ add:
 	return sep;
 }
 
+static bool match_locked(const void *data, const void *user_data)
+{
+	const struct a2dp_stream *stream = data;
+
+	return stream->locked;
+}
+
 void a2dp_remove_sep(struct a2dp_sep *sep)
 {
 	struct a2dp_server *server = sep->server;
@@ -2776,7 +2884,7 @@ void a2dp_remove_sep(struct a2dp_sep *sep)
 		}
 	}
 
-	if (sep->locked)
+	if (queue_find(sep->streams, match_locked, NULL))
 		return;
 
 	a2dp_unregister_sep(sep);
@@ -3001,7 +3109,7 @@ unsigned int a2dp_config(struct avdtp *session, struct a2dp_sep *sep,
 	GSList *l;
 	struct a2dp_server *server;
 	struct a2dp_setup *setup;
-	struct a2dp_sep *tmp;
+	struct a2dp_stream *stream;
 	struct avdtp_service_capability *cap;
 	struct avdtp_media_codec_capability *codec_cap = NULL;
 	int posix_err;
@@ -3036,8 +3144,10 @@ unsigned int a2dp_config(struct avdtp *session, struct a2dp_sep *sep,
 	cb_data->config_cb = cb;
 	cb_data->user_data = user_data;
 
+	stream = queue_find(sep->streams, match_stream_session, session);
+
 	setup->sep = sep;
-	setup->stream = sep->stream;
+	setup->stream = stream ? stream->stream : NULL;
 
 	/* Copy given caps if they are different than current caps */
 	if (setup->caps != caps) {
@@ -3045,7 +3155,7 @@ unsigned int a2dp_config(struct avdtp *session, struct a2dp_sep *sep,
 		setup->caps = g_slist_copy(caps);
 	}
 
-	switch (avdtp_stream_get_state(sep->stream)) {
+	switch (avdtp_stream_get_state(setup->stream)) {
 	case AVDTP_STATE_IDLE:
 		if (sep->type == AVDTP_SEP_TYPE_SOURCE)
 			l = server->sources;
@@ -3053,16 +3163,22 @@ unsigned int a2dp_config(struct avdtp *session, struct a2dp_sep *sep,
 			l = server->sinks;
 
 		for (; l != NULL; l = l->next) {
-			tmp = l->data;
-			if (avdtp_has_stream(session, tmp->stream))
+			struct a2dp_sep *tmp = l->data;
+
+			stream = queue_find(tmp->streams, match_stream_session,
+								session);
+			if (!stream)
+				continue;
+
+			if (avdtp_has_stream(session, stream->stream))
 				break;
 		}
 
 		if (l != NULL) {
-			if (tmp->locked)
+			if (stream->locked)
 				goto failed;
 			setup->reconfigure = TRUE;
-			if (avdtp_close(session, tmp->stream, FALSE) < 0) {
+			if (avdtp_close(session, stream->stream, FALSE) < 0) {
 				error("avdtp_close failed");
 				goto failed;
 			}
@@ -3092,7 +3208,7 @@ unsigned int a2dp_config(struct avdtp *session, struct a2dp_sep *sep,
 								setup);
 		} else if (!setup->reconfigure) {
 			setup->reconfigure = TRUE;
-			if (avdtp_close(session, sep->stream, FALSE) < 0) {
+			if (avdtp_close(session, setup->stream, FALSE) < 0) {
 				error("avdtp_close failed");
 				goto failed;
 			}
@@ -3118,6 +3234,7 @@ unsigned int a2dp_resume(struct avdtp *session, struct a2dp_sep *sep,
 {
 	struct a2dp_setup_cb *cb_data;
 	struct a2dp_setup *setup;
+	struct a2dp_stream *stream;
 
 	setup = a2dp_setup_get(session);
 	if (!setup)
@@ -3130,31 +3247,30 @@ unsigned int a2dp_resume(struct avdtp *session, struct a2dp_sep *sep,
 	if (setup->reconfigure)
 		goto failed;
 
-	setup->sep = sep;
-	setup->stream = sep->stream;
+	stream = queue_find(sep->streams, match_stream_session, session);
 
-	switch (avdtp_stream_get_state(sep->stream)) {
+	setup->sep = sep;
+	setup->stream = stream ? stream->stream : NULL;
+
+	switch (avdtp_stream_get_state(setup->stream)) {
 	case AVDTP_STATE_IDLE:
 		goto failed;
-		break;
 	case AVDTP_STATE_CONFIGURED:
 		setup->start = TRUE;
 		break;
 	case AVDTP_STATE_OPEN:
-		if (avdtp_start(session, sep->stream) < 0) {
+		if (avdtp_start(session, setup->stream) < 0) {
 			error("avdtp_start failed");
 			goto failed;
 		}
-		sep->starting = TRUE;
+		stream->starting = TRUE;
 		break;
 	case AVDTP_STATE_STREAMING:
-		if (!sep->suspending && sep->suspend_timer) {
-			timeout_remove(sep->suspend_timer);
-			sep->suspend_timer = 0;
-			avdtp_unref(sep->session);
-			sep->session = NULL;
+		if (!stream->suspending && stream->suspend_timer) {
+			timeout_remove(stream->suspend_timer);
+			stream->suspend_timer = 0;
 		}
-		if (sep->suspending)
+		if (stream->suspending)
 			setup->start = TRUE;
 		else
 			cb_data->source_id = g_idle_add(finalize_resume,
@@ -3179,6 +3295,7 @@ unsigned int a2dp_suspend(struct avdtp *session, struct a2dp_sep *sep,
 {
 	struct a2dp_setup_cb *cb_data;
 	struct a2dp_setup *setup;
+	struct a2dp_stream *stream;
 
 	setup = a2dp_setup_get(session);
 	if (!setup)
@@ -3191,10 +3308,12 @@ unsigned int a2dp_suspend(struct avdtp *session, struct a2dp_sep *sep,
 	if (setup->reconfigure)
 		goto failed;
 
-	setup->sep = sep;
-	setup->stream = sep->stream;
+	stream = queue_find(sep->streams, match_stream_session, session);
 
-	switch (avdtp_stream_get_state(sep->stream)) {
+	setup->sep = sep;
+	setup->stream = stream ? stream->stream : NULL;
+
+	switch (avdtp_stream_get_state(setup->stream)) {
 	case AVDTP_STATE_IDLE:
 		error("a2dp_suspend: no stream to suspend");
 		goto failed;
@@ -3203,11 +3322,11 @@ unsigned int a2dp_suspend(struct avdtp *session, struct a2dp_sep *sep,
 		cb_data->source_id = g_idle_add(finalize_suspend, setup);
 		break;
 	case AVDTP_STATE_STREAMING:
-		if (avdtp_suspend(session, sep->stream) < 0) {
+		if (avdtp_suspend(session, setup->stream) < 0) {
 			error("avdtp_suspend failed");
 			goto failed;
 		}
-		sep->suspending = TRUE;
+		stream->suspending = TRUE;
 		break;
 	case AVDTP_STATE_CONFIGURED:
 	case AVDTP_STATE_CLOSING:
@@ -3256,11 +3375,14 @@ gboolean a2dp_cancel(unsigned int id)
 
 gboolean a2dp_sep_lock(struct a2dp_sep *sep, struct avdtp *session)
 {
-	if (sep->locked)
+	struct a2dp_stream *stream;
+
+	stream = queue_find(sep->streams, match_stream_session, session);
+	if (!stream || stream->locked)
 		return FALSE;
 
-	DBG("SEP %p locked", sep->lsep);
-	sep->locked = TRUE;
+	DBG("stream %p locked", sep->lsep);
+	stream->locked = TRUE;
 
 	return TRUE;
 }
@@ -3268,14 +3390,19 @@ gboolean a2dp_sep_lock(struct a2dp_sep *sep, struct avdtp *session)
 gboolean a2dp_sep_unlock(struct a2dp_sep *sep, struct avdtp *session)
 {
 	struct a2dp_server *server = sep->server;
+	struct a2dp_stream *stream;
 	avdtp_state_t state;
 	GSList *l;
 
-	state = avdtp_stream_get_state(sep->stream);
+	stream = queue_find(sep->streams, match_stream_session, session);
+	if (!stream)
+		return FALSE;
 
-	sep->locked = FALSE;
+	state = avdtp_stream_get_state(stream->stream);
 
-	DBG("SEP %p unlocked", sep->lsep);
+	stream->locked = FALSE;
+
+	DBG("stream %p unlocked", stream);
 
 	if (sep->type == AVDTP_SEP_TYPE_SOURCE)
 		l = server->sources;
@@ -3288,7 +3415,7 @@ gboolean a2dp_sep_unlock(struct a2dp_sep *sep, struct avdtp *session)
 		return TRUE;
 	}
 
-	if (!sep->stream || state == AVDTP_STATE_IDLE)
+	if (!stream->stream || state == AVDTP_STATE_IDLE)
 		return TRUE;
 
 	switch (state) {
@@ -3296,8 +3423,8 @@ gboolean a2dp_sep_unlock(struct a2dp_sep *sep, struct avdtp *session)
 		/* Set timer here */
 		break;
 	case AVDTP_STATE_STREAMING:
-		if (avdtp_suspend(session, sep->stream) == 0)
-			sep->suspending = TRUE;
+		if (avdtp_suspend(session, stream->stream) == 0)
+			stream->suspending = TRUE;
 		break;
 	case AVDTP_STATE_IDLE:
 	case AVDTP_STATE_CONFIGURED:
@@ -3310,9 +3437,16 @@ gboolean a2dp_sep_unlock(struct a2dp_sep *sep, struct avdtp *session)
 	return TRUE;
 }
 
-struct avdtp_stream *a2dp_sep_get_stream(struct a2dp_sep *sep)
+struct avdtp_stream *a2dp_sep_get_stream(struct a2dp_sep *sep,
+						struct avdtp *session)
 {
-	return sep->stream;
+	struct a2dp_stream *stream;
+
+	stream = queue_find(sep->streams, match_stream_session, session);
+	if (stream)
+		return stream->stream;
+
+	return NULL;
 }
 
 struct btd_device *a2dp_setup_get_device(struct a2dp_setup *setup)
diff --git a/profiles/audio/a2dp.h b/profiles/audio/a2dp.h
index 615b641c9a0b..c698bc983749 100644
--- a/profiles/audio/a2dp.h
+++ b/profiles/audio/a2dp.h
@@ -35,7 +35,9 @@ struct a2dp_endpoint {
 						struct a2dp_setup *setup,
 						a2dp_endpoint_config_t cb,
 						void *user_data);
-	void (*clear_configuration) (struct a2dp_sep *sep, void *user_data);
+	void (*clear_configuration) (struct a2dp_sep *sep,
+						struct btd_device *device,
+						void *user_data);
 	void (*set_delay) (struct a2dp_sep *sep, uint16_t delay,
 							void *user_data);
 };
@@ -76,7 +78,8 @@ gboolean a2dp_cancel(unsigned int id);
 
 gboolean a2dp_sep_lock(struct a2dp_sep *sep, struct avdtp *session);
 gboolean a2dp_sep_unlock(struct a2dp_sep *sep, struct avdtp *session);
-struct avdtp_stream *a2dp_sep_get_stream(struct a2dp_sep *sep);
+struct avdtp_stream *a2dp_sep_get_stream(struct a2dp_sep *sep,
+						struct avdtp *session);
 struct btd_device *a2dp_setup_get_device(struct a2dp_setup *setup);
 const char *a2dp_setup_remote_path(struct a2dp_setup *setup);
 struct avdtp *a2dp_avdtp_get(struct btd_device *device);
diff --git a/profiles/audio/avdtp.c b/profiles/audio/avdtp.c
index 704e0fdf9153..17671a1bafb1 100644
--- a/profiles/audio/avdtp.c
+++ b/profiles/audio/avdtp.c
@@ -743,6 +743,7 @@ static void stream_free(void *data)
 	g_slist_free_full(stream->callbacks, g_free);
 	g_slist_free_full(stream->caps, g_free);
 
+	queue_remove(streams, stream);
 	g_free(stream);
 }
 
diff --git a/profiles/audio/media.c b/profiles/audio/media.c
index a18ddc9fee40..8e62dca17070 100644
--- a/profiles/audio/media.c
+++ b/profiles/audio/media.c
@@ -692,11 +692,22 @@ static int set_config(struct a2dp_sep *sep, uint8_t *configuration,
 	return -ENOMEM;
 }
 
-static void clear_config(struct a2dp_sep *sep, void *user_data)
+static void clear_config(struct a2dp_sep *sep, struct btd_device *device,
+				void *user_data)
 {
 	struct media_endpoint *endpoint = user_data;
+	struct media_transport *transport;
 
-	clear_endpoint(endpoint);
+	if (!device) {
+		clear_endpoint(endpoint);
+		return;
+	}
+
+	transport = find_device_transport(endpoint, device);
+	if (!transport)
+		return;
+
+	clear_configuration(endpoint, transport);
 }
 
 static void set_delay(struct a2dp_sep *sep, uint16_t delay, void *user_data)
diff --git a/profiles/audio/transport.c b/profiles/audio/transport.c
index 153515191e40..a1fdf948bda8 100644
--- a/profiles/audio/transport.c
+++ b/profiles/audio/transport.c
@@ -398,12 +398,13 @@ static gboolean media_transport_set_fd(struct media_transport *transport,
 #ifdef HAVE_A2DP
 static void *transport_a2dp_get_stream(struct media_transport *transport)
 {
+	struct a2dp_transport *a2dp = transport->data;
 	struct a2dp_sep *sep = media_endpoint_get_sep(transport->endpoint);
 
 	if (!sep)
 		return NULL;
 
-	return a2dp_sep_get_stream(sep);
+	return a2dp_sep_get_stream(sep, a2dp->session);
 }
 
 static void a2dp_suspend_complete(struct avdtp *session, int err,
-- 
2.49.0


