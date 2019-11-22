Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E906105D2B
	for <lists+linux-bluetooth@lfdr.de>; Fri, 22 Nov 2019 00:33:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbfKUXdv (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 21 Nov 2019 18:33:51 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:39404 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbfKUXdv (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 21 Nov 2019 18:33:51 -0500
Received: from localhost.localdomain (p4FF9F0D1.dip0.t-ipconnect.de [79.249.240.209])
        by mail.holtmann.org (Postfix) with ESMTPSA id 9E916CED18
        for <linux-bluetooth@vger.kernel.org>; Fri, 22 Nov 2019 00:42:56 +0100 (CET)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v2] Bluetooth: Allow combination of BDADDR_PROPERTY and INVALID_BDADDR quirks
Date:   Fri, 22 Nov 2019 00:33:45 +0100
Message-Id: <20191121233345.181569-1-marcel@holtmann.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

When utilizing BDADDR_PROPERTY and INVALID_BDADDR quirks together it
results in an unconfigured controller even if the bootloader provides
a valid address. Fix this by allowing a bootloader provided address
to mark the controller as configured.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Tested-by: Andre Heider <a.heider@gmail.com>
---
 net/bluetooth/hci_core.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 0cc9ce917222..9e19d5a3aac8 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -1444,11 +1444,20 @@ static int hci_dev_do_open(struct hci_dev *hdev)
 
 	if (hci_dev_test_flag(hdev, HCI_SETUP) ||
 	    test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
+		bool invalid_bdaddr;
+
 		hci_sock_dev_event(hdev, HCI_DEV_SETUP);
 
 		if (hdev->setup)
 			ret = hdev->setup(hdev);
 
+		/* The transport driver can set the quirk to mark the
+		 * BD_ADDR invalid before creating the HCI device or in
+		 * its setup callback.
+		 */
+		invalid_bdaddr = test_bit(HCI_QUIRK_INVALID_BDADDR,
+					  &hdev->quirks);
+
 		if (ret)
 			goto setup_failed;
 
@@ -1457,20 +1466,33 @@ static int hci_dev_do_open(struct hci_dev *hdev)
 				hci_dev_get_bd_addr_from_property(hdev);
 
 			if (bacmp(&hdev->public_addr, BDADDR_ANY) &&
-			    hdev->set_bdaddr)
+			    hdev->set_bdaddr) {
 				ret = hdev->set_bdaddr(hdev,
 						       &hdev->public_addr);
+
+				/* If setting of the BD_ADDR from the device
+				 * property succeeds, then treat the address
+				 * as valid even if the invalid BD_ADDR
+				 * quirk indicates otherwise.
+				 */
+				if (!ret)
+					invalid_bdaddr = false;
+			}
 		}
 
 setup_failed:
 		/* The transport driver can set these quirks before
 		 * creating the HCI device or in its setup callback.
 		 *
+		 * For the invalid BD_ADDR quirk it is possible that
+		 * it becomes a valid address if the bootloader does
+		 * provide it (see above).
+		 *
 		 * In case any of them is set, the controller has to
 		 * start up as unconfigured.
 		 */
 		if (test_bit(HCI_QUIRK_EXTERNAL_CONFIG, &hdev->quirks) ||
-		    test_bit(HCI_QUIRK_INVALID_BDADDR, &hdev->quirks))
+		    invalid_bdaddr)
 			hci_dev_set_flag(hdev, HCI_UNCONFIGURED);
 
 		/* For an unconfigured controller it is required to
-- 
2.23.0

