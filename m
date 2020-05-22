Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C13DE1DDC34
	for <lists+linux-bluetooth@lfdr.de>; Fri, 22 May 2020 02:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbgEVAfE (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 21 May 2020 20:35:04 -0400
Received: from mga14.intel.com ([192.55.52.115]:55682 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726785AbgEVAfE (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 21 May 2020 20:35:04 -0400
IronPort-SDR: 9p99lkuRkfCJdRVNc6VD7F/qKu4NAaiLPuG4NQyVq1EEnn27Xy7I+Zb1QRdtPLvh972g5bW4Pp
 lZDFqOo5+O/w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2020 17:35:03 -0700
IronPort-SDR: GuUDR3dBNjbPk5xEfBeo4C1ArmehHZK0cICr1QhFFnO0acponfyq1rRgXllz8LsHQZVxQsZFHj
 GKqTfZVs7sdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,419,1583222400"; 
   d="scan'208";a="300961660"
Received: from nsalivat-mobl.amr.corp.intel.com (HELO ingas-nuc1.sea.intel.com) ([10.254.98.52])
  by orsmga008.jf.intel.com with ESMTP; 21 May 2020 17:35:03 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 02/10] mesh: Free allocated agent in mesh_remove_agent()
Date:   Thu, 21 May 2020 17:34:53 -0700
Message-Id: <20200522003501.106165-3-inga.stotland@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522003501.106165-1-inga.stotland@intel.com>
References: <20200522003501.106165-1-inga.stotland@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This adds previously missing call to free memory allocated
for agent structure.
---
 mesh/agent.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/mesh/agent.c b/mesh/agent.c
index a06cc2b99..4d200416f 100644
--- a/mesh/agent.c
+++ b/mesh/agent.c
@@ -188,9 +188,6 @@ static void agent_free(void *agent_data)
 	mesh_agent_key_cb_t key_cb;
 	mesh_agent_number_cb_t number_cb;
 
-	if (!l_queue_find(agents, simple_match, agent))
-		return;
-
 	err = MESH_ERROR_DOES_NOT_EXIST;
 
 	if (agent->req && agent->req->cb) {
@@ -228,15 +225,16 @@ static void agent_free(void *agent_data)
 
 	l_free(agent->path);
 	l_free(agent->owner);
+	l_free(agent);
 }
 
 void mesh_agent_remove(struct mesh_agent *agent)
 {
-	if (!agent || !l_queue_find(agents, simple_match, agent))
+	if (!agent)
 		return;
 
-	agent_free(agent);
-	l_queue_remove(agents, agent);
+	if (l_queue_remove(agents, agent))
+		agent_free(agent);
 }
 
 void mesh_agent_cleanup(void)
-- 
2.26.2

