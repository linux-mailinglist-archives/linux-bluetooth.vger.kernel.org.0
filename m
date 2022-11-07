Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2881961FE48
	for <lists+linux-bluetooth@lfdr.de>; Mon,  7 Nov 2022 20:10:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232349AbiKGTKh (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 7 Nov 2022 14:10:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232760AbiKGTKT (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 7 Nov 2022 14:10:19 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4FE529365
        for <linux-bluetooth@vger.kernel.org>; Mon,  7 Nov 2022 11:10:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A078AB8166D
        for <linux-bluetooth@vger.kernel.org>; Mon,  7 Nov 2022 19:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5CAC3C43470;
        Mon,  7 Nov 2022 19:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667848215;
        bh=ErnnAI5DN+S9PxQMF9AezseIukAdPq/5JM+bPC2gjYQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=BGhDMUOB9RkWFTworz36P41nZDMxnd1fVICyJCcakBJmA9qCIJK4Y3fcY3BKCHOUt
         d0MvkK7D1rlWXtGNqT7M6p2yCNotMHpuywK+NWVQxHgqCAIbP83iVWXVwboOXzk6w/
         YBPcM5+wlFv1yB9RL6h15CmAT92lIv9QiLZ0afMgJJnjEorgVxq9nD5OX4o9rRXCBP
         6rL7r0+a82zx++RyAM35QE1X4pppvDeP8Q7btyR0ydfBIp1g++WQd4W+K1yB7bI2d6
         awaekQn0jYVqe/4OA1z8l9NkPt/HOAOP2MYwNFr4ojVzkYHwN/ceJEed3JrpZYCLjj
         bu5adLzpqnl1w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 437BCC41671;
        Mon,  7 Nov 2022 19:10:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ 1/2] monitor/att: Add handler support for Read by Type
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <166784821526.7961.4470930074464027915.git-patchwork-notify@kernel.org>
Date:   Mon, 07 Nov 2022 19:10:15 +0000
References: <20221104213649.36925-1-luiz.dentz@gmail.com>
In-Reply-To: <20221104213649.36925-1-luiz.dentz@gmail.com>
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

This series was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri,  4 Nov 2022 14:36:48 -0700 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> This adds handler support for Read by Type so it can further decode
> the values when the procedure is used.
> ---
>  monitor/att.c   | 206 ++++++++++++++++++++++++++++++++++--------------
>  monitor/l2cap.h |  13 ++-
>  2 files changed, 155 insertions(+), 64 deletions(-)

Here is the summary with links:
  - [BlueZ,1/2] monitor/att: Add handler support for Read by Type
    (no matching commit)
  - [BlueZ,2/2] monitor/att: Add support for decoding Characteristic Declaration
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=7e0e08ca5396

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


