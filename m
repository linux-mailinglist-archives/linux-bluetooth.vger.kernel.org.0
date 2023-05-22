Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4C1C70CB9C
	for <lists+linux-bluetooth@lfdr.de>; Mon, 22 May 2023 22:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234165AbjEVUwy (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 22 May 2023 16:52:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233790AbjEVUwx (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 22 May 2023 16:52:53 -0400
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DE6D94
        for <linux-bluetooth@vger.kernel.org>; Mon, 22 May 2023 13:52:51 -0700 (PDT)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 98B27240037
        for <linux-bluetooth@vger.kernel.org>; Mon, 22 May 2023 22:52:50 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4QQ8m05S5Lz6tvt;
        Mon, 22 May 2023 22:52:48 +0200 (CEST)
From:   Pauli Virtanen <pav@iki.fi>
To:     linux-bluetooth@vger.kernel.org
Cc:     Pauli Virtanen <pav@iki.fi>
Subject: [PATCH v2 1/2] Bluetooth: ISO: consider right CIS when removing CIG at cleanup
Date:   Mon, 22 May 2023 20:52:44 +0000
Message-Id: <2bf70b0560375b50180518968abd8c4dfcce7f34.1684788145.git.pav@iki.fi>
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

When looking for CIS blocking CIG removal, consider only the CIS with
the right CIG ID. Don't try to remove CIG with unset CIG ID.

Fixes: 26afbd826ee3 ("Bluetooth: Add initial implementation of CIS connections")
Signed-off-by: Pauli Virtanen <pav@iki.fi>
---

Notes:
    * v2: add forgotten signoff + fixes

 net/bluetooth/hci_conn.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
index f75ef12f18f7..2363477af89d 100644
--- a/net/bluetooth/hci_conn.c
+++ b/net/bluetooth/hci_conn.c
@@ -950,6 +950,8 @@ static void find_cis(struct hci_conn *conn, void *data)
 	/* Ignore broadcast */
 	if (!bacmp(&conn->dst, BDADDR_ANY))
 		return;
+	if (d->cig != conn->iso_qos.ucast.cig)
+		return;
 
 	d->count++;
 }
@@ -963,6 +965,9 @@ static void cis_cleanup(struct hci_conn *conn)
 	struct hci_dev *hdev = conn->hdev;
 	struct iso_list_data d;
 
+	if (conn->iso_qos.ucast.cig == BT_ISO_QOS_CIG_UNSET)
+		return;
+
 	memset(&d, 0, sizeof(d));
 	d.cig = conn->iso_qos.ucast.cig;
 
-- 
2.40.1

