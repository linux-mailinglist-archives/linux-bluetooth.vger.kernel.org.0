Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 343263183C6
	for <lists+linux-bluetooth@lfdr.de>; Thu, 11 Feb 2021 03:57:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbhBKC4r (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 10 Feb 2021 21:56:47 -0500
Received: from mga14.intel.com ([192.55.52.115]:53615 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229485AbhBKC4r (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 10 Feb 2021 21:56:47 -0500
IronPort-SDR: akVoydot75l+h4U4y5aQtiTq5IF4fd4fZKnawQoqIxe9HmO/vVCjRwLAy70FLYgIraDMKJ5gPK
 dw/lrOOAa28w==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="181411849"
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; 
   d="scan'208";a="181411849"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2021 18:56:06 -0800
IronPort-SDR: qfm4e3aqUAaZEj1jOHIt+Yb8WNb7uA47dm2q2vTS6F2MhV29P2R61HowANuxaVQrP9YhTLwgJj
 G55it1aBR4sg==
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; 
   d="scan'208";a="375700849"
Received: from trexin-mobl.amr.corp.intel.com (HELO istotlan-desk.intel.com) ([10.209.37.20])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2021 18:56:05 -0800
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ] mesh: Clear node's agent pointer after agent removal
Date:   Wed, 10 Feb 2021 18:55:58 -0800
Message-Id: <20210211025558.11791-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

When a node is created/provisioned/imported, the new node's agent
is removed. The corresponding pointer in the node structure needs
to be set to NULL to avoid pointing to freed memory.
---
 mesh/node.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mesh/node.c b/mesh/node.c
index 4bc11309b..e81aa82fe 100644
--- a/mesh/node.c
+++ b/mesh/node.c
@@ -2321,6 +2321,7 @@ void node_finalize_new_node(struct mesh_node *node, struct mesh_io *io)
 
 	free_node_dbus_resources(node);
 	mesh_agent_remove(node->agent);
+	node->agent = NULL;
 
 	node->busy = false;
 
-- 
2.26.2

