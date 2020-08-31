Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 578BD257F0B
	for <lists+linux-bluetooth@lfdr.de>; Mon, 31 Aug 2020 18:51:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728329AbgHaQvi (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 31 Aug 2020 12:51:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726939AbgHaQvh (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 31 Aug 2020 12:51:37 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E740BC061575
        for <linux-bluetooth@vger.kernel.org>; Mon, 31 Aug 2020 09:51:36 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id p37so918131pgl.3
        for <linux-bluetooth@vger.kernel.org>; Mon, 31 Aug 2020 09:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e0vvOvvHJGYF7a0Genu2fCkpngsUdQSUu8uEc44Bpec=;
        b=UzOsZYDpZRtoa3zdZGrzH2kjQLR4VT+DZn2shy2vnsl06x55wm8y65FeOgjXRxV55e
         HxkvO7V6BZW0+16tOURbnBnIHu/WjsjRe9An0i0j5mw2bIKBCkKXWhXmb0BSwWQ3b5/h
         WQ0S+FTtmqLPVmcYWDS4petTsGSqZhWjRFA0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e0vvOvvHJGYF7a0Genu2fCkpngsUdQSUu8uEc44Bpec=;
        b=UB2cRtNwLWEnTscutqUVS8SNT3g2ubkIH25zj+hPTLZmGOF8TtM6ZMrjq85Dw4fJ0V
         36Ot+0d57KIr8DUxEf62e/Ex7eUmKGLDxj5Bm5xeeMxKGaLXjC5ryYdN8VuIdeZwb1ff
         q5uAkg8KfXgViC23oDqW0TmvKR/6h1iZOYH88XT82pazXn0Qc4vwno+qjxg4Z17fpu91
         T+/ruVEh29AYdy/wPGQiI/+5sz5aFH+LRiYGXyxmlh36P83e/4u66le+wcyIPYniJP3O
         s5wrex7VSPQmTBnVFLUvMlMmA7XkOEZjfuWzJXJbk6U67zjtgNiYryYV2ZckABMMIK11
         gSUA==
X-Gm-Message-State: AOAM533U/pmOVxWlDChtxwz4NY4UD6LjvoHcimakG1jb+nzRrlf+urgY
        qCCJKisjGRudzTx2pqEp1Omm8w==
X-Google-Smtp-Source: ABdhPJx+lLDch40/FsX48QUf1KjmhYjA47S013g5ttuztFBm4bL4RjoNUNMuail4dby1mDZKmeW8+g==
X-Received: by 2002:a63:5160:: with SMTP id r32mr2003729pgl.112.1598892696285;
        Mon, 31 Aug 2020 09:51:36 -0700 (PDT)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:7220:84ff:fe09:2b94])
        by smtp.gmail.com with ESMTPSA id k5sm8189082pgk.78.2020.08.31.09.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 09:51:35 -0700 (PDT)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     marcel@holtmann.org, linux-bluetooth@vger.kernel.org
Cc:     chromeos-bluetooth-upstreaming@chromium.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jakub Kicinski <kuba@kernel.org>,
        Miao-chen Chou <mcchou@chromium.org>
Subject: [PATCH v2] Bluetooth: Clear suspend tasks on unregister
Date:   Mon, 31 Aug 2020 09:51:27 -0700
Message-Id: <20200831095119.v2.1.I24fb6cc377d03d64d74f83cec748afd12ee33e37@changeid>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

While unregistering, make sure to clear the suspend tasks before
cancelling the work. If the unregister is called during resume from
suspend, this will unnecessarily add 2s to the resume time otherwise.

Fixes: 4e8c36c3b0d73d (Bluetooth: Fix suspend notifier race)
Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---
This was discovered with RT8822CE using the btusb driver. This chipset
will reset on resume during system suspend and was unnecessarily adding
2s to every resume. Since we're unregistering anyway, there's no harm in
just clearing the pending events.

Changes in v2:
- ++i to i++

 net/bluetooth/hci_core.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 68bfe57b66250f..efc0fe2b47dac2 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -3442,6 +3442,16 @@ void hci_copy_identity_address(struct hci_dev *hdev, bdaddr_t *bdaddr,
 	}
 }
 
+static void hci_suspend_clear_tasks(struct hci_dev *hdev)
+{
+	int i;
+
+	for (i = 0; i < __SUSPEND_NUM_TASKS; i++)
+		clear_bit(i, hdev->suspend_tasks);
+
+	wake_up(&hdev->suspend_wait_q);
+}
+
 static int hci_suspend_wait_event(struct hci_dev *hdev)
 {
 #define WAKE_COND                                                              \
@@ -3785,6 +3795,7 @@ void hci_unregister_dev(struct hci_dev *hdev)
 	cancel_work_sync(&hdev->power_on);
 
 	unregister_pm_notifier(&hdev->suspend_notifier);
+	hci_suspend_clear_tasks(hdev);
 	cancel_work_sync(&hdev->suspend_prepare);
 
 	hci_dev_do_close(hdev);
-- 
2.28.0.402.g5ffc5be6b7-goog

