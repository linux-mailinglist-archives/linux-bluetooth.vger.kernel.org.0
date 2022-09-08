Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D6105B28A2
	for <lists+linux-bluetooth@lfdr.de>; Thu,  8 Sep 2022 23:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbiIHVkU (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 8 Sep 2022 17:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbiIHVkS (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 8 Sep 2022 17:40:18 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F9D99877A
        for <linux-bluetooth@vger.kernel.org>; Thu,  8 Sep 2022 14:40:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D90A0B8227A
        for <linux-bluetooth@vger.kernel.org>; Thu,  8 Sep 2022 21:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98537C433D7;
        Thu,  8 Sep 2022 21:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662673215;
        bh=IKG+cBaM78CEZgC0NiceIXBIhwEWoC22HXfR/QpGZGw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=pHqqfJ3hHlNmIUnWSNtkNt0KBRCHjxRlxG4zxnpkqakAQUl+P1eahFDRfxnAIeAjy
         6KZ/4Cz8dnzgzIKKHPTT8oYhbeKwyIYEt+yRcFlI/QQOYyNdC0t9boZLfkvIhj37g+
         gzfkYLX9B8lxRCgWnhHZ87iirdIhtN2UXMnzBHprMyyLac6w2O+mYyr6UEztdS4Dqi
         SdxXBhPYMsyLO63myFozD4aR+XFLQbaqu2D7WofjInuBxOL9XDYFsFTVJRlBngvlfy
         rmShrO7Bi8dRk8hLc4Yzj7XGMB/uXp0jNvB7jHX7VqChW20YIcSoCbGIuwk33uBrnp
         ymzpV5Ahfl8og==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 72653C4166F;
        Thu,  8 Sep 2022 21:40:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ v4 1/2] monitor: Add ADV Monitor events to btmon parser
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <166267321543.740.1461457254146198906.git-patchwork-notify@kernel.org>
Date:   Thu, 08 Sep 2022 21:40:15 +0000
References: <20220908145555.161258-1-brian.gix@intel.com>
In-Reply-To: <20220908145555.161258-1-brian.gix@intel.com>
To:     Brian Gix <brian.gix@intel.com>
Cc:     linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com,
        apusaka@google.com
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

On Thu,  8 Sep 2022 07:55:54 -0700 you wrote:
> Add missing ADV Monitor MGMT events
> ---
>  monitor/packet.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)

Here is the summary with links:
  - [BlueZ,v4,1/2] monitor: Add ADV Monitor events to btmon parser
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=0940cba00348
  - [BlueZ,v4,2/2] monitor: Add mesh MGMT cmds/events to btmon parser
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=9d8fd3c28bbf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


