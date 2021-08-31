Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B95503FC7A7
	for <lists+linux-bluetooth@lfdr.de>; Tue, 31 Aug 2021 14:55:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231963AbhHaM4B (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 31 Aug 2021 08:56:01 -0400
Received: from mga17.intel.com ([192.55.52.151]:2326 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230175AbhHaM4A (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 31 Aug 2021 08:56:00 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10092"; a="198700654"
X-IronPort-AV: E=Sophos;i="5.84,366,1620716400"; 
   d="scan'208";a="198700654"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2021 05:55:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,366,1620716400"; 
   d="scan'208";a="509929071"
Received: from intel-lenovo-legion-y540-15irh-pg0.iind.intel.com ([10.224.186.95])
  by orsmga001.jf.intel.com with ESMTP; 31 Aug 2021 05:55:02 -0700
From:   Kiran K <kiran.k@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     ravishankar.srivatsa@intel.com, chethan.tumkur.narayan@intel.com,
        tedd.an@intel.com, luiz.von.dentz@intel.com,
        Kiran K <kiran.k@intel.com>
Subject: [PATCH v2 2/2] Bluetooth: btintel: Read boot address irrespective of controller mode
Date:   Tue, 31 Aug 2021 18:30:05 +0530
Message-Id: <20210831130005.4920-2-kiran.k@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210831130005.4920-1-kiran.k@intel.com>
References: <20210831130005.4920-1-kiran.k@intel.com>
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Boot address was not getting updated when controller is present
in boot mode which is required to move the controller from boot mode
to operation mode after firmware download. This patch reads boot address
even if controller is present in boot mode.

Signed-off-by: Kiran K <kiran.k@intel.com>
---

Notes:
    changes in v2 (new patch):
     - Read boot address irrespective of controller mode

 drivers/bluetooth/btintel.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/bluetooth/btintel.c b/drivers/bluetooth/btintel.c
index 14360370a2ac..7236f40b7a9c 100644
--- a/drivers/bluetooth/btintel.c
+++ b/drivers/bluetooth/btintel.c
@@ -1072,9 +1072,6 @@ int btintel_download_firmware(struct hci_dev *hdev,
 		/* Skip version checking */
 		break;
 	default:
-		/* Skip reading firmware file version in bootloader mode */
-		if (ver->fw_variant == 0x06)
-			break;
 
 		/* Skip download if firmware has the same version */
 		if (btintel_firmware_version(hdev, ver->fw_build_num,
@@ -1115,19 +1112,16 @@ static int btintel_download_fw_tlv(struct hci_dev *hdev,
 	int err;
 	u32 css_header_ver;
 
-	/* Skip reading firmware file version in bootloader mode */
-	if (ver->img_type != 0x01) {
-		/* Skip download if firmware has the same version */
-		if (btintel_firmware_version(hdev, ver->min_fw_build_nn,
-					     ver->min_fw_build_cw,
-					     ver->min_fw_build_yy,
-					     fw, boot_param)) {
-			bt_dev_info(hdev, "Firmware already loaded");
-			/* Return -EALREADY to indicate that firmware has
-			 * already been loaded.
-			 */
-			return -EALREADY;
-		}
+	/* Skip download if firmware has the same version */
+	if (btintel_firmware_version(hdev, ver->min_fw_build_nn,
+				     ver->min_fw_build_cw,
+				     ver->min_fw_build_yy,
+				     fw, boot_param)) {
+		bt_dev_info(hdev, "Firmware already loaded");
+		/* Return -EALREADY to indicate that firmware has
+		 * already been loaded.
+		 */
+		return -EALREADY;
 	}
 
 	/* The firmware variant determines if the device is in bootloader
-- 
2.17.1

