Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 081842173DA
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 Jul 2020 18:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728150AbgGGQY3 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 7 Jul 2020 12:24:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728137AbgGGQY2 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 7 Jul 2020 12:24:28 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF558C08C5E1
        for <linux-bluetooth@vger.kernel.org>; Tue,  7 Jul 2020 09:24:28 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x72so9208185pfc.6
        for <linux-bluetooth@vger.kernel.org>; Tue, 07 Jul 2020 09:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5rypinuxXWPOxBq0owicS6HAyIDLu+UTWiTWHRsqzsM=;
        b=a6KuHtzO7bUw2Zu7AcFiqm+FYYpWbMKNAVPXezA5PYDzrmI6qmmgD8/HhryzwUeqcM
         r4J7H8s+/yyJHzZaS+AzzQTcMDOXUmuX6CxLKeatH/MfvudUFah7Q+a3LqlIeGMgY32X
         ruNb6uhgvj3iJJGUAnSAFfRuhQXM850/1dplw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5rypinuxXWPOxBq0owicS6HAyIDLu+UTWiTWHRsqzsM=;
        b=tZQ3AkJEjFgzFVRSUL3RGknV/+5/2ZZqQA4WWr8fFAHnBFaItCz2coXQ1qi0UYDnS9
         whyuU5DJb/7O1jef9rbmSBCNctuNLNEALo1STZFiYrFrBZiw59Jm06JS2Y5GfOQTQg3r
         x7hXipzT2f67FqBCa0XN7eapQ1fKjEX1yD4D70x5FO9R8zX3B8XrwbOhDc/qNtjgo9oX
         LyULrEsWO/FmjwvVROjooEdpE4UZ1MGoajhLnsF6VXf0uB5dx6OuVV9SV1MeDjj+93mn
         fQvdWCiKjyIE4rqpW7/vtzhZQ92dgQCEol8uNLk/BawNR4gS750Nu7MgxeOFx24SjC1s
         3H/A==
X-Gm-Message-State: AOAM533OtXxC74mQN9hijB0GkNeGZrGzk046X8HVDBKjneUw1JwMeRC7
        JRwuYgf57BaOcKgOmJZUjxJK1Q==
X-Google-Smtp-Source: ABdhPJxmzVAmqiU/WipgiQj/0Er/2Olj3Fa/b4b8Nji1KGrP79hTlLqseViA/H+Uj3J2c0s/KP1Aow==
X-Received: by 2002:a05:6a00:790:: with SMTP id g16mr13906032pfu.36.1594139068170;
        Tue, 07 Jul 2020 09:24:28 -0700 (PDT)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:7220:84ff:fe09:2b94])
        by smtp.gmail.com with ESMTPSA id s10sm3758196pjf.3.2020.07.07.09.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 09:24:27 -0700 (PDT)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-pm@vger.kernel.org
Cc:     linux-bluetooth@vger.kernel.org,
        chromeos-bluetooth-upstreaming@chromium.org,
        rafael.j.wysocki@intel.com, swboyd@chromium.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>,
        Pavel Machek <pavel@ucw.cz>
Subject: [PATCH v4 0/1] power: Emit change uevent when updating sysfs
Date:   Tue,  7 Jul 2020 09:24:16 -0700
Message-Id: <20200707162417.3514284-1-abhishekpandit@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org


Hi linux-pm,

ChromeOS has a udev rule to chown the `power/wakeup` attribute so that
the power manager can modify it during runtime.

