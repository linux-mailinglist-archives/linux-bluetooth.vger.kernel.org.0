Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97A31545AE6
	for <lists+linux-bluetooth@lfdr.de>; Fri, 10 Jun 2022 06:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235797AbiFJEKS (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 10 Jun 2022 00:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbiFJEKR (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 10 Jun 2022 00:10:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C25E25E4
        for <linux-bluetooth@vger.kernel.org>; Thu,  9 Jun 2022 21:10:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3844161DD0
        for <linux-bluetooth@vger.kernel.org>; Fri, 10 Jun 2022 04:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 968D4C3411C;
        Fri, 10 Jun 2022 04:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654834212;
        bh=/EhDtBQwQEfvkbehFsQANBmxhLhQlVzNxQmuKqrVgg4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=P01LnlZhvSknyFNqJ1raVRvGbK6eHjuCH3ALjO+9t4ixlUzvyNlI+iLA2Ht3oYphg
         vdXgc5bbabmPdjkUIX5KczqXD+wZ3aW00Xu4t+xeIeePrYs9f1cs7VuFxq2p/trw4l
         WSfjfHD9u6Sgt3RVSghDmDCDzrXKVxCMYacpqNuhbvHsHEKubp8e+ZCZS8i2dXxm2a
         eNdsclBcvrZQ2clD2bU624O9ZW3X89mKax/fS6Ld+NbCyuMT9w7CPYFCSpk4cdGF8/
         1BUIGzvFmbf4Kcnbjykteie6HjR/yNC+c8Gwz9bJ8ExN5Y6WONArEHPqTrmNmVgTuv
         8rq1V2oikJtiA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7C97AE737F6;
        Fri, 10 Jun 2022 04:10:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] device: Fix not deleting the folder after removing the
 device
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <165483421250.4028.11832437428068065483.git-patchwork-notify@kernel.org>
Date:   Fri, 10 Jun 2022 04:10:12 +0000
References: <20220608051418.197426-1-hj.tedd.an@gmail.com>
In-Reply-To: <20220608051418.197426-1-hj.tedd.an@gmail.com>
To:     Tedd Ho-Jeong An <hj.tedd.an@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

On Tue,  7 Jun 2022 22:14:18 -0700 you wrote:
> From: Tedd Ho-Jeong An <tedd.an@intel.com>
> 
> This patch fixes the issue not deleting the device folder when the
> device is removed.
> ---
>  src/device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [BlueZ] device: Fix not deleting the folder after removing the device
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=5ebc2b5a3e48

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


