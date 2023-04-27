Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50B4B6EFFCE
	for <lists+linux-bluetooth@lfdr.de>; Thu, 27 Apr 2023 05:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242668AbjD0D2Z (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 26 Apr 2023 23:28:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233083AbjD0D2Y (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 26 Apr 2023 23:28:24 -0400
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 200A735A6;
        Wed, 26 Apr 2023 20:28:18 -0700 (PDT)
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 33R3RxI72004113, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
        by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 33R3RxI72004113
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
        Thu, 27 Apr 2023 11:27:59 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Thu, 27 Apr 2023 11:28:01 +0800
Received: from localhost.localdomain (172.21.132.192) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 27 Apr 2023 11:28:00 +0800
From:   <hildawu@realtek.com>
To:     <marcel@holtmann.org>
CC:     <johan.hedberg@gmail.com>, <luiz.dentz@gmail.com>,
        <linux-bluetooth@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mmandlik@google.com>, <apusaka@chromium.org>,
        <yinghsu@chromium.org>, <alex_lu@realsil.com.cn>,
        <max.chou@realtek.com>, <kidman@realtek.com>
Subject: [PATCH v4] Bluetooth: btrtl: Add Realtek devcoredump support
Date:   Thu, 27 Apr 2023 11:27:55 +0800
Message-ID: <20230427032755.28519-1-hildawu@realtek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.21.132.192]
X-ClientProxiedBy: RTEXH36505.realtek.com.tw (172.21.6.25) To
 RTEXMBS04.realtek.com.tw (172.21.6.97)
X-KSE-ServerInfo: RTEXMBS04.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Hilda Wu <hildawu@realtek.com>

Catch debug exception from controller and driver, and trigger a
devcoredump using hci devcoredump APIs. The debug exception data
will be parsed in userspace.

Signed-off-by: Alex Lu <alex_lu@realsil.com.cn>
Signed-off-by: Hilda Wu <hildawu@realtek.com>
---
Changes in v4:
 - Adjust coredump_info stored on a per hdev basis.
 - Adjust message level.

Changes in v3:
 - Rebase, fixed merge confilt

Changes in v2:
 - According to devcoredump API revision, modified related part.
---
---
 drivers/bluetooth/btrtl.c | 145 +++++++++++++++++++++++++++++++-------
 drivers/bluetooth/btrtl.h |  13 ++++
 drivers/bluetooth/btusb.c |  74 +++++++++++++++++++
 3 files changed, 205 insertions(+), 27 deletions(-)

diff --git a/drivers/bluetooth/btrtl.c b/drivers/bluetooth/btrtl.c
index 2915c82d719d..3a1abd8fad60 100644
--- a/drivers/bluetooth/btrtl.c
+++ b/drivers/bluetooth/btrtl.c
@@ -32,6 +32,8 @@
 #define RTL_ROM_LMP_8851B	0x8851
 #define RTL_CONFIG_MAGIC	0x8723ab55
 
+#define RTL_VSC_OP_COREDUMP	0xfcff
+
 #define IC_MATCH_FL_LMPSUBV	(1 << 0)
 #define IC_MATCH_FL_HCIREV	(1 << 1)
 #define IC_MATCH_FL_HCIVER	(1 << 2)
@@ -81,6 +83,7 @@ struct id_table {
 	bool has_msft_ext;
 	char *fw_name;
 	char *cfg_name;
+	char *hw_info;
 };
 
 struct btrtl_device_info {
@@ -102,21 +105,24 @@ static const struct id_table ic_id_table[] = {
 	  .config_needed = false,
 	  .has_rom_version = false,
 	  .fw_name = "rtl_bt/rtl8723a_fw.bin",
-	  .cfg_name = NULL },
+	  .cfg_name = NULL,
+	  .hw_info = "rtl8723au" },
 
 	/* 8723BS */
 	{ IC_INFO(RTL_ROM_LMP_8723B, 0xb, 0x6, HCI_UART),
 	  .config_needed = true,
 	  .has_rom_version = true,
 	  .fw_name  = "rtl_bt/rtl8723bs_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8723bs_config" },
+	  .cfg_name = "rtl_bt/rtl8723bs_config",
+	  .hw_info  = "rtl8723bs" },
 
 	/* 8723B */
 	{ IC_INFO(RTL_ROM_LMP_8723B, 0xb, 0x6, HCI_USB),
 	  .config_needed = false,
 	  .has_rom_version = true,
 	  .fw_name  = "rtl_bt/rtl8723b_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8723b_config" },
