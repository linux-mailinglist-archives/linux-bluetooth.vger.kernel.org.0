Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3651364F5
	for <lists+linux-bluetooth@lfdr.de>; Fri, 10 Jan 2020 02:41:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730643AbgAJBls (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 9 Jan 2020 20:41:48 -0500
Received: from mga01.intel.com ([192.55.52.88]:58409 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730629AbgAJBls (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 9 Jan 2020 20:41:48 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Jan 2020 17:41:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,414,1571727600"; 
   d="scan'208";a="236689170"
Received: from ingas-nuc1.sea.intel.com ([10.254.104.252])
  by orsmga002.jf.intel.com with ESMTP; 09 Jan 2020 17:41:47 -0800
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 2/2] mesh: Fix wholesale deletion of appkeys bound to a netkey
Date:   Thu,  9 Jan 2020 17:41:45 -0800
Message-Id: <20200110014145.1785-3-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200110014145.1785-1-inga.stotland@intel.com>
References: <20200110014145.1785-1-inga.stotland@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

When a netkey is deleted all the appkeys bound to this key has
to be deleted as well. This fixes app_key queue manipulation to
avoid issues caused by modifying the queue while iterating over it:
instead of iteration over all the entries, find a first bound key,
delete it, find next... and so on, until there are no bound keys
left in the app_keys queue.
---
 mesh/appkey.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/mesh/appkey.c b/mesh/appkey.c
index 3a1fd8a54..0eb268782 100644
--- a/mesh/appkey.c
+++ b/mesh/appkey.c
@@ -58,6 +58,14 @@ static bool match_key_index(const void *a, const void *b)
 	return key->app_idx == idx;
 }
 
+static bool match_bound_key(const void *a, const void *b)
+{
+	const struct mesh_app_key *key = a;
+	uint16_t idx = L_PTR_TO_UINT(b);
+
+	return key->net_idx == idx;
+}
+
 static bool match_replay_cache(const void *a, const void *b)
 {
 	const struct mesh_msg *msg = a;
@@ -434,19 +442,27 @@ int appkey_key_delete(struct mesh_net *net, uint16_t net_idx,
 
 void appkey_delete_bound_keys(struct mesh_net *net, uint16_t net_idx)
 {
-	const struct l_queue_entry *entry;
 	struct l_queue *app_keys;
+	struct mesh_node *node;
+	struct mesh_app_key *key;
 
 	app_keys = mesh_net_get_app_keys(net);
 	if (!app_keys)
 		return;
 
-	entry = l_queue_get_entries(app_keys);
+	node = mesh_net_node_get(net);
 
-	for (; entry; entry = entry->next) {
-		struct mesh_app_key *key = entry->data;
+	key = l_queue_remove_if(app_keys, match_bound_key,
+					L_UINT_TO_PTR(net_idx));
+
+	while (key) {
+		node_app_key_delete(node, net_idx, key->app_idx);
+		mesh_config_app_key_del(node_config_get(node), net_idx,
+								key->app_idx);
+		appkey_key_free(key);
 
-		appkey_key_delete(net, net_idx, key->app_idx);
+		key = l_queue_remove_if(app_keys, match_bound_key,
+					L_UINT_TO_PTR(net_idx));
 	}
 }
 
-- 
2.21.1

