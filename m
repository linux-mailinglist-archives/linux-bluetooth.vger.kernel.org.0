Return-Path: <linux-bluetooth+bounces-1804-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09951852198
	for <lists+linux-bluetooth@lfdr.de>; Mon, 12 Feb 2024 23:40:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9FB42815D0
	for <lists+linux-bluetooth@lfdr.de>; Mon, 12 Feb 2024 22:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64D5D4F1E0;
	Mon, 12 Feb 2024 22:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kser2+sd"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77284DA13
	for <linux-bluetooth@vger.kernel.org>; Mon, 12 Feb 2024 22:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707777627; cv=none; b=rAwKt6Kjd/t7mnc4JcNRIlzdXaIECdxdhRnTNrbkUpLYjXmataa37HcFUDstnnC+pAGje+I/7WHnMyc9zqYvhhimnZw/1hAOglsxhtlwMgPS8a7crHepnJok3TmYRVCdY2eBsIaFT7COCbK9LKAeA7Qkd/zrCJT5vJL2DVL2P/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707777627; c=relaxed/simple;
	bh=USU5B7dOOBBwUseequaBH1KJ1JGl0ycnU+hQ27W4vsY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Tnmio5uJ5ZGMXiWR4N8zGdXQZwYI8sY+TJI1tICI/h+eX4sO1hAdyUYHU3X5e+V0Dh9XwV1p/dZnNj8EwOiZPsgbcbxXjTCeEC1KYN1cAktdRB4LCEqql+0liSILXXASYK3ZTjifQ0HIOgZEX327zcfeK42uXi6lD8OagaGcLls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kser2+sd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44BF4C433C7;
	Mon, 12 Feb 2024 22:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707777627;
	bh=USU5B7dOOBBwUseequaBH1KJ1JGl0ycnU+hQ27W4vsY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Kser2+sdn9A/Txusg/2eR2JIVIL+Cz2SoTnOY1TVHlJQRXz+055zPwpSK0V/T9zjb
	 BO+h/BHUB2CLcbDKMd4QyWZDFhE4UMi5CtubUEPc94geu4ARVN6wXRBmnXIR3ejSqr
	 Nx/xnl+5L+6G4bhrr5uzAubHGgI0FVDP4SLBWazMJjID8Njqd+Ulx9C9N0C6R4OI4h
	 B6Zsn7RlYgwz1KzHhdeTWq3mj/fcq1dhvx/lv1MhO8hNAeBJzUFOcv/2/qdefQDRBE
	 mnUYogKgttE83fzDdXNYJJ07uK05ScU5MuVi4sFv009uBNhj8Jcoc1EvpI9T5c1hhJ
	 XHr7CDKDaKdLg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 319F7D84BC6;
	Mon, 12 Feb 2024 22:40:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] hcidump: Fix help message for --timestamp option
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <170777762719.21057.14158986921798829582.git-patchwork-notify@kernel.org>
Date: Mon, 12 Feb 2024 22:40:27 +0000
References: <20240209150921.1187294-1-arkadiusz.bokowy@gmail.com>
In-Reply-To: <20240209150921.1187294-1-arkadiusz.bokowy@gmail.com>
To: Arkadiusz Bokowy <arkadiusz.bokowy@gmail.com>
Cc: linux-bluetooth@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri,  9 Feb 2024 16:09:21 +0100 you wrote:
> ---
>  tools/hcidump.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [BlueZ] hcidump: Fix help message for --timestamp option
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=41c7f3af0352

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



