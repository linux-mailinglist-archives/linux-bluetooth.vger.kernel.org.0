Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3304E73EBF9
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jun 2023 22:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbjFZUmj (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 26 Jun 2023 16:42:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230164AbjFZUmc (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 26 Jun 2023 16:42:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 107191BC1
        for <linux-bluetooth@vger.kernel.org>; Mon, 26 Jun 2023 13:42:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4312960F70
        for <linux-bluetooth@vger.kernel.org>; Mon, 26 Jun 2023 20:42:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8FA1EC433CB;
        Mon, 26 Jun 2023 20:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687812134;
        bh=mHlcb0Ua1eTbQHqkn5Em11auw5sTp5f396Wun14CE84=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=oGkGKMmRtDpIPuSwwIhadEFYhaEGOxYzVGLPXWDbJwY+Wehfut4AwpcW7Myaif3L8
         tFXuyFOwv3vWc6HYQUhoI2STTTmB3Bw/2MVHzar6SIzzVM6MH3UIA+5YO3WT2UJql2
         sSFCTUL1+W1DaYpW1tR7/fL3Dw3L6UFkqduIdaR9u0DrIsuTbc41jpL3IsfX2Imdh5
         xFUF5fR9mcLntpT3yx6Ym03d51hmlY/jp39CEExi/pA4k3/asYemWoTGW5DNKCCKSy
         u44qS4C0+QEsut30ZwR23vNzH5vsscJSyoWBlybhJ/U0tw0kQLcf8QeFz7SY99yElH
         es0pml7isvVAw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6B742C59A4C;
        Mon, 26 Jun 2023 20:42:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: pull-request: bluetooth 2023-06-05
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <168781213443.29844.3540247436138409374.git-patchwork-notify@kernel.org>
Date:   Mon, 26 Jun 2023 20:42:14 +0000
References: <20230606003454.2392552-1-luiz.dentz@gmail.com>
In-Reply-To: <20230606003454.2392552-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     davem@davemloft.net, kuba@kernel.org,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello:

This pull request was applied to bluetooth/bluetooth-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  5 Jun 2023 17:34:54 -0700 you wrote:
> The following changes since commit fb928170e32ebf4f983db7ea64901b1ea19ceadf:
> 
>   Merge branch 'mptcp-addr-adv-fixes' (2023-06-05 15:15:57 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git tags/for-net-2023-06-05
> 
> [...]

Here is the summary with links:
  - pull-request: bluetooth 2023-06-05
    https://git.kernel.org/bluetooth/bluetooth-next/c/ab39b113e747

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


