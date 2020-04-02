Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7DCF19B95A
	for <lists+linux-bluetooth@lfdr.de>; Thu,  2 Apr 2020 02:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733181AbgDBAEi (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 1 Apr 2020 20:04:38 -0400
Received: from mga12.intel.com ([192.55.52.136]:41450 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732872AbgDBAEi (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 1 Apr 2020 20:04:38 -0400
IronPort-SDR: hf/3sdn4uCAhl+7xpPXJDe+3SegtYU4wdOSqzoi+TRqUvMpwphuuxrwNHvK+OxvuSgDdyZETql
 TwXIEqyk5Ihg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2020 17:04:38 -0700
IronPort-SDR: HmgQEBUBCsQxgmXrsypSyKDjEnglyAn38iUgqNmhfxtdqiJrOGjOnmtsBKLCYBMwLLJdnJqFcp
 r16lPgHi3Yvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,333,1580803200"; 
   d="scan'208";a="396168645"
Received: from ingas-nuc1.sea.intel.com ([10.252.140.81])
  by orsmga004.jf.intel.com with ESMTP; 01 Apr 2020 17:04:37 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 1/2] mesh: Move SEQ_MASK define in mesh-defs.h
Date:   Wed,  1 Apr 2020 17:04:35 -0700
Message-Id: <20200402000436.23209-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

---
 mesh/mesh-config-json.c | 1 -
 mesh/mesh-defs.h        | 1 +
 mesh/net.h              | 1 -
 3 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/mesh/mesh-config-json.c b/mesh/mesh-config-json.c
index ad2d4d0f8..172e0e355 100644
--- a/mesh/mesh-config-json.c
+++ b/mesh/mesh-config-json.c
@@ -40,7 +40,6 @@
 #include "mesh/mesh-defs.h"
 #include "mesh/util.h"
 #include "mesh/mesh-config.h"
-#include "mesh/net.h"
 
 /* To prevent local node JSON cache thrashing, minimum update times */
 #define MIN_SEQ_CACHE_TRIGGER	32
diff --git a/mesh/mesh-defs.h b/mesh/mesh-defs.h
index 9353d7351..bbde53303 100644
--- a/mesh/mesh-defs.h
+++ b/mesh/mesh-defs.h
@@ -110,6 +110,7 @@
 #define APP_IDX_DEV_LOCAL	0x7fff
 
 #define DEFAULT_SEQUENCE_NUMBER 0x000000
+#define SEQ_MASK		0xffffff
 
 #define IS_UNASSIGNED(x)	((x) == UNASSIGNED_ADDRESS)
 #define IS_UNICAST(x)		(((x) > UNASSIGNED_ADDRESS) && \
diff --git a/mesh/net.h b/mesh/net.h
index 60396dbe7..bfc8064f3 100644
--- a/mesh/net.h
+++ b/mesh/net.h
@@ -31,7 +31,6 @@ struct mesh_node;
 #define APP_AID_DEV	0x00
 
 #define CTL		0x80
-#define SEQ_MASK	0xffffff
 
 #define CREDFLAG_MASK	0x1000
 
-- 
2.21.1

