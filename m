Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA21742DA7
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jun 2023 21:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231497AbjF2Tbb (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 29 Jun 2023 15:31:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232047AbjF2TbE (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 29 Jun 2023 15:31:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0A0C3586
        for <linux-bluetooth@vger.kernel.org>; Thu, 29 Jun 2023 12:30:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 674DA615FF
        for <linux-bluetooth@vger.kernel.org>; Thu, 29 Jun 2023 19:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4AFBC433CA;
        Thu, 29 Jun 2023 19:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688067021;
        bh=eZe75AE+IB/TijDI3jgsEz5uQBcyAmgMr3PJvTOcSxs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=AqpY76zTLyvL7bJtINf8ARtN2WUsCz+6bKqsXHgv5P6TiUzg8HtfW50qb7zP/HxSn
         5WMeoSl/ainocsc4L2regdlTkV/ORbdBFjBVvBufw2tDb3SYsN6h9g/UfT5jsvLNCQ
         OjGUDem/AgNitmGPx/Y+EJjlaupmGOte42OxrO6dM/Z6sJR1781SZLoUnri4IWWGmX
         UKG2X6BqzSCS90BqBqbO5nri4czafMWIZ3OPfdL5KWxzxJgyNI+DIIC9W05rHj5oOs
         NmmyepDFn9FvD96Bfz88s74NKuKVRegBMTUtbTSF2bxrZDoh34bGbSHps8hTR/qnUP
         rVgE/v+PTsQHQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9BE57C41671;
        Thu, 29 Jun 2023 19:30:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 1/3] Bluetooth: hci_conn: Consolidate code for aborting
 connections
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <168806702163.7890.5101160749253819751.git-patchwork-notify@kernel.org>
Date:   Thu, 29 Jun 2023 19:30:21 +0000
References: <20230629001310.2946122-1-luiz.dentz@gmail.com>
In-Reply-To: <20230629001310.2946122-1-luiz.dentz@gmail.com>
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

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Wed, 28 Jun 2023 17:13:08 -0700 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> This consolidates code for aborting connections using
> hci_cmd_sync_queue so it is synchronized with other threads, but
> because of the fact that some commands may block the cmd_sync_queue
> while waiting specific events this attempt to cancel those requests by
> using hci_cmd_sync_cancel.
> 
> [...]

Here is the summary with links:
  - [v4,1/3] Bluetooth: hci_conn: Consolidate code for aborting connections
    https://git.kernel.org/bluetooth/bluetooth-next/c/22f0e1a7429e
  - [v4,2/3] Bluetooth: hci_sync: Fix not handling ISO_LINK in hci_abort_conn_sync
    https://git.kernel.org/bluetooth/bluetooth-next/c/b2947ca2f663
  - [v4,3/3] Bluetooth: hci_conn: Always allocate unique handles
    https://git.kernel.org/bluetooth/bluetooth-next/c/fd859b4a3815

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


