Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87A33713B5B
	for <lists+linux-bluetooth@lfdr.de>; Sun, 28 May 2023 19:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbjE1RoY (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 28 May 2023 13:44:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjE1RoU (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 28 May 2023 13:44:20 -0400
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5378FB9
        for <linux-bluetooth@vger.kernel.org>; Sun, 28 May 2023 10:44:19 -0700 (PDT)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout02.posteo.de (Postfix) with ESMTPS id DEBDC240101
        for <linux-bluetooth@vger.kernel.org>; Sun, 28 May 2023 19:44:17 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4QTmHj3fZWz6trs;
        Sun, 28 May 2023 19:44:17 +0200 (CEST)
From:   Pauli Virtanen <pav@iki.fi>
To:     linux-bluetooth@vger.kernel.org
Cc:     Pauli Virtanen <pav@iki.fi>
Subject: [PATCH 4/6] Bluetooth: ISO: don't try to remove CIG if there are bound CIS left
Date:   Sun, 28 May 2023 17:44:12 +0000
Message-Id: <8a63cb0a2fbbcc365a7384b45dc20e16f666c120.1685294131.git.pav@iki.fi>
In-Reply-To: <cover.1685294131.git.pav@iki.fi>
References: <cover.1685294131.git.pav@iki.fi>
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
 net/bluetooth/hci_conn.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
index 47a8ec796d97..e8a4f2825201 100644
--- a/net/bluetooth/hci_conn.c
+++ b/net/bluetooth/hci_conn.c
@@ -974,6 +974,8 @@ static void cis_cleanup(struct hci_conn *conn)
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

