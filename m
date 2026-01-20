Return-Path: <linux-bluetooth+bounces-18241-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +K7kAHWwb2nMKgAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18241-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jan 2026 17:42:29 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 942C247D40
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jan 2026 17:42:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BC6FC706248
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jan 2026 16:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 975CB44A708;
	Tue, 20 Jan 2026 16:08:25 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6009449ECD
	for <linux-bluetooth@vger.kernel.org>; Tue, 20 Jan 2026 16:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768925305; cv=none; b=Ra5sOa2vOKC2ugSSr/0J5zHQr2DH6iTfu9eB9OWpGe8AJmEEvoS2mqMJvN9beDvhvjwLIVdBpTbIYHXDia4b7GkyH2ri6K2n2CsodZKLMpHBKHFTcPiBjbVRyCtvcySlNwF0Jx4RNzAva78K8NQqODZeESAnNU+eClUZoZxhiXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768925305; c=relaxed/simple;
	bh=g47PqoA6WThSWQUbNYLpFQVlYB+SL/16LRsd/qC+kgY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YXSvdR4ZBLbTJEZ2y3jO8CYDhseduOCGFHMp3E3NsqDFB1scn4tllbR/QskBhha1Qt+Gu+6N3ig+idcBhWeZI1rTYeD4mqHRPl7ENtcTgc3QvgyIE44+gLTQ6NsjfQof+dvpMSQKH3KK4/aZKLUtun7mYOrFFkMFmHSiW+8IwGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 53C7E4435E
	for <linux-bluetooth@vger.kernel.org>; Tue, 20 Jan 2026 16:08:21 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-bluetooth@vger.kernel.org
Subject: [BlueZ 5/7] doc: Port sap-api.txt to RST
Date: Tue, 20 Jan 2026 17:05:51 +0100
Message-ID: <20260120160811.3394320-6-hadess@hadess.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120160811.3394320-1-hadess@hadess.net>
References: <20260120160811.3394320-1-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugedtkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpedvffeiveehfedufeeuveekgeegteetudegfedutedvtdfghedutdduhfdtheevleenucffohhmrghinhepsghluhgviidrtggrlhhlnecukfhppedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemsggrgeefmegrieejieemtgdvugefmeejrgehfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemsggrgeefmegrieejieemtgdvugefmeejrgehfedphhgvlhhopeholhhimhhpihgtpdhmrghilhhfrhhomhephhgruggvshhssehhrgguvghsshdrnhgvthdpqhhiugepheefveejgfeggeefhefgpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdgslhhuvghtohhothhhsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-State: clean
X-GND-Score: 0
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
	TAGGED_FROM(0.00)[bounces-18241-lists,linux-bluetooth=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FROM_NEQ_ENVFROM(0.00)[hadess@hadess.net,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_NONE(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hadess.net:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,tieto.com:email]
X-Rspamd-Queue-Id: 942C247D40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---
 Makefile.am                 |  5 +++++
 doc/org.bluez.SimAccess.rst | 40 +++++++++++++++++++++++++++++++++++++
 doc/sap-api.txt             | 20 -------------------
 3 files changed, 45 insertions(+), 20 deletions(-)
 create mode 100644 doc/org.bluez.SimAccess.rst
 delete mode 100644 doc/sap-api.txt

diff --git a/Makefile.am b/Makefile.am
index d80c1250a417..716bf96da413 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -402,6 +402,8 @@ man_MANS += doc/org.bluez.Telephony.5 doc/org.bluez.Call.5
 man_MANS += doc/org.bluez.ThermometerManager.5 \
 		doc/org.bluez.Thermometer.5 \
 		doc/org.bluez.ThermometerWatcher.5
+man_MANS += doc/org.bluez.SimAccess.5
+
 endif
 manual_pages += src/bluetoothd.8
 manual_pages += doc/hci.7 doc/mgmt.7 doc/l2cap.7 doc/rfcomm.7 doc/sco.7 \
@@ -442,6 +444,7 @@ manual_pages += doc/org.bluez.Telephony.5 doc/org.bluez.Call.5
 manual_pages += doc/org.bluez.ThermometerManager.5 \
 		doc/org.bluez.Thermometer.5 \
 		doc/org.bluez.ThermometerWatcher.5
+manual_pages += doc/org.bluez.SimAccess.5
 
 EXTRA_DIST += src/genbuiltin src/bluetooth.conf \
 			src/main.conf profiles/network/network.conf \
@@ -532,6 +535,8 @@ EXTRA_DIST += doc/org.bluez.ThermometerManager.rst \
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


