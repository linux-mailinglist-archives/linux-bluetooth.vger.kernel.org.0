Return-Path: <linux-bluetooth+bounces-19128-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPXZCRq9lGm4HQIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19128-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 20:10:18 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F9914F84A
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 20:10:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4265B303E75B
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 19:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F248137474B;
	Tue, 17 Feb 2026 19:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DgNV3rOn"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0D037647E
	for <linux-bluetooth@vger.kernel.org>; Tue, 17 Feb 2026 19:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771355414; cv=none; b=H+BDIIwwK75TaSnl+QlbCOsQ/ezdcaJSlPYiIaybHc7p5IXTdHSamqjJ+i4sLSgnPB1+EqtV0F6UhDa6xCW7k/vXq1N1VhLK2QN9H12r6aqHulNAqGN3b24BZ4b+iub3BvSiTSBtGUr5Dbp94P/9nf1fa25Q2z6hOcwzPFtTvVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771355414; c=relaxed/simple;
	bh=WQUnMbGE9c80sZLjnAqJf0hFjQvpFDAfUi2LOJFDsAs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=h3yIEWMtgtZBNPT3PYFjEdHqiLCAbEdaE76ithogw//sDunUZGa3497YGt0SDgQLIoy5NTzzXI0aaiq+isXpEnZwk/Q7topYV3HNswPpmkoHTU6xZj0UDLOTf6uaJxgx+Ixwz+8DK9/otpMEzgxK2oALNgWaWOl1glwgjIj6ZGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DgNV3rOn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39558C19421;
	Tue, 17 Feb 2026 19:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771355414;
	bh=WQUnMbGE9c80sZLjnAqJf0hFjQvpFDAfUi2LOJFDsAs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DgNV3rOnIbdAUGBTx5I7uwwkYR28DhbivKh3Ccgqml73v6+ceOFN0kNvxMovYm/fS
	 b6LepD7cOzFL4A/xDAqSFozgwkKATbK21aVCSIFH1OeugOhZnLxriJRNIG4OMz2HCj
	 jvGLryRCVurrfu4dvCfkALZZlwuHcx+LREF6OASMjgdELeNO+mu8jaXkaV272ypJ3e
	 K+iLfcqb9txXhDYlbhb/5NGG7Ew3ZSWtURHflCzqccLPvpF0YGI3ziUTpfCVoozAMx
	 9kKRTIIshZXoq4I6wS9dqBaKYK3aqC/M3el+sL1oH8SvNG09cK1thEBA8I56OXXWHR
	 q9K189RXV9k5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 547253806667;
	Tue, 17 Feb 2026 19:10:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] src: retain const qualifier from pointer
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <177135540607.607841.11316108168210224949.git-patchwork-notify@kernel.org>
Date: Tue, 17 Feb 2026 19:10:06 +0000
References: <aYclgBGSNj0peBdM@f3de6192b473>
In-Reply-To: <aYclgBGSNj0peBdM@f3de6192b473>
To: Rudi Heitbaum <rudi@heitbaum.com>
Cc: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-19128-lists,linux-bluetooth=lfdr.de,bluetooth];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-bluetooth@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 99F9914F84A
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Sat, 7 Feb 2026 11:44:00 +0000 you wrote:
> Since glibc-2.43:
> 
> For ISO C23, the functions bsearch, memchr, strchr, strpbrk, strrchr,
> strstr, wcschr, wcspbrk, wcsrchr, wcsstr and wmemchr that return
> pointers into their input arrays now have definitions as macros that
> return a pointer to a const-qualified type when the in put argument
> is a pointer to a const-qualified type.
> 
> [...]

Here is the summary with links:
  - src: retain const qualifier from pointer
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=450e99f0801f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



