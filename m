Return-Path: <linux-bluetooth+bounces-1306-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E35183AE38
	for <lists+linux-bluetooth@lfdr.de>; Wed, 24 Jan 2024 17:20:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2667028E178
	for <lists+linux-bluetooth@lfdr.de>; Wed, 24 Jan 2024 16:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705117E56F;
	Wed, 24 Jan 2024 16:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QaKjSaeV"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8647CF13
	for <linux-bluetooth@vger.kernel.org>; Wed, 24 Jan 2024 16:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706113209; cv=none; b=aTZoU1x2WlWe0e8YO996Zvu/dVzFnTIRemRHRYC6IEWG0+4rl4z13xQ6lA/1jSTw4W44dX7ia2ySb8/+CwdG+m2EH4Fx0ZE0/YWTzM8Hd8yAiztSc6wfYOvMPKcfqavPxDqKjwnm+3dXF+r0m/lwzR/LWbScfMNkhdi3zQqEM0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706113209; c=relaxed/simple;
	bh=nYjIj9mFg0XPO6eD8avdS6ju051Y+btg3OIofHJnQJI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dfv8NO6lVtxXTGn66hEGaD2Tcb8INKT5Y6ki0iB961fZ0iIiuzqzA+il55FlfWN7xSqaRA0kChLeUjCxt8dFQ4DVyQf+RBCfQCg6sVwqgWcIbDnfkroMn/jGr8XxAFCpTmx+DugAN+II6IkeplwAd09xWF1jragmKAQmsjMIwxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QaKjSaeV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83F64C43399;
	Wed, 24 Jan 2024 16:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706113209;
	bh=nYjIj9mFg0XPO6eD8avdS6ju051Y+btg3OIofHJnQJI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QaKjSaeVYFkDw30EwDphXIHWD0wWtcO8EZiVxHR7OEQ7jM0cuEc0ptwz8XKAijjGn
	 6Aoob+yh8l9Y5hoGcBLlW9tq2G1W+8abxFcZX20br7frOZXNz5PQhQ5oQGTtX3zJCD
	 KmmYCNSk3RG46dS53XL7T6g1R9dwL+rdtRmnzjNKeVPZwXFxTT0Ujveu8C4Gi/8TRr
	 V3SRUJgf5geHBliZQJoKW7aOM4jo8SP7fBR7Q4UbuUyeB/+nr7CdDV9IOw0AJzPl/u
	 pm6POKDzd5xJtNj0jT4nbLf1syUt2QCiaR87O4dRcg/s/xTzDgiULXo4xWM5882IJZ
	 lccJCZpzmnO9g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69AA1C47E49;
	Wed, 24 Jan 2024 16:20:09 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Wed, 24 Jan 2024 16:20:08 +0000
Subject: [PATCH BlueZ v2 3/6] build: remove explicit DEPENDENCIES handling
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240124-autofoo-v2-3-a210f20aa2f7@gmail.com>
References: <20240124-autofoo-v2-0-a210f20aa2f7@gmail.com>
In-Reply-To: <20240124-autofoo-v2-0-a210f20aa2f7@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: Emil Velikov <emil.velikov@collabora.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706113208; l=3025;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=JrsU9g6AXb7Bhq8yPPPYd9jsTdmPlc07IpOnB/yJWMM=;
 b=IrtjBrbiSLux8sKZ6n/4nwBPQXbLVvgZC+a4beFdcHcoKUAR2CQGVgayJXZ6OdbosaQa2zCso
 bN904k8oZ7KCbuOLpFpPwgqEjOyYLNEXXmzO5qc0KGEYf4yvQUKpxHJ
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received:
 by B4 Relay for emil.l.velikov@gmail.com/20230301 with auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: <emil.l.velikov@gmail.com>

From: Emil Velikov <emil.velikov@collabora.com>

We currently duplicate the DEPENDENCIES handling that autotools does for
us. We have two types of objects - libraries or generated headers.

Former are part of the LDADD, the latter in BUILT_SOURCES.
---
 Makefile.am    | 7 -------
 Makefile.mesh  | 1 -
 Makefile.tools | 2 --
 3 files changed, 10 deletions(-)

