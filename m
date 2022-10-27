Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC21C6101A8
	for <lists+linux-bluetooth@lfdr.de>; Thu, 27 Oct 2022 21:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235824AbiJ0TaW (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 27 Oct 2022 15:30:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234988AbiJ0TaV (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 27 Oct 2022 15:30:21 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9BA2D9E
        for <linux-bluetooth@vger.kernel.org>; Thu, 27 Oct 2022 12:30:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7B244B827D4
        for <linux-bluetooth@vger.kernel.org>; Thu, 27 Oct 2022 19:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23359C433D7;
        Thu, 27 Oct 2022 19:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666899017;
        bh=dMVt2aaJfTQ7/uo1lV3uPSKergSFF2qGyL+IXIhexQU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Dprgf5WEaNb+Nf+VyGVNdlnwILUOo+a59YqwXsrkoogH5r9FOPz9RxWcf8/8ZYA/T
         +rFakxCy56BfhfsUgT1TDBbolLnl5ZlCJB9C4RodUtFjODQZ+frV00qKmBwKSIzkz0
         K9E/RCLm1Wg3twPzh3qBdlY+S13ZLoK8c/a3L/VaJeKJePPwHodzdCGy8BkxN0wMcN
         3PZGJtq2wDPhLWKMpFT+Po5D5si6RsdQ1FAbbkMh23vLWt9riW2kmn2IfX19ScVT3T
         IRtdo8+7NhqjWQuI72iuSyA7NotatAv1BBNy6wgsGBzA6DT46hYNsSPujqVk4d/LIF
         IPDOxll3/69/A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EFF25C73FFC;
        Thu, 27 Oct 2022 19:30:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] Bluetooth: btusb: Add CONFIG_BT_HCIBTUSB_POLL_SYNC
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <166689901697.8009.10698817492624838797.git-patchwork-notify@kernel.org>
Date:   Thu, 27 Oct 2022 19:30:16 +0000
References: <20221025211258.1385541-1-luiz.dentz@gmail.com>
In-Reply-To: <20221025211258.1385541-1-luiz.dentz@gmail.com>
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

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 25 Oct 2022 14:12:57 -0700 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> This adds CONFIG_BT_HCIBTUSB_POLL_SYNC which can be used to set the
> default behavior of Bluetooth USB controller with respect to poll
> synchronization of its endpoits.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> [...]

Here is the summary with links:
  - [1/2] Bluetooth: btusb: Add CONFIG_BT_HCIBTUSB_POLL_SYNC
    https://git.kernel.org/bluetooth/bluetooth-next/c/f038652da9db
  - [2/2] Bluetooth: btusb: Default CONFIG_BT_HCIBTUSB_POLL_SYNC=y
    https://git.kernel.org/bluetooth/bluetooth-next/c/aa02d16d9c08

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


