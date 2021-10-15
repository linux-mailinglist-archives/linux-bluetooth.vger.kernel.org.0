Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45F2C42E849
	for <lists+linux-bluetooth@lfdr.de>; Fri, 15 Oct 2021 07:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235376AbhJOFLl (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 15 Oct 2021 01:11:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235371AbhJOFLl (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 15 Oct 2021 01:11:41 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84905C061570
        for <linux-bluetooth@vger.kernel.org>; Thu, 14 Oct 2021 22:09:34 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id m21so7519515pgu.13
        for <linux-bluetooth@vger.kernel.org>; Thu, 14 Oct 2021 22:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6HiqdN1EnaqgNPuACA4aSekCO4Mw/k8EzrGEcvzIWsU=;
        b=LuagkbXZIy1H2WHa4+FIP6H2RxupMBuylH8apF3s+LAJzDs3kJL8tfvYh0uxDR9VXu
         aaLTM3FnOmfBHgQVqdZmqjfM7JIjFjOx1KF9L6s7PiRSWrW7tRtLjm01lMTMSZOUk5eq
         iKfSDTprPYkJdGRjyZLk9EoDk2HF8yuk3MnH27hj8VwJLreN6GwysWo1oVK2k5wxUlkA
         L1k+kQX4BofFEGSBvMV0CJHJXqo90DOY6b1uCtRl72YwWw+7UgzmZ6JbZaR/90n1i/ae
         m1RImjtcHmm15DBXH2IJizUzEpy8NK/mksdR9a5Ksft4budywI7J14k+7FnNUclepmCq
         VjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6HiqdN1EnaqgNPuACA4aSekCO4Mw/k8EzrGEcvzIWsU=;
        b=gVvLME7DlTImOGGcPz0HnlzbpLyZZ0XUAiPNpSLJy/q+19aL5/ItFd4PX659k2/MG9
         FjnZgQDAhEmZRQgZQVP48H4Gu3F/rKT5WHn1Sx+hVIKLSxji2H12skxte1Fx6PWG7BlV
         lUEoGQNKzeNWFkEaO4If/2xPc60I5cHGs2aRwenA07z4K9KzzeY/9f25FT+QydWadEHV
         yHuQnTcQwG5cpJlnslXFQ8G2GspPCYkmc6CShtjfHk9RYf3e35KXg4SEQPERZOwZE4YL
         lYQrgoB489GoZq9g6jtAXhny0J8pepNiwqg/cdZ5YyeGEJx2jh4uXiz/I8JYI0j0wo4s
         nB7g==
X-Gm-Message-State: AOAM533sVB6OKpIiBGEaleLuTZdKwP0WDeLVp7UyRar3tptCP1m/dBzZ
        k/hjbMdSOc6qFZ1cmVXq/fn8N1Ttkro=
X-Google-Smtp-Source: ABdhPJyPbqtXhpFF1c4GHuQTwIB9g5gfJWWuJrCHmswI+KiOFuYztq17eXBDhWIZfwZG5f+qYs4LRg==
X-Received: by 2002:a63:b253:: with SMTP id t19mr7528020pgo.48.1634274573708;
        Thu, 14 Oct 2021 22:09:33 -0700 (PDT)
Received: from localhost.localdomain (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id p17sm10347510pju.34.2021.10.14.22.09.33
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 22:09:33 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ 2/7] monitor: Make use of MSFT packet definitions
Date:   Thu, 14 Oct 2021 22:09:24 -0700
Message-Id: <20211015050929.3130100-2-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211015050929.3130100-1-luiz.dentz@gmail.com>
References: <20211015050929.3130100-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This make use of the packet definitions for MSFT extension.
---
 monitor/msft.c | 144 ++++++++++++++++++++++++++++++++++++++++---------
 monitor/msft.h |  11 ++--
 2 files changed, 125 insertions(+), 30 deletions(-)

diff --git a/monitor/msft.c b/monitor/msft.c
index 46e765489..ccb232f3b 100644
--- a/monitor/msft.c
+++ b/monitor/msft.c
@@ -30,6 +30,9 @@
 #include <stdio.h>
 #include <inttypes.h>
 
+#include "lib/bluetooth.h"
+#include "lib/uuid.h"
+
 #include "src/shared/util.h"
 #include "display.h"
 #include "packet.h"
@@ -49,46 +52,132 @@ static void null_rsp(const void *data, uint16_t size)
 
 static void read_supported_features_rsp(const void *data, uint16_t size)
 {
-	uint8_t evt_prefix_len = get_u8(data + 8);
+	const struct msft_rsp_read_supported_features *rsp = data;
+
+	packet_print_features_msft(rsp->features);
+	print_field("Event prefix length: %u", rsp->evt_prefix_len);
+	print_field("Event prefix:");
+	packet_hexdump(rsp->evt_prefix, rsp->evt_prefix_len);
+	packet_set_msft_evt_prefix(rsp->evt_prefix, rsp->evt_prefix_len);
+}
+
+static void monitor_rssi_cmd(const void *data, uint16_t size)
+{
+	const struct msft_cmd_monitor_rssi *cmd = data;
+
+	print_field("Connection handle: 0x%04x", cmd->handle);
+	packet_print_rssi("RSSI threshold high", cmd->rssi_high);
+	packet_print_rssi("RSSI threshold low", cmd->rssi_low);
+	print_field("RSSI threshold low time interval: %u sec (0x%2.2x)",
+						cmd->rssi_low_interval,
+						cmd->rssi_low_interval);
+	print_field("RSSI sampling period: %u msec (0x%2.2x)",
+						cmd->rssi_period * 100,
+						cmd->rssi_period);
+}
 
-	packet_print_features_msft(data);
-	print_field("Event prefix length: %u", evt_prefix_len);
-	packet_hexdump(data + 9, size - 9);
+static void cancel_monitor_rssi_cmd(const void *data, uint16_t size)
+{
+	const struct msft_cmd_cancel_monitor_rssi *cmd = data;
 
-	packet_set_msft_evt_prefix(data + 9, evt_prefix_len);
+	print_field("Connection handle: 0x%04x", cmd->handle);
 }
 
 static void le_monitor_advertisement_cmd(const void *data, uint16_t size)
 {
-	int8_t threshold_high = get_s8(data);
-	int8_t threshold_low = get_s8(data + 1);
-	uint8_t threshold_low_time_interval = get_u8(data + 2);
-	uint8_t sampling_period = get_u8(data + 3);
+	const struct msft_cmd_le_monitor_adv *cmd = data;
+	const struct msft_le_monitor_adv_patterns *patterns;
+	const struct msft_le_monitor_adv_uuid *uuid;
+	const struct msft_le_monitor_adv_irk *irk;
+	const struct msft_le_monitor_adv_addr *addr;
+	const char *str;
+	char uuidstr[MAX_LEN_UUID_STR];
 
-	packet_print_rssi("RSSI threshold high", threshold_high);
-	packet_print_rssi("RSSI threshold low", threshold_low);
+	packet_print_rssi("RSSI threshold high", cmd->rssi_high);
+	packet_print_rssi("RSSI threshold low", cmd->rssi_low);
 	print_field("RSSI threshold low time interval: %u sec (0x%2.2x)",
-						threshold_low_time_interval,
-						threshold_low_time_interval);
+						cmd->rssi_low_interval,
+						cmd->rssi_low_interval);
 	print_field("RSSI sampling period: %u msec (0x%2.2x)",
-						sampling_period * 100,
-						sampling_period);
-	packet_hexdump(data + 4, size - 4);
+						cmd->rssi_period * 100,
+						cmd->rssi_period);
+
+	switch (cmd->type) {
+	case MSFT_SUBCMD_LE_MONITOR_ADV_PATTERN:
+		print_field("Type: Pattern (0x%2.2x)", cmd->type);
+		patterns = (void *)cmd->data;
+		print_field("Number of patterns: %u", patterns->num);
+		packet_hexdump((void *)patterns->data,
+			       size - (sizeof(*cmd) + sizeof(*patterns)));
+		break;
+	case MSFT_SUBCMD_LE_MONITOR_ADV_UUID:
+		print_field("Type: UUID (0x%2.2x)", cmd->type);
+		uuid = (void *)cmd->data;
+
+		switch (uuid->type) {
+		case 0x01:
+			str = bt_uuid16_to_str(uuid->value.u16);
+			print_field("UUID: %s (0x%4.4x)", str, uuid->value.u16);
+			break;
+		case 0x02:
+			str = bt_uuid32_to_str(uuid->value.u32);
+			print_field("UUID: %s (0x%8.8x)", str, uuid->value.u32);
+			break;
+		case 0x03:
+			sprintf(uuidstr, "%8.8x-%4.4x-%4.4x-%4.4x-%8.8x%4.4x",
+				get_le32(uuid->value.u128 + 12),
+				get_le16(uuid->value.u128 + 10),
+				get_le16(uuid->value.u128 + 8),
+				get_le16(uuid->value.u128 + 6),
+				get_le32(uuid->value.u128 + 2),
+				get_le16(uuid->value.u128 + 0));
+			str = bt_uuidstr_to_str(uuidstr);
+			print_field("UUID: %s (%s)", str, uuidstr);
+			break;
+		default:
+			packet_hexdump((void *)&uuid->value,
+					size - sizeof(*cmd));
+			break;
+		}
+		break;
+	case MSFT_SUBCMD_LE_MONITOR_ADV_IRK:
+		print_field("Type: IRK (0x%2.2x)", cmd->type);
+		irk = (void *)cmd->data;
+		print_field("IRK:");
+		packet_hexdump(irk->irk, size - sizeof(*cmd));
+		break;
+	case MSFT_SUBCMD_LE_MONITOR_ADV_ADDR:
+		print_field("Type: Adderss (0x%2.2x)", cmd->type);
+		addr = (void *)cmd->data;
+		packet_print_addr(NULL, addr->addr, addr->type);
+		break;
+	default:
+		print_field("Type: Unknown (0x%2.2x)", cmd->type);
+		packet_hexdump(cmd->data, size - sizeof(*cmd));
+		break;
+	}
 }
 
 static void le_monitor_advertisement_rsp(const void *data, uint16_t size)
 {
-	uint8_t handle = get_u8(data);
+	const struct msft_rsp_le_monitor_adv *rsp = data;
+
+	print_field("Monitor handle: %u", rsp->handle);
+}
+
+static void le_cancel_monitor_adv_cmd(const void *data, uint16_t size)
+{
+	const struct msft_cmd_le_cancel_monitor_adv *cmd = data;
 
-	print_field("Monitor handle: %u", handle);
+	print_field("Monitor handle: %u", cmd->handle);
 }
 
 static void set_adv_filter_enable_cmd(const void *data, uint16_t size)
 {
-	uint8_t enable = get_u8(data);
+	const struct msft_cmd_le_monitor_adv_enable *cmd = data;
 	const char *str;
 
-	switch (enable) {
+	switch (cmd->enable) {
 	case 0x00:
 		str = "Current allow list";
 		break;
@@ -100,7 +189,7 @@ static void set_adv_filter_enable_cmd(const void *data, uint16_t size)
 		break;
 	}
 
-	print_field("Enable: %s (0x%2.2x)", str, enable);
+	print_field("Enable: %s (0x%2.2x)", str, cmd->enable);
 }
 
 typedef void (*func_t) (const void *data, uint16_t size);
@@ -114,12 +203,15 @@ static const struct {
 	{ 0x00, "Read Supported Features",
 			null_cmd,
 			read_supported_features_rsp },
-	{ 0x01, "Monitor RSSI" },
-	{ 0x02, "Cancel Monitor RSSI" },
+	{ 0x01, "Monitor RSSI",
+			monitor_rssi_cmd },
+	{ 0x02, "Cancel Monitor RSSI",
+			cancel_monitor_rssi_cmd },
 	{ 0x03, "LE Monitor Advertisement",
 			le_monitor_advertisement_cmd,
 			le_monitor_advertisement_rsp },
-	{ 0x04, "LE Cancel Monitor Advertisement" },
+	{ 0x04, "LE Cancel Monitor Advertisement",
+			le_cancel_monitor_adv_cmd },
 	{ 0x05, "LE Set Advertisement Filter Enable",
 			set_adv_filter_enable_cmd,
 			null_rsp },
@@ -156,7 +248,7 @@ static void msft_cmd(const void *data, uint8_t size)
 						" (0x%2.2x)", code);
 
 	if (code_func)
-		code_func(data + 1, size - 1);
+		code_func(data, size);
 	else
 		packet_hexdump(data + 1, size - 1);
 }
