Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A01CD232F49
	for <lists+linux-bluetooth@lfdr.de>; Thu, 30 Jul 2020 11:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729275AbgG3JOa (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 30 Jul 2020 05:14:30 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:58139 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729119AbgG3JO1 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 30 Jul 2020 05:14:27 -0400
Received: from localhost.localdomain (p4ff9f430.dip0.t-ipconnect.de [79.249.244.48])
        by mail.holtmann.org (Postfix) with ESMTPSA id 98838CECF5
        for <linux-bluetooth@vger.kernel.org>; Thu, 30 Jul 2020 11:24:28 +0200 (CEST)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH 4/8] Bluetooth: Translate additional address type during le_conn
Date:   Thu, 30 Jul 2020 11:14:17 +0200
Message-Id: <20200730091421.48847-4-marcel@holtmann.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Sathish Narasimman <nsathish41@gmail.com>

When using controller based address resolution, then the new address
types 0x02 and 0x03 are used. These types need to be converted back into
either public address or random address types.

This patch is specially during LE_CREATE_CONN if using own_add_type as 0x02
or 0x03.

Signed-off-by: Sathish Narasimman <sathish.narasimman@intel.com>
Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 net/bluetooth/hci_event.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 61f8c4d12028..6388fb55b4d2 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -2296,6 +2296,22 @@ static void cs_le_create_conn(struct hci_dev *hdev, bdaddr_t *peer_addr,
 	if (!conn)
 		return;
 
+	/* When using controller based address resolution, then the new
+	 * address types 0x02 and 0x03 are used. These types need to be
+	 * converted back into either public address or random address type
+	 */
+	if (use_ll_privacy(hdev) &&
+	    hci_dev_test_flag(hdev, HCI_LL_RPA_RESOLUTION)) {
+		switch (own_address_type) {
+		case ADDR_LE_DEV_PUBLIC_RESOLVED:
+			own_address_type = ADDR_LE_DEV_PUBLIC;
+			break;
+		case ADDR_LE_DEV_RANDOM_RESOLVED:
+			own_address_type = ADDR_LE_DEV_RANDOM;
+			break;
+		}
+	}
+
 	/* Store the initiator and responder address information which
 	 * is needed for SMP. These values will not change during the
 	 * lifetime of the connection.
-- 
2.26.2

