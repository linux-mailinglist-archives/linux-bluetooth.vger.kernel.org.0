Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D554510997F
	for <lists+linux-bluetooth@lfdr.de>; Tue, 26 Nov 2019 08:17:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727150AbfKZHRj (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 26 Nov 2019 02:17:39 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:50613 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbfKZHRi (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 26 Nov 2019 02:17:38 -0500
Received: from localhost.localdomain (p4FF9F0D1.dip0.t-ipconnect.de [79.249.240.209])
        by mail.holtmann.org (Postfix) with ESMTPSA id 6C037CECF6
        for <linux-bluetooth@vger.kernel.org>; Tue, 26 Nov 2019 08:26:45 +0100 (CET)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v2 1/4] Bluetooth: hci_bcm: Disallow set_baudrate for BCM4354
Date:   Tue, 26 Nov 2019 08:17:29 +0100
Message-Id: <20191126071732.67337-1-marcel@holtmann.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

Without updating the patchram, the BCM4354 does not support a higher
operating speed. The normal bcm_setup follows the correct order
(init_speed, patchram and then oper_speed) but the serdev driver will
set the operating speed before calling the hu->setup function. Thus,
for the BCM4354, don't set the operating speed before patchram.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 drivers/bluetooth/hci_bcm.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index d2a6a4afdbbb..0200eff12bc9 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -47,6 +47,14 @@
 
 #define BCM_NUM_SUPPLIES 2
 
+/**
+ * struct bcm_device_data - device specific data
+ * @no_early_set_baudrate: Disallow set baudrate before driver setup()
+ */
+struct bcm_device_data {
+	bool	no_early_set_baudrate;
+};
+
 /**
  * struct bcm_device - device driver resources
  * @serdev_hu: HCI UART controller struct
@@ -79,6 +87,7 @@
  * @hu: pointer to HCI UART controller struct,
  *	used to disable flow control during runtime suspend and system sleep
  * @is_suspended: whether flow control is currently disabled
+ * @no_early_set_baudrate: don't set_baudrate before setup()
  */
 struct bcm_device {
 	/* Must be the first member, hci_serdev.c expects this. */
@@ -112,6 +121,7 @@ struct bcm_device {
 	struct hci_uart		*hu;
 	bool			is_suspended;
 #endif
+	bool			no_early_set_baudrate;
 };
 
 /* generic bcm uart resources */
@@ -447,7 +457,13 @@ static int bcm_open(struct hci_uart *hu)
 	if (bcm->dev) {
 		hci_uart_set_flow_control(hu, true);
 		hu->init_speed = bcm->dev->init_speed;
-		hu->oper_speed = bcm->dev->oper_speed;
+
+		/* If oper_speed is set, ldisc/serdev will set the baudrate
+		 * before calling setup()
+		 */
+		if (!bcm->dev->no_early_set_baudrate)
+			hu->oper_speed = bcm->dev->oper_speed;
+
 		err = bcm_gpio_set_power(bcm->dev, true);
 		hci_uart_set_flow_control(hu, false);
 		if (err)
@@ -565,6 +581,8 @@ static int bcm_setup(struct hci_uart *hu)
 	/* Operational speed if any */
 	if (hu->oper_speed)
 		speed = hu->oper_speed;
+	else if (bcm->dev && bcm->dev->oper_speed)
+		speed = bcm->dev->oper_speed;
 	else if (hu->proto->oper_speed)
 		speed = hu->proto->oper_speed;
 	else
@@ -1374,6 +1392,7 @@ static struct platform_driver bcm_driver = {
 static int bcm_serdev_probe(struct serdev_device *serdev)
 {
 	struct bcm_device *bcmdev;
+	const struct bcm_device_data *data;
 	int err;
 
 	bcmdev = devm_kzalloc(&serdev->dev, sizeof(*bcmdev), GFP_KERNEL);
@@ -1408,6 +1427,10 @@ static int bcm_serdev_probe(struct serdev_device *serdev)
 	if (err)
 		dev_err(&serdev->dev, "Failed to power down\n");
 
+	data = device_get_match_data(bcmdev->dev);
+	if (data)
+		bcmdev->no_early_set_baudrate = data->no_early_set_baudrate;
+
 	return hci_uart_register_device(&bcmdev->serdev_hu, &bcm_proto);
 }
 
@@ -1419,12 +1442,16 @@ static void bcm_serdev_remove(struct serdev_device *serdev)
 }
 
 #ifdef CONFIG_OF
+static struct bcm_device_data bcm4354_device_data = {
+	.no_early_set_baudrate = true,
+};
+
 static const struct of_device_id bcm_bluetooth_of_match[] = {
 	{ .compatible = "brcm,bcm20702a1" },
 	{ .compatible = "brcm,bcm4345c5" },
 	{ .compatible = "brcm,bcm4330-bt" },
 	{ .compatible = "brcm,bcm43438-bt" },
-	{ .compatible = "brcm,bcm43540-bt" },
+	{ .compatible = "brcm,bcm43540-bt", .data = &bcm4354_device_data },
 	{ .compatible = "brcm,bcm4335a0" },
 	{ },
 };
-- 
2.23.0

