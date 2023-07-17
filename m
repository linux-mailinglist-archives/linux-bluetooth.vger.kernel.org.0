Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8512B756DE8
	for <lists+linux-bluetooth@lfdr.de>; Mon, 17 Jul 2023 22:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231467AbjGQUA1 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 17 Jul 2023 16:00:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231580AbjGQUA0 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 17 Jul 2023 16:00:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 358EAD8
        for <linux-bluetooth@vger.kernel.org>; Mon, 17 Jul 2023 13:00:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BE4096124D
        for <linux-bluetooth@vger.kernel.org>; Mon, 17 Jul 2023 20:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3505FC433CD;
        Mon, 17 Jul 2023 20:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689624024;
        bh=qqCclp6mH3eCpPeaNchY0sHJq/k+qt3vOPBd93r9Vv8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=hPMbXYD9uYbY5qeT3C5bNj+fP1bAUoLh7Qfm4zDHNTRv4CwY0WGNFlXBOBi5Vp5p2
         6CFDrW0o5UzpCWhSeaKmBAfgWWpgefZoids0+3mkf4m5d/yrkfNs5/OqOj3qTA4E3d
         zn6wpRPfGK1qNpHM2P22PjcvT5sl6b5wZJOlPYGtPsJ+QFmItjm1z0U0VPuFnaDxc+
         rNEMOYL7QQ+Vk8oCJmFG+H+I5KchDZiQFnqpq3aLO956aNTTRqOl7COwUkWDpiNI6p
         qgnJyQt52Loe2Lp1W/0phfVZAR9Jmx/N/+ZRM4ZoNIZoq6vgIPZeI0D1ARvYSDOXun
         mQsk2NqudJxfw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1F9B4C561EE;
        Mon, 17 Jul 2023 20:00:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/2] bthost: Add support to set ISO Packet Status
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <168962402412.17606.7773996611180416035.git-patchwork-notify@kernel.org>
Date:   Mon, 17 Jul 2023 20:00:24 +0000
References: <20230714181500.2371014-1-luiz.dentz@gmail.com>
In-Reply-To: <20230714181500.2371014-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello:

This series was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri, 14 Jul 2023 11:14:59 -0700 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> This adds support to set ISO Packet Status to bthost_send_iso.
> ---
>  emulator/bthost.c  | 12 ++++++------
>  emulator/bthost.h  |  4 ++--
>  tools/iso-tester.c |  2 +-
>  3 files changed, 9 insertions(+), 9 deletions(-)

Here is the summary with links:
  - [v2,1/2] bthost: Add support to set ISO Packet Status
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=92bb384f5f40
  - [v2,2/2] iso-tester: Add test for BT_PKT_STATUS sockopt
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=17b229e8e451

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


