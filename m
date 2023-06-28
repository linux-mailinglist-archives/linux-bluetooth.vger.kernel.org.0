Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABE54741821
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jun 2023 20:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231532AbjF1Sk0 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 28 Jun 2023 14:40:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjF1SkX (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 28 Jun 2023 14:40:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E48C1198E
        for <linux-bluetooth@vger.kernel.org>; Wed, 28 Jun 2023 11:40:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 78FD061440
        for <linux-bluetooth@vger.kernel.org>; Wed, 28 Jun 2023 18:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBF7CC433CB;
        Wed, 28 Jun 2023 18:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687977621;
        bh=n9BRqCdwq0t94JGL5tnRS38Fv47lR1h+ozvC6XZ8KDE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=nV7KPtsQ40GNRXnTMC0ng2DqlOGbz0Pf+c56pOgpG9eBjcj9DGdxh1+qJdSmKi4/B
         2ZMSpQe3L87uEEqockJ1DRo1EoxH45B7kX+23lLaQq3JsQzosxhg6ZXVVfRCUZHxbL
         mupwQ76Ks9c7p7JJkxlg+ikTkjA8CETCuMNre0nH3s4KcKAP0LUeSi2yyLkDaDU6Oa
         9X8CM+9ULSDGBXCnxOele7h4XpqYRGPSAjfw8a4L0CKK7Rsy4+AhEZvM8mbWZlxAT4
         ucvV5yWWH8NCRR0cwKUyOUqPMcvPGGxA1BPgQBpAbYNeAHJffrltfLkeJd15vu7O/9
         6KsCE2bMrqrxA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A266CC73FE4;
        Wed, 28 Jun 2023 18:40:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] shared/bap: Fix handling of codec fields
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <168797762166.3130.6948654822594569195.git-patchwork-notify@kernel.org>
Date:   Wed, 28 Jun 2023 18:40:21 +0000
References: <20230627234840.2696196-1-luiz.dentz@gmail.com>
In-Reply-To: <20230627234840.2696196-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 27 Jun 2023 16:48:40 -0700 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> Codec fields needs to be converted when codec.id is 0xff as the host
> endian may not always be little endian.
> ---
>  src/shared/bap.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Here is the summary with links:
  - [BlueZ] shared/bap: Fix handling of codec fields
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=ddfa40977c7e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


