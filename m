Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FADF37F2E7
	for <lists+linux-bluetooth@lfdr.de>; Thu, 13 May 2021 08:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbhEMGQe (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 13 May 2021 02:16:34 -0400
Received: from mga11.intel.com ([192.55.52.93]:21249 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230104AbhEMGQe (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 13 May 2021 02:16:34 -0400
IronPort-SDR: +a8Pv34IG8nbkY9eaXnYGhmWlstuwQ62QrDANKjcLzcR0hn8o0JN/0PH8olKEQ7PwicFpAgqCi
 4YxJi1YA8a1w==
X-IronPort-AV: E=McAfee;i="6200,9189,9982"; a="196785179"
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; 
   d="scan'208";a="196785179"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 23:15:25 -0700
IronPort-SDR: POVj+4BIrSFwbn8lE6XoZl0ZuEaxXj6CF53tIo7wQGSDhoiQStfgs6mgRjflWKdajtpTH0sOsc
 YqgDPZ6yqyow==
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; 
   d="scan'208";a="431082206"
Received: from scmahvi-mobl.amr.corp.intel.com (HELO istotlan-desk.intel.com) ([10.254.1.126])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 23:15:24 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ] mesh: Add missing "storage" option to help menu
Date:   Wed, 12 May 2021 23:15:16 -0700
Message-Id: <20210513061516.114889-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This adds a previously missing entry for "storage" option
when printing the daemon usage info.
---
 mesh/main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mesh/main.c b/mesh/main.c
index a13866d7e..dd99c3085 100644
--- a/mesh/main.c
+++ b/mesh/main.c
@@ -56,7 +56,8 @@ static void usage(void)
 	fprintf(stderr,
 		"Options:\n"
 	       "\t--io <io>         Use specified io (default: generic)\n"
-	       "\t--config          Configuration directory\n"
+	       "\t--config          Daemon configuration directory\n"
+	       "\t--storage         Mesh node(s) configuration directory\n"
 	       "\t--nodetach        Run in foreground\n"
 	       "\t--debug           Enable debug output\n"
 	       "\t--dbus-debug      Enable D-Bus debugging\n"
-- 
2.26.3

