Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C234A232F45
	for <lists+linux-bluetooth@lfdr.de>; Thu, 30 Jul 2020 11:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729209AbgG3JO2 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 30 Jul 2020 05:14:28 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:39358 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729117AbgG3JO1 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 30 Jul 2020 05:14:27 -0400
Received: from localhost.localdomain (p4ff9f430.dip0.t-ipconnect.de [79.249.244.48])
        by mail.holtmann.org (Postfix) with ESMTPSA id 7D9FCCECF4
        for <linux-bluetooth@vger.kernel.org>; Thu, 30 Jul 2020 11:24:28 +0200 (CEST)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH 3/8] Bluetooth: Update resolving list when updating whitelist
Date:   Thu, 30 Jul 2020 11:14:16 +0200
Message-Id: <20200730091421.48847-3-marcel@holtmann.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

When the whitelist is updated, then also update the entries of the
resolving list for devices where IRKs are available.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Signed-off-by: Sathish Narsimman <sathish.narasimman@intel.com>
Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 net/bluetooth/hci_request.c | 41 +++++++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/net/bluetooth/hci_request.c b/net/bluetooth/hci_request.c
index 7d0ba53ffed0..85de1f356610 100644
--- a/net/bluetooth/hci_request.c
+++ b/net/bluetooth/hci_request.c
@@ -694,6 +694,21 @@ static void del_from_white_list(struct hci_request *req, bdaddr_t *bdaddr,
 	bt_dev_dbg(req->hdev, "Remove %pMR (0x%x) from whitelist", &cp.bdaddr,
 		   cp.bdaddr_type);
 	hci_req_add(req, HCI_OP_LE_DEL_FROM_WHITE_LIST, sizeof(cp), &cp);
+
+	if (use_ll_privacy(req->hdev)) {
+		struct smp_irk *irk;
+
+		irk = hci_find_irk_by_addr(req->hdev, bdaddr, bdaddr_type);
+		if (irk) {
+			struct hci_cp_le_del_from_resolv_list cp;
+
+			cp.bdaddr_type = bdaddr_type;
+			bacpy(&cp.bdaddr, bdaddr);
+
+			hci_req_add(req, HCI_OP_LE_DEL_FROM_RESOLV_LIST,
+				    sizeof(cp), &cp);
+		}
+	}
 }
 
 /* Adds connection to white list if needed. On error, returns -1. */
@@ -714,7 +729,7 @@ static int add_to_white_list(struct hci_request *req,
 		return -1;
 
 	/* White list can not be used with RPAs */
-	if (!allow_rpa &&
+	if (!allow_rpa && !use_ll_privacy(hdev) &&
 	    hci_find_irk_by_addr(hdev, &params->addr, params->addr_type)) {
 		return -1;
 	}
@@ -732,6 +747,28 @@ static int add_to_white_list(struct hci_request *req,
 		   cp.bdaddr_type);
 	hci_req_add(req, HCI_OP_LE_ADD_TO_WHITE_LIST, sizeof(cp), &cp);
 
+	if (use_ll_privacy(hdev)) {
+		struct smp_irk *irk;
+
+		irk = hci_find_irk_by_addr(hdev, &params->addr,
+					   params->addr_type);
+		if (irk) {
+			struct hci_cp_le_add_to_resolv_list cp;
+
+			cp.bdaddr_type = params->addr_type;
+			bacpy(&cp.bdaddr, &params->addr);
+			memcpy(cp.peer_irk, irk->val, 16);
+
+			if (hci_dev_test_flag(hdev, HCI_PRIVACY))
+				memcpy(cp.local_irk, hdev->irk, 16);
+			else
+				memset(cp.local_irk, 0, 16);
+
+			hci_req_add(req, HCI_OP_LE_ADD_TO_RESOLV_LIST,
+				    sizeof(cp), &cp);
+		}
+	}
+
 	return 0;
 }
 
@@ -772,7 +809,7 @@ static u8 update_white_list(struct hci_request *req)
 		}
 
 		/* White list can not be used with RPAs */
-		if (!allow_rpa &&
+		if (!allow_rpa && !use_ll_privacy(hdev) &&
 		    hci_find_irk_by_addr(hdev, &b->bdaddr, b->bdaddr_type)) {
 			return 0x00;
 		}
-- 
2.26.2

