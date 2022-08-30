Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 610DB5A6EB7
	for <lists+linux-bluetooth@lfdr.de>; Tue, 30 Aug 2022 22:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230438AbiH3Uy0 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 30 Aug 2022 16:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231277AbiH3UyX (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 30 Aug 2022 16:54:23 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CFC3861E6
        for <linux-bluetooth@vger.kernel.org>; Tue, 30 Aug 2022 13:54:22 -0700 (PDT)
Received: from localhost.localdomain (67.227.121.78.rev.sfr.net [78.121.227.67])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: fdanis)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 8DFD86601DC3
        for <linux-bluetooth@vger.kernel.org>; Tue, 30 Aug 2022 21:54:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1661892860;
        bh=eMxynpX8LsZUg6Hmd83LRbSqFYSJQhe3zoDjJp+qTu4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Vg5OfENEjDa8M/F2Vosu7Q+IxIctmL4S3HiNSFY2+1caZS/qAiGDdNPNdnhHfuNm6
         uTxToWPWbL9Gkoro3Q41tNkwpdWAxdxMtsz6Ie5LdIn0D4q80dnnWQPNgGezSYVFvX
         J3xeaAN263T9cdsPC0CUIS8X8dHqpuGAlB7KpzC7aPlWu5dw4reLCyNPt0DR5G4Vd+
         kqEl5PoF/ivCxfpKF+j4VWPvO3Pb9c/k1G7Wy4JGKp3NvrVm7jrIT9Ulh38ekDACjA
         51qgVLrOJQj4vp/HhQW/TtV+1sB/PynNtKvSOutbi8LjlF9gXJIHQn8f9QSLopXSR1
         vFi0QoaSXn06A==
From:   =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Danis?= 
        <frederic.danis@collabora.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v3 1/3] profiles: Add remote endpoint path to SelectProperties
Date:   Tue, 30 Aug 2022 22:54:09 +0200
Message-Id: <20220830205411.68299-2-frederic.danis@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220830205411.68299-1-frederic.danis@collabora.com>
References: <20220830205411.68299-1-frederic.danis@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This adds the remote endpoint path to the dictionary sent in
SelectProperties.
It allows audio application to know for which remote endpoint the call is
done and so for which it should act as an initiator.
---
 profiles/audio/bap.c   |  2 ++
 profiles/audio/media.c | 15 ++++++++++++---
 src/shared/bap.c       | 12 +++++++++++-
 src/shared/bap.h       |  7 +++++--
 4 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/profiles/audio/bap.c b/profiles/audio/bap.c
index d388afe56..67aba3bd7 100644
--- a/profiles/audio/bap.c
+++ b/profiles/audio/bap.c
@@ -555,6 +555,8 @@ static struct bap_ep *ep_register(struct btd_service *service,
 		return NULL;
 	}
 
+	bt_bap_pac_set_user_data(rpac, ep->path);
+
 	DBG("ep %p lpac %p rpac %p path %s", ep, ep->lpac, ep->rpac, ep->path);
 
 	queue_push_tail(queue, ep);
diff --git a/profiles/audio/media.c b/profiles/audio/media.c
index ff3fa197b..85278a6d9 100644
--- a/profiles/audio/media.c
+++ b/profiles/audio/media.c
@@ -889,16 +889,20 @@ done:
 	data->cb(data->pac, err, caps, metadata, &qos, data->user_data);
 }
 
