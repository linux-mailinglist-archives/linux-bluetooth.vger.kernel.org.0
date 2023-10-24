Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 177057D4384
	for <lists+linux-bluetooth@lfdr.de>; Tue, 24 Oct 2023 02:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjJXAA2 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 23 Oct 2023 20:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjJXAA1 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 23 Oct 2023 20:00:27 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE56EE5
        for <linux-bluetooth@vger.kernel.org>; Mon, 23 Oct 2023 17:00:25 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86048C433C9;
        Tue, 24 Oct 2023 00:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698105625;
        bh=4oWYcLHkuNEOFMr9LsI3cMKfFRst3F45y1Tf941R8is=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=YJ/qdwbDh1AokWdntYgGHV6Fl1APrn7e/aaXVecevg1lBzC85lbbC8NwDy8xFm5+z
         W9iJiRlCyx4X61UpQyQL/K/Qk/DsxL7vpkxYAkz9uzZt7irSkT26DvrSw6hG9BFV0X
         +l3/bBl+RSqE4N3QWJ39HvCqWS45MKr9o/mTvEgJiyAJDXXViruqu+UGXEPYSIZXtz
         o4zmB+Q62xYWERIrmioXIZg0ViQc7FsBp81+IXiIJhS7bNxQyGGRxB4/duS+3/jdXt
         j7CfK3jCl5FlQqVTK0Rn2VfkrmFqg3jLK2Oaca9hkGmrOIJPIDuv2CVNrA8Q2N6a4Q
         M29kaAGSM0bgg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6E598E4CC11;
        Tue, 24 Oct 2023 00:00:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: pull request: bluetooth-next 2023-10-23
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169810562544.27223.14391491254024201624.git-patchwork-notify@kernel.org>
Date:   Tue, 24 Oct 2023 00:00:25 +0000
References: <20231023182119.3629194-1-luiz.dentz@gmail.com>
In-Reply-To: <20231023182119.3629194-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     davem@davemloft.net, kuba@kernel.org,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello:

This pull request was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 23 Oct 2023 11:21:19 -0700 you wrote:
> The following changes since commit d6e48462e88fe7efc78b455ecde5b0ca43ec50b7:
> 
>   net: mdio: xgene: Fix unused xgene_mdio_of_match warning for !CONFIG_OF (2023-10-23 10:16:47 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git tags/for-net-next-2023-10-23
> 
> [...]

Here is the summary with links:
  - pull request: bluetooth-next 2023-10-23
    https://git.kernel.org/netdev/net-next/c/f4dbc2bb7a54

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


