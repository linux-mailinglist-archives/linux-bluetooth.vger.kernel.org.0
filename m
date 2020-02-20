Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 570E5165586
	for <lists+linux-bluetooth@lfdr.de>; Thu, 20 Feb 2020 04:17:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727921AbgBTDRl (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 19 Feb 2020 22:17:41 -0500
Received: from mail-pg1-f202.google.com ([209.85.215.202]:43699 "EHLO
        mail-pg1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727747AbgBTDRl (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 19 Feb 2020 22:17:41 -0500
Received: by mail-pg1-f202.google.com with SMTP id v14so1416367pgo.10
        for <linux-bluetooth@vger.kernel.org>; Wed, 19 Feb 2020 19:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=i2O9M22wRHGvAOZAL5G1kwDrP71Yc5DXVKcI6ikT/o0=;
        b=dlpnFhTJuppuR+7jhHOrc29QhJDsFb/a9lebelLf5+HpvXJAn1SQBioq39Qk8Vm3AQ
         CaUiiTHkAgza79JX7dXl3SCPyyIwwCB2Zj6DbBTVEGF8c5wauY6xKMi8xxVKZw//JS2H
         3jDmVyKsKRudtiC4BeHrWuJZBL7iFYElm8LYKpLUaScuxhcalPyXP634Spg/cogqQq8j
         35xfj0nCeAwlfsWLTdbma6cb6Xzb82XaO/bSzayA2HwEPYyOQefA3WQvS7F/X8tFzwn+
         PZl1jwhrpg0riUoXF0V61wIeJb0iKteX2/MQYwSMrRU6X8BqMrFqbojtUyrLd10crM2Z
         1fdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=i2O9M22wRHGvAOZAL5G1kwDrP71Yc5DXVKcI6ikT/o0=;
        b=OGZ+FVyHuPjHGD8XYZ8VFAKoqEDWlgdMpQQDU+JrtQHMi3u1bezDZrYLQNeA/qk0Ay
         bruiWECjx2X4ixAcpDZ5AnBUMtpRg6i+eJVp2ArC5ZZQViRo4NlDWtDQzwYVo4zj+bWc
         +NfASKWwqL8i4dxM715HMGXI6QUeCb9qtSnGKSlusRIEO8CM7Oa5lMG4dZLP4fCbcJEs
         ngsbxKT14Xwodtlt+bhpt8fFPicrjRJHZ1WjdJBvfjrxnEnsPF9/njAv0xHU6BDA3zgw
         X76p1dFze2NUZiG4WOcyihrReRjLkcIvV+EFW0TsLEADLzFy3TU9I75vUWSp8InQ9m8/
         lSgw==
X-Gm-Message-State: APjAAAXNLtjaWjmO+cWBDePdx6SoCQaWUcvEk+Om9UQCAWirT6yFUNOP
        4eZancLnhZ8dKAC/lYy0SCPJKmI+yh8Jh94Rxp2/axDXKpgtt0ezyUdy8dvlbYQMe4PUaI7py16
        /fl43hw/Zjoh8abf1Lp1UtOQum+JCdXkcnMxs2TRAxxL8EFkJzzCmq9OV824S+/8kGVgFrgcrtA
        lEYvWpXV17U6U=
X-Google-Smtp-Source: APXvYqwhfiEKlSr0AAX/yDJjQ+IOrKLdHL+H7bLrG4jZblws54K3aApuo2mh5mWRFYU+RaFoM5HXxjPpmsEXHnHDtw==
X-Received: by 2002:a63:b250:: with SMTP id t16mr29658302pgo.18.1582168660404;
 Wed, 19 Feb 2020 19:17:40 -0800 (PST)
Date:   Thu, 20 Feb 2020 11:17:29 +0800
Message-Id: <20200220111711.Bluez.v3.1.I145f6c5bbf2437a6f6afc28d3db2b876c034c2d8@changeid>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [Bluez PATCH v3] bluetooth: fix passkey uninitialized when used
From:   Howard Chung <howardchung@google.com>
To:     linux-bluetooth@vger.kernel.org, marcel@holtmann.org
Cc:     chromeos-bluetooth-upstreaming@chromium.org,
        Howard Chung <howardchung@google.com>,
        kbuild test robot <lkp@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jakub Kicinski <kuba@kernel.org>,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch fix the issue: warning:variable 'passkey' is uninitialized
when used here

Link: https://groups.google.com/forum/#!topic/clang-built-linux/kyRKCjRsGoU

Reported-by: kbuild test robot <lkp@intel.com>

Suggested-by: Marcel Holtmann <marcel@holtmann.org>

Signed-off-by: Howard Chung <howardchung@google.com>

---

Changes in v3:
- rephrase the commit message

Changes in v2:
- refactor code

 net/bluetooth/smp.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/net/bluetooth/smp.c b/net/bluetooth/smp.c
index 50e0ac692ec4..929e0bebaf80 100644
--- a/net/bluetooth/smp.c
+++ b/net/bluetooth/smp.c
@@ -2115,7 +2115,7 @@ static u8 smp_cmd_pairing_random(struct l2cap_conn *conn, struct sk_buff *skb)
 	struct l2cap_chan *chan = conn->smp;
 	struct smp_chan *smp = chan->data;
 	struct hci_conn *hcon = conn->hcon;
-	u8 *pkax, *pkbx, *na, *nb;
+	u8 *pkax, *pkbx, *na, *nb, confirm_hint;
 	u32 passkey;
 	int err;
 
@@ -2179,13 +2179,12 @@ static u8 smp_cmd_pairing_random(struct l2cap_conn *conn, struct sk_buff *skb)
 		 */
 		if (hci_find_ltk(hcon->hdev, &hcon->dst, hcon->dst_type,
 				 hcon->role)) {
-			err = mgmt_user_confirm_request(hcon->hdev, &hcon->dst,
-							hcon->type,
-							hcon->dst_type,
-							passkey, 1);
-			if (err)
-				return SMP_UNSPECIFIED;
-			set_bit(SMP_FLAG_WAIT_USER, &smp->flags);
+			/* Set passkey to 0. The value can be any number since
+			 * it'll be ignored anyway.
+			 */
+			passkey = 0;
+			confirm_hint = 1;
+			goto confirm;
 		}
 	}
 
@@ -2206,9 +2205,11 @@ static u8 smp_cmd_pairing_random(struct l2cap_conn *conn, struct sk_buff *skb)
 	err = smp_g2(smp->tfm_cmac, pkax, pkbx, na, nb, &passkey);
 	if (err)
 		return SMP_UNSPECIFIED;
+	confirm_hint = 0;
 
+confirm:
 	err = mgmt_user_confirm_request(hcon->hdev, &hcon->dst, hcon->type,
-					hcon->dst_type, passkey, 0);
+					hcon->dst_type, passkey, confirm_hint);
 	if (err)
 		return SMP_UNSPECIFIED;
 
-- 
2.25.0.265.gbab2e86ba0-goog

