Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 150E2BEC28
	for <lists+linux-bluetooth@lfdr.de>; Thu, 26 Sep 2019 08:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403869AbfIZGsa (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 26 Sep 2019 02:48:30 -0400
Received: from mga03.intel.com ([134.134.136.65]:28574 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730840AbfIZGsa (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 26 Sep 2019 02:48:30 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Sep 2019 23:48:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,550,1559545200"; 
   d="scan'208";a="183527493"
Received: from unknown (HELO ubuntu-16-04.iind.intel.com) ([10.224.186.155])
  by orsmga008.jf.intel.com with ESMTP; 25 Sep 2019 23:48:27 -0700
From:   Amit K Bag <amit.k.bag@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     ravishankar.srivatsa@intel.com, chethan.tumkur.narayan@intel.com,
        Amit K Bag <amit.k.bag@intel.com>,
        Raghuram Hegde <raghuram.hegde@intel.com>
Subject: [PATCH] Bluetooth: btusb: Trigger Intel FW download error recovery
Date:   Thu, 26 Sep 2019 12:13:22 +0530
Message-Id: <1569480202-10560-1-git-send-email-amit.k.bag@intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Sometimes during FW data download stage, in case of an error is
encountered the controller device could not be recovered. To recover
from such failures send Intel hard Reset to re-trigger FW download in
following error scenarios:

1. Intel Read version command error
2. Firmware download timeout
3. Failure in Intel Soft Reset for switching to operational FW
4. Boot timeout for switching to operaional FW

Signed-off-by: Raghuram Hegde <raghuram.hegde@intel.com>
Signed-off-by: Chethan T N <chethan.tumkur.narayan@intel.com>
Signed-off-by: Amit K Bag <amit.k.bag@intel.com>
---
 drivers/bluetooth/btintel.c | 39 +++++++++++++++++++++++++++++++++++++++
 drivers/bluetooth/btintel.h |  6 ++++++
 drivers/bluetooth/btusb.c   | 20 ++++++++++++++++----
 3 files changed, 61 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/btintel.c b/drivers/bluetooth/btintel.c
index bb99c8653aab..fdec9c53b48d 100644
--- a/drivers/bluetooth/btintel.c
+++ b/drivers/bluetooth/btintel.c
@@ -709,6 +709,45 @@ int btintel_download_firmware(struct hci_dev *hdev, const struct firmware *fw,
 }
 EXPORT_SYMBOL_GPL(btintel_download_firmware);
 
+void btintel_retry_fw_download(struct hci_dev *hdev)
+{
+	/* Send Intel Reset command. This will result in
+	 * re-enumeration of BT controller.
+	 *
+	 * Intel Reset parameter description:
+	 * reset_param[0] => reset_type : 0x01 (Hard reset),
+					  0x00 (Soft reset)
+	 * reset_param[1] => patch_enable : 0x01 (Enable),
+	 *				    0x00 (Do not enable)
+	 * reset_param[2] => ddc_reload : 0x01 (Reload),
+	 *				  0x00 (Do not reload)
+	 * reset_param[3] => boot_option: 0x00 (Current image),
+					  0x01 (Specified boot address)
+	 * reset_param[4] to reset_param[7] => Boot address
+	 *
+	 */
+	static const u8 reset_param[] = { 0x01, 0x01, 0x01, 0x00,
+					0x00, 0x00, 0x00, 0x00 };
+	struct sk_buff *skb;
+
+	skb = __hci_cmd_sync(hdev, 0xfc01, sizeof(reset_param),
+				reset_param, HCI_INIT_TIMEOUT);
+	if (IS_ERR(skb)) {
+		bt_dev_err(hdev, "FW download error recovery failed (%ld)",
+				PTR_ERR(skb));
+		return;
+	}
+	bt_dev_info(hdev, "Intel reset sent to retry FW download");
+	kfree_skb(skb);
+	/* Current Intel BT controllers(ThP/JfP) hold the USB reset
+	 * lines for 2ms when it receives Intel Reset in bootloader mode.
+	 * Whereas, the upcoming Intel BT controllers will hold USB reset
+	 * for 150ms. To keep the delay generic, 150ms is chosen here.
+	 */
+	msleep(150);
+}
+EXPORT_SYMBOL_GPL(btintel_retry_fw_download);
+
 MODULE_AUTHOR("Marcel Holtmann <marcel@holtmann.org>");
 MODULE_DESCRIPTION("Bluetooth support for Intel devices ver " VERSION);
 MODULE_VERSION(VERSION);
diff --git a/drivers/bluetooth/btintel.h b/drivers/bluetooth/btintel.h
index 3d846190f2bf..d04d3c7cb513 100644
--- a/drivers/bluetooth/btintel.h
+++ b/drivers/bluetooth/btintel.h
@@ -87,6 +87,7 @@ int btintel_read_boot_params(struct hci_dev *hdev,
 			     struct intel_boot_params *params);
 int btintel_download_firmware(struct hci_dev *dev, const struct firmware *fw,
 			      u32 *boot_param);
+void btintel_retry_fw_download(struct hci_dev *hdev);
 #else
 
 static inline int btintel_check_bdaddr(struct hci_dev *hdev)
@@ -181,4 +182,9 @@ static inline int btintel_download_firmware(struct hci_dev *dev,
 {
 	return -EOPNOTSUPP;
 }
+
+static inline void btintel_retry_fw_download(struct hci_dev *hdev)
+{
+	return -EOPNOTSUPP;
+}
 #endif
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index a9c35ebb30f8..7a763bd856ba 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -1846,8 +1846,11 @@ static int btusb_setup_intel(struct hci_dev *hdev)
 	 * firmware variant, revision and build number.
 	 */
 	err = btintel_read_version(hdev, &ver);
-	if (err)
+	if (err) {
+		bt_dev_err(hdev, "Intel Read version failed (%d)", err);
+		btintel_retry_fw_download(hdev);
 		return err;
+	}
 
 	bt_dev_info(hdev, "read Intel version: %02x%02x%02x%02x%02x%02x%02x%02x%02x",
 		    ver.hw_platform, ver.hw_variant, ver.hw_revision,
@@ -2326,9 +2329,13 @@ static int btusb_setup_intel_new(struct hci_dev *hdev)
 
 	/* Start firmware downloading and get boot parameter */
 	err = btintel_download_firmware(hdev, fw, &boot_param);
-	if (err < 0)
+	if (err < 0) {
+		/* When FW download fails, send Intel Reset to retry
+		 * FW download.
+		 */
+		btintel_retry_fw_download(hdev);
 		goto done;
-
+	}
 	set_bit(BTUSB_FIRMWARE_LOADED, &data->flags);
 
 	bt_dev_info(hdev, "Waiting for firmware download to complete");
@@ -2355,6 +2362,7 @@ static int btusb_setup_intel_new(struct hci_dev *hdev)
 	if (err) {
 		bt_dev_err(hdev, "Firmware loading timeout");
 		err = -ETIMEDOUT;
+		btintel_retry_fw_download(hdev);
 		goto done;
 	}
 
@@ -2381,8 +2389,11 @@ static int btusb_setup_intel_new(struct hci_dev *hdev)
 	set_bit(BTUSB_BOOTING, &data->flags);
 
 	err = btintel_send_intel_reset(hdev, boot_param);
-	if (err)
+	if (err) {
+		bt_dev_err(hdev, "Intel Soft Reset failed (%d)", err);
+		btintel_retry_fw_download(hdev);
 		return err;
+	}
 
 	/* The bootloader will not indicate when the device is ready. This
 	 * is done by the operational firmware sending bootup notification.
@@ -2404,6 +2415,7 @@ static int btusb_setup_intel_new(struct hci_dev *hdev)
 
 	if (err) {
 		bt_dev_err(hdev, "Device boot timeout");
+		btintel_retry_fw_download(hdev);
 		return -ETIMEDOUT;
 	}
 
-- 
2.7.4

