Return-Path: <linux-bluetooth+bounces-1964-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADC4858A04
	for <lists+linux-bluetooth@lfdr.de>; Sat, 17 Feb 2024 00:14:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C75292898E8
	for <lists+linux-bluetooth@lfdr.de>; Fri, 16 Feb 2024 23:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1302615099E;
	Fri, 16 Feb 2024 23:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pwlKbTTr"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76641148FEE
	for <linux-bluetooth@vger.kernel.org>; Fri, 16 Feb 2024 23:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708125072; cv=none; b=nMDoikjT8ZvrB4gW/KUuFsYcVHhbopYbw5oHeOfAWfKbhBVZf8ZCPUnDwSkVfnX87MMOzv/djZVfg6f2nGaDULYfq2qavCRnGYA5hjLDuSjRXEe0lN/ABIwqLq5tu+XI8JHl8R12CFiAddoEmZVqVnpQ5/iqWwGlHqOQheeEVqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708125072; c=relaxed/simple;
	bh=jdj6RR9Uvz2uVZSWh1htG2RbftairBkhz1T3XNTPISs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LMPxxuX5TAsqmTYHDPCSkrtC2zXgqdezv+Wiai/Wzfbpf2ZY9Lx+WrY5Ax6BJUhMn5gIiCfqJYBFz2qzp1ErfSazuiTQZ2+XDP3qm1IDL4zBHLAOdOMwHzQfyFK5KRaA+AK4BVP/2gfPjnFnu/ydOO5Wwf4Ie3C73lues0lAKMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pwlKbTTr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CAB1C433F1;
	Fri, 16 Feb 2024 23:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708125072;
	bh=jdj6RR9Uvz2uVZSWh1htG2RbftairBkhz1T3XNTPISs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pwlKbTTru4klE28Zqq+OdlqoK+Rk1F7VfwgksOl0yz2scug1JtsA4DY47oWL/6VfH
	 OMgdG4BWzFNoYaB1KfAyaaCmLRTrKe02DCHXUjBq+miTuA496GJKzIwxmZYKUXI0DT
	 zDN2KRrdFQnYPWybC/CxHpEI0MuNRG5+6elK37JUOmpOgaoYXkXN0eLpNeJ1LyE//9
	 mcJBwmZx10qvhE3W8m0jdYPiI7sFVkyj1Qrz77eJloTcfRtxHUHiNs3LTfG3QYWwKw
	 auvA726+y3OAyn+fGDXOmaPl6YTxG+IkO677M+sf0RyliiZgl5pBxp/BrsFJS8ualP
	 OBXQhUkd2zSWg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB390C48BF5;
	Fri, 16 Feb 2024 23:11:10 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Fri, 16 Feb 2024 23:11:07 +0000
Subject: [PATCH BlueZ v2 03/10] build: handle relative libexecdir instances
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240216-hook-fixup-v2-3-a6b192d1a6ad@gmail.com>
References: <20240216-hook-fixup-v2-0-a6b192d1a6ad@gmail.com>
In-Reply-To: <20240216-hook-fixup-v2-0-a6b192d1a6ad@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708125068; l=4431;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=M8dG4WGwTBNelZE0mmaYpaCLIgmjwOaf+H9CrwRCVeU=;
 b=er6GhItoXdewKjX5ra76BjYrOVcMIZpQlFab+00XXpLZ2Fau3G1tbGSL0xR8VpAQS/nDNuY0R
 9IZMri32XI/D2CApwdGwWoJPmIYNVi1TaGuRnvpNp8NthgbS2CPl/69
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received:
 by B4 Relay for emil.l.velikov@gmail.com/20230301 with auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: <emil.l.velikov@gmail.com>

From: Emil Velikov <emil.l.velikov@gmail.com>

With earlier commit, we've used exec_dir to reference the path of obexd
and bluetoothd within the service files.

At the same time, in my testing I was providing the complete path on the
configure command line. As result, things just worked.

In the default case, the variable contains relative references to ${}
variables, which as result end up literal in the services. Ultimately
the service files were broken.

Document are reuse the existing pattern of manually expanding the
variables.

Closes: https://github.com/bluez/bluez/issues/736

Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
---
 Makefile.am                         |  2 +-
 configure.ac                        | 18 ++++++++++++++++++
 mesh/bluetooth-mesh.service.in      |  2 +-
 obexd/src/obex.service.in           |  2 +-
 obexd/src/org.bluez.obex.service.in |  2 +-
 src/bluetooth.service.in            |  2 +-
 tools/bluetooth-logger.service.in   |  2 +-
 7 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/Makefile.am b/Makefile.am
