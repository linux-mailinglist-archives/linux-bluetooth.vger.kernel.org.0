Return-Path: <linux-bluetooth+bounces-1088-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 662E082F000
	for <lists+linux-bluetooth@lfdr.de>; Tue, 16 Jan 2024 14:52:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C89C1C23399
	for <lists+linux-bluetooth@lfdr.de>; Tue, 16 Jan 2024 13:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A291BF36;
	Tue, 16 Jan 2024 13:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nn/m/g4q"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79E01BDED
	for <linux-bluetooth@vger.kernel.org>; Tue, 16 Jan 2024 13:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86BA8C433B1;
	Tue, 16 Jan 2024 13:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705413118;
	bh=v7O5hzNUNXVmaKklVJEFPYjg9TQY/N2p3/fzUWvgjUk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nn/m/g4qPJRH/LFB6PB+Tz+PQEvj30q2lHr+sNYYYSF+5rlHbL9oqijNAb+KKDVFs
	 5ROQmYN6cGi14lxxspEiNK6saZoyzwVqP3a1mxBUmTPSe7/l1XH3OUYw3BoXTgXgci
	 FxJXgZPpQiIB66KZ+8gdoXit37ipVkTRESWgSK3WvMOVQ9ueZ7eXiPwNeNsMtDd8aY
	 SWEtcPyuE6pTUPKiZ9QrNGVY6L+Wq5tykh4k6MzwzEUuwmTmUHXLKXyXSeyUvFX0RL
	 V8Yob4nPx8yx4PPiQkg0E2OlowYY7jHO/j8z7uE9FM7OpLC7eC49xKjQzEJEKD6UUA
	 FlUEY7kYJlwEw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7104AC47DA6;
	Tue, 16 Jan 2024 13:51:58 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Tue, 16 Jan 2024 13:51:56 +0000
Subject: [PATCH BlueZ 02/10] build: tweak PKG_CHECK_MODULES calls
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240116-autofoo-v1-2-626f6b54bd06@gmail.com>
References: <20240116-autofoo-v1-0-626f6b54bd06@gmail.com>
In-Reply-To: <20240116-autofoo-v1-0-626f6b54bd06@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: Emil Velikov <emil.velikov@collabora.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705413116; l=5425;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=RW5Zf7nNK2DwOoLbGkq4IW19GMpKuijCPPAeggcVrpw=;
 b=6wlQkFWxx6x6fIC4BHAroYhs7X82ZDxKVtEQYfLhjJF4Xy7jGyQ5ePM0KokZRpKVe4qel/JaF
 7Jl3fRtRceMBA+VVtSh43Tm2AgADmjxn92+BxS/9Yah0u0mgbVAfDQk
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received:
 by B4 Relay for emil.l.velikov@gmail.com/20230301 with auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: <emil.l.velikov@gmail.com>

From: Emil Velikov <emil.velikov@collabora.com>

There's no need to call AC_SUBST after a PKG_CHECK_MODULES call, since
the variables are always set. As an example: the produced Makefile.in
and Makefile are identical before/after this change.

Similarly, we don't need the "dummy=yes" and manual AC_MSG_ERROR() call
- pkg-config (or pkgconf) will produce the same and in some cases better
  error messages.
---
 configure.ac | 59 ++++++++++++-----------------------------------------------
 1 file changed, 12 insertions(+), 47 deletions(-)

