Return-Path: <linux-bluetooth+bounces-15790-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D06C6BCAECE
	for <lists+linux-bluetooth@lfdr.de>; Thu, 09 Oct 2025 23:29:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5E6E19E4C47
	for <lists+linux-bluetooth@lfdr.de>; Thu,  9 Oct 2025 21:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235A42848A5;
	Thu,  9 Oct 2025 21:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fIfLj7jB"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9951284893
	for <linux-bluetooth@vger.kernel.org>; Thu,  9 Oct 2025 21:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760045385; cv=none; b=OTguLTjenHBowTadXdVF60D0QrhMgRP7RGQ8biiLBuroD5gAdNQY1l4kKY72YHzy7QTXUr6MNz09nkfQbj1aA/BnsJALDjNRjqrSLVaeJe27/IV+awDdAg/6Z/CNHl7cpnPyIKO4fkoXkurJjTF6qSfaUDuLQOQP6uBUGxaPfWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760045385; c=relaxed/simple;
	bh=aMMBBsxAgYjXh1BBnl/s1K/bYEQkycYI1ghOk3XPnRM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=SNJ1hbno32MtJbdzj+h6fIRaMQBssfxfclMuW8ZvNznJlqwr96PJcdePmjGQYsB594Pp/kOTjoIC5sD06L19VLezahdyDQipn3pybM0+6gJDDOI6+IRIZiIKJJGev82oYXyX7d+coyZMxe1HQl9ANeRyL5ssmdpUAbiIMAZAWug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fIfLj7jB; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-8c0e2d1efd5so439582241.3
        for <linux-bluetooth@vger.kernel.org>; Thu, 09 Oct 2025 14:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760045382; x=1760650182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ag2iz1dpxt1ncilQ9K1pqh42Zq4SmOTgzkEz5rSFr3g=;
        b=fIfLj7jBqmmngTG0AGB9VGrj9HHmZR0nKq7CsTzDgwEx4M8j4dAQnLdNujCM0sVTrD
         M4rV+Wzc2fNKexp5ZvR1jv7EcEhMNerfzmgZeKdeB5sGimMa1HC73j9c37GbKFdMovSw
         eKGbC4Ax9pJLQ4UjEfjWa3UkNip0GO+aMqCu5Cy76kZGrrIjXWXgWTsjpKLMoGPRlvxP
         YbYCdWBEzLFyL9rVNWlx6WmnKmDefmTNxo92ViF4sClktmsFy5RNxuurbK0hD1DmQIS0
         Kls1y79edRKe3hlxt35oN2SMHBUjk0pJL0jmN98XIbNgrPTry7AkYn81bwmGzV5RXarH
         6l7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760045382; x=1760650182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ag2iz1dpxt1ncilQ9K1pqh42Zq4SmOTgzkEz5rSFr3g=;
        b=MIFM0GndY6OLC3id84wrPOA58iO+Y1e0LRiMdMjh06En8Mnw0GgYwWBagq+sFPKddm
         sOwkeKoXkV0oGD5z7x1W5HfgltM3epJzfWF/Nv3kJdqCMy4WXJPMvJwL5LH8wOi1cN0S
         HuUAZA9Aejyj+C3avTAXUsQSEI75HT/tsVPzKctHML6+Z0UlzIBf9sFUc6SnE/D2Lp1T
         vFo8S+jkQjndmwvelQdHXEPP1ixqWftlLM3YpfcLay/eYOte2cjpBkZWuRIv8BRE9gbD
         mhFyCGGGNlLrgXd5i2MpIZgDHl6b2d60Cf+W+MaUoAcvYMLNJz2wUZZrTEGHvlay46rH
         tt0Q==
X-Gm-Message-State: AOJu0Yynw37x5qwscCqeizmPA71EOL7etJfA8T1AjlciYrJoVSqLRYb5
	KCeEgfhTImbg9GOO0Ap19L1dg2AoCEKaBbjwnhtQV2hUVHfJfM2lvplWkNP6Er72
