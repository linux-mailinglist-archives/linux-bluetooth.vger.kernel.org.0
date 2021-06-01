Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69C7C397B70
	for <lists+linux-bluetooth@lfdr.de>; Tue,  1 Jun 2021 22:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234888AbhFAUvF (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 1 Jun 2021 16:51:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234756AbhFAUvE (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 1 Jun 2021 16:51:04 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E68D1C061574
        for <linux-bluetooth@vger.kernel.org>; Tue,  1 Jun 2021 13:49:22 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id ei4so387684pjb.3
        for <linux-bluetooth@vger.kernel.org>; Tue, 01 Jun 2021 13:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vG3vlKmnr85VS2IKa47yr3CjfMXuxaqTsrb/TU8AJDM=;
        b=GWV85gIT5cifb8n/ddRKI2R0a40hqDYEL9MuLPHLFF7oR8BUHhptaaTYqWgcOxo1FC
         5L72LfiImX85f4ujuTwkblabgs/A1DSzKua8gKrqcCgUJYLRSHh0WOk2nIQKZDecvKqe
         MgWIIjnXCCGLXH7nZQP5z138XcX3/KHT0NsKQ9ojIZCRZKlooTN0T3cf49xXS0RZtlP4
         wG2rkPkn9RGz+pS2zHcMTR/OlmhUdVVw3IAruZx40jubrCVXyxfISCZdM/yvsfsCDSNo
         rFdszuHDwBsWc6/93MaYAl2deyET7qF2rAcuztzTR8XcX9iheRl+uEgW+Cx5xJsoCTjX
         FmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vG3vlKmnr85VS2IKa47yr3CjfMXuxaqTsrb/TU8AJDM=;
        b=LWJrjzUvOw2hLBhaFUllT+KCjhdsNb5xL0Mn2mkSlM+xwPzqd/1zT7AGhQqhxYyuSZ
         ErOLPFGdoZm2xSlW6UhC95/OYLMgQJ1YfgBx9EbTMa89yK/XFJ6uXKR4VxJzfzJiUFzz
         w9fuvPDRXi6mkRG0ZDv4M5+Q/CWZDO/ja0lyzJlKesz5h36ERYgRsVz7SwfS+YYawRR/
         D16CMqLk8PadfwommR8ECmCgO/c8Rw5Uia9F3NEorZR4pA9JdRDFDhR1qZdGOZ5xA49M
         zhrZYD/n6j9uk88CaC9UANJ+BMxGYmXhevS0u32X7DYgVVwyihwGk+bbzCqsAWTCLZsC
         aeQw==
X-Gm-Message-State: AOAM5310h0cpwvRdiPiPgu0sxX7DnGBG1wM9GvZ+MI6hMDR8u+Vkf/2O
        1hNTeVBhCmrtW+MMyaJxpbXEkiFEhV0=
X-Google-Smtp-Source: ABdhPJzXajz8vj4UfsUYeR0fUGeU+bNoBZThHOSO1HGFAFZvHgnM4N7DI9Zssd7sNYcH+Sy7RUETfg==
X-Received: by 2002:a17:90b:f98:: with SMTP id ft24mr1745575pjb.184.1622580562245;
        Tue, 01 Jun 2021 13:49:22 -0700 (PDT)
Received: from han1-mobl3.intel.com ([2601:1c0:6a01:d830::512a])
        by smtp.gmail.com with ESMTPSA id t20sm11435396pjs.11.2021.06.01.13.49.21
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 13:49:21 -0700 (PDT)
From:   Tedd Ho-Jeong An <hj.tedd.an@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [BlueZ PATCH V2 3/3] tools/mgmt-tester: Add tests for whitelist and resolving list
Date:   Tue,  1 Jun 2021 13:49:18 -0700
Message-Id: <20210601204918.903327-3-hj.tedd.an@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210601204918.903327-1-hj.tedd.an@gmail.com>
References: <20210601204918.903327-1-hj.tedd.an@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Tedd Ho-Jeong An <tedd.an@intel.com>

This patch adds test cases for checking the whitelist and resolving list
HCI commands when the LL Privacy feature is enabled.
---
 tools/mgmt-tester.c | 363 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 363 insertions(+)

diff --git a/tools/mgmt-tester.c b/tools/mgmt-tester.c
index c0faf6efc..02525c905 100644
--- a/tools/mgmt-tester.c
+++ b/tools/mgmt-tester.c
@@ -2066,6 +2066,21 @@ static const struct generic_data start_discovery_valid_param_power_off_1 = {
 	.expect_len = sizeof(start_discovery_bredrle_param),
 };
 
+static const char set_resolv_off_param[] = { 0x00 };
+static const char set_resolv_on_param[] = { 0x01 };
+
+static const struct generic_data start_discovery_ll_privacy_disable_resolv = {
+	.send_opcode = MGMT_OP_START_DISCOVERY,
+	.send_param = start_discovery_le_param,
+	.send_len = sizeof(start_discovery_le_param),
+	.expect_status = MGMT_STATUS_SUCCESS,
+	.expect_param = start_discovery_le_param,
+	.expect_len = sizeof(start_discovery_le_param),
+	.expect_hci_command = BT_HCI_CMD_LE_SET_RESOLV_ENABLE,
+	.expect_hci_param = set_resolv_off_param,
+	.expect_hci_len = sizeof(set_resolv_off_param),
+};
+
 static const char stop_discovery_bredrle_param[] = { 0x07 };
 static const char stop_discovery_bredrle_invalid_param[] = { 0x06 };
 static const char stop_discovery_valid_hci[] = { 0x00, 0x00 };
@@ -4117,6 +4132,71 @@ static const struct generic_data add_device_success_5 = {
 	.expect_hci_len = sizeof(le_scan_enable),
 };
 
+static const uint8_t add_device_success_param_6[] = {
+					0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc,
+					0x01,
+					0x02,
+};
+
+static const uint8_t le_add_to_white_list_param[] = {
+	0x00,					/* Type */
+	0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc,	/* Address */
+};
+static const struct generic_data add_device_success_6 = {
+	.setup_settings = settings_powered_le,
+	.send_opcode = MGMT_OP_ADD_DEVICE,
+	.send_param = add_device_success_param_6,
+	.send_len = sizeof(add_device_success_param_6),
+	.expect_param = add_device_rsp_le,
+	.expect_len = sizeof(add_device_rsp_le),
+	.expect_status = MGMT_STATUS_SUCCESS,
+	.expect_alt_ev = MGMT_EV_DEVICE_ADDED,
+	.expect_alt_ev_param = add_device_success_param_6,
+	.expect_alt_ev_len = sizeof(add_device_success_param_6),
+	.expect_hci_command = BT_HCI_CMD_LE_ADD_TO_WHITE_LIST,
+	.expect_hci_param = le_add_to_white_list_param,
+	.expect_hci_len = sizeof(le_add_to_white_list_param),
+};
+
+static const uint8_t le_add_to_resolv_list_param[] = {
+	0x00,						/* Type */
+	0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc,		/* Address */
+	0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88,	/* Peer IRK */
+	0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88,
+	0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,	/* Local IRK */
+	0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
+};
+
+static const struct generic_data add_device_success_7 = {
+	.send_opcode = MGMT_OP_ADD_DEVICE,
+	.send_param = add_device_success_param_6,
+	.send_len = sizeof(add_device_success_param_6),
+	.expect_param = add_device_rsp_le,
+	.expect_len = sizeof(add_device_rsp_le),
+	.expect_status = MGMT_STATUS_SUCCESS,
+	.expect_alt_ev = MGMT_EV_DEVICE_ADDED,
+	.expect_alt_ev_param = add_device_success_param_6,
+	.expect_alt_ev_len = sizeof(add_device_success_param_6),
+	.expect_hci_command = BT_HCI_CMD_LE_ADD_TO_RESOLV_LIST,
+	.expect_hci_param = le_add_to_resolv_list_param,
+	.expect_hci_len = sizeof(le_add_to_resolv_list_param),
+};
+
+static const struct generic_data add_device_success_8 = {
+	.send_opcode = MGMT_OP_ADD_DEVICE,
+	.send_param = add_device_success_param_6,
+	.send_len = sizeof(add_device_success_param_6),
+	.expect_param = add_device_rsp_le,
+	.expect_len = sizeof(add_device_rsp_le),
+	.expect_status = MGMT_STATUS_SUCCESS,
+	.expect_alt_ev = MGMT_EV_DEVICE_ADDED,
+	.expect_alt_ev_param = add_device_success_param_6,
+	.expect_alt_ev_len = sizeof(add_device_success_param_6),
+	.expect_hci_command = BT_HCI_CMD_LE_SET_RESOLV_ENABLE,
+	.expect_hci_param = set_resolv_on_param,
+	.expect_hci_len = sizeof(set_resolv_on_param),
+};
+
 static const uint8_t remove_device_nval_1[] = {
 					0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc,
 					0xff,
@@ -4225,6 +4305,47 @@ static const struct generic_data remove_device_success_5 = {
 	.expect_alt_ev_len = sizeof(remove_device_param_2),
 };
 
+static const uint8_t remove_device_param_all[7] =  { 0x00 };
+
+static const struct generic_data remove_device_success_6 = {
+	.send_opcode = MGMT_OP_REMOVE_DEVICE,
+	.send_param = remove_device_param_all,
+	.send_len = sizeof(remove_device_param_all),
+	.expect_param = remove_device_param_all,
+	.expect_len = sizeof(remove_device_param_all),
+	.expect_status = MGMT_STATUS_SUCCESS,
+};
+
+static const struct generic_data remove_device_success_7 = {
+	.send_opcode = MGMT_OP_REMOVE_DEVICE,
+	.send_param = remove_device_param_2,
+	.send_len = sizeof(remove_device_param_2),
+	.expect_param = remove_device_param_2,
+	.expect_len = sizeof(remove_device_param_2),
+	.expect_status = MGMT_STATUS_SUCCESS,
+	.expect_hci_command = BT_HCI_CMD_LE_REMOVE_FROM_WHITE_LIST,
+	.expect_hci_param = le_add_to_white_list_param,
+	.expect_hci_len = sizeof(le_add_to_white_list_param),
+	.expect_alt_ev = MGMT_EV_DEVICE_REMOVED,
+	.expect_alt_ev_param = remove_device_param_2,
+	.expect_alt_ev_len = sizeof(remove_device_param_2),
+};
+
+static const struct generic_data remove_device_success_8 = {
+	.send_opcode = MGMT_OP_REMOVE_DEVICE,
+	.send_param = remove_device_param_2,
+	.send_len = sizeof(remove_device_param_2),
+	.expect_param = remove_device_param_2,
+	.expect_len = sizeof(remove_device_param_2),
+	.expect_status = MGMT_STATUS_SUCCESS,
+	.expect_hci_command = BT_HCI_CMD_LE_REMOVE_FROM_RESOLV_LIST,
+	.expect_hci_param = le_add_to_white_list_param,
+	.expect_hci_len = sizeof(le_add_to_white_list_param),
+	.expect_alt_ev = MGMT_EV_DEVICE_REMOVED,
+	.expect_alt_ev_param = remove_device_param_2,
+	.expect_alt_ev_len = sizeof(remove_device_param_2),
+};
+
 static const struct generic_data read_adv_features_invalid_param_test = {
 	.send_opcode = MGMT_OP_READ_ADV_FEATURES,
 	.send_param = dummy_data,
@@ -9218,6 +9339,201 @@ static const struct generic_data set_exp_feat_unknown = {
 	.expect_status = MGMT_STATUS_NOT_SUPPORTED,
 };
 
+static const char load_irks_params[] = { 0x01, 0x00,
+			0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0x01,
+			0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88,
+			0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88 };
+
+
+static void setup_load_irks_callback(uint8_t status, uint16_t length,
+					const void *param, void *user_data)
+{
+	if (status != MGMT_STATUS_SUCCESS) {
+		tester_setup_failed();
+		return;
+	}
+
+	tester_print("Load IRK completed");
+}
+
+static void setup_exp_feat_callback(uint8_t status, uint16_t length,
+					const void *param, void *user_data)
+{
+	if (status != MGMT_STATUS_SUCCESS) {
+		tester_setup_failed();
+		return;
+	}
+
+	tester_print("LL Privacy Exp feature is enabled");
+}
+
+static void setup_ll_privacy(const void *test_data)
+{
+	struct test_data *data = tester_get_data();
+	unsigned char param[] = { 0x01 };
+	const uint8_t *ext_feat_param;
+	size_t ext_feat_len;
+	const char *irk_param;
+	size_t irk_len;
+	unsigned char privacy_param[] = { 0x01,
+			0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
+			0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08 };
+
+	tester_print("Enabling LL Privacy feature");
+
+	ext_feat_param = set_exp_feat_param_ll_privacy;
+	ext_feat_len = sizeof(set_exp_feat_param_ll_privacy);
+
+	irk_param = load_irks_params;
+	irk_len = sizeof(load_irks_params);
+
+	mgmt_send(data->mgmt, MGMT_OP_SET_LE, data->mgmt_index,
+					sizeof(param), &param,
+					NULL, NULL, NULL);
+
+	mgmt_send(data->mgmt, MGMT_OP_SET_PRIVACY, data->mgmt_index,
+					sizeof(privacy_param), privacy_param,
+					NULL, NULL, NULL);
+
+	mgmt_send(data->mgmt, MGMT_OP_LOAD_IRKS, data->mgmt_index,
+					irk_len, irk_param,
+					setup_load_irks_callback, NULL, NULL);
+
+	mgmt_send(data->mgmt, MGMT_OP_SET_EXP_FEATURE, data->mgmt_index,
+					ext_feat_len, ext_feat_param,
+					setup_exp_feat_callback, NULL, NULL);
+
+	mgmt_send(data->mgmt, MGMT_OP_SET_POWERED, data->mgmt_index,
+					sizeof(param), param,
+					setup_powered_callback, NULL, NULL);
+
+}
+
+static void setup_add_device_callback(uint8_t status, uint16_t length,
+					const void *param, void *user_data)
+{
+	if (status != MGMT_STATUS_SUCCESS) {
+		tester_setup_failed();
+		return;
+	}
+
+	tester_print("New Device is Added");
+}
+
+static void setup_ll_privacy_device(const void *test_data)
+{
+	struct test_data *data = tester_get_data();
+	unsigned char param[] = { 0x01 };
+	const uint8_t *ext_feat_param;
+	size_t ext_feat_len;
+	const char *irk_param;
+	size_t irk_len;
+	const uint8_t *dev_param;
+	size_t dev_len;
+	unsigned char privacy_param[] = { 0x01,
+			0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
+			0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08 };
+
+	tester_print("Enabling LL Privacy feature");
+
+	ext_feat_param = set_exp_feat_param_ll_privacy;
+	ext_feat_len = sizeof(set_exp_feat_param_ll_privacy);
+
+	irk_param = load_irks_params;
+	irk_len = sizeof(load_irks_params);
+
+	dev_param = add_device_success_param_6;
+	dev_len = sizeof(add_device_success_param_6);
+
+	mgmt_send(data->mgmt, MGMT_OP_SET_LE, data->mgmt_index,
+					sizeof(param), &param,
+					NULL, NULL, NULL);
+
+	mgmt_send(data->mgmt, MGMT_OP_SET_PRIVACY, data->mgmt_index,
+					sizeof(privacy_param), privacy_param,
+					NULL, NULL, NULL);
+
+	mgmt_send(data->mgmt, MGMT_OP_LOAD_IRKS, data->mgmt_index,
+					irk_len, irk_param,
+					setup_load_irks_callback, NULL, NULL);
+
+	mgmt_send(data->mgmt, MGMT_OP_SET_EXP_FEATURE, data->mgmt_index,
+					ext_feat_len, ext_feat_param,
+					setup_exp_feat_callback, NULL, NULL);
+
+	mgmt_send(data->mgmt, MGMT_OP_ADD_DEVICE, data->mgmt_index,
+					dev_len, dev_param,
+					setup_add_device_callback, NULL, NULL);
+
+	mgmt_send(data->mgmt, MGMT_OP_SET_POWERED, data->mgmt_index,
+					sizeof(param), param,
+					setup_powered_callback, NULL, NULL);
+}
+
+static const uint8_t add_device_success_param_4[] = {
+					0x11, 0x22, 0x33, 0x44, 0x55, 0x66,
+					0x01,
+					0x02,
+};
+
+/* Enable LL Privacy and Add 2 devices */
+static void setup_ll_privacy_device2(const void *test_data)
+{
+	struct test_data *data = tester_get_data();
+	unsigned char param[] = { 0x01 };
+	const uint8_t *ext_feat_param;
+	size_t ext_feat_len;
+	const char *irk_param;
+	size_t irk_len;
+	const uint8_t *dev_param, *dev2_param;
+	size_t dev_len, dev2_len;
+	unsigned char privacy_param[] = { 0x01,
+			0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
+			0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08 };
+
+	tester_print("Enabling LL Privacy feature");
+
+	ext_feat_param = set_exp_feat_param_ll_privacy;
+	ext_feat_len = sizeof(set_exp_feat_param_ll_privacy);
+
+	irk_param = load_irks_params;
+	irk_len = sizeof(load_irks_params);
+
+	dev_param = add_device_success_param_6;
+	dev_len = sizeof(add_device_success_param_6);
+
+	dev2_param = add_device_success_param_4;
+	dev2_len = sizeof(add_device_success_param_4);
+
+	mgmt_send(data->mgmt, MGMT_OP_SET_LE, data->mgmt_index,
+					sizeof(param), &param,
+					NULL, NULL, NULL);
+
+	mgmt_send(data->mgmt, MGMT_OP_SET_PRIVACY, data->mgmt_index,
+					sizeof(privacy_param), privacy_param,
+					NULL, NULL, NULL);
+
+	mgmt_send(data->mgmt, MGMT_OP_LOAD_IRKS, data->mgmt_index,
+					irk_len, irk_param,
+					setup_load_irks_callback, NULL, NULL);
+
+	mgmt_send(data->mgmt, MGMT_OP_SET_EXP_FEATURE, data->mgmt_index,
+					ext_feat_len, ext_feat_param,
+					setup_exp_feat_callback, NULL, NULL);
+
+	mgmt_send(data->mgmt, MGMT_OP_ADD_DEVICE, data->mgmt_index,
+					dev_len, dev_param,
+					setup_add_device_callback, NULL, NULL);
+
+	mgmt_send(data->mgmt, MGMT_OP_ADD_DEVICE, data->mgmt_index,
+					dev2_len, dev2_param,
+					setup_add_device_callback, NULL, NULL);
+
+	mgmt_send(data->mgmt, MGMT_OP_SET_POWERED, data->mgmt_index,
+					sizeof(param), param,
+					setup_powered_callback, NULL, NULL);
+}
+
 static bool power_off(uint16_t index)
 {
 	int sk, err;
@@ -10090,6 +10406,13 @@ int main(int argc, char *argv[])
 	test_bredrle("Start Discovery - Power Off 1",
 				&start_discovery_valid_param_power_off_1,
 				NULL, test_command_generic);
+	/* MGMT_OP_START_DISCOVERY
+	 * Check if the resolving list is disabled before the scan parameter is
+	 * changed.
+	 */
+	test_bredrle50("Start Discovery - Disable Resolve List",
+				&start_discovery_ll_privacy_disable_resolv,
+				setup_ll_privacy_device, test_command_generic);
 
 	test_bredrle("Stop Discovery - Success 1",
 				&stop_discovery_success_test_1,
@@ -10489,6 +10812,26 @@ int main(int argc, char *argv[])
 	test_bredrle("Add Device - Success 5",
 				&add_device_success_5,
 				NULL, test_command_generic);
+	/* MGMT_OP_ADD_DEVICE
+	 * Add device and check the device is added to the whitelist
+	 */
+	test_bredrle50("Add Device - Success 6 - Add to whitelist",
+				&add_device_success_6,
+				NULL, test_command_generic);
+	/* MGMT_OP_ADD_DEVICE
+	 * Add device and check the device is added to the resolve list
+	 * when the LL Privacy is enabled
+	 */
+	test_bredrle50("Add Device - Success 7 - Add to resolv list",
+				&add_device_success_7,
+				setup_ll_privacy, test_command_generic);
+	/* MGMT_OP_ADD_DEVICE
+	 * Add device and check the Resolving List is enabled for the device
+	 * when the LL Privacy is enabled
+	 */
+	test_bredrle50("Add Device - Success 8 - Enable resolv list",
+				&add_device_success_8,
+				setup_ll_privacy, test_command_generic);
 
 	test_bredrle("Remove Device - Invalid Params 1",
 				&remove_device_fail_1,
@@ -10514,6 +10857,26 @@ int main(int argc, char *argv[])
 	test_le("Remove Device - Success 5",
 				&remove_device_success_5,
 				setup_add_device, test_remove_device);
+	/* MGMT_OP_REMOVE_DEVICE
+	 * Remove all devices
+	 */
+	test_bredrle50("Remove Device - Success 6 - All Devices",
+				&remove_device_success_6,
+				setup_add_device, test_remove_device);
+	/* MGMT_OP_REMOVE_DEVICE
+	 * Remove the device and check the device is removed from the whilte
+	 * list as well.
+	 */
+	test_bredrle50("Remove Device - Success 7 - Remove from whitelist",
+				&remove_device_success_7,
+				setup_ll_privacy_device2, test_command_generic);
+	/* MGMT_OP_REMOVE_DEVICE
+	 * Remove the device and check the device is removed from the resolving
+	 * list as well when the LL Privacy is enabled.
+	 */
+	test_bredrle50("Remove Device - Success 8 - Remove from resolv list",
+				&remove_device_success_8,
+				setup_ll_privacy_device2, test_command_generic);
 
 	test_bredrle("Read Advertising Features - Invalid parameters",
 				&read_adv_features_invalid_param_test,
-- 
2.26.3

