Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50E7773742F
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jun 2023 20:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbjFTSa3 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 20 Jun 2023 14:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229877AbjFTSa0 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 20 Jun 2023 14:30:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E06710D0
        for <linux-bluetooth@vger.kernel.org>; Tue, 20 Jun 2023 11:30:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 25AB26140B
        for <linux-bluetooth@vger.kernel.org>; Tue, 20 Jun 2023 18:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70B44C433C9;
        Tue, 20 Jun 2023 18:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687285824;
        bh=MY1BHCkeUPdxBis95+7Uxi6+94I1AKFghmglrTG3qZ4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=DZ1x3HsWyAtLcBa+fl2e0xZCC69yR/OVnb+xLNtvHrjpxFG5MF0dclzZ5TRbBQ7fM
         DP/lfRLZfXWTLF+uOjnTrCCHO0pgAjGhBslC6d8iUiTua4XMFJD1W8tBQFIBypVtVi
         zCAd4DYfPZoPdM3SOWFN2aCqRIA5a6j5+c3Cg4u425RyQmj2Gh24tGmHJ2zt2ItZ63
         FGtqhPSq2lR8peo8Oq6Sahj57tTBWOwxK2VLJyxTgWmAau6DmRGUZbJvYy+5367A7c
         LdpyO/wtM2COOMl4ZLA+PMtC5X0UaUG2StPW5bKUAAD6iHLXSEp0rb2fy2+jISHOvu
         GuyFB7gF9o6rg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4DB45E21EDF;
        Tue, 20 Jun 2023 18:30:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: ISO: Rework sync_interval to be sync_factor
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <168728582431.12887.15855920687011013512.git-patchwork-notify@kernel.org>
Date:   Tue, 20 Jun 2023 18:30:24 +0000
References: <20230608182037.3332558-1-luiz.dentz@gmail.com>
In-Reply-To: <20230608182037.3332558-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu,  8 Jun 2023 11:20:37 -0700 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> This rework sync_interval to be sync_factor as having sync_interval in
> the order of seconds is sometimes not disarable.
> 
> Wit sync_factor the application can tell how many SDU intervals it wants
> to send an announcement with PA, the EA interval is set to 2 times that
> so a factor of 24 of BIG SDU interval of 10ms would look like the
> following:
> 
> [...]

Here is the summary with links:
  - Bluetooth: ISO: Rework sync_interval to be sync_factor
    https://git.kernel.org/bluetooth/bluetooth-next/c/cb3fdf2ebf99

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