X-Gm-Gg: ASbGncvjR+6ExkNX/SkU322xqkJZhUTwr7/5ckRYTvqjr1v/gzdmheNMCmFtuZOIPMl
	a10287hLLY4eJ5UjpTFDMyT36uM/I/HmH97BPQjBLXDeKaNH3nla4TraGgBHIMZ1E3vOmfWCRmW
	O/qm0T+aS7d4asc9RUcs+rnAxYhLHTqriLKMGoU5Mml2p8j5acyI1YxY8Q1CvZoBwSrjAVy8Mkb
	VDiS8AvRJOrSHkTk01tqGb1sIIU90BOvSkVCBYinPNhOarV1S0+NyDuxqAjRzu6DrKR3rtS5tp+
	q+o/FFGFvJUsyZl63b1VS4Yp4/wkf4HymS9IesqDLVV+laphgj9nekcqBbeSbVpnaDfbLDXhRTo
	tzMbmT1GDVqecexSCBvMsd+CL5L5Dwv1qMNR7hp5kwCR6X4BbdJT4jIe2Hmo47LHktY4YPb4YwS
	v+ig0uKzyvAVGV34kkDypDRrR6
X-Google-Smtp-Source: AGHT+IHXJ9YwJr9pvJeoIYKphJhv/Zxoq45v5/cr5Y5X/RijFuQfP/nUMV7c5uQBqcjUw7Z3RV9+XQ==
X-Received: by 2002:a05:6122:2a0d:b0:554:afe3:1fb1 with SMTP id 71dfb90a1353d-554b8cf023dmr3887976e0c.14.1760045381951;
        Thu, 09 Oct 2025 14:29:41 -0700 (PDT)
Received: from lvondent-mobl5 (syn-050-089-067-214.res.spectrum.com. [50.89.67.214])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-554d7f01e3fsm211224e0c.7.2025.10.09.14.29.39
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 14:29:40 -0700 (PDT)
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v2 01/13] monitor: Use PAST to refer to Periodic Advertising Sync Transfer
Date: Thu,  9 Oct 2025 17:29:19 -0400
Message-ID: <20251009212931.445719-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This simplify the command and event names and their structs to just
use PAST in place of other terminology currently in use.
---
 monitor/bt.h     | 39 +++++++++++++++++++++++++++------------
 monitor/packet.c | 41 +++++++++++++++++++++++------------------
 2 files changed, 50 insertions(+), 30 deletions(-)

diff --git a/monitor/bt.h b/monitor/bt.h
index 0e80ad2a2d6f..ca91f7fefc84 100644
--- a/monitor/bt.h
+++ b/monitor/bt.h
@@ -2630,22 +2630,32 @@ struct bt_hci_cmd_set_pa_rec_enable {
 	uint8_t  enable;
 } __attribute__ ((packed));
 
