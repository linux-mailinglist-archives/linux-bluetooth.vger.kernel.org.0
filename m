Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6459B765FE9
	for <lists+linux-bluetooth@lfdr.de>; Fri, 28 Jul 2023 00:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232877AbjG0Wu1 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 27 Jul 2023 18:50:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbjG0Wu0 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 27 Jul 2023 18:50:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D9331FEC
        for <linux-bluetooth@vger.kernel.org>; Thu, 27 Jul 2023 15:50:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EFA8C61F50
        for <linux-bluetooth@vger.kernel.org>; Thu, 27 Jul 2023 22:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A286C433CB;
        Thu, 27 Jul 2023 22:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690498224;
        bh=dYzZMiaYaDYR9iCHRkgcTWSIVsluHhttzzvdG3vRCpg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=fjEo/G/uda8qwqmNYZNct/OQ+SNEvbEd2FD0O9McnSvvEAxa6ieeQv5ULRbXnlaQg
         6H/5vA89bRg9jDRdNXmibhYG119CxamLPLPZtDYmzlYU6MjQIiASkiHJ6rPVdeRV1N
         ARMgYx2dtGX8UiXVBq1BlKWh3aTD50tPW9LI3HA3DaCzuDlh8EZwHO+QL9qr/3fNI0
         MlOhJSX5BgqyIHpyEbTAiufLOTcC74Ee/drq6WGGlHVRWTEMSGlBaF5u+bXuH3wXDu
         uT3iRjYHXyd5eEANyBHSRa49vQ2VtzzRjoBT7jDE3+YaFM6H6wT+JcYTORvxqjzr2m
         8uG8gAM6/dTHQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3233FC40C5E;
        Thu, 27 Jul 2023 22:50:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/1] bluetooth: nokia: fix value check in
 nokia_bluetooth_serdev_probe()
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <169049822419.13443.14257648881528856141.git-patchwork-notify@kernel.org>
Date:   Thu, 27 Jul 2023 22:50:24 +0000
References: <20230726133000.20417-1-ruc_gongyuanjun@163.com>
In-Reply-To: <20230726133000.20417-1-ruc_gongyuanjun@163.com>
To:     Yuanjun Gong <ruc_gongyuanjun@163.com>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
        linux-bluetooth@vger.kernel.org
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

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Wed, 26 Jul 2023 21:30:00 +0800 you wrote:
> in nokia_bluetooth_serdev_probe(), check the return value of
> clk_prepare_enable() and return the error code if
> clk_prepare_enable() returns an unexpected value.
> 
> Fixes: 7bb318680e86 ("Bluetooth: add nokia driver")
> Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
> 
> [...]

Here is the summary with links:
  - [1/1] bluetooth: nokia: fix value check in nokia_bluetooth_serdev_probe()
    https://git.kernel.org/bluetooth/bluetooth-next/c/d5e8b6a140ec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


