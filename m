Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2164737433
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jun 2023 20:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbjFTSaf (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 20 Jun 2023 14:30:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjFTSa1 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 20 Jun 2023 14:30:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 204FC1717
        for <linux-bluetooth@vger.kernel.org>; Tue, 20 Jun 2023 11:30:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9E31B61423
        for <linux-bluetooth@vger.kernel.org>; Tue, 20 Jun 2023 18:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7989C43395;
        Tue, 20 Jun 2023 18:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687285824;
        bh=cSzF/oHqa0ZfNxFiQVA1avQuMQSZlyEZw/eOT3r+snA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=HGeufki7+dG/U2ZhhKVU7urdCR6B37DiMnvI2S+Rl2oWAtVxPnoeSun2cAuJy21xA
         hbRUSeeedkiCgZLkBfV//J5jQY7lEecIo+tpGuN1naPPPfuz1cAwISdU2zD58rphS+
         ZtalPG3Xhn9Wruy43vEFA5moUQ52qmxhn+LkZwgL+K9L2Bbsjs6NQINyKvDsQ/UGiQ
         yWag7skhJ684LS02XVwSrs8ceBT/PtzezFNw8JUflhUzf22drh9POxc0PxGQpH+OTh
         qMfIwf6GVjM2O/P4SBXzx8Z0723YGdkYrd0DsV5GXt+fw5BMhf5HLh4g79C2ZQ3Oy9
         Q6njduW76M+SA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 89DDAC395D9;
        Tue, 20 Jun 2023 18:30:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: MGMT: Fix marking SCAN_RSP as not connectable
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <168728582455.12887.17984474993172472535.git-patchwork-notify@kernel.org>
Date:   Tue, 20 Jun 2023 18:30:24 +0000
References: <20230607194518.2901376-1-luiz.dentz@gmail.com>
In-Reply-To: <20230607194518.2901376-1-luiz.dentz@gmail.com>
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

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Wed,  7 Jun 2023 12:45:18 -0700 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> When receiving a scan response there is no way to know if the remote
> device is connectable or not, so when it cannot be merged don't
> make any assumption and instead just mark it with a new flag defined as
> MGMT_DEV_FOUND_SCAN_RSP so userspace can tell it is a standalone
> SCAN_RSP.
> 
> [...]

Here is the summary with links:
  - Bluetooth: MGMT: Fix marking SCAN_RSP as not connectable
    https://git.kernel.org/bluetooth/bluetooth-next/c/8a84527ec1ac

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


