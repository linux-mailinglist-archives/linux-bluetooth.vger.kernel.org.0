Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 615E5DA44F
	for <lists+linux-bluetooth@lfdr.de>; Thu, 17 Oct 2019 05:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404547AbfJQDVA (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 16 Oct 2019 23:21:00 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45771 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730479AbfJQDVA (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 16 Oct 2019 23:21:00 -0400
Received: by mail-pl1-f194.google.com with SMTP id u12so396267pls.12
        for <linux-bluetooth@vger.kernel.org>; Wed, 16 Oct 2019 20:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PR/rD0n5aMrsObQiFy5a+xTeVwlHVbH4Nmm3Ko6SbmQ=;
        b=GhOWxGUwokCNAw//y2NbGAiY+HvO2NijHZBU/ekO2lSz9uIbJaWbHZ966WunT4orRa
         cKkdhvmd3gm0bms/NTx/mX9CWbkFUpJ8yF/35v7SDPaNUq8tCQkiYa2UQDzQfVLAp8Fn
         p027HUgck/Vu0zhB43Flvpeil9BhDFFNfd/CcnWAkGCses8tF9y/F08yxn8Vig4Mkhw4
         Vq4BkzrmHvOFVsMlhEQpsoXu30CPlop3NHV2szOnAy586QGIWQwQG/Akunh5MMtObkKL
         djsFCNbjpC3zhBAkyDzFrqjlZLTO/L3SVU5a7RZggMDZVYqiudPRWKeOFhdfdISWdJ8C
         OBUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PR/rD0n5aMrsObQiFy5a+xTeVwlHVbH4Nmm3Ko6SbmQ=;
        b=b0VAERN9DfllWru/VK8/q8yWbUVwI0zVblbBqKde8/gDTqvGzz0Ap88PcITFuQ/wvQ
         yydpy6oPUtSFCXAneFdaaGqPHadh07DkPaGVZKgd9HQNomxBIitcX9eAGAQnVBPOc2hH
         jJvAsnrfwzzjrfTokW+4/l17ZydXgcEiSqLl1L4zsrTZBWb6l65+RpNrqBbK9eP4JaCa
         LwjI+WShY3moOacaKmsXB5HvVhBD0RAMaUw8liK29zaEVExbVluC/vqDI0Y5/4AEWpQs
         UWis2N+hcMi+rNxQLMYnSyDrQ3Tu91KI5rxowPk9efC2zqvhc+2/+91mEe1cQAbknabt
         8ZgA==
X-Gm-Message-State: APjAAAXR67KUFRlfhO46wRQSJnBm2JFnJ5ekaDYy6bgpD+V2q4vpdo9Z
        eWJ8o+jhlQjZHxWrHf2PF8EhMLxJPw4=
X-Google-Smtp-Source: APXvYqxkTNK2w0MU3q/NnZM8MoxdRO/EhUeO5Fk0WTvOs5KD74+AnHLxW4VlBdztntnlMZfx90mB/Q==
X-Received: by 2002:a17:902:321:: with SMTP id 30mr1618384pld.61.1571282459238;
        Wed, 16 Oct 2019 20:20:59 -0700 (PDT)
Received: from mkorpershoek-XPS-13-9370.hsd1.ca.comcast.net ([2601:647:5700:f97e:1021:e5a8:28ca:ce5f])
        by smtp.gmail.com with ESMTPSA id w12sm595664pfq.138.2019.10.16.20.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2019 20:20:58 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] Bluetooth: hci_core: fix init for HCI_USER_CHANNEL
Date:   Wed, 16 Oct 2019 20:20:39 -0700
Message-Id: <20191017032039.18413-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <474814D3-A97F-48D1-8268-3D200BE60795@holtmann.org>
References: <474814D3-A97F-48D1-8268-3D200BE60795@holtmann.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

During the setup() stage, HCI device drivers expect the chip to
acknowledge its setup() completion via vendor specific frames.

If userspace opens() such HCI device in HCI_USER_CHANNEL [1] mode,
the vendor specific frames are never tranmitted to the driver, as
they are filtered in hci_rx_work().

Allow HCI devices which operate in HCI_USER_CHANNEL mode to receive
frames if the HCI device is is HCI_INIT state.

[1] https://www.spinics.net/lists/linux-bluetooth/msg37345.html

Fixes: 23500189d7e0 ("Bluetooth: Introduce new HCI socket channel for user operation")
Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
Changelog:
v2:
* change test logic to transfer packets when in INIT phase
  for user channel mode as recommended by Marcel
* renamed patch from
  "Bluetooth: hci_core: fix init with HCI_QUIRK_NON_PERSISTENT_SETUP"

v1:
 * https://lkml.org/lkml/2019/10/3/2250

Some more background on the change follows:

The Android bluetooth stack (Bluedroid) also has a HAL implementation
which follows Linux's standard rfkill interface [1].

This implementation relies on the HCI_CHANNEL_USER feature to get
exclusive access to the underlying bluetooth device.

When testing this along with the btkmtksdio driver, the
chip appeared unresponsive when calling the following from userspace:

    struct sockaddr_hci addr;
    int fd;

    fd = socket(AF_BLUETOOTH, SOCK_RAW, BTPROTO_HCI);

    memset(&addr, 0, sizeof(addr));
    addr.hci_family = AF_BLUETOOTH;
    addr.hci_dev = 0;
    addr.hci_channel = HCI_CHANNEL_USER;

    bind(fd, (struct sockaddr *) &addr, sizeof(addr)); # device hangs

In the case of bluetooth drivers exposing QUIRK_NON_PERSISTENT_SETUP
such as btmtksdio, setup() is called each multiple times.
In particular, when userspace calls bind(), the setup() is called again
and vendor specific commands might be send to re-initialize the chip.

Those commands are filtered out by hci_core in HCI_CHANNEL_USER mode,
preventing setup() from completing successfully.

This has been tested on a 4.19 kernel based on Android Common Kernel.
It has also been compile tested on bluetooth-next.

[1] https://android.googlesource.com/platform/system/bt/+/refs/heads/master/vendor_libs/linux/interface/

 net/bluetooth/hci_core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index b2559d4bed81..0cc9ce917222 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -4440,7 +4440,14 @@ static void hci_rx_work(struct work_struct *work)
 			hci_send_to_sock(hdev, skb);
 		}
 
-		if (hci_dev_test_flag(hdev, HCI_USER_CHANNEL)) {
+		/* If the device has been opened in HCI_USER_CHANNEL,
+		 * the userspace has exclusive access to device.
+		 * When device is HCI_INIT, we still need to process
+		 * the data packets to the driver in order
+		 * to complete its setup().
+		 */
+		if (hci_dev_test_flag(hdev, HCI_USER_CHANNEL) &&
+		    !test_bit(HCI_INIT, &hdev->flags)) {
 			kfree_skb(skb);
 			continue;
 		}
-- 
2.20.1

