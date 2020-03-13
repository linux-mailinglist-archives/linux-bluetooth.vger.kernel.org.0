Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AECF184E60
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Mar 2020 19:08:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727150AbgCMSIl (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 13 Mar 2020 14:08:41 -0400
Received: from mga06.intel.com ([134.134.136.31]:26967 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726480AbgCMSIl (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 13 Mar 2020 14:08:41 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Mar 2020 11:08:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,549,1574150400"; 
   d="scan'208";a="266811431"
Received: from ingas-nuc1.sea.intel.com ([10.251.23.252])
  by fmsmga004.fm.intel.com with ESMTP; 13 Mar 2020 11:08:40 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 2/2] mesh: Fix processing of Config Node Reset message
Date:   Fri, 13 Mar 2020 11:08:36 -0700
Message-Id: <20200313180836.23227-3-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200313180836.23227-1-inga.stotland@intel.com>
References: <20200313180836.23227-1-inga.stotland@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This fixes a condition when a node continues processing messages
after it has been reset by a remote configuration client.
Upon receiving Config Node Reset message, a node deregisters it's
message receive callbacks and a complete node removal happens after
a grace interval to allow sending of Config Node Reset Status reply.
---
 mesh/cfgmod-server.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/mesh/cfgmod-server.c b/mesh/cfgmod-server.c
index a1f682765..6499c3f2f 100644
--- a/mesh/cfgmod-server.c
+++ b/mesh/cfgmod-server.c
@@ -1223,20 +1223,20 @@ static bool cfg_srv_pkt(uint16_t src, uint16_t dst, uint16_t app_idx,
 
 	case OP_NODE_RESET:
 		n = mesh_model_opcode_set(OP_NODE_RESET_STATUS, msg);
-		/*
-		 * Delay node removal to give it a chance to send back the
-		 * status
-		 */
+
+		/* After reset, node is not processing any incoming messages */
+		mesh_net_detach(net);
+
+		/* Delay node removal to give it a chance to send the status */
 		l_timeout_create(1, node_reset, node, NULL);
 		break;
 	}
 
-	if (n) {
-		/* print_packet("App Tx", long_msg ? long_msg : msg, n); */
+	if (n)
 		mesh_model_send(node, dst, src,
 				APP_IDX_DEV_LOCAL, net_idx, DEFAULT_TTL,
 				long_msg ? long_msg : msg, n);
-	}
+
 	l_free(long_msg);
 
 	return true;
-- 
2.21.1

