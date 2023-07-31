Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36DC3769FC0
	for <lists+linux-bluetooth@lfdr.de>; Mon, 31 Jul 2023 19:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231246AbjGaRu3 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 31 Jul 2023 13:50:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230252AbjGaRu0 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 31 Jul 2023 13:50:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C9B3103
        for <linux-bluetooth@vger.kernel.org>; Mon, 31 Jul 2023 10:50:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0577261265
        for <linux-bluetooth@vger.kernel.org>; Mon, 31 Jul 2023 17:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F386C433CB;
        Mon, 31 Jul 2023 17:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690825824;
        bh=RYmpAyaxUdDufrRp7HEwG9c24SMMx0pMChrJfRsRmes=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=JiA9llmpIYg2YDQCpGBlZYrdlv8VQp96V2Lmt1KgHr/0TC5TY9Gy3tKIa6ccLU0Fr
         yLkV6a2FFpSBGcXdoZfPFgS+Y9kEyDPTWEN2p80vxOUSycD+edJPWrYQBbmt+epxqx
         xVO4v1HKd53J1XPAsB7SK6Zgbdj+8/1A9i6m5Evvlb1hT4VuJ6CN+WOhgnjR2i/Awg
         Bz4FHrumRue+XrBYQg/9LrU37dn6wWRzron4u4ujdXu0M+9HPv6NdK+GNQFkNgTdDn
         lWGmo3a2VQbFJh05fAHCKeDLjc+xhhVDJ4h+K0mL/0YnGiJrFVVHt3a7EAz0r9cG32
         Ff6ujGdiQmD1w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 46D5EC595C0;
        Mon, 31 Jul 2023 17:50:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ 1/2] adapter: Be able to use ConnectDevice for
 discovered devices
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <169082582428.13999.16429356285051317455.git-patchwork-notify@kernel.org>
Date:   Mon, 31 Jul 2023 17:50:24 +0000
References: <20230731041229.1429016-1-simon.mikuda@streamunlimited.com>
In-Reply-To: <20230731041229.1429016-1-simon.mikuda@streamunlimited.com>
To:     Simon Mikuda <simon.mikuda@streamunlimited.com>
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

On Mon, 31 Jul 2023 06:12:28 +0200 you wrote:
> This can be useful when you want to specify trasport type for already
> paired device (e.g. use LE transport for dual mode device).
> ---
>  src/adapter.c | 3 ---
>  1 file changed, 3 deletions(-)

Here is the summary with links:
  - [BlueZ,1/2] adapter: Be able to use ConnectDevice for discovered devices
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=caf7db313e9d
  - [BlueZ,2/2] adapter: Update ConnectDevice documentation
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=255ef572ca76

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


