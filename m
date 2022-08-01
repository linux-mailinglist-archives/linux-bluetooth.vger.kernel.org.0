Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38A165872ED
	for <lists+linux-bluetooth@lfdr.de>; Mon,  1 Aug 2022 23:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231340AbiHAVP4 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 1 Aug 2022 17:15:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233286AbiHAVPu (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 1 Aug 2022 17:15:50 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C07B1113
        for <linux-bluetooth@vger.kernel.org>; Mon,  1 Aug 2022 14:15:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 16B42B8171F
        for <linux-bluetooth@vger.kernel.org>; Mon,  1 Aug 2022 21:15:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AF455C4347C;
        Mon,  1 Aug 2022 21:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659388546;
        bh=SigmyKg9zGZ491O1QvKfB3jB8tTbAYq3hI8aj5wj1S4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=dWfxy8uQKmuwpRCi39YFKdY6GawDCzUumA0RokIuITM6Fe0Zvp2cYUQ1M0GVE+pAz
         ChuyUS4SZM/tsJn6KyyIPLEap78o4c9Qa1YqvRnBE1WVRDjnurAJHn7TGe9XWIIM63
         qKlH/vZg1RHL2STudQCMc3q+MJmFfN4KgKiOmP1KdFPt8odZ/PgC1JmEjgRL1lOx9+
         4gMqlhqfwr7lPUGTbnwOPm+waI/8zZEYfzkzUZxM4h9AncmxUwnn/+Yr7ymrPCh174
         15qV1098w88iKNA/U32THkmMb+GpEDowfi1smOTYD/HtarvQIm/o7JQXHXZvr1yg3i
         s0GRkLIhlTpHw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 94C25C43146;
        Mon,  1 Aug 2022 21:15:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: ISO: Fix memory corruption
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <165938854660.17345.11966028525183997597.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Aug 2022 21:15:46 +0000
References: <20220729181041.1571220-1-luiz.dentz@gmail.com>
In-Reply-To: <20220729181041.1571220-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

On Fri, 29 Jul 2022 11:10:41 -0700 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> The following memory corruption can happen since iso_pinfo.base size
> did not account for its headers (4 bytes):
> 
> net/bluetooth/eir.c
>     76          memcpy(&eir[eir_len], data, data_len);
>                             ^^^^^^^         ^^^^^^^^
>     77          eir_len += data_len;
>     78
>     79          return eir_len;
>     80  }
> 
> [...]

Here is the summary with links:
  - Bluetooth: ISO: Fix memory corruption
    https://git.kernel.org/bluetooth/bluetooth-next/c/c5d36b8a7dbd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


