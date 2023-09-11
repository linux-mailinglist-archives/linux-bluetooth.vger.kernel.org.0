Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F62C79C3BB
	for <lists+linux-bluetooth@lfdr.de>; Tue, 12 Sep 2023 05:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241449AbjILDI2 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 11 Sep 2023 23:08:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241929AbjILDIK (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 11 Sep 2023 23:08:10 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 160B589A95
        for <linux-bluetooth@vger.kernel.org>; Mon, 11 Sep 2023 15:35:05 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-68fb46f38f9so1658481b3a.1
        for <linux-bluetooth@vger.kernel.org>; Mon, 11 Sep 2023 15:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694471624; x=1695076424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SPxTVKDfPnYcmDz+/Xp310u86Enj0uzeRFdQ4Ju+daI=;
        b=BI/9Vrh+TTF50euP88jrmSUxbABsMoZJAsLI3ysyL4+YFNRBNaKrm03bS4ZJG8nsmO
         8PnGYj+lXNR6XFaeSPsGrFs6pnXpKqsb0extv673YXH4kdYZp/syd6QeAQrGts4YrBOX
         TolmHMc0RnYx2g3Utpjt2ZG/39KLQQtbpOQE55p3fqYrShn3ndBpdZTgAYXYk4EJpLe/
         9AC5kPHD9upyOqX9KuOmid1N4lOjQgix5kWSk/ahOK76tek8AwhyYKGHHp9N5oONieab
         /p2ZibdvALhmaf0/xa5ViBX4Yw3oNwrc7YtB1po98Yzb9SIDCkzRuMIm2ezpztDZssAe
         wxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694471624; x=1695076424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SPxTVKDfPnYcmDz+/Xp310u86Enj0uzeRFdQ4Ju+daI=;
        b=O6HawUYi/Fsy0Y+pY/qpqVb+6nTBmIjRfdHgA4kxM4xRyd4ttcjYDcZkEkgpkrK9pF
         ZsQdpfDz5Blq7rfthtmBPTzHexOBuTiXHSb51nVhgUXKdbil0zcsz/Cd/mkfzzX1W2Gi
         +Usc3WJTw6WBYHwU0ewSKzI6XYgMmnABM/wyYfM7X750mia9BNOBdjfowYoHTdTPix5R
         sfak8+afZBB3+5oNABRGCzdJMy7M/jqrjnINiZtbN9HYAnhqywr8Nh3678eBWuI0Rl90
         hrfxrqkYB7LdV4CbzhZ3r+PranVpye8prZ8YW3/Fq4XKRJDfAY8gNsP/UuJk9+0Nb+xx
         IGJg==
X-Gm-Message-State: AOJu0YyLItvmWFHFiVXyO1vRrhrMJPNNtq72HQJ8hUkKNFv3pzHQNkUI
        jr5PiiRI1/lr5q3GmupisBlvK7qNF/E=
X-Google-Smtp-Source: AGHT+IFgYOtMG094/l9VZWAHidoq46axAkCYbGpmTf8zEuGplOWf2+7Fv5ebWipEdA6LuXx7OFdEow==
X-Received: by 2002:a05:6a20:842a:b0:134:9f4e:623f with SMTP id c42-20020a056a20842a00b001349f4e623fmr10639128pzd.14.1694471623775;
        Mon, 11 Sep 2023 15:33:43 -0700 (PDT)
Received: from lvondent-mobl4.. (c-98-232-221-87.hsd1.or.comcast.net. [98.232.221.87])
        by smtp.gmail.com with ESMTPSA id i11-20020a633c4b000000b005634343cd9esm4099884pgn.44.2023.09.11.15.33.42
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 15:33:42 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ] device: Fix not handling initiator properly
Date:   Mon, 11 Sep 2023 15:33:40 -0700
Message-ID: <20230911223341.2701182-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

Previously initiator would be set whenever a central key was found
which turns out to be unreliable besides the MGMT New Connection event
does in fact inform if the connection was initiated locally or not.

