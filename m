Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 054AE682001
	for <lists+linux-bluetooth@lfdr.de>; Tue, 31 Jan 2023 00:52:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbjA3XwV (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 30 Jan 2023 18:52:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjA3XwU (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 30 Jan 2023 18:52:20 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43E6D2DE77
        for <linux-bluetooth@vger.kernel.org>; Mon, 30 Jan 2023 15:52:19 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id t12-20020a17090aae0c00b00229f4cff534so14351552pjq.1
        for <linux-bluetooth@vger.kernel.org>; Mon, 30 Jan 2023 15:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pf4yHISbwAxeDIUMgm2cNVM2V3xy2A2ZSfKqnVVK9BE=;
        b=EC9UMKkQ1f90ikbOQzi8klEaGrxSgSE/hI+DfCaaHjm79v32njja3RinwwRuF+utHp
         WsT8rIwoaQziNQvwphYjjZ1ZsrUWzbTkZ64L9BkInhcp1l+CvzkbyCKXb9aHxqcrHHdK
         BadDQtqu6C7yt6aHuZfUEats2V33Hd8S2uuEL9sCQ21OI1cG841WNE0L5UBiYPsbMU0f
         MMMmLWACvWPZNDyMov7TrjyCsgiAZ9Y3D7d+CFh2LPTWCyYgoNWjPYe0iNb7FM1ErDCL
         78KkFrO3VoQhPXVmrfKtfAOZJhCAgslEJcL0uYcsN6PQXSQjzpVh8BqKeKcHWKAZ7c29
         0ibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pf4yHISbwAxeDIUMgm2cNVM2V3xy2A2ZSfKqnVVK9BE=;
        b=3RtCnfcrnJyWvX3w5x57ddB1iNvXU1zfnZ7qZiN/J4RZxt7312rvUxjF6lTyFuvSfV
         rdMBvJsy4FdurRo355+diVQNDVBjU5AmZ6WJI4oC0ndxr5xL49TTWmvScY/u9czGBS+U
         zINRy/BnmMicb0ZS7WRPiofCOf9jiR0lwecSXiZbtb37wafrOJhOEcuijYKf1h0qef9j
         Q7DCKeCtSZy910uxK6NIwxBIHFy/XqGAGkUAue6lVJbnqm8t9iWG4vGWfGWBnhUG0l9G
         9BQ4UknDy/dST4GHLskqSGYKENTnNbF1pegOkPtx88T6s+arjS7er45tFMl/DZNB0zdA
         14oA==
X-Gm-Message-State: AFqh2kpHgS0DxAX0DpfLU68H42QIMp7a6N1ZV23890XM/TdqA2EtRPcC
        zFSyCDSQBtHEj6ntFPsO3O9aHnGbUhSkZw==
X-Google-Smtp-Source: AMrXdXv5ih8X+ofgzlfLzCfVLbbgOFCrUui4Wo0L+/CRBL0wPIYK1zMxWeTmyFfbn9xZnZhtH6uvsg==
X-Received: by 2002:a17:902:b095:b0:192:bdf8:1a5c with SMTP id p21-20020a170902b09500b00192bdf81a5cmr48911523plr.33.1675122737982;
        Mon, 30 Jan 2023 15:52:17 -0800 (PST)
Received: from fedora.. (97-126-124-199.tukw.qwest.net. [97.126.124.199])
        by smtp.gmail.com with ESMTPSA id t191-20020a6381c8000000b004e8f7f23c4bsm2663948pgd.76.2023.01.30.15.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 15:52:17 -0800 (PST)
From:   Brian Gix <brian.gix@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, inga.stotland@intel.com
Subject: [PATCH BlueZ v5 01/14] doc/mesh: Add Remote Provisioning DBus APIs
Date:   Mon, 30 Jan 2023 15:51:57 -0800
Message-Id: <20230130235210.94385-2-brian.gix@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130235210.94385-1-brian.gix@gmail.com>
References: <20230130235210.94385-1-brian.gix@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Brian Gix <brian.gix@intel.com>

Remote Provisioning (introduced in Mesh Profile Specification v1.1)

* Allows Provisioners to use a remote server to scan for and
  provision devices.

* Allows Config managers to reprovision existing nodes to:
	* Refresh Device Keys
	* Reassign Node Addresses
	* Refresh Node Composition
---
 doc/mesh-api.txt | 140 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 134 insertions(+), 6 deletions(-)

diff --git a/doc/mesh-api.txt b/doc/mesh-api.txt
index 85de6705e..ea6f034db 100644
--- a/doc/mesh-api.txt
+++ b/doc/mesh-api.txt
@@ -484,7 +484,28 @@ Methods:
 			Specifies number of seconds for scanning to be active.
 			If set to 0 or if this key is not present, then the
 			scanning will continue until UnprovisionedScanCancel()
-			or AddNode() methods are called.
+			or AddNode() methods are called. If not present, and a
+			remote server is specified, the default timeout will be
+			60 seconds.
+
+		uint16 Server
+			Specifies a remote server on which to perform scanning.
+			If not present, scanning will be local. If present,
+			the timeout must be between 1 and 60 seconds.
+
+		uint16 Subnet
+			Specifies a subnet for the remote server. If not
+			present, primary subnet will be used. If Server not
+			present, the Subnet will be ignored.
+
+		array{byte}[16] Filter
+			Specifies a specific UUID to search for. If not
+			present, all found UUIDs will be returned.
+
+		uint8 array Extended
+			Specifies variable number of Bluetooth AD types to
+			return with scan result. Only valid if a Filter has been
+			specified.
 
 		Each time a unique unprovisioned beacon is heard, the
 		ScanResult() method on the app will be called with the result.
@@ -514,8 +535,48 @@ Methods:
 		of the unprovisioned device to be added to the network.
 
 		The options parameter is a dictionary that may contain
-		additional configuration info (currently an empty placeholder
-		for forward compatibility).
+		additional optional configuration info:
+
+		uint16 Server
+			Specifies a remote server to perform provisioning on. If
+			not present, provisioning will be done locally.
+
+		uint16 Subnet
+			Specifies a subnet for the remote server. If not
+			present, primary subnet will be used. If Server not
+			present Subnet will be ignored.
+
+		PossibleErrors:
+			org.bluez.mesh.Error.InvalidArguments
+			org.bluez.mesh.Error.NotAuthorized
+
+	void Reprovision(uint16 unicast, dict options)
+
+		This method is used by the application that supports
+		org.bluez.mesh.Provisioner1 interface to perform one of the
+		Node Provisioning Protocol Interface procedures with a remote
+		node to refresh its device key, unicast address, and
+		composition. Remote node being reprovisioned must have the
+		Remote Provisioning Server model.
+
+		The unicast parameter is the 16-bit primary node address of
+		the remote node being reprovisioned.
+
+		The options parameter is a dictionary that may contain
+		additional optional configuration info:
+
+		uint8 NPPI
+			Specifies the Node Provisioning Protocol Interface
+			procedure, as defined in the Mesh Profile Specification:
+				0 - Device Key Refresh Only
+				1 - Node Address Refresh
+				2 - Node Composition Refresh
+
+			If not present, procedure 0 will be used.
+
+		uint16 Subnet
+			Specifies the subnet remote node is on. If not
+			present, primary subnet will be tried.
 
 		PossibleErrors:
 			org.bluez.mesh.Error.InvalidArguments
@@ -1055,11 +1116,19 @@ Object path	freely definable
 		byte remote device UUID (always), a 16 bit mask of OOB
 		authentication flags (optional), and a 32 bit URI hash (if URI
 		bit set in OOB mask). Whether these fields exist or not is a
-		decision of the remote device.
+		decision of the unprovisioned device.
 
 		The options parameter is a dictionary that may contain
-		additional scan result info (currently an empty placeholder for
-		forward compatibility).
+		additional optional configuration info:
+
+		uint16 Server
+			Specifies the remote server that received the
+			Unprovisioned beacon. If not present, beacon was
+			received locally.
+
+		uint8 array ExtendedData
+			If Extended data was requested during scanning, any
+			received data will be returned here.
 
 		If a beacon with a UUID that has already been reported is
 		recieved by the daemon, it will be silently discarded unless it
@@ -1082,6 +1151,26 @@ Object path	freely definable
 		PossibleErrors:
 			org.bluez.mesh.Error.Abort
 
+	uint16 unicast RequestReprovData(uint16 original, uint8 count)
+
+		This method is implemented by a Provisioner capable application
+		and is called when the remote node being reprovisioned has been
+		fully authenticated and confirmed. This method will only be
+		called if the NPPI-1 procedure (Node Address Refresh) is being
+		performed.
+
+		The original parameter is the current unicast address of the
+		node being reprovisioned.
+
+		The count parameter is the number of consecutive unicast
+		addresses the remote node is requesting.
+
+		Return Parameter:
+		unicast - Primary Unicast address of the new node
+
+		PossibleErrors:
+			org.bluez.mesh.Error.Abort
+
 	void AddNodeComplete(array{byte}[16] uuid, uint16 unicast, uint8 count)
 
 		This method is called when the node provisioning initiated
@@ -1096,6 +1185,33 @@ Object path	freely definable
 		The new node may now be sent messages using the credentials
 		supplied by the RequestProvData method.
 
+	void ReprovComplete(uint16 original, uint8 nppi, uint16 unicast,
+								uint8 count)
+
+		This method is called when the node Reprovisioning initiated
+		by a Reprovision() method call successfully completed.
+
+		The original parameter is the former primary address of the
+		node that has been reprovisioned.
+
+		The nppi parameter indicates which NPPI procedure was performed.
+		If procedure 1 or 2 was performed, the node is materially
+		different than it was before reprovisioning, and Composition,
+		Bindings, Publication and Subscription settings should be
+		refreshed.
+
+		The unicast parameter is the new primary address that has been
+		assigned to the node, If NPPI procedure 1 was performed this
+		value may be different from the original. If procedure 0 or 2
+		was performed, the original and new primary address should be
+		the same.
+
+		The count parameter is the number of unicast addresses assigned
+		to the node.
+
+		The node may now be sent messages using the credentials
+		supplied by the RequestReprovData method.
+
 	void AddNodeFailed(array{byte}[16] uuid, string reason)
 
 		This method is called when the node provisioning initiated by
@@ -1109,6 +1225,18 @@ Object path	freely definable
 		"decryption-error", "unexpected-error",
 		"cannot-assign-addresses".
 
+	void ReprovFailed(uint16 unicast, string reason)
+
+		This method is called when node reprovisioning initiated by
+		Reprovision() has failed. If reprovisioning has failed, the
+		prior credentials of the remote node may still be valid.
+
+		The reason parameter identifies the reason for provisioning
+		failure. The defined values are: "aborted", "timeout",
+		"bad-pdu", "confirmation-failed", "out-of-resources",
+		"decryption-error", "unexpected-error",
+		"cannot-assign-addresses".
+
 Provisioning Agent Hierarchy
 ============================
 Service		unique name
-- 
2.39.1

