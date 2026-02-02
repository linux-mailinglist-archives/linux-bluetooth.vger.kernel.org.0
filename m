Return-Path: <linux-bluetooth+bounces-18790-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FUUObDUgGmFBwMAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18790-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 02 Feb 2026 17:45:36 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4656ACF1BB
	for <lists+linux-bluetooth@lfdr.de>; Mon, 02 Feb 2026 17:45:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B47E302A2C3
	for <lists+linux-bluetooth@lfdr.de>; Mon,  2 Feb 2026 16:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93479355809;
	Mon,  2 Feb 2026 16:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUe2BgR3"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230FA2580FB
	for <linux-bluetooth@vger.kernel.org>; Mon,  2 Feb 2026 16:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770050408; cv=none; b=PssVBJsCQnR22VJTAJa2cHFgaXBm3VyZenzs2BqatqQT26RFtTbpSA65NawtB8BxxpfdCt3oHC1LpCNZjIBbkwwZJFr+tQbWL6pAu0jZSwxazM5z6fOjtdd6Lk8/GSOBw+zXrWxFqbvxVsHJ0AI2tNOLnJTc7gT6db7m+xUXoLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770050408; c=relaxed/simple;
	bh=5ew3XFMvcNz43D64FXJ2WkU92e7ms1uwfzV2useex/4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=oquUpI2hHq2Zq+qwm1zhUYqOXRKvlU8PZc2LrD9k01ar8DfJg/jpXoU6MaFc9ikpnAC7kPCDswojqOGIWhlq7xmpk2n0cvXccSzfwnLUC96NSP6/THEJ67KNKApUCL6+y6DFpWeGsJ+9w6Kw4wJq2M0cdQmC7VZXGtfEWd5QwV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OUe2BgR3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D6EDC116C6;
	Mon,  2 Feb 2026 16:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770050407;
	bh=5ew3XFMvcNz43D64FXJ2WkU92e7ms1uwfzV2useex/4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OUe2BgR3SP+eVzHO3xft43BLwWAryIuTKLN7jOdmtQ2JrWVS/6nTQLa8ekruVQ1OT
	 LbBQWJo4F8Cu3KEg/6LYqDHSQS33hpbQY9Oa4YekQkyrQ9CcP0vEs4thvag139vp9g
	 zZnKKSPbLmcD4BhdqM91KFWj9CEUNObayXPEeNhXiGVckhYYzy+zprIvZZnLB/GuHq
	 TBozrWOQ3E29ksdAk8FoUmcvUs3XZVoRCKq9bGEMpCjeZm+4coKKxg2z5Z9Pmku6ZT
	 svI/k06gdEeIjUpdOE8/zZdnOz4oBKYCjcLHna8j5DXPVrWcFxwbV8n4T8rIpxfrbl
	 c7YgWZ3xMa/lg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id CDFAA3808200;
	Mon,  2 Feb 2026 16:40:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ v1 1/2] monitor/att: Add initial decoding for HIDS
 attributes
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <177005040463.1106893.4832508792487556852.git-patchwork-notify@kernel.org>
Date: Mon, 02 Feb 2026 16:40:04 +0000
References: <20260130155637.1150573-1-luiz.dentz@gmail.com>
In-Reply-To: <20260130155637.1150573-1-luiz.dentz@gmail.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-18790-lists,linux-bluetooth=lfdr.de,bluetooth];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 4656ACF1BB
X-Rspamd-Action: no action

Hello:

This series was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri, 30 Jan 2026 10:56:36 -0500 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> This adds decoders to HID Information and HID Control Point
> characteristics.
> ---
>  monitor/att.c | 82 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)

Here is the summary with links:
  - [BlueZ,v1,1/2] monitor/att: Add initial decoding for HIDS attributes
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=ba27f7a12246
  - [BlueZ,v1,2/2] monitor/att: Fix printing data twice
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=4c963f21e56a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



