Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E995326D324
	for <lists+linux-bluetooth@lfdr.de>; Thu, 17 Sep 2020 07:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726153AbgIQF3u (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 17 Sep 2020 01:29:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbgIQF3u (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 17 Sep 2020 01:29:50 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E056BC061756
        for <linux-bluetooth@vger.kernel.org>; Wed, 16 Sep 2020 22:29:49 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id l1so763339qvr.0
        for <linux-bluetooth@vger.kernel.org>; Wed, 16 Sep 2020 22:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=DZtn9Rr5NAewp1qZv3hmsmsuQTNnLlGeDd7GB4F/76U=;
        b=N5U4fkyXuSJJo80wRUSBbIGDBA3w3e+zfqT8bI/6fqISU81t+RiYolHSLlsTvDD19M
         xjSY3EkS66Pg6nTWAfsAMszpfpx/k1bH0dAwzGAkqAiS35tTV9xqJysEccv+1kZnP/xr
         4LeXHMQXLFZ0mkry9aoUkV0IxLTVIHGv6VoRNyraUdBGsGxjvyrAmEL9+6lCOcbqCU/6
         ffRKh03667e2hOaNrprKQRxp6HeqietvqwpIGd43ki0BKutqaMI9X49iqoLqGYMg+D8z
         cdo5fFARDhZeRM5RlYxWuw3CHSU0ORRCSB21QPhNCZHqjw27+I2yEXQaHlapIcXd84bE
         /yQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=DZtn9Rr5NAewp1qZv3hmsmsuQTNnLlGeDd7GB4F/76U=;
        b=prmwjF/Z6y7yKnYHccz1gb9uFX9/mQ+0CMRbR6DjJjPxGRNRbu1YMp1koDqWIZ1fKY
         BN5TAixMbt/XsXVg6q9MewPo32wS22va1lBVByoSaGRKNIK1F0WzemVcCFpX209N4VUf
         3R3SHsJe+FuV7K2yZCXrj6l7pGPxN9BDAdSKau0cd8CqT/CCxiwP11bzhF5V9ouN9jxw
         h3L63P4BqrxeynIgBL/LEocbA3hs+1nLcrkEl3nOg+5eFLiJNXuEG4sjvt8IjiliCOZG
         vY496HFX00x55OUD+GcQ/uB6TRsWWDKkNB+8Ja5DHS6RoxemJIxxIcckVFXY0BpYRwkc
         4HaQ==
X-Gm-Message-State: AOAM531S0zERetOmqhNOLjsu0zsnNkoBReGbfOIA94rO/KEs1WxNwSZy
        ATy4SeUwXdAPZSdr52IZdq4NUgIzsAI34zGllduTtHuuv7jCaGbC5LIjJaAOcz39lmHKCNUAO6P
        nY7GjjNvq26PnWw1XtG8wHl2CMpPSqd7QiJJvIX0GCWQ9RDreXhHVT+L8vn2+YN+3BnTNXUTdaj
        V2VFlD217houc=
X-Google-Smtp-Source: ABdhPJxBxxNGWgG//JG92tXqEKNVQMibAYANYD7k1sVUyTqLXpM98PAOyJ1XVSkQqbQ9sd3NjaACQu/QPCpkCcX6lQ==
X-Received: from howardchung-p920.tpe.corp.google.com ([2401:fa00:1:10:f693:9fff:fef4:4e45])
 (user=howardchung job=sendgmr) by 2002:a0c:fe8b:: with SMTP id
 d11mr10852077qvs.48.1600320588288; Wed, 16 Sep 2020 22:29:48 -0700 (PDT)
Date:   Thu, 17 Sep 2020 13:29:38 +0800
Message-Id: <20200917132836.BlueZ.1.I27ef2a783d8920c147458639f3fa91b69f6fd9ea@changeid>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
Subject: [BlueZ PATCH 1/6] Bluetooth: Update Adv monitor count upon removal
From:   Howard Chung <howardchung@google.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     mcchou@chromium.org, marcel@holtmann.org, mmandlik@chromium.org,
        howardchung@google.com, luiz.dentz@gmail.com, alainm@chromium.org,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Miao-chen Chou <mcchou@chromium.org>

This fixes the count of Adv monitor upon monitor removal.

The following test was performed.
- Start two btmgmt consoles, issue a btmgmt advmon-remove command on one
console and observe a MGMT_EV_ADV_MONITOR_REMOVED event on the other.

Signed-off-by: Howard Chung <howardchung@google.com>
Signed-off-by: Miao-chen Chou <mcchou@chromium.org>
Reviewed-by: Alain Michaud <alainm@chromium.org>
---

 net/bluetooth/hci_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 8a2645a833013..f30a1f5950e15 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -3061,6 +3061,7 @@ static int free_adv_monitor(int id, void *ptr, void *data)
 
 	idr_remove(&hdev->adv_monitors_idr, monitor->handle);
 	hci_free_adv_monitor(monitor);
+	hdev->adv_monitors_cnt--;
 
 	return 0;
 }
@@ -3077,6 +3078,7 @@ int hci_remove_adv_monitor(struct hci_dev *hdev, u16 handle)
 
 		idr_remove(&hdev->adv_monitors_idr, monitor->handle);
 		hci_free_adv_monitor(monitor);
+		hdev->adv_monitors_cnt--;
 	} else {
 		/* Remove all monitors if handle is 0. */
 		idr_for_each(&hdev->adv_monitors_idr, &free_adv_monitor, hdev);
-- 
2.28.0.618.gf4bc123cb7-goog

