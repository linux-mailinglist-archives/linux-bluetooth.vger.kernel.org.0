Return-Path: <linux-bluetooth+bounces-2401-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 503BC876F34
	for <lists+linux-bluetooth@lfdr.de>; Sat,  9 Mar 2024 05:50:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AE5B282306
	for <lists+linux-bluetooth@lfdr.de>; Sat,  9 Mar 2024 04:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB0B21350;
	Sat,  9 Mar 2024 04:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0n0g77l"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00C21DFFE;
	Sat,  9 Mar 2024 04:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709959837; cv=none; b=qkqShMyhf50JQsWADmm97cm/1rRkx16XwMYNL1nSkJ+udYFjKCbQ6BE9qXnQDsAzcS8hDZv6WQQ0lcD/Uj5IZqdoq9RVIi6j8VhBKc/QiaUDEi1+lQmjva11LXS6gOmcIJOVafmbIcDIeKUx8aTKJDLDetHtEtr1Ktc/CHMTxak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709959837; c=relaxed/simple;
	bh=qtw4JbgLgJL/gMd/IB30CiSk2X6336GMFb5vqapsKhw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=dqIWEhqeSOvFd8DSrdNuwBdkumzw7N0PCKWmEK8ASEk0A/zCN5O7+Xa/3ijDO7T+biVwAph3l8XBl97EOcTjmZjen6hoc3Pm86g0IoSKgfPya34vpqdstjN2P4lJ0kwJtGI3clvHZ4QD4IVdxNRq4AGevg+3MYMPDBR+19C678Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0n0g77l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F931C433F1;
	Sat,  9 Mar 2024 04:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709959837;
	bh=qtw4JbgLgJL/gMd/IB30CiSk2X6336GMFb5vqapsKhw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=o0n0g77lp1KxyJdW8llUzWlZBbLSdFJlZD6k6AkN8ArmxGAH28rcJ+v8LfF8L2OuD
	 cRGbrD8sahTIswAQMEl618ScA7GUWQBhP6fiWmBhyviL2ClDu57TcndammbBp3enQG
	 LN2z+FbGiCdJHD4QFsSQ19Dfp/4W58FagNHiSYrgDEMDjAGJ4jR0W+zxGL8anjx4bh
	 jjyt4pNP273qeVXexsLFJ8WeljzMwJM0yDnLX6kqJCI9V0xmymikuWPJfftm22tvge
	 yKKk/00geqpkW59WItTvDWbRqRI8mdmCGMr4utsDQyP1BKZ2ZLVVLp+/6woDRUyK+m
	 rGyL03nrucZxg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0F8E5C04D3F;
	Sat,  9 Mar 2024 04:50:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: pull request: bluetooth-next 2024-03-22
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170995983705.6704.7256242691943023626.git-patchwork-notify@kernel.org>
Date: Sat, 09 Mar 2024 04:50:37 +0000
References: <20240308181056.120547-1-luiz.dentz@gmail.com>
In-Reply-To: <20240308181056.120547-1-luiz.dentz@gmail.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, linux-bluetooth@vger.kernel.org,
 netdev@vger.kernel.org

Hello:

This pull request was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri,  8 Mar 2024 13:10:55 -0500 you wrote:
> The following changes since commit eeb78df4063c0b162324a9408ef573b24791871f:
> 
>   inet: Add getsockopt support for IP_ROUTER_ALERT and IPV6_ROUTER_ALERT (2024-03-06 12:37:06 +0000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git tags/for-net-next-2024-03-08
> 
> [...]

Here is the summary with links:
  - pull request: bluetooth-next 2024-03-22
    https://git.kernel.org/netdev/net-next/c/2f901582f032

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