diff --git a/Makefile.am b/Makefile.am
index be8f74f13..b913402b3 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -83,7 +83,6 @@ lib_LTLIBRARIES += lib/libbluetooth.la
 
 lib_libbluetooth_la_SOURCES = $(lib_headers) $(lib_sources)
 lib_libbluetooth_la_LDFLAGS = $(AM_LDFLAGS) -version-info 22:12:19
-lib_libbluetooth_la_DEPENDENCIES = $(local_headers)
 endif
 
 noinst_LTLIBRARIES += lib/libbluetooth-internal.la
@@ -100,12 +99,10 @@ gdbus_libgdbus_internal_la_SOURCES = gdbus/gdbus.h \
 if EXTERNAL_ELL
 ell_cflags = @ELL_CFLAGS@
 ell_ldadd = @ELL_LIBS@
-ell_dependencies =
 ell_built_sources = ell/shared
 else
 ell_cflags =
 ell_ldadd = ell/libell-internal.la
-ell_dependencies = $(ell_ldadd)
 ell_built_sources = ell/shared ell/internal ell/ell.h
 
 noinst_LTLIBRARIES += ell/libell-internal.la
@@ -339,10 +336,6 @@ src_bluetoothd_LDADD = lib/libbluetooth-internal.la \
 src_bluetoothd_LDFLAGS = $(AM_LDFLAGS) -Wl,--export-dynamic \
 				-Wl,--version-script=$(srcdir)/src/bluetooth.ver
 
-src_bluetoothd_DEPENDENCIES = lib/libbluetooth-internal.la \
-				gdbus/libgdbus-internal.la \
-				src/libshared-glib.la
-
 src_bluetoothd_CPPFLAGS = $(AM_CPPFLAGS) -DBLUETOOTH_PLUGIN_BUILTIN \
 					-DPLUGINDIR=\""$(build_plugindir)"\" \
 					$(BACKTRACE_CFLAGS) $(builtin_cppflags)
diff --git a/Makefile.mesh b/Makefile.mesh
index a66e47442..45fa90339 100644
--- a/Makefile.mesh
+++ b/Makefile.mesh
@@ -45,7 +45,6 @@ mesh/main.$(OBJEXT): src/builtin.h lib/bluetooth/bluetooth.h
 
 mesh_bluetooth_meshd_SOURCES = $(mesh_sources) mesh/main.c
 mesh_bluetooth_meshd_LDADD = src/libshared-ell.la $(ell_ldadd) -ljson-c
-mesh_bluetooth_meshd_DEPENDENCIES = $(ell_dependencies) src/libshared-ell.la
 
 if MANPAGES
 man_MANS += mesh/bluetooth-meshd.8
diff --git a/Makefile.tools b/Makefile.tools
index 6fda3f51d..1cde39f94 100644
--- a/Makefile.tools
+++ b/Makefile.tools
@@ -71,7 +71,6 @@ pkglibexec_PROGRAMS += tools/btmon-logger
 
 tools_btmon_logger_SOURCES = tools/btmon-logger.c
 tools_btmon_logger_LDADD = src/libshared-mainloop.la
-tools_btmon_logger_DEPENDENCIES = src/libshared-mainloop.la
 
 if SYSTEMD
 systemdsystemunit_DATA += tools/bluetooth-logger.service
@@ -577,7 +576,6 @@ noinst_PROGRAMS += tools/btpclient tools/btpclientctl
 tools_btpclient_SOURCES = tools/btpclient.c src/shared/btp.c src/shared/btp.h
 tools_btpclient_LDADD = lib/libbluetooth-internal.la \
 				src/libshared-ell.la $(ell_ldadd)
-tools_btpclient_DEPENDENCIES = lib/libbluetooth-internal.la $(ell_dependencies)
 tools/btpclient.$(OBJEXT): src/libshared-ell.la ell/internal
 
 tools_btpclientctl_SOURCES = tools/btpclientctl.c client/display.c

-- 
2.43.0


