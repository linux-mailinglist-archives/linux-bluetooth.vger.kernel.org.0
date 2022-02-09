Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 446C74AEDF5
	for <lists+linux-bluetooth@lfdr.de>; Wed,  9 Feb 2022 10:25:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232475AbiBIJZl (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 9 Feb 2022 04:25:41 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:46292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbiBIJZj (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 9 Feb 2022 04:25:39 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E179E0AFABD
        for <linux-bluetooth@vger.kernel.org>; Wed,  9 Feb 2022 01:25:34 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id d187so3191388pfa.10
        for <linux-bluetooth@vger.kernel.org>; Wed, 09 Feb 2022 01:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vPPhLL1Y+5vlVmq9MDz6NaYxXuKrQj6x7ivKO7F9Q0E=;
        b=cT1i5PN+Ih/xYpIKX+SNjKeFCK3JSrlJqy3V3VAYK+s5c9jNzVRxg3uc2/YvwRmMbX
         6rcxD7HKbk7BJXIXr1+NEtDLnDauR5vTlv0WWfq7nPeapxC0fLV4ek7fzdoxL91mBvbw
         zn2MPadp8aqyqtlPI+dM/Sbjn4nzCX4Qnb3mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vPPhLL1Y+5vlVmq9MDz6NaYxXuKrQj6x7ivKO7F9Q0E=;
        b=3v6wLm0HhVk9OXdM43rjQSawwlf4l4+1ZsUzD9azVdi04IgElbhtlsojAqN1sfB7m1
         MNO0gJBnYp3V3S3rNHAdoRWaZFIK7a17mMglvjVwREWjwi1IKrvumldYE/YuYSWahmbR
         RhGhIx6SOV925yXX1jrhIQY0R5jeKpQm5XSeozdkasf0++TsQ/3u13qvfC1px6dIAKh1
         sA4ovdjRV70xoaaTyFFgsZ2/Qx3e12dZGA/YJ0j19UYMzqIm/AEBfP2KnQwVx61crZiM
         h7VFhbZDbulVPYYUaV+ABiWckaf8fmRbjxSjOfOOJObwX8BIT07tblwfrWlc+vmbkBab
         oTEA==
X-Gm-Message-State: AOAM533l5+xNkLem+sdRCWSi/UCb34dJg567KUlclkTatAxBONHdu2EN
        NY5X43jVa97wEKMB7zW0yEo5ND1q7JHHHw==
X-Google-Smtp-Source: ABdhPJwHcJnCRmwCMp20pOJiz3919ZdRzTja+NqC7cPelqneic1zKoYvn5B8dciOrqjk51HIl3v8Fg==
X-Received: by 2002:a63:2a86:: with SMTP id q128mr1179143pgq.53.1644398667110;
        Wed, 09 Feb 2022 01:24:27 -0800 (PST)
Received: from localhost (174.71.80.34.bc.googleusercontent.com. [34.80.71.174])
        by smtp.gmail.com with UTF8SMTPSA id b12sm18192936pfm.154.2022.02.09.01.24.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Feb 2022 01:24:26 -0800 (PST)
From:   Joseph Hwang <josephsih@chromium.org>
To:     linux-bluetooth@vger.kernel.org, marcel@holtmann.org,
        luiz.dentz@gmail.com, pali@kernel.org
Cc:     chromeos-bluetooth-upstreaming@chromium.org, josephsih@google.com,
        Joseph Hwang <josephsih@chromium.org>,
        Archie Pusaka <apusaka@chromium.org>
Subject: [BlueZ PATCH v3 3/9] adapter: support AOSP MGMT_EV_QUALITY_REPORT
Date:   Wed,  9 Feb 2022 17:24:08 +0800
Message-Id: <20220209172328.BlueZ.v3.3.Ie4d1be8ced51f0aa92ee6d8eacf9666a121a1292@changeid>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220209092414.751642-1-josephsih@chromium.org>
References: <20220209092414.751642-1-josephsih@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch supports a new MGMT event of AOSP bluetooth quality report.

Reviewed-by: Archie Pusaka <apusaka@chromium.org>
Signed-off-by: Joseph Hwang <josephsih@chromium.org>
---

(no changes since v2)

Changes in v2:
- The new structs and constants are moved to separate patches:
  * doc: Add Bluetooth quality report event
  * lib: Add structures and constants for quality report
- The btmon decoding patches, about 500 lines of code, are ready
  and will be submitted immediately after these patches are accepted.
- Use util_debug instead of defining a new debug function.
- Remove the event printing function.
- The plan about the BQR events is to further expose them to other
  daemons, e.g., an audio daemon to make some smart control, or
  to an UI daemon to display alerts to users.

 Makefile.am       |  3 +-
 src/adapter.c     | 56 +++++++++++++++++++++++++++++
 src/adapter.h     |  2 ++
 src/shared/aosp.c | 90 +++++++++++++++++++++++++++++++++++++++++++++++
 src/shared/aosp.h | 58 ++++++++++++++++++++++++++++++
 5 files changed, 208 insertions(+), 1 deletion(-)
 create mode 100644 src/shared/aosp.c
 create mode 100644 src/shared/aosp.h

diff --git a/Makefile.am b/Makefile.am
index e391d7ae8..baab40369 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -230,7 +230,8 @@ shared_sources = src/shared/io.h src/shared/timeout.h \
 			src/shared/gatt-db.h src/shared/gatt-db.c \
 			src/shared/gap.h src/shared/gap.c \
 			src/shared/log.h src/shared/log.c \
-			src/shared/tty.h
+			src/shared/tty.h \
+			src/shared/aosp.h src/shared/aosp.c
 
 if READLINE
 shared_sources += src/shared/shell.c src/shared/shell.h
diff --git a/src/adapter.c b/src/adapter.c
index 9772e843a..58f8c0298 100644
--- a/src/adapter.c
+++ b/src/adapter.c
@@ -47,6 +47,7 @@
 #include "src/shared/att.h"
 #include "src/shared/gatt-db.h"
 #include "src/shared/timeout.h"
+#include "src/shared/aosp.h"
 
 #include "btio/btio.h"
 #include "btd.h"
@@ -9312,6 +9313,28 @@ static void controller_resume_callback(uint16_t index, uint16_t length,
 	controller_resume_notify(adapter);
 }
 
+static void quality_report_callback(uint16_t index, uint16_t length,
+					const void *param, void *user_data)
+{
+	const struct mgmt_ev_quality_report *ev = param;
+
+	if (!ev)
+		return;
+
+	if (length < sizeof(*ev)) {
+		error("MGMT_EV_QUALITY_REPORT event too small");
+		return;
+	}
+
+	if (ev->quality_spec == QUALITY_SPEC_AOSP_BQR) {
+		if (!process_aosp_quality_report(ev))
+			error("processing aosp quality report");
+	} else {
+		error("quality report spec %u not supported.",
+			ev->quality_spec);
+	}
+}
+
 static void device_blocked_callback(uint16_t index, uint16_t length,
 					const void *param, void *user_data)
 {
@@ -9727,6 +9750,19 @@ static void le_simult_central_peripheral_func(struct btd_adapter *adapter,
 				(void *)le_simult_central_peripheral_uuid.val);
 }
 
+static bool is_exp_feature_uuid_the_same(const void *data,
+							const void *match_data)
+{
+	return memcmp(data, match_data,
+			sizeof(((struct mgmt_exp_uuid *)NULL)->val)) == 0;
+}
+
+bool is_quality_report_supported(struct btd_adapter *adapter)
+{
+	return queue_find(adapter->exps, is_exp_feature_uuid_the_same,
+				(void *)quality_report_uuid.val) != NULL;
+}
+
 static void quality_report_func(struct btd_adapter *adapter, uint8_t action)
 {
 	if (action)
@@ -9882,6 +9918,18 @@ static void read_exp_features(struct btd_adapter *adapter)
 	btd_error(adapter->dev_id, "Failed to read exp features info");
 }
 
+static void quality_report_debug(const char *str, void *user_data)
+{
+	const char *prefix = user_data;
+
+	info("%s%s", prefix, str);
+}
+
+static void quality_set_debug(struct btd_adapter *adapter)
+{
+	aosp_set_debug(quality_report_debug, "quality: ");
+}
+
 static void read_info_complete(uint8_t status, uint16_t length,
 					const void *param, void *user_data)
 {
@@ -10110,6 +10158,11 @@ static void read_info_complete(uint8_t status, uint16_t length,
 						controller_resume_callback,
 						adapter, NULL);
 
+	mgmt_register(adapter->mgmt, MGMT_EV_QUALITY_REPORT,
+						adapter->dev_id,
+						quality_report_callback,
+						adapter, NULL);
+
 	set_dev_class(adapter);
 
 	set_name(adapter, btd_adapter_get_name(adapter));
@@ -10137,6 +10190,9 @@ static void read_info_complete(uint8_t status, uint16_t length,
 	if (btd_adapter_get_powered(adapter))
 		adapter_start(adapter);
 
+	if (is_quality_report_supported(adapter) && getenv("QUALITY_DEBUG"))
+		quality_set_debug(adapter);
+
 	return;
 
 failed:
diff --git a/src/adapter.h b/src/adapter.h
index 35deb1d11..c199e358a 100644
--- a/src/adapter.h
+++ b/src/adapter.h
@@ -266,6 +266,8 @@ enum kernel_features {
 
 bool btd_has_kernel_features(uint32_t feature);
 
+bool is_quality_report_supported(struct btd_adapter *adapter);
+
 bool btd_adapter_set_allowed_uuids(struct btd_adapter *adapter,
 							struct queue *uuids);
 bool btd_adapter_is_uuid_allowed(struct btd_adapter *adapter,
diff --git a/src/shared/aosp.c b/src/shared/aosp.c
new file mode 100644
index 000000000..838babea4
--- /dev/null
+++ b/src/shared/aosp.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+/*
+ *
+ *  BlueZ - Bluetooth protocol stack for Linux
+ *
+ *  Copyright (C) 2021 Google LLC
+ *
+ *
+ *  This program is free software; you can redistribute it and/or
+ *  modify it under the terms of the GNU Lesser General Public
+ *  License as published by the Free Software Foundation; either
+ *  version 2.1 of the License, or (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ *  Lesser General Public License for more details.
+ *
+ */
+
+#include <stddef.h>
+#include <stdio.h>
+#include <stdint.h>
+#include <string.h>
+
+#include "lib/bluetooth.h"
+#include "lib/mgmt.h"
+
+#include "src/shared/aosp.h"
+#include "src/shared/util.h"
+
+static struct {
+	aosp_debug_func_t callback;
+	void *data;
+} aosp_debug;
+
+void aosp_set_debug(aosp_debug_func_t callback, void *user_data)
+{
+	aosp_debug.callback = callback;
+	aosp_debug.data = user_data;
+}
+
+bool process_aosp_quality_report(const struct mgmt_ev_quality_report *ev)
+{
+	const struct aosp_bqr *edata = (struct aosp_bqr *)ev->data;
+	struct aosp_bqr bqr;
+
+	if (edata->subevent_code != 0x58) {
+		util_debug(aosp_debug.callback, aosp_debug.data,
+			"error: %u not AOSP Bluetooth quality report subevent",
+			edata->subevent_code);
+		return false;
+	}
+
+	if (ev->data_len < sizeof(struct aosp_bqr)) {
+		util_debug(aosp_debug.callback, aosp_debug.data,
+			"error: AOSP report size %u too small (expect >= %lu).",
+			ev->data_len, sizeof(struct aosp_bqr));
+		return false;
+	}
+
+	/* Ignore the Vendor Specific Parameter (VSP) field for now
+	 * due to the lack of standard way of reading it.
+	 */
+	bqr.quality_report_id = edata->quality_report_id;
+	bqr.packet_type = edata->packet_type;
+	bqr.conn_handle = btohs(edata->conn_handle);
+	bqr.conn_role = edata->conn_role;
+	bqr.tx_power_level = edata->tx_power_level;
+	bqr.rssi = edata->rssi;
+	bqr.snr = edata->snr;
+	bqr.unused_afh_channel_count = edata->unused_afh_channel_count;
+	bqr.afh_select_unideal_channel_count =
+				edata->afh_select_unideal_channel_count;
+	bqr.lsto = btohs(edata->lsto);
+	bqr.conn_piconet_clock = btohl(edata->conn_piconet_clock);
+	bqr.retransmission_count = btohl(edata->retransmission_count);
+	bqr.no_rx_count = btohl(edata->no_rx_count);
+	bqr.nak_count = btohl(edata->nak_count);
+	bqr.last_tx_ack_timestamp = btohl(edata->last_tx_ack_timestamp);
+	bqr.flow_off_count = btohl(edata->flow_off_count);
+	bqr.last_flow_on_timestamp = btohl(edata->last_flow_on_timestamp);
+	bqr.buffer_overflow_bytes = btohl(edata->buffer_overflow_bytes);
+	bqr.buffer_underflow_bytes = btohl(edata->buffer_underflow_bytes);
+
+	util_debug(aosp_debug.callback, aosp_debug.data,
+		"AOSP report of connection hanle %u received", bqr.conn_handle);
+
+	return true;
+}
diff --git a/src/shared/aosp.h b/src/shared/aosp.h
new file mode 100644
index 000000000..b58aa5e3a
--- /dev/null
+++ b/src/shared/aosp.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/*
+ *
+ *  BlueZ - Bluetooth protocol stack for Linux
+ *
+ *  Copyright (C) 2021 Google LLC
+ *
+ *
+ *  This program is free software; you can redistribute it and/or
+ *  modify it under the terms of the GNU Lesser General Public
+ *  License as published by the Free Software Foundation; either
+ *  version 2.1 of the License, or (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ *  Lesser General Public License for more details.
+ *
+ */
+
+#ifndef __AOSP_H
+#define __AOSP_H
+
+#include <stdbool.h>
+
+struct mgmt_ev_quality_report;
+
+struct aosp_bqr {
+	uint8_t subevent_code;
+	uint8_t quality_report_id;
+	uint8_t packet_type;
+	uint16_t conn_handle;
+	uint8_t conn_role;
+	int8_t tx_power_level;			/* -30  to 20 dbm */
+	int8_t rssi;				/* -127 to 20 dbm */
+	uint8_t snr;				/* db */
+	uint8_t unused_afh_channel_count;
+	uint8_t afh_select_unideal_channel_count;
+	uint16_t lsto;
+	uint32_t conn_piconet_clock;
+	uint32_t retransmission_count;
+	uint32_t no_rx_count;
+	uint32_t nak_count;
+	uint32_t last_tx_ack_timestamp;
+	uint32_t flow_off_count;
+	uint32_t last_flow_on_timestamp;
+	uint32_t buffer_overflow_bytes;
+	uint32_t buffer_underflow_bytes;
+
+	uint8_t vsp[0];			/* Vendor Specific Parameter */
+} __packed;
+
+typedef void (*aosp_debug_func_t)(const char *str, void *user_data);
+void aosp_set_debug(aosp_debug_func_t callback, void *user_data);
+
+bool process_aosp_quality_report(const struct mgmt_ev_quality_report *ev);
+
+#endif /* __AOSP_H */
-- 
2.35.0.263.gb82422642f-goog

