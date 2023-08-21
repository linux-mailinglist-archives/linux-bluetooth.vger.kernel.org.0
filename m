Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3285D7832D5
	for <lists+linux-bluetooth@lfdr.de>; Mon, 21 Aug 2023 22:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230424AbjHUUUZ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 21 Aug 2023 16:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjHUUUY (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 21 Aug 2023 16:20:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A75EE4
        for <linux-bluetooth@vger.kernel.org>; Mon, 21 Aug 2023 13:20:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0662A614E3
        for <linux-bluetooth@vger.kernel.org>; Mon, 21 Aug 2023 20:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D9A4C433C9;
        Mon, 21 Aug 2023 20:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692649222;
        bh=uDT/tGtCxt3JoM7BeUBU2j+tnU2wvwUgRjCDlu2gLio=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=CGn2njYUlgzwFcWIZqt6Wr1apg5wgrEDDowY93V249YZsHa3jGyfr+3hO5H0klzUA
         aFYRcYKK+MyWMA5NDDHaHtyNryIIYgDEj22FihZR8Xa9s25hrKCu1jM2mBfrHlLcA7
         ELnnKtKlF6klxbQNuYSj9iB+7z6/fPwcSqPJ0KOr/iPlEwmtInBnqZY0WzeybJta3P
         MTKY8PjsuT0jB98GRkJJoqx3SpLjRSarjRusD8ALhKN3gwgU8hKrhPd4ODEqHlUA5J
         FiUmWS+1TMIRJNu3GiCfWMUMcFOMtmp8pNGvo/QiQkRJFmD1M1L97XoCNbUZkXU1jo
         46Vp0K1btIXTA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 49AA9C3274B;
        Mon, 21 Aug 2023 20:20:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] Bluetooth: hci_core: Fix missing instances using
 HCI_MAX_AD_LENGTH
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <169264922229.3965.6146592441914141688.git-patchwork-notify@kernel.org>
Date:   Mon, 21 Aug 2023 20:20:22 +0000
References: <20230821181848.3553863-1-luiz.dentz@gmail.com>
In-Reply-To: <20230821181848.3553863-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

On Mon, 21 Aug 2023 11:18:48 -0700 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> There a few instances still using HCI_MAX_AD_LENGTH instead of using
> max_adv_len which takes care of detecting what is the actual maximum
> length depending on if the controller supports EA or not.
> 
> Fixes: 112b5090c219 ("Bluetooth: MGMT: Fix always using HCI_MAX_AD_LENGTH")
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> [...]

Here is the summary with links:
  - [v2] Bluetooth: hci_core: Fix missing instances using HCI_MAX_AD_LENGTH
    https://git.kernel.org/bluetooth/bluetooth-next/c/2434f59ffc72

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


