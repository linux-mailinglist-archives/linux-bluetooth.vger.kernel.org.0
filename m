Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE71F5C30
	for <lists+linux-bluetooth@lfdr.de>; Sat,  9 Nov 2019 01:07:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbfKIAHD (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 8 Nov 2019 19:07:03 -0500
Received: from mga05.intel.com ([192.55.52.43]:64720 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726231AbfKIAHD (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 8 Nov 2019 19:07:03 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Nov 2019 16:07:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,283,1569308400"; 
   d="scan'208";a="215104646"
Received: from ingas-nuc1.sea.intel.com ([10.254.33.193])
  by orsmga002.jf.intel.com with ESMTP; 08 Nov 2019 16:07:01 -0800
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ] mesh: Fix clean up after AddNode method
Date:   Fri,  8 Nov 2019 16:07:00 -0800
Message-Id: <20191109000700.5428-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This fixes the cleanup routine that is called after AddNode method
on org.bluez.mesh.Manager1 interface is complete: do not remove
the agent associated with the Provisioner (owner of Manager interface).
---
 mesh/manager.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/mesh/manager.c b/mesh/manager.c
index b39ea6ed7..0b11b4541 100644
--- a/mesh/manager.c
+++ b/mesh/manager.c
@@ -80,8 +80,6 @@ static void free_pending_add_call()
 		l_dbus_remove_watch(dbus_get_bus(),
 						add_pending->disc_watch);
 
-	mesh_agent_remove(add_pending->agent);
-
 	l_free(add_pending);
 	add_pending = NULL;
 }
@@ -246,7 +244,7 @@ static struct l_dbus_message *add_node_call(struct l_dbus *dbus,
 	add_pending = l_new(struct add_data, 1);
 	memcpy(add_pending->uuid, uuid, 16);
 	add_pending->node = node;
-	add_pending->agent = node_get_agent(node);;
+	add_pending->agent = node_get_agent(node);
 
 	if (!node_is_provisioner(node) || (add_pending->agent == NULL)) {
 		l_info("Provisioner: %d", node_is_provisioner(node));
-- 
2.21.0

