Return-Path: <linux-bluetooth+bounces-18487-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDOCD1TzeGmGuAEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18487-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:18:12 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C21D7985E8
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:18:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 39F613018437
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 17:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79459286D64;
	Tue, 27 Jan 2026 17:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jTj4nKT8"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5EB253F11
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 17:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769534217; cv=none; b=IMf7cvITR8bW1DOhpk7FSQvNWic+AwHRReMrLVIw2wMZlEgngCoJBKCt13M4kw4hVUJbcXfBg/S95fBM2pmxaKybZxEBxiYNcPj/6imx9jSbS+ruGuqn9pwmaNqfUV92hfM6baxJ+H7gJQy9rmXr7oH4wxzMfjBYWkk9zpYmGWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769534217; c=relaxed/simple;
	bh=PelUspsn9uQ/pome5Ge4DRVs9Phi39AdUtiTIM7d6a8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Sg3al3pYGcSGesvnOfPHmET2lUs4vuTf/853IkCme6Wj/98Kmmk/eoSvxdJBjAHzninXm7cN6sG/AFhoA4XiKO0+wDlYX7VgoYX3z80FljD2PTtGjF86EgH4V4jPDFbrfZfvBf8/p2mLqvtgwcieJzxhdAYOYRXCxSKhxA+r6Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jTj4nKT8; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769534214;
	bh=PelUspsn9uQ/pome5Ge4DRVs9Phi39AdUtiTIM7d6a8=;
	h=From:To:Subject:Date:From;
	b=jTj4nKT8yL/3PDZ7hmOWCnqm9O78g7wlGeQ2LX5hc4j+gcTDrS1uyS71BcTkGPV0D
	 Py6gf7d0Lsr4ywQpyxHf9/ccO4sJO0ACLYiZsan+vZF2hu4q+CNhSz40ZoR2K5OcPR
	 sLoiAHtlBuebhFRLlCZW4HD+uaR4TVUQ4bzZegK0mO7ygz24p9Mwzyz2vBqEzUUzo/
	 3w4sF5KqvjjnRsSc5CGlO5exyKodNRr/W5whtqDk7UQ4wGrqr3OUULzP8iMni3/Im3
	 xCQ39nEYMX5rqIMtAJDfll6EaNoTtqM+qNZhJ8kbJf4Gbe6olAnKSAj1vMHAkyxIbZ
	 CPfatejb26LPQ==
Received: from fdanis-ThinkPad-X1.. (2A02-8428-aF44-1001-871c-6E70-D798-dfC2.rev.sfr.net [IPv6:2a02:8428:af44:1001:871c:6e70:d798:dfc2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: fdanis)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D630917E0117
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 18:16:53 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Danis?= <frederic.danis@collabora.com>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ] doc/qualification: Add PICS and howto for the IOPT qualification
Date: Tue, 27 Jan 2026 18:16:48 +0100
Message-ID: <20260127171648.151717-1-frederic.danis@collabora.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-18487-lists,linux-bluetooth=lfdr.de];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[frederic.danis@collabora.com,linux-bluetooth@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:mid,collabora.com:dkim]
X-Rspamd-Queue-Id: C21D7985E8
X-Rspamd-Action: no action

---
 doc/qualification/iopt-pics.rst | 37 ++++++++++++++++
 doc/qualification/iopt-pts.rst  | 75 +++++++++++++++++++++++++++++++++
 2 files changed, 112 insertions(+)
 create mode 100644 doc/qualification/iopt-pics.rst
 create mode 100644 doc/qualification/iopt-pts.rst

