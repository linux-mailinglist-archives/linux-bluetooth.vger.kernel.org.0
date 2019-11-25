Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1E4A1093D0
	for <lists+linux-bluetooth@lfdr.de>; Mon, 25 Nov 2019 19:58:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbfKYS6s (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 25 Nov 2019 13:58:48 -0500
Received: from mga03.intel.com ([134.134.136.65]:56117 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725799AbfKYS6s (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 25 Nov 2019 13:58:48 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Nov 2019 10:58:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,242,1571727600"; 
   d="scan'208";a="216989317"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.251.140.97])
  by fmsmga001.fm.intel.com with ESMTP; 25 Nov 2019 10:58:46 -0800
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, inga.stotland@intel.com
Subject: [PATCH BlueZ] mesh: Ignore Composition features during attach
Date:   Mon, 25 Nov 2019 10:58:42 -0800
Message-Id: <20191125185842.26399-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Node Features are currently all under the control of the mesh daemon,
and should be ignored when attaching.  Eventually all Composition
feature bits will be controlled by a master mesh.conf file, overriding
any local node specific settings.
---
 mesh/node.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mesh/node.c b/mesh/node.c
index 59936861a..7b4ee0505 100644
--- a/mesh/node.c
+++ b/mesh/node.c
@@ -1526,6 +1526,10 @@ static bool check_req_node(struct managed_obj_request *req)
 		uint16_t attach_len = node_generate_comp(req->attach,
 					attach_comp, sizeof(attach_comp));
 
+		/* Ignore feature bits in Composition Compare */
+		node_comp[8] = 0;
+		attach_comp[8] = 0;
+
 		if (node_len != attach_len ||
 				memcmp(node_comp, attach_comp, node_len)) {
 			l_debug("Failed to verify app's composition data");
-- 
2.21.0

