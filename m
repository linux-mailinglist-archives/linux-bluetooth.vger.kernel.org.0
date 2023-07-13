Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CDDB752ADD
	for <lists+linux-bluetooth@lfdr.de>; Thu, 13 Jul 2023 21:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbjGMT1A (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 13 Jul 2023 15:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjGMT07 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 13 Jul 2023 15:26:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3DF51989
        for <linux-bluetooth@vger.kernel.org>; Thu, 13 Jul 2023 12:26:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4181B61B3C
        for <linux-bluetooth@vger.kernel.org>; Thu, 13 Jul 2023 19:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9AFD8C433C7;
        Thu, 13 Jul 2023 19:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689276417;
        bh=UcLv6JPWzqnQyBaRNXGLE+LNY8gSn4nOvNcA3zlZvS0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Gx8TkBzTvBBJOSu3ofHuTWrlimIBFOk5kAw2zCr+qX23MscCz9FYLcgA14lpuPZJb
         SKwF0ZHhhNGqc3p/EzecDouhxQAzhso/aAhtZ06QDt9ZHlVb7t+mRTXjHh6IgqdhcY
         Wh0DgzuafoYWGhzgUoA9YSTuoIRU1RUPVtkiMxsmxY+z7CrM+VJYOodsXnM43Fqea2
         4RX31Rw1epdS3Q+8XTIM6x+ZDIiHdY7jqCQAk3MyxKDvCQHGFjo40P1WzH/Oejay8b
         Jk52gbXc0FuoSpdCtjWTuPFOmL55RliBCB71RDqWJO++DhsbDQ5PIn+MmEKJ53QF1Z
         3hed5bpzxI/LQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7265CE4508F;
        Thu, 13 Jul 2023 19:26:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ v2 1/2] test-runner: set non-quiet printk before running
 tests
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <168927641746.6361.8863203110548738608.git-patchwork-notify@kernel.org>
Date:   Thu, 13 Jul 2023 19:26:57 +0000
References: <e521a8d35e8baff45db1fdf8a26725bdc8d595ee.1689196901.git.pav@iki.fi>
In-Reply-To: <e521a8d35e8baff45db1fdf8a26725bdc8d595ee.1689196901.git.pav@iki.fi>
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

This series was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu, 13 Jul 2023 00:22:48 +0300 you wrote:
> It is useful to see WARN_ON etc. messages when running the tests.
> 
> The 'quiet' in cmdline suppresses levels >= WARN, so re-enable them
> explicitly after boot, so that it is on by default and doesn't need to
> be handled in local test scripts.
> ---
> 
> [...]

Here is the summary with links:
  - [BlueZ,v2,1/2] test-runner: set non-quiet printk before running tests
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=7cea6b964119
  - [BlueZ,v2,2/2] test-runner: fix behavior when no audio server
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=9aff3f494142

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


