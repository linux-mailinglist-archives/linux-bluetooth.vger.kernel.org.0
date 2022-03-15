Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE8F34DA1BD
	for <lists+linux-bluetooth@lfdr.de>; Tue, 15 Mar 2022 19:00:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350846AbiCOSBc (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 15 Mar 2022 14:01:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350830AbiCOSB3 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 15 Mar 2022 14:01:29 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CE3958E7A;
        Tue, 15 Mar 2022 11:00:16 -0700 (PDT)
X-UUID: b121d24c9a0f431699757da28a3b5638-20220316
X-UUID: b121d24c9a0f431699757da28a3b5638-20220316
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <sean.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1024522193; Wed, 16 Mar 2022 02:00:09 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Mar 2022 02:00:08 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Mar 2022 02:00:08 +0800
From:   <sean.wang@mediatek.com>
To:     <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC:     <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
        <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
        <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>,
        <km.lin@mediatek.com>, <robin.chiu@mediatek.com>,
        <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
        <posh.sun@mediatek.com>, <ted.huang@mediatek.com>,
        <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>,
        <Tom.Chou@mediatek.com>, <steve.lee@mediatek.com>,
        <jsiuda@google.com>, <frankgor@google.com>,
        <abhishekpandit@google.com>, <michaelfsun@google.com>,
        <mcchou@chromium.org>, <shawnku@google.com>,
        <linux-bluetooth@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Yake Yang <yake.yang@mediatek.com>
Subject: [PATCH RESEND 3/5] Bluetooth: mt7921s: Add .get_data_path_id
Date:   Wed, 16 Mar 2022 02:00:02 +0800
Message-ID: <b790033dfbaded0ccec1247200dc2bc22a7a7cac.1647367024.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <7b4627d5017be2c26ded9daf7fd297bed6614852.1647367024.git.objelf@gmail.com>
References: <7b4627d5017be2c26ded9daf7fd297bed6614852.1647367024.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Yake Yang <yake.yang@mediatek.com>

Add .get_data_path_id to fetch data_path_id for MT7921 to support HFP
offload use case.

This is a preliminary patch to add the WBS support to the MT7921 driver.

Reviewed-by: Mark Chen <markyawenchen@gmail.com>
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Yake Yang <yake.yang@mediatek.com>
---
 drivers/bluetooth/btmtksdio.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index 034e55278c56..4000a994fe2c 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -936,6 +936,13 @@ static int btmtksdio_mtk_reg_write(struct hci_dev *hdev, u32 reg, u32 val, u32 m
 	return err;
 }
 
+static int btmtksdio_get_data_path_id(struct hci_dev *hdev, __u8 *data_path_id)
+{
+	/* uses 1 as data path id for all the usecases */
+	*data_path_id = 1;
+	return 0;
+}
+
 static int btmtksdio_sco_setting(struct hci_dev *hdev)
 {
 	const struct btmtk_sco sco_setting = {
@@ -968,7 +975,13 @@ static int btmtksdio_sco_setting(struct hci_dev *hdev)
 		return err;
 
 	val |= 0x00000101;
-	return btmtksdio_mtk_reg_write(hdev, MT7921_PINMUX_1, val, ~0);
+	err =  btmtksdio_mtk_reg_write(hdev, MT7921_PINMUX_1, val, ~0);
+	if (err < 0)
+		return err;
+
+	hdev->get_data_path_id = btmtksdio_get_data_path_id;
+
+	return err;
 }
 
 static int btmtksdio_reset_setting(struct hci_dev *hdev)
-- 
2.25.1

