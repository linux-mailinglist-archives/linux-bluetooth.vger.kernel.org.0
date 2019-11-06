Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24337F0B10
	for <lists+linux-bluetooth@lfdr.de>; Wed,  6 Nov 2019 01:30:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730560AbfKFAaG (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 5 Nov 2019 19:30:06 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36023 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727252AbfKFAaG (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 5 Nov 2019 19:30:06 -0500
Received: by mail-pf1-f194.google.com with SMTP id v19so17418244pfm.3
        for <linux-bluetooth@vger.kernel.org>; Tue, 05 Nov 2019 16:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4zYk3XP3GGf3YpNueJW4AQrSmZBF3wxROTnECKWVGaY=;
        b=QmB6b/fqcXz2xNFmhf4Vlx/ti+A4QZZU7YV9hVZ1HyG9XFI1Q89+nvE6AevubkTXgw
         jgxo9qs20yz9L6REBpahqqd0JM+YXmqQA4tDxdEMorPYQcOZZzsYpGxB0bWtWrOOY7iw
         yTSQaqezG1heGd1bilnh8gWtynkigGbDe5s3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4zYk3XP3GGf3YpNueJW4AQrSmZBF3wxROTnECKWVGaY=;
        b=MpOFRnTI3GfyuGq6oyFJl79boFp3cNDjRVzpFVe2AIbfuxechlS5cbWlkcnUS+QxmA
         pllcg9JXwEJZm0s0jV6kd8uF4c2q5LwQGJVVfBGadfZRK6gwzxKXBQrolJYbSdZC0lH8
         m4V9NyyE8vuLGxa7v8VQF/Hx2bPmOMqBjyPdCjrU8U0S6h3Wfu36Sy+JfP9A3N78T7sP
         Gc11211bDdHcTWv98WR3Nc3SFiAihFlduXRvGOueOhwZQp1lUJpT5SfYK8Q1WVcBl8Zt
         aJdzrCVBMKiDy/VI88V7kf/0Jvl/e1OmPlSmAuPGmzOd8MGgw/9Qv9fwmiJK6KNLgsMz
         jLwg==
X-Gm-Message-State: APjAAAWS+/+XHhsY+lCwINrBpLjB5prhlttlUessEtqOIcCRvWymtG4T
        T0hGOaHBwfiglxPpYDY4ut/H4A==
X-Google-Smtp-Source: APXvYqzWvnEM5OBxJV+6fQF+vdT0fXaXqqILjnb0F8ze9akJnwVnLtYKcEUAWGkb5Fy0NnF/rJnOvA==
X-Received: by 2002:a63:745:: with SMTP id 66mr5168633pgh.389.1573000205454;
        Tue, 05 Nov 2019 16:30:05 -0800 (PST)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id k9sm21032835pfk.72.2019.11.05.16.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 16:30:05 -0800 (PST)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] Bluetooth: hci_bcm: Disallow set_baudrate for BCM4354
Date:   Tue,  5 Nov 2019 16:29:20 -0800
Message-Id: <20191106002923.109344-2-abhishekpandit@chromium.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191106002923.109344-1-abhishekpandit@chromium.org>
References: <20191106002923.109344-1-abhishekpandit@chromium.org>
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

 drivers/bluetooth/hci_bcm.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index 0f851c0dde7f..4fe66e52927d 100644
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
@@ -1371,6 +1371,22 @@ static struct platform_driver bcm_driver = {
 	},
 };
 
+static int bcm_check_disallow_set_baudrate(struct serdev_device *serdev)
+{
+	const char *compatible = of_get_property(serdev->dev.of_node,
+						 "compatible", NULL);
+
+	if (compatible) {
+		/* BCM4354 can't run at full speed before patchram. Disallow
+		 * externally setting operating speed.
+		 */
+		if (!strcmp(compatible, "brcm,bcm43540-bt"))
+			return 1;
+	}
+
+	return 0;
+}
+
 static int bcm_serdev_probe(struct serdev_device *serdev)
 {
 	struct bcm_device *bcmdev;
@@ -1408,6 +1424,9 @@ static int bcm_serdev_probe(struct serdev_device *serdev)
 	if (err)
 		dev_err(&serdev->dev, "Failed to power down\n");
 
+	if (bcm_check_disallow_set_baudrate(serdev))
+		bcm_proto.set_baudrate = NULL;
+
 	return hci_uart_register_device(&bcmdev->serdev_hu, &bcm_proto);
 }
 
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

