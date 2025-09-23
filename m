Return-Path: <linux-bluetooth+bounces-15481-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C65CB9616B
	for <lists+linux-bluetooth@lfdr.de>; Tue, 23 Sep 2025 15:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 423921885F8A
	for <lists+linux-bluetooth@lfdr.de>; Tue, 23 Sep 2025 13:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4645920125F;
	Tue, 23 Sep 2025 13:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qz0jXI8i"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FA71FBC8E
	for <linux-bluetooth@vger.kernel.org>; Tue, 23 Sep 2025 13:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758635413; cv=none; b=Vi4cBwjAZfaKDTIWQSe4qb6Et5/SkDyPfn+8gbBVzEurM85nJz/2vN/LFlQcSnz8kvq5aWE1uox3kTeIGWWWAlx4oW1AAf7L2ranMEL2ufvP1pvPMUJx3sHbECXzWN3eWB35wLd/dcaoT2GQI8y17Ac7Ge6TLrKRLnAdbgLuzVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758635413; c=relaxed/simple;
	bh=4SH9vyoZnNEbb3QthltEnCVTgb1yrzOVsZuszH5sSdE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=o6G5qcFSGTVjHEPl/sUjXBuLAKsBsIKCiLzuF+JdW6VOPlJCi8codNx5A42QybDDvTIM0GYnFjMx97A7kpKHVhWF0w4s2eRI3d4RSWEG3ka+geMrKzO+EJS0K4PQCllKKyV5LQLRwPJL7gABpbfLaJWzWfADoSwXVlz4gTdAKHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qz0jXI8i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FFA9C113CF;
	Tue, 23 Sep 2025 13:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758635412;
	bh=4SH9vyoZnNEbb3QthltEnCVTgb1yrzOVsZuszH5sSdE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qz0jXI8i9FDLQb4KJYpJpmdcBd+XDROJeQ5VuYN61S5BHA8aZfpGTLlwsehcmZG6y
	 48oql/gj16EpbPXkoqOt+DkXW/2PJqqucYxxVbvAbEUUOGO1j3eTzW13UXE7ZVpS1f
	 US31YTSvEByi8hW6rzVsHKt0XpdK3eX0WVqets+SirlqF2qANmUvDI0/6mIDstur7q
	 mhrxgBZuB2wQrT0RahpyD0nhLD+lWz+0dmRGuBi/W6sBD4MMJXfKu/5BxXesvDkfkS
	 XQvLrxZLUUV9IJ27SZ70BjzGRjntxKbDrNBZvirJoyjF1xA6enE9unZ3GwBU/R8D3v
	 vbWa8yCzUDPUA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8E20239D0C20;
	Tue, 23 Sep 2025 13:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1] Bluetooth: SCO: Fix UAF on sco_conn_free
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <175863540948.1433266.5301790379006343669.git-patchwork-notify@kernel.org>
Date: Tue, 23 Sep 2025 13:50:09 +0000
References: <20250922203107.3112454-2-luiz.dentz@gmail.com>
In-Reply-To: <20250922203107.3112454-2-luiz.dentz@gmail.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Mon, 22 Sep 2025 16:31:07 -0400 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> BUG: KASAN: slab-use-after-free in sco_conn_free net/bluetooth/sco.c:87 [inline]
> BUG: KASAN: slab-use-after-free in kref_put include/linux/kref.h:65 [inline]
> BUG: KASAN: slab-use-after-free in sco_conn_put+0xdd/0x410
> net/bluetooth/sco.c:107
> Write of size 8 at addr ffff88811cb96b50 by task kworker/u17:4/352
> 
> [...]

Here is the summary with links:
  - [v1] Bluetooth: SCO: Fix UAF on sco_conn_free
    https://git.kernel.org/bluetooth/bluetooth-next/c/5ee0b635cbcd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



