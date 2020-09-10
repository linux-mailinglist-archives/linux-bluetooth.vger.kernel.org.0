Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C935A263AD5
	for <lists+linux-bluetooth@lfdr.de>; Thu, 10 Sep 2020 04:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730411AbgIJCAZ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 9 Sep 2020 22:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729521AbgIJBk6 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 9 Sep 2020 21:40:58 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EBE9C061344
        for <linux-bluetooth@vger.kernel.org>; Wed,  9 Sep 2020 18:40:58 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id u13so3380400pgh.1
        for <linux-bluetooth@vger.kernel.org>; Wed, 09 Sep 2020 18:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gTez5zBL4O/mFCX1yAYIY6uoJGixvvecrhH5yeefCRU=;
        b=b0zJlrJ3/FxkSGhXn87cvP+RTMUhelRrCM1riW4kT7+txcP800FsUvP6kSl1Tx+BQ9
         nlnSbaIdcJf/ctfzMo8lklWjGAlMfBcz670pLHXNIAzEyKNqQRUVeGBFLUGnDrDQvmmo
         LiL1peql9jifg/8mL5CDMgP9HFRyzTX8uyAco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gTez5zBL4O/mFCX1yAYIY6uoJGixvvecrhH5yeefCRU=;
        b=EDhYX+8QyW/IqGScP2neKGWshOUoYtFVcd/QLnynfu0FFPgJo51p/VHUeU/XTBe+07
         9dKGvo+yy3fuJ0qf/jB3ls5dedcfZX8oERz8ivuWXBUaeRZgRDu5dv8u5MBDeXwm8dAh
         u7uiWo9LpHp9TjAUqbs7PLg3/+e7SLebUq+20Nq7572YltfY44kT6/yUn+vrW7xuseGb
         mxHWZCjOPGu6fEtqWmXkh+vMEnGX0wS0oh1/z60+2BcdXhWyonJrZ2BqSjOaNzhgIKsZ
         I9Q9XwhaOuDLaFRBeCs13PtGsU1Nms+v1dZc/mqf4wdA96whncHSIW31YPYeY4zPnedm
         ZzJw==
X-Gm-Message-State: AOAM531f2QmpfrkA7KUG1qfWbAo1zUQJqoxuPmlajqcXRQjvKd/nBzTY
        j74x25QEwlC84nAAv+BZMJIah6r3QzH8CA==
X-Google-Smtp-Source: ABdhPJzBPsq3OhqI1wKePrmNY399SC3c/Mj0s1LcqZge53ktq1ymQHWKSBttbMamebJGRQYDAMFBPA==
X-Received: by 2002:a63:d25:: with SMTP id c37mr2501235pgl.403.1599702057352;
        Wed, 09 Sep 2020 18:40:57 -0700 (PDT)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:7220:84ff:fe09:2b94])
        by smtp.gmail.com with ESMTPSA id j19sm3885366pfi.51.2020.09.09.18.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 18:40:56 -0700 (PDT)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     linux-bluetooth@vger.kernel.org
Cc:     marcel@holtmann.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH] Bluetooth: Re-order clearing suspend tasks
Date:   Wed,  9 Sep 2020 18:40:06 -0700
Message-Id: <20200909183952.1.Ie55bb8dde9847e8005f24402f3f2d66ea09cd7b2@changeid>
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Unregister_pm_notifier is a blocking call so suspend tasks should be
cleared beforehand. Otherwise, the notifier will wait for completion
before returning (and we encounter a 2s timeout on resume).

Fixes: 0e9952804ec9c8 (Bluetooth: Clear suspend tasks on unregister)
Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---
Should have caught that unregister_pm_notifier was blocking last time
but when testing the earlier patch, I got unlucky and saw that the error
message was never hit (the suspend timeout).

When re-testing this patch on the same device, I was able to reproduce
the problem on an older build with the 0e9952804ec9c8 but not on a newer
build with the same patch. Changing the order correctly fixes it
everywhere. Confirmed this by adding debug logs in btusb_disconnect and
hci_suspend_notifier to confirm what order things were getting called.

Sorry about the churn. Next I'm going try to do something about the palm
shaped indentation on my forehead...

 net/bluetooth/hci_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index efc0fe2b47dac2..be9cdf5dabe5dc 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -3794,8 +3794,8 @@ void hci_unregister_dev(struct hci_dev *hdev)
 
 	cancel_work_sync(&hdev->power_on);
 
-	unregister_pm_notifier(&hdev->suspend_notifier);
 	hci_suspend_clear_tasks(hdev);
+	unregister_pm_notifier(&hdev->suspend_notifier);
 	cancel_work_sync(&hdev->suspend_prepare);
 
 	hci_dev_do_close(hdev);
-- 
2.28.0.618.gf4bc123cb7-goog

