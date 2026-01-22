Return-Path: <linux-bluetooth+bounces-18320-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIfLHofrcWl6ZAAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18320-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 10:19:03 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DF51F6468B
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 10:19:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4514482380F
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 09:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7522C3A7E05;
	Thu, 22 Jan 2026 09:10:23 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378D6328B58
	for <linux-bluetooth@vger.kernel.org>; Thu, 22 Jan 2026 09:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769073023; cv=none; b=Wz+MxRfH5atNXC9ZpL+aD6o4SIHV9JhXU2XmfGW5rO2Jl6kgGQs7ncTXxtMhnseaQmYo7Rn2QIcbRiXQB5XqeGFxwQNnGZmKdyirpbeZoR4ApSPUyFDOk/sxwiFbPzFCVRO9eEiZ/57+qvKn/8Q3FZDIvIcGOKf5ZnZVAqYjFyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769073023; c=relaxed/simple;
	bh=6aB7EHGhcQnyKpW7BjjJ81QcBsM7K2fsbfkctAAnbTQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nrpq+7NT8zDbSpYJ2kGicYVOAUTrfgqurrU7uLuQBC11MhPdFGr15Ajj56GRWmzwbut60BZP0UdMh/wDK7V5YMXNBiwJkHghcSWJPXZ22Asy7NIlIR2oMaE+bl/AjmKn/aPPrpP/a8rBmh9yYHkoGZZodguSNmPEqJiDonIWdn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1EB0443137
	for <linux-bluetooth@vger.kernel.org>; Thu, 22 Jan 2026 09:10:14 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-bluetooth@vger.kernel.org
Subject: [BlueZ v3 7/9] doc: Port sap-api.txt to RST
Date: Thu, 22 Jan 2026 10:05:06 +0100
Message-ID: <20260122091003.398400-8-hadess@hadess.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122091003.398400-1-hadess@hadess.net>
References: <20260122091003.398400-1-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeehjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpedvffeiveehfedufeeuveekgeegteetudegfedutedvtdfghedutdduhfdtheevleenucffohhmrghinhepsghluhgviidrtggrlhhlnecukfhppedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemsggrgeefmegrieejieemtgdvugefmeejrgehfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemsggrgeefmegrieejieemtgdvugefmeejrgehfedphhgvlhhopeholhhimhhpihgtpdhmrghilhhfrhhomhephhgruggvshhssehhrgguvghsshdrnhgvthdpqhhiugepudfguedtgeegfedufeejpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdgslhhuvghtohhothhhsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-State: clean
X-GND-Score: 0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.24 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[hadess.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-18320-lists,linux-bluetooth=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FROM_NEQ_ENVFROM(0.00)[hadess@hadess.net,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_NONE(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,makefile.am:url,hadess.net:mid]
X-Rspamd-Queue-Id: DF51F6468B
X-Rspamd-Action: no action

---
 Makefile.am                 |  8 ++++++--
 doc/org.bluez.SimAccess.rst | 40 +++++++++++++++++++++++++++++++++++++
 doc/sap-api.txt             | 20 -------------------
 3 files changed, 46 insertions(+), 22 deletions(-)
 create mode 100644 doc/org.bluez.SimAccess.rst
 delete mode 100644 doc/sap-api.txt

diff --git a/Makefile.am b/Makefile.am
index 2217bcf15e4f..c2abd06cc087 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -402,6 +402,8 @@ man_MANS += doc/org.bluez.Telephony.5 doc/org.bluez.Call.5
 man_MANS += doc/org.bluez.ThermometerManager.5 \
 		doc/org.bluez.Thermometer.5 \
 		doc/org.bluez.ThermometerWatcher.5
+man_MANS += doc/org.bluez.SimAccess.5
+
 endif
 manual_pages += doc/bluetoothd.8
 manual_pages += doc/hci.7 doc/mgmt.7 doc/l2cap.7 doc/rfcomm.7 doc/sco.7 \
@@ -442,6 +444,7 @@ manual_pages += doc/org.bluez.Telephony.5 doc/org.bluez.Call.5
 manual_pages += doc/org.bluez.ThermometerManager.5 \
 		doc/org.bluez.Thermometer.5 \
 		doc/org.bluez.ThermometerWatcher.5
+manual_pages += doc/org.bluez.SimAccess.5
 
 EXTRA_DIST += src/genbuiltin src/bluetooth.conf \
 			src/main.conf profiles/network/network.conf \
@@ -484,8 +487,7 @@ EXTRA_DIST += doc/assigned-numbers.rst doc/supported-features.txt \
 				doc/test-runner.rst \
 				doc/settings-storage.txt
 
-EXTRA_DIST += doc/health-api.txt \
-		doc/sap-api.txt
+EXTRA_DIST += doc/health-api.txt
 
 EXTRA_DIST += doc/hci-protocol.rst doc/mgmt-protocol.rst \
 	      doc/l2cap-protocol.rst doc/rfcomm-protocol.rst \
@@ -533,6 +535,8 @@ EXTRA_DIST += doc/org.bluez.ThermometerManager.rst \
 	      doc/org.bluez.Thermometer.rst \
 	      doc/org.bluez.ThermometerWatcher.rst
 
+EXTRA_DIST += doc/org.bluez.SimAccess.rst
+
 EXTRA_DIST += doc/pics-opp.txt doc/pixit-opp.txt \
 		doc/pts-opp.txt
 
diff --git a/doc/org.bluez.SimAccess.rst b/doc/org.bluez.SimAccess.rst
new file mode 100644
index 000000000000..ac86e7eb220c
--- /dev/null
+++ b/doc/org.bluez.SimAccess.rst
@@ -0,0 +1,40 @@
+===================
+org.bluez.SimAccess
+===================
+
+----------------------------------------
+BlueZ D-Bus Sim Access API documentation
+----------------------------------------
+
+:Version: BlueZ
+:Date: February 2011
+:Author: Waldemar Rymarkiewicz <waldemar.rymarkiewicz@tieto.com>
+:Manual section: 5
+:Manual group: Linux System Administration
+
+Interface
+=========
+
+:Service:	org.bluez
+:Interface:	org.bluez.SimAccess1
+:Object path:	[variable prefix]/{hci0,hci1,...}
+
+Methods
+-------
+
+void Disconnect()
+`````````````````
+Disconnects SAP client from the server.
+
+Possible errors:
+
+:org.bluez.Error.Failed:
+
+Properties
+----------
+
+boolean Connected [readonly]
+````````````````````````````
+
+Indicates if SAP client is connected to the server.
+
diff --git a/doc/sap-api.txt b/doc/sap-api.txt
deleted file mode 100644
index b28c4e305964..000000000000
--- a/doc/sap-api.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-BlueZ D-Bus Sim Access API description
-**************************************
-
-
-Sim Access Profile hierarchy
-============================
-
-Service		org.bluez
-Interface	org.bluez.SimAccess1
-Object path	[variable prefix]/{hci0,hci1,...}
-
-Methods		void Disconnect()
-
-			Disconnects SAP client from the server.
-
-			Possible errors: org.bluez.Error.Failed
-
-Properties	boolean Connected [readonly]
-
-			Indicates if SAP client is connected to the server.
-- 
2.52.0


