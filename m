Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0931CF8510
	for <lists+linux-bluetooth@lfdr.de>; Tue, 12 Nov 2019 01:20:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727296AbfKLAUF (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 11 Nov 2019 19:20:05 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39963 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727222AbfKLAUF (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 11 Nov 2019 19:20:05 -0500
Received: by mail-pf1-f193.google.com with SMTP id r4so11955672pfl.7
        for <linux-bluetooth@vger.kernel.org>; Mon, 11 Nov 2019 16:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jt5HxsYB+y6SKJjlhS6tgd94AO19rGDPcNF7QLhPD9o=;
        b=WmOTWn5nmp1Ys/wRm37i1r8ycX6LayMydZpr6xJylQUtLHcpc+FXGI/MsDW9pUv3Ab
         ahPeM0zYQ1RRhqA26ak9RLiYJ/gx7XXPMKfFnvQbOFMMLbuTpchIKtP3SaUQkT3NVfDQ
         4OZwg/GbBFNeYKG2r7wR70vpwcuZJuco8dhD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jt5HxsYB+y6SKJjlhS6tgd94AO19rGDPcNF7QLhPD9o=;
        b=p+qEJ+O8+Z+ewP9AgNXqx5+al61GtwvIUCQTP6WDjX0A3YTJZSx3uiuydT4s2ok1X3
         F7PTTM8cYhknfH/Ey7f0kJ2MOdTRdlC5F6Yb5HAt67muENejav6OZHuSWf8+ZZB/HEec
         WD2uLwizGnzgc0xvJLlxMEQJG+IKNSiG/7bj81d+u98h4Kldsod4h9+Z+1CfrrDkVHBq
         vjzenTADYPImnRA0GiaO0Gcd714oiARCVAI2ZN8F6JdQPOlg/lBZej1P0brCwJ+bq5I1
         yPsRbphLBal1MdUQaoineO/Pyf66A62gb2dQW7nY8qTLvH9r8QvBtBylAUe7/tX8lRFk
         qDCw==
X-Gm-Message-State: APjAAAUFYKoP+TYgDqORSptL0+xhKTPr3ZG8O32KdUIZvUeIwnh/yqyr
        AXifCdyd3aPUgzlmFeEWBnnnPQ==
X-Google-Smtp-Source: APXvYqzAAUequbHbR5sI0noZIlXO9yAcKZe2kO30a3AYToSawn/NS5LMyqZPkWhI9pgHFiDZat3Jvg==
X-Received: by 2002:a62:7911:: with SMTP id u17mr32710101pfc.115.1573518004426;
        Mon, 11 Nov 2019 16:20:04 -0800 (PST)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id h23sm8430898pgg.58.2019.11.11.16.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 16:20:04 -0800 (PST)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-bluetooth@vger.kernel.org, dianders@chromium.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] Bluetooth: hci_bcm: Support pcm params in dts
Date:   Mon, 11 Nov 2019 16:19:48 -0800
Message-Id: <20191112001949.136377-4-abhishekpandit@chromium.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191112001949.136377-1-abhishekpandit@chromium.org>
References: <20191112001949.136377-1-abhishekpandit@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

BCM chips may require configuration of PCM to operate correctly and
there is a vendor specific HCI command to do this. Add support in the
hci_bcm driver to parse this from devicetree and configure the chip.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

Changes in v3: None
Changes in v2: None

 drivers/bluetooth/hci_bcm.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index 6134bff58748..b7f47d9edb7d 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -88,6 +88,8 @@ struct bcm_device_data {
  *	used to disable flow control during runtime suspend and system sleep
  * @is_suspended: whether flow control is currently disabled
  * @disallow_set_baudrate: don't allow set_baudrate
+ * @has_pcm_params: whether PCM parameters need to be configured
+ * @pcm_params: PCM and routing parameters
  */
 struct bcm_device {
 	/* Must be the first member, hci_serdev.c expects this. */
@@ -122,6 +124,9 @@ struct bcm_device {
 	bool			is_suspended;
 #endif
 	bool			disallow_set_baudrate;
+
+	bool				has_pcm_params;
+	struct bcm_set_pcm_int_params	pcm_params;
 };
 
 /* generic bcm uart resources */
@@ -596,6 +601,17 @@ static int bcm_setup(struct hci_uart *hu)
 			host_set_baudrate(hu, speed);
 	}
 
+	/* PCM parameters if any*/
+	if (bcm->dev && bcm->dev->has_pcm_params) {
+		err = btbcm_set_pcm_params(hu->hdev, &bcm->dev->pcm_params,
+					   NULL);
+
+		if (err) {
+			bt_dev_info(hu->hdev, "BCM: Set pcm params failed (%d)",
+				    err);
+		}
+	}
+
 finalize:
 	release_firmware(fw);
 
@@ -1132,7 +1148,24 @@ static int bcm_acpi_probe(struct bcm_device *dev)
 
 static int bcm_of_probe(struct bcm_device *bdev)
 {
+	int err;
+
 	device_property_read_u32(bdev->dev, "max-speed", &bdev->oper_speed);
+
+	err = device_property_read_u8(bdev->dev, "brcm,bt-sco-routing",
+				      &bdev->pcm_params.routing);
+	if (!err)
+		bdev->has_pcm_params = true;
+
+	device_property_read_u8(bdev->dev, "brcm,pcm-interface-rate",
+				&bdev->pcm_params.rate);
+	device_property_read_u8(bdev->dev, "brcm,pcm-frame-type",
+				&bdev->pcm_params.frame_sync);
+	device_property_read_u8(bdev->dev, "brcm,pcm-sync-mode",
+				&bdev->pcm_params.sync_mode);
+	device_property_read_u8(bdev->dev, "brcm,pcm-clock-mode",
+				&bdev->pcm_params.clock_mode);
+
 	return 0;
 }
 
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