Fixes: https://github.com/bluez/bluez/issues/598
---
 src/adapter.c | 10 ++++++----
 src/device.c  | 15 +++++----------
 src/device.h  |  3 ++-
 3 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/src/adapter.c b/src/adapter.c
index 5ebfc4752a7e..8a7c53a9e3ce 100644
--- a/src/adapter.c
+++ b/src/adapter.c
@@ -5163,9 +5163,10 @@ static void adapter_remove_device(struct btd_adapter *adapter,
 
 static void adapter_add_connection(struct btd_adapter *adapter,
 						struct btd_device *device,
-						uint8_t bdaddr_type)
+						uint8_t bdaddr_type,
+						uint32_t flags)
 {
-	device_add_connection(device, bdaddr_type);
+	device_add_connection(device, bdaddr_type, flags);
 
 	if (g_slist_find(adapter->connections, device)) {
 		btd_error(adapter->dev_id,
@@ -5218,7 +5219,7 @@ static void get_connections_complete(uint8_t status, uint16_t length,
 		device = btd_adapter_get_device(adapter, &addr->bdaddr,
 								addr->type);
 		if (device)
-			adapter_add_connection(adapter, device, addr->type);
+			adapter_add_connection(adapter, device, addr->type, 0);
 	}
 }
 
@@ -9426,7 +9427,8 @@ static void connected_callback(uint16_t index, uint16_t length,
 	if (eir_data.class != 0)
 		device_set_class(device, eir_data.class);
 
-	adapter_add_connection(adapter, device, ev->addr.type);
+	adapter_add_connection(adapter, device, ev->addr.type,
+					le32_to_cpu(ev->flags));
 
 	name_known = device_name_known(device);
 
diff --git a/src/device.c b/src/device.c
index 9b58e0c4e6c5..35ce1df0fe74 100644
--- a/src/device.c
+++ b/src/device.c
@@ -312,16 +312,9 @@ static struct bearer_state *get_state(struct btd_device *dev,
 
 bool btd_device_is_initiator(struct btd_device *dev)
 {
-	if (dev->le_state.connected) {
-		/* Mark as initiator if not set yet and auto-connect flag is
-		 * set and LTK key is for a peripheral.
-		 */
-		if (!dev->le_state.initiator && dev->auto_connect &&
-					dev->ltk && !dev->ltk->central)
-			dev->le_state.initiator = true;
-
+	if (dev->le_state.connected)
 		return dev->le_state.initiator;
-	} else if (dev->bredr_state.connected)
+	else if (dev->bredr_state.connected)
 		return dev->bredr_state.initiator;
 
 	return dev->att_io ? true : false;
@@ -3226,7 +3219,8 @@ static void clear_temporary_timer(struct btd_device *dev)
 	}
 }
 
-void device_add_connection(struct btd_device *dev, uint8_t bdaddr_type)
+void device_add_connection(struct btd_device *dev, uint8_t bdaddr_type,
+							uint32_t flags)
 {
 	struct bearer_state *state = get_state(dev, bdaddr_type);
 
@@ -3249,6 +3243,7 @@ void device_add_connection(struct btd_device *dev, uint8_t bdaddr_type)
 		device_set_le_support(dev, bdaddr_type);
 
 	state->connected = true;
+	state->initiator = flags & BIT(3);
 
 	if (dev->le_state.connected && dev->bredr_state.connected)
 		return;
diff --git a/src/device.h b/src/device.h
index 3252e14eff84..0a9e51533ca5 100644
--- a/src/device.h
+++ b/src/device.h
@@ -124,7 +124,8 @@ int device_notify_pincode(struct btd_device *device, gboolean secure,
 							const char *pincode);
 void device_cancel_authentication(struct btd_device *device, gboolean aborted);
 gboolean device_is_authenticating(struct btd_device *device);
-void device_add_connection(struct btd_device *dev, uint8_t bdaddr_type);
+void device_add_connection(struct btd_device *dev, uint8_t bdaddr_type,
+							uint32_t flags);
 void device_remove_connection(struct btd_device *device, uint8_t bdaddr_type,
 								bool *remove);
 void device_request_disconnect(struct btd_device *device, DBusMessage *msg);
-- 
2.41.0

