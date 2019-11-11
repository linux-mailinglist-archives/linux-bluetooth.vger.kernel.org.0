Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 861E3F7605
	for <lists+linux-bluetooth@lfdr.de>; Mon, 11 Nov 2019 15:10:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbfKKOKv (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 11 Nov 2019 09:10:51 -0500
Received: from hall.aurel32.net ([195.154.113.88]:55410 "EHLO hall.aurel32.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726832AbfKKOKu (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 11 Nov 2019 09:10:50 -0500
Received: from [2a01:e35:2fdd:a4e1:fe91:fc89:bc43:b814] (helo=ohm.rr44.fr)
        by hall.aurel32.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <aurelien@aurel32.net>)
        id 1iUAP3-0004KJ-FP; Mon, 11 Nov 2019 15:10:49 +0100
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.92.3)
        (envelope-from <aurelien@aurel32.net>)
        id 1iUAP1-00025Q-Ng; Mon, 11 Nov 2019 15:10:47 +0100
From:   Aurelien Jarno <aurelien@aurel32.net>
To:     linux-bluetooth@vger.kernel.org
Cc:     Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH BlueZ] mesh: fix sending messages to group addresses
Date:   Mon, 11 Nov 2019 15:10:46 +0100
Message-Id: <20191111141046.7972-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

When sending a message to a group address (either virtual or fixed), it
has to be sent OTA even if successfully enqueued to an internal model.
---
 mesh/net.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mesh/net.c b/mesh/net.c
index f07de4d8a..33b498135 100644
--- a/mesh/net.c
+++ b/mesh/net.c
@@ -3339,10 +3339,10 @@ bool mesh_net_app_send(struct mesh_net *net, bool frnd_cred, uint16_t src,
 				szmic, seq & SEQ_ZERO_MASK,
 				msg, msg_len);
 
-	/* If successfully enqued or delivered
-	 * to Unicast address, we are done
+	/* If addressed to a unicast address and successfully enqueued,
+	 * or delivered to one of our Unicast addresses we are done
 	 */
-	if (result || src == dst ||
+	if ((result && IS_UNICAST(dst)) || src == dst ||
 			(dst >= net->src_addr && dst <= net->last_addr)) {
 		/* Adjust our seq_num for "virtual" delivery */
 		net->seq_num += seg_max;
-- 
2.24.0

