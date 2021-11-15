Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3032451838
	for <lists+linux-bluetooth@lfdr.de>; Mon, 15 Nov 2021 23:53:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233559AbhKOWzo (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 15 Nov 2021 17:55:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347878AbhKOWse (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 15 Nov 2021 17:48:34 -0500
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2149C07978E
        for <linux-bluetooth@vger.kernel.org>; Mon, 15 Nov 2021 14:01:02 -0800 (PST)
Received: by mail-il1-x12d.google.com with SMTP id i9so18232569ilu.8
        for <linux-bluetooth@vger.kernel.org>; Mon, 15 Nov 2021 14:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QzueYWxy8dLImh7cCYYdS3GsWWCRwq/RzqiWPZWYfQc=;
        b=DpUkAzJjsCVWwr6xiKlHOJbMkFdZMrMTQLr/TUMHFRGtfKJCKafbykmPsMMARFhtg5
         G6K1QOh2Ymly7eeYK52rvkI4+m8NhdXn/8QwaPFP6/ZPvgJ3DjmrU4HZSmAqmTkvuGnh
         nD/BtiEmbVW2rYwNzw/adflbl91XBT913bFoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QzueYWxy8dLImh7cCYYdS3GsWWCRwq/RzqiWPZWYfQc=;
        b=oSspqN7GHqxSrq3O8yfiRdA4WR+ayN6QOUFurzNOEDyIEsK4517DbhCGkzUt64HX98
         KvePFCxH9+PvHEu6pHkvkBMNOfXfE6ZZcVaWtQj+3sCzvLTYlrjmNDWJfSgmrQPTUhML
         1+CmceeNZiIMd4yQEvJjbPmKYFRTYLaG8jjrRb+AcQj/TQEb7frCtOcRUbEq2JdqkBc6
         35PYChSXb6rI9ZJpiQmwEk8Ryic1N1wtGAM9FpLP1jbwDqtBPFrPFiXHK3eni619ipgG
         H7n9IPiUz1dJlz95teuikx/VvzQvi2kg09iB28naT0kiMM4W/GYyZ5v5h0KldCDeWVAl
         eAdw==
X-Gm-Message-State: AOAM532DJ+9OI/G4ZKQFLcU8fbHiGWIivSj0y9VlTgYqosULh3xpLIPk
        lUzXJzWGMDovFjeqhxEOD3Sj70H3wlOM7w==
X-Google-Smtp-Source: ABdhPJyA3i8n7ZKbPb+ib9Zyp+wG/d9GT1lDpobG+WuC9dDKipMtVqcOfUikuUdQ6OJ+Y7rRMz8vPg==
X-Received: by 2002:a05:6e02:1ba4:: with SMTP id n4mr1333561ili.305.1637013662089;
        Mon, 15 Nov 2021 14:01:02 -0800 (PST)
Received: from melhuishj.c.googlers.com.com (161.74.123.34.bc.googleusercontent.com. [34.123.74.161])
        by smtp.gmail.com with ESMTPSA id i7sm10855048ilu.24.2021.11.15.14.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 14:01:01 -0800 (PST)
From:   Jesse Melhuish <melhuishj@chromium.org>
To:     linux-bluetooth@vger.kernel.org
Cc:     Jesse Melhuish <melhuishj@chromium.org>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        Sonny Sasaka <sonnysasaka@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH v3] Bluetooth: Don't initialize msft/aosp when using user channel
Date:   Mon, 15 Nov 2021 22:00:52 +0000
Message-Id: <20211115220021.v3.1.I2a8b2f2e52d05ae9ead3f3dcc1dd90ef47a7acd7@changeid>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

A race condition is triggered when usermode control is given to
userspace before the kernel's MSFT query responds, resulting in an
unexpected response to userspace's reset command.

Issue can be observed in btmon:
< HCI Command: Vendor (0x3f|0x001e) plen 2                    #3 [hci0]
        05 01                                            ..
@ USER Open: bt_stack_manage (privileged) version 2.22  {0x0002} [hci0]
< HCI Command: Reset (0x03|0x0003) plen 0                     #4 [hci0]
> HCI Event: Command Complete (0x0e) plen 5                   #5 [hci0]
      Vendor (0x3f|0x001e) ncmd 1
	Status: Command Disallowed (0x0c)
	05                                               .
> HCI Event: Command Complete (0x0e) plen 4                   #6 [hci0]
      Reset (0x03|0x0003) ncmd 2
	Status: Success (0x00)
Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Reviewed-by: Sonny Sasaka <sonnysasaka@chromium.org>
Signed-off-by: Jesse Melhuish <melhuishj@chromium.org>
---

Changes in v3:
- Added guard around *_close calls as well.

Changes in v2:
- Moved guard to the new home for this code.

 net/bluetooth/hci_sync.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index b794605dc882..06d08dc6ad22 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -3887,8 +3887,10 @@ int hci_dev_open_sync(struct hci_dev *hdev)
 	    hci_dev_test_flag(hdev, HCI_VENDOR_DIAG) && hdev->set_diag)
 		ret = hdev->set_diag(hdev, true);
 
-	msft_do_open(hdev);
-	aosp_do_open(hdev);
+	if (!hci_dev_test_flag(hdev, HCI_USER_CHANNEL)) {
+		msft_do_open(hdev);
+		aosp_do_open(hdev);
+	}
 
 	clear_bit(HCI_INIT, &hdev->flags);
 
@@ -4031,8 +4033,10 @@ int hci_dev_close_sync(struct hci_dev *hdev)
 
 	hci_sock_dev_event(hdev, HCI_DEV_DOWN);
 
-	aosp_do_close(hdev);
-	msft_do_close(hdev);
+	if (!hci_dev_test_flag(hdev, HCI_USER_CHANNEL)) {
+		aosp_do_close(hdev);
+		msft_do_close(hdev);
+	}
 
 	if (hdev->flush)
 		hdev->flush(hdev);
-- 
2.31.0

