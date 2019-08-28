Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D1A1A0DBD
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Aug 2019 00:49:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbfH1WtA (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 28 Aug 2019 18:49:00 -0400
Received: from mga17.intel.com ([192.55.52.151]:13786 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726658AbfH1WtA (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 28 Aug 2019 18:49:00 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Aug 2019 15:48:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,442,1559545200"; 
   d="scan'208";a="210328939"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.254.35.27])
  by fmsmga002.fm.intel.com with ESMTP; 28 Aug 2019 15:48:59 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, inga.stotland@intel.com
Subject: [PATCH BlueZ 1/2] doc: Remove uneeded dbus API for App Key Refresh
Date:   Wed, 28 Aug 2019 15:48:50 -0700
Message-Id: <20190828224851.2201-2-brian.gix@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190828224851.2201-1-brian.gix@intel.com>
References: <20190828224851.2201-1-brian.gix@intel.com>
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

