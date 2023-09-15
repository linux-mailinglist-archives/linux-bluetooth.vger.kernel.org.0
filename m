Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CED37A2769
	for <lists+linux-bluetooth@lfdr.de>; Fri, 15 Sep 2023 21:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbjIOTuc (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 15 Sep 2023 15:50:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236306AbjIOTua (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 15 Sep 2023 15:50:30 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C4721BC7
        for <linux-bluetooth@vger.kernel.org>; Fri, 15 Sep 2023 12:50:26 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8A21C433C8;
        Fri, 15 Sep 2023 19:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694807425;
        bh=CY8Kltp0dtzCOOGki4rsyzPCumItu8bRrm3RE7bg6AM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=YJ8dFHcdR0Rye+TT70bG1qFzypBbD8vxI61LAl8qkgbnIu/xN6LZSTFBxatX32hH7
         899Z+lF3eGClvGLrHhEBbX/lsv8ha1eYx7oOyZRbKCjEmjvFirEu82nfLfoEw9gzYS
         LMoprt/ZZHteALX6EleZlFfxgq0e6qPVKOuZp2xc2LQNmsnbFGCoY37vLjaAL2msT9
         Y0RdCdgnZ7NxcqpXJQL7KIEBBdBrn4o86N9FT4nzT19XGElgetQpwQCqD4KL7Nk+G2
         Ps29utPfpZACqSL6HK05ps7QTGgdPg1sO+GQA8cwABGh0GWJB0MNlJqk1hgfN/CpsD
         1w5Cmw7kB1olQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B219CE26882;
        Fri, 15 Sep 2023 19:50:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/2] l2cap-tester: Add tests for closing socket before
 connection completes
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <169480742572.23728.10687776546673068500.git-patchwork-notify@kernel.org>
Date:   Fri, 15 Sep 2023 19:50:25 +0000
References: <20230914211003.3339238-1-luiz.dentz@gmail.com>
In-Reply-To: <20230914211003.3339238-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello:

This series was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu, 14 Sep 2023 14:10:02 -0700 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> This adds the following tests which attempts to close/shutdown the
> socket before the connection completes:
> 
> L2CAP BR/EDR Client - Close
> L2CAP LE Client - Close
> L2CAP Ext-Flowctl Client - Close
> 
> [...]

Here is the summary with links:
  - [v2,1/2] l2cap-tester: Add tests for closing socket before connection completes
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=d46f91c5be57
  - [v2,2/2] l2cap-tester: Add tests for connection timeout
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=7b9d2f3c7634

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


