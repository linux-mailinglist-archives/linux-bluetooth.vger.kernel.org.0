Return-Path: <linux-bluetooth+bounces-15839-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CA6BD223D
	for <lists+linux-bluetooth@lfdr.de>; Mon, 13 Oct 2025 10:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B0ECE4EBF6E
	for <lists+linux-bluetooth@lfdr.de>; Mon, 13 Oct 2025 08:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A632FB632;
	Mon, 13 Oct 2025 08:48:06 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC8F2FAC07
	for <linux-bluetooth@vger.kernel.org>; Mon, 13 Oct 2025 08:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760345286; cv=none; b=DYE5ebOcoXaKS3rjlPn0vs60B31fCJ7joyxqeXxuXLCcv+1pAgLp+dXpQdpy9qyeENrnT72ZluS++ZmES1BlT9dfF1RMxU3LbAhEqhss52hcxPvBg3RJR3XxCzDJL0B/lxqvUwSGFyZKVaHx+jRnjPXIvp7Vt53k7Qd0/geyPPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760345286; c=relaxed/simple;
	bh=sivdIeBMjGHmxVIczXuUnhpPqHFjlSHod8sAdJ+fEqo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VYRcV27LClzMTRV2AofE+QnwK1fSexESuNG8nKDcsZjXhZasjqkoKX25ZFXIlq92c/v1bS8qWTYQ5jjI8jx1xrcJHEEQthEYvLluIo2uBsqx1mwBn2ut8eVuayVQct6XRvJepiAMbF/EBWRpTJ2c/O8WHBmNiOFeCJ6Nl+x7rjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 6C2F1582121
	for <linux-bluetooth@vger.kernel.org>; Mon, 13 Oct 2025 08:33:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7965542EF5
	for <linux-bluetooth@vger.kernel.org>; Mon, 13 Oct 2025 08:33:09 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v5 8/9] emulator: Install the emulator if built
Date: Mon, 13 Oct 2025 10:32:18 +0200
Message-ID: <20251013083259.3152260-9-hadess@hadess.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013083259.3152260-1-hadess@hadess.net>
References: <20251013083259.3152260-1-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net

It's useful for testing.
---
 emulator/meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/emulator/meson.build b/emulator/meson.build
index bc038becc567..55d77e40319d 100644
--- a/emulator/meson.build
+++ b/emulator/meson.build
@@ -17,7 +17,9 @@ if get_option('tests').enabled()
       'smp.c',
       'phy.c',
       'le.c' ],
-    dependencies: [ libbluetooth_internal_dep, libshared_mainloop_dep, glib_dep ]
+    dependencies: [ libbluetooth_internal_dep, libshared_mainloop_dep, glib_dep ],
+    install: true,
+    install_dir: pkglibexecdir
   )
 
   executable('b1ee',
-- 
2.51.0


