Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0751C6C838
	for <lists+linux-bluetooth@lfdr.de>; Thu, 18 Jul 2019 06:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbfGREB3 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 18 Jul 2019 00:01:29 -0400
Received: from mga07.intel.com ([134.134.136.100]:51749 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725902AbfGREB2 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 18 Jul 2019 00:01:28 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Jul 2019 21:01:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,276,1559545200"; 
   d="scan'208";a="191477413"
Received: from ingas-nuc1.sea.intel.com ([10.251.148.241])
  by fmsmga004.fm.intel.com with ESMTP; 17 Jul 2019 21:01:27 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ] mesh: Init keyring storage directory on node Attach()
Date:   Wed, 17 Jul 2019 21:01:26 -0700
Message-Id: <20190718040126.5152-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This adds initialization of keyring storage directory when
a mesh node is attached successfully.
---
 mesh/node.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mesh/node.c b/mesh/node.c
index 652551756..6b784bf8d 100644
--- a/mesh/node.c
+++ b/mesh/node.c
@@ -1656,6 +1656,14 @@ static void get_managed_objects_cb(struct l_dbus_message *msg, void *user_data)
 		} else
 			goto fail;
 
+		/*
+		 * TODO: For now always initialize directory for storing
+		 * keyring info. Need to figure out what checks need
+		 * to be performed to do this conditionally, i.e., presence of
+		 * Provisioner interface, etc.
+		 */
+		init_storage_dir(node);
+
 	} else if (req->type == REQUEST_TYPE_JOIN) {
 		node_join_ready_func_t cb = req->cb;
 
-- 
2.21.0

