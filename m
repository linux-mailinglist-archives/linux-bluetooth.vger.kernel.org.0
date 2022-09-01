Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5F95AA1DC
	for <lists+linux-bluetooth@lfdr.de>; Fri,  2 Sep 2022 00:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233934AbiIAWBB (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 1 Sep 2022 18:01:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233582AbiIAWAs (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 1 Sep 2022 18:00:48 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 784DF41D01
        for <linux-bluetooth@vger.kernel.org>; Thu,  1 Sep 2022 15:00:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E687FB82962
        for <linux-bluetooth@vger.kernel.org>; Thu,  1 Sep 2022 22:00:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89D81C43470;
        Thu,  1 Sep 2022 22:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662069642;
        bh=O3r0tghkT3J3a8kbywBlKAIjS43PK12FqJxiF+zG1co=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=klt1JFYgMAu6vAiJIt0joZov/XHrjaauFv2cwlNs+u8g03SRkrXaR8X4dySLsKJJJ
         kbBMm7Z54o1zVt/lZ3AGkSS8FBzxcDdBnN9FQhVBxuMcyalBZj9gYaB3/YD6RG2UGf
         2qGRVvLlKVZZnn9dqYFGVvOf+/N8mVEsqsZucQhf1PMKuLGBwOx24yRrgtMOjdkZl7
         nvsIK/qybjIim7d2v3KVF7z1rzRnsFC1YKaetQPXQ20XMl7NrSqoClWjnKS8xCQ2Rp
         6g7cItz0b1aEehU/GvK1fSiQgXe8w4UbyxoOD+nTEtmjEkrPeWpZIla8sC1qbjBfGC
         Pdp3qbzebdEXg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 53F26E924E4;
        Thu,  1 Sep 2022 22:00:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v7 0/2] Add Mesh functionality to net/bluetooth
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <166206964233.4836.4376426391398219351.git-patchwork-notify@kernel.org>
Date:   Thu, 01 Sep 2022 22:00:42 +0000
References: <20220901191914.22706-1-brian.gix@intel.com>
In-Reply-To: <20220901191914.22706-1-brian.gix@intel.com>
To:     Brian Gix <brian.gix@intel.com>
Cc:     linux-bluetooth@vger.kernel.org, marcel@holtmann.org,
        luiz.dentz@gmail.com
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

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu,  1 Sep 2022 12:19:12 -0700 you wrote:
> Housekeeping and implementation
> 
> v2: Add checking for Packet Ownership when querying Tx queue state
>     Add cleanup of Tx queue when MGMT socket closes
> 
> v3: Fix CI complaints
> 
> [...]

Here is the summary with links:
  - [v7,1/2] Bluetooth: Implement support for Mesh
    https://git.kernel.org/bluetooth/bluetooth-next/c/6db7da4c50f0
  - [v7,2/2] Bluetooth: Add experimental wrapper for MGMT based mesh
    https://git.kernel.org/bluetooth/bluetooth-next/c/45d33c081bcf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


