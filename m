Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71652355C9A
	for <lists+linux-bluetooth@lfdr.de>; Tue,  6 Apr 2021 21:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245116AbhDFT4N (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 6 Apr 2021 15:56:13 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:45469 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237939AbhDFT4K (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 6 Apr 2021 15:56:10 -0400
Received: from localhost.localdomain (p4ff9f418.dip0.t-ipconnect.de [79.249.244.24])
        by mail.holtmann.org (Postfix) with ESMTPSA id 4E2A0CECC9
        for <linux-bluetooth@vger.kernel.org>; Tue,  6 Apr 2021 22:03:44 +0200 (CEST)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v3 5/5] Bluetooth: Allow Microsoft extension to indicate curve validation
Date:   Tue,  6 Apr 2021 21:55:56 +0200
Message-Id: <20210406195556.316663-5-marcel@holtmann.org>
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
 net/bluetooth/msft.c             | 8 ++++++++
 net/bluetooth/msft.h             | 6 ++++++
 4 files changed, 19 insertions(+), 1 deletion(-)

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
index 59f8016c4866..f9be7f9084d6 100644
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
+	if ((hdev->commands[41] & 0x08) || msft_curve_validity(hdev))
 		flags |= 0x01;	/* Remote public key validation (BR/EDR) */
 
 	flags |= 0x02;		/* Remote public key validation (LE) */
diff --git a/net/bluetooth/msft.c b/net/bluetooth/msft.c
index 47b104f318e9..e28f15439ce4 100644
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
 
@@ -605,3 +608,8 @@ int msft_set_filter_enable(struct hci_dev *hdev, bool enable)
 
 	return err;
 }
+
+bool msft_curve_validity(struct hci_dev *hdev)
+{
+	return hdev->msft_curve_validity;
+}
diff --git a/net/bluetooth/msft.h b/net/bluetooth/msft.h
index 88ed613dfa08..6e56d94b88d8 100644
--- a/net/bluetooth/msft.h
+++ b/net/bluetooth/msft.h
@@ -22,6 +22,7 @@ int msft_remove_monitor(struct hci_dev *hdev, struct adv_monitor *monitor,
 			u16 handle);
 void msft_req_add_set_filter_enable(struct hci_request *req, bool enable);
 int msft_set_filter_enable(struct hci_dev *hdev, bool enable);
+bool msft_curve_validity(struct hci_dev *hdev);
 
 #else
 
@@ -54,4 +55,9 @@ static inline int msft_set_filter_enable(struct hci_dev *hdev, bool enable)
 	return -EOPNOTSUPP;
 }
 
+static inline bool msft_curve_validity(struct hci_dev *hdev)
+{
+	return false;
+}
+
 #endif
-- 
2.30.2

