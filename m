Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6BF859A6D0
	for <lists+linux-bluetooth@lfdr.de>; Fri, 19 Aug 2022 22:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349248AbiHSUAS (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 19 Aug 2022 16:00:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231364AbiHSUAR (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 19 Aug 2022 16:00:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA275E3C36
        for <linux-bluetooth@vger.kernel.org>; Fri, 19 Aug 2022 13:00:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8DCE36162D
        for <linux-bluetooth@vger.kernel.org>; Fri, 19 Aug 2022 20:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ECF13C433C1;
        Fri, 19 Aug 2022 20:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660939216;
        bh=jRiRcSg2O1Hb4vQHwfP6uvIKqylQ8/mfkBV4jB6Z7hE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=FDaFAVXbgqcSK7SE8sTulJHdsFC7YkX5S/Dm0305gJJQGtoruH741P5UQcWhhGYkZ
         GSW1DKWCHVeLwZy9gpT0eCcHl6eUP5WwxOdworJmquU+b6ppGG/SqpvfoFnaUOwtCU
         zMksUmbavkY2Jr1cmH46BeYSahybpcAhIZ/ocDVhMz7qLdBxvQBcrZ+wedz9EsyPCL
         erHPjYL6N49lOyIzUw0mnhnjB2SuHKow9Jm5tEZRvrb8Z5sPJMkGK7EeknpyzMTGl9
         m6pHOJrTlKZ0UyN/1Jxd28aBnJiBue5/jLb+vHegXfJ2rz+5V5aP8XMrtRvprmDZg1
         CF8eLIWSu6lzw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D4B72E2A054;
        Fri, 19 Aug 2022 20:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: ISO: Fix not handling shutdown condition
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <166093921586.9792.633047156078121044.git-patchwork-notify@kernel.org>
Date:   Fri, 19 Aug 2022 20:00:15 +0000
References: <20220819184633.19437-1-luiz.dentz@gmail.com>
In-Reply-To: <20220819184633.19437-1-luiz.dentz@gmail.com>
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

On Fri, 19 Aug 2022 11:46:33 -0700 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> In order to properly handle shutdown syscall the code shall not assume
> that the how argument is always SHUT_RDWR resulting in SHUTDOWN_MASK as
> that would result in poll to immediatelly report EPOLLHUP instead of
> properly waiting for disconnect_cfm (Disconnect Complete) which is
> rather important for the likes of BAP as the CIG may need to be
> reprogrammed.
> 
> [...]

Here is the summary with links:
  - Bluetooth: ISO: Fix not handling shutdown condition
    https://git.kernel.org/bluetooth/bluetooth-next/c/a89e4b749aab

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


