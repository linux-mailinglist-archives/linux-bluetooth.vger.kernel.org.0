Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D12A1DF0F1
	for <lists+linux-bluetooth@lfdr.de>; Fri, 22 May 2020 23:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731064AbgEVVNS (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 22 May 2020 17:13:18 -0400
Received: from mga14.intel.com ([192.55.52.115]:48185 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731021AbgEVVNR (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 22 May 2020 17:13:17 -0400
IronPort-SDR: duhiBFFNBM2jr4YqEqn4PsYVAQUUL/YX0nLWK2VUr/mgJAQDQQZrYf8/1cUhR84sCBq1F1JuSJ
 IkFhi1hedGEg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2020 14:13:15 -0700
IronPort-SDR: 8Bl5tcd3R2NnHSVQdW55YaRl/U/TRPM57q5k1G0Mp6mRU16pQ+dYsnoLHMu1FmjyeDw6WkYhUJ
 HbvU+jep6skw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,423,1583222400"; 
   d="scan'208";a="254372384"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.254.68.94])
  by fmsmga007.fm.intel.com with ESMTP; 22 May 2020 14:13:15 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     inga.stotland@intel.com, brian.gix@intel.com
Subject: [PATCH BlueZ v2 2/4] mesh: Fix leaked mesh_net allocation
Date:   Fri, 22 May 2020 14:13:07 -0700
Message-Id: <20200522211309.233824-3-brian.gix@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200522211309.233824-1-brian.gix@intel.com>
References: <20200522211309.233824-1-brian.gix@intel.com>
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

