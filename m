Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A882919DEB1
	for <lists+linux-bluetooth@lfdr.de>; Fri,  3 Apr 2020 21:44:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728179AbgDCToO (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 3 Apr 2020 15:44:14 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:55138 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728158AbgDCToO (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 3 Apr 2020 15:44:14 -0400
Received: from localhost.localdomain (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 4FCAACED0A
        for <linux-bluetooth@vger.kernel.org>; Fri,  3 Apr 2020 21:53:46 +0200 (CEST)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH 05/10] Bluetooth: btusb: Enable Intel events even if already in operational mode
Date:   Fri,  3 Apr 2020 21:44:02 +0200
Message-Id: <20200403194407.784943-6-marcel@holtmann.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

In case the controller is already in operation mode, the Intel specific
events will not be enabled. Fix this by jumping to a common finish
section that will allow setting final details for the controller.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 drivers/bluetooth/btusb.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 110e96b245e5..43925bdeaa81 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2334,7 +2334,7 @@ static int btusb_setup_intel_new(struct hci_dev *hdev)
 	if (ver.fw_variant == 0x23) {
 		clear_bit(BTUSB_BOOTLOADER, &data->flags);
 		btintel_check_bdaddr(hdev);
-		return 0;
+		goto finish;
 	}
 
 	/* If the device is not in bootloader mode, then the only possible
@@ -2534,6 +2534,14 @@ static int btusb_setup_intel_new(struct hci_dev *hdev)
 	 */
 	btintel_load_ddc_config(hdev, fwname);
 
+	/* Read the Intel version information after loading the FW  */
+	err = btintel_read_version(hdev, &ver);
+	if (err)
+		return err;
+
+	btintel_version_info(hdev, &ver);
+
+finish:
 	/* Set the event mask for Intel specific vendor events. This enables
 	 * a few extra events that are useful during general operation. It
 	 * does not enable any debugging related events.
@@ -2543,13 +2551,6 @@ static int btusb_setup_intel_new(struct hci_dev *hdev)
 	 */
 	btintel_set_event_mask(hdev, false);
 
-	/* Read the Intel version information after loading the FW  */
-	err = btintel_read_version(hdev, &ver);
-	if (err)
-		return err;
-
-	btintel_version_info(hdev, &ver);
-
 	return 0;
 }
 
-- 
2.25.1