index 450e931c6..5717c3dac 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -16,7 +16,7 @@ CLEANFILES =
 
 EXTRA_DIST =
 
-pkglibexecdir = $(libexecdir)/bluetooth
+pkglibexecdir = @PKGLIBEXECDIR@
 
 pkglibexec_PROGRAMS =
 
diff --git a/configure.ac b/configure.ac
index 70e9d4be8..bb6380f2f 100644
--- a/configure.ac
+++ b/configure.ac
@@ -401,6 +401,24 @@ if (test "${prefix}" = "NONE"); then
 	prefix="${ac_default_prefix}"
 fi
 
+if (test "${exec_prefix}" = "NONE"); then
+	# exec_prefix defaults to prefix, although our manual handling of the
+	# latter (above) confuses autoconf. Manually set the exec_prefix.
+	exec_prefix="${prefix}"
+fi
+
+# Expand any variables containing relative references like ${prefix} and co.
+#
+# Otherwise we'll end up with literal references in the final binaries or
+# manuals, which is not something we really want.
+
+if (test "$libexecdir" = '${exec_prefix}/libexec'); then
+	pkglibexecdir="${exec_prefix}/libexec/bluetooth"
+else
+	pkglibexecdir="${libexecdir}/bluetooth"
+fi
+AC_SUBST(PKGLIBEXECDIR, "${pkglibexecdir}")
+
 if (test "$localstatedir" = '${prefix}/var'); then
 	storagedir="${prefix}/var/lib/bluetooth"
 else
diff --git a/mesh/bluetooth-mesh.service.in b/mesh/bluetooth-mesh.service.in
index 9c3ff01a3..899ef107b 100644
--- a/mesh/bluetooth-mesh.service.in
+++ b/mesh/bluetooth-mesh.service.in
@@ -5,7 +5,7 @@ ConditionPathIsDirectory=/sys/class/bluetooth
 [Service]
 Type=dbus
 BusName=org.bluez.mesh
-ExecStart=@exec_prefix@/bluetooth/bluetooth-meshd
+ExecStart=@PKGLIBEXECDIR@/bluetooth-meshd
 NotifyAccess=main
 LimitNPROC=1
 ProtectHome=true
diff --git a/obexd/src/obex.service.in b/obexd/src/obex.service.in
index 03d09a679..cf4d8c985 100644
--- a/obexd/src/obex.service.in
+++ b/obexd/src/obex.service.in
@@ -4,7 +4,7 @@ Description=Bluetooth OBEX service
 [Service]
 Type=dbus
 BusName=org.bluez.obex
-ExecStart=@exec_prefix@/bluetooth/obexd
+ExecStart=@PKGLIBEXECDIR@/obexd
 
 [Install]
 Alias=dbus-org.bluez.obex.service
diff --git a/obexd/src/org.bluez.obex.service.in b/obexd/src/org.bluez.obex.service.in
index 14c16d3e3..873b9d1fd 100644
--- a/obexd/src/org.bluez.obex.service.in
+++ b/obexd/src/org.bluez.obex.service.in
@@ -1,4 +1,4 @@
 [D-BUS Service]
 Name=org.bluez.obex
-Exec=@exec_prefix@/bluetooth/obexd
+Exec=@PKGLIBEXECDIR@/obexd
 SystemdService=dbus-org.bluez.obex.service
diff --git a/src/bluetooth.service.in b/src/bluetooth.service.in
index 63e157587..8ebe89bec 100644
--- a/src/bluetooth.service.in
+++ b/src/bluetooth.service.in
@@ -6,7 +6,7 @@ ConditionPathIsDirectory=/sys/class/bluetooth
 [Service]
 Type=dbus
 BusName=org.bluez
-ExecStart=@exec_prefix@/bluetooth/bluetoothd
+ExecStart=@PKGLIBEXECDIR@/bluetoothd
 NotifyAccess=main
 #WatchdogSec=10
 #Restart=on-failure
diff --git a/tools/bluetooth-logger.service.in b/tools/bluetooth-logger.service.in
index 5657c8d84..d6df676b8 100644
--- a/tools/bluetooth-logger.service.in
+++ b/tools/bluetooth-logger.service.in
@@ -4,7 +4,7 @@ ConditionPathIsDirectory=/sys/class/bluetooth
 
 [Service]
 Type=simple
-ExecStart=@exec_prefix@/bluetooth/btmon-logger -p -b /var/log/bluetooth/hci.log
+ExecStart=@PKGLIBEXECDIR@/btmon-logger -p -b /var/log/bluetooth/hci.log
 NotifyAccess=main
 CapabilityBoundingSet=CAP_NET_RAW
 LimitNPROC=1

-- 
2.43.1


