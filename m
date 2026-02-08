Return-Path: <linux-bluetooth+bounces-18866-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAC0MCUAiWnF0QQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18866-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Sun, 08 Feb 2026 22:29:09 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5261410A3D3
	for <lists+linux-bluetooth@lfdr.de>; Sun, 08 Feb 2026 22:29:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D82D3009528
	for <lists+linux-bluetooth@lfdr.de>; Sun,  8 Feb 2026 21:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC79B34AAF6;
	Sun,  8 Feb 2026 21:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="A7HR1ZuX"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-27.smtp.github.com (out-27.smtp.github.com [192.30.252.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449B734A3A5
	for <linux-bluetooth@vger.kernel.org>; Sun,  8 Feb 2026 21:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770586135; cv=none; b=X29pA9pEPCkC2ctbL49rDT61snCw/X6Nh5darxFtRqsElbA6aKNfcjIRDpy5EcGVQO5Juorr4n7TYU8AYRhiP6LM1Kzun+exHN2yvmbyS8aKBqn4nrMgYF0tOwgL6oo0ottmTaf/FKJi5TNDYCZFGa1fLWEPhxhBuKj8dkTUq3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770586135; c=relaxed/simple;
	bh=Nq2/9DCVeAGB1sGxofdVBjtbjuq6WxUWWsQmu0HC0dc=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=jFLe4kjpJB8eJblRUUdeuX0Kg/svaUyn8uK7ONkLggG7P/P0wj8kN1VypcsY02PHOExOeGmj+qJCACz4lPhHWCVfTrqouCJqCyxp/T6Mu37bA3nzFd+phcVqmCbSUVZYUBXPhC0y8bq7AmZ5BuIFjkXKbz8AqlCrS/00FPk7P/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=A7HR1ZuX; arc=none smtp.client-ip=192.30.252.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-a0ed000.ash1-iad.github.net [10.56.152.25])
	by smtp.github.com (Postfix) with ESMTPA id 6FB8960025D
	for <linux-bluetooth@vger.kernel.org>; Sun,  8 Feb 2026 13:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1770586134;
	bh=vzVNywvu/LZK5exrglrq9IMLo8i04CC8VdPGYa2ZpPg=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=A7HR1ZuXZ17SB16gVnTjzatK4qKCI1rp1k0tkwcGyrKKAe0NJWNKQGFn+j5T4x57D
	 ishqUeGsTgyiIS5RJgRhz+eNtgcrhnGKoVqm7QnRwWuVS8LHM1MMTKI5CmJY1S/U1V
	 IuO8Biq4sIzzA1HPLxJLjpQBmhvhNrXwMy2DnTGo=
Date: Sun, 08 Feb 2026 13:28:54 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/tags/5.86/000000-6bc24b@github.com>
Subject: [bluez/bluez]
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
	TAGGED_FROM(0.00)[bounces-18866-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5261410A3D3
X-Rspamd-Action: no action

  Branch: refs/tags/5.86
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

