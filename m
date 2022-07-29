Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 901855848E6
	for <lists+linux-bluetooth@lfdr.de>; Fri, 29 Jul 2022 02:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233438AbiG2AKZ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 28 Jul 2022 20:10:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232711AbiG2AKS (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 28 Jul 2022 20:10:18 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E26613CD7
        for <linux-bluetooth@vger.kernel.org>; Thu, 28 Jul 2022 17:10:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1FF8DB82662
        for <linux-bluetooth@vger.kernel.org>; Fri, 29 Jul 2022 00:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DEAC2C43141;
        Fri, 29 Jul 2022 00:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659053414;
        bh=s+gorKEvDLtRB+AbIFTXPmnF4d1vdISrHSw7dyL86U8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=LQH2EkhUGIOewS4GBnoqKEghn69RRFMiEg6QLOf7x1TTSBYyqEuGNNP8GCbZHTDFM
         UDJwlC23IH4UqFsadRUoYXWe8LKU/QffaU34U/wS48539hJ1QibRhHsAwVbAFv4rrO
         io1Z1Gi5G+dRHRtQ9OWJ8fEYu2GGjT/c8ia7QqNMZsBm566fRzziw3WaQrPGwP96Pi
         DvzevgLZTOdiiI4WrCjaMkh+uw1EyhtTnt+hOxsw2EL95s0+dYWwfHbg5x9fThmPXu
         zROqKp+5tT0IMV6mzSWgv6dm4RDeFBInd2aLTFbQyodBXVghgkXGhnnaz7MExWvHjK
         RervDiKVXe8rA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CAAD4C43140;
        Fri, 29 Jul 2022 00:10:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] Bluetooth: ISO: Fix info leak in iso_sock_getsockopt()
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <165905341482.26440.10612245878751333719.git-patchwork-notify@kernel.org>
Date:   Fri, 29 Jul 2022 00:10:14 +0000
References: <20220728235130.1323745-1-luiz.dentz@gmail.com>
In-Reply-To: <20220728235130.1323745-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu, 28 Jul 2022 16:51:30 -0700 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> The C standard rules for when struct holes are zeroed out are slightly
> weird.  The existing assignments might initialize everything, but GCC
> is allowed to (and does sometimes) leave the struct holes uninitialized,
> so instead of using yet another variable and copy the QoS settings just
> use a pointer to the stored QoS settings.
> 
> [...]

Here is the summary with links:
  - [v2] Bluetooth: ISO: Fix info leak in iso_sock_getsockopt()
    https://git.kernel.org/bluetooth/bluetooth-next/c/2cd0542726ba

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


