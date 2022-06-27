Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B55655DE76
	for <lists+linux-bluetooth@lfdr.de>; Tue, 28 Jun 2022 15:29:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233562AbiF0Ia4 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 27 Jun 2022 04:30:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233647AbiF0Iap (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 27 Jun 2022 04:30:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6530626F
        for <linux-bluetooth@vger.kernel.org>; Mon, 27 Jun 2022 01:30:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0349E61030
        for <linux-bluetooth@vger.kernel.org>; Mon, 27 Jun 2022 08:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65979C341CE;
        Mon, 27 Jun 2022 08:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656318636;
        bh=XFRhebjCblXPQ5bK/VNw3Q/dEPSB3QAPTOdpTFOMg4Q=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=drZedS720FnfCmetYVXRYbrk3alXpT7Cp7pDVc7Jf1uDRCheSCpOQnoJmxBe1DVrw
         2i7nrNWABQ9E+qhE7Y10MLHC/aeL8mEnRru8IKcffQhF2kRhFzFt4Zza6ByKgVut8l
         dj6YpAd8/IDWFooGESmC/wC6SK5ajXLa5KUPhNIiNJp18AUXaxdxPgl2JU+WACbAs1
         KC5nCj4iNYdDEY65FGaDKeEYJZhh4e5AIdXrJAd2+GRuaaa87v9KWPCiZiO7sDSSiH
         03jXhXzqBhqdPUYnD8LdCnVWeFwrHMfI7ci5xokyHlB3sKol8ypjUYHir4ukZl17JT
         vzdcrGQyaPwjA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 53665E49BBA;
        Mon, 27 Jun 2022 08:30:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] monitor: Fix crash when using RTT backend
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <165631863633.19048.2034516902275827444.git-patchwork-notify@kernel.org>
Date:   Mon, 27 Jun 2022 08:30:36 +0000
References: <20220624082541.51687-1-szymon.janc@codecoup.pl>
In-Reply-To: <20220624082541.51687-1-szymon.janc@codecoup.pl>
To:     Szymon Janc <szymon.janc@codecoup.pl>
Cc:     linux-bluetooth@vger.kernel.org
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Szymon Janc <szymon.janc@codecoup.pl>:

On Fri, 24 Jun 2022 10:25:41 +0200 you wrote:
> This fix regression introduced by "monitor: Fix memory leaks".
> J-Link shared library is in use if jlink_init() returns 0 and thus
> handle shall not be closed.
> ---
>  monitor/jlink.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - monitor: Fix crash when using RTT backend
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=1d6cfb8e625a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


