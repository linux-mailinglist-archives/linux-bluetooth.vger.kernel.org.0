Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D769B201EFD
	for <lists+linux-bluetooth@lfdr.de>; Sat, 20 Jun 2020 02:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730557AbgFTAKj (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 19 Jun 2020 20:10:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730373AbgFTAKh (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 19 Jun 2020 20:10:37 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56064C0613EE
        for <linux-bluetooth@vger.kernel.org>; Fri, 19 Jun 2020 17:10:37 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id 35so4627256ple.0
        for <linux-bluetooth@vger.kernel.org>; Fri, 19 Jun 2020 17:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bA2Hx5ZHpgALpLTRNJ8RED5WSk+bgJtyk0UtUvWs6Ck=;
        b=C8tcCrI8g2+v2wcL3NpiNtX1IWiokLbLw8080bz8al5zRbmxNRQMiMlIXUUBpC6Pb3
         fWgQJWNsW+zM/oSOPUPebSZypulS7JDINuPt9f3+7p3BQXL4kawkzNK0zrCz473Kn+ku
         qlpP8WWn0Th6SbqDLG1uxkzeTxb6XjBlPWG9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bA2Hx5ZHpgALpLTRNJ8RED5WSk+bgJtyk0UtUvWs6Ck=;
        b=LQEGT5nE0ggDjsaNJTQ9wGOMziDo6WC+W71VyI6FZdzGEu8b/chhcpcvsT/vjsFtTU
         qRIuJuDJ3Rlx0kge9SEJU6JT0qFLOvUQxzcEAEFc2tBVMDAcozlmqhMRYwbADrAOb8Ow
         E0Isx4rZvscGs2ZG14pBBDJWfJftm1FmqVcKWGptcynXpaUtlc+R3nDx5qJi3iW6SKrb
         LgMgLqWvM5WmVgu69dSMIyX041BEKYdyiLHAzcnrMpP4sPSmkW9YKbY8//8ktXMoQ3kj
         abH19MPG2osvR8XhCiuCV9l8DzrTxCF50iqa2YI+iyiB9Pu5Gx3h0uJWmIU94sSE39A5
         nQXw==
X-Gm-Message-State: AOAM532SUVXolqk5/6/0RdUt06Bssa4mzxjtvjs3H/mMGKDOGgAHzxw8
        7ZzchRSmgcQsoTLVcp0qHwmsww==
X-Google-Smtp-Source: ABdhPJxutMk1mTkLK2Fj/BDxglLsp0izci0o1QVdjpFFc0keXGjw9NMDqSB7A3+jQt7om7jczbkn4g==
X-Received: by 2002:a17:90a:9904:: with SMTP id b4mr5893613pjp.207.1592611836739;
        Fri, 19 Jun 2020 17:10:36 -0700 (PDT)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id y136sm7032325pfg.55.2020.06.19.17.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 17:10:36 -0700 (PDT)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     marcel@holtmann.org, linux-bluetooth@vger.kernel.org,
        mcchou@chromium.org
Cc:     chromeos-bluetooth-upstreaming@chromium.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH] Bluetooth: Add hci_dev_lock to get/set device flags
Date:   Fri, 19 Jun 2020 17:10:24 -0700
Message-Id: <20200619171016.1.I56e71a63b5d2712a1b198681e0f107b5aa3cd725@changeid>
X-Mailer: git-send-email 2.27.0.111.gc72c7da667-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Adding hci_dev_lock since hci_conn_params_(lookup|add) require this
lock.

Suggested-by: Miao-chen Chou <mcchou@chromium.org>
Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

 net/bluetooth/mgmt.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 2a732cab1dc99d..5e9b9728eeac03 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -3895,6 +3895,8 @@ static int get_device_flags(struct sock *sk, struct hci_dev *hdev, void *data,
 	bt_dev_dbg(hdev, "Get device flags %pMR (type 0x%x)\n",
 		   &cp->addr.bdaddr, cp->addr.type);
 
+	hci_dev_lock(hdev);
+
 	if (cp->addr.type == BDADDR_BREDR) {
 		br_params = hci_bdaddr_list_lookup_with_flags(&hdev->whitelist,
 							      &cp->addr.bdaddr,
@@ -3921,6 +3923,8 @@ static int get_device_flags(struct sock *sk, struct hci_dev *hdev, void *data,
 	status = MGMT_STATUS_SUCCESS;
 
 done:
+	hci_dev_unlock(hdev);
+
 	return mgmt_cmd_complete(sk, hdev->id, MGMT_OP_GET_DEVICE_FLAGS, status,
 				&rp, sizeof(rp));
 }
@@ -3959,6 +3963,8 @@ static int set_device_flags(struct sock *sk, struct hci_dev *hdev, void *data,
 		goto done;
 	}
 
+	hci_dev_lock(hdev);
+
 	if (cp->addr.type == BDADDR_BREDR) {
 		br_params = hci_bdaddr_list_lookup_with_flags(&hdev->whitelist,
 							      &cp->addr.bdaddr,
@@ -3985,6 +3991,8 @@ static int set_device_flags(struct sock *sk, struct hci_dev *hdev, void *data,
 	}
 
 done:
+	hci_dev_unlock(hdev);
+
 	if (status == MGMT_STATUS_SUCCESS)
 		device_flags_changed(sk, hdev, &cp->addr.bdaddr, cp->addr.type,
 				     supported_flags, current_flags);
-- 
2.27.0.111.gc72c7da667-goog

