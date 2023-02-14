Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 519F9696E9E
	for <lists+linux-bluetooth@lfdr.de>; Tue, 14 Feb 2023 21:40:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbjBNUkU (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 14 Feb 2023 15:40:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjBNUkT (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 14 Feb 2023 15:40:19 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 734752B2B8
        for <linux-bluetooth@vger.kernel.org>; Tue, 14 Feb 2023 12:40:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 09745618D2
        for <linux-bluetooth@vger.kernel.org>; Tue, 14 Feb 2023 20:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61AFCC4339C;
        Tue, 14 Feb 2023 20:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676407217;
        bh=ABcabbMAAkxyaGZkxZ7pXUf/XjGhPUpneim5h6YX1rw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=l3aIqnGF9pEIeqVr6flxdrhRxcHJrEFWWJD4jn/8rCY5j3hbZb9DYVlw8f9XkC3C6
         yuP8dRfFAEbxMDPY/P3WFlw+K27L0SiX/yD0aeUoVdORZTYdJRuwOS9a5B03ntQSVL
         flQE33+Z6XbI/bduZcY21nwTpZxrI6w+RRpqTt4wpkDFHJFZzolL2fo5heHsGVA5ii
         s/DRsUfuj+ndtgDu4D4/jOjKAKuwuK1ihzuPZg6txrew/lBJ+vPoPXo7TW9RB2ZsDI
         XGjHVM30CC8TbXSzqaAD6nGiIl7XeKAkV/EPVrRny8Jwe3BtS5ysHp28p30+FBBHuX
         vrjRGo9VJlRYw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4CC4BE68D35;
        Tue, 14 Feb 2023 20:40:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] gatttool: Use consistent spacing before brackets
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <167640721730.14815.17024522203768758078.git-patchwork-notify@kernel.org>
Date:   Tue, 14 Feb 2023 20:40:17 +0000
References: <20230212172402.19018-1-david.nicolson@gmail.com>
In-Reply-To: <20230212172402.19018-1-david.nicolson@gmail.com>
To:     David Nicolson <david.nicolson@gmail.com>
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

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Sun, 12 Feb 2023 18:24:02 +0100 you wrote:
> From: Dave Nicolson <david.nicolson@gmail.com>
> 
> ---
>  attrib/gatttool.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Here is the summary with links:
  - [BlueZ] gatttool: Use consistent spacing before brackets
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=89f535894e59

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