-#define BT_HCI_CMD_PERIODIC_SYNC_TRANS		0x205a
-struct bt_hci_cmd_periodic_sync_trans {
+#define BT_HCI_CMD_LE_PAST			0x205a
+struct bt_hci_cmd_le_past {
 	uint16_t handle;
 	uint16_t service_data;
 	uint16_t sync_handle;
 } __attribute__ ((packed));
 
-#define BT_HCI_CMD_PA_SET_INFO_TRANS		0x205b
-struct bt_hci_cmd_pa_set_info_trans {
+struct bt_hci_rsp_le_past {
+	uint8_t  status;
 	uint16_t handle;
-	uint16_t service_data;
-	uint8_t adv_handle;
 } __attribute__ ((packed));
 
-#define BT_HCI_CMD_PA_SYNC_TRANS_PARAMS		0x205c
-struct bt_hci_cmd_pa_sync_trans_params {
+#define BT_HCI_CMD_LE_PAST_SET_INFO		0x205b
+struct bt_hci_cmd_le_past_set_info {
+	uint16_t handle;
+	uint16_t service_data;
+	uint8_t  adv_handle;
+} __attribute__ ((packed));
+
+struct bt_hci_rsp_le_past_set_info {
+	uint8_t  status;
+	uint16_t handle;
+} __attribute__ ((packed));
+
+#define BT_HCI_CMD_LE_PAST_PARAMS		0x205c
+struct bt_hci_cmd_le_past_params {
 	uint16_t  handle;
 	uint8_t   mode;
 	uint16_t  skip;
@@ -2653,8 +2663,13 @@ struct bt_hci_cmd_pa_sync_trans_params {
 	uint8_t   cte_type;
 } __attribute__ ((packed));
 
-#define BT_HCI_CMD_DEFAULT_PA_SYNC_TRANS_PARAMS	0x205d
-struct bt_hci_cmd_default_pa_sync_trans_params {
+struct bt_hci_rsp_le_past_params {
+	uint8_t  status;
+	uint16_t handle;
+} __attribute__ ((packed));
+
+#define BT_HCI_CMD_DEFAULT_PAST_PARAMS		0x205d
+struct bt_hci_cmd_le_default_past_params {
 	uint8_t  mode;
 	uint16_t skip;
 	uint16_t sync_timeout;
@@ -3865,8 +3880,8 @@ struct bt_hci_evt_le_cte_request_failed {
 	uint16_t handle;
 } __attribute__ ((packed));
 
-#define BT_HCI_EVT_LE_PA_SYNC_TRANS_REC		0x18
-struct bt_hci_evt_le_pa_sync_trans_rec {
+#define BT_HCI_EVT_LE_PAST_RECEIVED		0x18
+struct bt_hci_evt_le_past_recv {
 	uint8_t  status;
 	uint16_t handle;
 	uint16_t service_data;
diff --git a/monitor/packet.c b/monitor/packet.c
index 2b30e881a201..f7db1cbb88c6 100644
--- a/monitor/packet.c
+++ b/monitor/packet.c
@@ -3192,7 +3192,7 @@ static const struct bitfield_data events_le_table[] = {
 	{ 20, "LE Connectionless IQ Report"		},
 	{ 21, "LE Connection IQ Report"			},
 	{ 22, "LE CTE Request Failed"			},
-	{ 23, "LE Periodic Advertising Sync Transfer Rvc"},
+	{ 23, "LE PAST Received"			},
 	{ 24, "LE CIS Established"			},
 	{ 25, "LE CIS Request"				},
 	{ 26, "LE Create BIG Complete"			},
@@ -8596,18 +8596,18 @@ static void le_pa_rec_enable(uint16_t index, const void *data, uint8_t size)
 	print_enable("Reporting", cmd->enable);
 }
 
-static void le_pa_sync_trans(uint16_t index, const void *data, uint8_t size)
+static void le_past(uint16_t index, const void *data, uint8_t size)
 {
-	const struct bt_hci_cmd_periodic_sync_trans *cmd = data;
+	const struct bt_hci_cmd_le_past *cmd = data;
 
 	print_field("Connection handle: %d", cmd->handle);
 	print_field("Service data: 0x%4.4x", cmd->service_data);
 	print_field("Sync handle: %d", cmd->sync_handle);
 }
 
-static void le_pa_set_info_trans(uint16_t index, const void *data, uint8_t size)
+static void le_past_set_info(uint16_t index, const void *data, uint8_t size)
 {
-	const struct bt_hci_cmd_pa_set_info_trans *cmd = data;
+	const struct bt_hci_cmd_le_past_set_info *cmd = data;
 
 	print_field("Connection handle: %d", cmd->handle);
 	print_field("Service data: 0x%4.4x", cmd->service_data);
@@ -8628,6 +8628,10 @@ static void print_sync_mode(uint8_t mode)
 	case 0x02:
 		str = "Enabled with report events enabled";
 		break;
+	case 0x03:
+		str = "Enabled with report events enabled with duplicate "
+			"filtering";
+		break;
 	default:
 		str = "RFU";
 		break;
@@ -8636,10 +8640,10 @@ static void print_sync_mode(uint8_t mode)
 	print_field("Mode: %s (0x%2.2x)", str, mode);
 }
 
-static void le_pa_sync_trans_params(uint16_t index, const void *data,
+static void le_past_params(uint16_t index, const void *data,
 							uint8_t size)
 {
-	const struct bt_hci_cmd_pa_sync_trans_params *cmd = data;
+	const struct bt_hci_cmd_le_past_params *cmd = data;
 
 	print_field("Connection handle: %d", cmd->handle);
 	print_sync_mode(cmd->mode);
@@ -8650,10 +8654,10 @@ static void le_pa_sync_trans_params(uint16_t index, const void *data,
 	print_create_sync_cte_type(cmd->cte_type);
 }
 
-static void le_set_default_pa_sync_trans_params(uint16_t index,
+static void le_set_default_past_params(uint16_t index,
 						const void *data, uint8_t size)
 {
-	const struct bt_hci_cmd_default_pa_sync_trans_params *cmd = data;
+	const struct bt_hci_cmd_le_default_past_params *cmd = data;
 
 	print_sync_mode(cmd->mode);
 	print_field("Skip: 0x%2.2x", cmd->skip);
@@ -10492,17 +10496,17 @@ static const struct opcode_data opcode_table[] = {
 				le_pa_rec_enable, 3, true,
 				status_rsp, 1, true },
 	{ 0x205a, 326, "LE Periodic Advertising Sync Transfer",
-				le_pa_sync_trans, 6, true,
+				le_past, 6, true,
 				status_handle_rsp, 3, true },
 	{ 0x205b, 327, "LE Periodic Advertising Set Info Transfer",
-				le_pa_set_info_trans, 5, true,
+				le_past_set_info, 5, true,
 				status_handle_rsp, 3, true },
 	{ 0x205c, 328, "LE Periodic Advertising Sync Transfer Parameters",
-				le_pa_sync_trans_params, 8, true,
+				le_past_params, 8, true,
 				status_handle_rsp, 3, true},
 	{ 0x205d, 329, "LE Set Default Periodic Advertisng Sync Transfer "
 				"Parameters",
-				le_set_default_pa_sync_trans_params,
+				le_set_default_past_params,
 				6, true, status_rsp, 1, true},
 	{ BT_HCI_CMD_LE_READ_BUFFER_SIZE_V2,
 				BT_HCI_BIT_LE_READ_BUFFER_SIZE_V2,
@@ -12383,10 +12387,10 @@ static void le_cte_request_failed_evt(struct timeval *tv, uint16_t index,
 	print_field("Connection handle: %d", evt->handle);
 }
 
-static void le_pa_sync_trans_rec_evt(struct timeval *tv, uint16_t index,
+static void le_past_received_evt(struct timeval *tv, uint16_t index,
 					const void *data, uint8_t size)
 {
-	const struct bt_hci_evt_le_pa_sync_trans_rec *evt = data;
+	const struct bt_hci_evt_le_past_recv *evt = data;
 
 	print_status(evt->status);
 	print_field("Handle: %d", evt->handle);
@@ -13283,9 +13287,10 @@ static const struct subevent_data le_meta_event_table[] = {
 				le_chan_select_alg_evt, 3, true},
 	{ 0x17, "LE CTE Request Failed",
 				le_cte_request_failed_evt, 3, true},
-	{ 0x18, "LE Periodic Advertising Sync Transfer Received",
-					le_pa_sync_trans_rec_evt, 19,
-					true},
+	{ BT_HCI_EVT_LE_PAST_RECEIVED,
+			"LE Periodic Advertising Sync Transfer Received",
+			le_past_received_evt, 19,
+			true},
 	{ BT_HCI_EVT_LE_CIS_ESTABLISHED,
 				"LE Connected Isochronous Stream Established",
 				le_cis_established_evt,
-- 
2.51.0


