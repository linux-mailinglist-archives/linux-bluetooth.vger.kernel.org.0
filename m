Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 283CD558BB8
	for <lists+linux-bluetooth@lfdr.de>; Fri, 24 Jun 2022 01:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbiFWXaR (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 23 Jun 2022 19:30:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbiFWXaP (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 23 Jun 2022 19:30:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48043366B9
        for <linux-bluetooth@vger.kernel.org>; Thu, 23 Jun 2022 16:30:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DD5BD612FA
        for <linux-bluetooth@vger.kernel.org>; Thu, 23 Jun 2022 23:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2290FC341C8;
        Thu, 23 Jun 2022 23:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656027014;
        bh=opJjFM4zRDbOyWelIb7DJQYu9T8+dmnfLDj9nKSQ/v8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=G5Yr8qspBntVHMLLLjgEmydLYLanRImotl5tGlywXacpGXWxgUM0MthFaFmFfol3e
         qCEX+4ab8emBLKf8p1lzQBehNNQgKxdBdCPEYj5vJ/wTzc6lM2J6ZPiXdfAzcQZHyI
         2CCFhie2agMdXOy3nctLOMmqUqR2whp7ak8tFYLDcUDOsYYt+/ydoxLNDlq1hkSVFf
         2uJ2r9Z39y1AYiSY86w9HQ8FtOX0cA72ozouEWVrN5CYG4LNqrGuTI5L8+xO2+HOoo
         kdFtM8ftUzqqceJFONy7t4anaNf0NoYYMlU0h6lsBzc9evvcv0zoBHYQpuYEuQxQej
         yGgNo8jhbm4zg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 015C6E8DBCB;
        Thu, 23 Jun 2022 23:30:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] device: Fix not removing connected device
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <165602701399.3875.5236197071224398310.git-patchwork-notify@kernel.org>
Date:   Thu, 23 Jun 2022 23:30:13 +0000
References: <20220623062953.13419-1-wangyouwan@uniontech.com>
In-Reply-To: <20220623062953.13419-1-wangyouwan@uniontech.com>
To:     Youwan Wang <wangyouwan@uniontech.com>
Cc:     linux-bluetooth@vger.kernel.org
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
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

On Thu, 23 Jun 2022 14:29:53 +0800 you wrote:
> [bluetooth]# connect 40:EF:4C:0C:11:F0
> Attempting to connect to 40:EF:4C:0C:11:F0
> [CHG] Device 40:EF:4C:0C:11:F0 Connected: yes
> Connection successful
> [CHG] Device 40:EF:4C:0C:11:F0 ServicesResolved: yes
> [UFO]# remove 40:EF:4C:0C:11:F0
> [CHG] Device 40:EF:4C:0C:11:F0 ServicesResolved: no
> Device has been removed
> [CHG] Device 40:EF:4C:0C:11:F0 Connected: no
> [bluetooth]# info 40:EF:4C:0C:11:F0
> Device 40:EF:4C:0C:11:F0 (public)
>         Name: UFO
>         Alias: UFO
>         Class: 0x00240418
>         Icon: audio-headphones
>         Paired: yes
>         Trusted: no
>         Blocked: no
>         Connected: no
>         LegacyPairing: no
>         UUID: Headset
>         UUID: Audio Sink
>         UUID: A/V Remote Control Target
>         UUID: A/V Remote Control
>         UUID: Handsfree
>         UUID: Phonebook Access Server
> 
> [...]

Here is the summary with links:
  - device: Fix not removing connected device
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=65f7faf5a3d0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


