Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 416BE28558
	for <lists+linux-bluetooth@lfdr.de>; Thu, 23 May 2019 19:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731138AbfEWRx3 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 23 May 2019 13:53:29 -0400
Received: from mga02.intel.com ([134.134.136.20]:17242 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730899AbfEWRx3 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 23 May 2019 13:53:29 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 May 2019 10:53:29 -0700
X-ExtLoop1: 1
Received: from bgix-dell-lap.sea.intel.com ([10.255.78.4])
  by orsmga004.jf.intel.com with ESMTP; 23 May 2019 10:53:28 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     inga.stotland@intel.com, brian.gix@intel.com,
        jakub.witowski@silvair.com, michal.lowas-rzechonek@silvair.com
Subject: [PATCH BlueZ] mesh: Fix long MIC usage in segmented messages
Date:   Thu, 23 May 2019 10:53:21 -0700
Message-Id: <20190523175321.13094-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.14.5
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Jakub Witowski <jakub.witowski@silvair.com>

Contrary to the comment, implementation used a 8-byte MIC even if this
generated an additional segment.
---
 mesh/model.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/mesh/model.c b/mesh/model.c
index 034d54496..90bb62db8 100644
--- a/mesh/model.c
+++ b/mesh/model.c
@@ -40,6 +40,9 @@
 #include "mesh/util.h"
 #include "mesh/model.h"
 
+/* Divide and round to ceiling (up) to calculate segment count */
+#define CEILDIV(val, div) (((val) + (div) - 1) / (div))
+
 struct mesh_model {
 	const struct mesh_model_ops *cbs;
 	void *user_data;
@@ -451,7 +454,7 @@ static bool msg_send(struct mesh_node *node, bool credential, uint16_t src,
 
 	/* Use large MIC if it doesn't affect segmentation */
 	if (msg_len > 11 && msg_len <= 376) {
-		if ((out_len / 12) == ((out_len + 4) / 12)) {
+		if (CEILDIV(out_len, 12) == CEILDIV(out_len + 4, 12)) {
 			szmic = true;
 			out_len = msg_len + sizeof(uint64_t);
 		}
-- 
2.14.5