+	  .cfg_name = "rtl_bt/rtl8723b_config",
+	  .hw_info  = "rtl8723bu" },
 
 	/* 8723CS-CG */
 	{ .match_flags = IC_MATCH_FL_LMPSUBV | IC_MATCH_FL_CHIP_TYPE |
@@ -127,7 +133,8 @@ static const struct id_table ic_id_table[] = {
 	  .config_needed = true,
 	  .has_rom_version = true,
 	  .fw_name  = "rtl_bt/rtl8723cs_cg_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8723cs_cg_config" },
+	  .cfg_name = "rtl_bt/rtl8723cs_cg_config",
+	  .hw_info  = "rtl8723cs-cg" },
 
 	/* 8723CS-VF */
 	{ .match_flags = IC_MATCH_FL_LMPSUBV | IC_MATCH_FL_CHIP_TYPE |
@@ -138,7 +145,8 @@ static const struct id_table ic_id_table[] = {
 	  .config_needed = true,
 	  .has_rom_version = true,
 	  .fw_name  = "rtl_bt/rtl8723cs_vf_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8723cs_vf_config" },
+	  .cfg_name = "rtl_bt/rtl8723cs_vf_config",
+	  .hw_info  = "rtl8723cs-vf" },
 
 	/* 8723CS-XX */
 	{ .match_flags = IC_MATCH_FL_LMPSUBV | IC_MATCH_FL_CHIP_TYPE |
@@ -149,28 +157,32 @@ static const struct id_table ic_id_table[] = {
 	  .config_needed = true,
 	  .has_rom_version = true,
 	  .fw_name  = "rtl_bt/rtl8723cs_xx_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8723cs_xx_config" },
+	  .cfg_name = "rtl_bt/rtl8723cs_xx_config",
+	  .hw_info  = "rtl8723cs" },
 
 	/* 8723D */
 	{ IC_INFO(RTL_ROM_LMP_8723B, 0xd, 0x8, HCI_USB),
 	  .config_needed = true,
 	  .has_rom_version = true,
 	  .fw_name  = "rtl_bt/rtl8723d_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8723d_config" },
+	  .cfg_name = "rtl_bt/rtl8723d_config",
+	  .hw_info  = "rtl8723du" },
 
 	/* 8723DS */
 	{ IC_INFO(RTL_ROM_LMP_8723B, 0xd, 0x8, HCI_UART),
 	  .config_needed = true,
 	  .has_rom_version = true,
 	  .fw_name  = "rtl_bt/rtl8723ds_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8723ds_config" },
+	  .cfg_name = "rtl_bt/rtl8723ds_config",
+	  .hw_info  = "rtl8723ds" },
 
 	/* 8821A */
 	{ IC_INFO(RTL_ROM_LMP_8821A, 0xa, 0x6, HCI_USB),
 	  .config_needed = false,
 	  .has_rom_version = true,
 	  .fw_name  = "rtl_bt/rtl8821a_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8821a_config" },
