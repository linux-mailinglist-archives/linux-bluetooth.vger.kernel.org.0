Return-Path: <linux-bluetooth+bounces-18481-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHPJLSzyeGmGuAEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18481-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:13:16 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F982984CB
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:13:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EC10D30039A1
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 17:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C88A0361DB3;
	Tue, 27 Jan 2026 17:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GOaJ9wAc"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AA43164C3
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 17:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769533994; cv=none; b=WRzyRXPmKxwaPgiJCu2aWqScPz+SDPQLBORRORktYqznlgiZ7+VQ1DPB9BjXNL2ytFp72RKo3w7R1YThZFQv2ARl6d94zKqani0Wzen49FNK+ECXuqdEa4XSUtW2/LvLt5cKb/T9JA7WW+PEOdWHBD3Yxy6ym0PjlkmOUUPTEn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769533994; c=relaxed/simple;
	bh=vRiqzp9Sl4ErRLjfcFjGruGsCchFE1iwgCEshue9DEA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rFqAls5nEK1YxHf9oALNjSiOjpuRNQQnaR2wrLTsrV6L3OeRx10UDQ4UDLTBI9/UAzlb1x5oT1g2Z9l//sLnsExcC32EiQH6hjh2AS6wKWDXQkbjfsCkUUU0XYZK3qUqdfyjZhua3WvqX8e4QBrKDzpYjMcJh/ej3kVs6EgKams=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GOaJ9wAc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769533990;
	bh=vRiqzp9Sl4ErRLjfcFjGruGsCchFE1iwgCEshue9DEA=;
	h=From:To:Subject:Date:From;
	b=GOaJ9wAc9QquB+zzpH/oLGA7M38t5g0jsbWe1Vja/I9OCTenz/Np8fLiU4mlD8EXu
	 HVyxW5tGxLF3QRss6ItXNC/FKpPSPzoQbed/LfGC6nvoxYyPApAt1EGQr6IYMb+tXz
	 bpujYd0GbG55vM7WFSSJesGPN9aIhNlWxZA+oxCqhKV5K/z89efzIIIccOKmvUcplc
	 SXEK6v4Loq7GeULfPE4+WeWvyZ1vOxFu25dPUdPxCz5VbE0v2yKQGqGbgIwhCnma/C
	 cwT1VKGdhSbGsuYSAGL2juZhs9Rwkar4zvi3oLhVXtaE+xY3MH3dBNihABL3v8Kfju
	 5xZtbPUyE8i/w==
