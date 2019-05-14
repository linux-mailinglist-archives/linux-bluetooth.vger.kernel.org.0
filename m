Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EB281D062
	for <lists+linux-bluetooth@lfdr.de>; Tue, 14 May 2019 22:15:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbfENUPr (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 14 May 2019 16:15:47 -0400
Received: from mga05.intel.com ([192.55.52.43]:13417 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726490AbfENUPq (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 14 May 2019 16:15:46 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 May 2019 13:15:46 -0700
X-ExtLoop1: 1
Received: from bgix-dell-lap.sea.intel.com ([10.251.7.218])
  by fmsmga007.fm.intel.com with ESMTP; 14 May 2019 13:15:46 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     inga.stotland@intel.com, brian.gix@intel.com,
        michal.lowas-rzechonek@silvair.com
Subject: [PATCH BlueZ 3/3] mesh: Save generated Net and Dev keys in KeyRing
Date:   Tue, 14 May 2019 13:15:25 -0700
Message-Id: <20190514201525.16067-4-brian.gix@intel.com>
X-Mailer: git-send-email 2.14.5
In-Reply-To: <20190514201525.16067-1-brian.gix@intel.com>
References: <20190514201525.16067-1-brian.gix@intel.com>
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

When creating a network from scratch, we need to save all
keys that are created into the KeyRing for use by Config
Client application.
---
 mesh/node.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/mesh/node.c b/mesh/node.c
index 3618595b3..5318e2b69 100644
--- a/mesh/node.c
+++ b/mesh/node.c
@@ -35,6 +35,7 @@
 #include "mesh/mesh-db.h"
 #include "mesh/provision.h"
 #include "mesh/storage.h"
+#include "mesh/keyring.h"
 #include "mesh/appkey.h"
 #include "mesh/model.h"
 #include "mesh/cfgmod.h"
@@ -1549,8 +1550,8 @@ static void get_managed_objects_cb(struct l_dbus_message *msg, void *user_data)
 	} else {
 		/* Callback for create node request */
 		node_ready_func_t cb = req->cb;
+		struct keyring_net_key net_key;
 		uint8_t dev_key[16];
-		uint8_t net_key[16];
 
 		node->num_ele = num_ele;
 		set_defaults(node);
@@ -1561,11 +1562,22 @@ static void get_managed_objects_cb(struct l_dbus_message *msg, void *user_data)
 
 		/* Generate device and primary network keys */
 		l_getrandom(dev_key, sizeof(dev_key));
-		l_getrandom(net_key, sizeof(net_key));
+		l_getrandom(net_key.old_key, sizeof(net_key.old_key));
+		net_key.net_idx = DEFAULT_PRIMARY_NET_INDEX;
+		net_key.phase = 0;
 
 		if (!add_local_node(node, DEFAULT_NEW_UNICAST, false, false,
-					DEFAULT_IV_INDEX, dev_key,
-					DEFAULT_PRIMARY_NET_INDEX, net_key))
+						DEFAULT_IV_INDEX, dev_key,
+						DEFAULT_PRIMARY_NET_INDEX,
+							net_key.old_key))
+			goto fail;
+
+		if (!keyring_put_remote_dev_key(node, DEFAULT_NEW_UNICAST,
+							num_ele, dev_key))
+			goto fail;
+
+		if (!keyring_put_net_key(node, DEFAULT_PRIMARY_NET_INDEX,
+								&net_key))
 			goto fail;
 
 		cb(req->user_data, MESH_ERROR_NONE, node);
-- 
2.14.5

