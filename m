Return-Path: <linux-bluetooth+bounces-19778-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPfODw8Bp2k7bgAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19778-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 03 Mar 2026 16:41:03 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E23B51F2D12
	for <lists+linux-bluetooth@lfdr.de>; Tue, 03 Mar 2026 16:41:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 52CE2300AC81
	for <lists+linux-bluetooth@lfdr.de>; Tue,  3 Mar 2026 15:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A443B5847;
	Tue,  3 Mar 2026 15:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X7YVYgbC"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C6135CB75
	for <linux-bluetooth@vger.kernel.org>; Tue,  3 Mar 2026 15:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772552404; cv=none; b=sy/X5FpTxhzCxnJPU2S6RJMu2/htzAKZWqENiVOECWusrZ6EtBJVLzaPshlFpPAwRUBj7wyib/haBP+jpIoCwpKGotqsqc1esq6SkK7ZNyvp6Je+qCoye61O3jKx0H7inKVZOcZVGMCLyIbXcVjIRtB25CCMHK5n7BykjznqWTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772552404; c=relaxed/simple;
	bh=geR+e25gI8JIZXUEe54e2qYrHx3SADLCMRTGAizRizU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=A6a3U9UisGh8nUENpnL+tHthwCIqUoWi3s+3qqUKfUriIiTI+aQK93DZcOjrauupC3BAbMXqj8SysYSyZFKsnRD8o80ssbmPAeuha5rRwfXGVmRfev98uuVWnTBi2ZphxenxrfPtKtRyWIlvQ1zYWRJZilz9BVvUu+JUNLu0/jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X7YVYgbC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09C07C116C6;
	Tue,  3 Mar 2026 15:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772552404;
	bh=geR+e25gI8JIZXUEe54e2qYrHx3SADLCMRTGAizRizU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=X7YVYgbC8wJ80+D7eSzeIS9mLlu8WoPg6VekNSxZUyR5Zm2NH7bCn4mhTOhfZjcTm
	 TkIbLjiG5WyB+f3hZbFzeBa/o0Q2AbTr0OqSKI6BmOatmZtQ1WuCjZ4P2YWb117vs9
	 6869oA2MiziCSoG4EzxCfAGj5ZzX4govZT6h1isz8wS+b4Kqsp/K+my5JiJeC0tX1K
	 qUULhpMubWxt3mixsQAlp3GwGSu3z76BgPRKIo+tJXU8iszw08Z2h4CL11ai87Tw65
	 QLF9OP0heW9FdYIBbrVzWlidRV7QHqxJScl4BFUgIOog2rD76iiActGsy8F/CT7TBh
	 /KnZKxUoL+iHw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CF7B3808200;
	Tue,  3 Mar 2026 15:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ v1] bthost: Add segmentation support for L2CAP
 LE-(E)CRED mode
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <177255240530.1348433.9913405371816237932.git-patchwork-notify@kernel.org>
Date: Tue, 03 Mar 2026 15:40:05 +0000
References: <20260225222345.199032-1-luiz.dentz@gmail.com>
In-Reply-To: <20260225222345.199032-1-luiz.dentz@gmail.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org
X-Rspamd-Queue-Id: E23B51F2D12
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-19778-lists,linux-bluetooth=lfdr.de,bluetooth];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-bluetooth@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Wed, 25 Feb 2026 17:23:45 -0500 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> ---
>  emulator/bthost.c | 53 ++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 41 insertions(+), 12 deletions(-)

Here is the summary with links:
  - [BlueZ,v1] bthost: Add segmentation support for L2CAP LE-(E)CRED mode
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=b138a0849ba2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



