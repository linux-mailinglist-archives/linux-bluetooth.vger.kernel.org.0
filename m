Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB320134124
	for <lists+linux-bluetooth@lfdr.de>; Wed,  8 Jan 2020 12:48:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727444AbgAHLsI (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 8 Jan 2020 06:48:08 -0500
Received: from mail-lf1-f51.google.com ([209.85.167.51]:33009 "EHLO
        mail-lf1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727212AbgAHLsI (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 8 Jan 2020 06:48:08 -0500
Received: by mail-lf1-f51.google.com with SMTP id n25so2236237lfl.0
        for <linux-bluetooth@vger.kernel.org>; Wed, 08 Jan 2020 03:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codecoup-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FLrSyRALA+rrBdzmNTayeiwTN7tLarui48qkxMKE5EE=;
        b=YMl0G26/8WwZOsKv1hCc7FZeipcAWYMKIiBIStU/wnho8aXwgbpmzF/dYFcrNUKh8J
         YheU4SAFi2zHi4eD9Me9QCvMxAI98F4vILXcWc4doD2nP1mQ/NM1sjweyuedd1iVRZoF
         +HIZ4B/ZWHfIgQn8mF65HTQGDstZojWzrVOf/Y1RApqOzCsHo3ofvF+w/m2uG3EypZPp
         9C0XB7Cor3kMdQDSkWtmd/4kUG/Fu34gYXyFTWJf5RwNOUbL/MILTqO66V6TPvuELP4o
         hTZrplirhS6zfvqHMeEPqMXlDGn+c6PT/NDWnHUAB6q7ck0qQZU3qc8Y+RNqU+3KFs09
         j/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FLrSyRALA+rrBdzmNTayeiwTN7tLarui48qkxMKE5EE=;
        b=ccZLhWKKW310RjFHSa2hnI4WCYXMrOiINLVvNVuFfHDF+1F36jIiPBK8GpnQt9kTZp
         2WiHbi6/igvQIDsvUqFppJ5yxXl+jLsp2NwimjW+lkZHHzTWGceOlr9oBIBvH856Lq4g
         g/AtVb4POxMqw6vvX7Vmk75pCZtLUDTChcGno6EG3vCVgV+7+2odZnRAJHMw8izuaEo/
         wILxXiHbhpIc+baD1bGcMWcSpghn3UBOE0A/vaSdqLTAuN03s9IctNw8WvaGw8E6fztl
         BK5XuGykef+m8YxLBzi0Qj4n97iYCN7v6Kp0xDGWhQokTWcOBSYvEB44MWHL4f7TG0SZ
         y3yg==
X-Gm-Message-State: APjAAAVm3X73ujSV5yMqXX09xNi+VDlUk9ds2AdUayktimhqNF6GGth4
        8LwvZu2IutAfbfYTEe2OQu+HypZCH4I=
X-Google-Smtp-Source: APXvYqzxQDdYpow7XQVkccyuhD9AqzXFHcGt/cO7l8io2z28QdMRdNyE29iF1UIssZ5QGbcYpARr8g==
X-Received: by 2002:a19:4b55:: with SMTP id y82mr2590196lfa.171.1578484084353;
        Wed, 08 Jan 2020 03:48:04 -0800 (PST)
Received: from tp480.int.codecoup.pl ([95.143.243.62])
        by smtp.gmail.com with ESMTPSA id e17sm1130645ljg.101.2020.01.08.03.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 03:48:03 -0800 (PST)
From:   Szymon Czapracki <szymon.czapracki@codecoup.pl>
To:     linux-bluetooth@vger.kernel.org
Cc:     Szymon Czapracki <szymon.czapracki@codecoup.pl>
Subject: [PATCH v2 7/8] monitor: Decode LE Set Default Periodic Adv Sync Transfer Params. command
Date:   Wed,  8 Jan 2020 12:47:51 +0100
Message-Id: <20200108114752.133076-7-szymon.czapracki@codecoup.pl>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108114752.133076-1-szymon.czapracki@codecoup.pl>
References: <20200108114752.133076-1-szymon.czapracki@codecoup.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

< HCI Command: LE Set Default Periodic Advertisng Sync Transfer Parameters (0x08|0x005d) plen 6
        Mode: Enabled with report events disabled (0x01)
        Skip: 0x00
        Sync timeout: 0 msec (0x0000)
        Sync CTE type: 0x0000
> HCI Event: Command Status (0x0f) plen 4
      LE Set Default Periodic Advertisng Sync Transfer Parameters (0x08|0x005d) ncmd 1
        Status: Unknown HCI Command (0x01)
---
 monitor/bt.h     |  8 ++++++++
 monitor/packet.c | 17 +++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/monitor/bt.h b/monitor/bt.h
index 2ec2ea0a7..1859dfb21 100644
--- a/monitor/bt.h
+++ b/monitor/bt.h
@@ -2490,6 +2490,14 @@ struct bt_hci_cmd_periodic_adv_sync_trans_params {
 	uint8_t   cte_type;
 } __attribute__ ((packed));
 
+#define BT_HCI_CMD_DEFAULT_PERIODIC_ADV_SYNC_TRANS_PARAMS	0x205d
+struct bt_hci_cmd_default_periodic_adv_sync_trans_params {
+	uint8_t  mode;
+	uint16_t skip;
+	uint16_t sync_timeout;
+	uint8_t  cte_type;
+} __attribute__ ((packed));
+
 #define BT_HCI_EVT_INQUIRY_COMPLETE		0x01
 struct bt_hci_evt_inquiry_complete {
 	uint8_t  status;
diff --git a/monitor/packet.c b/monitor/packet.c
index 74c73f145..9d22dfc15 100644
--- a/monitor/packet.c
+++ b/monitor/packet.c
@@ -7653,6 +7653,19 @@ static void le_periodic_adv_sync_trans_params(const void *data, uint8_t size)
 	print_create_sync_cte_type(cmd->cte_type);
 }
 
+static void le_set_default_periodic_adv_sync_trans_params(const void *data,
+								uint8_t size)
+{
+	const struct bt_hci_cmd_default_periodic_adv_sync_trans_params *cmd = data;
+
+	print_sync_mode(cmd->mode);
+	print_field("Skip: 0x%2.2x", cmd->skip);
+	print_field("Sync timeout: %d msec (0x%4.4x)",
+					le16_to_cpu(cmd->sync_timeout) * 10,
+					le16_to_cpu(cmd->sync_timeout));
+	print_create_sync_cte_type(cmd->cte_type);
+}
+
 struct opcode_data {
 	uint16_t opcode;
 	int bit;
@@ -8458,6 +8471,10 @@ static const struct opcode_data opcode_table[] = {
 	{ 0x205c, 328, "LE Periodic Advertising Sync Transfer Parameters",
 				le_periodic_adv_sync_trans_params, 8, true,
 				status_handle_rsp, 3, true},
+	{ 0x205d, 329, "LE Set Default Periodic Advertisng Sync Transfer "
+				"Parameters",
+				le_set_default_periodic_adv_sync_trans_params,
+				6, true, status_rsp, 1, true},
 	{ }
 };
 
-- 
2.24.1

