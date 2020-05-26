Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC01E19DEAF
	for <lists+linux-bluetooth@lfdr.de>; Fri,  3 Apr 2020 21:44:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728195AbgDCToP (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 3 Apr 2020 15:44:15 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:33889 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728151AbgDCToO (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 3 Apr 2020 15:44:14 -0400
Received: from localhost.localdomain (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 79341CED0B
        for <linux-bluetooth@vger.kernel.org>; Fri,  3 Apr 2020 21:53:46 +0200 (CEST)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH 06/10] Bluetooth: btusb: Enable MSFT extension for Intel ThunderPeak devices
Date:   Fri,  3 Apr 2020 21:44:03 +0200
Message-Id: <20200403194407.784943-7-marcel@holtmann.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Miao-chen Chou <mcchou@chromium.org>

The Intel ThundePeak BT controllers support the Microsoft vendor
extension and they are using 0xFC1E for VsMsftOpCode.

< HCI Command: Vendor (0x3f|0x001e) plen 1
        00
> HCI Event: Command Complete (0x0e) plen 15
      Vendor (0x3f|0x001e) ncmd 1
        Status: Success (0x00)
        00 3f 00 00 00 00 00 00 00 01 50

Signed-off-by: Miao-chen Chou <mcchou@chromium.org>
Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 drivers/bluetooth/btusb.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 43925bdeaa81..09913cadd1ca 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2542,6 +2542,15 @@ static int btusb_setup_intel_new(struct hci_dev *hdev)
 	btintel_version_info(hdev, &ver);
 
 finish:
+	/* All Intel controllers that support the Microsoft vendor
+	 * extension are using 0xFC1E for VsMsftOpCode.
+	 */
+	switch (ver.hw_variant) {
+	case 0x12:	/* ThP */
+		hci_set_msft_opcode(hdev, 0xFC1E);
+		break;
+	}
+
 	/* Set the event mask for Intel specific vendor events. This enables
 	 * a few extra events that are useful during general operation. It
 	 * does not enable any debugging related events.
-- 
2.25.1

