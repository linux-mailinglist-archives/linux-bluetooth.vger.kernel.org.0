Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A223614925B
	for <lists+linux-bluetooth@lfdr.de>; Sat, 25 Jan 2020 01:44:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387591AbgAYAoB (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 24 Jan 2020 19:44:01 -0500
Received: from mga01.intel.com ([192.55.52.88]:55763 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387551AbgAYAoA (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 24 Jan 2020 19:44:00 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Jan 2020 16:43:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,359,1574150400"; 
   d="scan'208";a="245864381"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.251.17.203])
  by orsmga002.jf.intel.com with ESMTP; 24 Jan 2020 16:43:58 -0800
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, inga.stotland@intel.com
Subject: [PATCH BlueZ v2 3/5] mesh: Remove unneeded Sequence Number increment
Date:   Fri, 24 Jan 2020 16:43:48 -0800
Message-Id: <20200125004350.4640-4-brian.gix@intel.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200125004350.4640-1-brian.gix@intel.com>
References: <20200125004350.4640-1-brian.gix@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

---
 mesh/net.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/mesh/net.c b/mesh/net.c
index 71ff2cea0..ff43176a3 100644
--- a/mesh/net.c
+++ b/mesh/net.c
@@ -3199,7 +3199,6 @@ bool mesh_net_app_send(struct mesh_net *net, bool frnd_cred, uint16_t src,
 			(dst >= net->src_addr && dst <= net->last_addr)) {
 		/* Adjust our seq_num for "virtual" delivery */
 		net->seq_num += seg_max;
-		mesh_net_next_seq_num(net);
 		return true;
 	}
 
-- 
2.21.1

