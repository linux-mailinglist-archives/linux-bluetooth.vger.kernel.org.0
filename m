Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17B1BEB0D
	for <lists+linux-bluetooth@lfdr.de>; Mon, 29 Apr 2019 21:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729208AbfD2TpM (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 29 Apr 2019 15:45:12 -0400
Received: from mga02.intel.com ([134.134.136.20]:27048 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728928AbfD2TpM (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 29 Apr 2019 15:45:12 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Apr 2019 12:45:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,410,1549958400"; 
   d="scan'208";a="144648060"
Received: from ingas-nuc1.sea.intel.com ([10.252.200.123])
  by fmsmga008.fm.intel.com with ESMTP; 29 Apr 2019 12:45:11 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
        Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 1/4] mesh: Remove Node interface if node owner disconnects
Date:   Mon, 29 Apr 2019 12:45:06 -0700
Message-Id: <20190429194509.3378-2-inga.stotland@intel.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190429194509.3378-1-inga.stotland@intel.com>
References: <20190429194509.3378-1-inga.stotland@intel.com>
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This unregisters Node interface associated with a specific node
application when this application disconnects from D-Bus.
---
 mesh/node.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/mesh/node.c b/mesh/node.c
index 157991dad..a6c9332bc 100644
--- a/mesh/node.c
+++ b/mesh/node.c
@@ -233,7 +233,7 @@ static void free_node_resources(void *data)
 
 	if (node->path)
 		l_dbus_object_remove_interface(dbus_get_bus(), node->path,
-					MESH_NODE_INTERFACE);
+							MESH_NODE_INTERFACE);
 	l_free(node->path);
 
 	l_free(node);
@@ -1020,8 +1020,12 @@ static void app_disc_cb(struct l_dbus *bus, void *user_data)
 	l_free(node->owner);
 	node->owner = NULL;
 
-	l_free(node->app_path);
-	node->app_path = NULL;
+	if (node->path) {
+		l_dbus_object_remove_interface(dbus_get_bus(), node->path,
+							MESH_NODE_INTERFACE);
+		l_free(node->app_path);
+		node->app_path = NULL;
+	}
 }
 
 static bool validate_element_properties(struct mesh_node *node,
-- 
2.17.2

