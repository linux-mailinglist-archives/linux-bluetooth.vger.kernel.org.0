Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9D4711E628
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Dec 2019 16:07:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727915AbfLMPG2 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 13 Dec 2019 10:06:28 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51897 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727898AbfLMPG2 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 13 Dec 2019 10:06:28 -0500
Received: by mail-wm1-f65.google.com with SMTP id d73so6733540wmd.1
        for <linux-bluetooth@vger.kernel.org>; Fri, 13 Dec 2019 07:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zVYjiV40raA+irtPup6zp1Dmv8nl1xIXsEkpKqD3rgw=;
        b=VeFLq+4GpUuwpIm90GS0n+hEPfFGzcbuhoIB0PM5nLufjs0UAfX9PJL3hA51N4VKOl
         KfIk7UqTTPWyv/FbJiHdlziFU9wiXJEe8kRbbtdo7a1/dXo+JadmcXvd3qgaJa6NnHH4
         V721mn7ZWI4UxXXLVhSQcflSljmixpbeVRaxciGrQCo8vQL3Ekl4W6G6bttZXcfPqpGw
         nl8fiqqoeW08/a1RsvvMYeI7LUdExZsICrcXJkfTXH9m/MqEuiMPZT+2s2mn8qN10QAy
         IKy1LrFLquP54fjqKaUjY8orntPErL+P19XiJy1DT2AErcjaLDkeopvqAjzGFDin2dbd
         A39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zVYjiV40raA+irtPup6zp1Dmv8nl1xIXsEkpKqD3rgw=;
        b=bK9f2iiz3quZwvecEA8LI24B9x1FTzTFqHVm2w5qGgIoo+J8nutj80vsw+sl3nb7v5
         MrMky45jUxsaKu5XT93Wyq0WWkY9zn1caIv5KMzrlV98MHS1UXXGyZP93DHPynr2hmSw
         zvsKTmzm9WArbN8U4MpdulATyBjAsteWdOhTKmVEsk94ffbSehagcpdWIGGHiUMamLs9
         mc/C+/sTyl/IVJhvSgtHBFHw3mBunvTa/CY14IUWuK+b1VtowkISxIEEi2Co6U9hnHh4
         8KBlxxZOFSC5qc7726NPgZBDt7kBrp22S9jOwoUeNNkAAlFzmZ4ykZAJIrCTx2IvnKva
         GINA==
X-Gm-Message-State: APjAAAVp5W/aYlCtxdcNvGLY5v5fUh+s0+OmDYTEzuwKhSt013l+WFaK
        uCSmXte+rO1clw9oEA9QrkUn+A==
X-Google-Smtp-Source: APXvYqyhRx1/4GO9KdmDjWOPa8J6ecg/1XIViS8vFaLpiXkn64jYSGb3Q2OJaKQuE5yidzpFCAom9Q==
X-Received: by 2002:a1c:7c18:: with SMTP id x24mr14127321wmc.21.1576249585996;
        Fri, 13 Dec 2019 07:06:25 -0800 (PST)
Received: from localhost.localdomain ([2a01:cb1d:6e7:d500:82a9:347a:43f3:d2ca])
        by smtp.gmail.com with ESMTPSA id x16sm10449403wmk.35.2019.12.13.07.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 07:06:25 -0800 (PST)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org
Cc:     netdev@vger.kernel.org, nsaenzjulienne@suse.de,
        linux-kernel@vger.kernel.org, khilman@baylibre.com
Subject: [PATCH v5 2/2] bluetooth: hci_bcm: enable IRQ capability from devicetree
Date:   Fri, 13 Dec 2019 16:06:22 +0100
Message-Id: <20191213150622.14162-3-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213150622.14162-1-glaroque@baylibre.com>
References: <20191213150622.14162-1-glaroque@baylibre.com>
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Actually IRQ can be found from GPIO but all platforms don't support
gpiod_to_irq, it's the case on amlogic chip.
so to have possibility to use interrupt mode we need to add interrupts
property in devicetree and support it in driver.

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 drivers/bluetooth/hci_bcm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index f8f5c593a05c..99dee878b092 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/acpi.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/property.h>
 #include <linux/platform_data/x86/apple.h>
 #include <linux/platform_device.h>
@@ -1144,6 +1145,8 @@ static int bcm_of_probe(struct bcm_device *bdev)
 	device_property_read_u32(bdev->dev, "max-speed", &bdev->oper_speed);
 	device_property_read_u8_array(bdev->dev, "brcm,bt-pcm-int-params",
 				      bdev->pcm_int_params, 5);
+	bdev->irq = of_irq_get_byname(bdev->dev->of_node, "host-wakeup");
+
 	return 0;
 }
 
-- 
2.17.1

