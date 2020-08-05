Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF4F323CDC8
	for <lists+linux-bluetooth@lfdr.de>; Wed,  5 Aug 2020 19:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729045AbgHERwP (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 5 Aug 2020 13:52:15 -0400
Received: from mga05.intel.com ([192.55.52.43]:42221 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728997AbgHERuy (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 5 Aug 2020 13:50:54 -0400
IronPort-SDR: eaZqSI89yVxW4+eQH4DzyI96qMTXiwOCS2kHuTod+K6rMeoeAs4DP12gaaUeJe4I7Mi9x7NZAO
 lJg+611kmwsw==
X-IronPort-AV: E=McAfee;i="6000,8403,9704"; a="237470632"
X-IronPort-AV: E=Sophos;i="5.75,438,1589266800"; 
   d="scan'208";a="237470632"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2020 10:44:58 -0700
IronPort-SDR: iofcmEzlugcWij2qhLQZ2xXtS3SKLEicyEkRbLotLLe/9abwuftYJ81YBRMy1rFCu7TMl2ANkE
 ZTqaH0Q0J7TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,438,1589266800"; 
   d="scan'208";a="437245728"
Received: from unknown (HELO ingas-nuc1.intel.com) ([10.254.118.189])
  by orsmga004.jf.intel.com with ESMTP; 05 Aug 2020 10:44:58 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ v4 03/10] mesh: Clean up handling of config node identity message
Date:   Wed,  5 Aug 2020 10:44:49 -0700
Message-Id: <20200805174456.49342-4-inga.stotland@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200805174456.49342-1-inga.stotland@intel.com>
References: <20200805174456.49342-1-inga.stotland@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This modification allows using a single point for sending out
the composed status messages by the Config Server.
---
 mesh/cfgmod-server.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/mesh/cfgmod-server.c b/mesh/cfgmod-server.c
index 35d0325a9..c501b0a52 100644
--- a/mesh/cfgmod-server.c
+++ b/mesh/cfgmod-server.c
@@ -777,11 +777,7 @@ static bool cfg_srv_pkt(uint16_t src, uint16_t dst, uint16_t app_idx,
 		break;
 
 	case OP_NODE_IDENTITY_SET:
-		if (size != 3 || pkt[2] > 0x01)
-			return true;
-
-		n_idx = l_get_le16(pkt);
-		if (n_idx > 0xfff)
+		if (size != 3)
 			return true;
 
 		/* Currently setting node identity not supported */
@@ -789,18 +785,13 @@ static bool cfg_srv_pkt(uint16_t src, uint16_t dst, uint16_t app_idx,
 		/* Fall Through */
 
 	case OP_NODE_IDENTITY_GET:
-		if (size < 2)
+		if (opcode == OP_NODE_IDENTITY_GET && size != 2)
 			return true;
 
 		n_idx = l_get_le16(pkt);
-		if (n_idx > 0xfff)
-			return true;
 
 		n = mesh_model_opcode_set(OP_NODE_IDENTITY_STATUS, msg);
-
-		status = mesh_net_get_identity_mode(net, n_idx, &state);
-
-		msg[n++] = status;
+		msg[n++] = mesh_net_get_identity_mode(net, n_idx, &state);
 
 		l_put_le16(n_idx, msg + n);
 		n += 2;
-- 
2.26.2

