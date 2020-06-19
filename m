Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 491C3201D17
	for <lists+linux-bluetooth@lfdr.de>; Fri, 19 Jun 2020 23:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbgFSV07 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 19 Jun 2020 17:26:59 -0400
Received: from mga03.intel.com ([134.134.136.65]:21821 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727051AbgFSV07 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 19 Jun 2020 17:26:59 -0400
IronPort-SDR: u7o09xU3TcawovFfkQQfkbTuCEmRPV4oMlrAhaRP5N4t+d9ClJZgfbBKnHB7Xu+uAMGh3a8owe
 yOgvMm+STi4g==
X-IronPort-AV: E=McAfee;i="6000,8403,9657"; a="143045096"
X-IronPort-AV: E=Sophos;i="5.75,256,1589266800"; 
   d="scan'208";a="143045096"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2020 14:26:58 -0700
IronPort-SDR: RB4BRUU2YRmlsRjf2MWDDeJXTM5wSCKphGsNhmShNPs/0zivXU/mEDqR6HSRQAfuAn2DwNxUQk
 bkR23jsL/bZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,256,1589266800"; 
   d="scan'208";a="292246231"
Received: from pafleisc-mobl.amr.corp.intel.com (HELO ingas-nuc1.sea.intel.com) ([10.254.109.121])
  by orsmga002.jf.intel.com with ESMTP; 19 Jun 2020 14:26:57 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 1/3] mesh: Emit PropertiesChanged when IV Index changes
Date:   Fri, 19 Jun 2020 14:26:53 -0700
Message-Id: <20200619212655.107839-2-inga.stotland@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200619212655.107839-1-inga.stotland@intel.com>
References: <20200619212655.107839-1-inga.stotland@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This adds emitting of PropertiesChanged signal whenever the
mesh IV index is updated to indicate that the vlaues of "IvIndex"
property has been modified.
---
 mesh/net.c  | 2 ++
 mesh/node.c | 9 +++++++++
 mesh/node.h | 1 +
 3 files changed, 12 insertions(+)

diff --git a/mesh/net.c b/mesh/net.c
index 3ab948be5..b54c647cb 100644
--- a/mesh/net.c
+++ b/mesh/net.c
@@ -2566,6 +2566,8 @@ static void update_iv_ivu_state(struct mesh_net *net, uint32_t iv_index,
 		rpl_init(net->node, iv_index);
 	}
 
+	node_property_changed(net->node, "IVIndex");
+
 	net->iv_index = iv_index;
 	net->iv_update = ivu;
 }
diff --git a/mesh/node.c b/mesh/node.c
index cf4d93aec..ee6d1833f 100644
--- a/mesh/node.c
+++ b/mesh/node.c
@@ -2280,6 +2280,15 @@ static void setup_node_interface(struct l_dbus_interface *iface)
 									NULL);
 }
 
+void node_property_changed(struct mesh_node *node, const char *property)
+{
+	struct l_dbus *bus = dbus_get_bus();
+
+	if (bus)
+		l_dbus_property_changed(dbus_get_bus(), node->obj_path,
+						MESH_NODE_INTERFACE, property);
+}
+
 bool node_dbus_init(struct l_dbus *bus)
 {
 	if (!l_dbus_register_interface(bus, MESH_NODE_INTERFACE,
diff --git a/mesh/node.h b/mesh/node.h
index b8b2b1b49..6c4542a78 100644
--- a/mesh/node.h
+++ b/mesh/node.h
@@ -99,3 +99,4 @@ struct mesh_agent *node_get_agent(struct mesh_node *node);
 const char *node_get_storage_dir(struct mesh_node *node);
 bool node_load_from_storage(const char *storage_dir);
 void node_finalize_new_node(struct mesh_node *node, struct mesh_io *io);
+void node_property_changed(struct mesh_node *node, const char *property);
-- 
2.26.2

