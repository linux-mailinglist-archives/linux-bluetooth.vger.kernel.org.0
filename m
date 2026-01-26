Return-Path: <linux-bluetooth+bounces-18419-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SF5dM0/md2k9mQEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18419-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 23:10:23 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA6A8DDBF
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 23:10:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E06F6302D0F2
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 22:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3DC03009E1;
	Mon, 26 Jan 2026 22:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f7s9119L"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E644D3019A6
	for <linux-bluetooth@vger.kernel.org>; Mon, 26 Jan 2026 22:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769465412; cv=none; b=MDTcCtrKEd2etyGdgAKuWFJKITzXFW8jU+jrSGIDJiOFyI3weyh47YMMssDwndOxhG5oJ1xXsjeBOOs440ySJIHFMtarLYKS3l4QQmmhiwvlXxDzGp5XDToajdxhHlVNM6zNxG7qq5ihT1pUMFYL10gUha3SZXn6mPVlbxgBIN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769465412; c=relaxed/simple;
	bh=v/6ct36cr3Hi2NhI4ZEx86TRqMr2yEMbJzn19JtRtBk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=MH+y5Xb9K1pv3ysxwjkunl4jtI3nlG1+vfxcNc01bqG061ZAAQ2jVHRylg9O7enKTrrrfI7xz9UAFaVjzhsjW69am6IibfgIdlEEaGo8FRxJ6AuysrPdxO69x934UU4CIuDf476OKlcqUIVCjbrdPz7C8JN2B1/ibSE03rIVYbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f7s9119L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BEC0C116C6;
	Mon, 26 Jan 2026 22:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769465411;
	bh=v/6ct36cr3Hi2NhI4ZEx86TRqMr2yEMbJzn19JtRtBk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=f7s9119L0CM1ltyea5k2xdf7yEbKjV0HI82zwuZY0YakVMSO3tnAYOnSDeJgoe0r9
	 CkihIkHbCQg0GUQTNSA0cN4KTm9RrAkLwz6Wsx2kCNCyKru4aJ0h6BKXv4N6gXK0B7
	 QA7NzMEMsaewth7u3QiLKQuerHwX58ly2ZweHUufm4iFix6+hKraYvs9IWs0sFmvdN
	 wZfyxG4rQN3kEwoFTuROi9jI1AlOA78rDPrf1JTXzrlQAD7lDRi01BoZZonHYAbVmQ
	 HuJPjTpSWWOrLtIJL5F8GxQpsaerLGH8w2o4eau1qZfukOD/uGXYOBZKPNx2ri1vX4
	 ki7VSBEqnsXLQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 11CC9380A958;
	Mon, 26 Jan 2026 22:10:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [BlueZ 0/2] Documentation fixups
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <176946540585.196436.4757082840100826538.git-patchwork-notify@kernel.org>
Date: Mon, 26 Jan 2026 22:10:05 +0000
References: <20260122170001.122052-1-hadess@hadess.net>
In-Reply-To: <20260122170001.122052-1-hadess@hadess.net>
To: Bastien Nocera <hadess@hadess.net>
Cc: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-18419-lists,linux-bluetooth=lfdr.de,bluetooth];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-bluetooth@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 4CA6A8DDBF
X-Rspamd-Action: no action

Hello:

This series was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu, 22 Jan 2026 17:58:56 +0100 you wrote:
> Some documentation fixups after "Port text docs to RST and move man
> pages" got merged.
> 
> Bastien Nocera (2):
>   doc: Add "C" code-block markers for coding-style doc
>   doc: Update .gitignore for new daemon man page locations
> 
> [...]

Here is the summary with links:
  - [BlueZ,1/2] doc: Add "C" code-block markers for coding-style doc
    (no matching commit)
  - [BlueZ,2/2] doc: Update .gitignore for new daemon man page locations
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=3f21f7817a40

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



