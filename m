Return-Path: <linux-bluetooth+bounces-19822-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Ga8IKGdqGmHwAAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19822-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 04 Mar 2026 22:01:21 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2939A207C7F
	for <lists+linux-bluetooth@lfdr.de>; Wed, 04 Mar 2026 22:01:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6B99F300C0CF
	for <lists+linux-bluetooth@lfdr.de>; Wed,  4 Mar 2026 21:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5BE338422B;
	Wed,  4 Mar 2026 21:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="IQLxrGPo"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-25.smtp.github.com (out-25.smtp.github.com [192.30.252.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF4D272E56
	for <linux-bluetooth@vger.kernel.org>; Wed,  4 Mar 2026 21:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772658078; cv=none; b=CO1ilbblzLKt1caKGwQYAZVd4DlSJ1KwVfsz3En95xiuvg8o8+AOZTfIKD905v2GQ5d38CqI+vWsyxVe8tohWJ4BKo42HsOuhQzL06i46Qr2iz4/eeK7wVUd/F2zTZc4Snd+RwtcbFe7txntjWFdmOL9f2aQYNfOjo4wDDbSJCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772658078; c=relaxed/simple;
	bh=E3p7R8OEmH7BmsoBDVWmXCDeDJKQ+VaE4kvh2Py7iuo=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=p05T/arIx4u+zlXnTVPybp9rZpFbCvMlBv1pV/c9SFTPy/tqYeHsnIa1uUQI/mvYI8u3eZMjiEP+Btb6GQEX622ixpU46GJJe16ZqY58OcLEBLklUabJOQSW3YbqPrEUuALzHqMeZFOSChHXHSz2VHF0Bdg37XMQ2ZgOrIJ7B9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=IQLxrGPo; arc=none smtp.client-ip=192.30.252.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-3696467.ash1-iad.github.net [10.56.189.45])
	by smtp.github.com (Postfix) with ESMTPA id 6F244140B2C
	for <linux-bluetooth@vger.kernel.org>; Wed,  4 Mar 2026 13:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1772658076;
	bh=h2jKKa6IgQtBMOumu5kj1+N0vXq+GRVoJOAEguw9CqQ=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=IQLxrGPo11XkQkE46tzj2hvolw5qliP0Y3CiAJvMdNjadpq6KiwDRhfLpaVKMVzPP
	 5WxTEmHLzWbvdYHJbqCBYnsHwDUux23SDD4VSgYO3T2bHZAxjCLS8nx+H9+ExKNyQz
	 Uexu/blxktZRwLihAehoumyG6S0x5hFSbs1gizeg=
Date: Wed, 04 Mar 2026 13:01:16 -0800
From: Luiz Augusto von Dentz <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1061563/000000-5d88ec@github.com>
Subject: [bluez/bluez] 5d88ec: monitor: Fix -a/--analyze printing wrong
 connectio...
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
X-Rspamd-Queue-Id: 2939A207C7F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	DMARC_POLICY_REJECT(2.00)[github.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[github.com:s=pf2023];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-19822-lists,linux-bluetooth=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[github.com:-];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_SPAM(0.00)[0.933];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:email]
X-Rspamd-Action: no action

  Branch: refs/heads/1061563
  Home:   https://github.com/bluez/bluez
  Commit: 5d88ec3c5e25f29e16e9a2f96877587a15dacb79
      https://github.com/bluez/bluez/commit/5d88ec3c5e25f29e16e9a2f96877587a15dacb79
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2026-03-04 (Wed, 04 Mar 2026)

  Changed paths:
    M monitor/analyze.c

  Log Message:
  -----------
  monitor: Fix -a/--analyze printing wrong connection type



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

