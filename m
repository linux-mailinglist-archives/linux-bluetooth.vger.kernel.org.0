Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7A945E53CA
	for <lists+linux-bluetooth@lfdr.de>; Wed, 21 Sep 2022 21:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbiIUT2b (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 21 Sep 2022 15:28:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbiIUT2b (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 21 Sep 2022 15:28:31 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EEF493509
        for <linux-bluetooth@vger.kernel.org>; Wed, 21 Sep 2022 12:28:29 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id q9-20020a17090a178900b0020265d92ae3so15377619pja.5
        for <linux-bluetooth@vger.kernel.org>; Wed, 21 Sep 2022 12:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=pFaQpN+58Ew1yXxf7ZZcqPkg7eoftlegWi7wf2cZIhg=;
        b=cujMakX9OGXJEMvQGDOYjTFk4NUzoxNQP9Jm/W2gxceBt6A3ZoSO2pEYwtr7++ix6k
         hWhCkN/jGZ3pKH9jU42Jr+wQdj6WI2U+BmQAUasfd66K3CO9tbG3mfXZrjiaCqv0gk7g
         szNRtPQ8SO5316lJaJKysVqOblpbYOGM8bfCu6PH6f9loSvBYCtabTtmZRr4MnvVuss6
         ze293VgUZevsuTsU5jBsBH4wOz9MrjGiOuS2Bzc/kHJhk3sBzI1U1thGIvgAKb9LjaTv
         imUFEQWD2HzpcsM1tuVgPsFQnZVSWevPsU2grYZCP2Wh6KoNtW1l34D1Y1Iy04jUsMaR
         r6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=pFaQpN+58Ew1yXxf7ZZcqPkg7eoftlegWi7wf2cZIhg=;
        b=E/iKPhO4vVbvo6Mga6tRdBEQfi4vFw5/L0Vt5h/xMTtO6AJ7QMitJjroTqkR/6jdHe
         w9iUKH+yVXjYlFd4ZZ5GwrUQEk6v47/rQ88FUB/48jz1eUfm+jIFxIQuvXOU8VeFhFhU
         2si7P9FOY6Ra8Jbp8knO+/+CxMcTII8gkCyMYpCqjmnchffA8JD39ze6JCkRrJcHWUfr
         D/RzyyXbm3nF/06vxw4GRdOpgFSn4qYMijpJSwG9oU94rdHatuKvh1PJjf7AEvm4EjWx
         +DaUWAt1UjZR1yHTO1td0RmyM/jKdEB1j8QBT7qhmfZnBXlLIbjJP9hQArF02IVImA3c
         rEfQ==
X-Gm-Message-State: ACrzQf3WhpWMhQi3a4iLICH1jE0YVS1vMTpNszlJCSXI6uPVCinz35PG
        jK3E0lcR8QP7TQmUbbpAWo0nJU3CFGI=
X-Google-Smtp-Source: AMsMyM6F2VWEhQCC+0W9Fqoniu+jirBy8uBWIgOuGiS7ITWZK0mgWsbaSWb5wsnFkSCFQfVoA+Fi5g==
X-Received: by 2002:a17:90a:4607:b0:202:e22d:4892 with SMTP id w7-20020a17090a460700b00202e22d4892mr10893714pjg.220.1663788508083;
        Wed, 21 Sep 2022 12:28:28 -0700 (PDT)
Received: from han1-NUC8i7BEH.hsd1.or.comcast.net ([2601:1c0:6a80:cc40:4d2d:68d1:8108:63c3])
        by smtp.gmail.com with ESMTPSA id n2-20020a634d42000000b0042a55fb60bbsm2256057pgl.28.2022.09.21.12.28.27
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 12:28:27 -0700 (PDT)
From:   Tedd Ho-Jeong An <hj.tedd.an@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [BlueZ PATCH v2] tools/ioctl-tester - Add ioctl-tester
Date:   Wed, 21 Sep 2022 12:28:26 -0700
Message-Id: <20220921192826.102801-1-hj.tedd.an@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Tedd Ho-Jeong An <tedd.an@intel.com>

This patch adds ioctl-tester which tests the IOCTL commands.

HCI Down
Device List
Device List - Invalid Param 1
Device Info
Reset Stat
Set Link Mode - ACCEPT
Set Link Mode - MASTER
Set Pkt Type - DM
Set Pkt Type - DH
Set Pkt Type - HV
Set Pkt Type - 2-DH
Set Pkt Type - 2-DH
Set Pkt Type - ALL
Set ACL MTU - 1
Set ACL MTU - 2
Set SCO MTU - 1
Set SCO MTU - 2
Block BDADDR - Success
Block BDADDR - Fail
Unblock BDADDR - Success
Unblock BDADDR - Fail
Connection List - No Conn
Connection List
Connection Info
Connection Info - No Connection
Connection Info - Wrong Type
Authentication Info - No Connection
Authentication Info
---
 Makefile.tools       |  11 +-
 tools/ioctl-tester.c | 960 +++++++++++++++++++++++++++++++++++++++++++
 tools/test-runner.c  |   2 +
 3 files changed, 972 insertions(+), 1 deletion(-)
 create mode 100644 tools/ioctl-tester.c

diff --git a/Makefile.tools b/Makefile.tools
index f4b951474..a99d768dc 100644
--- a/Makefile.tools
+++ b/Makefile.tools
@@ -87,7 +87,7 @@ noinst_PROGRAMS += emulator/btvirt emulator/b1ee emulator/hfp \
 					tools/smp-tester tools/hci-tester \
 					tools/rfcomm-tester tools/bnep-tester \
 					tools/userchan-tester tools/iso-tester \
-					tools/mesh-tester
+					tools/mesh-tester tools/ioctl-tester
 
 emulator_btvirt_SOURCES = emulator/main.c monitor/bt.h \
 				emulator/serial.h emulator/serial.c \
@@ -213,6 +213,15 @@ tools_iso_tester_SOURCES = tools/iso-tester.c monitor/bt.h \
 				emulator/smp.c
 tools_iso_tester_LDADD = lib/libbluetooth-internal.la \
 				src/libshared-glib.la $(GLIB_LIBS)
+
+tools_ioctl_tester_SOURCES = tools/ioctl-tester.c monitor/bt.h \
+				emulator/hciemu.h emulator/hciemu.c \
+				emulator/vhci.h emulator/vhci.c \
+				emulator/btdev.h emulator/btdev.c \
+				emulator/bthost.h emulator/bthost.c \
+				emulator/smp.c
+tools_ioctl_tester_LDADD = lib/libbluetooth-internal.la \
+				src/libshared-glib.la $(GLIB_LIBS)
 endif
 
 if TOOLS
diff --git a/tools/ioctl-tester.c b/tools/ioctl-tester.c
new file mode 100644
index 000000000..098b58608
--- /dev/null
+++ b/tools/ioctl-tester.c
@@ -0,0 +1,960 @@
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
+#include <sys/ioctl.h>
+#include <sys/socket.h>
+
+#include <glib.h>
+
+#include "lib/bluetooth.h"
+#include "lib/mgmt.h"
+#include "lib/hci.h"
+#include "lib/hci_lib.h"
+
+#include "monitor/bt.h"
+#include "emulator/bthost.h"
+#include "emulator/hciemu.h"
+
+#include "src/shared/tester.h"
+#include "src/shared/mgmt.h"
+#include "src/shared/util.h"
+
+struct test_data {
+	const void *test_data;
+	int sock_fd;
+	struct hciemu *hciemu;
+	enum hciemu_type hciemu_type;
+	uint8_t client_num;
+	uint16_t hci_dev_id;
+
+	struct mgmt *mgmt;
+	uint16_t mgmt_index;
+	struct mgmt *mgmt_alt;
+	unsigned int mgmt_alt_ev_id;
+
+	uint16_t handle;
+	uint16_t acl_handle;
+	GIOChannel *io;
+	unsigned int io_id[2];
+	int step;
+	bool reconnect;
+
+	int unmet_conditions;
+};
+
+struct ioctl_data {
+	uint32_t cmd;
+	const uint32_t opt;
+	const void *param;
+	int (*cmd_param_func)(void *param, uint32_t *length);
+	int expected_ioctl_err;
+	const void *block_bdaddr;
+	const void *expected_data;
+	int (*expect_data_check_func)(const void *param, uint32_t length);
+};
+
+static void print_debug(const char *str, void *user_data)
+{
+	const char *prefix = user_data;
+
+	tester_print("%s%s", prefix, str);
+}
+
+static void test_add_condition(struct test_data *data)
+{
+	data->unmet_conditions++;
+
+	tester_print("Test condition added, total %d", data->unmet_conditions);
+}
+
+static void test_condition_complete(struct test_data *data)
+{
+	data->unmet_conditions--;
+
+	tester_print("Test condition complete, %d left",
+						data->unmet_conditions);
+
+	if (data->unmet_conditions > 0)
+		return;
+
+	tester_test_passed();
+}
+
+static int update_hci_dev_id(struct test_data *data)
+{
+	struct hci_dev_list_req *dl;
+	struct hci_dev_req *dr;
+	int ret = 0;
+
+	dl = malloc(HCI_MAX_DEV * sizeof(*dr) + sizeof(uint16_t));
+	if (!dl)
+		return -ENOMEM;
+
+	dl->dev_num = HCI_MAX_DEV;
+	dr = dl->dev_req;
+
+	if (ioctl(data->sock_fd, HCIGETDEVLIST, (void *) dl) < 0) {
+		ret = -EIO;
+		goto exit;
+	}
+
+	if (dl->dev_num != 1) {
+		tester_warn("dev num mismatch returned %d:expected 1",
+								dl->dev_num);
+		ret = -ENODEV;
+		goto exit;
+	}
+
+	data->hci_dev_id = dr->dev_id;
+	tester_print("HCI device id: %d", data->hci_dev_id);
+
+exit:
+	free(dl);
+	return ret;
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
+	mgmt_unregister_index(data->mgmt_alt, data->mgmt_index);
+
+	mgmt_unref(data->mgmt);
+	data->mgmt = NULL;
+
+	mgmt_unref(data->mgmt_alt);
+	data->mgmt_alt = NULL;
+
+	tester_post_teardown_complete();
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
+	data->hciemu = hciemu_new(data->hciemu_type);
+	if (!data->hciemu) {
+		tester_warn("Failed to setup HCI emulation");
+		tester_pre_setup_failed();
+	}
+
+	if (tester_use_debug())
+		hciemu_set_debug(data->hciemu, print_debug, "hciemu: ", NULL);
+
+	tester_print("New hciemu instance created");
+
+	data->sock_fd = hci_open_dev(0);
+	if (data->sock_fd < 0) {
+		tester_warn("Failed to open socket for ioctl");
+		tester_pre_setup_failed();
+		return;
+	}
+
+	update_hci_dev_id(data);
+}
+
+static void test_pre_setup(const void *test_data)
+{
+	struct test_data *data = tester_get_data();
+
+	data->mgmt = mgmt_new_default();
+	if (!data->mgmt) {
+		tester_warn("Failed to setup mgmt interface");
+		tester_pre_setup_failed();
+		return;
+	}
+
+	data->mgmt_alt = mgmt_new_default();
+	if (!data->mgmt_alt) {
+		tester_warn("Failed to setup alternate management interface");
+		tester_pre_setup_failed();
+
+		mgmt_unref(data->mgmt);
+		data->mgmt = NULL;
+		return;
+	}
+
+
+	if (tester_use_debug()) {
+		mgmt_set_debug(data->mgmt, print_debug, "mgmt: ", NULL);
+		mgmt_set_debug(data->mgmt_alt, print_debug, "mgmt-alt: ", NULL);
+	}
+
+	mgmt_send(data->mgmt, MGMT_OP_READ_INDEX_LIST, MGMT_INDEX_NONE, 0, NULL,
+					read_index_list_callback, NULL, NULL);
+}
+
+static void test_post_teardown(const void *test_data)
+{
+	struct test_data *data = tester_get_data();
+
+	if (data->sock_fd >= 0) {
+		tester_print("Socket closed");
+		hci_close_dev(data->sock_fd);
+	}
+
+	hciemu_unref(data->hciemu);
+	data->hciemu = NULL;
+}
+
+static void test_data_free(void *test_data)
+{
+	struct test_data *data = test_data;
+
+	// TODO: free any data allocated during pre-setup
+
+	free(data);
+}
+
+#define test_ioctl_full(name, data, setup, func, num) \
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
+#define test_ioctl(name, data, setup, func) \
+	test_ioctl_full(name, data, setup, func, 1)
+
+static void setup_powered_callback(uint8_t status, uint16_t length,
+					const void *param, void *user_data)
+{
+	if (status != MGMT_STATUS_SUCCESS) {
+		tester_setup_failed();
+		return;
+	}
+
+	tester_print("Controller powered on");
+
+	tester_setup_complete();
+}
+
+static void setup_powered(const void *test_data)
+{
+	struct test_data *data = tester_get_data();
+	unsigned char param[] = { 0x01 };
+
+	mgmt_send(data->mgmt, MGMT_OP_SET_BONDABLE, data->mgmt_index,
+				sizeof(param), param, NULL, NULL, NULL);
+
+	mgmt_send(data->mgmt, MGMT_OP_SET_CONNECTABLE, data->mgmt_index,
+				sizeof(param), param, NULL, NULL, NULL);
+
+	mgmt_send(data->mgmt, MGMT_OP_SET_SSP, data->mgmt_index,
+				sizeof(param), param, NULL, NULL, NULL);
+
+	mgmt_send(data->mgmt, MGMT_OP_SET_POWERED, data->mgmt_index,
+					sizeof(param), param,
+					setup_powered_callback, NULL, NULL);
+}
+
+static void setup_add_block_bdaddr(const void *test_data)
+{
+	struct test_data *data = tester_get_data();
+	const struct ioctl_data *ioctl_data = data->test_data;
+
+	if (!ioctl_data->block_bdaddr) {
+		tester_warn("Invalid test data: block bdaddr");
+		tester_setup_failed();
+		return;
+	}
+
+	if (ioctl(data->sock_fd, HCIBLOCKADDR, ioctl_data->block_bdaddr) < 0) {
+		tester_warn("Failed to add block bdaddr");
+		tester_setup_failed();
+		return;
+	}
+
+	tester_print("Added block BDADDR");
+
+	tester_setup_complete();
+}
+
+static int conn_list_empty_check_func(const void *param, uint32_t length)
+{
+	struct test_data *data = tester_get_data();
+	const struct ioctl_data *ioctl_data = data->test_data;
+	const struct hci_conn_list_req *cl_input = ioctl_data->expected_data;
+	const struct hci_conn_list_req *cl = param;
+
+	if (cl->conn_num != cl_input->conn_num)
+		return -1;
+
+	return 0;
+}
+
+static int conn_info_cmd_param_func(void *param, uint32_t *length)
+{
+	struct test_data *data = tester_get_data();
+	const struct ioctl_data *ioctl_data = data->test_data;
+	const struct hci_conn_info_req *cr_input = ioctl_data->param;
+	struct hci_conn_info_req *cr = param;
+
+	memcpy(&cr->bdaddr, &cr_input->bdaddr, sizeof(bdaddr_t));
+	cr->type = cr_input->type;
+
+	return 0;
+}
+
+static int auth_info_cmd_param_func(void *param, uint32_t *length)
+{
+	struct test_data *data = tester_get_data();
+	const struct ioctl_data *ioctl_data = data->test_data;
+	const struct hci_auth_info_req *ar_input = ioctl_data->param;
+	struct hci_auth_info_req *ar = param;
+
+	memcpy(&ar->bdaddr, &ar_input->bdaddr, sizeof(bdaddr_t));
+	if (ar_input->type)
+		ar->type = ar_input->type;
+
+	return 0;
+}
+
+static const struct ioctl_data dev_down = {
+	.cmd = HCIDEVDOWN,
+};
+
+static const struct hci_dev_list_req dev_list_1 = {
+	.dev_num = 0x01,
+	.dev_req = {{
+		.dev_id = 0x00,
+		.dev_opt = 0x04,
+	}},
+};
+
+static const struct ioctl_data dev_list = {
+	.cmd = HCIGETDEVLIST,
+	.expected_data = (void *)&dev_list_1,
+};
+
+static const struct hci_dev_list_req dev_list_invalid_1_param = {
+	.dev_num = 0x00,
+};
+
+static const struct ioctl_data dev_list_invalid_1 = {
+	.cmd = HCIGETDEVLIST,
+	.param = (void *)&dev_list_invalid_1_param,
+	.expected_ioctl_err = EINVAL,
+};
+
+static const struct ioctl_data dev_info = {
+	.cmd = HCIGETDEVINFO,
+};
+
+static const struct ioctl_data reset_stat = {
+	.cmd = HCIDEVRESTAT,
+};
+
+static const struct ioctl_data set_link_mode_master = {
+	.cmd = HCISETLINKMODE,
+	.opt = HCI_LM_MASTER,
+};
+
+static const struct ioctl_data set_link_mode_accept = {
+	.cmd = HCISETLINKMODE,
+	.opt = HCI_LM_ACCEPT,
+};
+
+static const struct ioctl_data set_pkt_type_dm = {
+	.cmd = HCISETPTYPE,
+	.opt = HCI_DM1 | HCI_DM3 | HCI_DM5,
+};
+
+static const struct ioctl_data set_pkt_type_dh = {
+	.cmd = HCISETPTYPE,
+	.opt = HCI_DH1 | HCI_DH3 | HCI_DH5,
+};
+
+static const struct ioctl_data set_pkt_type_hv = {
+	.cmd = HCISETPTYPE,
+	.opt = HCI_HV1 | HCI_HV2 | HCI_HV3,
+};
+
+static const struct ioctl_data set_pkt_type_2dh = {
+	.cmd = HCISETPTYPE,
+	.opt = HCI_2DH1 | HCI_2DH3 | HCI_2DH5,
+};
+
+static const struct ioctl_data set_pkt_type_3dh = {
+	.cmd = HCISETPTYPE,
+	.opt = HCI_3DH1 | HCI_3DH3 | HCI_3DH5,
+};
+
+static const struct ioctl_data set_pkt_type_all = {
+	.cmd = HCISETPTYPE,
+	.opt = HCI_DM1 | HCI_DM3 | HCI_DM5 | HCI_DH1 | HCI_DH3 | HCI_DH5 |
+	       HCI_HV1 | HCI_HV2 | HCI_HV3 | HCI_2DH1 | HCI_2DH3 | HCI_2DH5 |
+	       HCI_3DH1 | HCI_3DH3 | HCI_3DH5,
+};
+
+static const struct ioctl_data set_acl_mtu_1 = {
+	.cmd = HCISETACLMTU,
+	.opt = 0x1 | (0x3FE << 16),
+};
+
+static const struct ioctl_data set_acl_mtu_2 = {
+	.cmd = HCISETACLMTU,
+	.opt = 0x4 | (0x63 << 16),
+};
+
+static const struct ioctl_data set_sco_mtu_1 = {
+	.cmd = HCISETSCOMTU,
+	.opt = 0x1 | (0x3FE << 16),
+};
+
+static const struct ioctl_data set_sco_mtu_2 = {
+	.cmd = HCISETSCOMTU,
+	.opt = 0x4 | (0x63 << 16),
+};
+
+static const uint8_t bdaddr1[] = {
+	0x11, 0x22, 0x33, 0x44, 0x55, 0x66
+};
+
+static const struct ioctl_data block_bdaddr_success = {
+	.cmd = HCIBLOCKADDR,
+	.param = bdaddr1,
+};
+
+static const struct ioctl_data block_bdaddr_fail = {
+	.cmd = HCIBLOCKADDR,
+	.param = bdaddr1,
+	.expected_ioctl_err = EEXIST,
+	.block_bdaddr = bdaddr1,
+};
+
+static const struct ioctl_data unblock_bdaddr_success = {
+	.cmd = HCIUNBLOCKADDR,
+	.param = bdaddr1,
+	.block_bdaddr = bdaddr1,
+};
+
+static const struct ioctl_data unblock_bdaddr_fail = {
+	.cmd = HCIUNBLOCKADDR,
+	.param = bdaddr1,
+	.expected_ioctl_err = ENOENT,
+};
+
+static const struct hci_conn_list_req conn_list_empty = {
+	.dev_id = 0x00,
+	.conn_num = 0x00,
+};
+
+static const struct ioctl_data conn_list_no_conn = {
+	.cmd = HCIGETCONNLIST,
+	.expected_data = (void *)&conn_list_empty,
+	.expect_data_check_func = conn_list_empty_check_func,
+};
+
+static const struct hci_conn_list_req conn_list_req_1 = {
+	.dev_id = 0x00,
+	.conn_num = 0x01,
+	.conn_info = {{
+		.handle = 0x002a,
+		.bdaddr = {{ 0x00, 0x00, 0x01, 0x01, 0xaa, 0x00 }},
+		.type = 0x01,
+		.out = 0x00,
+		.state = 0x0001,
+		.link_mode = 0x00000000,
+	}},
+};
+
+static const struct ioctl_data conn_list = {
+	.cmd = HCIGETCONNLIST,
+	.expected_data = (void *)&conn_list_req_1,
+};
+
+static const struct hci_conn_info_req conn_info_req = {
+	.bdaddr = {{ 0x00, 0x00, 0x01, 0x01, 0xaa, 0x00 }},
+	.type = ACL_LINK,
+	.conn_info = {{
+		.handle = 0x002a,
+		.bdaddr = {{ 0x00, 0x00, 0x01, 0x01, 0xaa, 0x00 }},
+		.type = 0x01,
+		.out = 0x00,
+		.state = 0x0001,
+		.link_mode = 0x00000000,
+	}},
+};
+
+static const struct hci_conn_info_req conn_info_req_acl = {
+	.bdaddr = {{ 0x00, 0x00, 0x01, 0x01, 0xaa, 0x00 }},
+	.type = ACL_LINK,
+};
+
+static const struct hci_conn_info_req conn_info_req_sco = {
+	.bdaddr = {{ 0x00, 0x00, 0x01, 0x01, 0xaa, 0x00 }},
+	.type = SCO_LINK,
+};
+
+static const struct ioctl_data conn_info = {
+	.cmd = HCIGETCONNINFO,
+	.param = (void *)&conn_info_req_acl,
+	.cmd_param_func = conn_info_cmd_param_func,
+	.expected_data = (void *)&conn_info_req,
+};
+
+static const struct ioctl_data conn_info_no_conn = {
+	.cmd = HCIGETCONNINFO,
+	.param = (void *)&conn_info_req_acl,
+	.expected_ioctl_err = ENOENT,
+	.cmd_param_func = conn_info_cmd_param_func,
+};
+
+static const struct ioctl_data conn_info_wrong_type = {
+	.cmd = HCIGETCONNINFO,
+	.param = (void *)&conn_info_req_sco,
+	.expected_ioctl_err = ENOENT,
+	.cmd_param_func = conn_info_cmd_param_func,
+};
+
+static const struct hci_auth_info_req auth_info_req = {
+	.bdaddr = {{ 0x00, 0x00, 0x01, 0x01, 0xaa, 0x00 }},
+};
+
+static const struct hci_auth_info_req auth_info_connected = {
+	.bdaddr = {{ 0x00, 0x00, 0x01, 0x01, 0xaa, 0x00 }},
+	.type = 0x04,
+};
+
+static const struct ioctl_data auth_info_no_conn = {
+	.cmd = HCIGETAUTHINFO,
+	.param = (void *)&auth_info_req,
+	.expected_ioctl_err = ENOENT,
+	.cmd_param_func = auth_info_cmd_param_func,
+};
+
+static const struct ioctl_data auth_info = {
+	.cmd = HCIGETAUTHINFO,
+	.param = (void *)&auth_info_req,
+	.cmd_param_func = auth_info_cmd_param_func,
+	.expected_data = (void *)&auth_info_connected,
+};
+
+/* Allocate the command request parameters based on the command.
+ * returns the allocated request buffer and its length
+ */
+static int test_alloc_cmd_param(void **req, uint32_t *req_len)
+{
+	struct test_data *data = tester_get_data();
+	const struct ioctl_data *ioctl_data = data->test_data;
+	struct hci_dev_req *dr = NULL;
+	struct hci_dev_info *di = NULL;
+	struct hci_dev_list_req *dl = NULL;
+	struct hci_conn_list_req *cl = NULL;
+	struct hci_conn_info *ci = NULL;
+	struct hci_conn_info_req *cr = NULL;
+	struct hci_auth_info_req *ar = NULL;
+	bdaddr_t *bdaddr = NULL;
+	uint32_t len;
+
+	switch (ioctl_data->cmd) {
+	case HCISETAUTH:
+	case HCISETENCRYPT:
+	case HCISETLINKMODE:
+	case HCISETPTYPE:
+	case HCISETACLMTU:
+	case HCISETSCOMTU:
+		len = sizeof(*dr);
+		dr = malloc(len);
+		if (!dr)
+			return -ENOMEM;
+		memset(dr, 0, len);
+		dr->dev_id = data->hci_dev_id;
+		dr->dev_opt = ioctl_data->opt;
+		*req = dr;
+		*req_len = len;
+		break;
+	case HCIGETDEVINFO:
+		len = sizeof(*di);
+		di = malloc(len);
+		if (!di)
+			return -ENOMEM;
+		memset(di, 0, len);
+		di->dev_id = data->hci_dev_id;
+		*req = di;
+		*req_len = len;
+		break;
+	case HCIGETDEVLIST:
+		len = sizeof(*dr) + sizeof(uint16_t);
+		dl = malloc(len);
+		if (!dl)
+			return -ENOMEM;
+		memset(dl, 0, len);
+		dl->dev_num = 1;
+		*req = dl;
+		*req_len = len;
+		break;
+	case HCIGETCONNLIST:
+		len = sizeof(*cl) + sizeof(*ci);
+		cl = malloc(len);
+		if (!cl)
+			return -ENOMEM;
+		memset(cl, 0, len);
+		cl->dev_id = data->hci_dev_id;
+		cl->conn_num = 1;
+		*req = cl;
+		*req_len = len;
+		break;
+	case HCIGETCONNINFO:
+		len = sizeof(*cr) + sizeof(*ci);
+		cr = malloc(len);
+		if (!cr)
+			return -ENOMEM;
+		memset(cr, 0, len);
+		*req = cr;
+		*req_len = len;
+		break;
+	case HCIGETAUTHINFO:
+		len = sizeof(*ar);
+		ar = malloc(len);
+		if (!ar)
+			return -ENOMEM;
+		memset(ar, 0, len);
+		*req = ar;
+		*req_len = len;
+		break;
+	case HCIBLOCKADDR:
+	case HCIUNBLOCKADDR:
+		len = sizeof(bdaddr_t);
+		bdaddr = malloc(len);
+		if (!bdaddr)
+			return -ENOMEM;
+		memset(bdaddr, 0, len);
+		*req = bdaddr;
+		*req_len = len;
+		break;
+	case HCIDEVUP:
+	case HCIDEVDOWN:
+	case HCIDEVRESET:
+	case HCIDEVRESTAT:
+		/* These command uses the HCI dev id for param */
+		return -ENODATA;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void test_ioctl_common(const void *test_data)
+{
+	struct test_data *data = tester_get_data();
+	const struct ioctl_data *ioctl_data = data->test_data;
+	bool use_dev_id = false;
+	void *req = NULL;
+	uint32_t req_len = 0;
+	int ret;
+
+	ret = test_alloc_cmd_param(&req, &req_len);
+	if (ret < 0) {
+		if (ret == -ENODATA)
+			use_dev_id = true;
+		else {
+			tester_warn("Failed to allocate CMD parameter");
+			tester_test_failed();
+			return;
+		}
+	}
+
+	if (ioctl_data->expected_ioctl_err)
+		test_add_condition(data);
+
+	if (ioctl_data->expected_data)
+		test_add_condition(data);
+
+	if (!use_dev_id && ioctl_data->param) {
+		test_add_condition(data);
+		if (ioctl_data->cmd_param_func) {
+			ret = ioctl_data->cmd_param_func(req, &req_len);
+			if (ret) {
+				tester_warn("Failed to update cmd param");
+				tester_test_failed();
+				goto exit_free;
+			}
+		} else
+			memcpy(req, ioctl_data->param, req_len);
+
+		tester_print("Command Parameter is updated");
+		test_condition_complete(data);
+	}
+
+	if (use_dev_id)
+		ret = ioctl(data->sock_fd, ioctl_data->cmd, data->hci_dev_id);
+	else
+		ret = ioctl(data->sock_fd, ioctl_data->cmd, req);
+
+	if (ret < 0) {
+		if (ioctl_data->expected_ioctl_err) {
+			if (errno != ioctl_data->expected_ioctl_err) {
+				tester_warn("Unexpected error: %d expected: %d",
+					errno, ioctl_data->expected_ioctl_err);
+				tester_test_failed();
+				goto exit_free;
+			}
+
+			test_condition_complete(data);
+			tester_print("Received expected error: %d", errno);
+			goto exit_pass;
+		}
+
+		tester_warn("IOCTL failed with error: %d", errno);
+		tester_test_failed();
+		goto exit_free;
+	}
+
+	if (ioctl_data->expected_data && req) {
+		if (ioctl_data->expect_data_check_func)
+			ret = ioctl_data->expect_data_check_func(req, req_len);
+		else
+			ret = memcmp(req, ioctl_data->expected_data, req_len);
+
+		if (ret != 0) {
+			tester_warn("Mismatch expected data");
+			util_hexdump('>', req, req_len, print_debug, "");
+			util_hexdump('!', ioctl_data->expected_data, req_len,
+							print_debug, "");
+			tester_test_failed();
+			goto exit_free;
+		}
+
+		test_condition_complete(data);
+	}
+
+exit_pass:
+	tester_test_passed();
+exit_free:
+	if (req)
+		free(req);
+
+}
+
+static void test_ioctl_connected_event(uint16_t index, uint16_t length,
+					const void *param, void *user_data)
+{
+	struct test_data *data = tester_get_data();
+
+	tester_print("Device Connected");
+
+	test_ioctl_common(data);
+}
+
+static void test_ioctl_connection(const void *test_data)
+{
+	struct test_data *data = tester_get_data();
+	unsigned int id;
+	const uint8_t *central_bdaddr;
+	struct bthost *bthost;
+	uint8_t addr_type;
+
+	tester_print("Registering %s notification",
+					mgmt_evstr(MGMT_EV_DEVICE_CONNECTED));
+	id = mgmt_register(data->mgmt_alt, MGMT_EV_DEVICE_CONNECTED,
+				data->mgmt_index,
+				test_ioctl_connected_event,
+				NULL, NULL);
+	data->mgmt_alt_ev_id = id;
+
+	central_bdaddr = hciemu_get_central_bdaddr(data->hciemu);
+	if (!central_bdaddr) {
+		tester_warn("No central bdaddr");
+		tester_setup_failed();
+		return;
+	}
+
+	addr_type = data->hciemu_type == HCIEMU_TYPE_BREDRLE ? BDADDR_BREDR :
+							BDADDR_LE_PUBLIC;
+	tester_print("ADDR TYPE: %d", addr_type);
+	bthost = hciemu_client_get_host(data->hciemu);
+	bthost_hci_connect(bthost, central_bdaddr, addr_type);
+}
+
+int main(int argc, char *argv[])
+{
+	tester_init(&argc, &argv);
+
+	test_ioctl("HCI Down", &dev_down, NULL, test_ioctl_common);
+
+	test_ioctl("Device List", &dev_list,
+				NULL, test_ioctl_common);
+
+	test_ioctl("Device List - Invalid Param 1", &dev_list_invalid_1,
+				NULL, test_ioctl_common);
+
+	test_ioctl("Device Info", &dev_info,
+				NULL, test_ioctl_common);
+
+	test_ioctl("Reset Stat", &reset_stat,
+				setup_powered, test_ioctl_common);
+
+	test_ioctl("Set Link Mode - ACCEPT", &set_link_mode_accept,
+				NULL, test_ioctl_common);
+
+	test_ioctl("Set Link Mode - MASTER", &set_link_mode_master,
+				NULL, test_ioctl_common);
+
+	test_ioctl("Set Pkt Type - DM", &set_pkt_type_dm,
+				NULL, test_ioctl_common);
+
+	test_ioctl("Set Pkt Type - DH", &set_pkt_type_dh,
+				NULL, test_ioctl_common);
+
+	test_ioctl("Set Pkt Type - HV", &set_pkt_type_hv,
+				NULL, test_ioctl_common);
+
+	test_ioctl("Set Pkt Type - 2-DH", &set_pkt_type_2dh,
+				NULL, test_ioctl_common);
+
+	test_ioctl("Set Pkt Type - 2-DH", &set_pkt_type_3dh,
+				NULL, test_ioctl_common);
+
+	test_ioctl("Set Pkt Type - ALL", &set_pkt_type_all,
+				NULL, test_ioctl_common);
+
+	test_ioctl("Set ACL MTU - 1", &set_acl_mtu_1,
+				NULL, test_ioctl_common);
+
+	test_ioctl("Set ACL MTU - 2", &set_acl_mtu_2,
+				NULL, test_ioctl_common);
+
+	test_ioctl("Set SCO MTU - 1", &set_sco_mtu_1,
+				NULL, test_ioctl_common);
+
+	test_ioctl("Set SCO MTU - 2", &set_sco_mtu_2,
+				NULL, test_ioctl_common);
+
+	test_ioctl("Block BDADDR - Success", &block_bdaddr_success,
+				NULL, test_ioctl_common);
+
+	test_ioctl("Block BDADDR - Fail", &block_bdaddr_fail,
+				setup_add_block_bdaddr, test_ioctl_common);
+
+	test_ioctl("Unblock BDADDR - Success", &unblock_bdaddr_success,
+				setup_add_block_bdaddr, test_ioctl_common);
+
+	test_ioctl("Unblock BDADDR - Fail", &unblock_bdaddr_fail,
+				NULL, test_ioctl_common);
+
+	test_ioctl("Connection List - No Conn", &conn_list_no_conn,
+				NULL, test_ioctl_common);
+
+	test_ioctl("Connection List", &conn_list,
+				setup_powered, test_ioctl_connection);
+
+	test_ioctl("Connection Info", &conn_info,
+				setup_powered, test_ioctl_connection);
+
+	test_ioctl("Connection Info - No Connection", &conn_info_no_conn,
+				setup_powered, test_ioctl_common);
+
+	test_ioctl("Connection Info - Wrong Type", &conn_info_wrong_type,
+				setup_powered, test_ioctl_common);
+
+	test_ioctl("Authentication Info - No Connection", &auth_info_no_conn,
+				setup_powered, test_ioctl_common);
+
+	test_ioctl("Authentication Info", &auth_info,
+				setup_powered, test_ioctl_connection);
+
+	return tester_run();
+}
diff --git a/tools/test-runner.c b/tools/test-runner.c
index e1794e8c1..560d638e4 100644
--- a/tools/test-runner.c
+++ b/tools/test-runner.c
@@ -615,6 +615,7 @@ static const char *test_table[] = {
 	"sco-tester",
 	"iso-tester",
 	"mesh-tester",
+	"ioctl-tester",
 	"bnep-tester",
 	"check-selftest",
 	"tools/mgmt-tester",
@@ -624,6 +625,7 @@ static const char *test_table[] = {
 	"tools/sco-tester",
 	"tools/iso-tester",
 	"tools/mesh-tester",
+	"tools/ioctl-tester",
 	"tools/bnep-tester",
 	"tools/check-selftest",
 	NULL
-- 
2.34.1

