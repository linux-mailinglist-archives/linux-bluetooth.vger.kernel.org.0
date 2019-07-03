Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C06585E302
	for <lists+linux-bluetooth@lfdr.de>; Wed,  3 Jul 2019 13:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbfGCLm0 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 3 Jul 2019 07:42:26 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51668 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726628AbfGCLmZ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 3 Jul 2019 07:42:25 -0400
Received: by mail-wm1-f65.google.com with SMTP id 207so1877030wma.1
        for <linux-bluetooth@vger.kernel.org>; Wed, 03 Jul 2019 04:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=silvair-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xhESnKSExKhKw/fCbska+2T2xmvmk2WlAUqxOKty/zw=;
        b=F3mXuU2Da9sSXjf9woAmnenM5kUH8zkLjKI9QPWruXPKKw+gmnVUPB3tivXCGgc/vt
         R93zcX38SM5H0X8cMe9pHgRqggcoo+6LoNxm1vdqyFZHDVGj/RzZlyPkgSAIaFytlxu7
         Ysoo1jIa0DbAr4Z79CMpcz2LZA9xWLLRYbvsZAW5I3I5sW2UKdWXSdob5pAP2NyUJtEC
         QA/0l2TVK4vbedMx9unJBgtflcsdSX16IRyBXrzv9vaPVop0ugg1lL5ivllRMuuWRcaG
         vdql9GPaenaF5kFd4yXw2a8/fEafqWN4iXNKxoiv6b1bt0wwl+uX5eP1u5Eyi3r7bIKz
         YT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xhESnKSExKhKw/fCbska+2T2xmvmk2WlAUqxOKty/zw=;
        b=frIyrtbMhlfUB8D+kKd2gOjw3v+DenbIbDZr/1nmgIiIpmL0tJR/+/gNuxss6ZOyTw
         +kGKwjGOK90SkK6JC8KxMdXef5Z+Y50+e/QKFCCOeAGKnzkz5rzp3h+2kowmOnr7QodE
         0VFh6SUgoX8SGz14vA23wwrc64qkhyWaCHjNkhwdDkByyKgKoWuwJSt0uBaaqOG9ffXV
         uhFskawMyARX02VeFn6IRyv+EockrSwRymCgU1Wk+y+9pkNXcsTyFCyEtnKuN8BDy0Mp
         z0cM7aeg5HcIq/L1lU9n33QaoUi1RLD3rDBjIhMZ4vLfMsAAbtNHAXTAE17hx6nVbTtW
         F9ew==
X-Gm-Message-State: APjAAAXaLTQfJH6i6hMakb8CaI+TqEOw7qKQjqIgqkhHtwZ7SXzHKa+W
        qiSGPVnXiF+fVXjaXGAT5Lhow4KdzNg=
X-Google-Smtp-Source: APXvYqyud0BqIMuieBBH/AK6TQAZlHZpYgI1f4luFrlAD8zlmWwRbPub0lwkE2ZelbDf2ndwUyddPQ==
X-Received: by 2002:a1c:1bc1:: with SMTP id b184mr8359991wmb.42.1562154142665;
        Wed, 03 Jul 2019 04:42:22 -0700 (PDT)
Received: from mlowasrzechonek2133.silvair.lan ([217.153.94.18])
        by smtp.gmail.com with ESMTPSA id x6sm2556816wru.0.2019.07.03.04.42.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 03 Jul 2019 04:42:21 -0700 (PDT)
From:   =?UTF-8?q?Micha=C5=82=20Lowas-Rzechonek?= 
        <michal.lowas-rzechonek@silvair.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ v4 2/3] mesh: Implement DevKeySend() method on Node interface
Date:   Wed,  3 Jul 2019 13:42:13 +0200
Message-Id: <20190703114214.22320-3-michal.lowas-rzechonek@silvair.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190703114214.22320-1-michal.lowas-rzechonek@silvair.com>
References: <20190703114214.22320-1-michal.lowas-rzechonek@silvair.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch implements D-Bus DevKeySend() method of org.bluez.mesh.Node1
interface, allowing the application to send messages encrypted using
a known remote device key.

At the moment the call ignores net_index argument and sends messages
using the primary subnet.

Also, it's no longer possible to use 'magic' key_index value 0x7fff
(denoting local device key) when calling regular Send(). Applications
should use DevKeySend() instead.
---
 mesh/model.c |  9 +++++++-
 mesh/node.c  | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 65 insertions(+), 3 deletions(-)

diff --git a/mesh/model.c b/mesh/model.c
index 598615c5e..aae913d92 100644
--- a/mesh/model.c
+++ b/mesh/model.c
@@ -39,6 +39,7 @@
 #include "mesh/dbus.h"
 #include "mesh/util.h"
 #include "mesh/model.h"
