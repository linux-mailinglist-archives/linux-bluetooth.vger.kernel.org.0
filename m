Return-Path: <linux-bluetooth+bounces-19084-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFVRKKlwk2nk4wEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19084-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 16 Feb 2026 20:31:53 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 460421474CC
	for <lists+linux-bluetooth@lfdr.de>; Mon, 16 Feb 2026 20:31:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 83FE8300C033
	for <lists+linux-bluetooth@lfdr.de>; Mon, 16 Feb 2026 19:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10EC82DC767;
	Mon, 16 Feb 2026 19:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VBwgn03x"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CCF236A73
	for <linux-bluetooth@vger.kernel.org>; Mon, 16 Feb 2026 19:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771270308; cv=none; b=f3ywzaH7SCzOOSZrKPL8u0v8T2l9rQkwdxzgH5Xp6FCyvD96AJJZhl36bw3TXE4vc6yRiBk4J/xTdP9dMg8epnmLZT+GpyAHdW7Y3Sk83QcXkmJu74YFpP4zZml8C5p3RDQ5yN+xtLW5tSNPYkQ4arT9830oWlo8MIEdZf5YVMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771270308; c=relaxed/simple;
	bh=tCfMOSeVHKMlN5tfwaCoya3sUE+TCmWQVHCUi39DOcU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Sc41e6ib3lIR3paM4YdlC9+lPiYcbQPzRLnkF48UebQmScEuH8f2vQua+caVr52OpRlSjmXLtwy3WsaE0IK6rSBioiPlXjb3PzjBg1KbcJVAxz9czzW+L8zpI5Y//W1igpRd7Byi0FqbCoM71V2DlJY8I8v5T3/soo3qqhsHy9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VBwgn03x; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771270305;
	bh=tCfMOSeVHKMlN5tfwaCoya3sUE+TCmWQVHCUi39DOcU=;
	h=From:To:Subject:Date:From;
	b=VBwgn03x9w2PffiD99RDCFCqSv/3lUwXcjw1nD84S2kAvNKOszY5ohRg7UsMaKiNQ
	 tzREzspa9OPTAc6qFV6MiO6hPkVPC5KE8MzUt346jKlpusO9qTdvbGfvHBhsUhP+PC
	 0KTP+3r9zIzMbuKzy4i7Fbt4bli2IrUqVBGercaSVPWgD9Jxpd+pvBxxdkMilwR+29
	 AlDT5QA2DkKGnwm3uB1LDAMlqnF54B9Sb+7wsRzN/L0fEGDPG5Z4NK0LlY3wVoYcad
	 KeDzSmHKreOztUTZNGxnFhTPKxcw4EM9rmzQKwK/7hKGP+gBFE5+o9tKrlqjF2LLhx
	 lt9SKJ+2WW5/A==
Received: from fdanis-ThinkPad-X1.. (2A02-8428-af44-1001-4C10-12D9-233c-Cfc3.rev.sfr.net [IPv6:2a02:8428:af44:1001:4c10:12d9:233c:cfc3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: fdanis)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 43C8517E012E
	for <linux-bluetooth@vger.kernel.org>; Mon, 16 Feb 2026 20:31:45 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Danis?= <frederic.danis@collabora.com>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v2 1/3] tools/btpclient: Move btpclient to client/btpclient directory
Date: Mon, 16 Feb 2026 20:31:34 +0100
Message-ID: <20260216193136.292051-1-frederic.danis@collabora.com>
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
X-Spamd-Result: default: False [-0.54 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MIXED_CHARSET(0.63)[subject];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-19084-lists,linux-bluetooth=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[collabora.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[frederic.danis@collabora.com,linux-bluetooth@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 460421474CC
X-Rspamd-Action: no action

This prepares the split of btp services in per profile files for
easier maintenance.
---
 .gitignore                                 |  4 ++--
 Makefile.tools                             | 13 +++++++------
 {tools => client/btpclient}/btpclient.c    |  0
 {tools => client/btpclient}/btpclientctl.c |  0
 4 files changed, 9 insertions(+), 8 deletions(-)
 rename {tools => client/btpclient}/btpclient.c (100%)
 rename {tools => client/btpclient}/btpclientctl.c (100%)

diff --git a/.gitignore b/.gitignore
index ea895c064..71ef28e1e 100644
--- a/.gitignore
+++ b/.gitignore
@@ -133,8 +133,8 @@ tools/btattach
 tools/btconfig
 tools/btmgmt
 tools/btsnoop
-tools/btpclient
-tools/btpclientctl
+client/btpclient/btpclient
+client/btpclient/btpclientctl
 tools/btmon-logger
 tools/bluetooth-logger.service
 tools/mpris-proxy.service
diff --git a/Makefile.tools b/Makefile.tools
index 4f4ee88de..edfb5282c 100644
--- a/Makefile.tools
+++ b/Makefile.tools
@@ -583,14 +583,15 @@ test_scripts += test/bluezutils.py \
 		test/test-gatt-profile test/test-mesh test/agent.py
 
 if BTPCLIENT
-noinst_PROGRAMS += tools/btpclient tools/btpclientctl
+noinst_PROGRAMS += client/btpclient/btpclient client/btpclient/btpclientctl
 
-tools_btpclient_SOURCES = tools/btpclient.c src/shared/btp.c src/shared/btp.h
-tools_btpclient_LDADD = lib/libbluetooth-internal.la \
+client_btpclient_btpclient_SOURCES = client/btpclient/btpclient.c \
+				src/shared/btp.c src/shared/btp.h
+client_btpclient_btpclient_LDADD = lib/libbluetooth-internal.la \
 				src/libshared-ell.la $(ell_ldadd)
-tools/btpclient.$(OBJEXT): src/libshared-ell.la ell/internal
+client/btpclient/btpclient.$(OBJEXT): src/libshared-ell.la ell/internal
 
-tools_btpclientctl_SOURCES = tools/btpclientctl.c client/display.c
-tools_btpclientctl_LDADD = src/libshared-mainloop.la src/libshared-glib.la \
+client_btpclient_btpclientctl_SOURCES = client/btpclient/btpclientctl.c client/display.c
+client_btpclient_btpclientctl_LDADD = src/libshared-mainloop.la src/libshared-glib.la \
 				lib/libbluetooth-internal.la -lreadline
 endif
diff --git a/tools/btpclient.c b/client/btpclient/btpclient.c
similarity index 100%
rename from tools/btpclient.c
rename to client/btpclient/btpclient.c
diff --git a/tools/btpclientctl.c b/client/btpclient/btpclientctl.c
similarity index 100%
rename from tools/btpclientctl.c
rename to client/btpclient/btpclientctl.c
-- 
2.43.0


