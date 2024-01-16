Return-Path: <linux-bluetooth+bounces-1123-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AA282F06F
	for <lists+linux-bluetooth@lfdr.de>; Tue, 16 Jan 2024 15:19:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA0BBB233E2
	for <lists+linux-bluetooth@lfdr.de>; Tue, 16 Jan 2024 14:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F9B1C28C;
	Tue, 16 Jan 2024 14:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E7aNg8vr"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A6B1BDFF
	for <linux-bluetooth@vger.kernel.org>; Tue, 16 Jan 2024 14:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7A01C43330;
	Tue, 16 Jan 2024 14:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705414737;
	bh=mb3vibSeCho7dxgk/hsygvpcHcp9zzLKyD4RpuB1Dx8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=E7aNg8vr/qFqze/KDPJupXTLo6DDJ6pAa107u85XFQMOomNMizXnbKSJheQPLZFct
	 IH5IeHZsFRmJnjwQg0NYQmq74MFvCkjjhdXH1N9TVsz5x7/T/I2OtXen8j77/DNIpp
	 sJdJD5fvvMIKBPc2jD3xdmwj21qpX2aDshzz+cB6CQGKiL2C1qH9vmDf5lUrIwahds
	 TThN7ZhlX42JrfUd+8+0cTqFUNeKOmf9fS8whXJons+aZI7AuZuGYf6uGfs9hsjJm8
	 IBaJLclStfE7ZVBECiK+cpiwgzgNMMQYm4EGeAY+b2+UfMkYkSd9HoEpzMqL1j9b7K
	 BXp+Zx3qhi8BQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7453C47DA2;
	Tue, 16 Jan 2024 14:18:57 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Tue, 16 Jan 2024 14:19:00 +0000
Subject: [PATCH BlueZ 8/8] android: export only (android) entrypoint from
 the modules
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240116-rm-ext-plugins-v1-8-62990fb07369@gmail.com>
References: <20240116-rm-ext-plugins-v1-0-62990fb07369@gmail.com>
In-Reply-To: <20240116-rm-ext-plugins-v1-0-62990fb07369@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: Emil Velikov <emil.velikov@collabora.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705414735; l=3016;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=A9wt+5pbCxd+p0NIbARFNH3H5ujiQXTs0z8giNMkb3Y=;
 b=Q7HFiJKysnEzEqBfz62XULQw232U+TBobuXu2XRRDcmuxXrZN4Ah8y4Br7aNaVKEOwf2rmZ/V
 qjq7zG1NgwjDonv9tD6FejaTAE1a6VvvxHZXUrN6bRdBK23/XQvWCEg
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received:
 by B4 Relay for emil.l.velikov@gmail.com/20230301 with auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: <emil.l.velikov@gmail.com>

From: Emil Velikov <emil.velikov@collabora.com>

The android specific modules, have a designated HMI entrypoint. Hide
everything else with -fvisibility=hidden.
---
 android/Makefile.am     | 3 +++
 android/hal-audio.c     | 1 +
 android/hal-bluetooth.c | 1 +
 android/hal-sco.c       | 1 +
 4 files changed, 6 insertions(+)

diff --git a/android/Makefile.am b/android/Makefile.am
index 309910147..e3756e89c 100644
--- a/android/Makefile.am
+++ b/android/Makefile.am
@@ -96,6 +96,7 @@ android_bluetooth_default_la_SOURCES = android/hal.h android/hal-bluetooth.c \
 					android/hal-log.h \
 					android/hal-ipc.h android/hal-ipc.c \
 					android/hal-utils.h android/hal-utils.c
+android_bluetooth_default_la_CFLAGS = $(AM_CFLAGS) -fvisibility=hidden
 android_bluetooth_default_la_CPPFLAGS = $(AM_CPPFLAGS) -I$(srcdir)/android
 android_bluetooth_default_la_LDFLAGS = $(AM_LDFLAGS) -module -avoid-version \
 					-no-undefined
@@ -195,6 +196,7 @@ android_audio_a2dp_default_la_SOURCES = android/audio-msg.h \
 					android/hardware/audio_effect.h \
 					android/hardware/hardware.h \
 					android/system/audio.h
+android_audio_a2dp_default_la_CFLAGS = $(AM_CFLAGS) -fvisibility=hidden
 android_audio_a2dp_default_la_CPPFLAGS = $(AM_CPPFLAGS) -I$(srcdir)/android \
 					$(SBC_CFLAGS)
 android_audio_a2dp_default_la_LIBADD = $(SBC_LIBS) -lrt
@@ -212,6 +214,7 @@ android_audio_sco_default_la_SOURCES = android/hal-log.h \
 					android/audio_utils/resampler.c \
 					android/audio_utils/resampler.h \
 					android/system/audio.h
+android_audio_sco_default_la_CFLAGS = $(AM_CFLAGS) -fvisibility=hidden
 android_audio_sco_default_la_CPPFLAGS = $(AM_CPPFLAGS) -I$(srcdir)/android
 android_audio_sco_default_la_LIBADD = $(SPEEXDSP_LIBS) -lrt
 android_audio_sco_default_la_LDFLAGS = $(AM_LDFLAGS) -module -avoid-version \
diff --git a/android/hal-audio.c b/android/hal-audio.c
index d37d6098c..f3d9b40a6 100644
--- a/android/hal-audio.c
+++ b/android/hal-audio.c
@@ -1618,6 +1618,7 @@ static struct hw_module_methods_t hal_module_methods = {
 	.open = audio_open,
 };
 
+__attribute__ ((visibility("default")))
 struct audio_module HAL_MODULE_INFO_SYM = {
 	.common = {
 		.tag = HARDWARE_MODULE_TAG,
diff --git a/android/hal-bluetooth.c b/android/hal-bluetooth.c
index d4442e620..7d1e5ac63 100644
--- a/android/hal-bluetooth.c
+++ b/android/hal-bluetooth.c
@@ -1117,6 +1117,7 @@ static struct hw_module_methods_t bluetooth_module_methods = {
 	.open = open_bluetooth,
 };
 
+__attribute__ ((visibility("default")))
 struct hw_module_t HAL_MODULE_INFO_SYM = {
 	.tag = HARDWARE_MODULE_TAG,
 	.version_major = 1,
diff --git a/android/hal-sco.c b/android/hal-sco.c
index d7c08a68b..3d66ad357 100644
--- a/android/hal-sco.c
+++ b/android/hal-sco.c
@@ -1507,6 +1507,7 @@ static struct hw_module_methods_t hal_module_methods = {
 	.open = sco_open,
 };
 
+__attribute__ ((visibility("default")))
 struct audio_module HAL_MODULE_INFO_SYM = {
 	.common = {
 		.tag = HARDWARE_MODULE_TAG,

-- 
2.43.0


