Return-Path: <linux-bluetooth+bounces-19228-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LlhAmpymGkoIgMAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19228-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 15:40:42 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A53168746
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 15:40:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EAA003045E30
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 14:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4612A29ACC5;
	Fri, 20 Feb 2026 14:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G1l9+e10"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C771C296BCC;
	Fri, 20 Feb 2026 14:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771598405; cv=none; b=h/KpOYK0X6VrCOzzeigogn4a7iy4npYjZc20iQDrbmswughxSLobOn1EDHhVEVRVdftwzKBrDLReBbXGADZ49yNrUKzv4g6YzRAynNGCPS2BgUC6B7ec+ER4H/nnhn3iPZpbtkFOn/nTiFH5FzxN214td7uHCrT2x/FHmI2gg0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771598405; c=relaxed/simple;
	bh=tkRwBn7BcPYK5rmfPiOmtGpVZ1QeA/yKKhXwQX9TTG8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=QU6UC/WBcgrZnMuUSWlR37FqZdpqTnZaGZKHUytyQeElcj7oPklxtPM1Hnk39gXPqVjO2b8AsLVDqBvCcu/VzGz5f7CmPiMZoiSiP9WwkIrQNqvTs8VG04KKtmoc8jeQFHbudmu3eT3hbDrkl8+f2S7v48vdJHUIOUYReouZsqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G1l9+e10; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A97FCC116C6;
	Fri, 20 Feb 2026 14:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771598405;
	bh=tkRwBn7BcPYK5rmfPiOmtGpVZ1QeA/yKKhXwQX9TTG8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=G1l9+e100qYIQwimRQ7U/eo5uF6rfzaVOmUKV+oLJtbkIuBm3tz22eJRFMgh84k6a
	 bbnFgTpn9PbG8gauRJRRWuoxaOyDscVT6B5Vh8pjH56zp5AQsRgPHgbW6mMtta3Wt6
	 RKSWMVGljJdfcEg4ssU/YeHX5iUNQgbP6RGlqCMGzQAfdWgjXUIkvw1I+EmXxqcPPM
	 hKcKFNPsoIaQsQES4hHQeNPZvQhIvmDQesiEQSYqCW9tyDfisk1t21nXGLwJciM9uY
	 CThJOwLLRrquPO5SKQyM6V43S+KMeS3iLRa4W97OhDQGYTrvF2blTNiDozuHBomlaJ
	 4R3eUpRSlnv6A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02C653808200;
	Fri, 20 Feb 2026 14:40:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btintel_pcie: Replace snprintf("%s") with
 strscpy
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <177159841352.557111.9749419798966170616.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 14:40:13 +0000
References: <20260220080058.1112042-2-thorsten.blum@linux.dev>
In-Reply-To: <20260220080058.1112042-2-thorsten.blum@linux.dev>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-19228-lists,linux-bluetooth=lfdr.de,bluetooth];
	FREEMAIL_CC(0.00)[holtmann.org,gmail.com,vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-bluetooth@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,linux.dev:email]
X-Rspamd-Queue-Id: 73A53168746
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri, 20 Feb 2026 09:00:59 +0100 you wrote:
> Replace snprintf("%s", ...) with the faster and more direct strscpy().
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/bluetooth/btintel_pcie.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Here is the summary with links:
  - Bluetooth: btintel_pcie: Replace snprintf("%s") with strscpy
    https://git.kernel.org/bluetooth/bluetooth-next/c/8b5910aaa50c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



