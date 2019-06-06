Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0B783691A
	for <lists+linux-bluetooth@lfdr.de>; Thu,  6 Jun 2019 03:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbfFFBSg (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 5 Jun 2019 21:18:36 -0400
Received: from mga11.intel.com ([192.55.52.93]:54825 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726593AbfFFBSg (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 5 Jun 2019 21:18:36 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Jun 2019 18:18:36 -0700
X-ExtLoop1: 1
Received: from ingas-nuc1.sea.intel.com ([10.251.155.118])
  by orsmga003.jf.intel.com with ESMTP; 05 Jun 2019 18:18:35 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 1/2] mesh: Make "elements" mandatory in node configuration
Date:   Wed,  5 Jun 2019 18:18:31 -0700
Message-Id: <20190606011832.18801-2-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606011832.18801-1-inga.stotland@intel.com>
References: <20190606011832.18801-1-inga.stotland@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch modifies the behavior of node configuration parsing:
if "elements" property is not present, th configuration file
for this node is regarded as malformed.

Also, clean up style.
---
 mesh/mesh-db.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/mesh/mesh-db.c b/mesh/mesh-db.c
index 5b2868fdb..e0a000261 100644
--- a/mesh/mesh-db.c
+++ b/mesh/mesh-db.c
@@ -767,8 +767,6 @@ static bool parse_bindings(json_object *jbindings, struct mesh_db_model *mod)
 		return true;
 
 	mod->bindings = l_new(uint16_t, cnt);
-	if (!mod->bindings)
-		return false;
 
 	for (i = 0; i < cnt; ++i) {
 		int idx;
@@ -879,8 +877,6 @@ static bool parse_model_subscriptions(json_object *jsubs,
 		return true;
 
 	subs = l_new(struct mesh_db_sub, cnt);
-	if (!subs)
-		return false;
 
 	for (i = 0; i < cnt; ++i) {
 		char *str;
@@ -996,14 +992,15 @@ static bool parse_elements(json_object *jelements, struct mesh_db_node *node)
 {
 	int i, num_ele;
 
+	if (json_object_get_type(jelements) != json_type_array)
+		return false;
+
 	num_ele = json_object_array_length(jelements);
 	if (!num_ele)
 		/* Allow "empty" nodes */
 		return true;
 
 	node->elements = l_queue_new();
-	if (!node->elements)
-		return false;
 
 	for (i = 0; i < num_ele; ++i) {
 		json_object *jelement;
@@ -1024,8 +1021,6 @@ static bool parse_elements(json_object *jelements, struct mesh_db_node *node)
 		ele = l_new(struct mesh_db_element, 1);
 		ele->index = index;
 		ele->models = l_queue_new();
-		if (!ele->models)
-			goto fail;
 
 		if (!json_object_object_get_ex(jelement, "location", &jvalue))
 			goto fail;
@@ -1209,12 +1204,12 @@ bool mesh_db_read_node(json_object *jnode, mesh_db_node_cb cb, void *user_data)
 	if (json_object_object_get_ex(jnode, "sequenceNumber", &jvalue))
 		node.seq_number = json_object_get_int(jvalue);
 
-	if (json_object_object_get_ex(jnode, "elements", &jvalue)) {
-		if (json_object_get_type(jvalue) == json_type_array) {
-			if (!parse_elements(jvalue, &node))
-				return false;
-		}
-	}
+	/* Check for required "elements" property */
+	if (!json_object_object_get_ex(jnode, "elements", &jvalue))
+		return false;
+
+	if (!parse_elements(jvalue, &node))
+		return false;
 
 	return cb(&node, user_data);
 }
-- 
2.21.0

