Return-Path: <linux-bluetooth+bounces-1086-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 084F082EFFE
	for <lists+linux-bluetooth@lfdr.de>; Tue, 16 Jan 2024 14:52:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68275B2300D
	for <lists+linux-bluetooth@lfdr.de>; Tue, 16 Jan 2024 13:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F34E1BF33;
	Tue, 16 Jan 2024 13:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6ZdvcDq"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E798D1BDEB
	for <linux-bluetooth@vger.kernel.org>; Tue, 16 Jan 2024 13:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E821C43390;
	Tue, 16 Jan 2024 13:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705413118;
	bh=v581bSOdOyMpozQT9vj5G6J+25HR0DSQw4nzso23mjE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=l6ZdvcDqm9yojKiQPtlNgf1UJu6y3a4WoR4GeNWTFaywhNcCJXkHUimJP7KDkViub
	 QYowyyGiQnaobHVrI+JC4VmTMsgSCIDvpefVvVeb9oTtX5ZRKTCH9DPraFGjXjRaq1
	 CgZIJtSw8eFLBoPMZIwErz+OR2eBhu4hk3U/2H9ytwzNyOLw5LNMgNFwBk7+cvO62g
	 6KuMsqrbNBhcAMXyoyj1ubKfaychEZoAKNfbB2Z9qGzNOcQf5MNtNGZrlbts9YxkAK
	 ArzLj4yxLUKaOwiVdfPBSSe4/hzV6FRKmBgMpk/vOZy/jyp70mzaOCnrkh2fxHCPFh
	 HKu04bj4UHkOA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 658D4C47DA2;
	Tue, 16 Jan 2024 13:51:58 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Tue, 16 Jan 2024 13:51:55 +0000
Subject: [PATCH BlueZ 01/10] build: remove unused AM_CONDITIONAL
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240116-autofoo-v1-1-626f6b54bd06@gmail.com>
References: <20240116-autofoo-v1-0-626f6b54bd06@gmail.com>
In-Reply-To: <20240116-autofoo-v1-0-626f6b54bd06@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: Emil Velikov <emil.velikov@collabora.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705413116; l=571;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=hH4p4F+DSfBor5eMwxN/Bc+wtZkc5eQ4tXjcGVPVcjs=;
 b=E5JrIt6fd61wpw7r69bcAqOtkrQCPq7kOdXJNP6pFSTJT0vUGQskOTDUYX7SOkqIiUFSSEWyS
 1yqT6gixO4VBx5Y0iBeqBKCzz5yJlcpPRuAxzAGxMgBmV+HDwq70Chl
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received:
 by B4 Relay for emil.l.velikov@gmail.com/20230301 with auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: <emil.l.velikov@gmail.com>

From: Emil Velikov <emil.velikov@collabora.com>

---
 configure.ac | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index 3e10ec970..307a2f30c 100644
--- a/configure.ac
+++ b/configure.ac
@@ -238,7 +238,6 @@ if (test "${enable_tools}" != "no" && test "${enable_udev}" != "no"); then
 		AC_DEFINE(HAVE_UDEV_HWDB_NEW, 1,
 			[Define to 1 if you have the udev_hwdb_new() function.]))
 fi
-AM_CONDITIONAL(UDEV, test "${enable_udev}" != "no")
 
 AC_ARG_WITH([udevdir], AS_HELP_STRING([--with-udevdir=DIR],
 			[path to udev directory]), [path_udevdir=${withval}])

-- 
2.43.0


