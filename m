Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E09F64064
	for <lists+linux-bluetooth@lfdr.de>; Wed, 10 Jul 2019 07:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbfGJFKC (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 10 Jul 2019 01:10:02 -0400
Received: from mga18.intel.com ([134.134.136.126]:28140 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726020AbfGJFKC (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 10 Jul 2019 01:10:02 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Jul 2019 22:10:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,473,1557212400"; 
   d="scan'208";a="189050272"
Received: from ingas-nuc1.sea.intel.com ([10.254.182.100])
  by fmsmga004.fm.intel.com with ESMTP; 09 Jul 2019 22:10:01 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, michal.lowas-rzechonek@silvair.com,
        jakub.witowski@silvair.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 1/9] mesh: Move network config setup from storage.c to node.c
Date:   Tue,  9 Jul 2019 22:09:51 -0700
Message-Id: <20190710050959.7321-2-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190710050959.7321-1-inga.stotland@intel.com>
References: <20190710050959.7321-1-inga.stotland@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This commit moves initialization of configuration parameters
for node->net when the local node state is restored from stored
configuration. Old location: storage.c, new locaiton node.c.
---
 mesh/node.c    | 28 ++++++++++++++++++++++++++++
 mesh/storage.c | 39 ---------------------------------------
 2 files changed, 28 insertions(+), 39 deletions(-)

diff --git a/mesh/node.c b/mesh/node.c
index 1f781cfe9..a2d95dacf 100644
--- a/mesh/node.c
+++ b/mesh/node.c
@@ -375,6 +375,7 @@ bool node_init_from_storage(struct mesh_node *node, void *data)
 {
 	struct mesh_db_node *db_node = data;
 	unsigned int num_ele;
+	uint8_t mode;
 
 	node->comp = l_new(struct node_composition, 1);
 	node->comp->cid = db_node->cid;
@@ -407,6 +408,33 @@ bool node_init_from_storage(struct mesh_node *node, void *data)
 
 	node->primary = db_node->unicast;
 
+	mesh_net_set_seq_num(node->net, node->seq_number);
+	mesh_net_set_default_ttl(node->net, node->ttl);
+
+	mode = node->proxy;
+	if (mode == MESH_MODE_ENABLED || mode == MESH_MODE_DISABLED)
+		mesh_net_set_proxy_mode(node->net, mode == MESH_MODE_ENABLED);
+
+	mode = node->lpn;
+	if (mode == MESH_MODE_ENABLED || mode == MESH_MODE_DISABLED)
+		mesh_net_set_friend_mode(node->net, mode == MESH_MODE_ENABLED);
+
+	mode = node->relay.mode;
+	if (mode == MESH_MODE_ENABLED || mode == MESH_MODE_DISABLED)
+		mesh_net_set_relay_mode(node->net, mode == MESH_MODE_ENABLED,
+					node->relay.cnt, node->relay.interval);
+
+	mode = node->beacon;
+	if (mode == MESH_MODE_ENABLED || mode == MESH_MODE_DISABLED)
+		mesh_net_set_beacon_mode(node->net, mode == MESH_MODE_ENABLED);
+
+	if (!IS_UNASSIGNED(node->primary) &&
+		!mesh_net_register_unicast(node->net, node->primary, num_ele))
+		return false;
+
+	if (node->uuid)
+		mesh_net_id_uuid_set(node->net, node->uuid);
+
 	/* Initialize configuration server model */
 	mesh_config_srv_init(node, PRIMARY_ELE_IDX);
 
diff --git a/mesh/storage.c b/mesh/storage.c
index 0f2b77fde..2b7804242 100644
--- a/mesh/storage.c
+++ b/mesh/storage.c
@@ -56,51 +56,12 @@ static const char *storage_dir;
 static bool read_node_cb(struct mesh_db_node *db_node, void *user_data)
 {
 	struct mesh_node *node = user_data;
-	struct mesh_net *net;
-	uint32_t seq_number;
-	uint8_t ttl, mode, cnt, num_ele;
-	uint16_t unicast, interval;
-	uint8_t *uuid;
 
 	if (!node_init_from_storage(node, db_node)) {
 		node_remove(node);
 		return false;
 	}
 
-	net = node_get_net(node);
-	seq_number = node_get_sequence_number(node);
-	mesh_net_set_seq_num(net, seq_number);
-	ttl = node_default_ttl_get(node);
-	mesh_net_set_default_ttl(net, ttl);
-
-	mode = node_proxy_mode_get(node);
-	if (mode == MESH_MODE_ENABLED || mode == MESH_MODE_DISABLED)
-		mesh_net_set_proxy_mode(net, mode == MESH_MODE_ENABLED);
-
-	mode = node_friend_mode_get(node);
-	if (mode == MESH_MODE_ENABLED || mode == MESH_MODE_DISABLED)
-		mesh_net_set_friend_mode(net, mode == MESH_MODE_ENABLED);
-
-	mode = node_relay_mode_get(node, &cnt, &interval);
-	if (mode == MESH_MODE_ENABLED || mode == MESH_MODE_DISABLED)
-		mesh_net_set_relay_mode(net, mode == MESH_MODE_ENABLED, cnt,
-								interval);
-
-	mode = node_beacon_mode_get(node);
-	if (mode == MESH_MODE_ENABLED || mode == MESH_MODE_DISABLED)
-		mesh_net_set_beacon_mode(net, mode == MESH_MODE_ENABLED);
-
-	unicast = db_node->unicast;
-	num_ele = node_get_num_elements(node);
-
-	if (!IS_UNASSIGNED(unicast) &&
-		!mesh_net_register_unicast(net, unicast, num_ele))
-		return false;
-
-	uuid = node_uuid_get(node);
-	if (uuid)
-		mesh_net_id_uuid_set(net, uuid);
-
 	return true;
 }
 
-- 
2.21.0