+#include "mesh/keyring.h"
 
 /* Divide and round to ceiling (up) to calculate segment count */
 #define CEILDIV(val, div) (((val) + (div) - 1) / (div))
@@ -941,6 +942,7 @@ bool mesh_model_send(struct mesh_node *node, uint16_t src, uint16_t target,
 					const void *msg, uint16_t msg_len)
 {
 	uint8_t key_id;
+	uint8_t dev_key[16];
 	const uint8_t *key;
 
 	/* print_packet("Mod Tx", msg, msg_len); */
@@ -959,7 +961,12 @@ bool mesh_model_send(struct mesh_node *node, uint16_t src, uint16_t target,
 		if (!key)
 			return false;
 
-		l_debug("(%x)", app_idx);
+		key_id = APP_ID_DEV;
+	} else if (app_idx == APP_IDX_DEV_REMOTE) {
+		if (!keyring_get_remote_dev_key(node, target, dev_key))
+			return false;
+
+		key = dev_key;
 		key_id = APP_ID_DEV;
 	} else {
 		key = appkey_get_key(node_get_net(node), app_idx, &key_id);
diff --git a/mesh/node.c b/mesh/node.c
index 1dcb74b4f..7133f5b2d 100644
--- a/mesh/node.c
+++ b/mesh/node.c
@@ -1974,7 +1974,11 @@ static struct l_dbus_message *send_call(struct l_dbus *dbus,
 		return dbus_error(msg, MESH_ERROR_INVALID_ARGS,
 							"Incorrect data");
 
-	if (!mesh_model_send(node, src, dst, app_idx,
+	if ((app_idx & APP_IDX_MASK) != app_idx)
+		return dbus_error(msg, MESH_ERROR_INVALID_ARGS,
+						"Invalid key_index");
+
+	if (!mesh_model_send(node, src, dst, app_idx & APP_IDX_MASK,
 				mesh_net_get_default_ttl(node->net), data, len))
 		return dbus_error(msg, MESH_ERROR_FAILED, NULL);
 
@@ -1984,6 +1988,53 @@ static struct l_dbus_message *send_call(struct l_dbus *dbus,
 	return reply;
 }
 
+static struct l_dbus_message *dev_key_send_call(struct l_dbus *dbus,
+						struct l_dbus_message *msg,
+						void *user_data)
+{
+	struct mesh_node *node = user_data;
+	const char *sender, *ele_path;
+	struct l_dbus_message_iter iter_data;
+	struct node_element *ele;
+	uint16_t dst, net_idx, src;
+	uint8_t *data;
+	uint32_t len;
+	struct l_dbus_message *reply;
+
+	l_debug("DevKeySend");
+
+	sender = l_dbus_message_get_sender(msg);
+
+	if (strcmp(sender, node->owner))
+		return dbus_error(msg, MESH_ERROR_NOT_AUTHORIZED, NULL);
+
+	if (!l_dbus_message_get_arguments(msg, "oqqay", &ele_path, &dst,
+							&net_idx, &iter_data))
+		return dbus_error(msg, MESH_ERROR_INVALID_ARGS, NULL);
+
+	ele = l_queue_find(node->elements, match_element_path, ele_path);
+	if (!ele)
+		return dbus_error(msg, MESH_ERROR_NOT_FOUND,
+							"Element not found");
+
+	src = node_get_primary(node) + ele->idx;
+
+	if (!l_dbus_message_iter_get_fixed_array(&iter_data, &data, &len) ||
+					!len || len > MESH_MAX_ACCESS_PAYLOAD)
+		return dbus_error(msg, MESH_ERROR_INVALID_ARGS,
+							"Incorrect data");
+
+	/* TODO: use net_idx */
+	if (!mesh_model_send(node, src, dst, APP_IDX_DEV_REMOTE,
+				mesh_net_get_default_ttl(node->net), data, len))
+		return dbus_error(msg, MESH_ERROR_NOT_FOUND, NULL);
+
+	reply = l_dbus_message_new_method_return(msg);
+	l_dbus_message_set_arguments(reply, "");
+
+	return reply;
+}
+
 static struct l_dbus_message *publish_call(struct l_dbus *dbus,
 						struct l_dbus_message *msg,
 						void *user_data)
@@ -2089,7 +2140,11 @@ static void setup_node_interface(struct l_dbus_interface *iface)
 {
 	l_dbus_interface_method(iface, "Send", 0, send_call, "", "oqqay",
 						"element_path", "destination",
-						"key", "data");
+						"key_index", "data");
+	l_dbus_interface_method(iface, "DevKeySend", 0, dev_key_send_call,
+						"", "oqqay", "element_path",
+						"destination", "net_index",
+						"data");
 	l_dbus_interface_method(iface, "Publish", 0, publish_call, "", "oqay",
 					"element_path", "model_id", "data");
 	l_dbus_interface_method(iface, "VendorPublish", 0, vendor_publish_call,
-- 
2.19.1

