Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D89B1BE87C
	for <lists+linux-bluetooth@lfdr.de>; Wed, 29 Apr 2020 22:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727094AbgD2UU4 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 29 Apr 2020 16:20:56 -0400
Received: from mga06.intel.com ([134.134.136.31]:42197 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727089AbgD2UU4 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 29 Apr 2020 16:20:56 -0400
IronPort-SDR: hKmpTgCmTbxvDgcQxcqmc2FuC7p2OI+xfXXdY0VFpRaYpzmi1e0U9bpsT5BoeOWy7yvpwPSTS5
 E1+mw8F4lQhA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 13:20:55 -0700
IronPort-SDR: 7KYFMUyPvMfVBKyF3mukB7zDYXi/RgfZIuE9vo7Z7yqJ6wVtsXh39rnlyvwru9xt9vlkfk26f0
 0PANEl8H5KuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,333,1583222400"; 
   d="scan'208";a="282617928"
Received: from ingas-nuc1.sea.intel.com ([10.255.228.82])
  by fmsmga004.fm.intel.com with ESMTP; 29 Apr 2020 13:20:55 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ] mesh: Fix publication setup for vendor models
Date:   Wed, 29 Apr 2020 13:20:54 -0700
Message-Id: <20200429202054.2397-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This fixes model ID generation when processing Config Pub Set
message. Also, cleanup some debug prints.
---
 mesh/cfgmod-server.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mesh/cfgmod-server.c b/mesh/cfgmod-server.c
index 856eb6b27..1564175c7 100644
--- a/mesh/cfgmod-server.c
+++ b/mesh/cfgmod-server.c
@@ -124,7 +124,7 @@ static void config_pub_set(struct mesh_node *node, uint16_t net_idx,
 	if (!vendor)
 		mod_id |= VENDOR_ID_MASK;
 	else
-		mod_id |= l_get_le16(pkt + 11 + virt_offset);
+		mod_id = (mod_id << 16) | l_get_le16(pkt + 11 + virt_offset);
 
 	ele_addr = l_get_le16(pkt);
 	pub_addr = pkt + 2;
@@ -232,7 +232,7 @@ static bool config_sub_get(struct mesh_node *node, uint16_t net_idx,
 
 	switch (size) {
 	default:
-		l_debug("Bad Len Cfg_Pub_Set: %d", size);
+		l_debug("Bad length %d", size);
 		return false;
 
 	case 4:
@@ -322,7 +322,7 @@ static void config_sub_set(struct mesh_node *node, uint16_t net_idx,
 
 	switch (size) {
 	default:
-		l_error("Bad Len Cfg_Sub_Set: %d", size);
+		l_error("Bad length: %d", size);
 		return;
 	case 4:
 		if (opcode != OP_CONFIG_MODEL_SUB_DELETE_ALL)
@@ -567,7 +567,6 @@ static void hb_pub_timeout_func(struct l_timeout *timeout, void *user_data)
 		l_timeout_remove(hb->pub_timer);
 		hb->pub_timer = NULL;
 	}
-	l_debug("%d left", hb->pub_count);
 }
 
 static void update_hb_pub_timer(struct mesh_net *net,
@@ -651,6 +650,7 @@ static int hb_subscription_set(struct mesh_net *net, uint16_t src,
 		hb->sub_min_hops = 0;
 		hb->sub_max_hops = 0;
 		return MESH_STATUS_SUCCESS;
+
 	} else if (!period_log && src == hb->sub_src && dst == hb->sub_dst) {
 		/* Preserve collected data, but disable */
 		l_timeout_remove(hb->sub_timer);
-- 
2.21.1

