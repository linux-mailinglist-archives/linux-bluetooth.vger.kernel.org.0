Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 289794DC4AE
	for <lists+linux-bluetooth@lfdr.de>; Thu, 17 Mar 2022 12:20:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232950AbiCQLVf (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 17 Mar 2022 07:21:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232960AbiCQLVf (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 17 Mar 2022 07:21:35 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D58C61E3E03;
        Thu, 17 Mar 2022 04:20:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 38EB5CE22DC;
        Thu, 17 Mar 2022 11:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 803F3C36AE2;
        Thu, 17 Mar 2022 11:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647516014;
        bh=nCuwQehZV3E3+yHCPJUenkVbOnNfVLacM411RXq1JBQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=lX9UWohllyxg/2VmSSr4NgF9UCMF0/A/Tpq7Et1aKpk87D77wei9aN4oI7mr5KWf9
         g15UpVyqIArst4kd2Vnh22Nrt8QwnYXHJXWZ4TCxK5rQo6WywInZEVNA2f48vApRru
         Qx78D/GS8slE1Ez465DFyfl/LucxYSqZQ+m59CS4cqFHj+HzuD5cGwDBNLpUd89ZjX
         YR2PDXYQXNipw2uK3xN6G0MDYqplflniczsiRv5pX4GS0ek5Hi7aAEzM9p/jZwQGqQ
         PhA/QRYb9fOBn1cePptVSZaH84wMr1hm6oonpasWLmsG9kGx8IyCm+3ekHZjkVb9De
         lo0Rx+p8BdlfQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 663C1E8DD5B;
        Thu, 17 Mar 2022 11:20:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btmtkuart: fix error handling in
 mtk_hci_wmt_sync()
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <164751601441.15552.578400949800414032.git-patchwork-notify@kernel.org>
Date:   Thu, 17 Mar 2022 11:20:14 +0000
References: <20220317075740.GE25237@kili>
In-Reply-To: <20220317075740.GE25237@kili>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     sean.wang@mediatek.com, marcel@holtmann.org,
        johan.hedberg@gmail.com, luiz.dentz@gmail.com,
        matthias.bgg@gmail.com, linux-bluetooth@vger.kernel.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
by Marcel Holtmann <marcel@holtmann.org>:

On Thu, 17 Mar 2022 10:57:40 +0300 you wrote:
> This code has an uninitialized variable warning:
> 
>     drivers/bluetooth/btmtkuart.c:184 mtk_hci_wmt_sync()
>     error: uninitialized symbol 'wc'.
> 
> But it also has error paths which have memory leaks.
> 
> [...]

Here is the summary with links:
  - Bluetooth: btmtkuart: fix error handling in mtk_hci_wmt_sync()
    https://git.kernel.org/bluetooth/bluetooth-next/c/65d6602f6334

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


