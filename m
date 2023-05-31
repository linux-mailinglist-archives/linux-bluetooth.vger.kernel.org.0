Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEF1E718B8F
	for <lists+linux-bluetooth@lfdr.de>; Wed, 31 May 2023 23:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbjEaVIB (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 31 May 2023 17:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjEaVIA (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 31 May 2023 17:08:00 -0400
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A570D129
        for <linux-bluetooth@vger.kernel.org>; Wed, 31 May 2023 14:07:56 -0700 (PDT)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 3AB1C240106
        for <linux-bluetooth@vger.kernel.org>; Wed, 31 May 2023 23:07:54 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4QWhgF5JYxz9rxW;
        Wed, 31 May 2023 23:07:53 +0200 (CEST)
From:   Pauli Virtanen <pav@iki.fi>
To:     linux-bluetooth@vger.kernel.org
Cc:     Pauli Virtanen <pav@iki.fi>
Subject: [PATCH v2 2/4] Bluetooth: ISO: don't try to remove CIG if there are bound CIS left
Date:   Wed, 31 May 2023 21:07:47 +0000
Message-Id: <137e16ab38ea84a02241385e6622497de52ce9a3.1685565568.git.pav@iki.fi>
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

Consider existing BOUND & CONNECT state CIS to block CIG removal.
Otherwise, under suitable timing conditions we may attempt to remove CIG
while Create CIS is pending, which fails.

Fixes: 26afbd826ee3 ("Bluetooth: Add initial implementation of CIS connections")
Signed-off-by: Pauli Virtanen <pav@iki.fi>
---

Notes:
    v2: no changes

 net/bluetooth/hci_conn.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
index f45476deca82..15cba23ade52 100644
--- a/net/bluetooth/hci_conn.c
+++ b/net/bluetooth/hci_conn.c
@@ -983,6 +983,8 @@ static void cis_cleanup(struct hci_conn *conn)
 	/* Check if ISO connection is a CIS and remove CIG if there are
 	 * no other connections using it.
 	 */
+	hci_conn_hash_list_state(hdev, find_cis, ISO_LINK, BT_BOUND, &d);
+	hci_conn_hash_list_state(hdev, find_cis, ISO_LINK, BT_CONNECT, &d);
 	hci_conn_hash_list_state(hdev, find_cis, ISO_LINK, BT_CONNECTED, &d);
 	if (d.count)
 		return;
-- 
2.40.1

