Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BCE81D04C3
	for <lists+linux-bluetooth@lfdr.de>; Wed, 13 May 2020 04:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728551AbgEMCTh (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 12 May 2020 22:19:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728532AbgEMCTf (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 12 May 2020 22:19:35 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F936C061A0E
        for <linux-bluetooth@vger.kernel.org>; Tue, 12 May 2020 19:19:35 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id r22so5492468pga.12
        for <linux-bluetooth@vger.kernel.org>; Tue, 12 May 2020 19:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JyYHudIiC7MnJBODonJVqQ91dxHR5J0pzH8SU9f0bj8=;
        b=J94rDlgf2ETWeHBGBa6Mzk/RjSmWqelmJGWWTOOLyacPauLkYP16nyLlRaTiog1bnq
         SVDHh5riQdQBhsvMFtJvhhQi7/3kAT/0Gac5K++SCQ3ecyoiJ53KwvMMiqcyAq9sDbH6
         m2pN/ioRUueIVVP8/hoeuL4whI76fKZ5ihu8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JyYHudIiC7MnJBODonJVqQ91dxHR5J0pzH8SU9f0bj8=;
        b=b6tNovKLiWlzjbBUtba0G3JzKgA+GiywZU7vj2hgk8pygwLyysKbKuiBrkanw8EqD0
         10TvSudMeXWdWBOOWmxTqaAYB5UQbr67oHx4Hjd+nyGh+niL5OlQpEsd3/Wqo2uRPtqZ
         HvVdClXVitWa0HfGNmDmvuoTLKhhA0SyHHtRNexDNJIR9IbUAQFGNrG5LlomfdAz9wvb
         teL/jHfxeG64m/gAhN46sXDJYW19bA51TbAPLuId0HOz/Fhsk5Ekr3CQXDSmgA8b1whO
         5Ni2hLerWIjKwANe3fR6cVYyoiLyfT7VARD+sxg5YI4UP9LYSfG50pTVCN6sq1rJAnEU
         icuQ==
X-Gm-Message-State: AGi0PuZ3MsYwQ3T8rtaNG3v17uwX41HStZ1tn+zRlPTS3gVF2MgUVidg
        xIqStgy8E7uZ+lRZ15ki/qtVhQ==
X-Google-Smtp-Source: APiQypJBjsPJieEQPi1eVDayvEQaLzZJy5jHtU+4a/YMAjymTrhR0x3e3m7eU/ylj51tZWl4SyEXQQ==
X-Received: by 2002:aa7:810a:: with SMTP id b10mr22621635pfi.22.1589336374733;
        Tue, 12 May 2020 19:19:34 -0700 (PDT)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id w2sm14170600pja.53.2020.05.12.19.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 19:19:34 -0700 (PDT)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     marcel@holtmann.org, linux-bluetooth@vger.kernel.org
Cc:     chromeos-bluetooth-upstreaming@chromium.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        Alain Michaud <alainm@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 2/3] Bluetooth: Add hook for driver to prevent wake from suspend
Date:   Tue, 12 May 2020 19:19:26 -0700
Message-Id: <20200512191838.2.I797e2588abe0319e571fd440ba1a75d786e69c1b@changeid>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
In-Reply-To: <20200513021927.115700-1-abhishekpandit@chromium.org>
References: <20200513021927.115700-1-abhishekpandit@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Let drivers have a hook to disable configuring scanning during suspend.
Drivers should use the device_may_wakeup function call to determine
whether hci should be configured for wakeup.

For example, an implementation for btusb may look like the following:

  bool btusb_prevent_wake(struct hci_dev *hdev)
  {
        struct btusb_data *data = hci_get_drvdata(hdev);
        return !device_may_wakeup(&data->udev->dev);
  }

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Reviewed-by: Alain Michaud <alainm@chromium.org>
---

 include/net/bluetooth/hci_core.h | 1 +
 net/bluetooth/hci_core.c         | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index 869ee2b30a4c1..5dcf85f186c6c 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -503,6 +503,7 @@ struct hci_dev {
 	int (*set_diag)(struct hci_dev *hdev, bool enable);
 	int (*set_bdaddr)(struct hci_dev *hdev, const bdaddr_t *bdaddr);
 	void (*cmd_timeout)(struct hci_dev *hdev);
+	bool (*prevent_wake)(struct hci_dev *hdev);
 };
 
 #define HCI_PHY_HANDLE(handle)	(handle & 0xff)
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index de1f4e72ec065..dbe2d79f233fb 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -3350,8 +3350,10 @@ static int hci_suspend_notifier(struct notifier_block *nb, unsigned long action,
 		 */
 		ret = hci_change_suspend_state(hdev, BT_SUSPEND_DISCONNECT);
 
-		/* Only configure whitelist if disconnect succeeded */
-		if (!ret)
+		/* Only configure whitelist if disconnect succeeded and wake
+		 * isn't being prevented.
+		 */
+		if (!ret && !(hdev->prevent_wake && hdev->prevent_wake(hdev)))
 			ret = hci_change_suspend_state(hdev,
 						BT_SUSPEND_CONFIGURE_WAKE);
 	} else if (action == PM_POST_SUSPEND) {
-- 
2.26.2.645.ge9eca65c58-goog