-static int pac_select(struct bt_bap_pac *pac, struct bt_bap_pac_qos *qos,
-			struct iovec *caps, struct iovec *metadata,
+static int pac_select(struct bt_bap_pac *lpac, struct bt_bap_pac *rpac,
+			struct bt_bap_pac_qos *qos,
 			bt_bap_pac_select_t cb, void *cb_data, void *user_data)
 {
 	struct media_endpoint *endpoint = user_data;
+	struct iovec *caps;
+	struct iovec *metadata;
+	const char *endpoint_path;
 	struct pac_select_data *data;
 	DBusMessage *msg;
 	DBusMessageIter iter, dict;
 	const char *key = "Capabilities";
 
+	bt_bap_pac_get_codec(rpac, NULL, &caps, &metadata);
 	if (!caps)
 		return -EINVAL;
 
@@ -911,7 +915,7 @@ static int pac_select(struct bt_bap_pac *pac, struct bt_bap_pac_qos *qos,
 	}
 
 	data = new0(struct pac_select_data, 1);
-	data->pac = pac;
+	data->pac = lpac;
 	data->cb = cb;
 	data->user_data = cb_data;
 
@@ -919,6 +923,11 @@ static int pac_select(struct bt_bap_pac *pac, struct bt_bap_pac_qos *qos,
 
 	dbus_message_iter_open_container(&iter, DBUS_TYPE_ARRAY, "{sv}", &dict);
 
+	endpoint_path = bt_bap_pac_get_user_data(rpac);
+	if (endpoint_path)
+		g_dbus_dict_append_entry(&dict, "Endpoint",
+					DBUS_TYPE_OBJECT_PATH, &endpoint_path);
+
 	g_dbus_dict_append_basic_array(&dict, DBUS_TYPE_STRING, &key,
 					DBUS_TYPE_BYTE, &caps->iov_base,
 					caps->iov_len);
diff --git a/src/shared/bap.c b/src/shared/bap.c
index 8edc7b72e..150b2116e 100644
--- a/src/shared/bap.c
+++ b/src/shared/bap.c
@@ -3934,6 +3934,16 @@ int bt_bap_pac_get_codec(struct bt_bap_pac *pac, uint8_t *id,
 	return bt_bap_pac_get_vendor_codec(pac, id, NULL, NULL, data, metadata);
 }
 
+void bt_bap_pac_set_user_data(struct bt_bap_pac *pac, void *user_data)
+{
+	pac->user_data = user_data;
+}
+
+void *bt_bap_pac_get_user_data(struct bt_bap_pac *pac)
+{
+	return pac->user_data;
+}
+
 static bool find_ep_unused(const void *data, const void *user_data)
 {
 	const struct bt_bap_endpoint *ep = data;
@@ -4066,7 +4076,7 @@ int bt_bap_select(struct bt_bap_pac *lpac, struct bt_bap_pac *rpac,
 	if (!lpac->ops || !lpac->ops->select)
 		return -EOPNOTSUPP;
 
-	lpac->ops->select(lpac, &rpac->qos, rpac->data, rpac->metadata,
+	lpac->ops->select(lpac, rpac, &rpac->qos,
 					func, user_data, lpac->user_data);
 
 	return 0;
diff --git a/src/shared/bap.h b/src/shared/bap.h
index ff4bac330..93b00d771 100644
--- a/src/shared/bap.h
+++ b/src/shared/bap.h
@@ -120,8 +120,8 @@ struct bt_bap_pac *bt_bap_add_pac(struct gatt_db *db, const char *name,
 					struct iovec *metadata);
 
 struct bt_bap_pac_ops {
-	int (*select) (struct bt_bap_pac *pac, struct bt_bap_pac_qos *qos,
-			struct iovec *caps, struct iovec *metadata,
+	int (*select)(struct bt_bap_pac *lpac, struct bt_bap_pac *rpac,
+			struct bt_bap_pac_qos *qos,
 			bt_bap_pac_select_t cb, void *cb_data, void *user_data);
 	int (*config) (struct bt_bap_stream *stream, struct iovec *cfg,
 			struct bt_bap_qos *qos, bt_bap_pac_config_t cb,
@@ -186,6 +186,9 @@ int bt_bap_pac_get_vendor_codec(struct bt_bap_pac *pac, uint8_t *id,
 int bt_bap_pac_get_codec(struct bt_bap_pac *pac, uint8_t *id,
 				struct iovec **data, struct iovec **metadata);
 
+void bt_bap_pac_set_user_data(struct bt_bap_pac *pac, void *user_data);
+void *bt_bap_pac_get_user_data(struct bt_bap_pac *pac);
+
 /* Stream related functions */
 int bt_bap_select(struct bt_bap_pac *lpac, struct bt_bap_pac *rpac,
 			bt_bap_pac_select_t func, void *user_data);
-- 
2.25.1

