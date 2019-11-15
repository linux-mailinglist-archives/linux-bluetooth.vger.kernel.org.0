Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7F6BFD2C6
	for <lists+linux-bluetooth@lfdr.de>; Fri, 15 Nov 2019 03:10:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727143AbfKOCKi (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 14 Nov 2019 21:10:38 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46896 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727002AbfKOCKZ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 14 Nov 2019 21:10:25 -0500
Received: by mail-pf1-f194.google.com with SMTP id 193so5544113pfc.13
        for <linux-bluetooth@vger.kernel.org>; Thu, 14 Nov 2019 18:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aj4XYM8PrIo6nR8n+IsxtP01AtkKU8Pep9oAEMoCHL4=;
        b=htF01LgDBmFw4EoA7M2np1B9pQbEjadTX+IrtRTEqY4a3sCfhNqEKiiRy7gyCPMAH0
         +Q0gZC9lUZwAIoxjajrhuXVMLKgs7RVDCBM9V9IZqPxWgRSjZsXSUanmkWsh1mV8DKlu
         YCWU0/jy72yjo4u9kvx660bWuHSbg8HxFEhSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aj4XYM8PrIo6nR8n+IsxtP01AtkKU8Pep9oAEMoCHL4=;
        b=AsUBJayFLxe4UCuofboKInxh5NOHA2+q1fTOHAG2sKKWHnAgsrJ5+VC523bCPic0kF
         4kXfA6RFzYMgQHlNLu637+JrtXVpIHOrQCb8iHqrXKJ7SrlF53yZJQnVrWHW+UmH+Prt
         j8eLXCk2Qgf5vP8p/7dbwVcRnfry1uTH9C72lbbGTrBOMKG3K0nfuGj11bvXHqRZXikV
         0t3yi+ufZ3RF+QGvu6h2efYELKCstPiWg13finfJHB4C0VIQBF8EeuMTGnMBml1C527/
         el/0rkDZJvQZanX/6xUl7OnvuDxtQ5Xmc0l7CUznVTj6zSA/TUlKgy/L9k4NXyecAxYL
         hKMA==
X-Gm-Message-State: APjAAAVtLtiKXvC5OxNAQJ2mGoBrXY4nwp1TIZCSpJrKUhnVt4UW4blZ
        PK30mh8So5GVAcip2gY+QHndVw==
X-Google-Smtp-Source: APXvYqztvjaAWyl6XU4yl3rdt2cuXeBBfNTEKPuCHmA1Hp0Of3tkAqmPKMMoAUCjLOeZmd6/tmzqCA==
X-Received: by 2002:aa7:8e56:: with SMTP id d22mr14722146pfr.3.1573783824858;
        Thu, 14 Nov 2019 18:10:24 -0800 (PST)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id f7sm9695820pfa.150.2019.11.14.18.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 18:10:24 -0800 (PST)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-bluetooth@vger.kernel.org, dianders@chromium.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/4] Bluetooth: hci_bcm: Support pcm params in dts
Date:   Thu, 14 Nov 2019 18:10:08 -0800
Message-Id: <20191114180959.v5.4.I3e900de9478b68e5e4475e747d1c46fdd28313fa@changeid>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
In-Reply-To: <20191115021008.32926-1-abhishekpandit@chromium.org>
References: <20191115021008.32926-1-abhishekpandit@chromium.org>
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
Looks like hcitool cmd 0x3f 0x001d will read back the PCM parameters so
I experimented with different values for sco_routing, interface_rate and
other values.

The hardware doesn't care about frame_type, sync_mode or clock_mode (I
put them all as 0, all as 1, etc). Only the sco_routing seems to have
a discernable effect on the hardware.

To avoid complicating this, I opted not to read PCM settings and then
write back to it. Let the user decide what to write themselves. I've
opted to add a comment explaining that 0x001d is the read opcode if they
want to verify it themselves.

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

 drivers/bluetooth/hci_bcm.c | 47 +++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index ee40003008d8..ad694b0436c9 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -25,6 +25,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/serdev.h>
 
+#include <dt-bindings/bluetooth/brcm.h>
 #include <net/bluetooth/bluetooth.h>
 #include <net/bluetooth/hci_core.h>
 
@@ -88,6 +89,8 @@ struct bcm_device_data {
  *	used to disable flow control during runtime suspend and system sleep
  * @is_suspended: whether flow control is currently disabled
  * @no_early_set_baudrate: don't set_baudrate before setup()
+ * @has_pcm_params: whether PCM parameters need to be configured
+ * @pcm_params: PCM and routing parameters
  */
 struct bcm_device {
 	/* Must be the first member, hci_serdev.c expects this. */
@@ -122,6 +125,9 @@ struct bcm_device {
 	bool			is_suspended;
 #endif
 	bool			no_early_set_baudrate;
+
+	bool				has_pcm_params;
+	struct bcm_set_pcm_int_params	pcm_params;
 };
 
 /* generic bcm uart resources */
@@ -594,6 +600,16 @@ static int bcm_setup(struct hci_uart *hu)
 			host_set_baudrate(hu, speed);
 	}
 
+	/* PCM parameters if any*/
+	if (bcm->dev && bcm->dev->has_pcm_params) {
+		err = btbcm_set_pcm_int_params(hu->hdev, &bcm->dev->pcm_params);
+
+		if (err) {
+			bt_dev_info(hu->hdev, "BCM: Set pcm params failed (%d)",
+				    err);
+		}
+	}
+
 finalize:
 	release_firmware(fw);
 
@@ -1128,9 +1144,40 @@ static int bcm_acpi_probe(struct bcm_device *dev)
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
+	int err;
+
 	device_property_read_u32(bdev->dev, "max-speed", &bdev->oper_speed);
+
+	err = property_read_u8(bdev->dev, "brcm,bt-sco-routing",
+			       &bdev->pcm_params.routing);
+
+	if (!err)
+		bdev->has_pcm_params = true;
+
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

