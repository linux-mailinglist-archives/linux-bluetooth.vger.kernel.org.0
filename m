Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 520672A33B5
	for <lists+linux-bluetooth@lfdr.de>; Mon,  2 Nov 2020 20:12:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726456AbgKBTMg (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 2 Nov 2020 14:12:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726433AbgKBTMf (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 2 Nov 2020 14:12:35 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC347C0617A6
        for <linux-bluetooth@vger.kernel.org>; Mon,  2 Nov 2020 11:12:35 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id z24so11631394pgk.3
        for <linux-bluetooth@vger.kernel.org>; Mon, 02 Nov 2020 11:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UOqgW6gYJUJOpOWSWevnjNEwQyetSI3mUh93Pehd4Ik=;
        b=Q3BaXOtSsZg7LeEnYM2dPQRmpUH+5STQunUWi7sMjhfcx2TeUTtdMfyNCAErtrFRu4
         WYoYPyDmx9ob2VTQR17SdphwQ+uJfikOcA8+kErMXNG1mKSoGktrENENOHa9mhdejtIH
         hcG2n8Cea02tEY88APsBKTuVxgjyAGPE3kVVhtsKMeycjyLm9cI5QMyF+q9+wHHABD7f
         S3Qp/DM34Fy3UCvAWQ1RJCEC6d5kUZQeoZ52xzQPEeEC8AAvVm5Tocev66v1Ld1JnjY/
         e4KG3ACzUSCD1A+StN/bbntIFpi6eo83pVR9/rT8EqA//jy/u0ozodaEkY2imgRnOXFA
         oceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UOqgW6gYJUJOpOWSWevnjNEwQyetSI3mUh93Pehd4Ik=;
        b=RbltOI8SUaU6AcBm4QJdedONxh+rg7jYMjNq57xXxujGedEfIQ9viEMcCv3PIx/k5f
         31k1/riFko7zz0d74p66Lds1kxmC5L3NmWxUoDtcWewspMHbkuUapNDElAIbpjgpirf8
         mKGVKtobEByvKx/yxLtirb0ZQxFAOV5un+0xfNp/VEwOb0d6ZrnpG+FieucXOYDvxE/h
         NklwgFo4Pf9Ky+9Be3L7EL4qfl/ZzQN5oKrl+weUBCHlYb6Z0OMHz9pUOyn9CQhdCm/I
         doZe6CIi0fXP6m3iBMxU1jMBP8md83NjWuXxMwXKgKt8GGpRCCupEzuraQcrbXHvCqAl
         eydQ==
X-Gm-Message-State: AOAM533BDXquy1Z4NgSUt/RCAS34xNN8W/OK7vnyvN2pP9do6vzmGqbq
        uO7twwwoz2KYSA6dOUNsR1IiXB3Jay2AnQ==
X-Google-Smtp-Source: ABdhPJz5xeqDea/ZsS1ebfuTFA7h1K9WNQOpf+Ut1QYxjrgcG8McHhuNQLckGg/tf3LGF4EdEYFzuw==
X-Received: by 2002:a17:90a:34cd:: with SMTP id m13mr19449866pjf.201.1604344354806;
        Mon, 02 Nov 2020 11:12:34 -0800 (PST)
Received: from localhost.localdomain (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id z10sm14589716pff.218.2020.11.02.11.12.33
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 11:12:33 -0800 (PST)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v2 01/11] emulator/btdev: Add debug support
Date:   Mon,  2 Nov 2020 11:12:22 -0800
Message-Id: <20201102191232.1848737-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This adds btdev_set_debug which can be used to debug internals of
btdev.
---
 emulator/btdev.c | 99 +++++++++++++++++++++++++-----------------------
 emulator/btdev.h |  5 +++
 2 files changed, 57 insertions(+), 47 deletions(-)

diff --git a/emulator/btdev.c b/emulator/btdev.c
index ca87681a6..c89815b3e 100644
--- a/emulator/btdev.c
+++ b/emulator/btdev.c
@@ -144,6 +144,10 @@ struct btdev {
 	uint8_t  sync_train_service_data;
 
 	uint16_t le_ext_adv_type;
+
+	btdev_debug_func_t debug_callback;
+	btdev_destroy_func_t debug_destroy;
+	void *debug_data;
 };
 
 struct inquiry_data {
@@ -257,45 +261,6 @@ static inline struct btdev *find_btdev_by_bdaddr_type(const uint8_t *bdaddr,
 	return NULL;
 }
 
-static void hexdump(const unsigned char *buf, uint16_t len)
-{
-	static const char hexdigits[] = "0123456789abcdef";
-	char str[68];
-	uint16_t i;
-
-	if (!len)
-		return;
-
-	for (i = 0; i < len; i++) {
-		str[((i % 16) * 3) + 0] = hexdigits[buf[i] >> 4];
-		str[((i % 16) * 3) + 1] = hexdigits[buf[i] & 0xf];
-		str[((i % 16) * 3) + 2] = ' ';
-		str[(i % 16) + 49] = isprint(buf[i]) ? buf[i] : '.';
-
-		if ((i + 1) % 16 == 0) {
-			str[47] = ' ';
-			str[48] = ' ';
-			str[65] = '\0';
-			printf("%-12c%s\n", ' ', str);
-			str[0] = ' ';
-		}
-	}
-
-	if (i % 16 > 0) {
-		uint16_t j;
-		for (j = (i % 16); j < 16; j++) {
-			str[(j * 3) + 0] = ' ';
-			str[(j * 3) + 1] = ' ';
-			str[(j * 3) + 2] = ' ';
-			str[j + 49] = ' ';
-		}
-		str[47] = ' ';
-		str[48] = ' ';
-		str[65] = '\0';
-		printf("%-12c%s\n", ' ', str);
-	}
-}
-
 static void get_bdaddr(uint16_t id, uint8_t index, uint8_t *bdaddr)
 {
 	bdaddr[0] = id & 0xff;
@@ -768,6 +733,22 @@ void btdev_destroy(struct btdev *btdev)
 	free(btdev);
 }
 
+bool btdev_set_debug(struct btdev *btdev, btdev_debug_func_t callback,
+			void *user_data, btdev_destroy_func_t destroy)
+{
+	if (!btdev)
+		return false;
+
+	if (btdev->debug_destroy)
+		btdev->debug_destroy(btdev->debug_data);
+
+	btdev->debug_callback = callback;
+	btdev->debug_destroy = destroy;
+	btdev->debug_data = user_data;
+
+	return true;
+}
+
 const uint8_t *btdev_get_bdaddr(struct btdev *btdev)
 {
 	return btdev->bdaddr;
@@ -824,9 +805,20 @@ void btdev_set_send_handler(struct btdev *btdev, btdev_send_func handler,
 static void send_packet(struct btdev *btdev, const struct iovec *iov,
 								int iovlen)
 {
+	int i;
+
 	if (!btdev->send_handler)
 		return;
 
+	for (i = 0; i < iovlen; i++) {
+		if (!i)
+			util_hexdump('<', iov[i].iov_base, iov[i].iov_len,
+				btdev->debug_callback, btdev->debug_data);
+		else
+			util_hexdump(' ', iov[i].iov_base, iov[i].iov_len,
+				btdev->debug_callback, btdev->debug_data);
+	}
+
 	btdev->send_handler(iov, iovlen, btdev->send_data);
 }
 
@@ -837,6 +829,9 @@ static void send_event(struct btdev *btdev, uint8_t event,
 	struct iovec iov[3];
 	uint8_t pkt = BT_H4_EVT_PKT;
 
+	util_debug(btdev->debug_callback, btdev->debug_data,
+				"event 0x%02x", event);
+
 	iov[0].iov_base = &pkt;
 	iov[0].iov_len = sizeof(pkt);
 
@@ -863,6 +858,9 @@ static void send_cmd(struct btdev *btdev, uint8_t evt, uint16_t opcode,
 	uint8_t pkt = BT_H4_EVT_PKT;
 	int i;
 
+	util_debug(btdev->debug_callback, btdev->debug_data,
+				"event 0x%02x opcode 0x%04x", evt, opcode);
+
 	iov2[0].iov_base = &pkt;
 	iov2[0].iov_len = sizeof(pkt);
 
@@ -921,6 +919,9 @@ static void le_meta_event(struct btdev *btdev, uint8_t event,
 {
 	void *pkt_data;
 
+	util_debug(btdev->debug_callback, btdev->debug_data,
+				"meta event 0x%02x", event);
+
 	pkt_data = alloca(1 + len);
 	if (!pkt_data)
 		return;
@@ -2089,7 +2090,6 @@ static void send_ext_adv(struct btdev *btdev, const struct btdev *remote,
 					uint16_t type, bool is_scan_rsp)
 {
 	struct __packed {
-		uint8_t subevent;
 		uint8_t num_reports;
 		union {
 			struct bt_hci_le_ext_adv_report lear;
@@ -2097,8 +2097,6 @@ static void send_ext_adv(struct btdev *btdev, const struct btdev *remote,
 		};
 	} meta_event;
 
-	meta_event.subevent = BT_HCI_EVT_LE_EXT_ADV_REPORT;
-
 	memset(&meta_event.lear, 0, sizeof(meta_event.lear));
 	meta_event.num_reports = 1;
 	meta_event.lear.event_type = cpu_to_le16(type);
@@ -2121,8 +2119,8 @@ static void send_ext_adv(struct btdev *btdev, const struct btdev *remote,
 						meta_event.lear.data_len);
 	}
 
-	send_event(btdev, BT_HCI_EVT_LE_META_EVENT, &meta_event,
-					1 + 1 + 24 + meta_event.lear.data_len);
+	le_meta_event(btdev, BT_HCI_EVT_LE_EXT_ADV_REPORT, &meta_event,
+					1 + 24 + meta_event.lear.data_len);
 }
 
 static uint8_t get_adv_report_type(uint8_t adv_type)
@@ -3952,8 +3950,8 @@ static void default_cmd(struct btdev *btdev, uint16_t opcode,
 	return;
 
 unsupported:
-	printf("Unsupported command 0x%4.4x\n", opcode);
-	hexdump(data, len);
+	util_debug(btdev->debug_callback, btdev->debug_data,
+			"Unsupported command 0x%4.4x\n", opcode);
 	cmd_status(btdev, BT_HCI_ERR_UNKNOWN_COMMAND, opcode);
 }
 
@@ -4267,6 +4265,9 @@ static void process_cmd(struct btdev *btdev, const void *data, uint16_t len)
 	callback.data = data + sizeof(*hdr);
 	callback.len = hdr->plen;
 
+	util_debug(btdev->debug_callback, btdev->debug_data,
+				"command 0x%04x", callback.opcode);
+
 	if (btdev->command_handler)
 		btdev->command_handler(callback.opcode,
 					callback.data, callback.len,
@@ -4331,6 +4332,9 @@ void btdev_receive_h4(struct btdev *btdev, const void *data, uint16_t len)
 	if (len < 1)
 		return;
 
+	util_hexdump('>', data, len, btdev->debug_callback,
+					btdev->debug_data);
+
 	pkt_type = ((const uint8_t *) data)[0];
 
 	switch (pkt_type) {
@@ -4348,7 +4352,8 @@ void btdev_receive_h4(struct btdev *btdev, const void *data, uint16_t len)
 			send_iso(btdev->conn, data, len);
 		break;
 	default:
-		printf("Unsupported packet 0x%2.2x\n", pkt_type);
+		util_debug(btdev->debug_callback, btdev->debug_data,
+				"Unsupported packet 0x%2.2x\n", pkt_type);
 		break;
 	}
 }
diff --git a/emulator/btdev.h b/emulator/btdev.h
index 7cb265f1c..f7cba149a 100644
--- a/emulator/btdev.h
+++ b/emulator/btdev.h
@@ -66,6 +66,11 @@ struct btdev;
 struct btdev *btdev_create(enum btdev_type type, uint16_t id);
 void btdev_destroy(struct btdev *btdev);
 
+typedef void (*btdev_debug_func_t)(const char *str, void *user_data);
+typedef void (*btdev_destroy_func_t)(void *user_data);
+bool btdev_set_debug(struct btdev *btdev, btdev_debug_func_t callback,
+			void *user_data, btdev_destroy_func_t destroy);
+
 const uint8_t *btdev_get_bdaddr(struct btdev *btdev);
 uint8_t *btdev_get_features(struct btdev *btdev);
 
-- 
2.26.2

