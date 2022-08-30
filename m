Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8942A5A6F28
	for <lists+linux-bluetooth@lfdr.de>; Tue, 30 Aug 2022 23:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbiH3Va3 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 30 Aug 2022 17:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231511AbiH3VaX (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 30 Aug 2022 17:30:23 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 084EB54CAD
        for <linux-bluetooth@vger.kernel.org>; Tue, 30 Aug 2022 14:30:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AD617B81E29
        for <linux-bluetooth@vger.kernel.org>; Tue, 30 Aug 2022 21:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B93CC43141;
        Tue, 30 Aug 2022 21:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661895019;
        bh=NengFvu7NmpAS5r16wS4cNM8gds3RKFbavmzguoNEws=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=LuIz1III3ZF/tKX3d+K3JP6ig/sjBUneICf+I4Epgkm5tCz8FocG/rpAvq8Z73JB5
         7Oz4sUJ8PwY3cp8ZH0cJ9X2oZsjsmeV8EQzOO8gei6WE5Xn/lLiEPM39pUUjDG6gR5
         FqzT0yo3dteV8JifTGEStTJGRMALxLanCxKgMLNqiBBfsui/sJuEej1GNYdlU9LHAX
         PVOSZSgYzEPLKgYOlVZXBE2CBwFYfieDDOUIK9t9I2oYGHhg5cSeEWI895Oc+zBRc0
         wmnhhLBPGx67DAF0HH/NyA1M8zNyn9WKtsQrNULsXY1BOWsaZJwqXzGJWmbftYJFgP
         QVyYxrR9Zewrg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2B986E924D9;
        Tue, 30 Aug 2022 21:30:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ 1/2] shell: Set empty argument if optarg is NULL
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <166189501917.8541.2918886148033361938.git-patchwork-notify@kernel.org>
Date:   Tue, 30 Aug 2022 21:30:19 +0000
References: <20220829213738.779598-1-luiz.dentz@gmail.com>
In-Reply-To: <20220829213738.779598-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org
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

This series was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Mon, 29 Aug 2022 14:37:37 -0700 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> This sets enmpty string ("") when argument don't set any optarg so the
> application can tell when an option was set or not.
> ---
>  src/shared/shell.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [BlueZ,1/2] shell: Set empty argument if optarg is NULL
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=75f73f6d6264
  - [BlueZ,2/2] client: Add -e/--endpoint option to auto register endpoints
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=d297a5873d21

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


