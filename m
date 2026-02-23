Return-Path: <linux-bluetooth+bounces-19297-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEc6LYy+nGlSKAQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19297-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 23 Feb 2026 21:54:36 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1FD17D413
	for <lists+linux-bluetooth@lfdr.de>; Mon, 23 Feb 2026 21:54:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0278A3067FE1
	for <lists+linux-bluetooth@lfdr.de>; Mon, 23 Feb 2026 20:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D1936D4E7;
	Mon, 23 Feb 2026 20:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="IghBdvHO"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-25.smtp.github.com (out-25.smtp.github.com [192.30.252.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88B5261B91
	for <linux-bluetooth@vger.kernel.org>; Mon, 23 Feb 2026 20:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771880067; cv=none; b=C0pUoUgzuFbpc1j5NHyMVtFcn0vr4R86cdGYGCzrHVCrqt2dI68Wg3NlITjUceK5n+YfViI/4bEfN318Dt3k/Wm8ysROdLKbDswBpZJFqqS02bIpfm26NuHE8gE6x1JXke3PU7uddv61xx5AhsO/BRgFX88jeMNP4MC3smIkiTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771880067; c=relaxed/simple;
	bh=q8mNsLxR6gFFoKltLLv2T8YQEgWoi2gpjvlkF5dE3No=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=IqrJUcL0kQLlEA/FSCC6ugc/SjZB3Vo1KSXLZg+OGbBtOesQ5dEfNc9Ye/kLW5VnWi/s9kBwF2Driu4S4QsLLthOavlsWeSi9wCWU/r5e8BdpLv/wqxF5FPHH6OtAutvBoq2SLBBIpvZNUIUxWxoqtDXUvvg3k4HUTnECQKVgxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=IghBdvHO; arc=none smtp.client-ip=192.30.252.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-980c749.ash1-iad.github.net [10.56.193.37])
	by smtp.github.com (Postfix) with ESMTPA id D5E6E141320
	for <linux-bluetooth@vger.kernel.org>; Mon, 23 Feb 2026 12:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1771880065;
	bh=ETpEQ0m7rWCfxhAx4aefxtagWyi7cUpbWF4H5yOlE8g=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=IghBdvHOsl+Y8oYk9/n5OsrrQ09lXvO5aZU2tW5DX7wL2dKmxNlVgooqeeBX75AYn
	 mw4NbKCWLjFh3E1RWhex1L0B+Encug/yjmvHOBKtJIJlqN+WgRbUjgkN737cJRJhhY
	 QERn7ObmsdDzcgXCLuuIZf6BRy//qatFXDGjOQHc=
Date: Mon, 23 Feb 2026 12:54:25 -0800
From: Luiz Augusto von Dentz <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/d84a8f-290f99@github.com>
Subject: [bluez/bluez] 290f99: l2test: Attempt to use BT_SNDMTU if output MTU
 has...
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	DMARC_POLICY_REJECT(2.00)[github.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[github.com:s=pf2023];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-19297-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 1A1FD17D413
X-Rspamd-Action: no action

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: 290f9973c9069f293367284e95fd338a221ab90d
      https://github.com/bluez/bluez/commit/290f9973c9069f293367284e95fd338a221ab90d
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2026-02-23 (Mon, 23 Feb 2026)

  Changed paths:
    M tools/l2test.c

  Log Message:
  -----------
  l2test: Attempt to use BT_SNDMTU if output MTU has been set

With the suggested fixes for L2CAP/ECFC/BV-27-C the kernel shall be
able to accept setsockopt(BT_SNDMTU) in order for an applications
to require a minimal output MTU greater than 64.

Fixes: https://github.com/bluez/bluez/issues/1895



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

