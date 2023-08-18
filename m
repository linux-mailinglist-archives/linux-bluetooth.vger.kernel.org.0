Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73831781470
	for <lists+linux-bluetooth@lfdr.de>; Fri, 18 Aug 2023 22:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240383AbjHRUuY (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 18 Aug 2023 16:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242928AbjHRUuX (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 18 Aug 2023 16:50:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C593530C4
        for <linux-bluetooth@vger.kernel.org>; Fri, 18 Aug 2023 13:50:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 60CFA63566
        for <linux-bluetooth@vger.kernel.org>; Fri, 18 Aug 2023 20:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB6FBC433C9;
        Fri, 18 Aug 2023 20:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692391821;
        bh=l8vW0FixZmIKi+1pUibG+uPW6ha8ryaQYT9NtdsIv4c=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=o1BSzK6NNIu2vw8g5MkMpCLO0q84gj94Bhg2c404cAQTt5JwjoBXO62K0sr0Su1t9
         EKglkyC2SClHT36KrZopqxVEUbPFN75w3Tyg3n3gmEXFPftV5kSMy9/mxPTsH61xKL
         EV+Ze5zyA/q5WPqADIQvRVGqkADzJIO7nUrn5Aw3yB3pgTZy/CVa7dSUUucPjVYHEH
         l56oqf77VfV25VBY/DWWqnL/ENAHaiAijX+YVGtixqdu8tejPIqKolk6R5Dhi4o79S
         leqE381/swLJhkypeqNhZEeQGy3oxJvs7//VBDpASgZDh4Ydjs/JrKLEyMv7XKAupd
         Vg2zxqYZM6N1g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A1C96E93B34;
        Fri, 18 Aug 2023 20:50:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ 1/2] device: Don't attempt to set auto_connect for
 devices using RPAs
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <169239182165.11543.16358110998158613899.git-patchwork-notify@kernel.org>
Date:   Fri, 18 Aug 2023 20:50:21 +0000
References: <20230817224103.3042055-1-luiz.dentz@gmail.com>
In-Reply-To: <20230817224103.3042055-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org
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

This series was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu, 17 Aug 2023 15:41:02 -0700 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> Device using private address cannot be programmed into the auto_connect
> list without them being paired and its IRK being distributed otherwise
> there is no way to resolve it address and the command will fail.
> ---
>  src/device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [BlueZ,1/2] device: Don't attempt to set auto_connect for devices using RPAs
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=cc7dbadb7236
  - [BlueZ,2/2] device: Restart temporary timer while connecting
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=0004eb06d5d9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


