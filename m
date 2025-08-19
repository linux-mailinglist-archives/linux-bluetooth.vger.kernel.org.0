Return-Path: <linux-bluetooth+bounces-14797-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D173CB2BB86
	for <lists+linux-bluetooth@lfdr.de>; Tue, 19 Aug 2025 10:15:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D7D03B4A8E
	for <lists+linux-bluetooth@lfdr.de>; Tue, 19 Aug 2025 08:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF583101D5;
	Tue, 19 Aug 2025 08:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="fROG5z3I"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-17.smtp.github.com (out-17.smtp.github.com [192.30.252.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39FD21D3EE
	for <linux-bluetooth@vger.kernel.org>; Tue, 19 Aug 2025 08:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755591216; cv=none; b=dyO7YRee8Dn0KHQuomyzMII8VMlR1rhB375zHLGV6yy8cMzy/SOfDeQJdpZ6jZVpMp31ocEcDS9w8CtbYwfcBmciW0uFI2KuXcWfiazy2UaMzd9d4e65Qoz8jbLkJ4egZSU9EKtd621vNld5LqhxJ7GyxZicvoPI/yh73gIDFlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755591216; c=relaxed/simple;
	bh=nNPlPHOkvxhi5uZ+Nf6J7cb4i2WI1VyNg76WZh/5y6I=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=MCBXTuaUp7oHIWPgTVr+HrkjlZY3yE56nF9U7PWJDbnt0jcrESJOGS+SjapweDm5kFcr49fqY7M9SErIeZBnG/N/t53r4SjpC0yvIFXfyKnR8D/0Qu0u1gjwqU1ScAob45v09MXGquAVLnexAtLhdBpy4/tgdt1BQ/M3Svy6yuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=fROG5z3I; arc=none smtp.client-ip=192.30.252.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-9ba4b38.va3-iad.github.net [10.48.178.40])
	by smtp.github.com (Postfix) with ESMTPA id F3E284E0793
	for <linux-bluetooth@vger.kernel.org>; Tue, 19 Aug 2025 01:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1755591213;
	bh=EQzwlQlvO+ZbFOcyVzX2hIyfzxyODH4pzkfhuPmE3Vo=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=fROG5z3I/M0NmWHxMGujudKcE7FxkbR8o6dSz5HWBgZcshxOmMEr5DJ6kIvvhQv1g
	 ujI6DjBFR9Ed0BDFr9RgeVMh6Y1tl9CXmsiktKvblTzCwgKbk52kPKa32kmGWz+TI5
	 HTNhPxUw8R0NDktpnSFuvhFMLPCAnLCxNObqnXLo=
Date: Tue, 19 Aug 2025 01:13:33 -0700
From: "github-actions[bot]" <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/992906/000000-aeb8ae@github.com>
Subject: [bluez/bluez] aeb8ae: bap: Fix setup double free with bis sink
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All

  Branch: refs/heads/992906
  Home:   https://github.com/bluez/bluez
  Commit: aeb8ae110f05dc76472a3e73bf8adc0e1643cfe1
      https://github.com/bluez/bluez/commit/aeb8ae110f05dc76472a3e73bf8adc0e1643cfe1
  Author: Ye He <ye.he@amlogic.com>
  Date:   2025-08-19 (Tue, 19 Aug 2025)

  Changed paths:
    M profiles/audio/bap.c

  Log Message:
  -----------
  bap: Fix setup double free with bis sink

If try to remove the bis sink device that big sync lost with
remote bis source, the following crash is observed:

0x00000a78 in ?? ()
0x004c8970 in setup_free ()
0x00551a78 in queue_remove_all ()
0x00551abc in queue_destroy ()
0x004cb590 in bap_data_remove ()
0x004cb9f0 in bap_bcast_remove ()
0x0051457c in service_remove ()
0x005272e4 in device_remove ()
0x0050e134 in adapter_remove_connection ()
0x0050e24c in dev_disconnected ()
0x00553478 in request_complete ()
0x00554670 in can_read_data ()
0x005850c4 in watch_callback ()
0xf7d5ab9c in g_main_context_dispatch () from /usr/lib/libglib-2.0.so.0
0xf7d5af28 in ?? () from /usr/lib/libglib-2.0.so.0

Signed-off-by: Ye He <ye.he@amlogic.com>



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

