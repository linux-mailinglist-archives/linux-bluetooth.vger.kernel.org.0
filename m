Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EEE96CCBC1
	for <lists+linux-bluetooth@lfdr.de>; Tue, 28 Mar 2023 23:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbjC1VA1 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 28 Mar 2023 17:00:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbjC1VA0 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 28 Mar 2023 17:00:26 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 867711BDB
        for <linux-bluetooth@vger.kernel.org>; Tue, 28 Mar 2023 14:00:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2BD0BB81E71
        for <linux-bluetooth@vger.kernel.org>; Tue, 28 Mar 2023 21:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E13F6C4339C;
        Tue, 28 Mar 2023 21:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680037218;
        bh=Ki8qlcAaO7JWXUJrDh5b3qLDmPbxfw8IuV+ERjmSjOM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=t3JELSkuXYtzdUMgQCs1glH5DTMAW63fMuriTuqzc7ogA55bszSAjNjyyCB/v0q6Q
         FUeQO4cp4vS0ajZzI83EfFOEkEdfokqfWmL8kJXlgQpf5JQ2+Fd98uNubpMeV989dW
         QIvpw9qxHC+KbhdcnCW+z1VgMIIwXNbm6SgBAMxVFmm6boyikK3NFmu2D60K/qXxIK
         v/NWe65iiIk+6AVyyaMMWK8hG09UzmKwdRYUr5+FLzW0mCHEvKujLuA/cTb5Lbuzpb
         otsP6Yk9dm2Ckohhib50hUPcUz48HvdrGA0MrCm2GTc5A+JuXmOtxJnAxqsVUxuD6c
         gqS6oJWBweT3Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C8615E50D77;
        Tue, 28 Mar 2023 21:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/2] Bluetooth: Add device 0bda:887b to device tables
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <168003721881.12776.7647058371878538147.git-patchwork-notify@kernel.org>
Date:   Tue, 28 Mar 2023 21:00:18 +0000
References: <20230323174604.30088-1-Larry.Finger@lwfinger.net>
In-Reply-To: <20230323174604.30088-1-Larry.Finger@lwfinger.net>
To:     Larry Finger <Larry.Finger@lwfinger.net>
Cc:     marcel@holtmann.org, gustavo@padovan.org, johan.hedberg@gmail.com,
        linux-bluetooth@vger.kernel.org, hildawu@realtek.com
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu, 23 Mar 2023 12:45:46 -0500 you wrote:
> This device is part of a Realtek RTW8852BE chip.
> 
> The device table entry is as follows:
> 
> T:  Bus=03 Lev=01 Prnt=01 Port=12 Cnt=02 Dev#=  3 Spd=12   MxCh= 0
> D:  Ver= 1.00 Cls=e0(wlcon) Sub=01 Prot=01 MxPS=64 #Cfgs=  1
> P:  Vendor=0bda ProdID=887b Rev= 0.00
> S:  Manufacturer=Realtek
> S:  Product=Bluetooth Radio
> S:  SerialNumber=00e04c000001
> C:* #Ifs= 2 Cfg#= 1 Atr=e0 MxPwr=500mA
> I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=1ms
> E:  Ad=02(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
> E:  Ad=82(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
> I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
> E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
> I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
> E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
> I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
> I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
> I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
> I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms
> 
> [...]

Here is the summary with links:
  - [v2,1/2] Bluetooth: Add device 0bda:887b to device tables
    https://git.kernel.org/bluetooth/bluetooth-next/c/8052aa4f4e7c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


