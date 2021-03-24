Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E220347A50
	for <lists+linux-bluetooth@lfdr.de>; Wed, 24 Mar 2021 15:11:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235744AbhCXOLU (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 24 Mar 2021 10:11:20 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:38321 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236071AbhCXOLF (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 24 Mar 2021 10:11:05 -0400
Received: from localhost.localdomain (p4fefce19.dip0.t-ipconnect.de [79.239.206.25])
        by mail.holtmann.org (Postfix) with ESMTPSA id 97AB1CED01
        for <linux-bluetooth@vger.kernel.org>; Wed, 24 Mar 2021 15:18:43 +0100 (CET)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v2 3/5] Bluetooth: Fix mgmt status for LL Privacy experimental feature
Date:   Wed, 24 Mar 2021 15:10:57 +0100
Message-Id: <20210324141059.88009-3-marcel@holtmann.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The return error when trying to change the setting when a controller is
powered up, shall be MGMT_STATUS_REJECTED. However instead now the error
MGMT_STATUS_NOT_POWERED is used which is exactly the opposite.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 net/bluetooth/mgmt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 6b5bdf1f39ca..105d0743735d 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -3984,7 +3984,7 @@ static int set_exp_feature(struct sock *sk, struct hci_dev *hdev,
 		if (hdev_is_powered(hdev))
 			return mgmt_cmd_status(sk, hdev->id,
 					       MGMT_OP_SET_EXP_FEATURE,
-					       MGMT_STATUS_NOT_POWERED);
+					       MGMT_STATUS_REJECTED);
 
 		/* Parameters are limited to a single octet */
 		if (data_len != MGMT_SET_EXP_FEATURE_SIZE + 1)
-- 
2.30.2

