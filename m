Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2893DA41F
	for <lists+linux-bluetooth@lfdr.de>; Thu, 17 Oct 2019 05:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393890AbfJQDGK (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 16 Oct 2019 23:06:10 -0400
Received: from mga09.intel.com ([134.134.136.24]:37056 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392976AbfJQDGK (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 16 Oct 2019 23:06:10 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Oct 2019 20:06:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,306,1566889200"; 
   d="scan'208";a="200256249"
Received: from ingas-nuc1.sea.intel.com ([10.255.229.89])
  by orsmga006.jf.intel.com with ESMTP; 16 Oct 2019 20:06:08 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ] mesh: Fix unpacking NetKey/AppKey 3-octet index combo
Date:   Wed, 16 Oct 2019 20:06:07 -0700
Message-Id: <20191017030607.11112-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This fixes how we unpack 3-octet combination of NetKey and AppKey
indices received in the payload of AppKeyAdd/Update/Delete messages.

For example, if the config client sends a message to add AppKey with
index 0x456 bound to NetKey with index 0x123, the received packed
3-octet will be: 0x56 0x34 0x12
The fix takes into account the correct byte ordering when unpacking
indices.
---
 mesh/cfgmod-server.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/mesh/cfgmod-server.c b/mesh/cfgmod-server.c
index 55cc8e9eb..79538037c 100644
--- a/mesh/cfgmod-server.c
+++ b/mesh/cfgmod-server.c
@@ -1022,8 +1022,8 @@ static bool cfg_srv_pkt(uint16_t src, uint32_t dst, uint16_t unicast,
 		if (size != 19)
 			return true;
 
-		n_idx = l_get_le16(pkt) & 0xfff;
-		a_idx = l_get_le16(pkt + 1) >> 4;
+		n_idx = l_get_le16(pkt + 1) >> 4;
+		a_idx = l_get_le16(pkt) & 0xfff;
 
 		if (opcode == OP_APPKEY_ADD)
 			b_res = appkey_key_add(net, n_idx, a_idx, pkt + 3);
@@ -1048,9 +1048,10 @@ static bool cfg_srv_pkt(uint16_t src, uint32_t dst, uint16_t unicast,
 		if (size != 3)
 			return true;
 
-		n_idx = l_get_le16(pkt) & 0xfff;
-		a_idx = l_get_le16(pkt + 1) >> 4;
+		n_idx = l_get_le16(pkt + 1) >> 4;
+		a_idx = l_get_le16(pkt) & 0xfff;
 		b_res = appkey_key_delete(net, n_idx, a_idx);
+
 		l_debug("Delete AppKey %s Net_Idx %3.3x to App_Idx %3.3x",
 			(b_res == MESH_STATUS_SUCCESS) ? "success" : "fail",
 							n_idx, a_idx);
-- 
2.21.0

