Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BF44100C1F
	for <lists+linux-bluetooth@lfdr.de>; Mon, 18 Nov 2019 20:21:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbfKRTVp (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 18 Nov 2019 14:21:45 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45276 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726920AbfKRTVo (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 18 Nov 2019 14:21:44 -0500
Received: by mail-pf1-f194.google.com with SMTP id z4so10827455pfn.12
        for <linux-bluetooth@vger.kernel.org>; Mon, 18 Nov 2019 11:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h4cU6qShnZUKK2JzYUF+npGN+975LalPIpRD3Cw54x0=;
        b=m79zGnqF/umIND07k7tPIpFsdTFuoDiQOc6iGTDsZH8Znjzix6MYChsl4xs34ObahV
         xoNQBIoKL4ZSRkwQ2dyYuiltOIqrRKeA3w17bAR4RW/tGh3p2vhM5M/jNXTVyiiAwSkC
         rYTF7GnofHHa97BBe2E4QP+d29kxL7izg88nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h4cU6qShnZUKK2JzYUF+npGN+975LalPIpRD3Cw54x0=;
        b=mbSowHk+XHfYdZd9iTlnGkJnOCDEhkwg7FKRdWWF3AOg7lnAgVgDZkKtJjvf6byJnL
         1y3/syd9pO5V2QYCvdNhdO9kVdjfylXigxTsFMNgyNeLbAYaWQrh/F7Osqi/m+G7P/lI
         YLlo4ChWeZdhvQbcDJqTFQAuKItlVzzHFAeMx1JWrcZKk81AeoviyBei3iqMmiKu+APw
         RXtPlb4rRMbs2J+dtWxwTTIJowQhEYN4XVhN9/8ulPzLq/gBbnUVAdurgDsTMJiqruLN
         dVEBkoV9yajcY0/FdphOCZAllIhM2bCovcbga57K4AkHKSaJSYecFrZC1oZn7sScAbU0
         qX9g==
X-Gm-Message-State: APjAAAUhNZMzWJ2PEY1smz9C+ta2hrm2ZKwFUhbjxoTsAzNh95UkKOZc
        gkmfhtxndZarlMEIoqHCjf/5Qg==
X-Google-Smtp-Source: APXvYqz4Wp2l2o9atCAZLz953xGiStHCD0224wVLtHbjLrHJ3701nPyE6C/JVm6ZIN7ut2XOcM3FYw==
X-Received: by 2002:a05:6a00:e:: with SMTP id h14mr900294pfk.99.1574104903107;
        Mon, 18 Nov 2019 11:21:43 -0800 (PST)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id p123sm22772633pfg.30.2019.11.18.11.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 11:21:41 -0800 (PST)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-bluetooth@vger.kernel.org, dianders@chromium.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/4] Bluetooth: hci_bcm: Support pcm params in dts
Date:   Mon, 18 Nov 2019 11:21:23 -0800
Message-Id: <20191118110335.v6.4.I3e900de9478b68e5e4475e747d1c46fdd28313fa@changeid>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
In-Reply-To: <20191118192123.82430-1-abhishekpandit@chromium.org>
References: <20191118192123.82430-1-abhishekpandit@chromium.org>
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

Changes in v6:
- Added btbcm_read_pcm_int_params and change pcm params to first read
  the pcm params before setting it

Changes in v5:
- Rename parameters to bt-* and read as integer instead of bytestring
- Update documentation with defaults and put values in header
- Changed patch order

Changes in v4:
- Fix incorrect function name in hci_bcm

Changes in v3:
- Change disallow baudrate setting to return -EBUSY if called before
  ready. bcm_proto is no longer modified and is back to being const.
- Changed btbcm_set_pcm_params to btbcm_set_pcm_int_params
- Changed brcm,sco-routing to brcm,bt-sco-routing

Changes in v2:
- Use match data to disallow baudrate setting
- Parse pcm parameters by name instead of as a byte string
- Fix prefix for dt-bindings commit

 drivers/bluetooth/hci_bcm.c | 57 +++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index ee40003008d8..2ce3fac2c5dd 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -25,6 +25,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/serdev.h>
 
+#include <dt-bindings/bluetooth/brcm.h>
 #include <net/bluetooth/bluetooth.h>
 #include <net/bluetooth/hci_core.h>
 
@@ -88,6 +89,7 @@ struct bcm_device_data {
  *	used to disable flow control during runtime suspend and system sleep
  * @is_suspended: whether flow control is currently disabled
  * @no_early_set_baudrate: don't set_baudrate before setup()
+ * @pcm_params: PCM and routing parameters
  */
 struct bcm_device {
 	/* Must be the first member, hci_serdev.c expects this. */
@@ -122,6 +124,8 @@ struct bcm_device {
 	bool			is_suspended;
 #endif
 	bool			no_early_set_baudrate;
+
+	struct bcm_set_pcm_int_params	pcm_params;
 };
 
 /* generic bcm uart resources */
@@ -541,6 +545,7 @@ static int bcm_flush(struct hci_uart *hu)
 static int bcm_setup(struct hci_uart *hu)
 {
 	struct bcm_data *bcm = hu->priv;
+	struct bcm_set_pcm_int_params p;
 	char fw_name[64];
 	const struct firmware *fw;
 	unsigned int speed;
@@ -594,6 +599,31 @@ static int bcm_setup(struct hci_uart *hu)
 			host_set_baudrate(hu, speed);
 	}
 
+	/* PCM parameters if any*/
+	err = btbcm_read_pcm_int_params(hu->hdev, &p);
+	if (!err) {
+		if (bcm->dev->pcm_params.routing == 0xff)
+			bcm->dev->pcm_params.routing = p.routing;
+		if (bcm->dev->pcm_params.rate == 0xff)
+			bcm->dev->pcm_params.rate = p.rate;
+		if (bcm->dev->pcm_params.frame_sync == 0xff)
+			bcm->dev->pcm_params.frame_sync = p.frame_sync;
+		if (bcm->dev->pcm_params.sync_mode == 0xff)
+			bcm->dev->pcm_params.sync_mode = p.sync_mode;
+		if (bcm->dev->pcm_params.clock_mode == 0xff)
+			bcm->dev->pcm_params.clock_mode = p.clock_mode;
+
+		/* Write only when there are changes */
+		if (memcmp(&p, &bcm->dev->pcm_params, sizeof(p)))
+			err = btbcm_write_pcm_int_params(hu->hdev,
+							 &bcm->dev->pcm_params);
+
+		if (err)
+			bt_dev_warn(hu->hdev, "BCM: Write pcm params failed (%d)",
+				    err);
+	} else
+		bt_dev_warn(hu->hdev, "BCM: Read pcm params failed (%d)", err);
+
 finalize:
 	release_firmware(fw);
 
@@ -1128,9 +1158,36 @@ static int bcm_acpi_probe(struct bcm_device *dev)
 }
 #endif /* CONFIG_ACPI */
 
+static int property_read_u8(struct device *dev, const char *prop, u8 *value)
+{
+	int err;
+	u32 tmp;
+
+	err = device_property_read_u32(dev, prop, &tmp);
+
+	if (!err)
+		*value = (u8)tmp;
+
+	return err;
+}
+
 static int bcm_of_probe(struct bcm_device *bdev)
 {
 	device_property_read_u32(bdev->dev, "max-speed", &bdev->oper_speed);
+
+	memset(&bdev->pcm_params, 0xff, sizeof(bdev->pcm_params));
+
+	property_read_u8(bdev->dev, "brcm,bt-sco-routing",
+			 &bdev->pcm_params.routing);
+	property_read_u8(bdev->dev, "brcm,bt-pcm-interface-rate",
+			 &bdev->pcm_params.rate);
+	property_read_u8(bdev->dev, "brcm,bt-pcm-frame-type",
+			 &bdev->pcm_params.frame_sync);
+	property_read_u8(bdev->dev, "brcm,bt-pcm-sync-mode",
+			 &bdev->pcm_params.sync_mode);
+	property_read_u8(bdev->dev, "brcm,bt-pcm-clock-mode",
+			 &bdev->pcm_params.clock_mode);
+
 	return 0;
 }
 
-- 
2.24.0.432.g9d3f5f5b63-goog

