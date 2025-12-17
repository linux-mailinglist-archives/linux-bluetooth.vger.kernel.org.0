Return-Path: <linux-bluetooth+bounces-17495-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05053CC9A63
	for <lists+linux-bluetooth@lfdr.de>; Wed, 17 Dec 2025 22:55:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE50A3093FB9
	for <lists+linux-bluetooth@lfdr.de>; Wed, 17 Dec 2025 21:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C43BF30FF2E;
	Wed, 17 Dec 2025 21:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TKrp47ve"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6C23101AA
	for <linux-bluetooth@vger.kernel.org>; Wed, 17 Dec 2025 21:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766008400; cv=none; b=DaRhCpw4X3GKb5/tAcxDfCPPERmidl3b+n5AvT918GzELM/MeXR5MpyFemmTZJ6nZWaBCV39LHp8YGrE4PlD1J1Twhl3WU4r+0n+GltOCb0K+abxmMoee+sP9FZp41nRq28reTHUHYrRBuZf+XZd8rvCa9vWizoeWEQZoxnAJxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766008400; c=relaxed/simple;
	bh=UCzOVnhibMnWPlBXhx4p/WVY6oTEg2ZCCaY1+lBNRUk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=B/PTWAD/pXUIgTZXSiYpyZVfSjTylW94H+g2E+xWS8IvdWKbvp4coHAdWtCGCwHkCXZXO9K0z4t/pWAoOBNk6dwCGj++ii/jJhJEJI2MiS9U2Aa7AWr1Gq9sSnTQsg5iCxUKQoMOLMfdUzIRZdSbAmDfy+QNdjYXWEt/RLDdyvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TKrp47ve; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF2AC4CEF5;
	Wed, 17 Dec 2025 21:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766008399;
	bh=UCzOVnhibMnWPlBXhx4p/WVY6oTEg2ZCCaY1+lBNRUk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TKrp47vecXXm8Alqv23BqANjFRdpQgr3QrOIFu4017A2BUICYKXy9kTfstQ1vdP93
	 y06uwfcgY7KFw5zWRCIGbRRrTitYeDHB7Cpz1Nm04yKueg+7L26hPvdHhGrJHm8wsd
	 M5OPj3G+OZOHn90h7tB12YarfXdcR/m5zvamBo3uwlKQIm3X6cZWB5U65SKHv7sX5h
	 8vnN1FqydXS0xd4d6j2J1yxytkODNkIQ/HKhrb6MT3Dm7p4cwQS7yCxuXmebzK5nPb
	 sQlG5WrcIOY0KZ669slYeKL8IiEwF4pzs6rT3mmxdVVPjtix/Gs8aueJFY1Jv1SZsO
	 PtToKTQtEhrdw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F363A3809A34;
	Wed, 17 Dec 2025 21:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btmtksdio: Use pm_ptr instead of #ifdef
 CONFIG_PM
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <176600820978.2253459.8850743046203821977.git-patchwork-notify@kernel.org>
Date: Wed, 17 Dec 2025 21:50:09 +0000
References: <20251217112033.3309281-3-u.kleine-koenig@baylibre.com>
In-Reply-To: <20251217112033.3309281-3-u.kleine-koenig@baylibre.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40baylibre=2Ecom=3E?=@codeaurora.org
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-bluetooth@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Wed, 17 Dec 2025 12:20:33 +0100 you wrote:
> This increases build coverage and allows to drop an #ifdef.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> I found the patch opportunity while looking in this driver for a different
> reason.
> 
> [...]

Here is the summary with links:
  - Bluetooth: btmtksdio: Use pm_ptr instead of #ifdef CONFIG_PM
    https://git.kernel.org/bluetooth/bluetooth-next/c/fd52b1d0ad7d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



