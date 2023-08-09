Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44235776644
	for <lists+linux-bluetooth@lfdr.de>; Wed,  9 Aug 2023 19:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232845AbjHIRUX (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 9 Aug 2023 13:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231938AbjHIRUW (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 9 Aug 2023 13:20:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF0D41B6
        for <linux-bluetooth@vger.kernel.org>; Wed,  9 Aug 2023 10:20:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 66614641D8
        for <linux-bluetooth@vger.kernel.org>; Wed,  9 Aug 2023 17:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA665C433C9;
        Wed,  9 Aug 2023 17:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691601620;
        bh=0OGZsjC/wlC37ZGGPioTyzLALiNjtTKuRaso0caLuXY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=rDUQxBmUTrJi3VN6uq/hQNognmdYTs0nhxHftsyiD9F1MtIY+5j36gBHntEmiXI3v
         oRKhZPNAX8omxBhcXSZl2BFd1NAc8KrfeTG9dmx2FLQsS0gizq3HPArOIXCLCgG089
         oXL0tEeitNTpVWp4t9xWIGtCSQGsN4O7bmlAZtWD3yWvImgRQxity2GXKyGmIoTXB4
         ygk1q/HuYBaoT+ocqdm0ZFUvfPFjeS5KLSaiFn/cLwu8o5FbbeLnLAx6m60kRXwJo3
         WAs2F/iOFCUhT8x4PV4VVmGRAwkXqLbhZpDVAisev+sKFmd9l2lzzcbWRFWF9Upn9i
         92fkZxEFXIRLQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AADA7E505D5;
        Wed,  9 Aug 2023 17:20:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ v5 0/7] Add support for BAP broadcast sink
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <169160162069.13361.8621022436013059913.git-patchwork-notify@kernel.org>
Date:   Wed, 09 Aug 2023 17:20:20 +0000
References: <20230808115040.4403-1-claudia.rosu@nxp.com>
In-Reply-To: <20230808115040.4403-1-claudia.rosu@nxp.com>
To:     Claudia Draghicescu <claudia.rosu@nxp.com>
Cc:     linux-bluetooth@vger.kernel.org, iulia.tanasescu@nxp.com,
        mihai-octavian.urzica@nxp.com, silviu.barbulescu@nxp.com,
        vlad.pruteanu@nxp.com, andrei.istodorescu@nxp.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello:

This series was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue,  8 Aug 2023 14:50:33 +0300 you wrote:
> This series of patches adds support for BAP broadcast sink.
> It consists in registering a broadcastsink endpoint using the
> Basic Audio Announcement Service UUID,
> discovering of broadcast advertisers that announce the
> Broadcast Audio Announcement Service, synchronizes to the Periodic
> advertisements of the source and synchronizes to the BIG advertised
> in the PA train.
> To retrieve the BASE info advertised in the PA train, the patch
> Bluetooth: ISO: Add support for periodic adv reports processing
> was used.
> 
> [...]

Here is the summary with links:
  - [BlueZ,v5,1/7] client/player: Add broadcast sink endpoint
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=4352a42ec1e2
  - [BlueZ,v5,2/7] btio: Add support for getsockopt(BT_ISO_BASE)
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=7b3aa05323f2
  - [BlueZ,v5,3/7] adapter: Do not filter out broadcast advertiser
    (no matching commit)
  - [BlueZ,v5,4/7] profile: Add probe_on_discover flag
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=67a26abe53bf
  - [BlueZ,v5,5/7] bap: Add support for BAP broadcast sink
    (no matching commit)
  - [BlueZ,v5,6/7] media: Add broadcast sink media endpoint
    (no matching commit)
  - [BlueZ,v5,7/7] transport: Update transport properties for a broadcast stream
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


