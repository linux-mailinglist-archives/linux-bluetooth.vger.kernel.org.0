Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9107964F0B
	for <lists+linux-bluetooth@lfdr.de>; Thu, 11 Jul 2019 01:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727345AbfGJXIP (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 10 Jul 2019 19:08:15 -0400
Received: from mga14.intel.com ([192.55.52.115]:52368 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726708AbfGJXIP (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 10 Jul 2019 19:08:15 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Jul 2019 16:08:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,476,1557212400"; 
   d="scan'208";a="186250380"
Received: from bgix-dell-lap.sea.intel.com ([10.255.80.129])
  by fmsmga001.fm.intel.com with ESMTP; 10 Jul 2019 16:08:15 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     inga.stotland@intel.com, michal.lowas-rzechonek@silvair.com,
        brian.gix@intel.com
Subject: [PATCH BlueZ 1/8] doc: Cleanup API Provisioner1 interface
Date:   Wed, 10 Jul 2019 16:07:50 -0700
Message-Id: <20190710230757.8425-2-brian.gix@intel.com>
X-Mailer: git-send-email 2.14.5
In-Reply-To: <20190710230757.8425-1-brian.gix@intel.com>
References: <20190710230757.8425-1-brian.gix@intel.com>
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Modified the RequestProvData In and Out param list to eliminate
parameters which can be provided by the Node which owns the
procedure, and clean-up the actual error list.
---
 doc/mesh-api.txt | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/doc/mesh-api.txt b/doc/mesh-api.txt
index 893a1a6c0..0ac2fdfd1 100644
--- a/doc/mesh-api.txt
+++ b/doc/mesh-api.txt
@@ -365,7 +365,9 @@ Methods:
 		ScanResult() method on the app will be called with the result.
 
 		PossibleErrors:
+			org.bluez.mesh.Error.InvalidArguments
 			org.bluez.mesh.Error.NotAuthorized
+			org.bluez.mesh.Error.Busy
 
 	void UnprovisionedScanCancel(void)
 
@@ -374,6 +376,7 @@ Methods:
 		(scanning) for unprovisioned devices in the area.
 
 		PossibleErrors:
+			org.bluez.mesh.Error.InvalidArguments
 			org.bluez.mesh.Error.NotAuthorized
 
 	void AddNode(array{byte}[16] uuid)
@@ -860,7 +863,7 @@ Service		unique name
 Interface	org.bluez.mesh.Provisioner1
 Object path	freely definable
 
-	ScanResult(int8 rssi, array{byte} data)
+	void ScanResult(int16 rssi, array{byte} data)
 
 		The method is called from the bluetooth-meshd daemon when a
 		unique UUID has been seen during UnprovisionedScan() for
@@ -881,17 +884,17 @@ Object path	freely definable
 		was recieved at a higher rssi power level.
 
 
-	uint16 net_index, uint8 flags, uint32 iv_index, uint16 unicast
-							RequestProvData()
+	uint16 net_index, uint16 unicast RequestProvData(uint8 count)
 
 		This method is implemented by a Provisioner capable application
 		and is called when the remote device has been fully
 		authenticated and confirmed.
 
+		The count parameter is the number of consecutive unicast
+		addresses the remote device is requesting.
+
 		Return Parameters are from the Mesh Profile Spec:
 		net_index - Subnet index of the net_key
-		flags - Flags for IV_Update and Key Refresh
-		iv_index - Current IvIndex being used on the network
 		unicast - Primary Unicast address of the new node
 
 		PossibleErrors:
-- 
2.14.5

