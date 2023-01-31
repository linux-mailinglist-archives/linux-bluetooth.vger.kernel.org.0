Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C876768208E
	for <lists+linux-bluetooth@lfdr.de>; Tue, 31 Jan 2023 01:20:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbjAaAU1 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 30 Jan 2023 19:20:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbjAaAUT (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 30 Jan 2023 19:20:19 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 248B12749C
        for <linux-bluetooth@vger.kernel.org>; Mon, 30 Jan 2023 16:20:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B23BD6133D
        for <linux-bluetooth@vger.kernel.org>; Tue, 31 Jan 2023 00:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C069C4339E;
        Tue, 31 Jan 2023 00:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675124417;
        bh=aLvP1tstdFWiiUOWDxNhjgMjuesMAhDtzgLDwa8zDp4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=q1XP//m+qxC87Q+hcOz9FBEi1Nw/IzSkfPT8Wya5uxQXRIJx3lh4vS0jQAYzZjm1J
         VXeEHqDVnpSQwCnqsVEBs66ZeAHvL7ZQi+GnC6tjzjG4OATUx9V/lmiO8OzNleiuK9
         yA1Y/wyPgl+hPKnjPv7HQ05ib5QFM6okeCk3Q2ZxshbubC20ExVcuFyGMYOrVjao5w
         IknLk1/ACWxBv7UNO8QnKMBjvMI5c0jWrVvj7xi9G634ut/1CGrliZfRDE7yDJCVch
         alloakMxRPvNDf1fUOxdtsW8y4BbP7f4E9xrWcXMOcCc2ugL8LWyfHD3yIq4pUiQtq
         EWNZqOJL8XkiA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F2D75C04E36;
        Tue, 31 Jan 2023 00:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ v2] AUTHORS: modify Brian Gix email address
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <167512441699.21902.3023878518977493352.git-patchwork-notify@kernel.org>
Date:   Tue, 31 Jan 2023 00:20:16 +0000
References: <20230131001241.95001-1-brian.gix@gmail.com>
In-Reply-To: <20230131001241.95001-1-brian.gix@gmail.com>
To:     Brian Gix <brian.gix@gmail.com>
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
by Brian Gix <brian.gix@gmail.com>:

On Mon, 30 Jan 2023 16:12:41 -0800 you wrote:
> ---
>  AUTHORS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [BlueZ,v2] AUTHORS: modify Brian Gix email address
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=5845f003ac27

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


