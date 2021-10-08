Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D09994270F4
	for <lists+linux-bluetooth@lfdr.de>; Fri,  8 Oct 2021 20:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231459AbhJHSuh (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 8 Oct 2021 14:50:37 -0400
Received: from mga06.intel.com ([134.134.136.31]:15201 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231316AbhJHSug (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 8 Oct 2021 14:50:36 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10131"; a="287450127"
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; 
   d="scan'208";a="287450127"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2021 11:48:40 -0700
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; 
   d="scan'208";a="569122739"
Received: from ksanitha-mobl1.amr.corp.intel.com (HELO istotlan-desk.intel.com) ([10.212.147.176])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2021 11:48:40 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ] tools/mesh-cfg-client: Fix NULL pointer dereferencing
Date:   Fri,  8 Oct 2021 11:48:30 -0700
Message-Id: <20211008184830.24276-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch fixes a number of potential NULL pointer dereferencing
cases.
---
 tools/mesh/cfgcli.c  | 2 --
 tools/mesh/mesh-db.c | 3 ++-
 tools/mesh/remote.c  | 6 ++++++
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/tools/mesh/cfgcli.c b/tools/mesh/cfgcli.c
index 2bf1a1503..f815c513c 100644
--- a/tools/mesh/cfgcli.c
+++ b/tools/mesh/cfgcli.c
@@ -668,8 +668,6 @@ static bool msg_recvd(uint16_t src, uint16_t idx, uint8_t *data,
 			break;
 		}
 
-		bt_shell_printf("Period\t\t%d ms\n", pub.period);
-
 		pub.rtx_cnt = data[9] & 0x7;
 		pub.rtx_interval = ((data[9] >> 3) + 1) * 50;
 		bt_shell_printf("Rexmit count\t%d\n", pub.rtx_cnt);
diff --git a/tools/mesh/mesh-db.c b/tools/mesh/mesh-db.c
index 12055c1a9..1a1ba380b 100644
--- a/tools/mesh/mesh-db.c
+++ b/tools/mesh/mesh-db.c
@@ -2508,7 +2508,8 @@ void *mesh_db_prepare_export(void)
 	jarray = json_object_new_array();
 	json_object_object_add(export, "scenes", jarray);
 
-	write_bool(export, "partial", false);
+	if (!write_bool(export, "partial", false))
+		l_warn("Failed to write\"partial\" property");
 
 	return export;
 }
diff --git a/tools/mesh/remote.c b/tools/mesh/remote.c
index 054da5300..6ec220a6f 100644
--- a/tools/mesh/remote.c
+++ b/tools/mesh/remote.c
@@ -281,6 +281,9 @@ bool remote_update_net_key(uint16_t addr, uint16_t net_idx, bool update,
 
 	key = l_queue_find(rmt->net_keys, match_key,
 						L_UINT_TO_PTR(net_idx));
+	if (!key)
+		return false;
+
 	key->updated = update;
 
 	if (save)
@@ -343,6 +346,9 @@ bool remote_update_app_key(uint16_t addr, uint16_t app_idx, bool update,
 
 	key = l_queue_find(rmt->app_keys, match_key,
 						L_UINT_TO_PTR(app_idx));
+	if (!key)
+		return false;
+
 	key->updated = update;
 
 	if (save)
-- 
2.31.1