(https://source.chromium.org/chromiumos/chromiumos/codesearch/+/master:src/platform2/power_manager/udev/99-powerd-permissions.rules)

In our automated tests, we found that the `power/wakeup` attributes
weren't being chown-ed for some boards. On investigating, I found that
when the drivers probe and call device_set_wakeup_capable, no uevent was
being emitted for the newly added power/wakeup attribute. This was
manifesting at boot on some boards (Marvell SDIO bluetooth and Broadcom
Serial bluetooth drivers) or during usb disconnects during resume
(Realtek btusb driver with reset resume quirk).

It seems reasonable to me that changes to the attributes of a device
should cause a changed uevent so I have added that here.

Here's an example of the kernel events after toggling the authorized
bit of /sys/bus/usb/devices/1-3/

$ echo 0 > /sys/bus/usb/devices/1-3/authorized
KERNEL[27.357994] remove   /devices/pci0000:00/0000:00:15.0/usb1/1-3/1-3:1.0/bluetooth/hci0/rfkill1 (rfkill)
KERNEL[27.358049] remove   /devices/pci0000:00/0000:00:15.0/usb1/1-3/1-3:1.0/bluetooth/hci0 (bluetooth)
KERNEL[27.358458] remove   /devices/pci0000:00/0000:00:15.0/usb1/1-3/1-3:1.0 (usb)
KERNEL[27.358486] remove   /devices/pci0000:00/0000:00:15.0/usb1/1-3/1-3:1.1 (usb)
KERNEL[27.358529] change   /devices/pci0000:00/0000:00:15.0/usb1/1-3 (usb)

$ echo 1 > /sys/bus/usb/devices/1-3/authorized
KERNEL[36.415749] change   /devices/pci0000:00/0000:00:15.0/usb1/1-3 (usb)
KERNEL[36.415798] add      /devices/pci0000:00/0000:00:15.0/usb1/1-3/1-3:1.0 (usb)
KERNEL[36.417414] add      /devices/pci0000:00/0000:00:15.0/usb1/1-3/1-3:1.0/bluetooth/hci0 (bluetooth)
KERNEL[36.417447] add      /devices/pci0000:00/0000:00:15.0/usb1/1-3/1-3:1.0/bluetooth/hci0/rfkill2 (rfkill)
KERNEL[36.417481] add      /devices/pci0000:00/0000:00:15.0/usb1/1-3/1-3:1.1 (usb)

Series-version 4 update:
Tested again on device and verified it's working as expected:
KERNEL[52.678174] remove   /devices/pci0000:00/0000:00:15.0/usb1/1-3/1-3:1.0/bluetooth/hci0/rfkill2 (rfkill)
KERNEL[52.678211] remove   /devices/pci0000:00/0000:00:15.0/usb1/1-3/1-3:1.0/bluetooth/hci0 (bluetooth)
KERNEL[52.678251] remove   /devices/pci0000:00/0000:00:15.0/usb1/1-3/1-3:1.0 (usb)
KERNEL[52.679721] remove   /devices/pci0000:00/0000:00:15.0/usb1/1-3/1-3:1.1 (usb)
KERNEL[52.679772] change   /devices/pci0000:00/0000:00:15.0/usb1/1-3 (usb)
KERNEL[56.022259] change   /devices/pci0000:00/0000:00:15.0/usb1/1-3 (usb)
KERNEL[56.022306] add      /devices/pci0000:00/0000:00:15.0/usb1/1-3/1-3:1.0 (usb)
KERNEL[56.022488] add      /devices/pci0000:00/0000:00:15.0/usb1/1-3/1-3:1.0/bluetooth/hci0 (bluetooth)
KERNEL[56.022531] add      /devices/pci0000:00/0000:00:15.0/usb1/1-3/1-3:1.0/bluetooth/hci0/rfkill3 (rfkill)
KERNEL[56.023392] add      /devices/pci0000:00/0000:00:15.0/usb1/1-3/1-3:1.1 (usb)

Thanks
Abhishek

Changes in v4:
- Fix warning where returning from void and tested on device

Changes in v3:
- Simplified error handling

Changes in v2:
- Add newline at end of bt_dev_err

Abhishek Pandit-Subedi (1):
  power: Emit changed uevent on wakeup_sysfs_add/remove

 drivers/base/power/sysfs.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

-- 
2.27.0.212.ge8ba1cc988-goog

