Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0830D355B31
	for <lists+linux-bluetooth@lfdr.de>; Tue,  6 Apr 2021 20:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238185AbhDFSTn (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 6 Apr 2021 14:19:43 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:34678 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238075AbhDFSTl (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 6 Apr 2021 14:19:41 -0400
Received: from localhost.localdomain (p4ff9f418.dip0.t-ipconnect.de [79.249.244.24])
        by mail.holtmann.org (Postfix) with ESMTPSA id 48F6DCECC8
        for <linux-bluetooth@vger.kernel.org>; Tue,  6 Apr 2021 20:27:15 +0200 (CEST)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v2 5/5] Bluetooth: Allow Microsoft extension to indicate curve validation
Date:   Tue,  6 Apr 2021 20:19:27 +0200
Message-Id: <20210406181927.313769-5-marcel@holtmann.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Some controllers don't support the Simple Pairing Options feature that
can indicate the support for P-192 and P-256 public key validation.
However they might support the Microsoft vendor extension that can
indicate the validiation capability as well.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 include/net/bluetooth/hci_core.h | 1 +
 net/bluetooth/mgmt.c             | 5 ++++-
 net/bluetooth/msft.c             | 3 +++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index 58f7eada26fd..c73ac52af186 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -584,6 +584,7 @@ struct hci_dev {
 #if IS_ENABLED(CONFIG_BT_MSFTEXT)
 	__u16			msft_opcode;
 	void			*msft_data;
+	bool			msft_curve_validity;
 #endif
 
 #if IS_ENABLED(CONFIG_BT_AOSPEXT)
diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 59f8016c4866..288c1445c232 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -3730,8 +3730,11 @@ static int read_controller_cap(struct sock *sk, struct hci_dev *hdev,
 
 	/* When the Read Simple Pairing Options command is supported, then
 	 * the remote public key validation is supported.
+	 *
+	 * Alternatively, when Microsoft extensions are available, they can
+	 * indicate support for public key validation as well.
 	 */
-	if (hdev->commands[41] & 0x08)
+	if ((hdev->commands[41] & 0x08) || hdev->msft_curve_validity)
 		flags |= 0x01;	/* Remote public key validation (BR/EDR) */
 
 	flags |= 0x02;		/* Remote public key validation (LE) */
diff --git a/net/bluetooth/msft.c b/net/bluetooth/msft.c
index 47b104f318e9..b1970467a868 100644
--- a/net/bluetooth/msft.c
+++ b/net/bluetooth/msft.c
@@ -142,6 +142,9 @@ static bool read_supported_features(struct hci_dev *hdev,
 	msft->evt_prefix_len = rp->evt_prefix_len;
 	msft->features = __le64_to_cpu(rp->features);
 
+	if (msft->features & MSFT_FEATURE_MASK_CURVE_VALIDITY)
+		hdev->msft_curve_validity = true;
+
 	kfree_skb(skb);
 	return true;
 
-- 
2.30.2

