Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54B7125C90C
	for <lists+linux-bluetooth@lfdr.de>; Thu,  3 Sep 2020 21:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728358AbgICTCO (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 3 Sep 2020 15:02:14 -0400
Received: from mga17.intel.com ([192.55.52.151]:29911 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726678AbgICTCN (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 3 Sep 2020 15:02:13 -0400
IronPort-SDR: QYQ4U4p/L+pDAiAJIW3orUItcMoQ52394xMu187rfDtYRywSer+OBCQai2vOQNOIGOPkLfcK0Q
 MWz+7ohQMCeg==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="137694639"
X-IronPort-AV: E=Sophos;i="5.76,387,1592895600"; 
   d="scan'208";a="137694639"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2020 12:02:12 -0700
IronPort-SDR: J+Bg+f+8Fz4oQgcr4JR6ww78HGr9P7Lt6n8mjdjgrEfR5qt3p05pa5vlQhcLl8iHIoeKc8ENL0
 pF05fQbQ08hA==
X-IronPort-AV: E=Sophos;i="5.76,387,1592895600"; 
   d="scan'208";a="447014137"
Received: from akothalk-mobl.amr.corp.intel.com (HELO ingas-nuc1.intel.com) ([10.254.126.243])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2020 12:02:12 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ] mesh: Remove unused timing variable tx_start
Date:   Thu,  3 Sep 2020 12:02:05 -0700
Message-Id: <20200903190205.9439-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

In model.c, tx_Start is a static variable, dynamically set, but
never used. Is removed now.
---
 mesh/model.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/mesh/model.c b/mesh/model.c
index ed2a75215..5716f5e22 100644
--- a/mesh/model.c
+++ b/mesh/model.c
@@ -80,8 +80,6 @@ struct mod_forward {
 
 static struct l_queue *mesh_virtuals;
 
-static struct timeval tx_start;
-
 static bool is_internal(uint32_t id)
 {
 	if (id == CONFIG_SRV_MODEL || id == CONFIG_CLI_MODEL)
@@ -1018,8 +1016,6 @@ int mesh_model_publish(struct mesh_node *node, uint32_t id, uint16_t src,
 		return MESH_ERROR_DOES_NOT_EXIST;
 	}
 
-	gettimeofday(&tx_start, NULL);
-
 	if (IS_UNASSIGNED(mod->pub->addr))
 		return MESH_ERROR_DOES_NOT_EXIST;
 
@@ -1049,8 +1045,6 @@ bool mesh_model_send(struct mesh_node *node, uint16_t src, uint16_t dst,
 	if (src == 0)
 		src = node_get_primary(node);
 
-	gettimeofday(&tx_start, NULL);
-
 	if (IS_UNASSIGNED(dst))
 		return false;
 
-- 
2.26.2

