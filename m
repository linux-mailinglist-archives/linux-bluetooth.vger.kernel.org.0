Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D3E510DF04
	for <lists+linux-bluetooth@lfdr.de>; Sat, 30 Nov 2019 20:47:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727218AbfK3Trp (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 30 Nov 2019 14:47:45 -0500
Received: from vault.bonstra.fr.eu.org ([51.158.68.104]:41394 "EHLO
        vault.bonstra.fr.eu.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727025AbfK3Trp (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 30 Nov 2019 14:47:45 -0500
Received: from val.bonstra.fr.eu.org (unknown [192.168.128.2])
        by vault.bonstra.fr.eu.org (Postfix) with ESMTP id C8DA4BFB9C;
        Sat, 30 Nov 2019 19:47:42 +0000 (UTC)
Received: from localhost.localdomain (vlad.gr1 [IPv6:fd7b:45cc:aa3d::3])
        by val.bonstra.fr.eu.org (Postfix) with ESMTPSA id 62D0864C1A;
        Sat, 30 Nov 2019 20:47:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bonstra.fr.eu.org;
        s=dkim1; t=1575143261; x=1576352861;
        bh=H5I8Rjas55kXUDTEUDM6f/azcbXxFDhGsU4J1tIBUj4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=hovL7ptyEVZBoa+8m8NvyIH9Zd4E93srghTW1sjW4zDQxq6rSDICKb73a664JVZXe
         v8PeyBuwO+0RvdI8/QVT/HU28lNGm44SLhcv9u9Tx4T/J+ww+8yRtAesFcokrn2XLk
         4wosH10m0SGueLa/ZHDilR8McMdmKRYew6QcOQeERFnB+Rq8ZzBmR1m8d66E75lNFz
         c8dfBe2E5Lx8DRFp3dVk2j4fzvlJDTaToHM5nPmYsWiwEQttaUnzZz3/rHv4D9hurx
         sy0UQiLXN7EvzNScRYxldTF/zv75vy82LelcBe8XXUDHjr3+y8O5jelI3YGPdMo/c4
         5r33FizXKJehQ==
From:   Hugo Grostabussiat <bonstra@bonstra.fr.eu.org>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     Hugo Grostabussiat <bonstra@bonstra.fr.eu.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-bluetooth@vger.kernel.org
Subject: [PATCH v3 2/3] Bluetooth: hci_h5: Add DT support for rtl8723bs
Date:   Sat, 30 Nov 2019 20:47:18 +0100
Message-Id: <20191130194719.112335-3-bonstra@bonstra.fr.eu.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191130194719.112335-1-bonstra@bonstra.fr.eu.org>
References: <20191130194719.112335-1-bonstra@bonstra.fr.eu.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The hci_h5 already supports Realtek controllers discovered via ACPI. This
commit adds support for discovering via device tree for ACPI-less
platforms.

Signed-off-by: Hugo Grostabussiat <bonstra@bonstra.fr.eu.org>
---
 drivers/bluetooth/Kconfig  |  2 +-
 drivers/bluetooth/btrtl.c  | 75 +++++++++++++++++++++-----------------
 drivers/bluetooth/btrtl.h  |  3 +-
 drivers/bluetooth/hci_h5.c | 65 ++++++++++++++++++++++++++-------
 4 files changed, 95 insertions(+), 50 deletions(-)

diff --git a/drivers/bluetooth/Kconfig b/drivers/bluetooth/Kconfig
index aae665a3a254..48c9a004b033 100644
--- a/drivers/bluetooth/Kconfig
+++ b/drivers/bluetooth/Kconfig
@@ -211,7 +211,7 @@ config BT_HCIUART_RTL
 	depends on BT_HCIUART
 	depends on BT_HCIUART_SERDEV
 	depends on GPIOLIB
-	depends on ACPI
+	depends on (ACPI || OF)
 	select BT_HCIUART_3WIRE
 	select BT_RTL
 	help
diff --git a/drivers/bluetooth/btrtl.c b/drivers/bluetooth/btrtl.c
index 4f75a9b61d09..01b0eb4b57d7 100644
--- a/drivers/bluetooth/btrtl.c
+++ b/drivers/bluetooth/btrtl.c
@@ -17,6 +17,8 @@
 
 #define VERSION "0.1"
 
+#define FW_DIR "rtl_bt"
+
 #define RTL_EPATCH_SIGNATURE	"Realtech"
 #define RTL_ROM_LMP_3499	0x3499
 #define RTL_ROM_LMP_8723A	0x1200
@@ -45,7 +47,7 @@ struct id_table {
 	bool config_needed;
 	bool has_rom_version;
 	char *fw_name;
-	char *cfg_name;
+	char *cfg_basename;
 };
 
 struct btrtl_device_info {
@@ -61,14 +63,14 @@ static const struct id_table ic_id_table[] = {
 	{ IC_MATCH_FL_LMPSUBV, RTL_ROM_LMP_8723A, 0x0,
 	  .config_needed = false,
 	  .has_rom_version = false,
-	  .fw_name = "rtl_bt/rtl8723a_fw.bin",
-	  .cfg_name = NULL },
+	  .fw_name = FW_DIR "/rtl8723a_fw.bin",
+	  .cfg_basename = NULL },
 
 	{ IC_MATCH_FL_LMPSUBV, RTL_ROM_LMP_3499, 0x0,
 	  .config_needed = false,
 	  .has_rom_version = false,
-	  .fw_name = "rtl_bt/rtl8723a_fw.bin",
-	  .cfg_name = NULL },
+	  .fw_name = FW_DIR "/rtl8723a_fw.bin",
+	  .cfg_basename = NULL },
 
 	/* 8723BS */
 	{ .match_flags = IC_MATCH_FL_LMPSUBV | IC_MATCH_FL_HCIREV |
@@ -79,22 +81,22 @@ static const struct id_table ic_id_table[] = {
 	  .hci_bus = HCI_UART,
 	  .config_needed = true,
 	  .has_rom_version = true,
-	  .fw_name  = "rtl_bt/rtl8723bs_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8723bs_config" },
+	  .fw_name  = FW_DIR "/rtl8723bs_fw.bin",
+	  .cfg_basename = "rtl8723bs_config" },
 
 	/* 8723B */
 	{ IC_INFO(RTL_ROM_LMP_8723B, 0xb),
 	  .config_needed = false,
 	  .has_rom_version = true,
-	  .fw_name  = "rtl_bt/rtl8723b_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8723b_config" },
+	  .fw_name  = FW_DIR "/rtl8723b_fw.bin",
+	  .cfg_basename = "rtl8723b_config" },
 
 	/* 8723D */
 	{ IC_INFO(RTL_ROM_LMP_8723B, 0xd),
 	  .config_needed = true,
 	  .has_rom_version = true,
-	  .fw_name  = "rtl_bt/rtl8723d_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8723d_config" },
+	  .fw_name  = FW_DIR "/rtl8723d_fw.bin",
+	  .cfg_basename = "rtl8723d_config" },
 
 	/* 8723DS */
 	{ .match_flags = IC_MATCH_FL_LMPSUBV | IC_MATCH_FL_HCIREV |
@@ -105,50 +107,50 @@ static const struct id_table ic_id_table[] = {
 	  .hci_bus = HCI_UART,
 	  .config_needed = true,
 	  .has_rom_version = true,
-	  .fw_name  = "rtl_bt/rtl8723ds_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8723ds_config" },
+	  .fw_name  = FW_DIR "/rtl8723ds_fw.bin",
+	  .cfg_basename = "rtl8723ds_config" },
 
 	/* 8723DU */
 	{ IC_INFO(RTL_ROM_LMP_8723D, 0x826C),
 	  .config_needed = true,
 	  .has_rom_version = true,
-	  .fw_name  = "rtl_bt/rtl8723d_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8723d_config" },
+	  .fw_name  = FW_DIR "/rtl8723d_fw.bin",
+	  .cfg_basename = "rtl8723d_config" },
 
 	/* 8821A */
 	{ IC_INFO(RTL_ROM_LMP_8821A, 0xa),
 	  .config_needed = false,
 	  .has_rom_version = true,
-	  .fw_name  = "rtl_bt/rtl8821a_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8821a_config" },
+	  .fw_name  = FW_DIR "/rtl8821a_fw.bin",
+	  .cfg_basename = "rtl8821a_config" },
 
 	/* 8821C */
 	{ IC_INFO(RTL_ROM_LMP_8821A, 0xc),
 	  .config_needed = false,
 	  .has_rom_version = true,
-	  .fw_name  = "rtl_bt/rtl8821c_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8821c_config" },
+	  .fw_name  = FW_DIR "/rtl8821c_fw.bin",
+	  .cfg_basename = "rtl8821c_config" },
 
 	/* 8761A */
 	{ IC_MATCH_FL_LMPSUBV, RTL_ROM_LMP_8761A, 0x0,
 	  .config_needed = false,
 	  .has_rom_version = true,
-	  .fw_name  = "rtl_bt/rtl8761a_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8761a_config" },
+	  .fw_name  = FW_DIR "/rtl8761a_fw.bin",
+	  .cfg_basename = "rtl8761a_config" },
 
 	/* 8822C with USB interface */
 	{ IC_INFO(RTL_ROM_LMP_8822B, 0xc),
 	  .config_needed = false,
 	  .has_rom_version = true,
-	  .fw_name  = "rtl_bt/rtl8822cu_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8822cu_config" },
+	  .fw_name  = FW_DIR "/rtl8822cu_fw.bin",
+	  .cfg_basename = "rtl8822cu_config" },
 
 	/* 8822B */
 	{ IC_INFO(RTL_ROM_LMP_8822B, 0xb),
 	  .config_needed = true,
 	  .has_rom_version = true,
-	  .fw_name  = "rtl_bt/rtl8822b_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8822b_config" },
+	  .fw_name  = FW_DIR "/rtl8822b_fw.bin",
+	  .cfg_basename = "rtl8822b_config" },
 	};
 
 static const struct id_table *btrtl_match_ic(u16 lmp_subver, u16 hci_rev,
@@ -514,7 +516,8 @@ void btrtl_free(struct btrtl_device_info *btrtl_dev)
 EXPORT_SYMBOL_GPL(btrtl_free);
 
 struct btrtl_device_info *btrtl_initialize(struct hci_dev *hdev,
-					   const char *postfix)
+					   const char *cfg,
+					   bool cfg_is_postfix)
 {
 	struct btrtl_device_info *btrtl_dev;
 	struct sk_buff *skb;
@@ -570,20 +573,24 @@ struct btrtl_device_info *btrtl_initialize(struct hci_dev *hdev,
 		goto err_free;
 	}
 
-	if (btrtl_dev->ic_info->cfg_name) {
-		if (postfix) {
-			snprintf(cfg_name, sizeof(cfg_name), "%s-%s.bin",
-				 btrtl_dev->ic_info->cfg_name, postfix);
+	if (btrtl_dev->ic_info->cfg_basename) {
+		if (cfg && cfg_is_postfix) {
+			snprintf(cfg_name, sizeof(cfg_name), "%s/%s-%s.bin",
+				 FW_DIR, btrtl_dev->ic_info->cfg_basename,
+				 cfg);
+		} else if (cfg && !cfg_is_postfix) {
+			snprintf(cfg_name, sizeof(cfg_name), "%s/%s",
+				 FW_DIR, cfg);
 		} else {
-			snprintf(cfg_name, sizeof(cfg_name), "%s.bin",
-				 btrtl_dev->ic_info->cfg_name);
+			snprintf(cfg_name, sizeof(cfg_name), "%s/%s.bin",
+				 FW_DIR, btrtl_dev->ic_info->cfg_basename);
 		}
 		btrtl_dev->cfg_len = rtl_load_file(hdev, cfg_name,
 						   &btrtl_dev->cfg_data);
 		if (btrtl_dev->ic_info->config_needed &&
 		    btrtl_dev->cfg_len <= 0) {
 			rtl_dev_err(hdev, "mandatory config file %s not found\n",
-				    btrtl_dev->ic_info->cfg_name);
+				    cfg_name);
 			ret = btrtl_dev->cfg_len;
 			goto err_free;
 		}
@@ -633,7 +640,7 @@ int btrtl_setup_realtek(struct hci_dev *hdev)
 	struct btrtl_device_info *btrtl_dev;
 	int ret;
 
-	btrtl_dev = btrtl_initialize(hdev, NULL);
+	btrtl_dev = btrtl_initialize(hdev, NULL, false);
 	if (IS_ERR(btrtl_dev))
 		return PTR_ERR(btrtl_dev);
 
diff --git a/drivers/bluetooth/btrtl.h b/drivers/bluetooth/btrtl.h
index 10ad40c3e42c..b83c0a3f2a49 100644
--- a/drivers/bluetooth/btrtl.h
+++ b/drivers/bluetooth/btrtl.h
@@ -50,7 +50,8 @@ struct rtl_vendor_config {
 #if IS_ENABLED(CONFIG_BT_RTL)
 
 struct btrtl_device_info *btrtl_initialize(struct hci_dev *hdev,
-					   const char *postfix);
+					   const char *cfg,
+					   bool cfg_is_postfix);
 void btrtl_free(struct btrtl_device_info *btrtl_dev);
 int btrtl_download_firmware(struct hci_dev *hdev,
 			    struct btrtl_device_info *btrtl_dev);
diff --git a/drivers/bluetooth/hci_h5.c b/drivers/bluetooth/hci_h5.c
index dacf297baf59..a0d8d4be9b0e 100644
--- a/drivers/bluetooth/hci_h5.c
+++ b/drivers/bluetooth/hci_h5.c
@@ -11,6 +11,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/mod_devicetable.h>
+#include <linux/of_device.h>
 #include <linux/serdev.h>
 #include <linux/skbuff.h>
 
@@ -90,9 +91,12 @@ struct h5 {
 	} sleep;
 
 	const struct h5_vnd *vnd;
-	const char *id;
+	const char *cfg; /* Board config file name or postfix */
+	bool cfg_is_postfix; /* Whether cfg must be appended to the base name
+			      * to the full config file name
+			      */
 
-	struct gpio_desc *enable_gpio;
+	struct gpio_desc *powerdown_gpio;
 	struct gpio_desc *device_wake_gpio;
 };
 
@@ -782,7 +786,6 @@ static const struct hci_uart_proto h5p = {
 
 static int h5_serdev_probe(struct serdev_device *serdev)
 {
-	const struct acpi_device_id *match;
 	struct device *dev = &serdev->dev;
 	struct h5 *h5;
 
@@ -797,21 +800,40 @@ static int h5_serdev_probe(struct serdev_device *serdev)
 	serdev_device_set_drvdata(serdev, h5);
 
 	if (has_acpi_companion(dev)) {
-		match = acpi_match_device(dev->driver->acpi_match_table, dev);
+		const struct acpi_device_id *match;
+
+		match = acpi_match_device(
+				dev->driver->acpi_match_table, dev);
 		if (!match)
 			return -ENODEV;
 
 		h5->vnd = (const struct h5_vnd *)match->driver_data;
-		h5->id  = (char *)match->id;
+		h5->cfg  = (char *)match->id;
+		h5->cfg_is_postfix = true;
 
 		if (h5->vnd->acpi_gpio_map)
 			devm_acpi_dev_add_driver_gpios(dev,
 						       h5->vnd->acpi_gpio_map);
+	} else if (dev->of_node) {
+		const struct of_device_id *match;
+		const char *cfgname = NULL;
+
+		match = of_match_device(dev->driver->of_match_table, dev);
+		if (!match)
+			return -ENODEV;
+
+		of_property_read_string(dev->of_node,
+					"firmware-name", &cfgname);
+
+		h5->vnd = (const struct h5_vnd *)match->data;
+		h5->cfg = cfgname;
+		h5->cfg_is_postfix = false;
 	}
 
-	h5->enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
-	if (IS_ERR(h5->enable_gpio))
-		return PTR_ERR(h5->enable_gpio);
+	h5->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
+						     GPIOD_OUT_HIGH);
+	if (IS_ERR(h5->powerdown_gpio))
+		return PTR_ERR(h5->powerdown_gpio);
 
 	h5->device_wake_gpio = devm_gpiod_get_optional(dev, "device-wake",
 						       GPIOD_OUT_LOW);
@@ -861,7 +883,8 @@ static int h5_btrtl_setup(struct h5 *h5)
 	bool flow_control;
 	int err;
 
-	btrtl_dev = btrtl_initialize(h5->hu->hdev, h5->id);
+	btrtl_dev = btrtl_initialize(h5->hu->hdev, h5->cfg,
+			h5->cfg_is_postfix);
 	if (IS_ERR(btrtl_dev))
 		return PTR_ERR(btrtl_dev);
 
@@ -905,7 +928,7 @@ static void h5_btrtl_open(struct h5 *h5)
 	serdev_device_set_baudrate(h5->hu->serdev, 115200);
 
 	/* The controller needs up to 500ms to wakeup */
-	gpiod_set_value_cansleep(h5->enable_gpio, 1);
+	gpiod_set_value_cansleep(h5->powerdown_gpio, 0);
 	gpiod_set_value_cansleep(h5->device_wake_gpio, 1);
 	msleep(500);
 }
@@ -913,7 +936,7 @@ static void h5_btrtl_open(struct h5 *h5)
 static void h5_btrtl_close(struct h5 *h5)
 {
 	gpiod_set_value_cansleep(h5->device_wake_gpio, 0);
-	gpiod_set_value_cansleep(h5->enable_gpio, 0);
+	gpiod_set_value_cansleep(h5->powerdown_gpio, 1);
 }
 
 /* Suspend/resume support. On many devices the RTL BT device loses power during
@@ -926,7 +949,7 @@ static int h5_btrtl_suspend(struct h5 *h5)
 {
 	serdev_device_set_flow_control(h5->hu->serdev, false);
 	gpiod_set_value_cansleep(h5->device_wake_gpio, 0);
-	gpiod_set_value_cansleep(h5->enable_gpio, 0);
+	gpiod_set_value_cansleep(h5->powerdown_gpio, 1);
 	return 0;
 }
 
@@ -967,11 +990,11 @@ static int h5_btrtl_resume(struct h5 *h5)
 }
 
 static const struct acpi_gpio_params btrtl_device_wake_gpios = { 0, 0, false };
-static const struct acpi_gpio_params btrtl_enable_gpios = { 1, 0, false };
+static const struct acpi_gpio_params btrtl_powerdown_gpios = { 1, 0, true };
 static const struct acpi_gpio_params btrtl_host_wake_gpios = { 2, 0, false };
 static const struct acpi_gpio_mapping acpi_btrtl_gpios[] = {
 	{ "device-wake-gpios", &btrtl_device_wake_gpios, 1 },
-	{ "enable-gpios", &btrtl_enable_gpios, 1 },
+	{ "powerdown-gpios", &btrtl_powerdown_gpios, 1 },
 	{ "host-wake-gpios", &btrtl_host_wake_gpios, 1 },
 	{},
 };
@@ -996,6 +1019,19 @@ static const struct acpi_device_id h5_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, h5_acpi_match);
 #endif
 
+#ifdef CONFIG_OF
+static const struct of_device_id h5_of_match[] = {
+#ifdef CONFIG_BT_HCIUART_RTL
+	{
+		.compatible = "realtek,rtl8723bs-bt",
+		.data = &rtl_vnd
+	},
+#endif
+	{ },
+};
+MODULE_DEVICE_TABLE(of, h5_of_match);
+#endif
+
 static const struct dev_pm_ops h5_serdev_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(h5_serdev_suspend, h5_serdev_resume)
 };
@@ -1006,6 +1042,7 @@ static struct serdev_device_driver h5_serdev_driver = {
 	.driver = {
 		.name = "hci_uart_h5",
 		.acpi_match_table = ACPI_PTR(h5_acpi_match),
+		.of_match_table = of_match_ptr(h5_of_match),
 		.pm = &h5_serdev_pm_ops,
 	},
 };
-- 
2.24.0

