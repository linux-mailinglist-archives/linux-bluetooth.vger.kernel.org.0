Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C69141493FB
	for <lists+linux-bluetooth@lfdr.de>; Sat, 25 Jan 2020 09:23:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727441AbgAYIXw (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 25 Jan 2020 03:23:52 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:44876 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgAYIXw (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 25 Jan 2020 03:23:52 -0500
Received: from localhost.localdomain (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 37B91CED19
        for <linux-bluetooth@vger.kernel.org>; Sat, 25 Jan 2020 09:33:11 +0100 (CET)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH] Bluetooth: Add missing checks for HCI_ISODATA_PKT packet type
Date:   Sat, 25 Jan 2020 09:23:47 +0100
Message-Id: <20200125082347.96440-1-marcel@holtmann.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The checks for HCI_ISODATA_PKT packet type are required in a few
additional locations to allow sending/receiving of this new packet type.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 net/bluetooth/hci_core.c |  4 +++-
 net/bluetooth/hci_sock.c | 12 ++++++++----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 1ca7508b6ca7..cbbc34a006d1 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -3565,7 +3565,8 @@ int hci_recv_frame(struct hci_dev *hdev, struct sk_buff *skb)
 
 	if (hci_skb_pkt_type(skb) != HCI_EVENT_PKT &&
 	    hci_skb_pkt_type(skb) != HCI_ACLDATA_PKT &&
-	    hci_skb_pkt_type(skb) != HCI_SCODATA_PKT) {
+	    hci_skb_pkt_type(skb) != HCI_SCODATA_PKT &&
+	    hci_skb_pkt_type(skb) != HCI_ISODATA_PKT) {
 		kfree_skb(skb);
 		return -EINVAL;
 	}
@@ -4543,6 +4544,7 @@ static void hci_rx_work(struct work_struct *work)
 			switch (hci_skb_pkt_type(skb)) {
 			case HCI_ACLDATA_PKT:
 			case HCI_SCODATA_PKT:
+			case HCI_ISODATA_PKT:
 				kfree_skb(skb);
 				continue;
 			}
diff --git a/net/bluetooth/hci_sock.c b/net/bluetooth/hci_sock.c
index 3ae508674ef7..5756b124c2cb 100644
--- a/net/bluetooth/hci_sock.c
+++ b/net/bluetooth/hci_sock.c
@@ -211,7 +211,8 @@ void hci_send_to_sock(struct hci_dev *hdev, struct sk_buff *skb)
 			if (hci_skb_pkt_type(skb) != HCI_COMMAND_PKT &&
 			    hci_skb_pkt_type(skb) != HCI_EVENT_PKT &&
 			    hci_skb_pkt_type(skb) != HCI_ACLDATA_PKT &&
-			    hci_skb_pkt_type(skb) != HCI_SCODATA_PKT)
+			    hci_skb_pkt_type(skb) != HCI_SCODATA_PKT &&
+			    hci_skb_pkt_type(skb) != HCI_ISODATA_PKT)
 				continue;
 			if (is_filtered_packet(sk, skb))
 				continue;
@@ -220,7 +221,8 @@ void hci_send_to_sock(struct hci_dev *hdev, struct sk_buff *skb)
 				continue;
 			if (hci_skb_pkt_type(skb) != HCI_EVENT_PKT &&
 			    hci_skb_pkt_type(skb) != HCI_ACLDATA_PKT &&
-			    hci_skb_pkt_type(skb) != HCI_SCODATA_PKT)
+			    hci_skb_pkt_type(skb) != HCI_SCODATA_PKT &&
+			    hci_skb_pkt_type(skb) != HCI_ISODATA_PKT)
 				continue;
 		} else {
 			/* Don't send frame to other channel types */
@@ -1768,7 +1770,8 @@ static int hci_sock_sendmsg(struct socket *sock, struct msghdr *msg,
 		 */
 		if (hci_skb_pkt_type(skb) != HCI_COMMAND_PKT &&
 		    hci_skb_pkt_type(skb) != HCI_ACLDATA_PKT &&
-		    hci_skb_pkt_type(skb) != HCI_SCODATA_PKT) {
+		    hci_skb_pkt_type(skb) != HCI_SCODATA_PKT &&
+		    hci_skb_pkt_type(skb) != HCI_ISODATA_PKT) {
 			err = -EINVAL;
 			goto drop;
 		}
@@ -1812,7 +1815,8 @@ static int hci_sock_sendmsg(struct socket *sock, struct msghdr *msg,
 		}
 
 		if (hci_skb_pkt_type(skb) != HCI_ACLDATA_PKT &&
-		    hci_skb_pkt_type(skb) != HCI_SCODATA_PKT) {
+		    hci_skb_pkt_type(skb) != HCI_SCODATA_PKT &&
+		    hci_skb_pkt_type(skb) != HCI_ISODATA_PKT) {
 			err = -EINVAL;
 			goto drop;
 		}
-- 
2.24.1

