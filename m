Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 704E717EB82
	for <lists+linux-bluetooth@lfdr.de>; Mon,  9 Mar 2020 22:48:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbgCIVsP (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 9 Mar 2020 17:48:15 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:34649 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbgCIVsP (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 9 Mar 2020 17:48:15 -0400
Received: from localhost.localdomain (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id AFCF6CECC4
        for <linux-bluetooth@vger.kernel.org>; Mon,  9 Mar 2020 22:57:42 +0100 (CET)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH] Bluetooth: Use bt_dev_err for RPA generation failure message
Date:   Mon,  9 Mar 2020 22:48:10 +0100
Message-Id: <20200309214810.431559-1-marcel@holtmann.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

When the RPA generation fails, indicate the error with a device specifc
error message.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 net/bluetooth/hci_request.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/bluetooth/hci_request.c b/net/bluetooth/hci_request.c
index 2a1b64dbf76e..53179ae856ae 100644
--- a/net/bluetooth/hci_request.c
+++ b/net/bluetooth/hci_request.c
@@ -1499,7 +1499,7 @@ int hci_get_random_address(struct hci_dev *hdev, bool require_privacy,
 
 		err = smp_generate_rpa(hdev, hdev->irk, &hdev->rpa);
 		if (err < 0) {
-			BT_ERR("%s failed to generate new RPA", hdev->name);
+			bt_dev_err(hdev, "failed to generate new RPA");
 			return err;
 		}
 
-- 
2.24.1

