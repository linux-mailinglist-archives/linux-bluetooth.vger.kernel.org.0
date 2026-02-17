Return-Path: <linux-bluetooth+bounces-19120-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPxOOkyRlGk9FgIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19120-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 17:03:24 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D83814DD6E
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 17:03:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF74E30358A0
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 16:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B31036C5AD;
	Tue, 17 Feb 2026 16:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="YEcMs0bc"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-19.smtp.github.com (out-19.smtp.github.com [192.30.252.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FAA338F52
	for <linux-bluetooth@vger.kernel.org>; Tue, 17 Feb 2026 16:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771344198; cv=none; b=GtNhkkP138l+EIg40Kg6NR+IW+QHg1aruepiqDEavccC67fdtrVw2eH9urqhUZ4zkbGeRgvD49hRTK0MQ3sZH4vjw42Eo1z3D1hVTkUWdqCR1D5g4IUD6KBAWJ8Tu/iV9+lxEi77GDXmW1t72ffeA6jutw9PHObVTOrK/v5mWzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771344198; c=relaxed/simple;
	bh=gGjjm32BtWnnkwHdeVW+t71g/L4rXsT+vp0CTJDN6Po=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=eIiIb4pnCJzgq30JDLwxxtu7U/GgMZty19zXFbIrCNjqvNa+wVizz3Dqef5VNH5kOYm47sAnFeLC6SbReZaQHLOlZx/I9ghm4F3jGYrTiP3AFAoJd8aub0X5GAqHTslD/yojbA1fBveYc5dH5mN51X/jqKab3femMsRTheeCkiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=YEcMs0bc; arc=none smtp.client-ip=192.30.252.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-286395a.va3-iad.github.net [10.51.97.33])
	by smtp.github.com (Postfix) with ESMTPA id 7E4F5E139A
	for <linux-bluetooth@vger.kernel.org>; Tue, 17 Feb 2026 08:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1771344196;
	bh=0Lto/jXbyiiiPbdQrOhr48F6xCDP+1pHxbcxxaa3bR8=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=YEcMs0bcLJxNe+fiYzGAATREa5Vkibq1d/zd2fvkZEygi7xlV7cUcNgv245B1g+yj
	 S/IGv0a+bZZ+nO02wP6ITRA4pnulzjDSV2tT9/2SZ21knlQ1C6zVzvH/YqZKk5tl+a
	 3tnAvGW/KQxGJ/zSMi3BZKjKkKAu24Bv64Vwi5gg=
Date: Tue, 17 Feb 2026 08:03:16 -0800
From: fdanis-oss <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1054909/000000-1bad1c@github.com>
Subject: [bluez/bluez] 1bad1c: client/btpclient: Fix build warning
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	DMARC_POLICY_REJECT(2.00)[github.com : SPF not aligned (relaxed),reject];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[github.com:s=pf2023];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[github.com:-];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-19120-lists,linux-bluetooth=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: 5D83814DD6E
X-Rspamd-Action: no action

  Branch: refs/heads/1054909
  Home:   https://github.com/bluez/bluez
  Commit: 1bad1c0e4f603ec551e6223ec33c2c79e575879e
      https://github.com/bluez/bluez/commit/1bad1c0e4f603ec551e6223ec33c2=
c79e575879e
  Author: Fr=C3=A9d=C3=A9ric Danis <frederic.danis@collabora.com>
  Date:   2026-02-17 (Tue, 17 Feb 2026)

  Changed paths:
    M client/btpclient/gap.c

  Log Message:
  -----------
  client/btpclient: Fix build warning

client/btpclient/gap.c:2359:3: warning: Value stored to 'reply' is never
read [deadcode.DeadStores]
 2359 |     reply =3D l_dbus_message_new_error(ag->pending_req,
      |     ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 2360 |                                     "org.bluez.Error.Rejected",
      |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 2361 |                                     "Passkey mismatch");
      |                                     ~~~~~~~~~~~~~~~~~~~
1 warning generated.



To unsubscribe from these emails, change your notification settings at ht=
tps://github.com/bluez/bluez/settings/notifications

