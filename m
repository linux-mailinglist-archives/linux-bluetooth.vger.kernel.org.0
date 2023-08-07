Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7297C7734E0
	for <lists+linux-bluetooth@lfdr.de>; Tue,  8 Aug 2023 01:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbjHGXU3 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 7 Aug 2023 19:20:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbjHGXUY (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 7 Aug 2023 19:20:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B23E41710
        for <linux-bluetooth@vger.kernel.org>; Mon,  7 Aug 2023 16:20:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5167B622EA
        for <linux-bluetooth@vger.kernel.org>; Mon,  7 Aug 2023 23:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1979C433C8;
        Mon,  7 Aug 2023 23:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691450422;
        bh=ewvsidYdf1b0r2UUmDMFczKBoOPU0CcliA31OEh1J2A=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=uv6P4A1V7yGxvbGDKMJaBgJzCOHe4hJsNF/Zxsc7MmbwGkUoESIFRt/8e9UaPz5w3
         Tq7MjDj0rdustX81tmRitp4twAY/RBZMmvIHy2SPo/SEPMq5YYiT+USSm0HvJgAHCP
         mhbBOuGUIgQh/A2GxrAg9tqSgto/fkRM+uOTWkvbEc0NMvCQQeUzpzri/rqxRUSZA1
         Xv4qeUQIAUo8pN0SYofMmMgJ19C/4mIBG71bE1ZhuuksuBcCMXZ7oDQAOamdgSbwrF
         gg25/u4LGrfobpTpCd0e2reamPo/9+7sT9VfeqeG4TE+j41IXxrBOaxv7XONOAQRkS
         WZeyMoDARJi9g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 93BE5E270C2;
        Mon,  7 Aug 2023 23:20:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ 0/2] Report proper error on connect
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <169145042259.20955.11298055921488554509.git-patchwork-notify@kernel.org>
Date:   Mon, 07 Aug 2023 23:20:22 +0000
References: <20230806080109.1639693-1-simon.mikuda@streamunlimited.com>
In-Reply-To: <20230806080109.1639693-1-simon.mikuda@streamunlimited.com>
To:     Simon Mikuda <simon.mikuda@streamunlimited.com>
Cc:     linux-bluetooth@vger.kernel.org
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello:

This series was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Sun,  6 Aug 2023 10:01:07 +0200 you wrote:
> When we connect A2DP profile and remote device doesn't have our key
> (e.g. was deleted) we've received "unknown" error.
> 
> These patches add mapping to "Invalid exchange" error which is returned
> in this use case as "key missing" error.
> 
> Simon Mikuda (2):
>   error: Add "Invalid exchange" mapping
>   a2dp: Expose "Key missing" error
> 
> [...]

Here is the summary with links:
  - [BlueZ,1/2] error: Add "Invalid exchange" mapping
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=0ee60b31a843
  - [BlueZ,2/2] a2dp: Expose "Key missing" error
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=59569c1f947d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


