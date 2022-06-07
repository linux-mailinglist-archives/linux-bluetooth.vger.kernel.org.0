Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D59D2533AEF
	for <lists+linux-bluetooth@lfdr.de>; Wed, 25 May 2022 12:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232894AbiEYKus (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 25 May 2022 06:50:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231229AbiEYKun (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 25 May 2022 06:50:43 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14D241C6
        for <linux-bluetooth@vger.kernel.org>; Wed, 25 May 2022 03:50:41 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id v5-20020a17090a7c0500b001df84fa82f8so4677712pjf.5
        for <linux-bluetooth@vger.kernel.org>; Wed, 25 May 2022 03:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jp9tpcW0C2dQUt4wvwkJxbSRqM6ZA2dPiRKIr6RxLwE=;
        b=LoThnp4EXOjarnuZ5lKrHelE2qGF1wXlOsr6WL7ZkNScJOFhbEjk/QvyoP8E0+Af3H
         cOf+Sri9fjzkljlfkLbPgyIYR38ZFaJX90Rh1aS91VPvGqDJRYHeBk3sUceD15tvq6Z2
         Q6mv1qvYR5Q56cUPAfBuFL58lB7tKmQUFe5G0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jp9tpcW0C2dQUt4wvwkJxbSRqM6ZA2dPiRKIr6RxLwE=;
        b=FVL1zf2iQvO0N58vL2uMSXb0HQU4uP4XpAvkYAwFtYJIizqLGx4UtXhhujUtg2Xuho
         TydEeVuWf+HwFlKEnOJVn5Ye1r/k+T9/AzvLQR8SuWmnGBedLhWW9TEBBYrlAcDL2ZR0
         lucGVppBNotbHq8h9RJklHkAphLYuHROy38TLVDI02JU6rXVgyFaXM7Zgglu048Bz2Qk
         5eBlJBDvA3xYcKrXPAoYhE0OfigWn9rcAihrE655a+4VOAaHLxE/7EPG4Ieubi5LBm21
         FTZ43WzVmCHv5A5DPmg5xaqcvKYs6yU2/B4gBHM1ot2I/7PCZDBjNYpNcGP2sLdV2WAQ
         Bw0g==
X-Gm-Message-State: AOAM531Rf+XlPW07uRY5X4nrUe0AmkYo4Tt+apqueYXpbolr82ykVHVv
        pxISYMHOaSw/3zVJdaklu5w5mFzeoB4RAg==
X-Google-Smtp-Source: ABdhPJySz6plU4+3ElYEn722MTVOGFv4TXYvvL34jDsaLBM8g0eELu+aJxpXsUQAGpOkvlttWUaY6Q==
X-Received: by 2002:a17:90b:3b4c:b0:1e0:2c34:fbe8 with SMTP id ot12-20020a17090b3b4c00b001e02c34fbe8mr9843292pjb.70.1653475840254;
        Wed, 25 May 2022 03:50:40 -0700 (PDT)
Received: from localhost (174.71.80.34.bc.googleusercontent.com. [34.80.71.174])
        by smtp.gmail.com with UTF8SMTPSA id w66-20020a628245000000b0050dc7628179sm11012895pfd.83.2022.05.25.03.50.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 May 2022 03:50:40 -0700 (PDT)
From:   Joseph Hwang <josephsih@chromium.org>
To:     linux-bluetooth@vger.kernel.org, marcel@holtmann.org,
        luiz.dentz@gmail.com, pali@kernel.org
Cc:     chromeos-bluetooth-upstreaming@chromium.org, josephsih@google.com,
        Joseph Hwang <josephsih@chromium.org>,
        Archie Pusaka <apusaka@chromium.org>
Subject: [BlueZ PATCH v5 5/8] adapter: support Intel MGMT_EV_QUALITY_REPORT
Date:   Wed, 25 May 2022 18:50:12 +0800
Message-Id: <20220525184842.BlueZ.v5.5.Ifdf5cf89a14b4f293d868910c6cb85e802f7eb9e@changeid>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220525105015.2315987-1-josephsih@chromium.org>
References: <20220525105015.2315987-1-josephsih@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch supports a new MGMT event of Intel telemetry report.

Reviewed-by: Archie Pusaka <apusaka@chromium.org>
---

Changes in v5:
- Remove signed-off-by for user space.
- Re: "I wonder why you do not use subevent->attr as an
  union?" My reply: The subevent->attr is a pointer that points to the
  actual target attribute in either intel_acl_event or intel_sco_event
  (both of which are combined as a union in intel_ext_telemetry_event).
  In this way, we do not need to define the subevent functions for
  the subevents and save lots of code.
- Re: "Is the cast really needed here?"
  My reply: Yes, it is needed. Otherwise, we got a warning:
  "incompatible pointer types [-Wincompatible-pointer-types]"
- Declare "const uint8_t data[];" in struct mgmt_ev_quality_report
  for ev->data in lib/mgmt.h.
- In quality_set_debug(), call intel_set_debug() and aosp_set_debug()
  for both specifications.
- Do not use the circular inclusion protection for src/shared/intel.h

Changes in v4:
- Change QUALITY_SPEC_INTEL_TELEMETRY to QUALITY_SPEC_INTEL.

Changes in v2:
- Remove the event printing function. The btmon decoding
  patches are ready and will be submitted after these
  are accepted.

 Makefile.am        |   3 +-
 src/adapter.c      |   5 +
 src/shared/intel.c | 243 +++++++++++++++++++++++++++++++++++++++++++++
 src/shared/intel.h | 150 ++++++++++++++++++++++++++++
 4 files changed, 400 insertions(+), 1 deletion(-)
 create mode 100644 src/shared/intel.c
 create mode 100644 src/shared/intel.h

diff --git a/Makefile.am b/Makefile.am
index 600d85354..6dc16f226 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -231,7 +231,8 @@ shared_sources = src/shared/io.h src/shared/timeout.h \
 			src/shared/gap.h src/shared/gap.c \
 			src/shared/log.h src/shared/log.c \
 			src/shared/tty.h \
-			src/shared/aosp.h src/shared/aosp.c
+			src/shared/aosp.h src/shared/aosp.c \
+			src/shared/intel.h src/shared/intel.c
 
 if READLINE
 shared_sources += src/shared/shell.c src/shared/shell.h
diff --git a/src/adapter.c b/src/adapter.c
index 537ec3a11..9020f44e6 100644
--- a/src/adapter.c
+++ b/src/adapter.c
@@ -48,6 +48,7 @@
 #include "src/shared/gatt-db.h"
 #include "src/shared/timeout.h"
 #include "src/shared/aosp.h"
+#include "src/shared/intel.h"
 
 #include "btio/btio.h"
 #include "btd.h"
@@ -9209,6 +9210,9 @@ static void quality_report_callback(uint16_t index, uint16_t length,
 	if (ev->quality_spec == QUALITY_SPEC_AOSP) {
 		if (!process_aosp_quality_report(ev))
 			error("processing aosp quality report");
+	} else if (ev->quality_spec == QUALITY_SPEC_INTEL) {
+		if (!process_intel_telemetry_report(ev))
+			error("processing intel telemetry report");
 	} else {
 		error("quality report spec %u not supported.",
 			ev->quality_spec);
@@ -9795,6 +9799,7 @@ static void quality_report_debug(const char *str, void *user_data)
 
 static void quality_set_debug(struct btd_adapter *adapter)
 {
+	intel_set_debug(quality_report_debug, "quality: ");
 	aosp_set_debug(quality_report_debug, "quality: ");
 }
 
diff --git a/src/shared/intel.c b/src/shared/intel.c
new file mode 100644
index 000000000..5d7c0d0ad
--- /dev/null
+++ b/src/shared/intel.c
@@ -0,0 +1,243 @@
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
+#include "src/shared/intel.h"
+#include "src/shared/util.h"
+
+#define COMPANY_ID_INTEL	0x0002
+
+struct intel_ext_telemetry_event tev;
+
+static struct {
+	intel_debug_func_t callback;
+	void *data;
+} intel_debug;
+
+/* Use offsetof to access the attributes of structures. This makes
+ * simple traversing and assigning values to the attributes.
+ */
+#define TELEM_OFFSET(a)		offsetof(struct intel_ext_telemetry_event, a)
+#define TELEM_ATTR(a)		(((uint8_t *)&tev) + TELEM_OFFSET(a))
+
+#define ACL_OFFSET(a)		offsetof(struct intel_acl_event, a)
+#define ACL_ATTR(a)		(((uint8_t *)&tev.conn.acl) + ACL_OFFSET(a))
+#define ACL_ATTR_ARRAY(a, i)	(ACL_ATTR(a) + i * sizeof(tev.conn.acl.a[0]))
+
+#define SCO_OFFSET(a)		offsetof(struct intel_sco_event, a)
+#define SCO_ATTR(a)		(((uint8_t *)&tev.conn.sco) + SCO_OFFSET(a))
+
+static const struct intel_ext_subevent {
+	uint8_t id;
+	uint8_t size;
+	uint8_t elements;
+	uint8_t *attr;  /* address of the attribute in tev */
+} intel_ext_subevent_table[] = {
+	{ 0x01, 1, 1, TELEM_ATTR(telemetry_ev_type) },
+
+	/* ACL audio link quality subevents */
+	{ 0x4a, 2, 1, ACL_ATTR(conn_handle) },
+	{ 0x4b, 4, 1, ACL_ATTR(rx_hec_error) },
+	{ 0x4c, 4, 1, ACL_ATTR(rx_crc_error) },
+	{ 0x4d, 4, 1, ACL_ATTR(packets_from_host) },
+	{ 0x4e, 4, 1, ACL_ATTR(tx_packets) },
+	{ 0x4f, 4, 1, ACL_ATTR_ARRAY(tx_packets_retry, 0) },
+	{ 0x50, 4, 1, ACL_ATTR_ARRAY(tx_packets_retry, 1) },
+	{ 0x51, 4, 1, ACL_ATTR_ARRAY(tx_packets_retry, 2) },
+	{ 0x52, 4, 1, ACL_ATTR_ARRAY(tx_packets_retry, 3) },
+	{ 0x53, 4, 1, ACL_ATTR_ARRAY(tx_packets_retry, 4) },
+	{ 0x54, 4, 1, ACL_ATTR_ARRAY(tx_packets_by_type, 0) },
+	{ 0x55, 4, 1, ACL_ATTR_ARRAY(tx_packets_by_type, 1) },
+	{ 0x56, 4, 1, ACL_ATTR_ARRAY(tx_packets_by_type, 2) },
+	{ 0x57, 4, 1, ACL_ATTR_ARRAY(tx_packets_by_type, 3) },
+	{ 0x58, 4, 1, ACL_ATTR_ARRAY(tx_packets_by_type, 4) },
+	{ 0x59, 4, 1, ACL_ATTR_ARRAY(tx_packets_by_type, 5) },
+	{ 0x5a, 4, 1, ACL_ATTR_ARRAY(tx_packets_by_type, 6) },
+	{ 0x5b, 4, 1, ACL_ATTR_ARRAY(tx_packets_by_type, 7) },
+	{ 0x5c, 4, 1, ACL_ATTR_ARRAY(tx_packets_by_type, 8) },
+	{ 0x5d, 4, 1, ACL_ATTR(rx_packets) },
+	{ 0x5e, 4, 1, ACL_ATTR(link_throughput) },
+	{ 0x5f, 4, 1, ACL_ATTR(max_packet_letency) },
+	{ 0x60, 4, 1, ACL_ATTR(avg_packet_letency) },
+
+	/* SCO/eSCO audio link quality subevents */
+	{ 0x6a, 2, 1, SCO_ATTR(conn_handle) },
+	{ 0x6b, 4, 1, SCO_ATTR(packets_from_host) },
+	{ 0x6c, 4, 1, SCO_ATTR(tx_packets) },
+	{ 0x6d, 4, 1, SCO_ATTR(rx_payload_lost) },
+	{ 0x6e, 4, 1, SCO_ATTR(tx_payload_lost) },
+	{ 0x6f, 4, 5, SCO_ATTR(rx_no_sync_error) },
+	{ 0x70, 4, 5, SCO_ATTR(rx_hec_error) },
+	{ 0x71, 4, 5, SCO_ATTR(rx_crc_error) },
+	{ 0x72, 4, 5, SCO_ATTR(rx_nak_error) },
+	{ 0x73, 4, 5, SCO_ATTR(tx_failed_wifi_coex) },
+	{ 0x74, 4, 5, SCO_ATTR(rx_failed_wifi_coex) },
+	{ 0x75, 4, 1, SCO_ATTR(samples_inserted_by_CDC) },
+	{ 0x76, 4, 1, SCO_ATTR(samples_dropped) },
+	{ 0x77, 4, 1, SCO_ATTR(mute_samples) },
+	{ 0x78, 4, 1, SCO_ATTR(plc_injection) },
+
+	/* end */
+	{ 0x0, 0, 0 }
+};
+
+bool is_manufacturer_intel(uint16_t manufacturer)
+{
+	return manufacturer == COMPANY_ID_INTEL;
+}
+
+void intel_set_debug(intel_debug_func_t callback, void *user_data)
+{
+	intel_debug.callback = callback;
+	intel_debug.data = user_data;
+}
+
+static const struct intel_tlv *process_ext_subevent(
+					struct intel_ext_telemetry_event *tev,
+					const struct intel_tlv *tlv,
+					const struct intel_tlv *last_tlv)
+{
+	const struct intel_tlv *next_tlv = NEXT_TLV(tlv);
+	const struct intel_ext_subevent *subevent = NULL;
+	int i;
+
+	for (i = 0; intel_ext_subevent_table[i].size > 0; i++) {
+		if (intel_ext_subevent_table[i].id == tlv->id) {
+			subevent = &intel_ext_subevent_table[i];
+			break;
+		}
+	}
+
+	if (!subevent) {
+		util_debug(intel_debug.callback, intel_debug.data,
+			"error: unknown Intel telemetry subevent 0x%2.2x",
+			tlv->id);
+		return NULL;
+	}
+
+	if (tlv->length != subevent->size * subevent->elements) {
+		util_debug(intel_debug.callback, intel_debug.data,
+			"error: invalid length %d of subevent 0x%2.2x",
+			tlv->length, tlv->id);
+		return NULL;
+	}
+
+	if (next_tlv > last_tlv) {
+		util_debug(intel_debug.callback, intel_debug.data,
+			"error: subevent 0x%2.2x exceeds the buffer size.",
+			tlv->id);
+		return NULL;
+	}
+
+	/* Assign tlv value to the corresponding attribute of acl/sco struct. */
+	switch (subevent->size) {
+	case 1:
+		*subevent->attr = get_u8(tlv->value);
+		break;
+
+	case 2:
+		*((uint16_t *)subevent->attr) = get_le16(tlv->value);
+		break;
+
+	case 4:
+		if (subevent->elements == 1) {
+			*((uint32_t *)subevent->attr) = get_le32(tlv->value);
+			break;
+		}
+
+		for (i = 0; i < subevent->elements; i++) {
+			/* Both acl and sco structs are __packed such that
+			 * the addresses of array elements can be calculated.
+			 */
+			*((uint32_t *)(subevent->attr + i * subevent->size)) =
+					get_le32((uint32_t *)tlv->value + i);
+		}
+		break;
+
+	default:
+		util_debug(intel_debug.callback, intel_debug.data,
+			"error: subevent id %u: size %u not supported",
+			subevent->id, subevent->size);
+		break;
+
+	}
+
+	switch (subevent->id) {
+	case EXT_EVT_TYPE:
+		/* Only interested in the LINK_QUALITY_REPORT type for now. */
+		if (*subevent->attr != LINK_QUALITY_REPORT)
+			return NULL;
+		break;
+
+	case ACL_CONNECTION_HANDLE:
+		tev->link_type = TELEMETRY_ACL_LINK;
+		break;
+
+	case SCO_CONNECTION_HANDLE:
+		tev->link_type = TELEMETRY_SCO_LINK;
+		break;
+
+	default:
+		break;
+	}
+
+	return next_tlv;
+}
+
+struct intel_telemetry_data {
+	uint16_t vendor_prefix;
+	uint8_t code;
+	uint8_t data[];   /* a number of struct intel_tlv subevents */
+} __packed;
+
+bool process_intel_telemetry_report(const struct mgmt_ev_quality_report *ev)
+{
+	struct intel_telemetry_data *telemetry =
+				(struct intel_telemetry_data *)ev->data;
+
+	/* The telemetry->data points to a number of consecutive tlv.*/
+	const struct intel_tlv *tlv = (const struct intel_tlv *)telemetry->data;
+	const struct intel_tlv *last_tlv =
+			(const struct intel_tlv *)(ev->data + ev->data_len);
+
+	if (telemetry->code != 0x03) {
+		util_debug(intel_debug.callback, intel_debug.data,
+			"error: %u not Intel telemetry sub-opcode",
+			telemetry->code);
+		return false;
+	}
+
+	/* Read every tlv subevent into tev.
+	 * The decoding process terminates normally when tlv == last_tlv.
+	 */
+	memset(&tev, 0, sizeof(tev));
+	while (tlv && tlv < last_tlv)
+		tlv = process_ext_subevent(&tev, tlv, last_tlv);
+
+	/* If the decoding completes successfully, tlv would be non-NULL */
+	return !!tlv;
+}
diff --git a/src/shared/intel.h b/src/shared/intel.h
new file mode 100644
index 000000000..f1c5729ef
--- /dev/null
+++ b/src/shared/intel.h
@@ -0,0 +1,150 @@
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
+#include <stdbool.h>
+
+struct mgmt_ev_quality_report;
+
+enum intel_telemetry_event_type {
+	SYSTEM_EXCEPTION,
+	FATAL_EXCEPTION,
+	DEBUG_EXCEPTION,
+	CONNECTION_EVENT,
+	DISCONNECTION_EVENT,
+	LINK_QUALITY_REPORT,
+};
+
+enum intel_telemetry_link_type {
+	TELEMETRY_UNKNOWN_LINK,
+	TELEMETRY_ACL_LINK,
+	TELEMETRY_SCO_LINK,
+};
+
+/* The subevent indices of the complete list of Intel telemetry subevents. */
+enum intel_subevt_list {
+	EXT_EVT_TYPE = 0x01,
+
+	ACL_CONNECTION_HANDLE = 0x4a,
+	ACL_HEC_ERRORS,
+	ACL_CRC_ERRORS,
+	ACL_PACKETS_FROM_HOST,
+	ACL_TX_PACKETS_TO_AIR,
+	ACL_TX_PACKETS_0_RETRY,
+	ACL_TX_PACKETS_1_RETRY,
+	ACL_TX_PACKETS_2_RETRY,
+	ACL_TX_PACKETS_3_RETRY,
+	ACL_TX_PACKETS_MORE_RETRY,
+	ACL_TX_PACKETS_DH1,
+	ACL_TX_PACKETS_DH3,
+	ACL_TX_PACKETS_DH5,
+	ACL_TX_PACKETS_2DH1,
+	ACL_TX_PACKETS_2DH3,
+	ACL_TX_PACKETS_2DH5,
+	ACL_TX_PACKETS_3DH1,
+	ACL_TX_PACKETS_3DH3,
+	ACL_TX_PACKETS_3DH5,
+	ACL_RX_PACKETS,
+	ACL_LINK_THROUGHPUT,
+	ACL_MAX_PACKET_LATENCY,
+	ACL_AVG_PACKET_LATENCY,
+
+	SCO_CONNECTION_HANDLE = 0x6a,
+	SCO_RX_PACKETS,
+	SCO_TX_PACKETS,
+	SCO_RX_PACKETS_LOST,
+	SCO_TX_PACKETS_LOST,
+	SCO_RX_NO_SYNC_ERROR,
+	SCO_RX_HEC_ERROR,
+	SCO_RX_CRC_ERROR,
+	SCO_RX_NAK_ERROR,
+	SCO_TX_FAILED_BY_WIFI,
+	SCO_RX_FAILED_BY_WIFI,
+	SCO_SAMPLES_INSERTED,
+	SCO_SAMPLES_DROPPED,
+	SCO_MUTE_SAMPLES,
+	SCO_PLC_INJECTION_DATA,
+};
+
+#define INTEL_NUM_SLOTS		5
+#define INTEL_NUM_RETRIES	5
+#define INTEL_NUM_PACKET_TYPES	9
+
+/* An Intel telemetry subevent is of the TLV format.
+ * - id: takes 1 byte. This is the subevent id.
+ * - length: takes 1 byte.
+ * - value: takes |length| bytes.
+ */
+struct intel_tlv {
+	uint8_t id;
+	uint8_t length;
+	uint8_t value[0];
+};
+
+#define TLV_SIZE(tlv) (*((const uint8_t *) tlv + 1) + 2 * sizeof(uint8_t))
+#define NEXT_TLV(tlv) ((const struct intel_tlv *)\
+					((const uint8_t *)tlv + TLV_SIZE(tlv)))
+
+struct intel_acl_event {
+	uint16_t conn_handle;
+	uint32_t rx_hec_error;
+	uint32_t rx_crc_error;
+	uint32_t packets_from_host;
+	uint32_t tx_packets;
+	uint32_t tx_packets_retry[INTEL_NUM_RETRIES];
+	uint32_t tx_packets_by_type[INTEL_NUM_PACKET_TYPES];
+	uint32_t rx_packets;
+	uint32_t link_throughput;
+	uint32_t max_packet_letency;
+	uint32_t avg_packet_letency;
+} __packed;
+
+struct intel_sco_event {
+	uint16_t conn_handle;
+	uint32_t packets_from_host;
+	uint32_t tx_packets;
+	uint32_t rx_payload_lost;
+	uint32_t tx_payload_lost;
+	uint32_t rx_no_sync_error[INTEL_NUM_SLOTS];
+	uint32_t rx_hec_error[INTEL_NUM_SLOTS];
+	uint32_t rx_crc_error[INTEL_NUM_SLOTS];
+	uint32_t rx_nak_error[INTEL_NUM_SLOTS];
+	uint32_t tx_failed_wifi_coex[INTEL_NUM_SLOTS];
+	uint32_t rx_failed_wifi_coex[INTEL_NUM_SLOTS];
+	uint32_t samples_inserted_by_CDC;
+	uint32_t samples_dropped;
+	uint32_t mute_samples;
+	uint32_t plc_injection;
+} __packed;
+
+struct intel_ext_telemetry_event {
+	uint8_t telemetry_ev_type; /* one in enum intel_telemetry_event_type */
+	uint8_t link_type;
+	union {
+		struct intel_sco_event sco;
+		struct intel_acl_event acl;
+	} conn;
+} __packed;
+
+typedef void (*intel_debug_func_t)(const char *str, void *user_data);
+
+bool is_manufacturer_intel(uint16_t manufacturer);
+void intel_set_debug(intel_debug_func_t callback, void *user_data);
+
+bool process_intel_telemetry_report(const struct mgmt_ev_quality_report *ev);
-- 
2.36.1.124.g0e6072fb45-goog

