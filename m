Return-Path: <linux-bluetooth+bounces-543-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DD180DCEC
	for <lists+linux-bluetooth@lfdr.de>; Mon, 11 Dec 2023 22:25:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C8F11F21934
	for <lists+linux-bluetooth@lfdr.de>; Mon, 11 Dec 2023 21:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E6954F80;
	Mon, 11 Dec 2023 21:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTkIDe5B"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D32BCE
	for <linux-bluetooth@vger.kernel.org>; Mon, 11 Dec 2023 13:25:24 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6da1b71a085so621708a34.2
        for <linux-bluetooth@vger.kernel.org>; Mon, 11 Dec 2023 13:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702329922; x=1702934722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MU9Bl/ROmFqzncJfrTjS7LjxsoZjf0OcynIXY+eLH3s=;
        b=PTkIDe5BuzIwOH8uEF6F+4SdtnI7vE60tKVZ3mbIhxUeuU/CAnDdf7+iiUUcjr+XoN
         Z5bf3DVRqdFxKXZ4Se6sAl7ZOKS/ZUMOnCMSDz/tHVY77IccLVLhgy1pcGdC8DQ6Ll7b
         EyOwO2kNaF5Y2JTKm/FNNMiJA1zEuDL3znB9u0YFcM4aSQk6e64sXYk5T88zKtU53XtR
         8IrfJoTPrrhf6k9VhYVK/yYpZiUc2yIQ1zQZHnSLmD/wflXqEHqnbzN+EbRYUoenmyYd
         nZBL6kua/BeZfBzAAh2SG/j92gpXXilERXAfO/CaJuzhljj8HY7zFEfS3fO9r8VHA+vw
         pKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702329922; x=1702934722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MU9Bl/ROmFqzncJfrTjS7LjxsoZjf0OcynIXY+eLH3s=;
        b=P0NLCFRPv3busU+JYZhHcaJqfv5/vUa10yJ0uOujGtCdYXoLxxgJlH4ULeDNd76sjo
         FjfaY2qVoAP1oAkFC7FhL4SgQ3qaohs5ZbP11vy8gdq4pHf9LgCd/WmHK9tLwwf5DXzD
         QNn/h7N3+MweFagjBh1kTS3Qd5sUh/g4jL/z4vSBMRDI33hMYBPbXGyov2uwhEdlSL5V
         2nCbb40i+hGwuadgIiKjef2bhOkLUYtTCMzBv2PNFlWm/d4ZGtLPYynGJZPrXd7HZOSN
         ptZ8EZzKShR1Qzbpo+WfTY8ci0/WMzurQDEB2lLgpztFyIynNkDPLLirZ9FMcPZyRFgW
         pcZA==
X-Gm-Message-State: AOJu0YxAv0ucOCCtsX4SUH41eH94lIfRtZ7obppRH8XaPmmTVhfrmtJL
	OMDwy8bq5s6NjjnQA2mfFcGLoZ8XoI0=
X-Google-Smtp-Source: AGHT+IHmMfPwqdveqA02vZO+MiksZtI6PYbx4cLNGlH9TRazsGhteYU+e8FVT7tUV5wUu9GlpNs+BQ==
X-Received: by 2002:a9d:67c6:0:b0:6d9:efff:529d with SMTP id c6-20020a9d67c6000000b006d9efff529dmr2918484otn.28.1702329922056;
        Mon, 11 Dec 2023 13:25:22 -0800 (PST)
Received: from lvondent-mobl4.. (071-047-239-151.res.spectrum.com. [71.47.239.151])
        by smtp.gmail.com with ESMTPSA id s38-20020a0568302aa600b006da11489f70sm873757otu.44.2023.12.11.13.25.19
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 13:25:20 -0800 (PST)
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v4 2/6] shared/bap: Make bt_bap_select match the channel map
Date: Mon, 11 Dec 2023 16:25:12 -0500
Message-ID: <20231211212516.577426-2-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231211212516.577426-1-luiz.dentz@gmail.com>
References: <20231211212516.577426-1-luiz.dentz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

