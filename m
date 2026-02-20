Return-Path: <linux-bluetooth+bounces-19227-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6I7IAVRymGkoIgMAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19227-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 15:40:20 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AB116871F
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 15:40:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 87F54303F47A
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 14:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE234283C93;
	Fri, 20 Feb 2026 14:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tb0ANaXD"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681903E47B;
	Fri, 20 Feb 2026 14:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771598404; cv=none; b=j4z2Ja9ew5W3HY32mwv25Z8Ux0m8D/gPMvoiAfppe5mGLFMmV/qi5N/I7OHxUzHHcQs6Jvi2X0UF2nE62xECuOZlphgC4lj/e+r28sKh2LIuaLaptuB6cw3UbAeTP2/+lqg5fO3duPxQCuQ+AepFzxWkuYyWvtjH1lqFtAw2X0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771598404; c=relaxed/simple;
	bh=RNGWBNoDYNlMRfVdZ5vPCGmmNX7HW7lp2LrCEUjpVqI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=l9Xb0s17FGOSGxWuaHkkSH5gRuKGcUDkPZ8pD/rRyareXE7DSTlt/76g1msVL8grK39fKR6s+dziTIa6qRcBLFOjxIDYdwiZLLBSOOSUpnILmxqnL0G0i6k7X+5THuDy1z/cF7mSQ+VOW+kzmqM2t/GwVpO/xQiBrKuuMAmg8d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tb0ANaXD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDFCBC116C6;
	Fri, 20 Feb 2026 14:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771598403;
	bh=RNGWBNoDYNlMRfVdZ5vPCGmmNX7HW7lp2LrCEUjpVqI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tb0ANaXDLqSWZoFJK9d+qg8iG7dUl+KzSgNTMM53ZUn/0L1WtLNdrHFoi0Ol+IxVt
	 DJzF9NyiD9n7Owav7FTdVbMETSoYgFacAUtyKQZ+BVC4F4wj5LZSwuqNZx20cf/q/Y
	 tS+X3M9z3yBK9ON2kCT2rOXoCe8u9rKcbWfzGVUHyVCPyyC+uxDoAZQ3OuQLk6iS2e
	 R1wuuY2lBoeddAPAbwkyzKZx0pqsbyb5hX7g5VgOue9MOGNtdK4xJow/pbkCU9Dr+f
	 FgWjT6SbIErnfdmBGRmhCFQiVli5PVGHO/27v8kLw4CrKIi1GfjFZmgSrG62nMlSYp
	 mgQsvucfG/rgg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FCFB3808200;
	Fri, 20 Feb 2026 14:40:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] Bluetooth: btusb: Add Lite-On 04ca:3807 for MediaTek
 MT7921
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <177159841186.557111.6936785365893536625.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 14:40:11 +0000
References: <20260219193209.69937-1-dylan.eray6@gmail.com>
In-Reply-To: <20260219193209.69937-1-dylan.eray6@gmail.com>
To: Dylan Eray <dylan.eray6@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, pmenzel@molgen.mpg.de
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,mediatek.com,lists.infradead.org,molgen.mpg.de];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-bluetooth@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-19227-lists,linux-bluetooth=lfdr.de,bluetooth];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 64AB116871F
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu, 19 Feb 2026 20:32:09 +0100 you wrote:
> Add USB device ID (04ca:3807) for a Lite-On Wireless_Device containing
> a MediaTek MT7921 (MT7920) Bluetooth chipset found in Acer laptops.
> 
> Without this entry, btusb binds via the generic USB class-based wildcard
> match but never sets the BTUSB_MEDIATEK flag. This means btmtk never
> triggers firmware loading, and the driver sends a raw HCI Reset that
> the uninitialized chip cannot respond to, resulting in:
> 
> [...]

Here is the summary with links:
  - [v2] Bluetooth: btusb: Add Lite-On 04ca:3807 for MediaTek MT7921
    https://git.kernel.org/bluetooth/bluetooth-next/c/79e029818394

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



