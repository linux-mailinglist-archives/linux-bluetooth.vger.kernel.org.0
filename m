Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7F0F47DDE6
	for <lists+linux-bluetooth@lfdr.de>; Thu, 23 Dec 2021 03:56:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346084AbhLWC4U (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 22 Dec 2021 21:56:20 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:32782 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1345887AbhLWC4T (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 22 Dec 2021 21:56:19 -0500
X-UUID: 3989451274c94ac6a4974e3bfc79cc76-20211223
X-UUID: 3989451274c94ac6a4974e3bfc79cc76-20211223
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
        (envelope-from <sean.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1279293211; Thu, 23 Dec 2021 10:56:16 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Thu, 23 Dec 2021 10:56:14 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 23 Dec
 2021 10:56:14 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Dec 2021 10:56:13 +0800
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
Subject: [PATCH v3 2/3] Bluetooth: mt7921s: Enable SCO over I2S
Date:   Thu, 23 Dec 2021 10:56:08 +0800
Message-ID: <ae2e13f3193a02d3d670224730f5e50b79119ac3.1640165092.git.sean.wang@kernel.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <ceafc644ca9ce926a9fb07f7b3f4e2f701e69c8d.1640165092.git.sean.wang@kernel.org>
References: <ceafc644ca9ce926a9fb07f7b3f4e2f701e69c8d.1640165092.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Mark Chen <mark-yw.chen@mediatek.com>

The driver has to issue the specific command to enable Bluetooth SCO over
the I2S/PCM interface on mt7921s, that is supported since the firmware
with version 20211215151112 was added, and the patch would not cause any
harm even when the old firmware is applied.

The SCO profile with the patch was tested by setting up a VOIP application,
connected to HFP device, checked telephony function can work normally.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Mark Chen <mark-yw.chen@mediatek.com>
---
v2: refine git message and fix typo
v3:
    1. free skb after calling  __hci_cmd_sync
    2. make bt_awake as const struct btmtk_sco
---
 drivers/bluetooth/btmtk.h     | 20 +++++++++
 drivers/bluetooth/btmtksdio.c | 78 +++++++++++++++++++++++++++++++++++
 2 files changed, 98 insertions(+)

diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index 2be1d2680ad8..fc57ef09d132 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -7,8 +7,12 @@
 
 #define HCI_WMT_MAX_EVENT_SIZE		64
 
+#define BTMTK_WMT_REG_WRITE 0x1
 #define BTMTK_WMT_REG_READ 0x2
 
+#define MT7921_PINMUX_0 0x70005050
+#define MT7921_PINMUX_1 0x70005054
+
 enum {
 	BTMTK_WMT_PATCH_DWNLD = 0x1,
 	BTMTK_WMT_TEST = 0x2,
@@ -76,6 +80,22 @@ struct btmtk_wakeon {
 	__le16 wakeup_delay;
 } __packed;
 
+struct btmtk_sco {
+	u8 clock_config;
+	u8 transmit_format_config;
+	u8 channel_format_config;
+	u8 channel_select_config;
+} __packed;
+
+struct reg_write_cmd {
+	u8 type;
+	u8 rsv;
+	u8 num;
+	__le32 addr;
+	__le32 data;
+	__le32 mask;
+} __packed;
+
 struct btmtk_hci_wmt_params {
 	u8 op;
 	u8 flag;
diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index b79cee84f590..322a4367f0f6 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -830,6 +830,76 @@ static int btsdio_mtk_reg_read(struct hci_dev *hdev, u32 reg, u32 *val)
 	return err;
 }
 
+static int btsdio_mtk_reg_write(struct hci_dev *hdev, u32 reg, u32 val, u32 mask)
+{
+	struct btmtk_hci_wmt_params wmt_params;
+	struct reg_write_cmd reg_write = {
+		.type = 1,
+		.num = 1,
+		.addr = cpu_to_le32(reg),
+		.data = cpu_to_le32(val),
+		.mask = cpu_to_le32(mask),
+	};
+	int err, status;
+
+	wmt_params.op = BTMTK_WMT_REGISTER;
+	wmt_params.flag = BTMTK_WMT_REG_WRITE;
+	wmt_params.dlen = sizeof(reg_write);
+	wmt_params.data = &reg_write;
+	wmt_params.status = &status;
+
+	err = mtk_hci_wmt_sync(hdev, &wmt_params);
+	if (err < 0)
+		bt_dev_err(hdev, "Failed to write reg(%d)", err);
+
+	return err;
+}
+
+static int btsdio_mtk_sco_setting(struct hci_dev *hdev)
+{
+	const struct btmtk_sco sco_setting = {
+		.clock_config = 0x49,
+		.channel_format_config = 0x80,
+	};
+	struct sk_buff *skb;
+	u32 val;
+	int err;
+
+	/* Enable SCO over I2S/PCM for MediaTek chipset */
+	skb =  __hci_cmd_sync(hdev, 0xfc72, sizeof(sco_setting),
+			      &sco_setting, HCI_CMD_TIMEOUT);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	kfree_skb(skb);
+
+	err = btsdio_mtk_reg_read(hdev, MT7921_PINMUX_0, &val);
+	if (err < 0) {
+		bt_dev_err(hdev, "Failed to read register (%d)", err);
+		return err;
+	}
+
+	val |= 0x11000000;
+	err = btsdio_mtk_reg_write(hdev, MT7921_PINMUX_0, val, ~0);
+	if (err < 0) {
+		bt_dev_err(hdev, "Failed to write register (%d)", err);
+		return err;
+	}
+
+	err = btsdio_mtk_reg_read(hdev, MT7921_PINMUX_1, &val);
+	if (err < 0) {
+		bt_dev_err(hdev, "Failed to read register (%d)", err);
+		return err;
+	}
+
+	val |= 0x00000101;
+	err = btsdio_mtk_reg_write(hdev, MT7921_PINMUX_1, val, ~0);
+	if (err < 0)
+		bt_dev_err(hdev, "Failed to write register (%d)", err);
+
+	return err;
+}
+
 static int btmtksdio_setup(struct hci_dev *hdev)
 {
 	struct btmtksdio_dev *bdev = hci_get_drvdata(hdev);
@@ -862,6 +932,14 @@ static int btmtksdio_setup(struct hci_dev *hdev)
 		err = mt79xx_setup(hdev, fwname);
 		if (err < 0)
 			return err;
+
+		/* Enable SCO over I2S/PCM */
+		err = btsdio_mtk_sco_setting(hdev);
+		if (err < 0) {
+			bt_dev_err(hdev, "Failed to enable SCO setting (%d)", err);
+			return err;
+		}
+
 		break;
 	case 0x7663:
 	case 0x7668:
-- 
2.25.1

