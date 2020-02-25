Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A41D16EE43
	for <lists+linux-bluetooth@lfdr.de>; Tue, 25 Feb 2020 19:44:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731584AbgBYSoW (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 25 Feb 2020 13:44:22 -0500
Received: from mga09.intel.com ([134.134.136.24]:29706 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727983AbgBYSoW (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 25 Feb 2020 13:44:22 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Feb 2020 10:44:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,485,1574150400"; 
   d="scan'208";a="231546543"
Received: from ingas-nuc1.sea.intel.com ([10.254.39.252])
  by fmsmga008.fm.intel.com with ESMTP; 25 Feb 2020 10:44:20 -0800
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ v3 2/6] tools/mesh-cfgclient: Clean up subscription list output
Date:   Tue, 25 Feb 2020 10:44:14 -0800
Message-Id: <20200225184418.12660-3-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200225184418.12660-1-inga.stotland@intel.com>
References: <20200225184418.12660-1-inga.stotland@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This tightens up the subscritpiton list status print out:
use the same function for vendor and SIG models.
---
 tools/mesh/cfgcli.c | 40 +++++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/tools/mesh/cfgcli.c b/tools/mesh/cfgcli.c
index cd8fd425b..0c9f69e36 100644
--- a/tools/mesh/cfgcli.c
+++ b/tools/mesh/cfgcli.c
@@ -346,6 +346,25 @@ static void print_pub(uint16_t ele_addr, uint32_t mod_id,
 	bt_shell_printf("\tTTL: %2.2x\n", pub->ttl);
 }
 
+static void print_sub_list(uint16_t addr, bool is_vendor, uint8_t *data,
+								uint16_t len)
+{
+	uint16_t i;
+
+	bt_shell_printf("\nNode %4.4x Subscription List status %s\n",
+						addr, mesh_status_str(data[0]));
+
+	bt_shell_printf("Element Addr\t%4.4x\n", get_le16(data + 1));
+	print_mod_id(data + 3, is_vendor, "");
+
+	i = (is_vendor ? 7 : 5);
+
+	bt_shell_printf("Subscriptions:\n");
+
+	for (; i < len; i += 2)
+		bt_shell_printf("\t\t%4.4x\n ", get_le16(data + i));
+}
+
 static bool msg_recvd(uint16_t src, uint16_t idx, uint8_t *data,
 							uint16_t len)
 {
@@ -611,33 +630,16 @@ static bool msg_recvd(uint16_t src, uint16_t idx, uint8_t *data,
 		if (len < 5)
 			return true;
 
-		bt_shell_printf("\nNode %4.4x Subscription List status %s\n",
-				src, mesh_status_str(data[0]));
-
-		bt_shell_printf("Element Addr\t%4.4x\n", get_le16(data + 1));
-		print_mod_id(data + 3, false, "");
-
-		for (i = 5; i < len; i += 2)
-			bt_shell_printf("Subscr Addr\t%4.4x\n",
-							get_le16(data + i));
+		print_sub_list(src, false, data, len);
 		break;
 
 	case OP_CONFIG_VEND_MODEL_SUB_LIST:
 		if (len < 7)
 			return true;
 
-		bt_shell_printf("\nNode %4.4x Subscription List status %s\n",
-				src, mesh_status_str(data[0]));
-
-		bt_shell_printf("Element Addr\t%4.4x\n", get_le16(data + 1));
-		print_mod_id(data + 3, true, "");
-
-		for (i = 7; i < len; i += 2)
-			bt_shell_printf("Subscr Addr\t%4.4x\n",
-							get_le16(data + i));
+		print_sub_list(src, true, data, len);
 		break;
 
-
 	/* Per Mesh Profile 4.3.2.50 */
 	case OP_MODEL_APP_LIST:
 		if (len < 5)
-- 
2.21.1

