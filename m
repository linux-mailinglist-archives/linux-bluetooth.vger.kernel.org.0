Return-Path: <linux-bluetooth+bounces-19068-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 82eTCivLkWnNmwEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19068-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Sun, 15 Feb 2026 14:33:31 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA6A13EBAA
	for <lists+linux-bluetooth@lfdr.de>; Sun, 15 Feb 2026 14:33:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16D8D300FEE3
	for <lists+linux-bluetooth@lfdr.de>; Sun, 15 Feb 2026 13:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C4B8296BD1;
	Sun, 15 Feb 2026 13:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="dK14fW9j"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-28.smtp.github.com (out-28.smtp.github.com [192.30.252.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA52815746F
	for <linux-bluetooth@vger.kernel.org>; Sun, 15 Feb 2026 13:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771162403; cv=none; b=mOidqg98EZg0o89qnylvaMTBUQha4B0JCeuk+dRCTKy5FOSIlsL+nLaS8WNe6qAjX7QrzSCWBeSCtG0YPd3g7ZiFfYi0xJSKMdZlVBOrVMyxvaiqbf4zJTx8BUQBR8P31sB1ysJjT7cPpfdYSEwYc03iLE/kLYpQxleB33dCd18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771162403; c=relaxed/simple;
	bh=qwUApQh0G+oeyqLEU0gaCyAQYv7nPbpSYyX47y3q6iw=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=P4un7vFENhkhwD4q3Y+IqXYHoF2jj7mqwnaMeKmG+lbTJcZEX6S47sGrolFV9xrVd5ci8kZrcTPd5vjFiqutf4Vk+/LX9s7J0cuYp9hi8vHudYbEufnlBDjj3J4N1z2UR+inwTUro84Znk0lHsZzvvJRkjelQZfe8/Mz2pHG0vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=dK14fW9j; arc=none smtp.client-ip=192.30.252.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-be332c1.ash1-iad.github.net [10.56.169.38])
	by smtp.github.com (Postfix) with ESMTPA id 07EEC920442
	for <linux-bluetooth@vger.kernel.org>; Sun, 15 Feb 2026 05:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1771162402;
	bh=/QQfWdap+WntOBgZlTKsQhxDnzoko6VKi8nlZl3PwhE=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=dK14fW9jn/8s4+jMayir6oqEHCzLzPTxpfPEvI1or/tbJAzZ/r73LMtLfRxz11bvl
	 8bA/hqtG2V+p8hYO10picqgh7LqZDzMCgyCOqQI8KS6sNJFxGuNnUJSeXDALX81Qop
	 i3zpexyvq5pZToIfXSYAPmo6rv/61+iLdXE4xg5I=
Date: Sun, 15 Feb 2026 05:33:22 -0800
From: Pauli Virtanen <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1054282/000000-93c85f@github.com>
Subject: [bluez/bluez] 93c85f: a2dp: start connecting sink profile before
 source
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[github.com:s=pf2023];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[github.com:-];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-19068-lists,linux-bluetooth=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6DA6A13EBAA
X-Rspamd-Action: no action

  Branch: refs/heads/1054282
  Home:   https://github.com/bluez/bluez
  Commit: 93c85f72947f5bcdd9642082ed0c9ed7ae5ea51a
      https://github.com/bluez/bluez/commit/93c85f72947f5bcdd9642082ed0c9ed7ae5ea51a
  Author: Pauli Virtanen <pav@iki.fi>
  Date:   2026-02-15 (Sun, 15 Feb 2026)

  Changed paths:
    M profiles/audio/a2dp.c

  Log Message:
  -----------
  a2dp: start connecting sink profile before source

Since cdcd845f87ee the order in which profiles with the same priority are
connected is the same order as btd_profile_register() is called, instead
of being the opposite order.

When initiating connections, we want to prefer a2dp-sink profile over
a2dp-source, as connecting both at the same time does not work
currently.

So swap the order of registration, to restore the previous behavior.

Fixes: https://github.com/bluez/bluez/issues/1898



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

