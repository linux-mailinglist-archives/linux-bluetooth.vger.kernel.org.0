Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27A431EB316
	for <lists+linux-bluetooth@lfdr.de>; Tue,  2 Jun 2020 03:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726337AbgFBBn2 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 1 Jun 2020 21:43:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbgFBBn1 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 1 Jun 2020 21:43:27 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F6F9C061A0E
        for <linux-bluetooth@vger.kernel.org>; Mon,  1 Jun 2020 18:43:27 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id c17so9410360ybf.7
        for <linux-bluetooth@vger.kernel.org>; Mon, 01 Jun 2020 18:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=3SD2wXCrnpqqqGjUo6uJ3X+OXN7BvMIdCCqQSQJ14xI=;
        b=VGuDoDjLffnb36Mz+dHxNMFnAXp2hgYxwrQnwJj6V/JqLJq/LAuENWgNkf1SQFlBUI
         mRQsj7QkIlcA2G+1seDqPjg6CE7H7MHaxHMve8iERkXT+GgSGcJN2QwNaAhma0q04+h+
         4q8UtRz1CwcfA9zQF/NINeFh3lVqRN2mzgz6AKKKfk4TfnGvWFAe8PIyu3t3gsteSJu1
         B7MGN4XgQjqu4DyORjQdFOvVDpDCf/b6dLPV8/oIlhhEK+uYT0uC1xvx9JIIs8xEmuwF
         0qcElEZekbxwd3OWMNeYIr1GB3kYIzYu51HR+8hlnmEVak7pSl9GqwDOO4dp6KFVLzps
         FS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=3SD2wXCrnpqqqGjUo6uJ3X+OXN7BvMIdCCqQSQJ14xI=;
        b=MM15NxiLEC0HsFlemG1XDEamepZS6QmLwW0FUxUgq5sPOUMtm7UPVzNduxEul3ltqm
         N0N/y77Peu7wbWyu3hHJCdEHFmSvce9c3UwrkeqWrNhmNWFhe2Wd8bJcpeEE0eE4RCP1
         FFJz6i9RAV33AIDRHi9u8Rc5BXKZYETpL4KTaqtOXmpq6tLeKb0amG3IfbKUvoR55y2E
         RcB4DF/+cljUXcK+LXLdOblvsQlxTBQyzpZ3qU3g+bLuFaQpWtHyiCseWH8w+WSN2/Tl
         SQDHJ8PPSJfiXd9RkVhWK7UbgZQ1wGdlsJr7BDHZteB51+OCrAe6DP0GrNINnFQonGyx
         oKZQ==
X-Gm-Message-State: AOAM531kXP1hxm+5423eeSHeAW7XrcUaUZRsRxsaLEPVdwnyYJH8/BNl
        96Yj7ICT00xW5JXN0uA/QeWeLvlns/Glrg==
X-Google-Smtp-Source: ABdhPJzvSDdGNn7xHWKBGxaSlUL77s0Uk7gIgVjBgWa1SmrYs3n77rFdUSAvuBEmmcSC+hcPI8jDWwD413gYuQ==
X-Received: by 2002:a25:b8cb:: with SMTP id g11mr35775711ybm.189.1591062206411;
 Mon, 01 Jun 2020 18:43:26 -0700 (PDT)
Date:   Mon,  1 Jun 2020 18:42:51 -0700
Message-Id: <20200601184223.1.I281c81384150e8fefbebf32fa79cb091d0311208@changeid>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.rc2.251.g90737beb825-goog
Subject: [PATCH] Bluetooth: Check scan state before disabling during suspend
From:   Manish Mandlik <mmandlik@google.com>
To:     marcel@holtmann.org, luiz.dentz@gmail.com
Cc:     abhishekpandit@chromium.org, linux-bluetooth@vger.kernel.org,
        chromeos-bluetooth-upstreaming@chromium.org,
        Manish Mandlik <mmandlik@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Check current scan state by checking HCI_LE_SCAN flag and send scan
disable command only if scan is already enabled.

Signed-off-by: Manish Mandlik <mmandlik@google.com>
---

 net/bluetooth/hci_request.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/net/bluetooth/hci_request.c b/net/bluetooth/hci_request.c
index 1fc55685da62d..1acf5b8e0910c 100644
--- a/net/bluetooth/hci_request.c
+++ b/net/bluetooth/hci_request.c
@@ -998,8 +998,9 @@ static void hci_req_set_event_filter(struct hci_request *req)
 
 static void hci_req_config_le_suspend_scan(struct hci_request *req)
 {
-	/* Can't change params without disabling first */
-	hci_req_add_le_scan_disable(req);
+	/* Before changing params disable scan if enabled */
+	if (hci_dev_test_flag(req->hdev, HCI_LE_SCAN))
+		hci_req_add_le_scan_disable(req);
 
 	/* Configure params and enable scanning */
 	hci_req_add_le_passive_scan(req);
@@ -1065,8 +1066,9 @@ void hci_req_prepare_suspend(struct hci_dev *hdev, enum suspended_state next)
 		page_scan = SCAN_DISABLED;
 		hci_req_add(&req, HCI_OP_WRITE_SCAN_ENABLE, 1, &page_scan);
 
-		/* Disable LE passive scan */
-		hci_req_add_le_scan_disable(&req);
+		/* Disable LE passive scan if enabled */
+		if (hci_dev_test_flag(hdev, HCI_LE_SCAN))
+			hci_req_add_le_scan_disable(&req);
 
 		/* Mark task needing completion */
 		set_bit(SUSPEND_SCAN_DISABLE, hdev->suspend_tasks);
-- 
2.27.0.rc2.251.g90737beb825-goog

