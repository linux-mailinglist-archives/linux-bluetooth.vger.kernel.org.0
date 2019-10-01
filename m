Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84CA8C4068
	for <lists+linux-bluetooth@lfdr.de>; Tue,  1 Oct 2019 20:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725875AbfJASvO (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 1 Oct 2019 14:51:14 -0400
Received: from mga12.intel.com ([192.55.52.136]:58960 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725844AbfJASvO (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 1 Oct 2019 14:51:14 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Oct 2019 11:51:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,571,1559545200"; 
   d="scan'208";a="194618078"
Received: from ingas-nuc1.sea.intel.com ([10.251.152.1])
  by orsmga003.jf.intel.com with ESMTP; 01 Oct 2019 11:51:13 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com,
        Inga Stotland <istotlan@ingas-xps13.amr.corp.intel.com>
Subject: [PATCH BlueZ] mesh: Fix segmentation fault on Join() call
Date:   Tue,  1 Oct 2019 11:51:08 -0700
Message-Id: <20191001185108.5656-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Inga Stotland <istotlan@ingas-xps13.amr.corp.intel.com>

This fixes the following segfault:

node_init_cb (node=0x0, agent=0x0) at mesh/mesh.c:359
        reply = dbus_error(join_pending->msg, MESH_ERROR_FAILED,

        user_data=0x5555555be170) at mesh/node.c:1760
        dbus=<optimized out>) at ell/dbus.c:216
        user_data=0x5555555a6e00) at ell/dbus.c:279
        user_data=0x5555555a7ef0) at ell/io.c:126
        at ell/main.c:642
        at mesh/main.c:205

The fault was caused by the premature deletion of preserved state.

This moves setup of disconnect watch for the application calling the Join()
method into the node_init_cb(), after a temporary node has been
successfully created.
---
 mesh/mesh.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/mesh/mesh.c b/mesh/mesh.c
index b660a7ef2..9b2b2073b 100644
--- a/mesh/mesh.c
+++ b/mesh/mesh.c
@@ -377,6 +377,11 @@ static void node_init_cb(struct mesh_node *node, struct mesh_agent *agent)
 	l_dbus_send(dbus_get_bus(), reply);
 	join_pending->msg = NULL;
 
+	/* Setup disconnect watch */
+	join_pending->disc_watch = l_dbus_add_disconnect_watch(dbus_get_bus(),
+						join_pending->sender,
+						prov_disc_cb, NULL, NULL);
+
 	return;
 
 fail:
@@ -423,8 +428,6 @@ static struct l_dbus_message *join_network_call(struct l_dbus *dbus,
 	sender = l_dbus_message_get_sender(msg);
 
 	join_pending->sender = l_strdup(sender);
-	join_pending->disc_watch = l_dbus_add_disconnect_watch(dbus, sender,
-						prov_disc_cb, NULL, NULL);
 	join_pending->msg = l_dbus_message_ref(msg);
 	join_pending->app_path = app_path;
 
-- 
2.20.1

