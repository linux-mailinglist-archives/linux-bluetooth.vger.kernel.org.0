Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 645911DF0D9
	for <lists+linux-bluetooth@lfdr.de>; Fri, 22 May 2020 22:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731062AbgEVU57 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 22 May 2020 16:57:59 -0400
Received: from mga02.intel.com ([134.134.136.20]:25387 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731015AbgEVU57 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 22 May 2020 16:57:59 -0400
IronPort-SDR: BTq8dzRDZg9PEJedpcGDAOPlKhlNNf62vL4nD87j/6hrB6cx3GUOcGo6GO4bhm+rFun2ZWec8a
 CnxsXSOeVW1Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2020 13:57:58 -0700
IronPort-SDR: uVAu2vziPvfS1adOqfjhlM9XM1QcuDKGLBNVgkYMZ1v/7/r7uFmw7iWMJCtLh/u9oFXmtzAWkC
 FUeQIoPZca0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,423,1583222400"; 
   d="scan'208";a="254369946"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.254.68.94])
  by fmsmga007.fm.intel.com with ESMTP; 22 May 2020 13:57:58 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     inga.stotland@intel.com, brian.gix@intel.com
Subject: [PATCH BlueZ 2/3] mesh: Fix leaked mesh_net allocation
Date:   Fri, 22 May 2020 13:57:55 -0700
Message-Id: <20200522205756.230907-3-brian.gix@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200522205756.230907-1-brian.gix@intel.com>
References: <20200522205756.230907-1-brian.gix@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

---
 mesh/node.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/mesh/node.c b/mesh/node.c
index 49ba7c885..db888d27c 100644
--- a/mesh/node.c
+++ b/mesh/node.c
@@ -1313,8 +1313,6 @@ static bool add_local_node(struct mesh_node *node, uint16_t unicast, bool kr,
 				bool ivu, uint32_t iv_idx, uint8_t dev_key[16],
 				uint16_t net_key_idx, uint8_t net_key[16])
 {
-	node->net = mesh_net_new(node);
-
 	if (!nodes)
 		nodes = l_queue_new();
 
-- 
2.25.4

