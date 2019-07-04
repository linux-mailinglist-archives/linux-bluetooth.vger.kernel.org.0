Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF4E95F353
	for <lists+linux-bluetooth@lfdr.de>; Thu,  4 Jul 2019 09:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbfGDHPS (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 4 Jul 2019 03:15:18 -0400
Received: from mga11.intel.com ([192.55.52.93]:8107 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726087AbfGDHPS (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 4 Jul 2019 03:15:18 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Jul 2019 00:15:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,449,1557212400"; 
   d="scan'208";a="339531364"
Received: from ingas-nuc1.sea.intel.com ([10.254.86.21])
  by orsmga005.jf.intel.com with ESMTP; 04 Jul 2019 00:15:17 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ] mesh: Remove redundant initialization
Date:   Thu,  4 Jul 2019 00:15:16 -0700
Message-Id: <20190704071516.17736-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This fixes a case where a variable was initialized twice.
---
 mesh/cfgmod-server.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mesh/cfgmod-server.c b/mesh/cfgmod-server.c
index 634ac006b..bb78cead6 100644
--- a/mesh/cfgmod-server.c
+++ b/mesh/cfgmod-server.c
@@ -742,7 +742,7 @@ static bool cfg_srv_pkt(uint16_t src, uint32_t dst,
 				uint8_t ttl, const void *user_data)
 {
 	struct mesh_node *node = (struct mesh_node *) user_data;
-	struct mesh_net *net = node_get_net(node);
+	struct mesh_net *net;
 	const uint8_t *pkt = data;
 	struct timeval time_now;
 	uint32_t opcode, tmp32;
-- 
2.21.0

