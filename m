Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 715956E2CB4
	for <lists+linux-bluetooth@lfdr.de>; Sat, 15 Apr 2023 01:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbjDNXKV (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 14 Apr 2023 19:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbjDNXKU (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 14 Apr 2023 19:10:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAF1E4221
        for <linux-bluetooth@vger.kernel.org>; Fri, 14 Apr 2023 16:10:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6D92F64AA7
        for <linux-bluetooth@vger.kernel.org>; Fri, 14 Apr 2023 23:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CFACBC4339B;
        Fri, 14 Apr 2023 23:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681513818;
        bh=oEGKuCw1/xi5pLoGcrlgPrydow9J02bX/zxRW5GsS+E=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=DBbIr72mEMLI/+LmrmRCdkD7KmNvh9vWqp/ANexKwxTF3S4gYhZNXXQ6iXd10Uknw
         xZlC8kkIZDkMDikmO8tH6yeo2aLXhxmIpfido3jpURo+2EdEoprDjQOiDJTDpwEisC
         WZYJSRaKDo20hnoTCrn6AmD/t/0bFu9kfd/2R6RvgVcAa/TxX+7/ewnKYhKA4CVvhv
         vM7dXOqStTv6bUMQE5tthKx2mYb6NfAp3YuAoI8weC5CBLpGTG/AfZeP78Dzncf193
         /YMS3hKopB3DAPvpCvR+aB880D58/rvEqHGmjCVkMIHLwUnoC1sldx6Sah5BLsHBzi
         m9hO3j0384Plw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B631CE21EDE;
        Fri, 14 Apr 2023 23:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [BlueZ PATCH v2 1/2] btdev: Fix not setting CIS parameters properly
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <168151381874.682.16487605570281277118.git-patchwork-notify@kernel.org>
Date:   Fri, 14 Apr 2023 23:10:18 +0000
References: <20230413210450.961897-1-luiz.dentz@gmail.com>
In-Reply-To: <20230413210450.961897-1-luiz.dentz@gmail.com>
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

This series was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu, 13 Apr 2023 14:04:49 -0700 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> The code was assuming only index 0 was to be used which doesn't work
> when there are multiple CIS being programmed with different parameters.
> ---
>  emulator/btdev.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Here is the summary with links:
  - [BlueZ,v2,1/2] btdev: Fix not setting CIS parameters properly
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=57b67987d4d8
  - [BlueZ,v2,2/2] iso-tester: Add BAP Audio Configuration tests
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=4d197b859e57

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


