Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03A294155F7
	for <lists+linux-bluetooth@lfdr.de>; Thu, 23 Sep 2021 05:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239105AbhIWD2x (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 22 Sep 2021 23:28:53 -0400
Received: from mga11.intel.com ([192.55.52.93]:16373 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239063AbhIWD2p (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 22 Sep 2021 23:28:45 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10115"; a="220555928"
X-IronPort-AV: E=Sophos;i="5.85,315,1624345200"; 
   d="scan'208";a="220555928"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2021 20:27:00 -0700
X-IronPort-AV: E=Sophos;i="5.85,315,1624345200"; 
   d="scan'208";a="534072389"
Received: from jdudwadk-mobl.amr.corp.intel.com (HELO istotlan-desk.intel.com) ([10.212.205.211])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2021 20:27:00 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 15/20] tools/mesh-cfgclient: Add group parent address for DB compliance
Date:   Wed, 22 Sep 2021 20:25:58 -0700
Message-Id: <20210923032603.50536-16-inga.stotland@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210923032603.50536-1-inga.stotland@intel.com>
References: <20210923032603.50536-1-inga.stotland@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

---
 tools/mesh/mesh-db.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/mesh/mesh-db.c b/tools/mesh/mesh-db.c
index 42ba831d4..0dc811801 100644
--- a/tools/mesh/mesh-db.c
+++ b/tools/mesh/mesh-db.c
@@ -1590,6 +1590,10 @@ bool mesh_db_add_group(struct mesh_group *grp)
 			goto fail;
 	}
 
+	/* Initialize parent group to unassigned address for now*/
+	if (!write_uint16_hex(jgroup, "parentAddress", UNASSIGNED_ADDRESS))
+		goto fail;
+
 	json_object_array_add(jgroups, jgroup);
 
 	return save_config();
-- 
2.31.1

