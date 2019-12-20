Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4500E12759E
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Dec 2019 07:18:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbfLTGSh (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 20 Dec 2019 01:18:37 -0500
Received: from mga17.intel.com ([192.55.52.151]:37790 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725853AbfLTGSh (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 20 Dec 2019 01:18:37 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Dec 2019 22:18:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,334,1571727600"; 
   d="scan'208";a="206453206"
Received: from ingas-nuc1.sea.intel.com ([10.254.36.226])
  by orsmga007.jf.intel.com with ESMTP; 19 Dec 2019 22:18:36 -0800
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ] TODO: Update mesh section
Date:   Thu, 19 Dec 2019 22:18:29 -0800
Message-Id: <20191220061829.11418-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

---
 TODO | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/TODO b/TODO
index 598610280..c9b30641d 100644
--- a/TODO
+++ b/TODO
@@ -189,13 +189,7 @@ Management Interface
 
 Mesh
 ====
-- Read default configuration settings (e.g., provisioning timeout, supported
-  features, etc.)from  mesh.conf file.
-
-  Priority: Medium
-  Complexity: C1
-
-- Add examples and unit tests
+- Add unit tests
 
   Priority: High
   Complexity: C1
@@ -212,11 +206,6 @@ Mesh
   Priority: Medium
   Complexity: C2
 
-- Design and implement Mesh Provisioner/ Configuration Client Model.
-
-  Priority: Medium
-  Complexity: C4
-
 - Add support for GATT proxy server
 
   Priority: Low
@@ -233,7 +222,3 @@ Mesh
   Priority: Low
   Complexity: C4
 
-- Support for all the provisioning OOB types
-
-  Priority: Medium
-  Complexity: C2
-- 
2.21.0

