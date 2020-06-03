Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 146561ED748
	for <lists+linux-bluetooth@lfdr.de>; Wed,  3 Jun 2020 22:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbgFCUWc (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 3 Jun 2020 16:22:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbgFCUWb (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 3 Jun 2020 16:22:31 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADC20C08C5C2
        for <linux-bluetooth@vger.kernel.org>; Wed,  3 Jun 2020 13:22:31 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id s88so89459pjb.5
        for <linux-bluetooth@vger.kernel.org>; Wed, 03 Jun 2020 13:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tHrX3xlB9/Ck6H2yHXMw9M9lpn5geMEW0VlHI1L3+6M=;
        b=mx++0jGuKtq64dlZhGQxV4EMmbblVr3vosFddkncf2n9aCP4dV+FU25/P+2RTCzXSR
         YQ98u8pItXN34A5TDOzhJGSTUnIRve7DSOCaGMvh1OTRbsHmNUffHrJqGaD+YlUWfIj1
         pv4yunKEVA1YaL10TpVE6Vm6ExgZIowgbBetA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tHrX3xlB9/Ck6H2yHXMw9M9lpn5geMEW0VlHI1L3+6M=;
        b=S/Zn/H4xyM59ZGULzaR2W/siNQDjBQemgwSUJ73TVGgvv3bcXhBPIWpVzkFx4uNAVo
         46mxDax5juyQmsPAqFysi6aqjvCHisi9vE0A4XeU7ZEuiUyaaf6nL+pxOO48ejUoRypq
         V6BByGgd0bZ3yzVJe8gP45mqo9Dr4BUFbPuKasTH9s6Ic8uMF7WTFr632Rmw9r8sg24+
         4uzoD++g8Ot2U6pXbz6vnBgq9mm1Lf6D1BLSDES3OiolWI9e2qSieGI3xPIbw6qSxjaI
         ztX/T3tf/MTOYLg90tOIg5NsBogfgIkaRddKe4ynHQzrD6JzPoZ/4XJy9f5QEIBjFWPR
         rExg==
X-Gm-Message-State: AOAM530jybVXnoaiV4xa4EePPPKYlmBRwjO3XpyuDuj35SqhG00USiBR
        GudBETULdtxEOaMKCpmlwmKPIg==
X-Google-Smtp-Source: ABdhPJyVklrVljdEltZISIFzjaihtRWbnMPEiSVoHCB6853zxT3xI88f3BAugbnZpcsG02Di/gcNag==
X-Received: by 2002:a17:90a:6886:: with SMTP id a6mr2041876pjd.170.1591215751071;
        Wed, 03 Jun 2020 13:22:31 -0700 (PDT)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id b19sm2492180pfi.65.2020.06.03.13.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 13:22:30 -0700 (PDT)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     marcel@holtmann.org, linux-bluetooth@vger.kernel.org
Cc:     len.brown@intel.com, chromeos-bluetooth-upstreaming@chromium.org,
        linux-pm@vger.kernel.org, rafael@kernel.org,
        todd.e.brandt@linux.intel.com, rui.zhang@intel.com,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH] Bluetooth: Allow suspend even when preparation has failed
Date:   Wed,  3 Jun 2020 13:21:52 -0700
Message-Id: <20200603132148.1.I0ec31d716619532fc007eac081e827a204ba03de@changeid>
X-Mailer: git-send-email 2.27.0.rc2.251.g90737beb825-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

It is preferable to allow suspend even when Bluetooth has problems
preparing for sleep. When Bluetooth fails to finish preparing for
suspend, log the error and allow the suspend notifier to continue
instead.

To also make it clearer why suspend failed, change bt_dev_dbg to
bt_dev_err when handling the suspend timeout.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---
To verify this is properly working, I added an additional change to
hci_suspend_wait_event to always return -16. This validates that suspend
continues even when an error has occurred during the suspend
preparation.

Example on Chromebook:
[   55.834524] PM: Syncing filesystems ... done.
[   55.841930] PM: Preparing system for sleep (s2idle)
[   55.940492] Bluetooth: hci_core.c:hci_suspend_notifier() hci0: Suspend notifier action (3) failed: -16
[   55.940497] Freezing user space processes ... (elapsed 0.001 seconds) done.
[   55.941692] OOM killer disabled.
[   55.941693] Freezing remaining freezable tasks ... (elapsed 0.000 seconds) done.
[   55.942632] PM: Suspending system (s2idle)

I ran this through a suspend_stress_test in the following scenarios:
* Peer classic device connected: 50+ suspends
* No devices connected: 100 suspends
* With the above test case returning -EBUSY: 50 suspends

I also ran this through our automated testing for suspend and wake on
BT from suspend continues to work.


 net/bluetooth/hci_core.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index dbe2d79f233fba..54da48441423e0 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -3289,10 +3289,10 @@ static int hci_suspend_wait_event(struct hci_dev *hdev)
 				     WAKE_COND, SUSPEND_NOTIFIER_TIMEOUT);
 
 	if (ret == 0) {
-		bt_dev_dbg(hdev, "Timed out waiting for suspend");
+		bt_dev_err(hdev, "Timed out waiting for suspend events");
 		for (i = 0; i < __SUSPEND_NUM_TASKS; ++i) {
 			if (test_bit(i, hdev->suspend_tasks))
-				bt_dev_dbg(hdev, "Bit %d is set", i);
+				bt_dev_err(hdev, "Suspend timeout bit: %d", i);
 			clear_bit(i, hdev->suspend_tasks);
 		}
 
@@ -3360,12 +3360,15 @@ static int hci_suspend_notifier(struct notifier_block *nb, unsigned long action,
 		ret = hci_change_suspend_state(hdev, BT_RUNNING);
 	}
 
-	/* If suspend failed, restore it to running */
-	if (ret && action == PM_SUSPEND_PREPARE)
-		hci_change_suspend_state(hdev, BT_RUNNING);
-
 done:
-	return ret ? notifier_from_errno(-EBUSY) : NOTIFY_STOP;
+	/* We always allow suspend even if suspend preparation failed and
+	 * attempt to recover in resume.
+	 */
+	if (ret)
+		bt_dev_err(hdev, "Suspend notifier action (%x) failed: %d",
+			   action, ret);
+
+	return NOTIFY_STOP;
 }
 
 /* Alloc HCI device */
-- 
2.27.0.rc2.251.g90737beb825-goog

