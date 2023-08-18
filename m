Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1AEB781471
	for <lists+linux-bluetooth@lfdr.de>; Fri, 18 Aug 2023 22:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240429AbjHRUu5 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 18 Aug 2023 16:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242991AbjHRUuY (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 18 Aug 2023 16:50:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBC4C30D8
        for <linux-bluetooth@vger.kernel.org>; Fri, 18 Aug 2023 13:50:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6E7F9642A0
        for <linux-bluetooth@vger.kernel.org>; Fri, 18 Aug 2023 20:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C50EFC433C8;
        Fri, 18 Aug 2023 20:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692391821;
        bh=85ql82GtvPHiUa87if4An5zv6GFMpclB3BYQbIqKJtY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=SGJLxH454vyrG1lTikQY78VL0yA+TNWDHtRd8CYGd4Iu83rM2wzvUpGwCd9HtaOzo
         VtYCU4ydFyufn+OM7Y+eY1CtCWpY7wFyvnKP7W3R6J3A00R/hk6RgWP3fg+eTDz+80
         QG2pkCXmZkatOoJfg3sCiXxwQFKuesbT/WO++bFeha9/d0gmZA3qeZLx6PM4OHt0zQ
         peuY0/Dxyx3tObvoaplp/p/fwe/pqIJghv6Lf2a7xs9TylNkAkAw6mU7pjDQFRHKhk
         2W9vfxp35sCetRrhNZ1N2zBImbXu0jOAkbN2kB29FAFPPfAtHTayfkYmxBwhiM0Tvm
         WIl/WAHw4oPuQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AABD2E26D33;
        Fri, 18 Aug 2023 20:50:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [BlueZ PATCH v2] profile: Remove probe_on_discover
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <169239182169.11543.68783625002745091.git-patchwork-notify@kernel.org>
Date:   Fri, 18 Aug 2023 20:50:21 +0000
References: <20230817212606.3024276-1-luiz.dentz@gmail.com>
In-Reply-To: <20230817212606.3024276-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu, 17 Aug 2023 14:26:06 -0700 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> The concept of probing not connected devices is already supported when
> loading devices from storage, so drivers shall already be capabable of
> handling such a thing as there are dedicated callbacks to indicate when
> there is a new connection in the form of .accept callback.
> 
> [...]

Here is the summary with links:
  - [BlueZ,v2] profile: Remove probe_on_discover
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=507ba12483c3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


