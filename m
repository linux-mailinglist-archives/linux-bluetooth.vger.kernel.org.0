Return-Path: <linux-bluetooth+bounces-64-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7107EA3B0
	for <lists+linux-bluetooth@lfdr.de>; Mon, 13 Nov 2023 20:22:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 027E0280EC9
	for <lists+linux-bluetooth@lfdr.de>; Mon, 13 Nov 2023 19:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6233C23760;
	Mon, 13 Nov 2023 19:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VjKlXjg3"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B8322EF6
	for <linux-bluetooth@vger.kernel.org>; Mon, 13 Nov 2023 19:22:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D7FFC433C7;
	Mon, 13 Nov 2023 19:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699903337;
	bh=bu24+oW5hHDdwdF8hsyRrimdLy2dArzEpd7sZI5JsyE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VjKlXjg3gHfzTYv3tTLJevIkCZ2JnL+hZJWUOHvgDc6ZYDn+Lqf6dkwGDRkEv7U/I
	 rfghQz8aAYhf3loCHJ7CAY3E8DRgZBOKJRNs+v8a5/FpDMSZ8+dFQgc4uiLYnuWNCo
	 h8BnQzUdpk+Y6r9O/gdPY2glcbqlluovwYHY60upFiFUhhichavM5WcbpqiDrcXj79
	 IjYlG+29UVIKODuhFzhn9CFLqJBipg+ZPwgcghhkkuPdNvSaXACROOi8xiC9JXyqJJ
	 lXbOU+i9y2TUvJzGvq1bKWE+fUCakcLW53DfSLG23js2o9P1ew8ZxLblZKqJSelgq/
	 Tvv/xk55Q8eIg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 32A3AE32714;
	Mon, 13 Nov 2023 19:22:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] client: Invalidate scan filter on "scan" command
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <169990333720.26848.12718109238744965013.git-patchwork-notify@kernel.org>
Date: Mon, 13 Nov 2023 19:22:17 +0000
References: <20231108161949.11276-1-verdre@v0yd.nl>
In-Reply-To: <20231108161949.11276-1-verdre@v0yd.nl>
To: =?utf-8?q?Jonas_Dre=C3=9Fler_=3Cverdre=40v0yd=2Enl=3E?=@codeaurora.org
Cc: linux-bluetooth@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Wed,  8 Nov 2023 17:19:49 +0100 you wrote:
> The "scan bredr" and "scan le" commands are broken right now because the
> transport filter gets set, but not actually invalidated.
> 
> Invalidate the filter with `filter.set = false` so that it actually gets
> updated when set_discovery_filter() is called afterwards.
> ---
>  client/main.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Here is the summary with links:
  - [BlueZ] client: Invalidate scan filter on "scan" command
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=7ef40617a049

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



