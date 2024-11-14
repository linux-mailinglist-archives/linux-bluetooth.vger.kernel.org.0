Return-Path: <linux-bluetooth+bounces-8627-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1409C945B
	for <lists+linux-bluetooth@lfdr.de>; Thu, 14 Nov 2024 22:24:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10FF9B234B6
	for <lists+linux-bluetooth@lfdr.de>; Thu, 14 Nov 2024 21:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D641AF0C2;
	Thu, 14 Nov 2024 21:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P1tmVQWk"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502EE1AF0AF;
	Thu, 14 Nov 2024 21:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731619447; cv=none; b=IOIAp8SehNfUzo5tp/3TGW8s8RUUwDyxy4KJayzNQfq+pGKV24CwmHiOARq6VepInMzshKH6VX6al2ZBLI4UaQUmNxAWdQeeImPpdVgRTqVnU+LhfLXddVwdcwlPss1jPXESYtA4WeYHp2FTZDeIWHEZDjPhWhnq8LDkkqlX7XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731619447; c=relaxed/simple;
	bh=OUy+ddm4go8yPlxwYolk/IgJUwgMQ7MjHC5v5JVHA7M=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=fF1GhA68g193lRCTXy9OkMH9/VhQxC6rLdBrSViM3ErAGXht7AZpEGP82erZ777f19/SggE2U2iWiGH4Ft/0yZ7mdbSwFJ5rxNhUrzbrjcVlpmshh2YsJMEO1vzQ0Nlj9wP/ky+Iv8DaPJYp2lPub7rdHjd1PKwekSxXXglr14s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P1tmVQWk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D13A0C4CED5;
	Thu, 14 Nov 2024 21:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731619446;
	bh=OUy+ddm4go8yPlxwYolk/IgJUwgMQ7MjHC5v5JVHA7M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=P1tmVQWk70UEo4tukojjKUQlBnnzmrkwJKE38G50dBZcZTnShcbwKNPZgAKtE6uhx
	 xt+36zWNYIyCI/Gk3bnzloJWN0InM5GsA0+EBlifPt2auozwxFQoFo2x9IzDm9oVND
	 3yfk0XfutDgMFQHbkjmTfNU9IOdH0cBwdH//p+jGKdtrD/AcnO9SAapAxOsPG9C4vB
	 tuhxgl8xmlwcxWA+kNq1OJX5dPUeM+ha0j35mtuLCVH7GmUalQ7XJKmVsOeDtFidZp
	 ixeflVv6unJ2fqcyhPDWAkaU//LSkmFapCBxwT7pDd9ZXk7S4LirTvkt/vcXiLydHp
	 JKjreMKMCwRNQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE02A3809A80;
	Thu, 14 Nov 2024 21:24:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: pull request: bluetooth 2024-10-16
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <173161945749.2058902.11542507091793569427.git-patchwork-notify@kernel.org>
Date: Thu, 14 Nov 2024 21:24:17 +0000
References: <20241016204258.821965-1-luiz.dentz@gmail.com>
In-Reply-To: <20241016204258.821965-1-luiz.dentz@gmail.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, linux-bluetooth@vger.kernel.org,
 netdev@vger.kernel.org

Hello:

This pull request was applied to bluetooth/bluetooth-next.git (master)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Wed, 16 Oct 2024 16:42:58 -0400 you wrote:
> The following changes since commit 11d06f0aaef89f4cad68b92510bd9decff2d7b87:
> 
>   net: dsa: vsc73xx: fix reception from VLAN-unaware bridges (2024-10-15 18:41:52 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git tags/for-net-2024-10-16
> 
> [...]

Here is the summary with links:
  - pull request: bluetooth 2024-10-16
    https://git.kernel.org/bluetooth/bluetooth-next/c/d7f513ae7b10

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



