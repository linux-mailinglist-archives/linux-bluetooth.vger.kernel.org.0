Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7848013527F
	for <lists+linux-bluetooth@lfdr.de>; Thu,  9 Jan 2020 06:14:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbgAIFOg (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 9 Jan 2020 00:14:36 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:21911 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725308AbgAIFOg (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 9 Jan 2020 00:14:36 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578546876; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=eS9lCZyPtTj+osj5AKiBGLWtwqWO/aNwkaHwJOw+u/8=; b=SIqC46tsLlpMYKFgwnSsJAGdjq2JhAR9UM04SXMpZh0G7I7mw+HoBUPWLQsMajllMA6Wtbdu
 ye30lWGt3SHF+TR9U3ZQ+rYnF6VtJjFsL7Cnerb3DGWMnv2dq/BAagGFx+ZmazNiHH/NURIz
 XWyoIdZPmpjGxrdf03y3W3qtlL4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI2MTA3ZSIsICJsaW51eC1ibHVldG9vdGhAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e16b6b9.7fe87d1325a8-smtp-out-n02;
 Thu, 09 Jan 2020 05:14:33 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B1596C433CB; Thu,  9 Jan 2020 05:14:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from rocky-Inspiron-7590.qca.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rjliao)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5AAECC43383;
        Thu,  9 Jan 2020 05:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5AAECC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rjliao@codeaurora.org
From:   Rocky Liao <rjliao@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rocky Liao <rjliao@codeaurora.org>
Subject: [PATCH v3] Bluetooth: hci_qca: Add qca_power_on() API to support both wcn399x and Rome power up
Date:   Thu,  9 Jan 2020 13:14:27 +0800
Message-Id: <20200109051427.16426-1-rjliao@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200107052601.32216-1-rjliao@codeaurora.org>
References: <20200107052601.32216-1-rjliao@codeaurora.org>
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch adds a unified API qca_power_on() to support both wcn399x and
Rome power on. For wcn399x it calls the qca_wcn3990_init() to init the
regulators, and for Rome it pulls up the bt_en GPIO to power up the btsoc.
It also moves all the power up operation from hdev->open() to
hdev->setup().

Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
---

Changes in v2: None
Changes in v3:
  -combined the changes of patch 2 and 3 into this patch
  -updated the commit message

 drivers/bluetooth/hci_qca.c | 46 ++++++++++++++++++++++++-------------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 82e4cd4b6663..427e381a08b4 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -541,7 +541,6 @@ static int qca_open(struct hci_uart *hu)
 {
 	struct qca_serdev *qcadev;
 	struct qca_data *qca;
-	int ret;
 
 	BT_DBG("hu %p qca_open", hu);
 
@@ -582,23 +581,10 @@ static int qca_open(struct hci_uart *hu)
 	hu->priv = qca;
 
 	if (hu->serdev) {
-
 		qcadev = serdev_device_get_drvdata(hu->serdev);
-		if (!qca_is_wcn399x(qcadev->btsoc_type)) {
-			gpiod_set_value_cansleep(qcadev->bt_en, 1);
-			/* Controller needs time to bootup. */
-			msleep(150);
-		} else {
+		if (qca_is_wcn399x(qcadev->btsoc_type)) {
 			hu->init_speed = qcadev->init_speed;
 			hu->oper_speed = qcadev->oper_speed;
-			ret = qca_regulator_enable(qcadev);
-			if (ret) {
-				destroy_workqueue(qca->workqueue);
-				kfree_skb(qca->rx_skb);
-				hu->priv = NULL;
-				kfree(qca);
-				return ret;
-			}
 		}
 	}
 
@@ -1531,6 +1517,31 @@ static int qca_wcn3990_init(struct hci_uart *hu)
 	return 0;
 }
 
+static int qca_power_on(struct hci_dev *hdev)
+{
+	struct hci_uart *hu = hci_get_drvdata(hdev);
+	enum qca_btsoc_type soc_type = qca_soc_type(hu);
+	struct qca_serdev *qcadev;
+	int ret = 0;
+
+	/* Non-serdev device usually is powered by external power
+	 * and don't need additional action in driver for power on
+	 */
+	if (!hu->serdev)
+		return 0;
+
+	if (qca_is_wcn399x(soc_type)) {
+		ret = qca_wcn3990_init(hu);
+	} else {
+		qcadev = serdev_device_get_drvdata(hu->serdev);
+		gpiod_set_value_cansleep(qcadev->bt_en, 1);
+		/* Controller needs time to bootup. */
+		msleep(150);
+	}
+
+	return ret;
+}
+
 static int qca_setup(struct hci_uart *hu)
 {
 	struct hci_dev *hdev = hu->hdev;
@@ -1562,7 +1573,7 @@ static int qca_setup(struct hci_uart *hu)
 		set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
 		set_bit(HCI_QUIRK_USE_BDADDR_PROPERTY, &hdev->quirks);
 		hu->hdev->shutdown = qca_power_off;
-		ret = qca_wcn3990_init(hu);
+		ret = qca_power_on(hdev);
 		if (ret)
 			return ret;
 
@@ -1571,6 +1582,9 @@ static int qca_setup(struct hci_uart *hu)
 			return ret;
 	} else {
 		bt_dev_info(hdev, "ROME setup");
+		ret = qca_power_on(hdev);
+		if (ret)
+			return ret;
 		qca_set_speed(hu, QCA_INIT_SPEED);
 	}
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
