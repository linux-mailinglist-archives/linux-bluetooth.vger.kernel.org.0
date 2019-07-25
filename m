Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B86B0756D9
	for <lists+linux-bluetooth@lfdr.de>; Thu, 25 Jul 2019 20:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725923AbfGYS0P (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 25 Jul 2019 14:26:15 -0400
Received: from mga18.intel.com ([134.134.136.126]:32794 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725909AbfGYS0P (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 25 Jul 2019 14:26:15 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Jul 2019 11:26:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,307,1559545200"; 
   d="scan'208";a="172729302"
Received: from ingas-nuc1.sea.intel.com ([10.254.183.90])
  by orsmga003.jf.intel.com with ESMTP; 25 Jul 2019 11:26:14 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ] mesh: Fix storage init of Friend and LPN features
Date:   Thu, 25 Jul 2019 11:26:12 -0700
Message-Id: <20190725182612.23401-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This fixes a typo in mesh-config-json.c when Friend feature
was initialized twice and LPN was not initialized at all.
---
 mesh/mesh-config-json.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mesh/mesh-config-json.c b/mesh/mesh-config-json.c
index 75015e607..e3baf5dc6 100644
--- a/mesh/mesh-config-json.c
+++ b/mesh/mesh-config-json.c
@@ -1191,7 +1191,7 @@ static void parse_features(json_object *jconfig, struct mesh_config_node *node)
 	if (json_object_object_get_ex(jconfig, "lowPower", &jvalue)) {
 		mode = get_mode(jvalue);
 		if (mode <= MESH_MODE_UNSUPPORTED)
-			node->modes.friend = mode;
+			node->modes.lpn = mode;
 	}
 
 	if (json_object_object_get_ex(jconfig, "beacon", &jvalue)) {
-- 
2.21.0

