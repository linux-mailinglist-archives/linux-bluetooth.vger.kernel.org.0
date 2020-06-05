Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC1041F0139
	for <lists+linux-bluetooth@lfdr.de>; Fri,  5 Jun 2020 22:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728294AbgFEUuY (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 5 Jun 2020 16:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728227AbgFEUuX (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 5 Jun 2020 16:50:23 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D94CC08C5C5
        for <linux-bluetooth@vger.kernel.org>; Fri,  5 Jun 2020 13:50:23 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 64so5501008pfg.8
        for <linux-bluetooth@vger.kernel.org>; Fri, 05 Jun 2020 13:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nOiKknFW8NZXsdzDqOG6mcYAn5/jYpz6ewpTk+cA3EU=;
        b=dfwQ7fK2Xky7i0j86o9Lh3WLEhaSimawUnAPO83BlEeX3Ub6v3sq67ZLvBVxJHD3vP
         BxHfnJCIXhewm5tjT3dmjJZOEExpl0d0SdQH93CanTMt43MM+S7qQvkOytNlhWp8oISy
         1KwcRIbn4xMkCiB8szpJGuAeGKNR/Q4fi2qFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nOiKknFW8NZXsdzDqOG6mcYAn5/jYpz6ewpTk+cA3EU=;
        b=Q6TYuqXlD2LFnAF+Rmph8Bf1b9rm3Z0v6ZhNNHnc/0RjAHZz5yyJK/u2dOa6JSRZxT
         Os8xju6gUqvckh1da9upwgguvuNYyR+7Kr1UNuNW/w6VwXdFdlrWOd3qCTrDT3niahep
         GnpWiY63bPbWJCG9v6hqRIVW/JjGe3E4bBUhpMeyb1AJDof8MaGyqe1PiypEXmKHHkJF
         9aTAfIxy+vZEILdmNXqkMacSeatPc6IX0auW0PRvKiJXgK42VbV5cnqgDNU344SrwkLG
         Z6wOA6n6ZCIuRcwMNwF5LZUh3h3PCQcRF9vQE7iCXBRmiqVn2wLX1tNjPwWR6XxtnJ0g
         +iYQ==
X-Gm-Message-State: AOAM531vDMCHThivU8jsmlbOMWnEMfl+PhnJe+Xx6zeK8fjrXR34Q50k
        TCSVV41sjuWusUZH/9FQ3LFoh3/2Z7E=
X-Google-Smtp-Source: ABdhPJwkvhK/NCswQ2V0KmJYDz4etb37wiRdKTHEc7kLc+BeGNkI0CMyUBfbt6cb0bbVGeuLoC50/g==
X-Received: by 2002:a63:658:: with SMTP id 85mr10808736pgg.181.1591390222418;
        Fri, 05 Jun 2020 13:50:22 -0700 (PDT)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id 63sm445152pfd.65.2020.06.05.13.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 13:50:21 -0700 (PDT)
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
Subject: [PATCH v3] Bluetooth: Allow suspend even when preparation has failed
Date:   Fri,  5 Jun 2020 13:50:15 -0700
Message-Id: <20200605135009.v3.1.I0ec31d716619532fc007eac081e827a204ba03de@changeid>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
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

Fixes: dd522a7429b07e ("Bluetooth: Handle LE devices during suspend")
Reported-by: Len Brown <len.brown@intel.com>
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


Changes in v3:
- Changed printf format for unsigned long

Changes in v2:
- Added fixes and reported-by tags

 net/bluetooth/hci_core.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index dbe2d79f233fba..83ce665d3cbfb0 100644
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
+		bt_dev_err(hdev, "Suspend notifier action (%lu) failed: %d",
+			   action, ret);
+
+	return NOTIFY_STOP;
 }
 
 /* Alloc HCI device */
-- 
2.27.0.278.ge193c7cf3a9-goog