diff --git a/configure.ac b/configure.ac
index 307a2f30c..7cbfa8846 100644
--- a/configure.ac
+++ b/configure.ac
@@ -72,23 +72,16 @@ AC_CHECK_LIB(dl, dlopen, dummy=yes,
 
 AC_CHECK_HEADERS(linux/types.h linux/if_alg.h linux/uinput.h linux/uhid.h sys/random.h)
 
-PKG_CHECK_MODULES(GLIB, glib-2.0 >= 2.28, dummy=yes,
-				AC_MSG_ERROR(GLib >= 2.28 is required))
-AC_SUBST(GLIB_CFLAGS)
-AC_SUBST(GLIB_LIBS)
+PKG_CHECK_MODULES(GLIB, glib-2.0 >= 2.28)
 
 if (test "${enable_threads}" = "yes"); then
 	AC_DEFINE(NEED_THREADS, 1, [Define if threading support is required])
-	PKG_CHECK_MODULES(GTHREAD, gthread-2.0 >= 2.16, dummy=yes,
-				AC_MSG_ERROR(GThread >= 2.16 is required))
+	PKG_CHECK_MODULES(GTHREAD, gthread-2.0 >= 2.16)
 	GLIB_CFLAGS="$GLIB_CFLAGS $GTHREAD_CFLAGS"
 	GLIB_LIBS="$GLIB_LIBS $GTHREAD_LIBS"
 fi
 
-PKG_CHECK_MODULES(DBUS, dbus-1 >= 1.10, dummy=yes,
-				AC_MSG_ERROR(D-Bus >= 1.10 is required))
-AC_SUBST(DBUS_CFLAGS)
-AC_SUBST(DBUS_LIBS)
+PKG_CHECK_MODULES(DBUS, dbus-1 >= 1.10)
 
 AC_ARG_WITH([dbusconfdir], AS_HELP_STRING([--with-dbusconfdir=DIR],
 				[path to D-Bus configuration directory]),
@@ -230,10 +223,7 @@ AM_CONDITIONAL(MONITOR, test "${enable_monitor}" != "no")
 AC_ARG_ENABLE(udev, AS_HELP_STRING([--disable-udev],
 		[disable udev device support]), [enable_udev=${enableval}])
 if (test "${enable_tools}" != "no" && test "${enable_udev}" != "no"); then
-	PKG_CHECK_MODULES(UDEV, libudev >= 172, dummy=yes,
-				AC_MSG_ERROR(libudev >= 172 is required))
-	AC_SUBST(UDEV_CFLAGS)
-	AC_SUBST(UDEV_LIBS)
+	PKG_CHECK_MODULES(UDEV, libudev >= 172)
 	AC_CHECK_LIB(udev, udev_hwdb_new,
 		AC_DEFINE(HAVE_UDEV_HWDB_NEW, 1,
 			[Define to 1 if you have the udev_hwdb_new() function.]))
@@ -260,10 +250,7 @@ AC_ARG_ENABLE(mesh, AS_HELP_STRING([--enable-mesh],
 AM_CONDITIONAL(MESH, test "${enable_mesh}" = "yes")
 
 if (test "${enable_mesh}" = "yes"); then
-	PKG_CHECK_MODULES(JSONC, json-c >= 0.13, dummy=yes,
-				AC_MSG_ERROR(json-c >= 0.13 is required))
-	AC_SUBST(JSON_CFLAGS)
-	AC_SUBST(JSON_LIBS)
+	PKG_CHECK_MODULES(JSONC, json-c >= 0.13)
 fi
 
 AC_ARG_ENABLE(midi, AS_HELP_STRING([--enable-midi],
@@ -271,19 +258,13 @@ AC_ARG_ENABLE(midi, AS_HELP_STRING([--enable-midi],
 AM_CONDITIONAL(MIDI, test "${enable_midi}" = "yes")
 
 if (test "${enable_midi}" = "yes"); then
-	PKG_CHECK_MODULES(ALSA, alsa, dummy=yes,
-			AC_MSG_ERROR(ALSA lib is required for MIDI support))
-	AC_SUBST(ALSA_CFLAGS)
-	AC_SUBST(ALSA_LIBS)
+	PKG_CHECK_MODULES(ALSA, alsa)
 fi
 
 AC_ARG_ENABLE(obex, AS_HELP_STRING([--disable-obex],
 		[disable OBEX profile support]), [enable_obex=${enableval}])
 if (test "${enable_obex}" != "no"); then
-	PKG_CHECK_MODULES(ICAL, libical, dummy=yes,
-					AC_MSG_ERROR(libical is required))
-	AC_SUBST(ICAL_CFLAGS)
-	AC_SUBST(ICAL_LIBS)
+	PKG_CHECK_MODULES(ICAL, libical)
 fi
 AM_CONDITIONAL(OBEX, test "${enable_obex}" != "no")
 
@@ -295,10 +276,7 @@ AC_ARG_ENABLE([external_ell], AS_HELP_STRING([--enable-external-ell],
 				[enable external Embedded Linux library]),
 					[enable_external_ell=${enableval}])
 if (test "${enable_external_ell}" = "yes"); then
-	PKG_CHECK_MODULES(ELL, ell >= 0.39, dummy=yes,
-		AC_MSG_ERROR(Embedded Linux library >= 0.39 is required))
-	AC_SUBST(ELL_CFLAGS)
-	AC_SUBST(ELL_LIBS)
+	PKG_CHECK_MODULES(ELL, ell >= 0.39)
 fi
 if (test "${enable_external_ell}" != "yes" &&
 		(test "${enable_btpclient}" = "yes" || test "${enable_mesh}" = "yes")); then
@@ -442,17 +420,11 @@ AC_ARG_ENABLE(android, AS_HELP_STRING([--enable-android],
 AM_CONDITIONAL(ANDROID, test "${enable_android}" = "yes")
 
 if (test "${enable_android}" = "yes"); then
-	PKG_CHECK_MODULES(SBC, sbc >= 1.2, dummy=yes,
-			AC_MSG_ERROR(SBC library >= 1.2 is required))
-	AC_SUBST(SBC_CFLAGS)
-	AC_SUBST(SBC_LIBS)
+	PKG_CHECK_MODULES(SBC, sbc >= 1.2)
 fi
 
 if (test "${enable_android}" = "yes"); then
-	PKG_CHECK_MODULES(SPEEXDSP, speexdsp >= 1.2, dummy=yes,
-			AC_MSG_ERROR(SPEEXDSP library >= 1.2 is required))
-	AC_SUBST(SPEEXDSP_CFLAGS)
-	AC_SUBST(SPEEXDSP_LIBS)
+	PKG_CHECK_MODULES(SPEEXDSP, speexdsp >= 1.2)
 fi
 
 AC_DEFINE_UNQUOTED(ANDROID_STORAGEDIR, "${storagedir}/android",
@@ -466,15 +438,8 @@ if (test -z "${plugin_phonebook}"); then
 fi
 
 if (test "${plugin_phonebook}" = "ebook"); then
-	PKG_CHECK_MODULES(LIBEBOOK, [libebook-1.2 >= 3.3], dummy=yes,
-			AC_MSG_ERROR(libebook >= 3.3 is required))
-	AC_SUBST(LIBEBOOK_CFLAGS)
-	AC_SUBST(LIBEBOOK_LIBS)
-	PKG_CHECK_MODULES(LIBEDATESERVER, [libedataserver-1.2 >= 3.3],
-			dummy=yes,
-			AC_MSG_ERROR(libedataserver >= 3.3 is required))
-	AC_SUBST(LIBEDATESERVER_CFLAGS)
-	AC_SUBST(LIBEDATESERVER_LIBS)
+	PKG_CHECK_MODULES(LIBEBOOK, libebook-1.2 >= 3.3)
+	PKG_CHECK_MODULES(LIBEDATESERVER, libedataserver-1.2 >= 3.3)
 fi
 AC_SUBST(PLUGIN_PHONEBOOK, [${plugin_phonebook}])
 

-- 
2.43.0