bt_bap_pac may actually map to multiple PAC records and each may have a
different channel count that needs to be matched separately, for
instance when trying with EarFun Air Pro:

< ACL Data TX: Handle 2048 flags 0x00 dlen 85
      ATT: Write Command (0x52) len 80
        Handle: 0x0098 Type: ASE Control Point (0x2bc6)
          Data: 010405020206000000000a020103020201030428000602020600000
	  0000a0201030202010304280001020206000000000a020103020201030428
	  0002020206000000000a02010302020103042800
            Opcode: Codec Configuration (0x01)
            Number of ASE(s): 4
            ASE: #0
            ASE ID: 0x05
            Target Latency: Balance Latency/Reliability (0x02)
            PHY: 0x02
            LE 2M PHY (0x02)
            Codec: LC3 (0x06)
            Codec Specific Configuration: #0: len 0x02 type 0x01
              Sampling Frequency: 16 Khz (0x03)
            Codec Specific Configuration: #1: len 0x02 type 0x02
              Frame Duration: 10 ms (0x01)
            Codec Specific Configuration: #2: len 0x03 type 0x04
              Frame Length: 40 (0x0028)
            ASE: #1
            ASE ID: 0x06
            Target Latency: Balance Latency/Reliability (0x02)
            PHY: 0x02
            LE 2M PHY (0x02)
            Codec: LC3 (0x06)
            Codec Specific Configuration: #0: len 0x02 type 0x01
              Sampling Frequency: 16 Khz (0x03)
            Codec Specific Configuration: #1: len 0x02 type 0x02
              Frame Duration: 10 ms (0x01)
            Codec Specific Configuration: #2: len 0x03 type 0x04
              Frame Length: 40 (0x0028)
            ASE: #2
            ASE ID: 0x01
            Target Latency: Balance Latency/Reliability (0x02)
            PHY: 0x02
            LE 2M PHY (0x02)
            Codec: LC3 (0x06)
            Codec Specific Configuration: #0: len 0x02 type 0x01
              Sampling Frequency: 16 Khz (0x03)
            Codec Specific Configuration: #1: len 0x02 type 0x02
              Frame Duration: 10 ms (0x01)
            Codec Specific Configuration: #2: len 0x03 type 0x04
              Frame Length: 40 (0x0028)
            ASE: #3
            ASE ID: 0x02
            Target Latency: Balance Latency/Reliability (0x02)
            PHY: 0x02
            LE 2M PHY (0x02)
            Codec: LC3 (0x06)
            Codec Specific Configuration: #0: len 0x02 type 0x01
              Sampling Frequency: 16 Khz (0x03)
            Codec Specific Configuration: #1: len 0x02 type 0x02
              Frame Duration: 10 ms (0x01)
            Codec Specific Configuration: #2: len 0x03 type 0x04
              Frame Length: 40 (0x0028)

Fixes: https://github.com/bluez/bluez/issues/612
---
 profiles/audio/bap.c |  6 +--
 src/shared/bap.c     | 87 ++++++++++++++++++++++++++++++++++++++++----
 src/shared/bap.h     |  3 +-
 src/shared/util.c    | 43 ++++++++++++++++++++++
 src/shared/util.h    |  6 +++
 5 files changed, 132 insertions(+), 13 deletions(-)

diff --git a/profiles/audio/bap.c b/profiles/audio/bap.c
index 38eaea055ed2..6fe45281150f 100644
--- a/profiles/audio/bap.c
+++ b/profiles/audio/bap.c
@@ -1290,10 +1290,8 @@ static bool pac_found(struct bt_bap_pac *lpac, struct bt_bap_pac *rpac,
 	}
 
 	/* TODO: Cache LRU? */
-	if (btd_service_is_initiator(service)) {
-		if (!bt_bap_select(lpac, rpac, select_cb, ep))
-			ep->data->selecting++;
-	}
+	if (btd_service_is_initiator(service))
+		bt_bap_select(lpac, rpac, &ep->data->selecting, select_cb, ep);
 
 	return true;
 }
