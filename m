Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0A2433A511
	for <lists+linux-bluetooth@lfdr.de>; Sun, 14 Mar 2021 14:57:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232662AbhCNN4t (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 14 Mar 2021 09:56:49 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:54943 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbhCNN4P (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 14 Mar 2021 09:56:15 -0400
Received: from localhost.localdomain (p4fefc126.dip0.t-ipconnect.de [79.239.193.38])
        by mail.holtmann.org (Postfix) with ESMTPSA id 8864CCECA3
        for <linux-bluetooth@vger.kernel.org>; Sun, 14 Mar 2021 15:03:49 +0100 (CET)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH] Bluetooth: Fix wrong opcode error for read advertising features
Date:   Sun, 14 Mar 2021 14:56:08 +0100
Message-Id: <20210314135608.266264-1-marcel@holtmann.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The read advertising features error handling returns false the opcode
for the set advertising command.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 net/bluetooth/mgmt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 105d0743735d..2426a0d38c80 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -7478,7 +7478,7 @@ static int read_adv_features(struct sock *sk, struct hci_dev *hdev,
 	 * advertising.
 	 */
 	if (hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY))
-		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_ADVERTISING,
+		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_READ_ADV_FEATURES,
 				       MGMT_STATUS_NOT_SUPPORTED);
 
 	hci_dev_lock(hdev);
-- 
2.30.2

