Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98F294E9E96
	for <lists+linux-bluetooth@lfdr.de>; Mon, 28 Mar 2022 20:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244887AbiC1SBy (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 28 Mar 2022 14:01:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241814AbiC1SBx (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 28 Mar 2022 14:01:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C05940A2A
        for <linux-bluetooth@vger.kernel.org>; Mon, 28 Mar 2022 11:00:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E8A9E6118E
        for <linux-bluetooth@vger.kernel.org>; Mon, 28 Mar 2022 18:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44A13C34100;
        Mon, 28 Mar 2022 18:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648490411;
        bh=XjARNkxxcpq5w+lQySBjyH8GCzuXa0qiTUvMU1DRv6I=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=k6mZUNLnbXYQuF5CfWbUa4jIzqZP/znIPLkaQKTMZ1CSONwMWXjsEOWQ9cbKMMs6r
         N+uz9L1Xu0wB4lpCdN8PrC0RJ62OutnUi9F1HV6fq+EJSOA+NfTbGTMC2gWvgrVHpT
         b9S/sPGkLlX+qlookoTYEBY3pNzR2yuXPiVGoUn0mD8bqapGDa0I6VPor+PCJZLpEc
         4PeIovVUM4sEQSX1pQLtBynV1KjMKMiE50/rHOkYAjv0Z/cmpiJ9GNVmQBwCFDqVnV
         AHiY/CHVv5hcgPKAPWYRxjeNF0XRe37W43zFg/gG8z/GKIc+THwWZtCjvHYMRpyJ0w
         a9jLO+YpFSvqw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 26887F03846;
        Mon, 28 Mar 2022 18:00:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] a2dp: Always invalidate the cache if its configuration
 fails
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <164849041115.15036.8553086027283320761.git-patchwork-notify@kernel.org>
Date:   Mon, 28 Mar 2022 18:00:11 +0000
References: <20220324221818.81338-1-luiz.dentz@gmail.com>
In-Reply-To: <20220324221818.81338-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
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

On Thu, 24 Mar 2022 15:18:18 -0700 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> When a configuration had been restored from last_used cache but it
> fails invalidate it so another sep can be used.
> 
> Fixes: https://github.com/bluez/bluez/issues/313
> 
> [...]

Here is the summary with links:
  - [BlueZ] a2dp: Always invalidate the cache if its configuration fails
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=62e591578e3f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


