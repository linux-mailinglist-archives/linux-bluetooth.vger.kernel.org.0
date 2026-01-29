Return-Path: <linux-bluetooth+bounces-18655-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4N2dHImMe2mlFQIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18655-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jan 2026 17:36:25 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C4CB241E
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jan 2026 17:36:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92006300D443
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jan 2026 16:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E75342158;
	Thu, 29 Jan 2026 16:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e4DDKUTg"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82541313281
	for <linux-bluetooth@vger.kernel.org>; Thu, 29 Jan 2026 16:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769704214; cv=none; b=ix7tm/lEhFfmSLEGspdGCjJQAtBCmNfFMWw99msLOgoPWtFGJeLViADU/h0VCcUS9PHBYsyfQgOJh/dJb3WgcwIigHTTbMuIY17cE8JE0p3EcZUHn4yuxaooyu7/RTvUWi04si9CZnKSduoZTkTstq6dVS9suD5Ql4XQCr09AII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769704214; c=relaxed/simple;
	bh=PyLoIzLW4Ad4anrybOSOMK5z7TxwHKuDudmOoCBc8s8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=U6ENOip3oZPhPKfBA4ooNIn0i2x4P7P07wbxsGmFpCLfogM9cKcCEY2ZIXqFhFdKkVAdG3FBO3ovqibAPpCUu4WVtkCgM9JdYfbaxPSQxlBmv4Zr7bqpbYm9cfzhnyU/EFbuwiEwDlIxzM7H/eJ0fxXHEnegf64HIs1yez8ZtJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e4DDKUTg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B07C4CEF7;
	Thu, 29 Jan 2026 16:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769704214;
	bh=PyLoIzLW4Ad4anrybOSOMK5z7TxwHKuDudmOoCBc8s8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=e4DDKUTgLN3tNYViSXdv/vpVpFbxtGOgi1cMojRcauww9F6sTx1ENN7/EdDZeH2fg
	 igVODIl35PNch8/i1MuzaqV0EYq+CI5QkVtGpMcqPv1M0O4FtW//yvWL/iUTxsmpMx
	 De+lVZjPwZcrobHqEjF3tAVNi8jGD2Sw3kXU4mjRw1c9EymnR6dkNpYsleenlY00xy
	 Ns6i1jj9aODqYak1tsV1z4PJp1ERQ9vzgDmlVq8QLozlBhaDgbpf4lvmnf171it0sf
	 ha6NZb0XMV9O81a0SbzgDgnBJOMppXcZwtZE2cOMARnEK4WHs/bqofxFwjDUO6C4iT
	 BIXcrha/JUwYw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8BA57380CECB;
	Thu, 29 Jan 2026 16:30:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ 0/1] build: Don't install btmgmt man page as tool
 isn't
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <176970420714.2563498.9614714813428421557.git-patchwork-notify@kernel.org>
Date: Thu, 29 Jan 2026 16:30:07 +0000
References: <20260129125948.2724071-1-hadess@hadess.net>
In-Reply-To: <20260129125948.2724071-1-hadess@hadess.net>
To: Bastien Nocera <hadess@hadess.net>
Cc: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-18655-lists,linux-bluetooth=lfdr.de,bluetooth];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-bluetooth@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: C2C4CB241E
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu, 29 Jan 2026 13:57:01 +0100 you wrote:
> As discussed in "[PATCH BlueZ v6 10/20] tools: Install btmgmt along with
> other tools".
> 
> I have a similar patch for meson, not sure whether you would prefer it
> integrated in the existing meson patchset (which would require more
> rebase work) or as a fix afterwards.
> 
> [...]

Here is the summary with links:
  - [BlueZ,1/1] build: Don't install btmgmt man page as tool isn't
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=a2d140d70b1c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



