Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED341A27D4
	for <lists+linux-bluetooth@lfdr.de>; Wed,  8 Apr 2020 19:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728043AbgDHRSk (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 8 Apr 2020 13:18:40 -0400
Received: from mga06.intel.com ([134.134.136.31]:3465 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727327AbgDHRSk (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 8 Apr 2020 13:18:40 -0400
IronPort-SDR: sC0rOGPXB4ZrxE0woCzP/viOyL5oIbsIbo+biWdXf1Dhafkpp0zve98KLEoqHCv1L0oaE8Es0o
 b+4SnZbRSg8g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2020 10:15:53 -0700
IronPort-SDR: A1JB7K9djg3gtPIgGAPjVkfMX0vgRTEdIrlLsNaToaDwziA/j7u9OWFu8/ReRK9LXGYSq+m9sn
 1vqvFSq4ux7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,359,1580803200"; 
   d="scan'208";a="452882090"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.209.85.198])
  by fmsmga006.fm.intel.com with ESMTP; 08 Apr 2020 10:15:51 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, inga.stotland@intel.com,
        rafal.gajda@silvair.com
Subject: [PATCH BlueZ v2] mesh: Ignore beacons with IVU if IV already updated
Date:   Wed,  8 Apr 2020 10:15:16 -0700
Message-Id: <20200408171516.15151-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Rafał Gajda <rafal.gajda@silvair.com>

When daemon receives beacon with IV=n+1, IVU=False it will
start sending messages with new IV and set sequence to 0.
However if daemon receives another beacon with IV=n+1, IVU=True it
will go back to sending messages with old IV=n (IVU set to True).
Because sequence number has been reset those messages will be dropped
by replay protection and node will lose communication.

Once IV is updated daemon should not go back to using the old value.

This patch adds beacon rejection if IV has already been updated.
---
 mesh/net.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mesh/net.c b/mesh/net.c
index 9a56d2ee8..bfb9c4435 100644
--- a/mesh/net.c
+++ b/mesh/net.c
@@ -2696,6 +2696,10 @@ static void update_iv_ivu_state(struct mesh_net *net, uint32_t iv_index,
 	/* If first beacon seen, accept without judgement */
 	if (net->iv_upd_state == IV_UPD_INIT) {
 		if (ivu) {
+			/* Ignore beacons with IVU if IV already updated */
+			if (iv_index == net->iv_index && !net->iv_update)
+				return;
+
 			/* Other devices will be accepting old or new iv_index,
 			 * but we don't know how far through update they are.
 			 * Starting permissive state will allow us maximum
@@ -2717,6 +2721,10 @@ static void update_iv_ivu_state(struct mesh_net *net, uint32_t iv_index,
 			return;
 		}
 
+		/* Ignore beacons with IVU if IV already updated */
+		if (iv_index == net->iv_index)
+			return;
+
 		if (!net->iv_update) {
 			l_info("iv_upd_state = IV_UPD_UPDATING");
 			net->iv_upd_state = IV_UPD_UPDATING;
-- 
2.21.1

