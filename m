Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3AAD25DA1
	for <lists+linux-bluetooth@lfdr.de>; Wed, 22 May 2019 07:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728421AbfEVFdu (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 22 May 2019 01:33:50 -0400
Received: from mga05.intel.com ([192.55.52.43]:63614 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725801AbfEVFdt (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 22 May 2019 01:33:49 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 May 2019 22:33:49 -0700
X-ExtLoop1: 1
Received: from ingas-nuc1.sea.intel.com ([10.254.190.110])
  by orsmga007.jf.intel.com with ESMTP; 21 May 2019 22:33:48 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
        Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 1/2] mesh: Unreference pending D-Bus messages
Date:   Tue, 21 May 2019 22:33:38 -0700
Message-Id: <20190522053339.6289-2-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522053339.6289-1-inga.stotland@intel.com>
References: <20190522053339.6289-1-inga.stotland@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This change results in proper cleanup of D-Bus messages for pending
replies: if l_dbus_message_ref() was called for a message, then
l_dbus_message_unref() must be called for the same message to completely
free the message resources.
---
 mesh/mesh.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/mesh/mesh.c b/mesh/mesh.c
index 231a6bca4..bed8484f2 100644
--- a/mesh/mesh.c
+++ b/mesh/mesh.c
@@ -354,6 +354,9 @@ static void free_pending_join_call(bool failed)
 
 	mesh_agent_remove(join_pending->agent);
 
+	if (join_pending->msg)
+		l_dbus_message_unref(join_pending->msg);
+
 	if (failed)
 		node_remove(join_pending->node);
 
@@ -422,9 +425,6 @@ static void prov_disc_cb(struct l_dbus *bus, void *user_data)
 	if (!join_pending)
 		return;
 
-	if (join_pending->msg)
-		l_dbus_message_unref(join_pending->msg);
-
 	acceptor_cancel(&mesh);
 	join_pending->disc_watch = 0;
 
@@ -650,6 +650,7 @@ static void attach_ready_cb(void *user_data, int status, struct mesh_node *node)
 
 done:
 	l_dbus_send(dbus_get_bus(), reply);
+	l_dbus_message_unref(pending_msg);
 	l_queue_remove(pending_queue, pending_msg);
 }
 
@@ -727,6 +728,7 @@ static void create_network_ready_cb(void *user_data, int status,
 
 done:
 	l_dbus_send(dbus_get_bus(), reply);
+	l_dbus_message_unref(pending_msg);
 	l_queue_remove(pending_queue, pending_msg);
 }
 
-- 
2.21.0

