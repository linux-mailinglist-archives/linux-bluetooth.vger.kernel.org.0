Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7297C675E50
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Jan 2023 20:47:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbjATTrn (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 20 Jan 2023 14:47:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbjATTrk (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 20 Jan 2023 14:47:40 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14D54457C5
        for <linux-bluetooth@vger.kernel.org>; Fri, 20 Jan 2023 11:47:39 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id g23so6212166plq.12
        for <linux-bluetooth@vger.kernel.org>; Fri, 20 Jan 2023 11:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dg+OLczEsFoyAkjMV+YWxfgBqPA3+Kql+jsBQri6mKE=;
        b=EOfmrAVaCLcKYNPARBWSYoqPz4u8N/9iHYVMUkZM0IliTrExXB2m3z3TTvc/yfe4ku
         LkG3KkN9we7qXJFvtBM0gCGs1nsZvvrigoIF2gLP5C7M0Zbc6qMDJhkbtM+363Z7opwx
         7w6lLUdSQtbtIH+z/Uis3v/u2V3auO/zkUQJM1SIOq6I2yOc6MIMvLqEiOwx+muHWzoE
         qxsPJ5PIyNvIdhzhb35O8B+cfkUmUFdrRD7AwUAK5F9on+9YntA+I6TgplVKWOIuRiLP
         7GzMQb4ble00AY/+qVxb/zZJ8OTJeQmYYui30PhnA5Rm4Q66Q+G3uZrNjI4rMb7NXOYy
         rcBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dg+OLczEsFoyAkjMV+YWxfgBqPA3+Kql+jsBQri6mKE=;
        b=BqbIORbvf5m4Y2sWx6sn44/44nZJKPGXLgj/VU4kTdcVLkeSdGqrKDoAomaoIatRhR
         Zi/q7wLoqA4GGH81loMDjrROEdayr+uA8hxEmnZ4t6Y4OxhIoIMncBH1PAs5oDypxsFR
         myjzWqeSQ3evN9J5F1a91R8p1gsl3HPOBPwx1ekVxD1W8ZIrcf9eT+i6nQy7tfGc0VTv
         C1VB7fPG/JrO8Bma/fU4S4yn56ArixPSNqRMWuPt/S3ynOD8VuX1iX72HfDqB8RsE0OD
         rP/1MDResXsnOT2bloG3OK6JaRwnC5WD12N2YVttRjWHAsKQGptYygXvkxquJhrInaHB
         bd2Q==
X-Gm-Message-State: AFqh2kpSKTQ3E0W+x0G6zz1gDt/ceFnhs/WWNxo47wlsN9Zb1PCharfg
        EjUcePO5nFrBcpTvSXFdVoiBAbYCcElABQ==
X-Google-Smtp-Source: AMrXdXsFy2s3neh9mjhoHJTAgeu666m7W7xmOog+VYt8ocG/6uNUcfcODS2MwG1/yxEJB3wVtsKjgw==
X-Received: by 2002:a17:903:54d:b0:193:a5b:ccf6 with SMTP id jo13-20020a170903054d00b001930a5bccf6mr14403211plb.0.1674244057824;
        Fri, 20 Jan 2023 11:47:37 -0800 (PST)
Received: from fedora.. (174-21-24-126.tukw.qwest.net. [174.21.24.126])
        by smtp.gmail.com with ESMTPSA id y13-20020a17090322cd00b001896af10ca7sm5149967plg.134.2023.01.20.11.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 11:47:37 -0800 (PST)
From:   Brian Gix <brian.gix@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Brian Gix <brian.gix@intel.com>
Subject: [PATCH BlueZ v2 01/11] doc/mesh: Add Remote Provisioning DBus APIs
Date:   Fri, 20 Jan 2023 11:47:21 -0800
Message-Id: <20230120194731.90065-2-brian.gix@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120194731.90065-1-brian.gix@gmail.com>
References: <20230120194731.90065-1-brian.gix@gmail.com>
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
index 85de6705e..393ae566f 100644
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
+			behavior, as defined in the Mesh Profile Specification:
+				0 - Device Key Refresh Only
+				1 - Node Address Refresh
+				2 - Node Composition Refresh
+
+			If not present, behavior 0 will be used.
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
+		The nppi parameter indicates which NPPI behavior was performed.
+		If behavior 1 or 2 was performed, the node is materially
+		different than it was before reprovisioning, and Composition,
+		Bindings, Publication and Subscription settings should be
+		refreshed.
+
+		The unicast parameter is the new primary address that has been
+		assigned to the node, If NPPI behavior 1 was performed this
+		value may be different from the original. If behavior 0 or 2
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
2.39.0

