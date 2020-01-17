Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49B8A141499
	for <lists+linux-bluetooth@lfdr.de>; Sat, 18 Jan 2020 00:06:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729508AbgAQXGZ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 17 Jan 2020 18:06:25 -0500
Received: from mga06.intel.com ([134.134.136.31]:8996 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729099AbgAQXGZ (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 17 Jan 2020 18:06:25 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Jan 2020 15:06:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,332,1574150400"; 
   d="scan'208";a="243818141"
Received: from ingas-nuc1.sea.intel.com ([10.251.138.89])
  by orsmga002.jf.intel.com with ESMTP; 17 Jan 2020 15:06:15 -0800
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ] mesh: Fix opcode for OP_VEND_MODEL_APP_GET
Date:   Fri, 17 Jan 2020 15:06:13 -0800
Message-Id: <20200117230613.2495-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This changes the value of OP_VEND_MODEL_APP_GET to 0x804D (it was
incorrectly set to 0x804C)
---
 mesh/cfgmod.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mesh/cfgmod.h b/mesh/cfgmod.h
index da8b5b32b..383fdbf6b 100644
--- a/mesh/cfgmod.h
+++ b/mesh/cfgmod.h
@@ -91,7 +91,7 @@
 #define OP_NODE_RESET_STATUS			0x804A
 #define OP_MODEL_APP_GET			0x804B
 #define OP_MODEL_APP_LIST			0x804C
-#define OP_VEND_MODEL_APP_GET			0x804C
+#define OP_VEND_MODEL_APP_GET			0x804D
 #define OP_VEND_MODEL_APP_LIST			0x804E
 
 void cfgmod_server_init(struct mesh_node *node, uint8_t ele_idx);
-- 
2.21.1

