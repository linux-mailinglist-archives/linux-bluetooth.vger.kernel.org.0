Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B256718B92
	for <lists+linux-bluetooth@lfdr.de>; Wed, 31 May 2023 23:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbjEaVIF (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 31 May 2023 17:08:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbjEaVIB (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 31 May 2023 17:08:01 -0400
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDC2B12E
        for <linux-bluetooth@vger.kernel.org>; Wed, 31 May 2023 14:07:56 -0700 (PDT)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout02.posteo.de (Postfix) with ESMTPS id AA28D240109
        for <linux-bluetooth@vger.kernel.org>; Wed, 31 May 2023 23:07:54 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4QWhgG1FhCz9rxH;
        Wed, 31 May 2023 23:07:54 +0200 (CEST)
From:   Pauli Virtanen <pav@iki.fi>
To:     linux-bluetooth@vger.kernel.org
Cc:     Pauli Virtanen <pav@iki.fi>
Subject: [PATCH v2 3/4] Bluetooth: ISO: use correct CIS order in Set CIG Parameters event
Date:   Wed, 31 May 2023 21:07:48 +0000
Message-Id: <bfc91e2fbc562938a1a02f23793ce726bd1ef254.1685565568.git.pav@iki.fi>
In-Reply-To: <cover.1685565568.git.pav@iki.fi>
References: <cover.1685565568.git.pav@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NEUTRAL,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The order of CIS handle array in Set CIG Parameters response shall match
the order of the CIS_ID array in the command (Core v5.3 Vol 4 Part E Sec
7.8.97).  We send CIS_IDs mainly in the order of increasing CIS_ID (but
with "last" CIS first if it has fixed CIG_ID).  In handling of the
reply, we currently assume this is also the same as the order of
hci_conn in hdev->conn_hash, but that is not true.

Match the correct hci_conn to the correct handle by matching them based
on the CIG+CIS combination.  The CIG+CIS combination shall be unique for
ISO_LINK hci_conn at state >= BT_BOUND, which we maintain in
hci_le_set_cig_params.

Fixes: 26afbd826ee3 ("Bluetooth: Add initial implementation of CIS connections")
Signed-off-by: Pauli Virtanen <pav@iki.fi>
---

Notes:
    v2: simplify and swap loops

 net/bluetooth/hci_event.c | 59 +++++++++++++++++++++++++++------------
 1 file changed, 41 insertions(+), 18 deletions(-)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index fe8177512a89..d0ccb8ebdcc9 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -3804,44 +3804,67 @@ static u8 hci_cc_le_set_cig_params(struct hci_dev *hdev, void *data,
 				   struct sk_buff *skb)
 {
 	struct hci_rp_le_set_cig_params *rp = data;
+	struct hci_cp_le_set_cig_params *cp;
 	struct hci_conn *conn;
-	int i = 0;
+	u8 status = rp->status;
+	int i;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
+	cp = hci_sent_cmd_data(hdev, HCI_OP_LE_SET_CIG_PARAMS);
+	if (!cp || rp->num_handles != cp->num_cis || rp->cig_id != cp->cig_id) {
+		bt_dev_err(hdev, "unexpected Set CIG Parameters response data");
+		status = HCI_ERROR_UNSPECIFIED;
+	}
+
 	hci_dev_lock(hdev);
 
-	if (rp->status) {
+	if (status) {
 		while ((conn = hci_conn_hash_lookup_cig(hdev, rp->cig_id))) {
 			conn->state = BT_CLOSED;
-			hci_connect_cfm(conn, rp->status);
+			hci_connect_cfm(conn, status);
 			hci_conn_del(conn);
 		}
 		goto unlock;
 	}
 
+	/* BLUETOOTH CORE SPECIFICATION Version 5.3 | Vol 4, Part E page 2553
+	 *
+	 * If the Status return parameter is zero, then the Controller shall
+	 * set the Connection_Handle arrayed return parameter to the connection
+	 * handle(s) corresponding to the CIS configurations specified in
+	 * the CIS_IDs command parameter, in the same order.
+	 */
+
 	rcu_read_lock();
 
-	list_for_each_entry_rcu(conn, &hdev->conn_hash.list, list) {
-		if (conn->type != ISO_LINK ||
-		    conn->iso_qos.ucast.cig != rp->cig_id ||
-		    conn->state == BT_CONNECTED)
-			continue;
+	for (i = 0; i < rp->num_handles; ++i) {
+		list_for_each_entry_rcu(conn, &hdev->conn_hash.list, list) {
+			if (conn->type != ISO_LINK ||
+			    !bacmp(&conn->dst, BDADDR_ANY))
+				continue;
+			if (conn->state != BT_BOUND &&
+			    conn->state != BT_CONNECT)
+				continue;
+			if (conn->iso_qos.ucast.cig != rp->cig_id ||
+			    conn->iso_qos.ucast.cis != cp->cis[i].cis_id)
+				continue;
 
-		conn->handle = __le16_to_cpu(rp->handle[i++]);
+			conn->handle = __le16_to_cpu(rp->handle[i]);
 
-		bt_dev_dbg(hdev, "%p handle 0x%4.4x parent %p", conn,
-			   conn->handle, conn->parent);
+			bt_dev_dbg(hdev, "%p handle 0x%4.4x parent %p",
+				   conn, conn->handle, conn->parent);
 
-		/* Create CIS if LE is already connected */
-		if (conn->parent && conn->parent->state == BT_CONNECTED) {
-			rcu_read_unlock();
-			hci_le_create_cis(conn);
-			rcu_read_lock();
-		}
+			/* Create CIS if LE is already connected */
+			if (conn->parent &&
+			    conn->parent->state == BT_CONNECTED) {
+				rcu_read_unlock();
+				hci_le_create_cis(conn);
+				rcu_read_lock();
+			}
 
-		if (i == rp->num_handles)
 			break;
+		}
 	}
 
 	rcu_read_unlock();
-- 
2.40.1

