Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 584E170FC15
	for <lists+linux-bluetooth@lfdr.de>; Wed, 24 May 2023 19:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234366AbjEXRAY (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 24 May 2023 13:00:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbjEXRAW (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 24 May 2023 13:00:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33C3EBB
        for <linux-bluetooth@vger.kernel.org>; Wed, 24 May 2023 10:00:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 78D3C63748
        for <linux-bluetooth@vger.kernel.org>; Wed, 24 May 2023 17:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D931FC433EF;
        Wed, 24 May 2023 17:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684947620;
        bh=Rbe1gS/GO6qJdIwnNwHj9qLaxfX26gos2uasw7bC5Bw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=YurvErYHtf2YbedZ9XvqWY0zClqiHXzrzBROqRjiUxCmUmf5kirkGnw3bmEinhoSJ
         DVGTVN2eNXnYLrmKGfNpVOo4a8WbEtsBOjMx4bDVdzz6tXfxxw7zS0Aelv8lQ5fAgh
         vJ1O1h5mkVgQTBFOcz5z90+/ZRUyR2zB52TtdObkhMgvysbddcmYDHbLcyPQCW9hRm
         Pigh0duGIkdWxF6GuMpv8Ukv7ifMRmFIkmOW+NOiLFmf5U5yo/XFLk0EOTeBngwe+c
         J9QWGSdw5N8ufRGBBcqw3GvH0rJwyni55dhdcL0d3rDG/1KU1zi45djC50AWgKC5B4
         8P4e/9jg0IsbQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BEEF6E450AF;
        Wed, 24 May 2023 17:00:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] iso-tester: Make QoS parameters reflect the tests names
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <168494762077.20557.17842580848143033536.git-patchwork-notify@kernel.org>
Date:   Wed, 24 May 2023 17:00:20 +0000
References: <20230523174906.2751379-1-luiz.dentz@gmail.com>
In-Reply-To: <20230523174906.2751379-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
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

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 23 May 2023 10:49:06 -0700 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> AC 1 + 2 tests shall use their respective QoS parameters.
> ---
>  tools/iso-tester.c | 35 +++++++++++++++++++++--------------
>  1 file changed, 21 insertions(+), 14 deletions(-)

Here is the summary with links:
  - [BlueZ] iso-tester: Make QoS parameters reflect the tests names
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=98a9a3c48ce8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


