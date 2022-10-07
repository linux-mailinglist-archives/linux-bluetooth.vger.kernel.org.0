Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 187E45F7E33
	for <lists+linux-bluetooth@lfdr.de>; Fri,  7 Oct 2022 21:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbiJGTkb (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 7 Oct 2022 15:40:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230064AbiJGTkV (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 7 Oct 2022 15:40:21 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11200C5883
        for <linux-bluetooth@vger.kernel.org>; Fri,  7 Oct 2022 12:40:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AC41EB80A08
        for <linux-bluetooth@vger.kernel.org>; Fri,  7 Oct 2022 19:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E05BC43470;
        Fri,  7 Oct 2022 19:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665171615;
        bh=h6ErnxmASr3UMatEFWypQkq3elXVotN207nMeagP/L8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=QM5mq9waTMk5936VK62RdlBMZrjmPAxoJ2bC0dN+R+rr/ruWdUbUUXr1HzJs2cfSh
         SRvtEmf1zGKKrYiNZ9snczR1HF7GraFK685E+t3UY6X0i+CgmBfo63vPJj809vdMMp
         3LFbpgGBtvQkxAl6Ulyz7yELx3hQ6VRNQV8kalwhE7YDDP9RncDLZrV4vpNgI5lcjF
         A9swCcqdZfwWxvNMPBP13syTWA+EmMW01YyjPki1NWfbI5W5czFb7lBrGz1kHLZg3E
         ZEOBZ/U+Tk0NKE7O1D9vPu7wMgtRW508aFsza0mMzAoq1HjqW+vSoEvxfls5fxOOwI
         JlxQ5wr4lsrbg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4D3ECE43EFD;
        Fri,  7 Oct 2022 19:40:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] Bluetooth: Work around SCO over USB HCI design defect
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <166517161531.22886.6151689482591354404.git-patchwork-notify@kernel.org>
Date:   Fri, 07 Oct 2022 19:40:15 +0000
References: <20221005150621.20771-1-nicolas.cavallari@green-communications.fr>
In-Reply-To: <20221005150621.20771-1-nicolas.cavallari@green-communications.fr>
To:     Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
        linux-bluetooth@vger.kernel.org
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

On Wed,  5 Oct 2022 17:06:21 +0200 you wrote:
> The USB interface between the host and the bluetooth adapter used for
> SCO packets uses an USB isochronous endpoint with a fragmentation scheme
> that does not tolerate errors.  Except USB isochronous transfers do
> not provide a reliable stream with guaranteed delivery. (There is no
> retry on error, see USB spec v2.0 5.6 and 8.5.5.)
> 
> To fragment a packet, the bluetooth HCI simply splits it in parts and
> transfer them as-is.  The receiver is expected to reconstruct the packet
> by assuming the first fragment contains the header and parsing its size
> field.  There is no error detection either.
> 
> [...]

Here is the summary with links:
  - [v3] Bluetooth: Work around SCO over USB HCI design defect
    https://git.kernel.org/bluetooth/bluetooth-next/c/7df90b55ae9a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


