Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE913233F03
	for <lists+linux-bluetooth@lfdr.de>; Fri, 31 Jul 2020 08:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731416AbgGaGTk (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 31 Jul 2020 02:19:40 -0400
Received: from mga06.intel.com ([134.134.136.31]:44828 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731413AbgGaGTk (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 31 Jul 2020 02:19:40 -0400
IronPort-SDR: NO6oIYmiWFNWzGy+63wdatIVKKfknqiWYc+SZWIlrTSS8YDEZsxWbDjJgKNQPdLwwy4EjpT0ze
 N8pcnXHJnfzA==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="213269551"
X-IronPort-AV: E=Sophos;i="5.75,417,1589266800"; 
   d="scan'208";a="213269551"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2020 23:19:40 -0700
IronPort-SDR: O8Fx9XL4QNZkm8urtU8pyVowrxM2yeBU6/k3fxKtmMqE2DULf/BUfppjtAIcfpkdjrVVPnldSS
 /dn98EkVUSGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,417,1589266800"; 
   d="scan'208";a="329163341"
Received: from wlloyd-mobl.amr.corp.intel.com (HELO ingas-nuc1.intel.com) ([10.254.79.39])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Jul 2020 23:19:39 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ v2 03/10] mesh: Clean up handling of config node identity message
Date:   Thu, 30 Jul 2020 23:19:29 -0700
Message-Id: <20200731061936.56952-3-inga.stotland@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200731061936.56952-1-inga.stotland@intel.com>
References: <20200731061936.56952-1-inga.stotland@intel.com>
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
index 8a92c6cd7..2d47429f7 100644
--- a/mesh/cfgmod-server.c
+++ b/mesh/cfgmod-server.c
@@ -773,11 +773,7 @@ static bool cfg_srv_pkt(uint16_t src, uint16_t dst, uint16_t app_idx,
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
@@ -785,18 +781,13 @@ static bool cfg_srv_pkt(uint16_t src, uint16_t dst, uint16_t app_idx,
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

