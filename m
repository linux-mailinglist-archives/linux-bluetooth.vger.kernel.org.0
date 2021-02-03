Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E57B130D494
	for <lists+linux-bluetooth@lfdr.de>; Wed,  3 Feb 2021 09:04:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232160AbhBCID5 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 3 Feb 2021 03:03:57 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:55841 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231738AbhBCIDx (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 3 Feb 2021 03:03:53 -0500
Received: from [123.112.66.186] (helo=localhost.localdomain)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <hui.wang@canonical.com>)
        id 1l7D82-0005tB-Bz; Wed, 03 Feb 2021 08:03:11 +0000
From:   Hui Wang <hui.wang@canonical.com>
To:     linux-bluetooth@vger.kernel.org, marcel@holtmann.org
Cc:     hui.wang@canonical.com
Subject: [PATCH] Bluetooth: btusb: Fix the autosuspend enable and disable
Date:   Wed,  3 Feb 2021 16:02:45 +0800
Message-Id: <20210203080245.5168-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

I tried to disable the autosuspend on btusb through the module
parameter enable_autosuspend, this parameter is set to N, but the usb
bluetooth device is still runtime suspended.
$ cat /sys/module/btusb/parameters/enable_autosuspend
N
$ cat /sys/bus/usb/devices/3-10/power/runtime_status
suspended
$ cat /sys/bus/usb/devices/3-10/power/runtime_suspended_time
65187

We already set ".supports_autosuspend = 1" in the usb_driver, this
device will be set autosuspend enabled by usb core, we don't need
to call usb_enable_autosuspend() in the btusb_probe(). Instead if
users set the parameter enable_autosuspend to N, we need to call
usb_disable_autosuspend() in the btusb_probe(). After this change
and set the parameter to N, we could see the device is not runtime
suspended anymore.
$ cat /sys/module/btusb/parameters/enable_autosuspend
N
$ cat /sys/bus/usb/devices/3-10/power/runtime_status
active
$ cat /sys/bus/usb/devices/3-10/power/runtime_suspended_time
0

And if we disable the autosuspend in the btusb_probe(), we need to
enable the autosuspend in the disconnect(), this could guarantee
that the device could be runtime suspended after we rmmod the btusb.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 drivers/bluetooth/btusb.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index b14102fba601..e019a6d6e934 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -4639,8 +4639,8 @@ static int btusb_probe(struct usb_interface *intf,
 			data->diag = NULL;
 	}
 
-	if (enable_autosuspend)
-		usb_enable_autosuspend(data->udev);
+	if (!enable_autosuspend)
+		usb_disable_autosuspend(data->udev);
 
 	err = hci_register_dev(hdev);
 	if (err < 0)
@@ -4700,6 +4700,9 @@ static void btusb_disconnect(struct usb_interface *intf)
 		gpiod_put(data->reset_gpio);
 
 	hci_free_dev(hdev);
+
+	if (!enable_autosuspend)
+		usb_enable_autosuspend(data->udev);
 }
 
 #ifdef CONFIG_PM
-- 
2.25.1

