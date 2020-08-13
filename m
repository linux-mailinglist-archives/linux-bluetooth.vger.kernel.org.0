Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6064B243374
	for <lists+linux-bluetooth@lfdr.de>; Thu, 13 Aug 2020 07:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725960AbgHMFB4 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 13 Aug 2020 01:01:56 -0400
Received: from mga01.intel.com ([192.55.52.88]:34463 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725829AbgHMFBz (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 13 Aug 2020 01:01:55 -0400
IronPort-SDR: depHhk6SWEhwQJ9+QCCZXPZSwNCY+0GUaPzympX0utZpRAXl7x7CSwSd4EEwRLDNYzQEVW7+l8
 yg6y220AqlUQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9711"; a="172205220"
X-IronPort-AV: E=Sophos;i="5.76,307,1592895600"; 
   d="scan'208";a="172205220"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2020 22:01:55 -0700
IronPort-SDR: l5Qlt8gjeMgg64IdpM21NWlJXlb8m9q0eaKN+OF4Zf6eW3/5erXHPu7oK95h/C0tIsIvYTwA7C
 L59tHssq1RJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,307,1592895600"; 
   d="scan'208";a="399054397"
Received: from bnichola-mobl1.amr.corp.intel.com (HELO ingas-nuc1.intel.com) ([10.255.230.96])
  by fmsmga001.fm.intel.com with ESMTP; 12 Aug 2020 22:01:55 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ] mesh: Don't add config server when loading from storage
Date:   Wed, 12 Aug 2020 22:01:50 -0700
Message-Id: <20200813050150.135751-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Adding a sonfig server model when loading from storage is unnecessary,
since the daemon-generated stored configuration always contains
config server model.
This also fixes a memory leak caused by bad parameters passed to
mesh_model_add()
---
 mesh/node.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/mesh/node.c b/mesh/node.c
index 4b70587ae..1eeffeb8b 100644
--- a/mesh/node.c
+++ b/mesh/node.c
@@ -353,9 +353,6 @@ static bool add_elements_from_storage(struct mesh_node *node,
 		if (!add_element_from_storage(node, entry->data))
 			return false;
 
-	/* Add configuration server model on the primary element */
-	mesh_model_add(node, PRIMARY_ELE_IDX, CONFIG_SRV_MODEL, NULL);
-
 	return true;
 }
 
-- 
2.26.2

