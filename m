Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A66786FBBF1
	for <lists+linux-bluetooth@lfdr.de>; Tue,  9 May 2023 02:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233995AbjEIAU1 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 8 May 2023 20:20:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbjEIAU0 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 8 May 2023 20:20:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A02F04ED8
        for <linux-bluetooth@vger.kernel.org>; Mon,  8 May 2023 17:20:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 344B9630A0
        for <linux-bluetooth@vger.kernel.org>; Tue,  9 May 2023 00:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9813CC4339B;
        Tue,  9 May 2023 00:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683591620;
        bh=3dWPuy+w/jZ1GP65PbQ3fXIm8HBWegrdKmFOfEzRTLs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ep7wK48cMB9YwaDG0NX0GJ9H1XzyLJFGOoDgcD2LXq4HLrfSnh7geRFZyEYDZxwoC
         LoOe2u7lVW31BTJmLauAtqToW0EqHrCoeOMZzGHuWp4QwWFKtz0NQoIPcDUnurGDiu
         0awulaCa/OOtEG/7SpBSivH24AJ0wIq1aXwyHbZjb9R8n8/f4winLz6gCDGmdTJwDF
         cqEy7qezgGYHOK7JHYsoT/CbiN7czkZHEuR0kt2qbEOe7BjXXpoyKMidtzdF+V0SYa
         4C83lDsNuX5flr3d+dNVIRnas9IVEGsU9A1drQA3w4JrKRGa4ohdya/n+pwmnpNZrz
         0HYiDYsREft7A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7BA91E26D27;
        Tue,  9 May 2023 00:20:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ 1/2] monitor/att: Attempt to insert discovered
 attributes
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <168359162050.8754.964777981689041495.git-patchwork-notify@kernel.org>
Date:   Tue, 09 May 2023 00:20:20 +0000
References: <20230505203156.2561265-1-luiz.dentz@gmail.com>
In-Reply-To: <20230505203156.2561265-1-luiz.dentz@gmail.com>
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

This series was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri,  5 May 2023 13:31:55 -0700 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> This attempts to insert discovered attributes into monitor gatt_db
> instance if their respective discover procedures are used which enables
> decoding traces injected by user via unit testing:
> 
> > sudo unit/test-bap -m -s "34
> 
> [...]

Here is the summary with links:
  - [BlueZ,1/2] monitor/att: Attempt to insert discovered attributes
    (no matching commit)
  - [BlueZ,2/2] monitor: Fix misaligment errors
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=acfa41dedb47

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


