Return-Path: <linux-bluetooth+bounces-1092-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8016082F002
	for <lists+linux-bluetooth@lfdr.de>; Tue, 16 Jan 2024 14:52:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A81D1C2345E
	for <lists+linux-bluetooth@lfdr.de>; Tue, 16 Jan 2024 13:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 357721BF57;
	Tue, 16 Jan 2024 13:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l2poX1+1"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAC21BF22
	for <linux-bluetooth@vger.kernel.org>; Tue, 16 Jan 2024 13:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97F35C433A6;
	Tue, 16 Jan 2024 13:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705413118;
	bh=ZUiUk2GFPMUsiFqT8IBmALQGVVZxpBQhiXl+gWzi+Fc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=l2poX1+1KvP12Z0W5qUgXNe/fKpIea4SVTNpYjysPltAGAJ6bNg3zjE90qIR0O61J
	 xjJG/B8LHh07AD0/3/13khUfYIX13Qxbfy6pbnmTDoLHZbNg2IiSVnRzTLTC9LyPkz
	 Nbln2/m9qU93Jt/O6oCc8wfZxjDKg2HPXflBpuycGUf3a/PBSfTkeAXkhq7i6rd+QF
	 kSEyVZRVCZpzdHHqknkso/Nr/jkwPj5YLRif4vCxmKtazwgxkpK3PWXhR9I010um5u
	 /3tR2BHFU6XqphBkwkIB/4rKKdqc4Y/zFVclbn/fCBiWgMrqYpok8RIL3Dr9RUQWYt
	 GQfR3q8qNkgeA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88794C47DA9;
	Tue, 16 Jan 2024 13:51:58 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Tue, 16 Jan 2024 13:51:58 +0000
Subject: [PATCH BlueZ 04/10] build: remove dummy {conf,state}{dir,_DATA}
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240116-autofoo-v1-4-626f6b54bd06@gmail.com>
References: <20240116-autofoo-v1-0-626f6b54bd06@gmail.com>
In-Reply-To: <20240116-autofoo-v1-0-626f6b54bd06@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: Emil Velikov <emil.velikov@collabora.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705413116; l=1330;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=Q7TCSQ+lTvESiDlf6GOyquny1w/mZRux7BcOUrFyJvw=;
 b=zs56xedLr7+3P9GVPhMkEbqsSEm7QL/Q4Kpgf8Qzj3WFC+8RBHORpib/q5pJKGYtdK7PmuODy
 hBTjQ2t+zOzAIof2UuaVXZf+ViPYKlmDFtMhLMhoxpUb7wpjNUOEY80
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received:
 by B4 Relay for emil.l.velikov@gmail.com/20230301 with auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: <emil.l.velikov@gmail.com>

From: Emil Velikov <emil.velikov@collabora.com>

The project does not install anything in the respective confdir and
statedir(s). Since no files are installed, the respective folders are
not created either - systemd will create them prior to starting the
service(s).

The *dir variables themselves are no longer used in *service.in, so
remove everything.
---
 Makefile.am | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/Makefile.am b/Makefile.am
index e738eb3a5..16d6bf160 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -28,15 +28,9 @@ AM_CFLAGS = $(MISC_CFLAGS) $(WARNING_CFLAGS) $(UDEV_CFLAGS) $(LIBEBOOK_CFLAGS) \
 				$(LIBEDATASERVER_CFLAGS) $(ell_cflags)
 AM_LDFLAGS = $(MISC_LDFLAGS)
 
-confdir = $(sysconfdir)/bluetooth
-statedir = $(localstatedir)/lib/bluetooth
-
 if DATAFILES
 dbusdir = $(DBUS_CONFDIR)/dbus-1/system.d
 dbus_DATA = src/bluetooth.conf
-
-conf_DATA =
-state_DATA =
 endif
 
 if SYSTEMD
@@ -747,9 +741,7 @@ MAINTAINERCLEANFILES = Makefile.in \
 
 SED_PROCESS = $(AM_V_GEN)$(MKDIR_P) $(dir $@) && \
 		$(SED) -e 's,@pkglibexecdir\@,$(pkglibexecdir),g' \
-		       -e 's,@libexecdir\@,$(libexecdir),g' \
-		       -e 's,@statedir\@,$(statedir),g' \
-		       -e 's,@confdir\@,$(confdir),g' \
+		       -e 's,@libexecdir\@,$(libexecdir),g'
 		< $< > $@
 
 if RUN_RST2MAN

-- 
2.43.0


