Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BED7E7B6F4D
	for <lists+linux-bluetooth@lfdr.de>; Tue,  3 Oct 2023 19:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231687AbjJCRKf (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 3 Oct 2023 13:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231560AbjJCRKc (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 3 Oct 2023 13:10:32 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 085D1AC
        for <linux-bluetooth@vger.kernel.org>; Tue,  3 Oct 2023 10:10:28 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A42FAC433CC;
        Tue,  3 Oct 2023 17:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696353027;
        bh=U38/2kPU87h89iGrMM/iIVzteSQ/D1j5owmBDUG8vR4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=a85+iWcMSwv40hNqnjEBvCupQcK8/1rl6y2JtKVkMFYa1yy9w9FeVN8XMQPJN/Jzr
         epg9Sev0z6CJT/IQRkoFfHb9b7if8ttS3/g8RIV9UdrfSQ5uAuY2q0ucSLfE/T1CBK
         n7bwamzukFAlokWKjx6Ugm0nMG/Vcy2KgqRr/Czu0gTNpraDFc3ZFRYMhzTVeF2Jd7
         oaRJ842Gey4mz/pM7KPE4HwkXzi57peicEy/5PfOh/9KzYzp+NZaq5OAv8XfO42CRo
         iltvwHvJoN8mjzmoq1yo5Q27RqAYenoZRhUALRj+UM0aGFWCbZGumWXhCXlgDUcubj
         4Qzeo3k+yYfHQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 82CBFE270F0;
        Tue,  3 Oct 2023 17:10:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/1] Bluetooth: ISO: Allow binding a bcast listener to 0 bises
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <169635302753.22624.4352431595380418619.git-patchwork-notify@kernel.org>
Date:   Tue, 03 Oct 2023 17:10:27 +0000
References: <20231003144933.3462-1-iulia.tanasescu@nxp.com>
In-Reply-To: <20231003144933.3462-1-iulia.tanasescu@nxp.com>
To:     Iulia Tanasescu <iulia.tanasescu@nxp.com>
Cc:     linux-bluetooth@vger.kernel.org, claudia.rosu@nxp.com,
        mihai-octavian.urzica@nxp.com, silviu.barbulescu@nxp.com,
        vlad.pruteanu@nxp.com, andrei.istodorescu@nxp.com,
        luiz.dentz@gmail.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue,  3 Oct 2023 17:49:32 +0300 you wrote:
> Some Broadcast scenarios require for a broadcast listener to listen for
> a broadcaster only for PA sync.
> 
> This patch adds support for binding to a broadcaster address without
> asking for any BIS to sync with.
> 
> Iulia Tanasescu (1):
>   Bluetooth: ISO: Allow binding a bcast listener to 0 bises
> 
> [...]

Here is the summary with links:
  - [1/1] Bluetooth: ISO: Allow binding a bcast listener to 0 bises
    https://git.kernel.org/bluetooth/bluetooth-next/c/8e437e71f361

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