+	  .cfg_name = "rtl_bt/rtl8821a_config",
+	  .hw_info  = "rtl8821au" },
 
 	/* 8821C */
 	{ IC_INFO(RTL_ROM_LMP_8821A, 0xc, 0x8, HCI_USB),
@@ -178,7 +190,8 @@ static const struct id_table ic_id_table[] = {
 	  .has_rom_version = true,
 	  .has_msft_ext = true,
 	  .fw_name  = "rtl_bt/rtl8821c_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8821c_config" },
+	  .cfg_name = "rtl_bt/rtl8821c_config",
+	  .hw_info  = "rtl8821cu" },
 
 	/* 8821CS */
 	{ IC_INFO(RTL_ROM_LMP_8821A, 0xc, 0x8, HCI_UART),
@@ -186,14 +199,16 @@ static const struct id_table ic_id_table[] = {
 	  .has_rom_version = true,
 	  .has_msft_ext = true,
 	  .fw_name  = "rtl_bt/rtl8821cs_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8821cs_config" },
+	  .cfg_name = "rtl_bt/rtl8821cs_config",
+	  .hw_info  = "rtl8821cs" },
 
 	/* 8761A */
 	{ IC_INFO(RTL_ROM_LMP_8761A, 0xa, 0x6, HCI_USB),
 	  .config_needed = false,
 	  .has_rom_version = true,
 	  .fw_name  = "rtl_bt/rtl8761a_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8761a_config" },
+	  .cfg_name = "rtl_bt/rtl8761a_config",
+	  .hw_info  = "rtl8761au" },
 
 	/* 8761B */
 	{ IC_INFO(RTL_ROM_LMP_8761A, 0xb, 0xa, HCI_UART),
@@ -201,14 +216,16 @@ static const struct id_table ic_id_table[] = {
 	  .has_rom_version = true,
 	  .has_msft_ext = true,
 	  .fw_name  = "rtl_bt/rtl8761b_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8761b_config" },
+	  .cfg_name = "rtl_bt/rtl8761b_config",
+	  .hw_info  = "rtl8761btv" },
 
 	/* 8761BU */
 	{ IC_INFO(RTL_ROM_LMP_8761A, 0xb, 0xa, HCI_USB),
 	  .config_needed = false,
 	  .has_rom_version = true,
 	  .fw_name  = "rtl_bt/rtl8761bu_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8761bu_config" },