Received: from fdanis-ThinkPad-X1.. (2A02-8428-af44-1001-871c-6E70-d798-dFC2.rev.sfr.net [IPv6:2a02:8428:af44:1001:871c:6e70:d798:dfc2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: fdanis)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BEF0E17E00AC
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 18:13:10 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Danis?= <frederic.danis@collabora.com>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ] doc/qualification: Add PICS and howto for the RFComm qualification
Date: Tue, 27 Jan 2026 18:13:06 +0100
Message-ID: <20260127171306.151311-1-frederic.danis@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.49 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MIXED_CHARSET(0.67)[subject];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-18481-lists,linux-bluetooth=lfdr.de];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[frederic.danis@collabora.com,linux-bluetooth@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7F982984CB
X-Rspamd-Action: no action

---
 doc/qualification/rfcomm-pics.rst | 106 ++++++++++++++++++++++++++++++
 doc/qualification/rfcomm-pts.rst  |  58 ++++++++++++++++
 2 files changed, 164 insertions(+)
 create mode 100644 doc/qualification/rfcomm-pics.rst
 create mode 100644 doc/qualification/rfcomm-pts.rst

diff --git a/doc/qualification/rfcomm-pics.rst b/doc/qualification/rfcomm-pics.rst
new file mode 100644
index 000000000..5ab1b07be
--- /dev/null
+++ b/doc/qualification/rfcomm-pics.rst
@@ -0,0 +1,106 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+.. Copyright © 2025-2026 Collabora Ltd.
+
+===============
+RFComm Protocol
+===============
+(TCRL pkg101, RFCOMM.ICS.p8)
+
+
+Versions
+========
+**Table 0: X.Y Versions**
+
++------------------+----------+----------------------------------------------+
+| Parameter Name   | Selected | Description                                  |
++==================+==========+==============================================+
+| TSPC_RFCOMM_0_1  |          | RFCOMM v1.1 with TS 07.10 (C.1)              |
++------------------+----------+----------------------------------------------+
+| TSPC_RFCOMM_0_2  | x        | RFCOMM v1.2 with TS 07.10 (C.1)              |
++------------------+----------+----------------------------------------------+
+
+- C.1: Mandatory to support one and only one.
+
+Core Configuration
+==================
+**Table 0a: Core Configuration Requirements**
+
++------------------+----------+----------------------------------------------+
+| Parameter Name   | Selected | Description                                  |
++==================+==========+==============================================+
+| TSPC_RFCOMM_0a_1 | x        | Protocol supported over BR/EDR (C.1, C.3)    |
++------------------+----------+----------------------------------------------+
+| TSPC_RFCOMM_0a_2 |          | 2 Protocol supported over LE (C.2)           |
++------------------+----------+----------------------------------------------+
+
+- C.1: Excluded for this Protocol IF CORE 41/2 “LE Core Configuration”.
+- C.2: Excluded for this Protocol.
+- C.3: Mandatory for this Protocol.
+
+2.3 Supported procedures
+========================
+**Table 1: Supported Procedures**
+
++------------------+----------+----------------------------------------------+
+| Parameter Name   | Selected | Description                                  |
++==================+==========+==============================================+
+| TSPC_RFCOMM_1_1  | x        | Initialize RFCOMM Session (C.5)              |
++------------------+----------+----------------------------------------------+
+| TSPC_RFCOMM_1_2  | x        | Respond to Initialization of an RFCOMM       |
+|                  |          | Session (C.5)                                |
++------------------+----------+----------------------------------------------+
+| TSPC_RFCOMM_1_3  | x        | Shutdown RFCOMM Session (M)                  |
++------------------+----------+----------------------------------------------+
+| TSPC_RFCOMM_1_4  | x        | Respond to a Shutdown of an RFCOMM Session   |
+|                  |          | (M)                                          |
++------------------+----------+----------------------------------------------+
+| TSPC_RFCOMM_1_5  | x        | Establish DLC (C.2)                          |
++------------------+----------+----------------------------------------------+
+| TSPC_RFCOMM_1_6  | x        | Respond to Establishment of a DLC (C.1)      |
++------------------+----------+----------------------------------------------+
+| TSPC_RFCOMM_1_7  | x        | Disconnect DLC (M)                           |
++------------------+----------+----------------------------------------------+
+| TSPC_RFCOMM_1_8  | x        | Respond to Disconnection of a DLC (M)        |
++------------------+----------+----------------------------------------------+
+| TSPC_RFCOMM_1_9  | x        | Respond to and send MSC Command (M)          |
++------------------+----------+----------------------------------------------+
+| TSPC_RFCOMM_1_10 | x        | Initiate Transfer Information (M)            |
++------------------+----------+----------------------------------------------+
+| TSPC_RFCOMM_1_11 | x        | Respond to Test Command (M)                  |
++------------------+----------+----------------------------------------------+
+| TSPC_RFCOMM_1_12 | x        | Send Test Command (O)                        |
++------------------+----------+----------------------------------------------+
+| TSPC_RFCOMM_1_13 | x        | React to Aggregate Flow Control (M)          |
++------------------+----------+----------------------------------------------+
+| TSPC_RFCOMM_1_14 | x        | Respond to RLS Command (M)                   |
++------------------+----------+----------------------------------------------+
+| TSPC_RFCOMM_1_15 |          | Send RLS Command (O)                         |
++------------------+----------+----------------------------------------------+
+| TSPC_RFCOMM_1_16 | x        | Respond to PN Command (M)                    |
++------------------+----------+----------------------------------------------+
+| TSPC_RFCOMM_1_17 | x        | Send PN Command (C.3)                        |
++------------------+----------+----------------------------------------------+
+| TSPC_RFCOMM_1_18 | x        | Send Non-Supported Command (NSC) response    |
+|                  |          | (C.4)                                        |
++------------------+----------+----------------------------------------------+
+| TSPC_RFCOMM_1_19 | x        | Respond to RPN Command (M)                   |
++------------------+----------+----------------------------------------------+
+| TSPC_RFCOMM_1_20 | x        | Send RPN Command (O)                         |
++------------------+----------+----------------------------------------------+
+| TSPC_RFCOMM_1_21 | x        | Closing Multiplexer by First Sending a DISC  |
+|                  |          | Command (O)                                  |
++------------------+----------+----------------------------------------------+
+| TSPC_RFCOMM_1_22 | x        | Support of Credit Based Flow Control (M)     |
++------------------+----------+----------------------------------------------+
+
+- M: Mandatory
+- O: Optional
+- C.1: Mandatory IF RFCOMM 1/2 “Respond to Initialization of an RFCOMM
+  Session”, otherwise Excluded.
+- C.2: Mandatory IF RFCOMM 1/1 “Initialize RFCOMM Session”, otherwise
+  Excluded.
+- C.3: Mandatory IF RFCOMM 1/1 “Initialize RFCOMM Session”, otherwise
+  Optional.
+- C.4: Mandatory IF RFCOMM 0/2 “RFCOMM v1.2 with TS 07.10”, otherwise
+  Optional.
+- C.5: Mandatory to support at least one.
\ No newline at end of file
diff --git a/doc/qualification/rfcomm-pts.rst b/doc/qualification/rfcomm-pts.rst
new file mode 100644
index 000000000..860ef6508
--- /dev/null
+++ b/doc/qualification/rfcomm-pts.rst
@@ -0,0 +1,58 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+.. Copyright © 2025-2026 Collabora Ltd.
+
+===================
+RFComm test results
+===================
+
+:PTS version: 8.5.2 Build 5
+
+Setup
+=====
+
+- Remove PTS device from Bluetooth devices
+- Update "TSPX_server_channel_iut" in IXIT to "10"
+
+Tests
+=====
+
+The kernel and BlueZ versions represent the oldest version without backport
+for which we know the test passed.
+
++------------------------------+----------+---------+-------+-------------------------------------------------------------------------+
+| Test name                    | Result   | Kernel  | BlueZ |                                                                         |
++==============================+==========+=========+=======+=========================================================================+
+| RFCOMM/DEVA/RFC/BV-01-C      | PASS     |     6.1 | 5.69  | Run 'rctest -n -U spp <BD_ADDR>' upon request                           |
++------------------------------+----------+---------+-------+-------------------------------------------------------------------------+
+| RFCOMM/DEVA/RFC/BV-05-C      | PASS     |     6.1 | 5.69  | Run 'rctest -n -U spp <BD_ADDR>' upon request                           |
++------------------------------+----------+---------+-------+-------------------------------------------------------------------------+
+| RFCOMM/DEVB/RFC/BV-02-C      | PASS     |     6.1 | 5.69  |                                                                         |
++------------------------------+----------+---------+-------+-------------------------------------------------------------------------+
+| RFCOMM/DEVB/RFC/BV-06-C      | PASS     |     6.1 | 5.69  | Run 'rctest -r -U spp -P 16' before starting the test                   |
++------------------------------+----------+---------+-------+-------------------------------------------------------------------------+
+| RFCOMM/DEVA-DEVB/RFC/BV-03-C | PASS     |     6.1 | 5.69  |                                                                         |
++------------------------------+----------+---------+-------+-------------------------------------------------------------------------+
+| RFCOMM/DEVA-DEVB/RFC/BV-04-C | PASS     |     6.1 | 5.69  | Run 'rctest -r -U spp -P 16' before starting the test                   |
+|                              |          |         |       |                                                                         |
+|                              |          |         |       | Kill rctest upon request                                                |
++------------------------------+----------+---------+-------+-------------------------------------------------------------------------+
+| RFCOMM/DEVA-DEVB/RFC/BV-07-C | PASS     |     6.1 | 5.69  | Run 'rctest -r -U spp -P 16' before starting the test                   |
+|                              |          |         |       |                                                                         |
+|                              |          |         |       | Kill rctest upon request                                                |
++------------------------------+----------+---------+-------+-------------------------------------------------------------------------+
+| RFCOMM/DEVA-DEVB/RFC/BV-08-C | PASS     |     6.1 | 5.69  | Run 'rctest -r -U spp -P 16' before starting the test                   |
++------------------------------+----------+---------+-------+-------------------------------------------------------------------------+
+| RFCOMM/DEVA-DEVB/RFC/BV-11-C | PASS     |     6.1 | 5.69  |                                                                         |
++------------------------------+----------+---------+-------+-------------------------------------------------------------------------+
+| RFCOMM/DEVA-DEVB/RFC/BV-13-C | PASS     |     6.1 | 5.69  | Run 'rctest -r -U spp -P 16' before starting the test                   |
++------------------------------+----------+---------+-------+-------------------------------------------------------------------------+
+| RFCOMM/DEVA-DEVB/RFC/BV-15-C | PASS     |     6.1 | 5.69  | Run 'rctest -r -U spp -P 16' before starting the test                   |
++------------------------------+----------+---------+-------+-------------------------------------------------------------------------+
+| RFCOMM/DEVA-DEVB/RFC/BV-17-C | PASS     |     6.1 | 5.69  |                                                                         |
++------------------------------+----------+---------+-------+-------------------------------------------------------------------------+
+| RFCOMM/DEVA-DEVB/RFC/BV-19-C | PASS     |     6.1 | 5.69  |                                                                         |
++------------------------------+----------+---------+-------+-------------------------------------------------------------------------+
+| RFCOMM/DEVA-DEVB/RFC/BV-21-C | PASS     |     6.1 | 5.69  | Run 'rctest -w -U spp -P 16' before starting the test                   |
++------------------------------+----------+---------+-------+-------------------------------------------------------------------------+
+| RFCOMM/DEVA-DEVB/RFC/BV-22-C | PASS     |     6.1 | 5.69  | Run 'rctest -w -U spp -P 16' before starting the test                   |
++------------------------------+----------+---------+-------+-------------------------------------------------------------------------+
-- 
2.43.0


