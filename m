Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34640119007
	for <lists+linux-bluetooth@lfdr.de>; Tue, 10 Dec 2019 19:52:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727611AbfLJSwN (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 10 Dec 2019 13:52:13 -0500
Received: from mga11.intel.com ([192.55.52.93]:40134 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727349AbfLJSwN (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 10 Dec 2019 13:52:13 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Dec 2019 10:52:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,300,1571727600"; 
   d="scan'208";a="295981314"
Received: from ingas-nuc1.sea.intel.com ([10.254.187.166])
  by orsmga001.jf.intel.com with ESMTP; 10 Dec 2019 10:52:12 -0800
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ] mesh: Fix check for found hci controllers
Date:   Tue, 10 Dec 2019 10:52:10 -0800
Message-Id: <20191210185210.17403-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This fixes the queue look up when checking for hci controllers.
---
 mesh/mesh-mgmt.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/mesh/mesh-mgmt.c b/mesh/mesh-mgmt.c
index 27272d4d2..a2881dc37 100644
--- a/mesh/mesh-mgmt.c
+++ b/mesh/mesh-mgmt.c
@@ -45,9 +45,18 @@ static struct mgmt *mgmt_mesh;
 static struct l_queue *controllers;
 static struct l_queue *read_info_regs;
 
-static bool simple_match(const void *a, const void *b)
+static bool index_present(uint16_t index)
 {
-	return a == b;
+	const struct l_queue_entry *l = l_queue_get_entries(controllers);
+
+	for (; l; l = l->next) {
+		uint16_t idx = (uint16_t) L_PTR_TO_UINT(l->data);
+
+		if (idx == index)
+			return true;
+	}
+
+	return false;
 }
 
 static void process_read_info_req(void *data, void *user_data)
@@ -101,7 +110,7 @@ static void read_info_cb(uint8_t status, uint16_t length,
 static void index_added(uint16_t index, uint16_t length, const void *param,
 							void *user_data)
 {
-	if (l_queue_find(controllers, simple_match, L_UINT_TO_PTR(index)))
+	if (index_present(index))
 		return;
 
 	l_queue_push_tail(controllers, L_UINT_TO_PTR(index));
-- 
2.21.0

