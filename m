Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76B0F14C261
	for <lists+linux-bluetooth@lfdr.de>; Tue, 28 Jan 2020 22:53:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbgA1Vxl (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 28 Jan 2020 16:53:41 -0500
Received: from mga12.intel.com ([192.55.52.136]:7924 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726211AbgA1Vxl (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 28 Jan 2020 16:53:41 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Jan 2020 13:53:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,375,1574150400"; 
   d="scan'208";a="246856286"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.255.84.27])
  by orsmga002.jf.intel.com with ESMTP; 28 Jan 2020 13:53:40 -0800
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, inga.stotland@intel.com,
        rafal.gajda@silvair.com
Subject: [PATCH BlueZ v3 3/5] mesh: Clean-up unneeded Sequence Number increments
Date:   Tue, 28 Jan 2020 13:53:08 -0800
Message-Id: <20200128215310.8205-4-brian.gix@intel.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200128215310.8205-1-brian.gix@intel.com>
References: <20200128215310.8205-1-brian.gix@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Scrub of Sequence Number handling of OB messages to account for in-node
delivery of segmented messages, so that each discrete message has a
unique sequence number for the RPL.
---
 mesh/net.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/mesh/net.c b/mesh/net.c
index 71ff2cea0..9567d947e 100644
--- a/mesh/net.c
+++ b/mesh/net.c
@@ -3043,14 +3043,19 @@ static bool send_seg(struct mesh_net *net, struct mesh_sar *msg, uint8_t segO)
 	uint8_t segN = SEG_MAX(msg->len);
 	uint16_t seg_off = SEG_OFF(segO);
 	uint32_t key_id = 0;
-	uint32_t seq_num = mesh_net_next_seq_num(net);
+	uint32_t seq_num;
 
 	if (segN) {
+		/* Send each segment on unique seq_num */
+		seq_num = mesh_net_next_seq_num(net);
+
 		if (msg->len - seg_off > SEG_OFF(1))
 			seg_len = SEG_OFF(1);
 		else
 			seg_len = msg->len - seg_off;
 	} else {
+		/* Send on same seq_num used for Access Layer */
+		seq_num = msg->seqAuth;
 		seg_len = msg->len;
 	}
 
@@ -3185,7 +3190,7 @@ bool mesh_net_app_send(struct mesh_net *net, bool frnd_cred, uint16_t src,
 
 	/* First enqueue to any Friends and internal models */
 	result = msg_rxed(net, false, iv_index, ttl,
-				seq + seg_max,
+				seq,
 				net_idx,
 				src, dst,
 				key_aid,
@@ -3196,12 +3201,8 @@ bool mesh_net_app_send(struct mesh_net *net, bool frnd_cred, uint16_t src,
 	 * or delivered to one of our Unicast addresses we are done
 	 */
 	if ((result && IS_UNICAST(dst)) || src == dst ||
-			(dst >= net->src_addr && dst <= net->last_addr)) {
-		/* Adjust our seq_num for "virtual" delivery */
-		net->seq_num += seg_max;
-		mesh_net_next_seq_num(net);
+			(dst >= net->src_addr && dst <= net->last_addr))
 		return true;
-	}
 
 	/* If Segmented, Cancel any OB segmented message to same DST */
 	if (seg_max) {
@@ -3226,7 +3227,7 @@ bool mesh_net_app_send(struct mesh_net *net, bool frnd_cred, uint16_t src,
 	}
 
 	payload->iv_index = mesh_net_get_iv_index(net);
-	payload->seqAuth = net->seq_num;
+	payload->seqAuth = seq;
 
 	result = true;
 	if (!IS_UNICAST(dst) && seg_max) {
-- 
2.21.1

