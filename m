Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA4BDBE28B
	for <lists+linux-bluetooth@lfdr.de>; Wed, 25 Sep 2019 18:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389108AbfIYQeE (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 25 Sep 2019 12:34:04 -0400
Received: from mga01.intel.com ([192.55.52.88]:7878 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388818AbfIYQeD (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 25 Sep 2019 12:34:03 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Sep 2019 09:34:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,548,1559545200"; 
   d="scan'208";a="214100889"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.251.25.152])
  by fmsmga004.fm.intel.com with ESMTP; 25 Sep 2019 09:34:03 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, inga.stotland@intel.com,
        michal.lowas-rzechonek@silvair.com
Subject: [PATCH BlueZ v2 3/3] mesh: Fix Key Ring permissions for local nodes
Date:   Wed, 25 Sep 2019 09:33:29 -0700
Message-Id: <20190925163329.23767-4-brian.gix@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190925163329.23767-1-brian.gix@intel.com>
References: <20190925163329.23767-1-brian.gix@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

We do *not* automatically create populated key rings for imported or
joined nodes, but we also do not *forbid* any node from adding a key
in it's possesion to the local key ring.
---
 mesh/manager.c |  4 ----
 mesh/node.c    | 14 --------------
 2 files changed, 18 deletions(-)

diff --git a/mesh/manager.c b/mesh/manager.c
index 501ec10fe..96d9af915 100644
--- a/mesh/manager.c
+++ b/mesh/manager.c
@@ -298,10 +298,6 @@ static struct l_dbus_message *import_node_call(struct l_dbus *dbus,
 		return dbus_error(msg, MESH_ERROR_INVALID_ARGS,
 							"Bad device key");
 
-	if (mesh_net_is_local_address(net, primary, num_ele))
-		return dbus_error(msg, MESH_ERROR_INVALID_ARGS,
-					"Cannot overwrite local device key");
-
 	if (!keyring_put_remote_dev_key(node, primary, num_ele, key))
 		return dbus_error(msg, MESH_ERROR_FAILED, NULL);
 
diff --git a/mesh/node.c b/mesh/node.c
index 833377e99..cad1ac8fb 100644
--- a/mesh/node.c
+++ b/mesh/node.c
@@ -1692,23 +1692,9 @@ static void get_managed_objects_cb(struct l_dbus_message *msg, void *user_data)
 					import->net_idx, import->net_key))
 			goto fail;
 
-		memcpy(net_key.old_key, import->net_key, 16);
-		net_key.net_idx = import->net_idx;
-		if (import->flags.kr)
-			net_key.phase = KEY_REFRESH_PHASE_TWO;
-		else
-			net_key.phase = KEY_REFRESH_PHASE_NONE;
-
 		/* Initialize directory for storing keyring info */
 		init_storage_dir(node);
 
-		if (!keyring_put_remote_dev_key(node, import->unicast,
-						num_ele, import->dev_key))
-			goto fail;
-
-		if (!keyring_put_net_key(node, import->net_idx, &net_key))
-			goto fail;
-
 	} else {
 		/* Callback for create node request */
 		struct keyring_net_key net_key;
-- 
2.21.0

