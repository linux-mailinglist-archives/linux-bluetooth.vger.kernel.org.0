Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4297D26F18
	for <lists+linux-bluetooth@lfdr.de>; Wed, 22 May 2019 21:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731825AbfEVTyq (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 22 May 2019 15:54:46 -0400
Received: from mga06.intel.com ([134.134.136.31]:42882 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731759AbfEVTyp (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 22 May 2019 15:54:45 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 May 2019 12:54:44 -0700
X-ExtLoop1: 1
Received: from bgix-dell-lap.sea.intel.com ([10.255.78.4])
  by fmsmga004.fm.intel.com with ESMTP; 22 May 2019 12:54:44 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     inga.stotland@intel.com, brian.gix@intel.com
Subject: [PATCH BlueZ v2 1/5] mesh: Add new required method for Key Refresh proc
Date:   Wed, 22 May 2019 12:54:24 -0700
Message-Id: <20190522195428.1901-2-brian.gix@intel.com>
X-Mailer: git-send-email 2.14.5
In-Reply-To: <20190522195428.1901-1-brian.gix@intel.com>
References: <20190522195428.1901-1-brian.gix@intel.com>
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

CompleteAppKeyUpdate() - Used in conjunction with SetKeyPhase()
---
 doc/mesh-api.txt | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/doc/mesh-api.txt b/doc/mesh-api.txt
index 112990a5d..3fad2fc6f 100644
--- a/doc/mesh-api.txt
+++ b/doc/mesh-api.txt
@@ -434,6 +434,7 @@ Methods:
 		PossibleErrors:
 			org.bluez.mesh.Error.InvalidArguments
 			org.bluez.mesh.Error.DoesNotExist
+			org.bluez.mesh.Error.Busy
 
 	void DeleteSubnet(uint16 net_index)
 
@@ -451,7 +452,9 @@ Methods:
 
 	void SetKeyPhase(uint16 net_index, uint8 phase)
 		This method is used to set the master key update phase of the
-		given subnet.
+		given subnet. When finalizing the procedure, it is important
+		to CompleteAppKeyUpdate() on all app keys that have been
+		updated during the procedure prior to setting phase 3.
 
 		The net_index parameter is a 12-bit value (0x000-0xFFF)
 		specifying which subnet phase to set.
@@ -491,6 +494,7 @@ Methods:
 		PossibleErrors:
 			org.bluez.mesh.Error.InvalidArguments
 			org.bluez.mesh.Error.AlreadyExists
+			org.bluez.mesh.Error.DoesNotExist
 
 	void ImportAppKey(uint16 net_index, uint16 app_index,
 						array{byte}[16] app_key)
@@ -512,6 +516,7 @@ Methods:
 		PossibleErrors:
 			org.bluez.mesh.Error.InvalidArguments
 			org.bluez.mesh.Error.AlreadyExists
+			org.bluez.mesh.Error.DoesNotExist
 
 	void UpdateAppKey(uint16 app_index)
 
@@ -524,6 +529,25 @@ Methods:
 
 		This call affects the local bluetooth-meshd key database only.
 
+		PossibleErrors:
+			org.bluez.mesh.Error.InvalidArguments
+			org.bluez.mesh.Error.DoesNotExist
+			org.bluez.mesh.Error.Busy
+
+	void CompleteAppKeyUpdate(uint16 app_index)
+
+		This method is used by the application at the completion of
+		a Key Refresh Procedure.  This method should be called for each
+		app key being updated during the procedure, and must be
+		performed prior to changing the phase of the bound net key
+		to phase 3. (See SetKeyPhase() method).
+
+		The app_index parameter is a 12-bit value (0x000-0xFFF)
+		specifying which app key was updated. Note that the subnet that
+		the key is bound to must exist and be in Phase 2.
+
+		This call affects the local bluetooth-meshd key database only.
+
 		PossibleErrors:
 			org.bluez.mesh.Error.InvalidArguments
 			org.bluez.mesh.Error.DoesNotExist
-- 
2.14.5

