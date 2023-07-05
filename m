Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3BF8748B25
	for <lists+linux-bluetooth@lfdr.de>; Wed,  5 Jul 2023 20:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233297AbjGESA2 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 5 Jul 2023 14:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231811AbjGESA1 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 5 Jul 2023 14:00:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A7771981
        for <linux-bluetooth@vger.kernel.org>; Wed,  5 Jul 2023 11:00:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B7B27616B5
        for <linux-bluetooth@vger.kernel.org>; Wed,  5 Jul 2023 18:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18B6FC433C8;
        Wed,  5 Jul 2023 18:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688580025;
        bh=JIv23KtIMckh+XtgCR7UVpwi5rE1U8Z0WLiS9BjRwEc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=KlaMtrsuQaQwqFwayDeI/sqSfK70Ud2VjOHXnT3VqfGg9fIcdGIsUUg+8s0XSWZpA
         gdGtNnH2jC96ITp84TnLozaHFbnrVVc6EW4aOOAAhmiXVVPgqTYqTlldv+vL7LhjSf
         SStdWQnCtVxUh/+PCWNrJKwadwjHFOFldFx8EIG0bVmdfPlTLm5nGWE+xk5cOR6Rx8
         b85yg8bbuNWlpW0NRFYjvFxUEdkIJJjpt4WLCwJ3FBTXZeu0EUcxqrzqAoE3gsOy0w
         Dyd7IIz5t7R3RW7T89pobT1j63Pe3clHoZm25VKf3KhDyU1YG1BWGc55F71XEqOYv9
         peCDWpm6n86Ww==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 02E5EC561EE;
        Wed,  5 Jul 2023 18:00:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] mgmt-tester: Add a regression test hitting hci_sync bug
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <168858002500.7518.2490038808205855623.git-patchwork-notify@kernel.org>
Date:   Wed, 05 Jul 2023 18:00:25 +0000
References: <482831b8629d9f4f98ef88c769371a03a872d1b7.1686859345.git.pav@iki.fi>
In-Reply-To: <482831b8629d9f4f98ef88c769371a03a872d1b7.1686859345.git.pav@iki.fi>
To:     Pauli Virtanen <pav@iki.fi>
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

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu, 15 Jun 2023 23:02:51 +0300 you wrote:
> Add a test "Add + Remove Device Nowait - Success" that hits a race
> condition in kernel hci_sync.c.  On current kernels this causes
> 
> BUG: KASAN: slab-use-after-free in hci_update_passive_scan_sync+0x857/0x1230
> 
> due to unsafe iteration of hdev->pend_le_conns (in Linux <= 6.4-rc4).
> 
> [...]

Here is the summary with links:
  - [BlueZ] mgmt-tester: Add a regression test hitting hci_sync bug
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=19ce052d35d3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


