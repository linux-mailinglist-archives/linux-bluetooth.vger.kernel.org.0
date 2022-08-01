Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49DD65873C4
	for <lists+linux-bluetooth@lfdr.de>; Tue,  2 Aug 2022 00:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235022AbiHAWKk (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 1 Aug 2022 18:10:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235328AbiHAWKV (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 1 Aug 2022 18:10:21 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EAD96400
        for <linux-bluetooth@vger.kernel.org>; Mon,  1 Aug 2022 15:10:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DBA36B8188A
        for <linux-bluetooth@vger.kernel.org>; Mon,  1 Aug 2022 22:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89083C433D7;
        Mon,  1 Aug 2022 22:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659391813;
        bh=z4nKgnZtDIxfnvqdbfRN0GHGkqNATTWhVg/jOueVm/4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=TY9QBJl/wA6QdcR2OvQ+tcCL9uoX51pCpZmswtzzuro1UyBpt5s0SEeXvCh67TG3e
         JaO1AWLoZSJF5FidPKfEtPXIOe8u8SvaRBi8/rDQf6kUm5omZ2I2kfw4o3/NhN2D1B
         egif+52XJxL348oqeBt/eUviPzV96xNUvFfgan4kbNA6tmdvdbNmWl6xibbRgr66gv
         VqURoyjvIP0jhqlE/UToYLJ+8oMWHEjS4GN9InsppBR+mcOLqST4goLGMvyftlYlwG
         d6m4aU7k5gCGXf48fRxMrM3MopFjDy1XCidBjGkvNe3axXYKLqY5ygNMAtO6cpGjMc
         htGtBEej9gN0A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 72F57C43143;
        Mon,  1 Aug 2022 22:10:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] iso-test: Add ISO 48_2_1 Defer Send
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <165939181346.8109.11409238163241667912.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Aug 2022 22:10:13 +0000
References: <20220728210637.1247789-1-luiz.dentz@gmail.com>
In-Reply-To: <20220728210637.1247789-1-luiz.dentz@gmail.com>
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

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu, 28 Jul 2022 14:06:37 -0700 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> This adds ISO 48_2_1 Defer Send test which enables just output instead
> of both.
> ---
>  tools/iso-tester.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Here is the summary with links:
  - [BlueZ] iso-test: Add ISO 48_2_1 Defer Send
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=cb42377ae002

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


