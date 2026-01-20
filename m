Return-Path: <linux-bluetooth+bounces-18270-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAf9Gebib2n8RwAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18270-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jan 2026 21:17:42 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F30374B238
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jan 2026 21:17:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6E14272D127
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jan 2026 18:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0CE44103A;
	Tue, 20 Jan 2026 18:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+X+Xl3c"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FF833B6D0;
	Tue, 20 Jan 2026 18:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768933210; cv=none; b=Glk/5GdYYi7/OLAu6cSRhe0+b+D3nHyovYds8s2WoVv7YEhO7c29zUMwE7eRUgDUiCXtD54JOHjfUxe4YtZbLPH5l6N51ORkURe/xh6tXfDs/CaTCYgxWVWwY9629mBKG6tjO58KCWh69Kox9bRF/IFDDYeO20uHKonNRTv2we4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768933210; c=relaxed/simple;
	bh=PLkKmfTSH76hV0ENegKwimGxcy5rze/TomhWxwCkcB8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=bV5cxazgXo74wHtNwO0q+KCe3+QksWlAoYTztw3ewiCMIJ2VcFNE4JUDJpjJl9MY13JMVLmj1CDEIx5bFabi35boeltxRh3Pf+doB9cQ9ft1jTA0lHNrWrMcjSZzEaBsDmiyRevpjOXtqXHChgSzcN65vTYv6ycDyWzXopcuiZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X+X+Xl3c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02ABFC16AAE;
	Tue, 20 Jan 2026 18:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768933210;
	bh=PLkKmfTSH76hV0ENegKwimGxcy5rze/TomhWxwCkcB8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=X+X+Xl3cA5PHpKIv3uTxbS7mS63/bc6Oih3DCjmtZZnuW9qSOPNrtT1GImKIabsN8
	 CKruXFKMLJ5oKsF1OatkI+1obZ+8NhoC4Pz42FHGSbb1ePJ0GViXSpwuJp59nFyciC
	 kdpADCItSD2kWV1MfkyiewvocL0u5uCsHdJ5QKGeZeEMj1eaTJZlLYfiM0PqH+5smQ
	 o//H2G/+YNccgXIeNikdvZ/KrOBEdDtHTYJD9THe2wxfkzI0SPlF6kMYt0uvq5oFDG
	 Qr+u/Zh6j1h+A+A9qhCBTdEAoZkCYI+6hj/8Q5y1D3h4nIr88HhwbkG59YdA53Yo52
	 PApvL9STQgGPg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C8AAD3810935;
	Tue, 20 Jan 2026 18:20:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btintel_pcie: Remove unnecessary check before
 kfree_skb()
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <176893320759.555371.3361610552363578782.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jan 2026 18:20:07 +0000
References: <20260116080703.379903-1-nichen@iscas.ac.cn>
In-Reply-To: <20260116080703.379903-1-nichen@iscas.ac.cn>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FREEMAIL_CC(0.00)[holtmann.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-18270-lists,linux-bluetooth=lfdr.de,bluetooth];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-bluetooth@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,iscas.ac.cn:email,intel.com:email]
X-Rspamd-Queue-Id: F30374B238
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri, 16 Jan 2026 16:07:03 +0800 you wrote:
> The kfree_skb() function internally checks if the skb is NULL,
> so an explicit check before calling it is redundant and can be removed.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/bluetooth/btintel_pcie.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Here is the summary with links:
  - Bluetooth: btintel_pcie: Remove unnecessary check before kfree_skb()
    https://git.kernel.org/bluetooth/bluetooth-next/c/c170a61739fa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



