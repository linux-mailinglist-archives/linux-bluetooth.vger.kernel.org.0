Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FE4FAADA2
	for <lists+linux-bluetooth@lfdr.de>; Thu,  5 Sep 2019 23:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404129AbfIEVMK (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 5 Sep 2019 17:12:10 -0400
Received: from mga09.intel.com ([134.134.136.24]:36068 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387591AbfIEVMK (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 5 Sep 2019 17:12:10 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Sep 2019 14:12:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,471,1559545200"; 
   d="scan'208";a="182945376"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.254.24.188])
  by fmsmga008.fm.intel.com with ESMTP; 05 Sep 2019 14:12:09 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, inga.stotland@intel.com
Subject: [PATCH BlueZ v2 1/2] doc: Remove uneeded dbus API for App Key Refresh
Date:   Thu,  5 Sep 2019 14:11:48 -0700
Message-Id: <20190905211149.26255-2-brian.gix@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190905211149.26255-1-brian.gix@intel.com>
References: <20190905211149.26255-1-brian.gix@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

---
 doc/mesh-api.txt | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/doc/mesh-api.txt b/doc/mesh-api.txt
index 470751f7a..9b9f4e3de 100644
--- a/doc/mesh-api.txt
+++ b/doc/mesh-api.txt
@@ -627,25 +627,6 @@ Methods:
 			org.bluez.mesh.Error.DoesNotExist
 			org.bluez.mesh.Error.Busy
 
-	void CompleteAppKeyUpdate(uint16 app_index)
-
-		This method is used by the application at the completion of
-		a Key Refresh Procedure.  This method should be called for each
-		app key being updated during the procedure, and must be
-		performed prior to changing the phase of the bound net key
-		to phase 3. (See SetKeyPhase() method).
-
-		The app_index parameter is a 12-bit value (0x000-0xFFF)
-		specifying which app key was updated. Note that the subnet that
-		the key is bound to must exist and be in Phase 2.
-
-		This call affects the local bluetooth-meshd key database only.
-
-		PossibleErrors:
-			org.bluez.mesh.Error.Failed
-			org.bluez.mesh.Error.InvalidArguments
-			org.bluez.mesh.Error.DoesNotExist
-
 	void DeleteAppKey(uint16 app_index)
 
 		This method is used by the application to delete an application
-- 
2.21.0

