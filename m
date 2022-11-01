Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7300E6153B2
	for <lists+linux-bluetooth@lfdr.de>; Tue,  1 Nov 2022 22:00:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbiKAVAV (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 1 Nov 2022 17:00:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230224AbiKAVAS (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 1 Nov 2022 17:00:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BB221AF11
        for <linux-bluetooth@vger.kernel.org>; Tue,  1 Nov 2022 14:00:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 94C59616D3
        for <linux-bluetooth@vger.kernel.org>; Tue,  1 Nov 2022 21:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09871C433B5;
        Tue,  1 Nov 2022 21:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667336417;
        bh=5dhjWGGGC5lmfmO5TUvMNOsJf6sA8DyBjrn93pC2J/8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ENUTOMWUOt/Z5eG4ejSb8z4rgNdZpTnhb4okTX4uD1QRRLbYh6jQlWBxJETD5lzNf
         Nbnxk+JLG+6asE7hlt8OH+2JrcR6m6TMoBLpyIzdfahzXkFLIHIlEWrvN7vpPqUqGv
         mDE/fJyb0cTz+lwKOVSWMczU4LD0YBnPREBHKvVCR/rnbhKcRdhHKBbrQavdpdW9jQ
         OLyLQ5jXKsJEOdgXtha3mm315BD3EVOgqxoTh+3C6ReaqtnUOtlx1LOWg/sSEAVsrK
         9y1pYKeL1FDhs7vzHnW3lksV810KVoI7zZPcF30fYP19Q5dNqjXW3QYGkZ4C49K41P
         QAhzc1FnZneXw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E5886E270DC;
        Tue,  1 Nov 2022 21:00:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] tools/test-runner: Remove bluetooth.enable_ecred
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <166733641693.20998.1801282842449868147.git-patchwork-notify@kernel.org>
Date:   Tue, 01 Nov 2022 21:00:16 +0000
References: <20221028234712.2213561-1-luiz.dentz@gmail.com>
In-Reply-To: <20221028234712.2213561-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri, 28 Oct 2022 16:47:12 -0700 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> L2CAP ECRED is now enabled by default by the following kernel change:
> 
> 98f18bb78b7d ("Bluetooth: Add CONFIG_BT_LE_L2CAP_ECRED")
> ---
>  tools/test-runner.c | 1 -
>  1 file changed, 1 deletion(-)

Here is the summary with links:
  - [BlueZ] tools/test-runner: Remove bluetooth.enable_ecred
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=b3f76b30ec9d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


