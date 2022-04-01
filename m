Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6B74EFD13
	for <lists+linux-bluetooth@lfdr.de>; Sat,  2 Apr 2022 01:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353370AbiDAXcH (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 1 Apr 2022 19:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235849AbiDAXcF (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 1 Apr 2022 19:32:05 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 111C5109C
        for <linux-bluetooth@vger.kernel.org>; Fri,  1 Apr 2022 16:30:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B69B3B8256B
        for <linux-bluetooth@vger.kernel.org>; Fri,  1 Apr 2022 23:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 632F9C340EC;
        Fri,  1 Apr 2022 23:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648855812;
        bh=25I26CwjTiYDLIbPoR31AKvseimKDzgf+mRgsTyXUvw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=fGfPTbvh3AaTtyj8aYaHfKQM4mK35olKefe4M93hrTQtAca4Q6hzIeQ12FRXVXqSJ
         Pe8xct1XhB0gM4Yo7J0Sb3REyLvoCURJWmCD+MzABuaPioZSLQyKGdmTqRBB5oYpIc
         9Xl7Hj6UX4jzogCJ+0s93yBHeNqrdPo7ldfPdfxyzkvRvvcYaceCSPqAtcDOE2+NL6
         msnzzz/Yif65lmPjl8k2r4i5LkJ7+UIR9ONp7yGc8TZN6JhVpXAWBnh2y6sqFOxMLS
         n2FeEztJK0Q8WswixuAxSDEvTbEWI/g8WioMJOQFyjE+fzg+qxvRe+QBV8lEreufUQ
         vhmT4IdIlz42g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3F386EAC09C;
        Fri,  1 Apr 2022 23:30:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] btdev: Check parameter for CIG related commands
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <164885581225.24141.16286250938644636361.git-patchwork-notify@kernel.org>
Date:   Fri, 01 Apr 2022 23:30:12 +0000
References: <20220331223207.3243206-1-luiz.dentz@gmail.com>
In-Reply-To: <20220331223207.3243206-1-luiz.dentz@gmail.com>
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

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu, 31 Mar 2022 15:32:07 -0700 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> This checks if the parameters given to Set CIG Parameters and Remove CIG
> are in the valid range.
> ---
>  emulator/btdev.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 59 insertions(+), 1 deletion(-)

Here is the summary with links:
  - [BlueZ] btdev: Check parameter for CIG related commands
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=6d15315570a4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


