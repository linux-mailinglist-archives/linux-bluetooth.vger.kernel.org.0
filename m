Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7270A6A8CC5
	for <lists+linux-bluetooth@lfdr.de>; Fri,  3 Mar 2023 00:16:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbjCBXQA (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 2 Mar 2023 18:16:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbjCBXP6 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 2 Mar 2023 18:15:58 -0500
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CD47580F6
        for <linux-bluetooth@vger.kernel.org>; Thu,  2 Mar 2023 15:15:57 -0800 (PST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-538116920c3so5639147b3.15
        for <linux-bluetooth@vger.kernel.org>; Thu, 02 Mar 2023 15:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rvS2IryHoEggHxb40R2qDr1c4jdX8M14m8UBo1w5O+A=;
        b=rTFlTa1B49TRn6fe2xljQwwVEglx8YFV8C9kde50fVDdWxEpUXz5X2LcnSFs/UO7Vi
         kZgleyqOxc1bNDl72lVTIPpczx/mQ4A2BkY35xMQhVeEbnZyFDIPf0YOt2uL7r08b3oa
         FNzJYcekYRd/AchigEWUvf/zsLzg6Gxwkqdt7NeYvchhSsGvCVDwG+EC1JP1OQ39mzHO
         +BtqViZKxhu80U0k0ZV5ZldhBuFF7gmXP5NxU6wQO28tVsogLiGKjQui1raD1W1kex4o
         XgxpzBfnkJ/HQkv8lWMTnMW4tu5Wuf0ybu8WH1Szihti8FXqC5cv92ed9D5iL6JYcjG2
         zGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rvS2IryHoEggHxb40R2qDr1c4jdX8M14m8UBo1w5O+A=;
        b=Q2HiOq8rGIfYaRlGEOhUBNxrjfAj837aMHVsxEoCY4mzr8ZT7K9dsAm7mdFjkSgBff
         tYMb+B8UEnVmsqdxIm+aSe4Io8xJp2doz1oFr2xznSfZGTmLRnkKb33nwq3nP0WOIgN3
         gwtU8hYWJb4FlZmdtQPx+3pQifmuN2u7tiy/eJkfXgfwFfEFSgt7JgB+K24uRNX3R7Hh
         772hmxv261MaHpFVZvVgg4tQYJj3pizNrxniwastZLPm1qsGgIzVg2tteZ4xX9/afjy3
         dXb5I07puepHtZcnSdNiPSqspIiO9InIO0Ykyloal8YHExUlhvwKJRS0mtywApqZoj60
         ygIw==
X-Gm-Message-State: AO0yUKUHWZcQTvkeyHqdDOG2vxdhjHSpwm8anwEhlR8sUIlA2GPKv+oT
        RadxdpDxcwuBrJXwi88FKn4bHm5VYb6hvg==
X-Google-Smtp-Source: AK7set9dkRDI7rl+jcwdvMWgEqjajs9PD52kgK8a3qJzljVImQo6pHwhL5/Wy6RdERAUxBUQOrMvAfr0+nGNvw==
X-Received: from mmandlik-cloudtop.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:2893])
 (user=mmandlik job=sendgmr) by 2002:a81:af53:0:b0:53c:6fda:835f with SMTP id
 x19-20020a81af53000000b0053c6fda835fmr4363808ywj.0.1677798956703; Thu, 02 Mar
 2023 15:15:56 -0800 (PST)
Date:   Thu,  2 Mar 2023 15:15:46 -0800
In-Reply-To: <20230302151413.v7.1.I9b4e4818bab450657b19cda3497d363c9baa616e@changeid>
Mime-Version: 1.0
References: <20230302151413.v7.1.I9b4e4818bab450657b19cda3497d363c9baa616e@changeid>
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
Message-ID: <20230302151413.v7.3.I8cd97c192e8268567b6f467ccd993ec71897318e@changeid>
Subject: [PATCH v7 3/4] Bluetooth: btusb: Add btusb devcoredump support
From:   Manish Mandlik <mmandlik@google.com>
To:     marcel@holtmann.org, luiz.dentz@gmail.com
Cc:     chromeos-bluetooth-upstreaming@chromium.org,
        linux-bluetooth@vger.kernel.org,
        Manish Mandlik <mmandlik@google.com>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch implements the btusb driver side .coredump() callback to
trigger a devcoredump via sysfs.

Signed-off-by: Manish Mandlik <mmandlik@google.com>
Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

(no changes since v6)

Changes in v6:
- Remove dev->coredump_disabled check since the sysfs flag related
  change has been abandoned

Changes in v4:
- New patch in the series

 drivers/bluetooth/btusb.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 4ca91c033d2f..9c9f7bf1375a 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -4385,6 +4385,17 @@ static int btusb_resume(struct usb_interface *intf)
 }
 #endif
 
+#ifdef CONFIG_DEV_COREDUMP
+static void btusb_coredump(struct device *dev)
+{
+	struct btusb_data *data = dev_get_drvdata(dev);
+	struct hci_dev *hdev = data->hdev;
+
+	if (hdev->dump.coredump)
+		hdev->dump.coredump(hdev);
+}
+#endif
+
 static struct usb_driver btusb_driver = {
 	.name		= "btusb",
 	.probe		= btusb_probe,
@@ -4396,6 +4407,14 @@ static struct usb_driver btusb_driver = {
 	.id_table	= btusb_table,
 	.supports_autosuspend = 1,
 	.disable_hub_initiated_lpm = 1,
+
+#ifdef CONFIG_DEV_COREDUMP
+	.drvwrap = {
+		.driver = {
+			.coredump = btusb_coredump,
+		},
+	},
+#endif
 };
 
 module_usb_driver(btusb_driver);
-- 
2.40.0.rc0.216.gc4246ad0f0-goog

