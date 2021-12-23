Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEBCD47DDE4
	for <lists+linux-bluetooth@lfdr.de>; Thu, 23 Dec 2021 03:56:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345934AbhLWC4S (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 22 Dec 2021 21:56:18 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:60908 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1345958AbhLWC4R (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 22 Dec 2021 21:56:17 -0500
X-UUID: a2f085106f5f48eda74aeacc3d538755-20211223
X-UUID: a2f085106f5f48eda74aeacc3d538755-20211223
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <sean.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 2052840300; Thu, 23 Dec 2021 10:56:13 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Dec 2021 10:56:12 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 23 Dec
 2021 10:56:11 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Dec 2021 10:56:11 +0800
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
        Mark Chen <mark-yw.chen@mediatek.com>
Subject: [PATCH v3 1/3] Bluetooth: mt7921s: Support wake on bluetooth
Date:   Thu, 23 Dec 2021 10:56:07 +0800
Message-ID: <ceafc644ca9ce926a9fb07f7b3f4e2f701e69c8d.1640165092.git.sean.wang@kernel.org>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Mark Chen <mark-yw.chen@mediatek.com>

Enable wake on bluetooth on mt7921s that can be supported since the
firmware with version 20211129211059 was added, and the patch would
not cause any harm even when the old firmware is applied.

The patch was tested by setting up an HID or HOGP profile to connect a
Bluetooth keyboard and mouse, then putting the system to suspend, then
trying to wake up the system by moving the Bluetooth keyboard or mouse,
and then checking if the system can wake up and be brought back to
the normal state.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Mark Chen <mark-yw.chen@mediatek.com>
---
v2: refine the git message
v3:
    1. fit to single line as possible
    2. move the skb variable into local scope
    3. free skb after calling __hci_cmd_sync
    4. make bt_awake as const struct btmtk_wakeon
---
 drivers/bluetooth/btmtk.h     |  8 ++++++++
 drivers/bluetooth/btmtksdio.c | 33 ++++++++++++++++++++++++++++++++-
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index 6e7b0c7567c0..2be1d2680ad8 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -68,6 +68,14 @@ struct btmtk_tci_sleep {
 	u8 time_compensation;
 } __packed;
 
+struct btmtk_wakeon {
+	u8 mode;
+	u8 gpo;
+	u8 active_high;
+	__le16 enable_delay;
+	__le16 wakeup_delay;
+} __packed;
+
 struct btmtk_hci_wmt_params {
 	u8 op;
 	u8 flag;
diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index b5ea8d3bffaa..b79cee84f590 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -958,6 +958,32 @@ static int btmtksdio_send_frame(struct hci_dev *hdev, struct sk_buff *skb)
 	return 0;
 }
 
+static bool btmtk_sdio_wakeup(struct hci_dev *hdev)
+{
+	struct btmtksdio_dev *bdev = hci_get_drvdata(hdev);
+	bool may_wakeup = device_may_wakeup(bdev->dev);
+	const struct btmtk_wakeon bt_awake = {
+		.mode = 0x1,
+		.gpo = 0,
+		.active_high = 0x1,
+		.enable_delay = cpu_to_le16(0xc80),
+		.wakeup_delay = cpu_to_le16(0x20)
+	};
+
+	if (may_wakeup && bdev->data->chipid == 0x7921) {
+		struct sk_buff *skb;
+
+		skb =  __hci_cmd_sync(hdev, 0xfc27, sizeof(bt_awake),
+				      &bt_awake, HCI_CMD_TIMEOUT);
+		if (IS_ERR(skb))
+			may_wakeup = false;
+
+		kfree_skb(skb);
+	}
+
+	return may_wakeup;
+}
+
 static int btmtksdio_probe(struct sdio_func *func,
 			   const struct sdio_device_id *id)
 {
@@ -998,6 +1024,7 @@ static int btmtksdio_probe(struct sdio_func *func,
 	hdev->shutdown = btmtksdio_shutdown;
 	hdev->send     = btmtksdio_send_frame;
 	hdev->set_bdaddr = btmtk_set_bdaddr;
+	hdev->wakeup = btmtk_sdio_wakeup;
 
 	SET_HCIDEV_DEV(hdev, &func->dev);
 
@@ -1032,7 +1059,11 @@ static int btmtksdio_probe(struct sdio_func *func,
 	 */
 	pm_runtime_put_noidle(bdev->dev);
 
-	return 0;
+	err = device_init_wakeup(bdev->dev, true);
+	if (err)
+		bt_dev_err(hdev, "%s: failed to init_wakeup", __func__);
+
+	return err;
 }
 
 static void btmtksdio_remove(struct sdio_func *func)
-- 
2.25.1

