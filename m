Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C1377A8E3C
	for <lists+linux-bluetooth@lfdr.de>; Wed, 20 Sep 2023 23:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbjITVK3 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 20 Sep 2023 17:10:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230179AbjITVK3 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 20 Sep 2023 17:10:29 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EF32B9
        for <linux-bluetooth@vger.kernel.org>; Wed, 20 Sep 2023 14:10:23 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20C64C433C9;
        Wed, 20 Sep 2023 21:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695244223;
        bh=wq8NbjSnqnabrwGS0bRqj24U15kzwhMpfVZd4361p5k=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=SFPspL53Bxpp3CxpAGA4JFLdTD4e1hZWAV0Ij9Sw0i0L78+j3jLZwnZ5SG+FHdA6T
         NC0aLNF/4O0uLDB2xizg/6E6PsQ2xbr20sB7iLwp09IJmli52Jx6eSp8229Sr7YRY5
         nq5MDo+NB2oIoCmlTWaEKCXFE61c2XAHabkAP5DkhKoF4FjCX9YXRJTGC829IvJgCb
         J3+jOE/bJbrev8lZBLT1MZeSeUxNoPObUZuPpnBuHyj6VuyLhYGb60YVYaolQg25f5
         uleEiNgEVJ9QDqJFB15pEnF6QypzWW8MHQDRbieoUXXQ8ezSKkmAQLnLMZSrE6S6Ps
         6jec+D+mAt/8w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 089D5C595C4;
        Wed, 20 Sep 2023 21:10:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] pbap: Fix not checking Primary/Secundary Counter length
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <169524422303.13420.5457407864169782596.git-patchwork-notify@kernel.org>
Date:   Wed, 20 Sep 2023 21:10:23 +0000
References: <20230919191401.311236-1-luiz.dentz@gmail.com>
In-Reply-To: <20230919191401.311236-1-luiz.dentz@gmail.com>
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

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 19 Sep 2023 12:14:01 -0700 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> Primary/Secundary Counters are supposed to be 16 bytes values, if the
> server has implemented them incorrectly it may lead to the following
> crash:
> 
> =================================================================
> ==31860==ERROR: AddressSanitizer: heap-buffer-overflow on address
> 0x607000001878 at pc 0x7f95a1575638 bp 0x7fff58c6bb80 sp 0x7fff58c6b328
> 
> [...]

Here is the summary with links:
  - [BlueZ] pbap: Fix not checking Primary/Secundary Counter length
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=5ab5352531a9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