@@ -193,7 +285,7 @@ static void msft_rsp(const void *data, uint8_t size)
 	packet_print_error("Status", status);
 
 	if (code_func)
-		code_func(data + 2, size - 2);
+		code_func(data, size);
 	else
 		packet_hexdump(data + 2, size - 2);
 }
diff --git a/monitor/msft.h b/monitor/msft.h
index 90a64117a..4f4bdd992 100644
--- a/monitor/msft.h
+++ b/monitor/msft.h
@@ -68,6 +68,7 @@ struct msft_rsp_cancel_monitor_rssi {
 
 #define MSFT_SUBCMD_LE_MONITOR_ADV		0x03
 
+#define MSFT_SUBCMD_LE_MONITOR_ADV_PATTERN	0x01
 struct msft_le_monitor_pattern {
 	uint8_t  len;
 	uint8_t  type;
@@ -75,12 +76,13 @@ struct msft_le_monitor_pattern {
 	uint8_t  data[];
 } __attribute__((packed));
 
-struct msft_le_monitor_adv_pattern_type {
-	uint8_t num_patterns;
+struct msft_le_monitor_adv_patterns {
+	uint8_t num;
 	struct msft_le_monitor_pattern data[];
 } __attribute__((packed));
 
-struct msft_le_monitor_adv_uuid_type {
+#define MSFT_SUBCMD_LE_MONITOR_ADV_UUID		0x02
+struct msft_le_monitor_adv_uuid {
 	uint8_t  type;
 	union {
 		uint16_t u16;
@@ -89,7 +91,8 @@ struct msft_le_monitor_adv_uuid_type {
 	} value;
 } __attribute__((packed));
 
-struct msft_le_monitor_adv_irk_type {
+#define MSFT_SUBCMD_LE_MONITOR_ADV_IRK		0x03
+struct msft_le_monitor_adv_irk {
 	uint8_t  irk[8];
 } __attribute__((packed));
 
-- 
2.31.1