diff --git a/doc/qualification/iopt-pics.rst b/doc/qualification/iopt-pics.rst
new file mode 100644
index 000000000..2dab3c25d
--- /dev/null
+++ b/doc/qualification/iopt-pics.rst
@@ -0,0 +1,37 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+.. Copyright © 2025-2026 Collabora Ltd.
+
+===========================
+Interoperability Test Suite
+===========================
+(TCRL 2023-1)
+
+Interoperability
+================
+**Table 1: Interoperability Test Specification**
+
++------------------+----------+----------------------------------------------+
+| Parameter Name   | Selected | Description                                  |
++==================+==========+==============================================+
+| TSPC_IOPT_1_1    | x        | Interoperability (M)                         |
++------------------+----------+----------------------------------------------+
+
+- M: Mandatory
+
+Interoperability
+================
+**Table 2: Design Configuration**
+
++------------------+----------+----------------------------------------------+
+| Parameter Name   | Selected | Description                                  |
++==================+==========+==============================================+
+| TSPC_IOPT_2_1    | x        | BR/EDR (C.1, C.2)                            |
++------------------+----------+----------------------------------------------+
+| TSPC_IOPT_2_2    | x        | LE (C.1, C.2)                                |
++------------------+----------+----------------------------------------------+
+| TSPC_IOPT_2_3    | x        | BR/EDR/LE (C.3)                              |
++------------------+----------+----------------------------------------------+
+
+- C.1: Mandatory to support at least one transport.
+- C.2: Mandatory If IOP 2/3 "BR/EDR/LE" is Supported, otherwise Optional.
+- C.3: Mandatory if IOP 2/1 "BR/EDR" AND IOP 2/2 "LE" is Supported, otherwise Excluded.
diff --git a/doc/qualification/iopt-pts.rst b/doc/qualification/iopt-pts.rst
new file mode 100644
index 000000000..13f05d460
--- /dev/null
+++ b/doc/qualification/iopt-pts.rst
@@ -0,0 +1,75 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+.. Copyright © 2025-2026 Collabora Ltd.
+
+=================
+IOPT test results
+=================
+
+:PTS version: 8.5.3 Build 4
+
+Setup
+=====
+
+- Remove PTS device from Bluetooth devices
+
+- In ICS select:
+
+  - TSPC_support_AdvancedAudioDistributionProfile_Sink
+
+  - TSPC_support_AdvancedAudioDistributionProfile_Source
+
+  - TSPC_support_AVRemoteControlProfile_CT
+
+  - TSPC_support_AVRemoteControlProfile_TG
+
+  - TSPC_support_HeadsetProfile_AG
+
+  - TSPC_support_SerialPortProfile_Service
+
+Tests
+=====
+
+The kernel and BlueZ versions represent the oldest version without backport
+for which we know the test passed.
+
++----------------------+----------+---------+-------+-------------------------------------------------------------------------+
+| Test name            | Result   | Kernel  | BlueZ |                                                                         |
++======================+==========+=========+=======+=========================================================================+
+| IOPT/SR/COD/BV-01-I  | PASS     |     6.1 | 5.69  | Pre-condition:                                                          |
+|                      |          |         |       |                                                                         |
+|                      |          |         |       | - Start '$ bluetoothctl'                                                |
+|                      |          |         |       |                                                                         |
+|                      |          |         |       |   - [bluetooth]# discoverable on                                        |
++----------------------+----------+---------+-------+-------------------------------------------------------------------------+
+| IOPT/SR/SDSS/BV-02-I | PASS     |     6.1 | 5.69  | Pre-condition:                                                          |
+|                      |          |         |       |                                                                         |
+|                      |          |         |       | - Start '$ bluetoothctl'                                                |
+|                      |          |         |       |                                                                         |
+|                      |          |         |       |   - [bluetooth]# discoverable on                                        |
+|                      |          |         |       |                                                                         |
+|                      |          |         |       | - Run in a second terminal:                                             |
+|                      |          |         |       |                                                                         |
+|                      |          |         |       |   - python ./test-profile -u spp -s -C 10                               |
++----------------------+----------+---------+-------+-------------------------------------------------------------------------+
+| IOPT/SR/SDAS/BV-03-I | PASS     |     6.1 | 5.69  | Pre-condition:                                                          |
+|                      |          |         |       |                                                                         |
+|                      |          |         |       | - Start '$ bluetoothctl'                                                |
+|                      |          |         |       |                                                                         |
+|                      |          |         |       |   - [bluetooth]# discoverable on                                        |
+|                      |          |         |       |                                                                         |
+|                      |          |         |       | - Run in a second terminal:                                             |
+|                      |          |         |       |                                                                         |
+|                      |          |         |       |   - python ./test-profile -u spp -s -C 10                               |
++----------------------+----------+---------+-------+-------------------------------------------------------------------------+
+| IOPT/CL/SDR/BV-04-I  | PASS     |     6.1 | 5.69  | Pre-condition:                                                          |
+|                      |          |         |       |                                                                         |
+|                      |          |         |       | - Remove PTS device from Bluetooth devices                              |
+|                      |          |         |       |                                                                         |
+|                      |          |         |       | - Start '$ bluetoothctl'                                                |
+|                      |          |         |       +-------------------------------------------------------------------------+
+|                      |          |         |       | - Pair PTS device                                                       |
+|                      |          |         |       |                                                                         |
+|                      |          |         |       | - Check UUIDs in bluetoothctl: A2DP (110A, 110B), AVRCP (110C),         |
+|                      |          |         |       |   HID (1124), HFP (111E, 111F), HSP(1112), OPP(1105), SAP(112D),        |
+|                      |          |         |       |   SPP(1101)                                                             |
++----------------------+----------+---------+-------+-------------------------------------------------------------------------+
-- 
2.43.0


