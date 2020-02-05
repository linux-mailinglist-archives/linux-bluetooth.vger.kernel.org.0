Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B183153B76
	for <lists+linux-bluetooth@lfdr.de>; Wed,  5 Feb 2020 23:53:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727598AbgBEWxp (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 5 Feb 2020 17:53:45 -0500
Received: from mga09.intel.com ([134.134.136.24]:6172 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727355AbgBEWxp (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 5 Feb 2020 17:53:45 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Feb 2020 14:53:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,407,1574150400"; 
   d="scan'208";a="264391692"
Received: from ingas-nuc1.sea.intel.com ([10.251.142.16])
  by fmsmga002.fm.intel.com with ESMTP; 05 Feb 2020 14:53:44 -0800
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ] mesh: Allow to finish key refresh when no AppKeys are stored
Date:   Wed,  5 Feb 2020 14:53:43 -0800
Message-Id: <20200205225343.6271-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This handles a case when a Key Refresh procedure is in place with
no application keys stored in the keyring. When KR procedure is
finalized, the check for the presence of AppKeys storage directory
does not return failure if the directory does not exist.

Also, remove duplicate include.
---
 mesh/keyring.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/mesh/keyring.c b/mesh/keyring.c
index 41cb2e980..4a6f9f27d 100644
--- a/mesh/keyring.c
+++ b/mesh/keyring.c
@@ -24,10 +24,10 @@
 #define _GNU_SOURCE
 #include <fcntl.h>
 #include <dirent.h>
+#include <errno.h>
 #include <limits.h>
 #include <stdio.h>
 #include <unistd.h>
-#include <dirent.h>
 
 #include <sys/stat.h>
 
@@ -166,7 +166,10 @@ bool keyring_finalize_app_keys(struct mesh_node *node, uint16_t net_idx)
 	snprintf(key_dir, PATH_MAX, "%s%s", node_path, app_key_dir);
 	dir = opendir(key_dir);
 	if (!dir) {
-		l_error("Failed to App Key storage directory: %s", key_dir);
+		if (errno == ENOENT)
+			return true;
+
+		l_error("Failed to open AppKey storage directory: %s", key_dir);
 		return false;
 	}
 
-- 
2.21.1

