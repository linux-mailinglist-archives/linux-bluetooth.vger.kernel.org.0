Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 126A34654AA
	for <lists+linux-bluetooth@lfdr.de>; Wed,  1 Dec 2021 19:02:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238402AbhLASGP (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 1 Dec 2021 13:06:15 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:33596 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229975AbhLASGO (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 1 Dec 2021 13:06:14 -0500
X-UUID: 1b5f587df81e40588dc5b9256234ba6a-20211202
X-UUID: 1b5f587df81e40588dc5b9256234ba6a-20211202
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <sean.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1515505834; Thu, 02 Dec 2021 02:02:51 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 2 Dec 2021 02:02:49 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Dec 2021 02:02:49 +0800
From:   <sean.wang@mediatek.com>
To:     <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC:     <Mark-YW.Chen@mediatek.com>, <sean.wang@mediatek.com>,
        <Soul.Huang@mediatek.com>, <YN.Chen@mediatek.com>,
        <Leon.Yen@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
        <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>,
        <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>,
        <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
        <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>,
        <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
        <steve.lee@mediatek.com>, <jsiuda@google.com>,
        <frankgor@google.com>, <jemele@google.com>,
        <abhishekpandit@google.com>, <michaelfsun@google.com>,
        <mcchou@chromium.org>, <shawnku@google.com>,
        <linux-bluetooth@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Mark-yw Chen <mark-yw.chen@mediatek.com>
Subject: [PATCH v2 1/2] Bluetooth: Bluetooth: btmtksdio: handle runtime pm only when sdio_func is available
Date:   Thu, 2 Dec 2021 02:02:46 +0800
Message-ID: <73960845c299e2cd22c11b84014ff6ba4758e9bb.1638381385.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

Runtime pm ops is not aware the sdio_func status that is probably
being disabled by btmtksdio_close. Thus, we are only able to access the
sdio_func for the runtime pm operations only when the sdio_func is
available.

Fixes: 7f3c563c575e7 ("Bluetooth: btmtksdio: Add runtime PM support to SDIO based Bluetooth")
Co-developed-by: Mark-yw Chen <mark-yw.chen@mediatek.com>
Signed-off-by: Mark-yw Chen <mark-yw.chen@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2: not check HCI_RUNNING from a driver, use an internal flag instead
---
 drivers/bluetooth/btmtksdio.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index d9cf0c492e29..fc6317e519e9 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -99,6 +99,7 @@ MODULE_DEVICE_TABLE(sdio, btmtksdio_table);
 
 #define BTMTKSDIO_TX_WAIT_VND_EVT	1
 #define BTMTKSDIO_HW_TX_READY		2
+#define BTMTKSDIO_FUNC_ENABLED		3
 
 struct mtkbtsdio_hdr {
 	__le16	len;
@@ -539,6 +540,8 @@ static int btmtksdio_open(struct hci_dev *hdev)
 	if (err < 0)
 		goto err_release_host;
 
+	set_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state);
+
 	/* Get ownership from the device */
 	sdio_writel(bdev->func, C_FW_OWN_REQ_CLR, MTK_REG_CHLPCR, &err);
 	if (err < 0)
@@ -640,6 +643,7 @@ static int btmtksdio_close(struct hci_dev *hdev)
 	if (err < 0)
 		bt_dev_err(bdev->hdev, "Cannot return ownership to device");
 
+	clear_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state);
 	sdio_disable_func(bdev->func);
 
 	sdio_release_host(bdev->func);
@@ -1058,6 +1062,9 @@ static int btmtksdio_runtime_suspend(struct device *dev)
 	if (!bdev)
 		return 0;
 
+	if (!test_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state))
+		return 0;
+
 	sdio_claim_host(bdev->func);
 
 	sdio_writel(bdev->func, C_FW_OWN_REQ_SET, MTK_REG_CHLPCR, &err);
@@ -1085,6 +1092,9 @@ static int btmtksdio_runtime_resume(struct device *dev)
 	if (!bdev)
 		return 0;
 
+	if (!test_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state))
+		return 0;
+
 	sdio_claim_host(bdev->func);
 
 	sdio_writel(bdev->func, C_FW_OWN_REQ_CLR, MTK_REG_CHLPCR, &err);
-- 
2.25.1

