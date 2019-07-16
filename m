Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7B706AD88
	for <lists+linux-bluetooth@lfdr.de>; Tue, 16 Jul 2019 19:17:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728619AbfGPRRU (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 16 Jul 2019 13:17:20 -0400
Received: from mga05.intel.com ([192.55.52.43]:11873 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728004AbfGPRRU (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 16 Jul 2019 13:17:20 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Jul 2019 10:17:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,271,1559545200"; 
   d="scan'208";a="169989305"
Received: from bgix-dell-lap.sea.intel.com ([10.251.137.82])
  by orsmga003.jf.intel.com with ESMTP; 16 Jul 2019 10:17:18 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     inga.stotland@intel.com, brian.gix@intel.com
Subject: [PATCH BlueZ] mesh: Cleanup Management1 method ordering
Date:   Tue, 16 Jul 2019 10:17:13 -0700
Message-Id: <20190716171713.23792-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.14.5
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

General clean-up without functional change so that Methods in
Management1 registration are in the same order they are listed
in mesh-api.txt
---
 mesh/manager.c | 38 +++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/mesh/manager.c b/mesh/manager.c
index 77d7b7516..b28a3f373 100644
--- a/mesh/manager.c
+++ b/mesh/manager.c
@@ -703,39 +703,43 @@ static struct l_dbus_message *set_key_phase_call(struct l_dbus *dbus,
 
 static void setup_management_interface(struct l_dbus_interface *iface)
 {
-	l_dbus_interface_method(iface, "AddNode", 0, add_node_call, "", "ay",
-								"uuid");
-	l_dbus_interface_method(iface, "ImportRemoteNode", 0, import_node_call,
-						"", "qyay", "", "primary",
-						"count", "dev_key");
-	l_dbus_interface_method(iface, "DeleteRemoteNode", 0, delete_node_call,
-					"", "qy", "", "primary", "count");
 	l_dbus_interface_method(iface, "UnprovisionedScan", 0, start_scan_call,
 							"", "q", "", "seconds");
 	l_dbus_interface_method(iface, "UnprovisionedScanCancel", 0,
 						cancel_scan_call, "", "");
+	l_dbus_interface_method(iface, "AddNode", 0, add_node_call, "", "ay",
+								"uuid");
 	l_dbus_interface_method(iface, "CreateSubnet", 0, create_subnet_call,
 						"", "q", "", "net_index");
+	l_dbus_interface_method(iface, "ImportSubnet", 0, import_subnet_call,
+						"", "qay", "", "net_index",
+						"net_key");
 	l_dbus_interface_method(iface, "UpdateSubnet", 0, update_subnet_call,
 						"", "q", "", "net_index");
 	l_dbus_interface_method(iface, "DeleteSubnet", 0, delete_subnet_call,
 						"", "q", "", "net_index");
-	l_dbus_interface_method(iface, "ImportSubnet", 0, import_subnet_call,
-					"", "qay", "", "net_index", "net_key");
+	l_dbus_interface_method(iface, "SetKeyPhase", 0, set_key_phase_call,
+						"", "qy", "", "net_index",
+						"phase");
 	l_dbus_interface_method(iface, "CreateAppKey", 0, create_appkey_call,
-					"", "qq", "", "net_index", "app_index");
+						"", "qq", "", "net_index",
+						"app_index");
+	l_dbus_interface_method(iface, "ImportAppKey", 0, import_appkey_call,
+						"", "qqay", "", "net_index",
+						"app_index", "app_key");
 	l_dbus_interface_method(iface, "UpdateAppKey", 0, update_appkey_call,
 						"", "q", "", "app_index");
 	l_dbus_interface_method(iface, "CompleteAppKeyUpdate", 0,
-					complete_update_appkey_call, "", "q",
-							"", "app_index");
+						complete_update_appkey_call,
+						"", "q", "", "app_index");
 	l_dbus_interface_method(iface, "DeleteAppKey", 0, delete_appkey_call,
 						"", "q", "", "app_index");
-	l_dbus_interface_method(iface, "ImportAppKey", 0, import_appkey_call,
-				"", "qqay", "", "net_index", "app_index",
-								"app_key");
-	l_dbus_interface_method(iface, "SetKeyPhase", 0, set_key_phase_call,
-					"", "qy", "", "net_index", "phase");
+	l_dbus_interface_method(iface, "ImportRemoteNode", 0, import_node_call,
+						"", "qyay", "", "primary",
+						"count", "dev_key");
+	l_dbus_interface_method(iface, "DeleteRemoteNode", 0, delete_node_call,
+						"", "qy", "", "primary",
+						"count");
 }
 
 bool manager_dbus_init(struct l_dbus *bus)
-- 
2.14.5

