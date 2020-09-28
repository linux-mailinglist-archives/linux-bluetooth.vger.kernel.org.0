Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F5B127A8E6
	for <lists+linux-bluetooth@lfdr.de>; Mon, 28 Sep 2020 09:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbgI1Hlg (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 28 Sep 2020 03:41:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbgI1Hlc (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 28 Sep 2020 03:41:32 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A16BC0613D0
        for <linux-bluetooth@vger.kernel.org>; Mon, 28 Sep 2020 00:41:32 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id k124so97430qkc.13
        for <linux-bluetooth@vger.kernel.org>; Mon, 28 Sep 2020 00:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=Mvol+j8w8vB0lTCT5I/vIjT4SJ4p2VunYWgFZbEC5zw=;
        b=ufB3u9ZFopAiEa9K6inwNxNDjBEAVl+Gf5YC4aWx24LzMVp/u4zXQYssqYd8av1AJ7
         rftRc42PmZLG7IBHK0mreM9rjy1oGH8PLER161iVFH65GdCGkmVF7F2roeeNEquW4/GL
         /vhW/FUZyNdNXS1VpqWfy+T5YisdxHLXO7jSNXyPPAJB0Tk7WNO9u536DC7HNDCptsAN
         QB+b5jUl3xR4XIaUht2PJpjYLbh9rM+tVjA/nE7geBzrJpQUKdFJj/Xk+1M7/vEzsE97
         71iepDNuB3c3gc/Az9GfL46XSe9tpPZjSf2zdlST5cECAzfSr6Fs9rOpoyhe9nzu6nFM
         CLkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Mvol+j8w8vB0lTCT5I/vIjT4SJ4p2VunYWgFZbEC5zw=;
        b=OpYH884rIrgHPkQSrys4T+MYxtsVv7LfkisrzF7A5gam19wV39sW5NwHhaaLcQf7rj
         wyt1AeCKkbLTQr0ScNq7t5T0mD7UcFOrpN8MENfhTx6vDHhbGJsoVemRfKcBElcjzNRL
         bRFz1WZpo0B2Qe8eJEOA52lO0oD0Wvj3uPlLSe2EpP9YXv74DKmx8ggPA0bLqP1pU8+Q
         oa4ez19jAytEvGrC5Fu1FQHAtgp0dmPq6JmY64ZoVO/D4cNaNlk94B8s8PgXN5wOiq/Q
         0bXeD5OLtXYBwwr+Po37UXWbk6eJIs1L2dhH9YQh6iP+6+ohabcmCg1a13vlqmJvTd/P
         ttag==
X-Gm-Message-State: AOAM530fUkMj5tZfET2KreqOt9MQ/FkONe4dWiDfT3bT7l936dqmOmZH
        DZlwlluerZvfDBWlbIZxonOf7xSC/1L5smOtjzNTfH/DDA37yMoWeBL1s94A6TK0oUmh9+u+TxS
        qZivzjxLZta4c72FI4m+FlQQ5Wii0BLXEonnVMWutV6mZkE9it3zIr12DJdyTfnAo+IltCuxc50
        mOvddhB5CoA58=
X-Google-Smtp-Source: ABdhPJz2LyZ9VTdEWF1CMtsBfWL6BNsm7tYgrYPj9hwxbSJfHZAn1iUcXwvaFdOZ5hfHmlACi1pGy5HuyCvooftwTA==
Sender: "howardchung via sendgmr" 
        <howardchung@howardchung-p920.tpe.corp.google.com>
X-Received: from howardchung-p920.tpe.corp.google.com ([2401:fa00:1:10:f693:9fff:fef4:4e45])
 (user=howardchung job=sendgmr) by 2002:a0c:90f1:: with SMTP id
 p104mr10886657qvp.15.1601278891072; Mon, 28 Sep 2020 00:41:31 -0700 (PDT)
Date:   Mon, 28 Sep 2020 15:41:19 +0800
In-Reply-To: <20200928154107.v6.1.Ib75f58e90c477f9b82c5598f00c59f0e95a1a352@changeid>
Message-Id: <20200928154107.v6.2.I3774a8f0d748c7c6ec3402c4adcead32810c9164@changeid>
Mime-Version: 1.0
References: <20200928154107.v6.1.Ib75f58e90c477f9b82c5598f00c59f0e95a1a352@changeid>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
Subject: [PATCH v6 2/4] Bluetooth: Handle system suspend resume case
From:   Howard Chung <howardchung@google.com>
To:     linux-bluetooth@vger.kernel.org, marcel@holtmann.org,
        luiz.dentz@gmail.com
Cc:     alainm@chromium.org, mcchou@chromium.org, mmandlik@chromium.orgi,
        Howard Chung <howardchung@google.com>,
        Manish Mandlik <mmandlik@chromium.org>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch adds code to handle the system suspension during interleave
scan. The interleave scan will be canceled when the system is going to
sleep, and will be restarted after waking up.

Signed-off-by: Howard Chung <howardchung@google.com>
Reviewed-by: Alain Michaud <alainm@chromium.org>
Reviewed-by: Manish Mandlik <mmandlik@chromium.org>
Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Reviewed-by: Miao-chen Chou <mcchou@chromium.org>
---

(no changes since v5)

Changes in v5:
- Remove the change in hci_req_config_le_suspend_scan

 net/bluetooth/hci_request.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/bluetooth/hci_request.c b/net/bluetooth/hci_request.c
index ba3016cc0b573..db44680fbe9c9 100644
--- a/net/bluetooth/hci_request.c
+++ b/net/bluetooth/hci_request.c
@@ -1281,8 +1281,10 @@ void hci_req_prepare_suspend(struct hci_dev *hdev, enum suspended_state next)
 		hci_req_add(&req, HCI_OP_WRITE_SCAN_ENABLE, 1, &page_scan);
 
 		/* Disable LE passive scan if enabled */
-		if (hci_dev_test_flag(hdev, HCI_LE_SCAN))
+		if (hci_dev_test_flag(hdev, HCI_LE_SCAN)) {
+			cancel_interleave_scan(hdev);
 			hci_req_add_le_scan_disable(&req, false);
+		}
 
 		/* Mark task needing completion */
 		set_bit(SUSPEND_SCAN_DISABLE, hdev->suspend_tasks);
-- 
2.28.0.681.g6f77f65b4e-goog

