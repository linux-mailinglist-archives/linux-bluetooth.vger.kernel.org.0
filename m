Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD1E654FFD7
	for <lists+linux-bluetooth@lfdr.de>; Sat, 18 Jun 2022 00:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347292AbiFQWVf (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 17 Jun 2022 18:21:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347915AbiFQWVc (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 17 Jun 2022 18:21:32 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4276361299
        for <linux-bluetooth@vger.kernel.org>; Fri, 17 Jun 2022 15:21:29 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id k12-20020a17090a404c00b001eaabc1fe5dso5727413pjg.1
        for <linux-bluetooth@vger.kernel.org>; Fri, 17 Jun 2022 15:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yC173qfOOM97ylY4IlOwLw99oh2pZ/yxRR+hoogRO54=;
        b=T3XiOR+wvJtewlk8/t7iD3w+mhWz05fkmKsjrg6PSYjkErInF4vnTo3PSMJmKhfY4n
         AJzlNaMmrwHylgNnwqs/NfxrDjAnF9TQX9/FN+SJfH7usP95p4NdvwmQro77vNWICLrj
         WG0B8qr8uN5G+jl1aUZwZ1MjzN/XiSE4j9V1EG4e4guoQMX17K4NnRGKMtPkVnNbvTUS
         iMrQvta9wkv+tenLRkgU4EJrl8eln1X8mZfYx5TaEdhmVzaPM4J44u6V7YLw07oxLfpQ
         eivqPS+TzbVK5SjM4pxN4IK1k3vLMVg6cDAoJqC93CRMbv3zfMHhR7W62K3zR631uCj1
         WVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yC173qfOOM97ylY4IlOwLw99oh2pZ/yxRR+hoogRO54=;
        b=CsTp/qbgvCE3FGJlPL677BNusifcU+j5ZzImQVmR/88d2g44mNnHcf62yn9ErrhXnu
         YG87Z7rAvs1nvf82PF/ZpfnRHrotTd7r5b7DbacwZOdFUOoLaMjCZB3RwUY4U4OEg8HH
         bGGPgi7Zp8wvnEn4kXXigRyxczWUwkPop+8htHUpcyxAMSwzCrJ8El+E50uv3PYrKSgC
         asRkowcx9cikT4LkDU8ImB2k/Nwb5VIcmhcdhFHs1P7Ci9zYtNRbnUnXzjX8pGrih1U+
         4fNkJYKhFVQI8CiKyPs9DWFVN8rudZpwbWhtOJ1GNTfCXy1J9s/PVKcpvWxSkOnUnNaN
         d5Pw==
X-Gm-Message-State: AJIora8A9rPjJMOGi0UGdtLqblCmeTadQ+OwjLblQ8KXHUiu/TZWgrMk
        Ars2e6vLD5WOZE7fGmGnrkQCUNGUzDs=
X-Google-Smtp-Source: AGRyM1vuRNxPgJQ4GC67ekApkID2vqN3HW8Rqw9X2NUQfmUsYa4M5ReaavMBv0ldvcquJ2P5wGLn2w==
X-Received: by 2002:a17:903:44f:b0:168:4d1b:49c3 with SMTP id iw15-20020a170903044f00b001684d1b49c3mr11760431plb.145.1655504487407;
        Fri, 17 Jun 2022 15:21:27 -0700 (PDT)
Received: from lvondent-mobl4.. (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id v9-20020a056a00148900b0051829b1595dsm4165392pfu.130.2022.06.17.15.21.26
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 15:21:26 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [BlueZ PATCH v6 6/8] tools: Add iso-tester
Date:   Fri, 17 Jun 2022 15:21:17 -0700
Message-Id: <20220617222119.1413958-6-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220617222119.1413958-1-luiz.dentz@gmail.com>
References: <20220617222119.1413958-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This adds iso-tester which tests BTPROTO_ISO socket:

Basic Framework - Success
Basic ISO Socket - Success
Basic ISO Get Socket Option - Success
Basic ISO Set Socket Option - Success
ISO QoS 8_1_1 - Success
ISO QoS 8_2_1 - Success
ISO QoS 16_1_1 - Success
ISO QoS 16_2_1 - Success
ISO QoS 16_2_1 CIG 0x01 - Success
ISO QoS 16_2_1 CIG 0x01 CIS 0x01 - Success
ISO QoS 24_1_1 - Success
ISO QoS 24_2_1 - Success
ISO QoS 32_1_1 - Success
ISO QoS 32_2_1 - Success
ISO QoS 44_1_1 - Success
ISO QoS 44_2_1 - Success
ISO QoS 48_1_1 - Success
ISO QoS 48_2_1 - Success
ISO QoS 48_3_1 - Success
ISO QoS 48_4_1 - Success
ISO QoS 48_5_1 - Success
ISO QoS 48_6_1 - Success
ISO QoS 8_1_2 - Success
ISO QoS 8_2_2 - Success
ISO QoS 16_1_2 - Success
ISO QoS 16_2_2 - Success
ISO QoS 24_1_2 - Success
ISO QoS 24_2_2 - Success
ISO QoS 32_1_2 - Success
ISO QoS 32_2_2 - Success
ISO QoS 44_1_2 - Success
ISO QoS 44_2_2 - Success
ISO QoS 48_1_2 - Success
ISO QoS 48_2_2 - Success
ISO QoS 48_3_2 - Success
ISO QoS 48_4_2 - Success
ISO QoS 48_5_2 - Success
ISO QoS 48_6_2 - Success
ISO QoS - Invalid
ISO Connect2 CIG 0x01 - Success
ISO Send - Success
ISO Receive - Success
ISO Defer Receive - Success
ISO Defer Reject - Success
ISO Send and Receive - Success
ISO Broadcaster - Success
ISO Broadcaster BIG 0x01 - Success
ISO Broadcaster BIG 0x01 BIS 0x01 - Success
ISO Broadcaster Receiver - Success
Basic Framework - Success
Basic ISO Socket - Success
Basic ISO Get Socket Option - Success
Basic ISO Set Socket Option - Success
---
 Makefile.tools      |   11 +-
 tools/iso-tester.c  | 1605 +++++++++++++++++++++++++++++++++++++++++++
 tools/test-runner.c |    5 +-
 3 files changed, 1618 insertions(+), 3 deletions(-)
 create mode 100644 tools/iso-tester.c

diff --git a/Makefile.tools b/Makefile.tools
index 4b513366f..f2f82062c 100644
--- a/Makefile.tools
+++ b/Makefile.tools
@@ -86,7 +86,7 @@ noinst_PROGRAMS += emulator/btvirt emulator/b1ee emulator/hfp \
 					tools/l2cap-tester tools/sco-tester \
 					tools/smp-tester tools/hci-tester \
 					tools/rfcomm-tester tools/bnep-tester \
-					tools/userchan-tester
+					tools/userchan-tester tools/iso-tester
 
 emulator_btvirt_SOURCES = emulator/main.c monitor/bt.h \
 				emulator/serial.h emulator/serial.c \
@@ -194,6 +194,15 @@ tools_userchan_tester_SOURCES = tools/userchan-tester.c monitor/bt.h \
 				emulator/smp.c
 tools_userchan_tester_LDADD = lib/libbluetooth-internal.la \
 				src/libshared-glib.la $(GLIB_LIBS)
+
+tools_iso_tester_SOURCES = tools/iso-tester.c monitor/bt.h \
+				emulator/hciemu.h emulator/hciemu.c \
+				emulator/vhci.h emulator/vhci.c \
+				emulator/btdev.h emulator/btdev.c \
+				emulator/bthost.h emulator/bthost.c \
+				emulator/smp.c
+tools_iso_tester_LDADD = lib/libbluetooth-internal.la \
+				src/libshared-glib.la $(GLIB_LIBS)
 endif
 
 if TOOLS
diff --git a/tools/iso-tester.c b/tools/iso-tester.c
new file mode 100644
index 000000000..5036e4ef8
--- /dev/null
+++ b/tools/iso-tester.c
@@ -0,0 +1,1605 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+/*
+ *
+ *  BlueZ - Bluetooth protocol stack for Linux
+ *
+ *  Copyright (C) 2022  Intel Corporation.
+ *
+ */
+
+#ifdef HAVE_CONFIG_H
+#include <config.h>
+#endif
+
+#include <stdlib.h>
+#include <unistd.h>
+#include <errno.h>
+#include <poll.h>
+#include <stdbool.h>
+
+#include <glib.h>
+
+#include "lib/bluetooth.h"
+#include "lib/iso.h"
+#include "lib/mgmt.h"
+
+#include "monitor/bt.h"
+#include "emulator/bthost.h"
+#include "emulator/hciemu.h"
+
+#include "src/shared/tester.h"
+#include "src/shared/mgmt.h"
+#include "src/shared/util.h"
+
+#define QOS_IO(_interval, _latency, _sdu, _phy, _rtn) \
+{ \
+	.interval = _interval, \
+	.latency = _latency, \
+	.sdu = _sdu, \
+	.phy = _phy, \
+	.rtn = _rtn, \
+}
+
+#define QOS_FULL(_cig, _cis, _in, _out) \
+{ \
+	.cig = _cig, \
+	.cis = _cis, \
+	.sca = 0x07, \
+	.packing = 0x00, \
+	.framing = 0x00, \
+	.in = _in, \
+	.out = _out, \
+}
+
+#define QOS(_interval, _latency, _sdu, _phy, _rtn) \
+	QOS_FULL(BT_ISO_QOS_CIG_UNSET, BT_ISO_QOS_CIS_UNSET, \
+		QOS_IO(_interval, _latency, _sdu, _phy, _rtn), \
+		QOS_IO(_interval, _latency, _sdu, _phy, _rtn))
+
+#define QOS_1(_interval, _latency, _sdu, _phy, _rtn) \
+	QOS_FULL(0x01, BT_ISO_QOS_CIS_UNSET, \
+		QOS_IO(_interval, _latency, _sdu, _phy, _rtn), \
+		QOS_IO(_interval, _latency, _sdu, _phy, _rtn))
+
+#define QOS_1_1(_interval, _latency, _sdu, _phy, _rtn) \
+	QOS_FULL(0x01, 0x01, \
+		QOS_IO(_interval, _latency, _sdu, _phy, _rtn), \
+		QOS_IO(_interval, _latency, _sdu, _phy, _rtn))
+
+#define QOS_OUT(_interval, _latency, _sdu, _phy, _rtn) \
+	QOS_FULL(BT_ISO_QOS_CIG_UNSET, BT_ISO_QOS_CIS_UNSET, \
+		{}, QOS_IO(_interval, _latency, _sdu, _phy, _rtn))
+
+#define QOS_OUT_1(_interval, _latency, _sdu, _phy, _rtn) \
+	QOS_FULL(0x01, BT_ISO_QOS_CIS_UNSET, \
+		{}, QOS_IO(_interval, _latency, _sdu, _phy, _rtn))
+
+#define QOS_OUT_1_1(_interval, _latency, _sdu, _phy, _rtn) \
+	QOS_FULL(0x01, 0x01, \
+		{}, QOS_IO(_interval, _latency, _sdu, _phy, _rtn))
+
+#define QOS_IN(_interval, _latency, _sdu, _phy, _rtn) \
+	QOS_FULL(BT_ISO_QOS_CIG_UNSET, BT_ISO_QOS_CIS_UNSET, \
+		QOS_IO(_interval, _latency, _sdu, _phy, _rtn), {})
+
+/* QoS Configuration settings for low latency audio data */
+#define QOS_8_1_1 QOS(7500, 8, 26, 0x02, 2)
+#define QOS_8_2_1 QOS(10000, 10, 30, 0x02, 2)
+#define QOS_16_1_1 QOS(7500, 8, 30, 0x02, 2)
+#define QOS_16_2_1 QOS(10000, 10, 40, 0x02, 2)
+#define QOS_1_16_2_1 QOS_1(10000, 10, 40, 0x02, 2)
+#define QOS_1_1_16_2_1 QOS_1_1(10000, 10, 40, 0x02, 2)
+#define QOS_24_1_1 QOS(7500, 8, 45, 0x02, 2)
+#define QOS_24_2_1 QOS(10000, 10, 60, 0x02, 2)
+#define QOS_32_1_1 QOS(7500, 8, 60, 0x02, 2)
+#define QOS_32_2_1 QOS(10000, 10, 80, 0x02, 2)
+#define QOS_44_1_1 QOS_OUT(8163, 24, 98, 0x02, 5)
+#define QOS_44_2_1 QOS_OUT(10884, 31, 130, 0x02, 5)
+#define QOS_48_1_1 QOS_OUT(7500, 15, 75, 0x02, 5)
+#define QOS_48_2_1 QOS_OUT(10000, 20, 100, 0x02, 5)
+#define QOS_48_3_1 QOS_OUT(7500, 15, 90, 0x02, 5)
+#define QOS_48_4_1 QOS_OUT(10000, 20, 120, 0x02, 5)
+#define QOS_48_5_1 QOS_OUT(7500, 15, 117, 0x02, 5)
+#define QOS_48_6_1 QOS_OUT(10000, 20, 155, 0x02, 5)
+/* QoS Configuration settings for high reliability audio data */
+#define QOS_8_1_2 QOS(7500, 45, 26, 0x02, 41)
+#define QOS_8_2_2 QOS(10000, 60, 30, 0x02, 53)
+#define QOS_16_1_2 QOS(7500, 45, 30, 0x02, 41)
+#define QOS_16_2_2 QOS(10000, 60, 40, 0x02, 47)
+#define QOS_24_1_2 QOS(7500, 45, 45, 0x02, 35)
+#define QOS_24_2_2 QOS(10000, 60, 60, 0x02, 41)
+#define QOS_32_1_2 QOS(7500, 45, 60, 0x02, 29)
+#define QOS_32_2_2 QOS(10000, 60, 80, 0x02, 35)
+#define QOS_44_1_2 QOS_OUT(8163, 54, 98, 0x02, 23)
+#define QOS_44_2_2 QOS_OUT(10884, 71, 130, 0x02, 23)
+#define QOS_48_1_2 QOS_OUT(7500, 45, 75, 0x02, 23)
+#define QOS_48_2_2 QOS_OUT(10000, 60, 100, 0x02, 23)
+#define QOS_48_3_2 QOS_OUT(7500, 45, 90, 0x02, 23)
+#define QOS_48_4_2 QOS_OUT(10000, 60, 120, 0x02, 23)
+#define QOS_48_5_2 QOS_OUT(7500, 45, 117, 0x02, 23)
+#define QOS_48_6_2 QOS_OUT(10000, 60, 155, 0x02, 23)
+
+#define QOS_OUT_16_2_1 QOS_OUT(10000, 10, 40, 0x02, 2)
+#define QOS_OUT_1_16_2_1 QOS_OUT_1(10000, 10, 40, 0x02, 2)
+#define QOS_OUT_1_1_16_2_1 QOS_OUT_1_1(10000, 10, 40, 0x02, 2)
+#define QOS_IN_16_2_1 QOS_IN(10000, 10, 40, 0x02, 2)
+
+struct test_data {
+	const void *test_data;
+	struct mgmt *mgmt;
+	uint16_t mgmt_index;
+	struct hciemu *hciemu;
+	enum hciemu_type hciemu_type;
+	uint16_t handle;
+	uint16_t acl_handle;
+	GIOChannel *io;
+	unsigned int io_id[2];
+	uint8_t client_num;
+	int step;
+};
+
+struct iso_client_data {
+	struct bt_iso_qos qos;
+	int expect_err;
+	struct iovec send;
+	struct iovec recv;
+	bool server;
+	bool bcast;
+	bool defer;
+};
+
+static void mgmt_debug(const char *str, void *user_data)
+{
+	const char *prefix = user_data;
+
+	tester_print("%s%s", prefix, str);
+}
+
+static void read_info_callback(uint8_t status, uint16_t length,
+					const void *param, void *user_data)
+{
+	struct test_data *data = tester_get_data();
+	const struct mgmt_rp_read_info *rp = param;
+	char addr[18];
+	uint16_t manufacturer;
+	uint32_t supported_settings, current_settings;
+
+	tester_print("Read Info callback");
+	tester_print("  Status: 0x%02x", status);
+
+	if (status || !param) {
+		tester_pre_setup_failed();
+		return;
+	}
+
+	ba2str(&rp->bdaddr, addr);
+	manufacturer = btohs(rp->manufacturer);
+	supported_settings = btohl(rp->supported_settings);
+	current_settings = btohl(rp->current_settings);
+
+	tester_print("  Address: %s", addr);
+	tester_print("  Version: 0x%02x", rp->version);
+	tester_print("  Manufacturer: 0x%04x", manufacturer);
+	tester_print("  Supported settings: 0x%08x", supported_settings);
+	tester_print("  Current settings: 0x%08x", current_settings);
+	tester_print("  Class: 0x%02x%02x%02x",
+			rp->dev_class[2], rp->dev_class[1], rp->dev_class[0]);
+	tester_print("  Name: %s", rp->name);
+	tester_print("  Short name: %s", rp->short_name);
+
+	if (strcmp(hciemu_get_address(data->hciemu), addr)) {
+		tester_pre_setup_failed();
+		return;
+	}
+
+	tester_pre_setup_complete();
+}
+
+static void index_added_callback(uint16_t index, uint16_t length,
+					const void *param, void *user_data)
+{
+	struct test_data *data = tester_get_data();
+
+	tester_print("Index Added callback");
+	tester_print("  Index: 0x%04x", index);
+
+	data->mgmt_index = index;
+
+	mgmt_send(data->mgmt, MGMT_OP_READ_INFO, data->mgmt_index, 0, NULL,
+					read_info_callback, NULL, NULL);
+}
+
+static void index_removed_callback(uint16_t index, uint16_t length,
+					const void *param, void *user_data)
+{
+	struct test_data *data = tester_get_data();
+
+	tester_print("Index Removed callback");
+	tester_print("  Index: 0x%04x", index);
+
+	if (index != data->mgmt_index)
+		return;
+
+	mgmt_unregister_index(data->mgmt, data->mgmt_index);
+
+	mgmt_unref(data->mgmt);
+	data->mgmt = NULL;
+
+	tester_post_teardown_complete();
+}
+
+static void hciemu_debug(const char *str, void *user_data)
+{
+	const char *prefix = user_data;
+
+	tester_print("%s%s", prefix, str);
+}
+
+static void read_index_list_callback(uint8_t status, uint16_t length,
+					const void *param, void *user_data)
+{
+	struct test_data *data = tester_get_data();
+
+	tester_print("Read Index List callback");
+	tester_print("  Status: 0x%02x", status);
+
+	if (status || !param) {
+		tester_pre_setup_failed();
+		return;
+	}
+
+	mgmt_register(data->mgmt, MGMT_EV_INDEX_ADDED, MGMT_INDEX_NONE,
+					index_added_callback, NULL, NULL);
+
+	mgmt_register(data->mgmt, MGMT_EV_INDEX_REMOVED, MGMT_INDEX_NONE,
+					index_removed_callback, NULL, NULL);
+
+	data->hciemu = hciemu_new_num(HCIEMU_TYPE_BREDRLE52, data->client_num);
+	if (!data->hciemu) {
+		tester_warn("Failed to setup HCI emulation");
+		tester_pre_setup_failed();
+		return;
+	}
+
+	if (tester_use_debug())
+		hciemu_set_debug(data->hciemu, hciemu_debug, "hciemu: ", NULL);
+
+	tester_print("New hciemu instance created");
+}
+
+static const uint8_t set_iso_socket_param[] = {
+	0x3e, 0xe0, 0xb4, 0xfd, 0xdd, 0xd6, 0x85, 0x98, /* UUID - ISO Socket */
+	0x6a, 0x49, 0xe0, 0x05, 0x88, 0xf1, 0xba, 0x6f,
+	0x01,						/* Action - enable */
+};
+
+static const uint8_t reset_iso_socket_param[] = {
+	0x3e, 0xe0, 0xb4, 0xfd, 0xdd, 0xd6, 0x85, 0x98, /* UUID - ISO Socket */
+	0x6a, 0x49, 0xe0, 0x05, 0x88, 0xf1, 0xba, 0x6f,
+	0x00,						/* Action - disable */
+};
+
+static void set_iso_socket_callback(uint8_t status, uint16_t length,
+					const void *param, void *user_data)
+{
+	if (status != MGMT_STATUS_SUCCESS) {
+		tester_print("ISO socket feature could not be enabled");
+		return;
+	}
+
+	tester_print("ISO socket feature is enabled");
+}
+
+static void test_pre_setup(const void *test_data)
+{
+	struct test_data *data = tester_get_data();
+
+	data->mgmt = mgmt_new_default();
+	if (!data->mgmt) {
+		tester_warn("Failed to setup management interface");
+		tester_pre_setup_failed();
+		return;
+	}
+
+	if (tester_use_debug())
+		mgmt_set_debug(data->mgmt, mgmt_debug, "mgmt: ", NULL);
+
+	mgmt_send(data->mgmt, MGMT_OP_SET_EXP_FEATURE, MGMT_INDEX_NONE,
+		  sizeof(set_iso_socket_param), set_iso_socket_param,
+		  set_iso_socket_callback, NULL, NULL);
+
+	mgmt_send(data->mgmt, MGMT_OP_READ_INDEX_LIST, MGMT_INDEX_NONE, 0, NULL,
+					read_index_list_callback, NULL, NULL);
+}
+
+static void test_post_teardown(const void *test_data)
+{
+	struct test_data *data = tester_get_data();
+
+	mgmt_send(data->mgmt, MGMT_OP_SET_EXP_FEATURE, MGMT_INDEX_NONE,
+		  sizeof(reset_iso_socket_param), reset_iso_socket_param,
+		  NULL, NULL, NULL);
+
+	hciemu_unref(data->hciemu);
+	data->hciemu = NULL;
+}
+
+static void test_data_free(void *test_data)
+{
+	struct test_data *data = test_data;
+
+	if (data->io)
+		g_io_channel_unref(data->io);
+
+	if (data->io_id[0] > 0)
+		g_source_remove(data->io_id[0]);
+
+	if (data->io_id[1] > 0)
+		g_source_remove(data->io_id[1]);
+
+	free(data);
+}
+
+#define test_iso_full(name, data, setup, func, num) \
+	do { \
+		struct test_data *user; \
+		user = new0(struct test_data, 1); \
+		if (!user) \
+			break; \
+		user->hciemu_type = HCIEMU_TYPE_BREDRLE; \
+		user->test_data = data; \
+		user->client_num = num; \
+		tester_add_full(name, data, \
+				test_pre_setup, setup, func, NULL, \
+				test_post_teardown, 2, user, test_data_free); \
+	} while (0)
+
+#define test_iso(name, data, setup, func) \
+	test_iso_full(name, data, setup, func, 1)
+
+#define test_iso2(name, data, setup, func) \
+	test_iso_full(name, data, setup, func, 2)
+
+static const struct iso_client_data connect_8_1_1 = {
+	.qos = QOS_8_1_1,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_8_2_1 = {
+	.qos = QOS_8_2_1,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_16_1_1 = {
+	.qos = QOS_16_1_1,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_16_2_1 = {
+	.qos = QOS_16_2_1,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_1_16_2_1 = {
+	.qos = QOS_1_16_2_1,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_1_1_16_2_1 = {
+	.qos = QOS_1_1_16_2_1,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_24_1_1 = {
+	.qos = QOS_24_1_1,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_24_2_1 = {
+	.qos = QOS_24_2_1,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_32_1_1 = {
+	.qos = QOS_32_1_1,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_32_2_1 = {
+	.qos = QOS_32_2_1,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_44_1_1 = {
+	.qos = QOS_44_1_1,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_44_2_1 = {
+	.qos = QOS_44_2_1,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_48_1_1 = {
+	.qos = QOS_48_1_1,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_48_2_1 = {
+	.qos = QOS_48_2_1,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_48_3_1 = {
+	.qos = QOS_48_3_1,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_48_4_1 = {
+	.qos = QOS_48_4_1,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_48_5_1 = {
+	.qos = QOS_48_5_1,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_48_6_1 = {
+	.qos = QOS_48_6_1,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_8_1_2 = {
+	.qos = QOS_8_1_2,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_8_2_2 = {
+	.qos = QOS_8_2_2,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_16_1_2 = {
+	.qos = QOS_16_1_2,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_16_2_2 = {
+	.qos = QOS_16_2_2,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_24_1_2 = {
+	.qos = QOS_24_1_2,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_24_2_2 = {
+	.qos = QOS_24_2_2,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_32_1_2 = {
+	.qos = QOS_32_1_2,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_32_2_2 = {
+	.qos = QOS_32_2_2,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_44_1_2 = {
+	.qos = QOS_44_1_2,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_44_2_2 = {
+	.qos = QOS_44_2_2,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_48_1_2 = {
+	.qos = QOS_48_1_2,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_48_2_2 = {
+	.qos = QOS_48_2_2,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_48_3_2 = {
+	.qos = QOS_48_3_2,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_48_4_2 = {
+	.qos = QOS_48_4_2,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_48_5_2 = {
+	.qos = QOS_48_5_2,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_48_6_2 = {
+	.qos = QOS_48_6_2,
+	.expect_err = 0
+};
+
+static const struct iso_client_data connect_invalid = {
+	.qos = QOS(0, 0, 0, 0, 0),
+	.expect_err = -EINVAL
+};
+
+static const uint8_t data_16_2_1[40] = { [0 ... 39] = 0xff };
+static const struct iovec send_16_2_1 = {
+	.iov_base = (void *)data_16_2_1,
+	.iov_len = sizeof(data_16_2_1),
+};
+
+static const struct iso_client_data connect_16_2_1_send = {
+	.qos = QOS_16_2_1,
+	.expect_err = 0,
+	.send = send_16_2_1,
+};
+
+static const struct iso_client_data listen_16_2_1_recv = {
+	.qos = QOS_16_2_1,
+	.expect_err = 0,
+	.recv = send_16_2_1,
+	.server = true,
+};
+
+static const struct iso_client_data listen_16_2_1_defer_recv = {
+	.qos = QOS_16_2_1,
+	.expect_err = 0,
+	.recv = send_16_2_1,
+	.server = true,
+	.defer = true,
+};
+
+static const struct iso_client_data listen_16_2_1_defer_reject = {
+	.qos = QOS_16_2_1,
+	.expect_err = -1,
+	.recv = send_16_2_1,
+	.server = true,
+	.defer = true,
+};
+
+static const struct iso_client_data connect_16_2_1_send_recv = {
+	.qos = QOS_16_2_1,
+	.expect_err = 0,
+	.send = send_16_2_1,
+	.recv = send_16_2_1,
+};
+
+static const struct iso_client_data bcast_16_2_1_send = {
+	.qos = QOS_OUT_16_2_1,
+	.expect_err = 0,
+	.send = send_16_2_1,
+	.bcast = true,
+};
+
+static const struct iso_client_data bcast_1_16_2_1_send = {
+	.qos = QOS_OUT_1_16_2_1,
+	.expect_err = 0,
+	.send = send_16_2_1,
+	.bcast = true,
+};
+
+static const struct iso_client_data bcast_1_1_16_2_1_send = {
+	.qos = QOS_OUT_1_1_16_2_1,
+	.expect_err = 0,
+	.send = send_16_2_1,
+	.bcast = true,
+};
+
+static const struct iso_client_data bcast_16_2_1_recv = {
+	.qos = QOS_IN_16_2_1,
+	.expect_err = 0,
+	.recv = send_16_2_1,
+	.bcast = true,
+};
+
+static void client_connectable_complete(uint16_t opcode, uint8_t status,
+					const void *param, uint8_t len,
+					void *user_data)
+{
+	struct test_data *data = user_data;
+	static uint8_t client_num;
+
+	if (opcode != BT_HCI_CMD_LE_SET_EXT_ADV_ENABLE)
+		return;
+
+	tester_print("Client %u set connectable status 0x%02x", client_num,
+								status);
+
+	client_num++;
+
+	if (status)
+		tester_setup_failed();
+	else if (data->client_num == client_num) {
+		tester_setup_complete();
+		client_num = 0;
+	}
+}
+
+static void iso_new_conn(uint16_t handle, void *user_data)
+{
+	struct test_data *data = user_data;
+
+	tester_print("New client connection with handle 0x%04x", handle);
+
+	data->handle = handle;
+}
+
+static void acl_new_conn(uint16_t handle, void *user_data)
+{
+	struct test_data *data = user_data;
+
+	tester_print("New ACL connection with handle 0x%04x", handle);
+
+	data->acl_handle = handle;
+}
+
+static void setup_powered_callback(uint8_t status, uint16_t length,
+					const void *param, void *user_data)
+{
+	struct test_data *data = tester_get_data();
+	const struct iso_client_data *isodata = data->test_data;
+	uint8_t i;
+
+	if (status != MGMT_STATUS_SUCCESS) {
+		tester_setup_failed();
+		return;
+	}
+
+	tester_print("Controller powered on");
+
+	for (i = 0; i < data->client_num; i++) {
+		struct hciemu_client *client;
+		struct bthost *host;
+
+		client = hciemu_get_client(data->hciemu, i);
+		host = hciemu_client_host(client);
+		bthost_set_cmd_complete_cb(host, client_connectable_complete,
+									data);
+		bthost_set_ext_adv_params(host);
+		bthost_set_ext_adv_enable(host, 0x01);
+
+		if (!isodata)
+			continue;
+
+		if (isodata->send.iov_base || isodata->recv.iov_base)
+			bthost_set_iso_cb(host, iso_new_conn, data);
+
+		if (isodata->bcast) {
+			bthost_set_pa_params(host);
+			bthost_set_pa_enable(host, 0x01);
+			bthost_create_big(host, 1);
+		} else if (!isodata->send.iov_base && isodata->recv.iov_base) {
+			const uint8_t *bdaddr;
+
+			bdaddr = hciemu_get_central_bdaddr(data->hciemu);
+			bthost_set_connect_cb(host, acl_new_conn, data);
+			bthost_hci_connect(host, bdaddr, BDADDR_LE_PUBLIC);
+		}
+	}
+}
+
+static void setup_powered(const void *test_data)
+{
+	struct test_data *data = tester_get_data();
+	const struct iso_client_data *isodata = data->test_data;
+	unsigned char param[] = { 0x01 };
+
+	tester_print("Powering on controller");
+
+	if (!isodata || !isodata->bcast)
+		mgmt_send(data->mgmt, MGMT_OP_SET_CONNECTABLE, data->mgmt_index,
+					sizeof(param), param,
+					NULL, NULL, NULL);
+
+	mgmt_send(data->mgmt, MGMT_OP_SET_SSP, data->mgmt_index,
+				sizeof(param), param, NULL, NULL, NULL);
+
+	mgmt_send(data->mgmt, MGMT_OP_SET_LE, data->mgmt_index,
+				sizeof(param), param, NULL, NULL, NULL);
+
+	if (isodata && isodata->server && !isodata->bcast)
+		mgmt_send(data->mgmt, MGMT_OP_SET_ADVERTISING,
+				data->mgmt_index, sizeof(param), param, NULL,
+				NULL, NULL);
+
+	mgmt_send(data->mgmt, MGMT_OP_SET_POWERED, data->mgmt_index,
+					sizeof(param), param,
+					setup_powered_callback, NULL, NULL);
+}
+
+static void test_framework(const void *test_data)
+{
+	tester_test_passed();
+}
+
+static void test_socket(const void *test_data)
+{
+	int sk;
+
+	sk = socket(PF_BLUETOOTH, SOCK_SEQPACKET, BTPROTO_ISO);
+	if (sk < 0) {
+		tester_warn("Can't create socket: %s (%d)", strerror(errno),
+									errno);
+		tester_test_abort();
+		return;
+	}
+
+	close(sk);
+
+	tester_test_passed();
+}
+
+static void test_getsockopt(const void *test_data)
+{
+	int sk, err;
+	socklen_t len;
+	struct bt_iso_qos qos;
+
+	sk = socket(PF_BLUETOOTH, SOCK_SEQPACKET, BTPROTO_ISO);
+	if (sk < 0) {
+		tester_warn("Can't create socket: %s (%d)", strerror(errno),
+									errno);
+		tester_test_abort();
+		return;
+	}
+
+	len = sizeof(qos);
+	memset(&qos, 0, len);
+
+	err = getsockopt(sk, SOL_BLUETOOTH, BT_ISO_QOS, &qos, &len);
+	if (err < 0) {
+		tester_warn("Can't get socket option : %s (%d)",
+							strerror(errno), errno);
+		tester_test_failed();
+		goto end;
+	}
+
+	tester_test_passed();
+
+end:
+	close(sk);
+}
+
+static void test_setsockopt(const void *test_data)
+{
+	int sk, err;
+	socklen_t len;
+	struct bt_iso_qos qos = QOS_16_1_2;
+
+	sk = socket(PF_BLUETOOTH, SOCK_SEQPACKET, BTPROTO_ISO);
+	if (sk < 0) {
+		tester_warn("Can't create socket: %s (%d)", strerror(errno),
+									errno);
+		tester_test_abort();
+		goto end;
+	}
+
+	err = setsockopt(sk, SOL_BLUETOOTH, BT_ISO_QOS, &qos, sizeof(qos));
+	if (err < 0) {
+		tester_warn("Can't set socket option : %s (%d)",
+							strerror(errno), errno);
+		tester_test_failed();
+		goto end;
+	}
+
+	len = sizeof(qos);
+	memset(&qos, 0, len);
+
+	err = getsockopt(sk, SOL_BLUETOOTH, BT_ISO_QOS, &qos, &len);
+	if (err < 0) {
+		tester_warn("Can't get socket option : %s (%d)",
+							strerror(errno), errno);
+		tester_test_failed();
+		goto end;
+	}
+
+	tester_test_passed();
+
+end:
+	close(sk);
+}
+
+static int create_iso_sock(struct test_data *data)
+{
+	const uint8_t *master_bdaddr;
+	struct sockaddr_iso addr;
+	int sk, err;
+
+	sk = socket(PF_BLUETOOTH, SOCK_SEQPACKET | SOCK_NONBLOCK, BTPROTO_ISO);
+	if (sk < 0) {
+		err = -errno;
+		tester_warn("Can't create socket: %s (%d)", strerror(errno),
+									errno);
+		return -EPROTONOSUPPORT;
+	}
+
+	master_bdaddr = hciemu_get_central_bdaddr(data->hciemu);
+	if (!master_bdaddr) {
+		tester_warn("No master bdaddr");
+		return -ENODEV;
+	}
+
+	memset(&addr, 0, sizeof(addr));
+	addr.iso_family = AF_BLUETOOTH;
+	bacpy(&addr.iso_bdaddr, (void *) master_bdaddr);
+	addr.iso_bdaddr_type = BDADDR_LE_PUBLIC;
+
+	if (bind(sk, (struct sockaddr *) &addr, sizeof(addr)) < 0) {
+		err = -errno;
+		tester_warn("Can't bind socket: %s (%d)", strerror(errno),
+									errno);
+		close(sk);
+		return err;
+	}
+
+	return sk;
+}
+
+static const uint8_t base_lc3_16_2_1[] = {
+	0x28, 0x00, 0x00, /* Presentation Delay */
+	0x01, /* Number of Subgroups */
+	0x01, /* Number of BIS */
+	0x06, 0x00, 0x00, 0x00, 0x00, /* Code ID = LC3 (0x06) */
+	0x11, /* Codec Specific Configuration */
+	0x02, 0x01, 0x03, /* 16 KHZ */
+	0x02, 0x02, 0x01, /* 10 ms */
+	0x05, 0x03, 0x01, 0x00, 0x00, 0x00,  /* Front Left */
+	0x03, 0x04, 0x28, 0x00, /* Frame Length 40 bytes */
+	0x04, /* Metadata */
+	0x03, 0x02, 0x02, 0x00, /* Audio Context: Convertional */
+	0x01, /* BIS */
+	0x00, /* Codec Specific Configuration */
+};
+
+static int connect_iso_sock(struct test_data *data, uint8_t num, int sk)
+{
+	const struct iso_client_data *isodata = data->test_data;
+	struct hciemu_client *client;
+	const uint8_t *client_bdaddr = NULL;
+	struct sockaddr_iso addr;
+	char str[18];
+	int err;
+
+	client = hciemu_get_client(data->hciemu, num);
+	if (!client) {
+		tester_warn("No client");
+		return -ENODEV;
+	}
+
+	if (!isodata->bcast) {
+		client_bdaddr = hciemu_client_bdaddr(client);
+		if (!client_bdaddr) {
+			tester_warn("No client bdaddr");
+			return -ENODEV;
+		}
+	} else {
+		err = setsockopt(sk, SOL_BLUETOOTH, BT_ISO_BASE,
+				base_lc3_16_2_1, sizeof(base_lc3_16_2_1));
+		if (err < 0) {
+			tester_warn("Can't set socket BT_ISO_BASE option: "
+					"%s (%d)", strerror(errno), errno);
+			tester_test_failed();
+			return -EINVAL;
+		}
+	}
+
+	err = setsockopt(sk, SOL_BLUETOOTH, BT_ISO_QOS, &isodata->qos,
+						sizeof(isodata->qos));
+	if (err < 0) {
+		tester_warn("Can't set socket BT_ISO_QOS option : %s (%d)",
+							strerror(errno), errno);
+		tester_test_failed();
+		return -EINVAL;
+	}
+
+	memset(&addr, 0, sizeof(addr));
+	addr.iso_family = AF_BLUETOOTH;
+	bacpy(&addr.iso_bdaddr, client_bdaddr ? (void *) client_bdaddr :
+							BDADDR_ANY);
+	addr.iso_bdaddr_type = BDADDR_LE_PUBLIC;
+
+	ba2str(&addr.iso_bdaddr, str);
+
+	tester_print("Connecting to %s...", str);
+
+	err = connect(sk, (struct sockaddr *) &addr, sizeof(addr));
+	if (err < 0 && !(errno == EAGAIN || errno == EINPROGRESS)) {
+		err = -errno;
+		tester_warn("Can't connect socket: %s (%d)", strerror(errno),
+									errno);
+		return err;
+	}
+
+	return 0;
+}
+
+static bool check_io_qos(const struct bt_iso_io_qos *io1,
+				const struct bt_iso_io_qos *io2)
+{
+	if (io1->interval && io2->interval && io1->interval != io2->interval) {
+		tester_warn("Unexpected IO interval: %u != %u",
+				io1->interval, io2->interval);
+		return false;
+	}
+
+	if (io1->latency && io2->latency && io1->latency != io2->latency) {
+		tester_warn("Unexpected IO latency: %u != %u",
+				io1->latency, io2->latency);
+		return false;
+	}
+
+	if (io1->sdu != io2->sdu) {
+		tester_warn("Unexpected IO SDU: %u != %u", io1->sdu, io2->sdu);
+		return false;
+	}
+
+	if (io1->phy && io2->phy && io1->phy != io2->phy) {
+		tester_warn("Unexpected IO PHY: 0x%02x != 0x%02x",
+				io1->phy, io2->phy);
+		return false;
+	}
+
+	if (io1->rtn && io2->rtn && io1->rtn != io2->rtn) {
+		tester_warn("Unexpected IO RTN: %u != %u", io1->rtn, io2->rtn);
+		return false;
+	}
+
+	return true;
+}
+
+static bool check_qos(const struct bt_iso_qos *qos1,
+				const struct bt_iso_qos *qos2)
+{
+	if (qos1->cig != BT_ISO_QOS_CIG_UNSET &&
+			qos2->cig != BT_ISO_QOS_CIG_UNSET &&
+			qos1->cig != qos2->cig) {
+		tester_warn("Unexpected CIG ID: 0x%02x != 0x%02x",
+				qos1->cig, qos2->cig);
+		return false;
+	}
+
+	if (qos1->cis != BT_ISO_QOS_CIS_UNSET &&
+			qos2->cis != BT_ISO_QOS_CIS_UNSET &&
+			qos1->cis != qos2->cis) {
+		tester_warn("Unexpected CIS ID: 0x%02x != 0x%02x",
+				qos1->cis, qos2->cis);
+		return false;
+	}
+
+	if (qos1->packing != qos2->packing) {
+		tester_warn("Unexpected QoS packing: 0x%02x != 0x%02x",
+				qos1->packing, qos2->packing);
+		return false;
+	}
+
+	if (qos1->framing != qos2->framing) {
+		tester_warn("Unexpected QoS framing: 0x%02x != 0x%02x",
+				qos1->framing, qos2->framing);
+		return false;
+	}
+
+	if (!check_io_qos(&qos1->in, &qos2->in)) {
+		tester_warn("Unexpected Input QoS");
+		return false;
+	}
+
+	if (!check_io_qos(&qos1->out, &qos2->out)) {
+		tester_warn("Unexpected Output QoS");
+		return false;
+	}
+
+	return true;
+}
+
+static gboolean iso_recv_data(GIOChannel *io, GIOCondition cond,
+							gpointer user_data)
+{
+	struct test_data *data = user_data;
+	const struct iso_client_data *isodata = data->test_data;
+	int sk = g_io_channel_unix_get_fd(io);
+	ssize_t ret;
+	char buf[1024];
+
+	data->io_id[0] = 0;
+
+	ret = read(sk, buf, isodata->recv.iov_len);
+	if (ret < 0 || isodata->recv.iov_len != (size_t) ret) {
+		tester_warn("Failed to read %zu bytes: %s (%d)",
+				isodata->recv.iov_len, strerror(errno), errno);
+		tester_test_failed();
+		return FALSE;
+	}
+
+	if (memcmp(buf, isodata->recv.iov_base, ret))
+		tester_test_failed();
+	else
+		tester_test_passed();
+
+	return FALSE;
+}
+
+static void iso_recv(struct test_data *data, GIOChannel *io)
+{
+	const struct iso_client_data *isodata = data->test_data;
+	struct bthost *host;
+
+	tester_print("Receive %zu bytes of data", isodata->recv.iov_len);
+
+	if (!data->handle) {
+		tester_warn("ISO handle not set");
+		tester_test_failed();
+		return;
+	}
+
+	host = hciemu_client_get_host(data->hciemu);
+	bthost_send_iso(host, data->handle, &isodata->recv, 1);
+
+	data->io_id[0] = g_io_add_watch(io, G_IO_IN, iso_recv_data, data);
+}
+
+static void bthost_recv_data(const void *buf, uint16_t len, void *user_data)
+{
+	struct test_data *data = user_data;
+	const struct iso_client_data *isodata = data->test_data;
+
+	tester_print("Client received %u bytes of data", len);
+
+	if (isodata->send.iov_len != len ||
+			memcmp(isodata->send.iov_base, buf, len)) {
+		if (!isodata->recv.iov_base)
+			tester_test_failed();
+	} else
+		tester_test_passed();
+}
+
+static void iso_send(struct test_data *data, GIOChannel *io)
+{
+	const struct iso_client_data *isodata = data->test_data;
+	struct bthost *host;
+	ssize_t ret;
+	int sk;
+
+	sk = g_io_channel_unix_get_fd(io);
+
+	tester_print("Writing %zu bytes of data", isodata->send.iov_len);
+
+	host = hciemu_client_get_host(data->hciemu);
+	bthost_add_iso_hook(host, data->handle, bthost_recv_data, data);
+
+	ret = write(sk, isodata->send.iov_base, isodata->send.iov_len);
+	if (ret < 0 || isodata->send.iov_len != (size_t) ret) {
+		tester_warn("Failed to write %zu bytes: %s (%d)",
+				isodata->send.iov_len, strerror(errno), errno);
+		tester_test_failed();
+		return;
+	}
+
+	if (isodata->bcast) {
+		tester_test_passed();
+		return;
+	}
+
+	if (isodata->recv.iov_base)
+		iso_recv(data, io);
+}
+
+static gboolean iso_connect(GIOChannel *io, GIOCondition cond,
+							gpointer user_data)
+{
+	struct test_data *data = tester_get_data();
+	const struct iso_client_data *isodata = data->test_data;
+	int err, sk_err, sk;
+	socklen_t len;
+	struct bt_iso_qos qos;
+
+	sk = g_io_channel_unix_get_fd(io);
+
+	len = sizeof(qos);
+	memset(&qos, 0, len);
+
+	err = getsockopt(sk, SOL_BLUETOOTH, BT_ISO_QOS, &qos, &len);
+	if (err < 0) {
+		tester_warn("Can't get socket option : %s (%d)",
+							strerror(errno), errno);
+		tester_test_failed();
+		return FALSE;
+	}
+
+	if (!check_qos(&qos, &isodata->qos)) {
+		tester_warn("Unexpected QoS parameter");
+		tester_test_failed();
+		return FALSE;
+	}
+
+	len = sizeof(sk_err);
+
+	if (getsockopt(sk, SOL_SOCKET, SO_ERROR, &sk_err, &len) < 0)
+		err = -errno;
+	else
+		err = -sk_err;
+
+	if (err < 0)
+		tester_warn("Connect failed: %s (%d)", strerror(-err), -err);
+	else
+		tester_print("Successfully connected");
+
+	if (-err != isodata->expect_err) {
+		tester_warn("Expect error: %s (%d) != %s (%d)",
+				strerror(-isodata->expect_err),
+				-isodata->expect_err, strerror(-err), -err);
+		tester_test_failed();
+	} else {
+		data->step--;
+		if (data->step)
+			tester_print("Step %u", data->step);
+		else if (isodata->send.iov_base)
+			iso_send(data, io);
+		else if (isodata->recv.iov_base)
+			iso_recv(data, io);
+		else
+			tester_test_passed();
+	}
+
+	return FALSE;
+}
+
+static gboolean iso_connect_cb(GIOChannel *io, GIOCondition cond,
+							gpointer user_data)
+{
+	struct test_data *data = tester_get_data();
+
+	data->io_id[0] = 0;
+
+	return iso_connect(io, cond, user_data);
+}
+
+static gboolean iso_connect2_cb(GIOChannel *io, GIOCondition cond,
+							gpointer user_data)
+{
+	struct test_data *data = tester_get_data();
+
+	data->io_id[1] = 0;
+
+	return iso_connect(io, cond, user_data);
+}
+
+static void setup_connect(struct test_data *data, uint8_t num, GIOFunc func)
+{
+	GIOChannel *io;
+	int sk, err;
+
+	sk = create_iso_sock(data);
+	if (sk < 0) {
+		if (sk == -EPROTONOSUPPORT)
+			tester_test_abort();
+		else
+			tester_test_failed();
+		return;
+	}
+
+	err = connect_iso_sock(data, num, sk);
+	if (err < 0) {
+		const struct iso_client_data *isodata = data->test_data;
+
+		close(sk);
+
+		if (isodata->expect_err == err)
+			tester_test_passed();
+		else
+			tester_test_failed();
+
+		return;
+	}
+
+	io = g_io_channel_unix_new(sk);
+	g_io_channel_set_close_on_unref(io, TRUE);
+
+	data->io_id[num] = g_io_add_watch(io, G_IO_OUT, func, NULL);
+
+	g_io_channel_unref(io);
+
+	tester_print("Connect in progress");
+
+	data->step++;
+}
+
+static void test_connect(const void *test_data)
+{
+	struct test_data *data = tester_get_data();
+
+	setup_connect(data, 0, iso_connect_cb);
+}
+
+static int listen_iso_sock(struct test_data *data)
+{
+	const struct iso_client_data *isodata = data->test_data;
+	const uint8_t *src, *dst;
+	struct sockaddr_iso *addr;
+	int sk, err;
+
+	sk = socket(PF_BLUETOOTH, SOCK_SEQPACKET | SOCK_NONBLOCK, BTPROTO_ISO);
+	if (sk < 0) {
+		err = -errno;
+		tester_warn("Can't create socket: %s (%d)", strerror(errno),
+									errno);
+		return -EPROTONOSUPPORT;
+	}
+
+	src = hciemu_get_central_bdaddr(data->hciemu);
+	if (!src) {
+		tester_warn("No source bdaddr");
+		return -ENODEV;
+	}
+
+	/* Bind to local address */
+	addr = malloc(sizeof(*addr) + sizeof(*addr->iso_bc));
+	memset(addr, 0, sizeof(*addr) + sizeof(*addr->iso_bc));
+	addr->iso_family = AF_BLUETOOTH;
+	bacpy(&addr->iso_bdaddr, (void *) src);
+	addr->iso_bdaddr_type = BDADDR_LE_PUBLIC;
+
+	if (isodata->bcast) {
+		/* Bind to destination address in case of broadcast */
+		dst = hciemu_get_client_bdaddr(data->hciemu);
+		if (!dst) {
+			tester_warn("No source bdaddr");
+			return -ENODEV;
+		}
+		bacpy(&addr->iso_bc->bc_bdaddr, (void *) dst);
+		addr->iso_bc->bc_bdaddr_type = BDADDR_LE_PUBLIC;
+		addr->iso_bc->bc_num_bis = 1;
+		addr->iso_bc->bc_bis[0] = 1;
+
+		err = bind(sk, (struct sockaddr *) addr, sizeof(*addr) +
+						   sizeof(*addr->iso_bc));
+	} else
+		err = bind(sk, (struct sockaddr *) addr, sizeof(*addr));
+
+
+	if (err < 0) {
+		err = -errno;
+		tester_warn("Can't bind socket: %s (%d)", strerror(errno),
+									errno);
+		goto fail;
+	}
+
+	if (isodata->defer) {
+		int opt = 1;
+
+		if (setsockopt(sk, SOL_BLUETOOTH, BT_DEFER_SETUP, &opt,
+							sizeof(opt)) < 0) {
+			tester_print("Can't enable deferred setup: %s (%d)",
+						strerror(errno), errno);
+			goto fail;
+		}
+	}
+
+	if (listen(sk, 10)) {
+		err = -errno;
+		tester_warn("Can't listen socket: %s (%d)", strerror(errno),
+									errno);
+		goto fail;
+	}
+
+	return sk;
+
+fail:
+	close(sk);
+	return err;
+}
+
+static void setup_listen(struct test_data *data, uint8_t num, GIOFunc func)
+{
+	const struct iso_client_data *isodata = data->test_data;
+	GIOChannel *io;
+	int sk;
+
+	sk = listen_iso_sock(data);
+	if (sk < 0) {
+		if (sk == -EPROTONOSUPPORT)
+			tester_test_abort();
+		else
+			tester_test_failed();
+		return;
+	}
+
+	io = g_io_channel_unix_new(sk);
+	g_io_channel_set_close_on_unref(io, TRUE);
+
+	data->io_id[num] = g_io_add_watch(io, G_IO_IN, func, NULL);
+
+	g_io_channel_unref(io);
+
+	tester_print("Listen in progress");
+
+	data->step++;
+
+	if (!isodata->bcast) {
+		struct hciemu_client *client;
+		struct bthost *host;
+
+		if (!data->acl_handle) {
+			tester_print("ACL handle not set");
+			tester_test_failed();
+			return;
+		}
+
+		client = hciemu_get_client(data->hciemu, 0);
+		host = hciemu_client_host(client);
+
+		bthost_set_cig_params(host, 0x01, 0x01);
+		bthost_create_cis(host, 257, data->acl_handle);
+	}
+}
+
+static bool iso_defer_accept(struct test_data *data, GIOChannel *io)
+{
+	int sk;
+	char c;
+	struct pollfd pfd;
+
+	sk = g_io_channel_unix_get_fd(io);
+
+	memset(&pfd, 0, sizeof(pfd));
+	pfd.fd = sk;
+	pfd.events = POLLOUT;
+
+	if (poll(&pfd, 1, 0) < 0) {
+		tester_warn("poll: %s (%d)", strerror(errno), errno);
+		return false;
+	}
+
+	if (!(pfd.revents & POLLOUT)) {
+		if (read(sk, &c, 1) < 0) {
+			tester_warn("read: %s (%d)", strerror(errno), errno);
+			return false;
+		}
+	}
+
+	tester_print("Accept deferred setup");
+
+	data->io = io;
+	data->io_id[0] = g_io_add_watch(io, G_IO_OUT, iso_connect_cb, NULL);
+
+	return true;
+}
+
+static gboolean iso_accept_cb(GIOChannel *io, GIOCondition cond,
+							gpointer user_data)
+{
+	struct test_data *data = tester_get_data();
+	const struct iso_client_data *isodata = data->test_data;
+	int sk, new_sk;
+
+	data->io_id[0] = 0;
+
+	sk = g_io_channel_unix_get_fd(io);
+
+	new_sk = accept(sk, NULL, NULL);
+	if (new_sk < 0) {
+		tester_test_failed();
+		return false;
+	}
+
+	io = g_io_channel_unix_new(new_sk);
+	g_io_channel_set_close_on_unref(io, TRUE);
+
+	if (isodata->defer) {
+		if (isodata->expect_err < 0) {
+			g_io_channel_unref(io);
+			tester_test_passed();
+			return false;
+		}
+
+		if (!iso_defer_accept(data, io)) {
+			tester_warn("Unable to accept deferred setup");
+			tester_test_failed();
+		}
+		return false;
+	}
+
+	return iso_connect(io, cond, user_data);
+}
+
+static void test_listen(const void *test_data)
+{
+	struct test_data *data = tester_get_data();
+
+	setup_listen(data, 0, iso_accept_cb);
+}
+
+static void test_connect2(const void *test_data)
+{
+	struct test_data *data = tester_get_data();
+
+	setup_connect(data, 0, iso_connect_cb);
+	setup_connect(data, 1, iso_connect2_cb);
+}
+
+static void test_bcast(const void *test_data)
+{
+	struct test_data *data = tester_get_data();
+
+	setup_connect(data, 0, iso_connect_cb);
+}
+
+static void test_bcast_recv(const void *test_data)
+{
+	struct test_data *data = tester_get_data();
+
+	setup_listen(data, 0, iso_accept_cb);
+}
+
+int main(int argc, char *argv[])
+{
+	tester_init(&argc, &argv);
+
+	test_iso("Basic Framework - Success", NULL, setup_powered,
+							test_framework);
+
+	test_iso("Basic ISO Socket - Success", NULL, setup_powered,
+							test_socket);
+
+	test_iso("Basic ISO Get Socket Option - Success", NULL, setup_powered,
+							test_getsockopt);
+
+	test_iso("Basic ISO Set Socket Option - Success", NULL, setup_powered,
+							test_setsockopt);
+
+	test_iso("ISO QoS 8_1_1 - Success", &connect_8_1_1, setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 8_2_1 - Success", &connect_8_2_1, setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 16_1_1 - Success", &connect_16_1_1, setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 16_2_1 - Success", &connect_16_2_1, setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 16_2_1 CIG 0x01 - Success", &connect_1_16_2_1,
+							setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 16_2_1 CIG 0x01 CIS 0x01 - Success",
+							&connect_1_1_16_2_1,
+							setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 24_1_1 - Success", &connect_24_1_1, setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 24_2_1 - Success", &connect_24_2_1, setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 32_1_1 - Success", &connect_32_1_1, setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 32_2_1 - Success", &connect_32_2_1, setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 44_1_1 - Success", &connect_44_1_1, setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 44_2_1 - Success", &connect_44_2_1, setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 48_1_1 - Success", &connect_48_1_1, setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 48_2_1 - Success", &connect_48_2_1, setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 48_3_1 - Success", &connect_48_3_1, setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 48_4_1 - Success", &connect_48_4_1, setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 48_5_1 - Success", &connect_48_5_1, setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 48_6_1 - Success", &connect_48_6_1, setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 8_1_2 - Success", &connect_8_1_2, setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 8_2_2 - Success", &connect_8_2_2, setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 16_1_2 - Success", &connect_16_1_2, setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 16_2_2 - Success", &connect_16_2_2, setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 24_1_2 - Success", &connect_24_1_2, setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 24_2_2 - Success", &connect_24_2_2, setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 32_1_2 - Success", &connect_32_1_2, setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 32_2_2 - Success", &connect_32_2_2, setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 44_1_2 - Success", &connect_44_1_2, setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 44_2_2 - Success", &connect_44_2_2, setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 48_1_2 - Success", &connect_48_1_2, setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 48_2_2 - Success", &connect_48_2_2, setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 48_3_2 - Success", &connect_48_3_2, setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 48_4_2 - Success", &connect_48_4_2, setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 48_5_2 - Success", &connect_48_5_2, setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS 48_6_2 - Success", &connect_48_6_2, setup_powered,
+							test_connect);
+
+	test_iso("ISO QoS - Invalid", &connect_invalid, setup_powered,
+							test_connect);
+
+	test_iso2("ISO Connect2 CIG 0x01 - Success", &connect_1_16_2_1,
+							setup_powered,
+							test_connect2);
+
+	test_iso("ISO Send - Success", &connect_16_2_1_send, setup_powered,
+							test_connect);
+
+	test_iso("ISO Receive - Success", &listen_16_2_1_recv, setup_powered,
+							test_listen);
+
+	test_iso("ISO Defer Receive - Success", &listen_16_2_1_defer_recv,
+						setup_powered, test_listen);
+
+	test_iso("ISO Defer Reject - Success", &listen_16_2_1_defer_reject,
+						setup_powered, test_listen);
+
+	test_iso("ISO Send and Receive - Success", &connect_16_2_1_send_recv,
+							setup_powered,
+							test_connect);
+
+	test_iso("ISO Broadcaster - Success", &bcast_16_2_1_send, setup_powered,
+							test_bcast);
+	test_iso("ISO Broadcaster BIG 0x01 - Success", &bcast_1_16_2_1_send,
+							setup_powered,
+							test_bcast);
+	test_iso("ISO Broadcaster BIG 0x01 BIS 0x01 - Success",
+							&bcast_1_1_16_2_1_send,
+							setup_powered,
+							test_bcast);
+
+	test_iso("ISO Broadcaster Receiver - Success", &bcast_16_2_1_recv,
+							setup_powered,
+							test_bcast_recv);
+
+	return tester_run();
+}
diff --git a/tools/test-runner.c b/tools/test-runner.c
index 49fc21325..e252e62a3 100644
--- a/tools/test-runner.c
+++ b/tools/test-runner.c
@@ -192,7 +192,6 @@ static char *const qemu_argv[] = {
 	"-machine", "type=q35,accel=kvm:tcg",
 	"-m", "192M",
 	"-nographic",
-	"-vga", "none",
 	"-net", "none",
 	"-no-acpi",
 	"-no-hpet",
@@ -249,7 +248,7 @@ static void start_qemu(void)
 	snprintf(cmdline, sizeof(cmdline),
 				"console=ttyS0,115200n8 earlyprintk=serial "
 				"rootfstype=9p "
-				"rootflags=trans=virtio,version=9p2000.L "
+				"rootflags=trans=virtio,version=9p2000.u "
 				"acpi=off pci=noacpi noapic quiet ro init=%s "
 				"bluetooth.enable_ecred=1 "
 				"TESTHOME=%s TESTDBUS=%u TESTDAEMON=%u "
@@ -599,6 +598,7 @@ static const char *test_table[] = {
 	"l2cap-tester",
 	"rfcomm-tester",
 	"sco-tester",
+	"iso-tester",
 	"bnep-tester",
 	"check-selftest",
 	"tools/mgmt-tester",
@@ -606,6 +606,7 @@ static const char *test_table[] = {
 	"tools/l2cap-tester",
 	"tools/rfcomm-tester",
 	"tools/sco-tester",
+	"tools/iso-tester",
 	"tools/bnep-tester",
 	"tools/check-selftest",
 	NULL
-- 
2.35.3

