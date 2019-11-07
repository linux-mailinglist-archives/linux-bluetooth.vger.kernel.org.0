Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63E26F3C2F
	for <lists+linux-bluetooth@lfdr.de>; Fri,  8 Nov 2019 00:28:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727926AbfKGX1s (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 7 Nov 2019 18:27:48 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44418 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727912AbfKGX1s (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 7 Nov 2019 18:27:48 -0500
Received: by mail-pl1-f193.google.com with SMTP id az9so1843374plb.11
        for <linux-bluetooth@vger.kernel.org>; Thu, 07 Nov 2019 15:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NUWZMN0GGob52T1jXs/z4kULS3gjYf/I2UiFL9rMkbg=;
        b=IiL5AIub7qvRwcEMWwV8T/E10byDaXeXyNRPiSewLwoS3vLLD/hjoGvK5d7xoHnhrF
         bh8nLmxoNOl47LRDoHmuXtPoo0mQzLBBI/SFfnK5/eJ/tWSJtJzwEoQs2RM3U90qWkaO
         kxT32FnC2xwMsI0iXuYxdBYcynJalis+wRZbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NUWZMN0GGob52T1jXs/z4kULS3gjYf/I2UiFL9rMkbg=;
        b=NB3SfD3Y5KF029b78hUh2RXLjPZd52dZLVdrWAA69pp/aubeOYcrqe5/8850BF6ViC
         LJm3F7LszozBRYQXXQNYugfhEvglZ2CE84+xI6ib9KpCQMCL7L8qLjzh8yQjfADS4IvO
         ZlPbFO4tnjKLsYaNNl6wfkJixC94nb4TBkH0yEZcBXb25dgYSU8MMIXi7MeQHkEsATrB
         f6RgrhqZabczBM0enZhTBq+WjibijM3yUo7ti29AAScWdjazPJAFYST4TQBpYLd3nZ0X
         U/M/blBpVGL6c/MU7/rpnNw3ZoCgy3yV0sjtC95kzg77swEggORX3jGCnX+j4D4ufqzn
         oCRQ==
X-Gm-Message-State: APjAAAVgsaiCRCtHmZdWNOABNDWNeX1f1ETQhgjQgElywIFJhz3swBl4
        OtY8rdq+gUCY9ANqRQa3a5ok5g==
X-Google-Smtp-Source: APXvYqzZRuag1cAjOI+5eUD6N6hrGEkeHiHMr+BFM3DE3zFRsUppKe1oXtxtyxpXdxLU/QpcTlyb5g==
X-Received: by 2002:a17:90a:9604:: with SMTP id v4mr8751603pjo.105.1573169267489;
        Thu, 07 Nov 2019 15:27:47 -0800 (PST)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id h3sm2857579pji.16.2019.11.07.15.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 15:27:47 -0800 (PST)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-bluetooth@vger.kernel.org, dianders@chromium.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] Bluetooth: hci_bcm: Disallow set_baudrate for BCM4354
Date:   Thu,  7 Nov 2019 15:27:09 -0800
Message-Id: <20191107232713.48577-2-abhishekpandit@chromium.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191107232713.48577-1-abhishekpandit@chromium.org>
References: <20191107232713.48577-1-abhishekpandit@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Without updating the patchram, the BCM4354 does not support a higher
operating speed. The normal bcm_setup follows the correct order
(init_speed, patchram and then oper_speed) but the serdev driver will
set the operating speed before calling the hu->setup function. Thus,
for the BCM4354, disallow setting the operating speed before patchram.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

Changes in v2: None

 drivers/bluetooth/hci_bcm.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index 0f851c0dde7f..2114df607cb3 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -1167,7 +1167,7 @@ static int bcm_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct hci_uart_proto bcm_proto = {
+static struct hci_uart_proto bcm_proto = {
 	.id		= HCI_UART_BCM,
 	.name		= "Broadcom",
 	.manufacturer	= 15,
@@ -1371,6 +1371,24 @@ static struct platform_driver bcm_driver = {
 	},
 };
 
+#define BCM_QUIRK_DISALLOW_SET_BAUDRATE (1 << 0)
+const u32 disallow_set_baudrate = BCM_QUIRK_DISALLOW_SET_BAUDRATE;
+
+static int bcm_check_disallow_set_baudrate(struct serdev_device *serdev)
+{
+	const u32 *quirks = device_get_match_data(&serdev->dev);
+
+	if (quirks) {
+		/* BCM4354 can't run at full speed before patchram. Disallow
+		 * externally setting operating speed.
+		 */
+		if (*quirks & BCM_QUIRK_DISALLOW_SET_BAUDRATE)
+			return 1;
+	}
+
+	return 0;
+}
+
 static int bcm_serdev_probe(struct serdev_device *serdev)
 {
 	struct bcm_device *bcmdev;
@@ -1408,6 +1426,9 @@ static int bcm_serdev_probe(struct serdev_device *serdev)
 	if (err)
 		dev_err(&serdev->dev, "Failed to power down\n");
 
+	if (bcm_check_disallow_set_baudrate(serdev))
+		bcm_proto.set_baudrate = NULL;
+
 	return hci_uart_register_device(&bcmdev->serdev_hu, &bcm_proto);
 }
 
@@ -1424,7 +1445,7 @@ static const struct of_device_id bcm_bluetooth_of_match[] = {
 	{ .compatible = "brcm,bcm4345c5" },
 	{ .compatible = "brcm,bcm4330-bt" },
 	{ .compatible = "brcm,bcm43438-bt" },
-	{ .compatible = "brcm,bcm43540-bt" },
+	{ .compatible = "brcm,bcm43540-bt", .data = &disallow_set_baudrate },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, bcm_bluetooth_of_match);
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

