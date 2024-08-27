Return-Path: <linux-bluetooth+bounces-7045-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2770796171F
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Aug 2024 20:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EE691C233D5
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Aug 2024 18:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F3C51D27B1;
	Tue, 27 Aug 2024 18:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ISXJjuju"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10BC770F1
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Aug 2024 18:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724784030; cv=none; b=Do+pZK/ZJIouYUcA85S5OHdKN72NqetCPAIxJKhlMJXvWUbd3tIMXWCxOY0CB+c54vnJt0eeX+gEc7QSUBfPHN8PG4P2BMrfbQafi4SuioVFSKeWA/IWG9+QwGGuwJKYEpk6zfcTliOJHxskH6il13YryqJs5MFvglhEZEWCK9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724784030; c=relaxed/simple;
	bh=cQRDaT4GvR4xnZlVkydhK6Xei6xiIfqqPSrIM6zsooQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=GNEffzU1FJge6dnBKBlTfsMjptw6puB2BVLl/pi0HO3HkPcM6qY3ZMBET9CwkNCXV4Fw/CiFVadHZ3KA6M7JBviILlilbH5o/HgRe/wEP6Pb0aPvsvE/TPYnu8vY6tJTj3ydvLdLmz229AGvcuIwYgClV66pZids35AVKPAZ6eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ISXJjuju; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57837C4FDF8;
	Tue, 27 Aug 2024 18:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724784030;
	bh=cQRDaT4GvR4xnZlVkydhK6Xei6xiIfqqPSrIM6zsooQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ISXJjujuo25taZ2yRNCjNeUAV9W0QL/ns7QkkAc211L4t19nJrAKvIPEShvfbhkum
	 gQzducjc1pBdd3ppHnEE/CpIb/zN0sw6uS8VUPl/J3PP+uwjHhSxXNGI+UsRc7XfC+
	 SsiopNMC5+p5tWPM9YEcb48UsYAFujQSivsXIuiess7eSFV/+eHIAQkO0acI0y5Hh9
	 VZlS8LfNLcfBxT9WytQL6B9QQmx3Ue8FLQq28HSHbBFfvKGmTAsfkoLvGrGRlgJBZD
	 DAN83qRQyP7l7+48Yv+vLtCRR+SBpRnfMKeIxqCj0n0lf5k2YmSinDfB3mNYxwr213
	 /h2JP1QcHh3bg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE22D3822D6D;
	Tue, 27 Aug 2024 18:40:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 1/2] Bluetooth: hci_sync: Introduce
 hci_cmd_sync_run/hci_cmd_sync_run_once
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <172478403055.731941.3305100424695483569.git-patchwork-notify@kernel.org>
Date: Tue, 27 Aug 2024 18:40:30 +0000
References: <20240827140529.635522-1-luiz.dentz@gmail.com>
In-Reply-To: <20240827140529.635522-1-luiz.dentz@gmail.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org

Hello:

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 27 Aug 2024 10:05:28 -0400 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> This introduces hci_cmd_sync_run/hci_cmd_sync_run_once which acts like
> hci_cmd_sync_queue/hci_cmd_sync_queue_once but runs immediately when
> already on hdev->cmd_sync_work context.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> [...]

Here is the summary with links:
  - [v3,1/2] Bluetooth: hci_sync: Introduce hci_cmd_sync_run/hci_cmd_sync_run_once
    https://git.kernel.org/bluetooth/bluetooth-next/c/4dd2c5007a2b
  - [v3,2/2] Bluetooth: MGMT: Fix not generating command complete for MGMT_OP_DISCONNECT
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