diff --git a/src/shared/bap.c b/src/shared/bap.c
index e9d7072ef3be..cb505d1564d6 100644
--- a/src/shared/bap.c
+++ b/src/shared/bap.c
@@ -185,6 +185,7 @@ struct bt_bap_pac {
 	struct bt_bap_pac_qos qos;
 	struct iovec *data;
 	struct iovec *metadata;
+	struct queue *chan_map;
 	struct bt_bap_pac_ops *ops;
 	void *user_data;
 };
@@ -2417,6 +2418,33 @@ static void *ltv_merge(struct iovec *data, struct iovec *cont)
 	return iov_append(data, cont->iov_len, cont->iov_base);
 }
 
+static void bap_pac_foreach_channel(size_t i, uint8_t l, uint8_t t, uint8_t *v,
+					void *user_data)
+{
+	struct bt_bap_pac *pac = user_data;
+
+	if (!v)
+		return;
+
+	if (!pac->chan_map)
+		pac->chan_map = queue_new();
+
+	printf("PAC %p chan_map 0x%02x\n", pac, *v);
+
+	queue_push_tail(pac->chan_map, UINT_TO_PTR(*v));
+}
+
+static void bap_pac_update_chan_map(struct bt_bap_pac *pac, struct iovec *data)
+{
+	uint8_t type = 0x03;
+
+	if (!data)
+		return;
+
+	util_ltv_foreach(data->iov_base, data->iov_len, &type,
+				bap_pac_foreach_channel, pac);
+}
+
 static void bap_pac_merge(struct bt_bap_pac *pac, struct iovec *data,
 					struct iovec *metadata)
 {
@@ -2426,6 +2454,9 @@ static void bap_pac_merge(struct bt_bap_pac *pac, struct iovec *data,
 	else
 		pac->data = util_iov_dup(data, 1);
 
+	/* Update channel map */
+	bap_pac_update_chan_map(pac, data);
+
 	/* Merge metadata into existing record */
 	if (pac->metadata)
 		ltv_merge(pac->metadata, metadata);
@@ -2448,10 +2479,9 @@ static struct bt_bap_pac *bap_pac_new(struct bt_bap_db *bdb, const char *name,
 	pac->type = type;
 	if (codec)
 		pac->codec = *codec;
-	if (data)
-		pac->data = util_iov_dup(data, 1);
-	if (metadata)
-		pac->metadata = util_iov_dup(metadata, 1);
+
+	bap_pac_merge(pac, data, metadata);
+
 	if (qos)
 		pac->qos = *qos;
 
@@ -2465,6 +2495,7 @@ static void bap_pac_free(void *data)
 	free(pac->name);
 	util_iov_free(pac->metadata, 1);
 	util_iov_free(pac->data, 1);
+	queue_destroy(pac->chan_map, NULL);
 	free(pac);
 }
 
@@ -4505,7 +4536,16 @@ static bool find_ep_pacs(const void *data, const void *user_data)
 	if (ep->stream->lpac != match->lpac)
 		return false;
 
-	return ep->stream->rpac == match->rpac;
+	if (ep->stream->rpac != match->rpac)
+		return false;
+
+	switch (ep->state) {
+	case BT_BAP_STREAM_STATE_CONFIG:
+	case BT_BAP_STREAM_STATE_QOS:
+		return true;
+	}
+
+	return false;
 }
 
 static struct bt_bap_req *bap_req_new(struct bt_bap_stream *stream,
@@ -4626,16 +4666,47 @@ static bool match_pac(struct bt_bap_pac *lpac, struct bt_bap_pac *rpac,
 }
 
 int bt_bap_select(struct bt_bap_pac *lpac, struct bt_bap_pac *rpac,
-			bt_bap_pac_select_t func, void *user_data)
+			int *count, bt_bap_pac_select_t func,
+			void *user_data)
 {
+	const struct queue_entry *lchan, *rchan;
+
 	if (!lpac || !rpac || !func)
 		return -EINVAL;
 
 	if (!lpac->ops || !lpac->ops->select)
 		return -EOPNOTSUPP;
 
-	lpac->ops->select(lpac, rpac, &rpac->qos,
-					func, user_data, lpac->user_data);
+	for (lchan = queue_get_entries(lpac->chan_map); lchan;
+					lchan = lchan->next) {
+		uint8_t lmap = PTR_TO_UINT(lchan->data);
+
+		for (rchan = queue_get_entries(rpac->chan_map); rchan;
+					rchan = rchan->next) {
+			uint8_t rmap = PTR_TO_UINT(rchan->data);
+
+			printf("lmap 0x%02x rmap 0x%02x\n", lmap, rmap);
+
+			/* Try matching the channel mapping */
+			if (lmap & rmap) {
+				lpac->ops->select(lpac, rpac, &rpac->qos,
+							func, user_data,
+							lpac->user_data);
+				if (count)
+					(*count)++;
+
+				/* Check if there are any channels left */
+				lmap &= ~(lmap & rmap);
+				if (!lmap)
+					break;
+
+				/* Check if device require AC*(i) settings */
+				if (rmap == 0x01)
+					lmap = lmap >> 1;
+			} else
+				break;
+		}
+	}
 
 	return 0;
 }
diff --git a/src/shared/bap.h b/src/shared/bap.h
index 2c8f9208e6ba..470313e66fc0 100644
--- a/src/shared/bap.h
+++ b/src/shared/bap.h
@@ -234,7 +234,8 @@ void *bt_bap_pac_get_user_data(struct bt_bap_pac *pac);
 
 /* Stream related functions */
 int bt_bap_select(struct bt_bap_pac *lpac, struct bt_bap_pac *rpac,
-			bt_bap_pac_select_t func, void *user_data);
+			int *count, bt_bap_pac_select_t func,
+			void *user_data);
 
 struct bt_bap_stream *bt_bap_stream_new(struct bt_bap *bap,
 					struct bt_bap_pac *lpac,
diff --git a/src/shared/util.c b/src/shared/util.c
index 34491f4e5a56..c0c2c4a17f12 100644
--- a/src/shared/util.c
+++ b/src/shared/util.c
@@ -175,6 +175,49 @@ ltv_debugger(const struct util_ltv_debugger *debugger, size_t num, uint8_t type)
 	return NULL;
 }
 