+	  .cfg_name = "rtl_bt/rtl8761bu_config",
+	  .hw_info  = "rtl8761bu" },
 
 	/* 8822C with UART interface */
 	{ IC_INFO(RTL_ROM_LMP_8822B, 0xc, 0x8, HCI_UART),
@@ -216,7 +233,8 @@ static const struct id_table ic_id_table[] = {
 	  .has_rom_version = true,
 	  .has_msft_ext = true,
 	  .fw_name  = "rtl_bt/rtl8822cs_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8822cs_config" },
+	  .cfg_name = "rtl_bt/rtl8822cs_config",
+	  .hw_info  = "rtl8822cs" },
 
 	/* 8822C with UART interface */
 	{ IC_INFO(RTL_ROM_LMP_8822B, 0xc, 0xa, HCI_UART),
@@ -224,7 +242,8 @@ static const struct id_table ic_id_table[] = {
 	  .has_rom_version = true,
 	  .has_msft_ext = true,
 	  .fw_name  = "rtl_bt/rtl8822cs_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8822cs_config" },
+	  .cfg_name = "rtl_bt/rtl8822cs_config",
+	  .hw_info  = "rtl8822cs" },
 
 	/* 8822C with USB interface */
 	{ IC_INFO(RTL_ROM_LMP_8822B, 0xc, 0xa, HCI_USB),
@@ -232,7 +251,8 @@ static const struct id_table ic_id_table[] = {
 	  .has_rom_version = true,
 	  .has_msft_ext = true,
 	  .fw_name  = "rtl_bt/rtl8822cu_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8822cu_config" },
+	  .cfg_name = "rtl_bt/rtl8822cu_config",
+	  .hw_info  = "rtl8822cu" },
 
 	/* 8822B */
 	{ IC_INFO(RTL_ROM_LMP_8822B, 0xb, 0x7, HCI_USB),
@@ -240,7 +260,8 @@ static const struct id_table ic_id_table[] = {
 	  .has_rom_version = true,
 	  .has_msft_ext = true,
 	  .fw_name  = "rtl_bt/rtl8822b_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8822b_config" },
+	  .cfg_name = "rtl_bt/rtl8822b_config",
+	  .hw_info  = "rtl8822bu" },
 
 	/* 8852A */
 	{ IC_INFO(RTL_ROM_LMP_8852A, 0xa, 0xb, HCI_USB),
@@ -248,7 +269,8 @@ static const struct id_table ic_id_table[] = {
 	  .has_rom_version = true,
 	  .has_msft_ext = true,
 	  .fw_name  = "rtl_bt/rtl8852au_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8852au_config" },
+	  .cfg_name = "rtl_bt/rtl8852au_config",
+	  .hw_info  = "rtl8852au" },
 
 	/* 8852B with UART interface */
 	{ IC_INFO(RTL_ROM_LMP_8852A, 0xb, 0xb, HCI_UART),
@@ -256,7 +278,8 @@ static const struct id_table ic_id_table[] = {
 	  .has_rom_version = true,
 	  .has_msft_ext = true,
 	  .fw_name  = "rtl_bt/rtl8852bs_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8852bs_config" },
+	  .cfg_name = "rtl_bt/rtl8852bs_config",
+	  .hw_info  = "rtl8852bs" },
 
 	/* 8852B */
 	{ IC_INFO(RTL_ROM_LMP_8852A, 0xb, 0xb, HCI_USB),
@@ -264,7 +287,8 @@ static const struct id_table ic_id_table[] = {
 	  .has_rom_version = true,
 	  .has_msft_ext = true,
 	  .fw_name  = "rtl_bt/rtl8852bu_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8852bu_config" },
+	  .cfg_name = "rtl_bt/rtl8852bu_config",
+	  .hw_info  = "rtl8852bu" },
 
 	/* 8852C */
 	{ IC_INFO(RTL_ROM_LMP_8852A, 0xc, 0xc, HCI_USB),
@@ -272,7 +296,8 @@ static const struct id_table ic_id_table[] = {
 	  .has_rom_version = true,
 	  .has_msft_ext = true,
 	  .fw_name  = "rtl_bt/rtl8852cu_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8852cu_config" },
+	  .cfg_name = "rtl_bt/rtl8852cu_config",
+	  .hw_info  = "rtl8852cu" },
 
 	/* 8851B */
 	{ IC_INFO(RTL_ROM_LMP_8851B, 0xb, 0xc, HCI_USB),
@@ -280,7 +305,8 @@ static const struct id_table ic_id_table[] = {
 	  .has_rom_version = true,
 	  .has_msft_ext = false,
 	  .fw_name  = "rtl_bt/rtl8851bu_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8851bu_config" },
+	  .cfg_name = "rtl_bt/rtl8851bu_config",
+	  .hw_info  = "rtl8851bu" },
 	};
 
 static const struct id_table *btrtl_match_ic(u16 lmp_subver, u16 hci_rev,
@@ -590,6 +616,7 @@ static int rtlbt_parse_firmware(struct hci_dev *hdev,
 				unsigned char **_buf)
 {
 	static const u8 extension_sig[] = { 0x51, 0x04, 0xfd, 0x77 };
+	struct btrealtek_data *coredump_info = hci_get_priv(hdev);
 	struct rtl_epatch_header *epatch_info;
 	unsigned char *buf;
 	int i, len;
@@ -705,8 +732,10 @@ static int rtlbt_parse_firmware(struct hci_dev *hdev,
 
 	epatch_info = (struct rtl_epatch_header *)btrtl_dev->fw_data;
 	num_patches = le16_to_cpu(epatch_info->num_patches);
+
 	BT_DBG("fw_version=%x, num_patches=%d",
 	       le32_to_cpu(epatch_info->fw_version), num_patches);
+	coredump_info->rtl_dump.fw_version = le32_to_cpu(epatch_info->fw_version);
 
 	/* After the rtl_epatch_header there is a funky patch metadata section.
 	 * Assuming 2 patches, the layout is:
@@ -903,6 +932,53 @@ static int btrtl_setup_rtl8723b(struct hci_dev *hdev,
 	return ret;
 }
 
+static void btrtl_coredump(struct hci_dev *hdev)
+{
+	static const u8 param[] = { 0x00, 0x00 };
+
+	__hci_cmd_send(hdev, RTL_VSC_OP_COREDUMP, sizeof(param), param);
+}
+
+static void btrtl_dmp_hdr(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	struct btrealtek_data *coredump_info = hci_get_priv(hdev);
+	char buf[80];
+
+	if (coredump_info->rtl_dump.controller)
+		snprintf(buf, sizeof(buf), "Controller Name: %s\n",
+			 coredump_info->rtl_dump.controller);
+	else
+		snprintf(buf, sizeof(buf), "Controller Name: Unknown\n");
+	skb_put_data(skb, buf, strlen(buf));
+
+	snprintf(buf, sizeof(buf), "Firmware Version: 0x%X\n",
+		 coredump_info->rtl_dump.fw_version);
+	skb_put_data(skb, buf, strlen(buf));
+
+	snprintf(buf, sizeof(buf), "Driver: %s\n", coredump_info->rtl_dump.driver_name);
+	skb_put_data(skb, buf, strlen(buf));
+
+	snprintf(buf, sizeof(buf), "Vendor: Realtek\n");
+	skb_put_data(skb, buf, strlen(buf));
+}
+
+static int btrtl_register_devcoredump_support(struct hci_dev *hdev)
+{
+	int err;
+
+	err = hci_devcd_register(hdev, btrtl_coredump, btrtl_dmp_hdr, NULL);
+
+	return err;
+}
+
+void btrtl_set_driver_name(struct hci_dev *hdev, const char *driver_name)
+{
+	struct btrealtek_data *coredump_info = hci_get_priv(hdev);
+
+	coredump_info->rtl_dump.driver_name = driver_name;
+}
+EXPORT_SYMBOL_GPL(btrtl_set_driver_name);
+
 static bool rtl_has_chip_type(u16 lmp_subver)
 {
 	switch (lmp_subver) {
@@ -964,6 +1040,7 @@ EXPORT_SYMBOL_GPL(btrtl_free);
 struct btrtl_device_info *btrtl_initialize(struct hci_dev *hdev,
 					   const char *postfix)
 {
+	struct btrealtek_data *coredump_info = hci_get_priv(hdev);
 	struct btrtl_device_info *btrtl_dev;
 	struct sk_buff *skb;
 	struct hci_rp_read_local_version *resp;
@@ -1113,6 +1190,9 @@ struct btrtl_device_info *btrtl_initialize(struct hci_dev *hdev,
 	if (btrtl_dev->ic_info->has_msft_ext)
 		hci_set_msft_opcode(hdev, 0xFCF0);
 
+	if (btrtl_dev->ic_info)
+		coredump_info->rtl_dump.controller = btrtl_dev->ic_info->hw_info;
+
 	return btrtl_dev;
 
 err_free:
@@ -1125,6 +1205,8 @@ EXPORT_SYMBOL_GPL(btrtl_initialize);
 int btrtl_download_firmware(struct hci_dev *hdev,
 			    struct btrtl_device_info *btrtl_dev)
 {
+	int err = 0;
+
 	/* Match a set of subver values that correspond to stock firmware,
 	 * which is not compatible with standard btusb.
 	 * If matched, upload an alternative firmware that does conform to
@@ -1133,12 +1215,14 @@ int btrtl_download_firmware(struct hci_dev *hdev,
 	 */
 	if (!btrtl_dev->ic_info) {
 		rtl_dev_info(hdev, "assuming no firmware upload needed");
-		return 0;
+		err = 0;
+		goto done;
 	}
 
 	switch (btrtl_dev->ic_info->lmp_subver) {
 	case RTL_ROM_LMP_8723A:
-		return btrtl_setup_rtl8723a(hdev, btrtl_dev);
+		err = btrtl_setup_rtl8723a(hdev, btrtl_dev);
+		break;
 	case RTL_ROM_LMP_8723B:
 	case RTL_ROM_LMP_8821A:
 	case RTL_ROM_LMP_8761A:
@@ -1146,11 +1230,18 @@ int btrtl_download_firmware(struct hci_dev *hdev,
 	case RTL_ROM_LMP_8852A:
 	case RTL_ROM_LMP_8703B:
 	case RTL_ROM_LMP_8851B:
-		return btrtl_setup_rtl8723b(hdev, btrtl_dev);
+		err = btrtl_setup_rtl8723b(hdev, btrtl_dev);
+		break;
 	default:
 		rtl_dev_info(hdev, "assuming no firmware upload needed");
-		return 0;
+		break;
 	}
+
+done:
+	if (!err)
+		err = btrtl_register_devcoredump_support(hdev);
+
+	return err;
 }
 EXPORT_SYMBOL_GPL(btrtl_download_firmware);
 
diff --git a/drivers/bluetooth/btrtl.h b/drivers/bluetooth/btrtl.h
index adb4c2c9abc5..a2d9d34f9fb0 100644
--- a/drivers/bluetooth/btrtl.h
+++ b/drivers/bluetooth/btrtl.h
@@ -109,8 +109,16 @@ enum {
 	__REALTEK_NUM_FLAGS,
 };
 
+struct rtl_dump_info {
+	const char *driver_name;
+	char *controller;
+	u32  fw_version;
+};
+
 struct btrealtek_data {
 	DECLARE_BITMAP(flags, __REALTEK_NUM_FLAGS);
+
+	struct rtl_dump_info rtl_dump;
 };
 
 #define btrealtek_set_flag(hdev, nr)					\
@@ -139,6 +147,7 @@ int btrtl_get_uart_settings(struct hci_dev *hdev,
 			    struct btrtl_device_info *btrtl_dev,
 			    unsigned int *controller_baudrate,
 			    u32 *device_baudrate, bool *flow_control);
+void btrtl_set_driver_name(struct hci_dev *hdev, const char *driver_name);
 
 #else
 
@@ -182,4 +191,8 @@ static inline int btrtl_get_uart_settings(struct hci_dev *hdev,
 	return -ENOENT;
 }
 
+static inline void btrtl_set_driver_name(struct hci_dev *hdev, const char *driver_name)
+{
+}
+
 #endif
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 3aa189b1986d..23059e3463eb 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -869,10 +869,49 @@ static void btusb_intel_cmd_timeout(struct hci_dev *hdev)
 	gpiod_set_value_cansleep(reset_gpio, 0);
 }
 
+#define RTK_DEVCOREDUMP_CODE_MEMDUMP		0x01
+#define RTK_DEVCOREDUMP_CODE_HW_ERR		0x02
+#define RTK_DEVCOREDUMP_CODE_CMD_TIMEOUT	0x03
+
+#define RTK_SUB_EVENT_CODE_COREDUMP		0x34
+
+struct rtk_dev_coredump_hdr {
+	u8 type;
+	u8 code;
+	u8 reserved[2];
+} __packed;
+
+static inline void btusb_rtl_alloc_devcoredump(struct hci_dev *hdev,
+		struct rtk_dev_coredump_hdr *hdr, u8 *buf, u32 len)
+{
+	struct sk_buff *skb;
+
+	skb = alloc_skb(len + sizeof(*hdr), GFP_ATOMIC);
+	if (!skb)
+		return;
+
+	skb_put_data(skb, hdr, sizeof(*hdr));
+	if (len)
+		skb_put_data(skb, buf, len);
+
+	if (!hci_devcd_init(hdev, skb->len)) {
+		hci_devcd_append(hdev, skb);
+		hci_devcd_complete(hdev);
+	} else {
+		bt_dev_err(hdev, "RTL: Failed to generate devcoredump");
+		kfree_skb(skb);
+	}
+}
+
 static void btusb_rtl_cmd_timeout(struct hci_dev *hdev)
 {
 	struct btusb_data *data = hci_get_drvdata(hdev);
 	struct gpio_desc *reset_gpio = data->reset_gpio;
+	struct rtk_dev_coredump_hdr hdr = {
+		.type = RTK_DEVCOREDUMP_CODE_CMD_TIMEOUT,
+	};
+
+	btusb_rtl_alloc_devcoredump(hdev, &hdr, NULL, 0);
 
 	if (++data->cmd_timeout_cnt < 5)
 		return;
@@ -899,6 +938,18 @@ static void btusb_rtl_cmd_timeout(struct hci_dev *hdev)
 	gpiod_set_value_cansleep(reset_gpio, 0);
 }
 
+static void btusb_rtl_hw_error(struct hci_dev *hdev, u8 code)
+{
+	struct rtk_dev_coredump_hdr hdr = {
+		.type = RTK_DEVCOREDUMP_CODE_HW_ERR,
+		.code = code,
+	};
+
+	bt_dev_err(hdev, "RTL: hw err, trigger devcoredump (%d)", code);
+
+	btusb_rtl_alloc_devcoredump(hdev, &hdr, NULL, 0);
+}
+
 static void btusb_qca_cmd_timeout(struct hci_dev *hdev)
 {
 	struct btusb_data *data = hci_get_drvdata(hdev);
@@ -2539,6 +2590,25 @@ static int btusb_setup_realtek(struct hci_dev *hdev)
 	return ret;
 }
 
+static int btusb_recv_event_realtek(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	if (skb->data[0] == HCI_VENDOR_PKT && skb->data[2] == RTK_SUB_EVENT_CODE_COREDUMP) {
+		struct rtk_dev_coredump_hdr hdr = {
+			.code = RTK_DEVCOREDUMP_CODE_MEMDUMP,
+		};
+
+		bt_dev_dbg(hdev, "RTL: received coredump vendor evt, len %u",
+			skb->len);
+
+		btusb_rtl_alloc_devcoredump(hdev, &hdr, skb->data, skb->len);
+		kfree_skb(skb);
+
+		return 0;
+	}
+
+	return hci_recv_frame(hdev, skb);
+}
+
 /* UHW CR mapping */
 #define MTK_BT_MISC		0x70002510
 #define MTK_BT_SUBSYS_RST	0x70002610
@@ -3978,6 +4048,8 @@ static int btusb_probe(struct usb_interface *intf,
 	} else if (id->driver_info & BTUSB_REALTEK) {
 		/* Allocate extra space for Realtek device */
 		priv_size += sizeof(struct btrealtek_data);
+
+		data->recv_event = btusb_recv_event_realtek;
 	}
 
 	data->recv_acl = hci_recv_frame;
@@ -4136,9 +4208,11 @@ static int btusb_probe(struct usb_interface *intf,
 
 	if (IS_ENABLED(CONFIG_BT_HCIBTUSB_RTL) &&
 	    (id->driver_info & BTUSB_REALTEK)) {
+		btrtl_set_driver_name(hdev, btusb_driver.name);
 		hdev->setup = btusb_setup_realtek;
 		hdev->shutdown = btrtl_shutdown_realtek;
 		hdev->cmd_timeout = btusb_rtl_cmd_timeout;
+		hdev->hw_error = btusb_rtl_hw_error;
 
 		/* Realtek devices need to set remote wakeup on auto-suspend */
 		set_bit(BTUSB_WAKEUP_AUTOSUSPEND, &data->flags);
-- 
2.17.1

