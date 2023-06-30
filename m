Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF1697443B4
	for <lists+linux-bluetooth@lfdr.de>; Fri, 30 Jun 2023 23:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232168AbjF3VAZ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 30 Jun 2023 17:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231718AbjF3VAY (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 30 Jun 2023 17:00:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEF8F3C2A
        for <linux-bluetooth@vger.kernel.org>; Fri, 30 Jun 2023 14:00:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 60BEE61808
        for <linux-bluetooth@vger.kernel.org>; Fri, 30 Jun 2023 21:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CAA4DC433C8;
        Fri, 30 Jun 2023 21:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688158822;
        bh=qSvPWx1q0/T/fNedxuVZVhK8CN/OJPHYemn555vjXsQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=eiwdobsRxpLUtAA6l4UShmQoOVcOmB4m4QLpk8d2xlcSy/aLz1220H99KMFnDIGlD
         mgIq9ArnUeObuVHTgJhNDXWEVKiKyV4UE6/pzVWlssYxOTQPuUwILz3bYIoXbB25Q4
         Gsa3lr0m6lLUy8/jhU1DhNzS/dLEpEfKzCHB/SorWbEVHKRuEbQe9J5i7hclHRs6Fa
         nH/qnuREa98DLA7Gf9dyTb/YNlv7pq7Xy/tNzubzU8yvs3/YSXxIs7gU2YrsDNXl+J
         LUpQ89ua0He/vcxo/FJUkGj627eOIyEMqex6t4jiXQ0Lc3AsNQPx5hyWxiNuoq4fVu
         phPWGfdRSoYuA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A47F3C39563;
        Fri, 30 Jun 2023 21:00:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] transport: Fix crash on Transport.Acquire
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <168815882267.8509.7367344074919731762.git-patchwork-notify@kernel.org>
Date:   Fri, 30 Jun 2023 21:00:22 +0000
References: <20230630192642.3591626-1-luiz.dentz@gmail.com>
In-Reply-To: <20230630192642.3591626-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org
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

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri, 30 Jun 2023 12:26:42 -0700 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> This fixes crash introduced by 3030883 which caused requests not be
> initialized properly for A2DP.
> 
> Fixes: https://github.com/bluez/bluez/issues/542
> 
> [...]

Here is the summary with links:
  - [BlueZ] transport: Fix crash on Transport.Acquire
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=19319bd3e22e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


