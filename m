Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1E35CC62
	for <lists+linux-bluetooth@lfdr.de>; Tue,  2 Jul 2019 11:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbfGBJHk (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 2 Jul 2019 05:07:40 -0400
Received: from mail-lj1-f182.google.com ([209.85.208.182]:45937 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbfGBJHk (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 2 Jul 2019 05:07:40 -0400
Received: by mail-lj1-f182.google.com with SMTP id m23so16056581lje.12
        for <linux-bluetooth@vger.kernel.org>; Tue, 02 Jul 2019 02:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=silvair-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FGv0+l9EN9XHcTZlrDiOAypQLNcTB9TX2ylvy7LwU/E=;
        b=C4rTUtoTK9mEMd6OoO58SQniZIebN9p8v8b0Yo9vFKrEgrhLgZOsgMS86lthQeS4J3
         ak1S0iLZNjSFsSxAEXm4SJEmYfIKVDCf1/ZnAeGA/VXRzmRTLgQ+foW0vu/c2WRVjbU9
         jDZsnaZOz210gPb9e/i0K+7pR+bVVFcUCrsUNZtAkSnmfiCsF3Wzl1ZZWBccjAbP4u0D
         EjpCH+tjeXL4yCG6UVxwQrFFwEdsdGA0nC2H8W7PzfavN6UCPG8maiC7A12GCsyOwf54
         Ud3+tihcoLHEtNEJvHgovm9LgPagqInoWhBPqnyXPuVaNoRfh15wzu9O0xKk8C1SAACg
         m8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FGv0+l9EN9XHcTZlrDiOAypQLNcTB9TX2ylvy7LwU/E=;
        b=QG3B087ULlCcjxqzf9Nu3skBJUaux8rHxFHAWLgjrR5kTTHGfP5c2IRZrhkA6TedQn
         E8QWjNfT7J9BIFIM+M48yKy2XszDmpTV7krfkXUZp9nwJmHbaAcFprVPhlN1o3j7cCW2
         ZM6k8KoTrhwa/2ORjMmgGMQxJCcCoQ18NPicWDSxiHAdaJ1AqZV80OvL3dYH4XKBnAmB
         cB+uaCLO/dmmU0KbJSTOQd9H/Jm/V7jkpLuVqEJQ7cuejQZBiPK5N1e7rR2WzGuhVOIp
         JQKUtcjHfvC121IjUVSOlPJIy1W9rYRk10ro4aE0rEiKToarhKUx3jnYnZVt58KaiJ7S
         xEYA==
X-Gm-Message-State: APjAAAX1B7rHosOWZbgSj3jXZSgKgJl+nBIi3WG+hgukJrggPSzjvcAn
        pMyki8hqaihM3kcludLbB3hsgH4Q934=
X-Google-Smtp-Source: APXvYqzYxVakQrz44J6qJtXkkov2KPZuZocnG9qFc0bB/s6k08R4uICUTqE1aDYh3feqd1Ay7jIjlw==
X-Received: by 2002:a2e:96d0:: with SMTP id d16mr16859546ljj.14.1562058457409;
        Tue, 02 Jul 2019 02:07:37 -0700 (PDT)
Received: from mlowasrzechonek2133.silvair.lan ([217.153.94.18])
        by smtp.gmail.com with ESMTPSA id 2sm3684904lji.94.2019.07.02.02.07.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 02 Jul 2019 02:07:36 -0700 (PDT)
From:   =?UTF-8?q?Micha=C5=82=20Lowas-Rzechonek?= 
        <michal.lowas-rzechonek@silvair.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Inga Stotland <inga.stotland@intel.com>,
        Brian Gix <brian.gix@intel.com>
Subject: [PATCH BlueZ v2 1/3] mesh: Split APP_IDX_DEV into APP_IDX_DEV_LOCAL and APP_IDX_DEV_REMOTE
Date:   Tue,  2 Jul 2019 11:07:29 +0200
Message-Id: <20190702090731.30852-2-michal.lowas-rzechonek@silvair.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190702090731.30852-1-michal.lowas-rzechonek@silvair.com>
References: <20190702090731.30852-1-michal.lowas-rzechonek@silvair.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This is needed to distinguish incoming messages encrypted using a device
key: if the key is local, the message can be forwarded to internal
models. If the key is a known remote one, it will be forwarded to the
application via DevKeyMessageReceived() API.
---
 mesh/cfgmod-server.c | 15 ++++++++-------
 mesh/model.c         | 20 +++++++++++---------
 mesh/net.h           | 10 ++++++----
 3 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/mesh/cfgmod-server.c b/mesh/cfgmod-server.c
index 634ac006b..a849b5e99 100644
--- a/mesh/cfgmod-server.c
+++ b/mesh/cfgmod-server.c
@@ -69,7 +69,8 @@ static void send_pub_status(struct mesh_node *node, uint16_t src, uint16_t dst,
 		n += 2;
 	}
 
-	mesh_model_send(node, dst, src, APP_IDX_DEV, DEFAULT_TTL, msg, n);
+	mesh_model_send(node, dst, src, APP_IDX_DEV_LOCAL, DEFAULT_TTL,
+								msg, n);
 }
 
 static bool config_pub_get(struct mesh_node *node, uint16_t src, uint16_t dst,
@@ -254,7 +255,7 @@ static void send_sub_status(struct mesh_node *node, uint16_t src, uint16_t dst,
 		n += 2;
 	}
 
-	mesh_model_send(node, dst, src, APP_IDX_DEV, DEFAULT_TTL, msg, n);
+	mesh_model_send(node, dst, src, APP_IDX_DEV_LOCAL, DEFAULT_TTL, msg, n);
 }
 
 static bool config_sub_get(struct mesh_node *node, uint16_t src, uint16_t dst,
@@ -312,7 +313,7 @@ static bool config_sub_get(struct mesh_node *node, uint16_t src, uint16_t dst,
 
 	*msg_status = (uint8_t) status;
 
-	mesh_model_send(node, dst, src, APP_IDX_DEV, DEFAULT_TTL, msg, n);
+	mesh_model_send(node, dst, src, APP_IDX_DEV_LOCAL, DEFAULT_TTL, msg, n);
 	return true;
 }
 
@@ -487,7 +488,7 @@ static void send_model_app_status(struct mesh_node *node, uint16_t src,
 	l_put_le16(id, msg + n);
 	n += 2;
 
-	mesh_model_send(node, dst, src, APP_IDX_DEV, DEFAULT_TTL, msg, n);
+	mesh_model_send(node, dst, src, APP_IDX_DEV_LOCAL, DEFAULT_TTL, msg, n);
 }
 
 static void model_app_list(struct mesh_node *node, uint16_t src, uint16_t dst,
@@ -540,7 +541,7 @@ static void model_app_list(struct mesh_node *node, uint16_t src, uint16_t dst,
 
 	if (result >= 0) {
 		*status = result;
-		mesh_model_send(node, dst, src, APP_IDX_DEV, DEFAULT_TTL,
+		mesh_model_send(node, dst, src, APP_IDX_DEV_LOCAL, DEFAULT_TTL,
 								msg, n);
 	}
 
@@ -758,7 +759,7 @@ static bool cfg_srv_pkt(uint16_t src, uint32_t dst,
 	uint16_t interval;
 	uint16_t n;
 
-	if (idx != APP_IDX_DEV)
+	if (idx != APP_IDX_DEV_LOCAL)
 		return false;
 
 	if (mesh_model_opcode_get(pkt, size, &opcode, &n)) {
@@ -1259,7 +1260,7 @@ static bool cfg_srv_pkt(uint16_t src, uint32_t dst,
 	if (n) {
 		/* print_packet("App Tx", long_msg ? long_msg : msg, n); */
 		mesh_model_send(node, unicast, src,
-				APP_IDX_DEV, DEFAULT_TTL,
+				APP_IDX_DEV_LOCAL, DEFAULT_TTL,
 				long_msg ? long_msg : msg, n);
 	}
 	l_free(long_msg);
diff --git a/mesh/model.c b/mesh/model.c
index 7401dcecb..e09dbd364 100644
--- a/mesh/model.c
+++ b/mesh/model.c
@@ -306,7 +306,8 @@ static void forward_model(void *a, void *b)
 	bool result;
 
 	l_debug("model %8.8x with idx %3.3x", mod->id, fwd->idx);
-	if (fwd->idx != APP_IDX_DEV && !has_binding(mod->bindings, fwd->idx))
+
+	if (fwd->idx != APP_IDX_DEV_LOCAL && !has_binding(mod->bindings, fwd->idx))
 		return;
 
 	dst = fwd->dst;
@@ -356,15 +357,16 @@ static int dev_packet_decrypt(struct mesh_node *node, const uint8_t *data,
 				uint16_t dst, uint8_t key_id, uint32_t seq,
 				uint32_t iv_idx, uint8_t *out)
 {
-	const uint8_t *dev_key;
+	uint8_t dev_key[16];
+	const uint8_t *key;
 
-	dev_key = node_get_device_key(node);
-	if (!dev_key)
+	key = node_get_device_key(node);
+	if (!key)
 		return false;
 
 	if (mesh_crypto_payload_decrypt(NULL, 0, data, size, szmict, src,
-					dst, key_id, seq, iv_idx, out, dev_key))
-		return APP_IDX_DEV;
+					dst, key_id, seq, iv_idx, out, key))
+		return APP_IDX_DEV_LOCAL;
 
 	return -1;
 }
@@ -952,7 +954,7 @@ bool mesh_model_send(struct mesh_node *node, uint16_t src, uint16_t target,
 	if (IS_UNASSIGNED(target))
 		return false;
 
-	if (app_idx == APP_IDX_DEV) {
+	if (app_idx == APP_IDX_DEV_LOCAL) {
 		key = node_get_device_key(node);
 		if (!key)
 			return false;
@@ -1381,12 +1383,12 @@ struct mesh_model *mesh_model_setup(struct mesh_node *node, uint8_t ele_idx,
 		if (ele_idx != PRIMARY_ELE_IDX)
 			return NULL;
 
-		l_queue_push_head(mod->bindings, L_UINT_TO_PTR(APP_IDX_DEV));
+		l_queue_push_head(mod->bindings, L_UINT_TO_PTR(APP_IDX_DEV_LOCAL));
 		return mod;
 	}
 
 	if (db_mod->id == CONFIG_CLI_MODEL) {
-		l_queue_push_head(mod->bindings, L_UINT_TO_PTR(APP_IDX_DEV));
+		l_queue_push_head(mod->bindings, L_UINT_TO_PTR(APP_IDX_DEV_LOCAL));
 		return mod;
 	}
 
diff --git a/mesh/net.h b/mesh/net.h
index f19024766..834712d8d 100644
--- a/mesh/net.h
+++ b/mesh/net.h
@@ -37,10 +37,12 @@ struct mesh_node;
 #define SEQ_MASK	0xffffff
 
 #define CREDFLAG_MASK	0x1000
-#define APP_IDX_MASK	0x0fff
-#define APP_IDX_DEV	0x7fff
-#define APP_IDX_ANY	0x8000
-#define APP_IDX_NET	0xffff
+
+#define APP_IDX_MASK		0x0fff
+#define APP_IDX_DEV_REMOTE	0x6fff
+#define APP_IDX_DEV_LOCAL	0x7fff
+#define APP_IDX_ANY		0x8000
+#define APP_IDX_NET		0xffff
 
 #define NET_IDX_INVALID	0xffff
 #define NET_NID_INVALID	0xff
-- 
2.19.1

