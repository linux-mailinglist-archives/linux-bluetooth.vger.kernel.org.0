Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98F44DA756
	for <lists+linux-bluetooth@lfdr.de>; Thu, 17 Oct 2019 10:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390584AbfJQI1u (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 17 Oct 2019 04:27:50 -0400
Received: from mga05.intel.com ([192.55.52.43]:7577 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389585AbfJQI1u (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 17 Oct 2019 04:27:50 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Oct 2019 01:27:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,307,1566889200"; 
   d="scan'208";a="200320715"
Received: from ubuntu-16-04.iind.intel.com ([10.224.186.155])
  by orsmga006.jf.intel.com with ESMTP; 17 Oct 2019 01:27:47 -0700
From:   Amit K Bag <amit.k.bag@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     ravishankar.srivatsa@intel.com, chethan.tumkur.narayan@intel.com,
        Amit K Bag <amit.k.bag@intel.com>,
        Raghuram Hegde <raghuram.hegde@intel.com>
Subject: [PATCH v6] Bluetooth: btusb: Trigger Intel FW download error recovery
Date:   Thu, 17 Oct 2019 13:52:29 +0530
Message-Id: <1571300549-27306-1-git-send-email-amit.k.bag@intel.com>
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
 drivers/bluetooth/btintel.c | 46 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/bluetooth/btintel.h |  6 ++++++
 drivers/bluetooth/btusb.c   | 20 ++++++++++++++++----
 3 files changed, 68 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/btintel.c b/drivers/bluetooth/btintel.c
index bb99c8653aab..b69cdf991a9a 100644
--- a/drivers/bluetooth/btintel.c
+++ b/drivers/bluetooth/btintel.c
@@ -709,6 +709,52 @@ int btintel_download_firmware(struct hci_dev *hdev, const struct firmware *fw,
 }
 EXPORT_SYMBOL_GPL(btintel_download_firmware);
 
+void btintel_reset_to_bootloader(struct hci_dev *hdev)
+{
+	const struct intel_reset params;
+	struct sk_buff *skb;
+	u32 boot_param;
+
+	/* Send Intel Reset command. This will result in
+	 * re-enumeration of BT controller.
+	 *
+	 * Intel Reset parameter description:
+	 * reset_type :   0x00 (Soft reset),
+	 *		  0x01 (Hard reset)
+	 * patch_enable : 0x00 (Do not enable),
+	 *		  0x01 (Enable)
+	 * ddc_reload :   0x00 (Do not reload),
+	 *		  0x01 (Reload)
+	 * boot_option:   0x00 (Current image),
+	 *                0x01 (Specified boot address)
+	 * boot_param:    Boot address
+	 *
+	 */
+	params.reset_type = 0x01;
+	params.patch_enable = 0x01;
+	params.ddc_reload = 0x01;
+	params.boot_option = 0x00;
+	params.boot_param = cpu_to_le32(0x00000000);
+
+	skb = __hci_cmd_sync(hdev, 0xfc01, sizeof(params),
+			     &params, HCI_INIT_TIMEOUT);
+	if (IS_ERR(skb)) {
+		bt_dev_err(hdev, "FW download error recovery failed (%ld)",
+			   PTR_ERR(skb));
+		return;
+	}
+	bt_dev_info(hdev, "Intel reset sent to retry FW download");
+	kfree_skb(skb);
+
+	/* Current Intel BT controllers(ThP/JfP) hold the USB reset
+	 * lines for 2ms when it receives Intel Reset in bootloader mode.
+	 * Whereas, the upcoming Intel BT controllers will hold USB reset
+	 * for 150ms. To keep the delay generic, 150ms is chosen here.
+	 */
+	msleep(150);
+}
+EXPORT_SYMBOL_GPL(btintel_reset_to_bootloader);
+
 MODULE_AUTHOR("Marcel Holtmann <marcel@holtmann.org>");
 MODULE_DESCRIPTION("Bluetooth support for Intel devices ver " VERSION);
 MODULE_VERSION(VERSION);
diff --git a/drivers/bluetooth/btintel.h b/drivers/bluetooth/btintel.h
index 3d846190f2bf..d2311156f778 100644
--- a/drivers/bluetooth/btintel.h
+++ b/drivers/bluetooth/btintel.h
@@ -87,6 +87,7 @@ int btintel_read_boot_params(struct hci_dev *hdev,
 			     struct intel_boot_params *params);
 int btintel_download_firmware(struct hci_dev *dev, const struct firmware *fw,
 			      u32 *boot_param);
+void btintel_reset_to_bootloader(struct hci_dev *hdev);
 #else
 
 static inline int btintel_check_bdaddr(struct hci_dev *hdev)
@@ -181,4 +182,9 @@ static inline int btintel_download_firmware(struct hci_dev *dev,
 {
 	return -EOPNOTSUPP;
 }
+
+static inline void btintel_reset_to_bootloader(struct hci_dev *hdev)
+{
+	return -EOPNOTSUPP;
+}
 #endif
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 5d7bc3410104..f706fde081ce 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2182,8 +2182,11 @@ static int btusb_setup_intel_new(struct hci_dev *hdev)
 	 * loaded.
 	 */
 	err = btintel_read_version(hdev, &ver);
-	if (err)
+	if (err) {
+		bt_dev_err(hdev, "Intel Read version failed (%d)", err);
+		btintel_reset_to_bootloader(hdev);	
 		return err;
+	}
 
 	/* The hardware platform number has a fixed value of 0x37 and
 	 * for now only accept this single value.
@@ -2326,9 +2329,13 @@ static int btusb_setup_intel_new(struct hci_dev *hdev)
 
 	/* Start firmware downloading and get boot parameter */
 	err = btintel_download_firmware(hdev, fw, &boot_param);
-	if (err < 0)
+	if (err < 0) {
+		/* When FW download fails, send Intel Reset to retry
+		 * FW download.
+		 */
+		btintel_reset_to_bootloader(hdev);
 		goto done;
-
+	}
 	set_bit(BTUSB_FIRMWARE_LOADED, &data->flags);
 
 	bt_dev_info(hdev, "Waiting for firmware download to complete");
@@ -2355,6 +2362,7 @@ static int btusb_setup_intel_new(struct hci_dev *hdev)
 	if (err) {
 		bt_dev_err(hdev, "Firmware loading timeout");
 		err = -ETIMEDOUT;
+		btintel_reset_to_bootloader(hdev);
 		goto done;
 	}
 
@@ -2381,8 +2389,11 @@ static int btusb_setup_intel_new(struct hci_dev *hdev)
 	set_bit(BTUSB_BOOTING, &data->flags);
 
 	err = btintel_send_intel_reset(hdev, boot_param);
-	if (err)
+	if (err) {
+		bt_dev_err(hdev, "Intel Soft Reset failed (%d)", err);
+		btintel_reset_to_bootloader(hdev);
 		return err;
+	}
 
 	/* The bootloader will not indicate when the device is ready. This
 	 * is done by the operational firmware sending bootup notification.
@@ -2404,6 +2415,7 @@ static int btusb_setup_intel_new(struct hci_dev *hdev)
 
 	if (err) {
 		bt_dev_err(hdev, "Device boot timeout");
+		btintel_reset_to_bootloader(hdev);
 		return -ETIMEDOUT;
 	}
 
-- 
2.7.4