+/* Helper to itertate over LTV entries */
+bool util_ltv_foreach(const uint8_t *data, uint8_t len, uint8_t *type,
+			util_ltv_func_t func, void *user_data)
+{
+	struct iovec iov;
+	int i;
+
+	if (!func)
+		return false;
+
+	iov.iov_base = (void *) data;
+	iov.iov_len = len;
+
+	for (i = 0; iov.iov_len; i++) {
+		uint8_t l, t, *v;
+
+		if (!util_iov_pull_u8(&iov, &l))
+			return false;
+
+		if (!l) {
+			func(i, l, 0, NULL, user_data);
+			continue;
+		}
+
+		if (!util_iov_pull_u8(&iov, &t))
+			return false;
+
+		l--;
+
+		if (l) {
+			v = util_iov_pull_mem(&iov, l);
+			if (!v)
+				return false;
+		} else
+			v = NULL;
+
+		if (!type || *type == t)
+			func(i, l, t, v, user_data);
+	}
+
+	return true;
+}
+
 /* Helper to print debug information of LTV entries */
 bool util_debug_ltv(const uint8_t *data, uint8_t len,
 			const struct util_ltv_debugger *debugger, size_t num,
diff --git a/src/shared/util.h b/src/shared/util.h
index 6698d00415de..596663b8519c 100644
--- a/src/shared/util.h
+++ b/src/shared/util.h
@@ -138,6 +138,12 @@ bool util_debug_ltv(const uint8_t *data, uint8_t len,
 			const struct util_ltv_debugger *debugger, size_t num,
 			util_debug_func_t function, void *user_data);
 
+typedef void (*util_ltv_func_t)(size_t i, uint8_t l, uint8_t t, uint8_t *v,
+					void *user_data);
+
+bool util_ltv_foreach(const uint8_t *data, uint8_t len, uint8_t *type,
+			util_ltv_func_t func, void *user_data);
+
 unsigned char util_get_dt(const char *parent, const char *name);
 
 ssize_t util_getrandom(void *buf, size_t buflen, unsigned int flags);
-- 
2.43.0


