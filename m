Return-Path: <linux-bluetooth+bounces-19836-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kE8NNvhCqWkt3gAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19836-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Thu, 05 Mar 2026 09:46:48 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6BD20DABC
	for <lists+linux-bluetooth@lfdr.de>; Thu, 05 Mar 2026 09:46:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29AFE30A2813
	for <lists+linux-bluetooth@lfdr.de>; Thu,  5 Mar 2026 08:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B575C27E05E;
	Thu,  5 Mar 2026 08:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="Tm1/uT0x"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-24.smtp.github.com (out-24.smtp.github.com [192.30.252.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C40E257423
	for <linux-bluetooth@vger.kernel.org>; Thu,  5 Mar 2026 08:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772700276; cv=none; b=pcU9nsS3f63FyY4ciDqyDmAxsnuyj8do80MZ8QodKGpP7XdohZvoJvWc4Qr08H46MDAw0cQvHjQH6Pdk6MKBYZ05Lvasw4L+5vhitjDU+XQ0eG6e6r8zUh429J4KxRL+u3GaRnCV9ykZyC+HF9BHBvJrlFGTmSpk6Xe1Jq/OPzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772700276; c=relaxed/simple;
	bh=tTZxz8KnSTQ/xBr/32cbKxWgubdtTaVFtOJa5lwf9yE=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=o9XO4sw4oE7S7E03A8mm5sInEhn2gEV6Ilm7cJkBoYcrOQKDfFLipK53UF/XesOQFi9+bPBrplHZEgIwEmdJvwyFPrwE/12mwP33GgisOYmRKEQ5B6OMoWzE5okDx0cs5wKPXM3Ze4vZseEzySXiNUpGZ+IDvdoARj86ypErEOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=Tm1/uT0x; arc=none smtp.client-ip=192.30.252.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-91ad2b0.ac4-iad.github.net [10.52.14.75])
	by smtp.github.com (Postfix) with ESMTPA id 9E5D6640A70
	for <linux-bluetooth@vger.kernel.org>; Thu,  5 Mar 2026 00:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1772700274;
	bh=+o4GfztLwcR+KCMhJa7lXVT8pTYwJm0DK+4Ffc2M9VA=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=Tm1/uT0x7e3bzwQQYNboIA6z8aFPD7mCexBFkkQ/Kg2ULOBJYIDwcr7c4/WKeYXBN
	 QDbsM/1UdPI8Wg7t0J4u3N8i/HmpMv6m/uPaqSzGlBAGveAvmadHscEbb5lFb4Eb5o
	 QD5BBdmwAuIgvOZDEreOJeePJimOreV4hjoBiUBo=
Date: Thu, 05 Mar 2026 00:44:34 -0800
From: "github-actions[bot]" <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1061791/000000-9a6959@github.com>
Subject: [bluez/bluez] 9a6959: transport: Fix set volume failure with invalid
 dev...
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
X-Rspamd-Queue-Id: 4C6BD20DABC
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
	TAGGED_FROM(0.00)[bounces-19836-lists,linux-bluetooth=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[github.com:-];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_SPAM(0.00)[0.948];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

  Branch: refs/heads/1061791
  Home:   https://github.com/bluez/bluez
  Commit: 9a6959f814bb48332c4e1fef69e60a0edaf73173
      https://github.com/bluez/bluez/commit/9a6959f814bb48332c4e1fef69e60a0edaf73173
  Author: Jinwang Li <jinwang.li@oss.qualcomm.com>
  Date:   2026-03-05 (Thu, 05 Mar 2026)

  Changed paths:
    M profiles/audio/transport.c

  Log Message:
  -----------
  transport: Fix set volume failure with invalid device volume

When AVRCP is connected earlier than AVDTP, this invalid device volume
causes the A2DP sink to reject the peer's registration for the
EVENT_VOLUME_CHANGED notification. As a result, subsequent attempts to
set the volume fail.

Fix this by ensuring a valid device volume is returned when the device
volume is invalid, allowing volume registration to succeed.

Fixes: fa7828bddd21 ("transport: Fix not being able to initialize volume properly")
Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

