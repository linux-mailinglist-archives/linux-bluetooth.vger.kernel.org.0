Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE5F9549DE2
	for <lists+linux-bluetooth@lfdr.de>; Mon, 13 Jun 2022 21:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244438AbiFMTmG (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 13 Jun 2022 15:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243876AbiFMTlq (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 13 Jun 2022 15:41:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E75A5F54
        for <linux-bluetooth@vger.kernel.org>; Mon, 13 Jun 2022 11:10:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EA974611D4
        for <linux-bluetooth@vger.kernel.org>; Mon, 13 Jun 2022 18:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 533D5C3411C;
        Mon, 13 Jun 2022 18:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655143815;
        bh=SJ7/CaL9iYn6UATbibgvFn16MqVvVbRa2WnJKYzTBFI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=OiEJ+IoxD37PIJTsVug/SXu3AAYpb25MXLyBGgkKk9vqhj61bjBm5qm3nq6z/iCYI
         HTak0Kfl5ybosFH6wYvaUL1ksZhofcbfHTOPnVNGsOvVNL3Ex9vUGgfFV+WTXOifhK
         XYz+WIqY6O3UIyxUlrC82pgO63tZQGkfaDzSiFRPCRT/IkgZJtksQdXpfVp8R+vGwd
         ja8st4S4nzLvoj/mhZaSmIElO5EYALJQ4VW3uN9g6wiE3WCMJx84qaZByHkmSLPEsi
         LJrtFIWwNe5jpwIFtL0SEHfzBvHyOaHefdD5Vdbz2Pi4nIZNqT6NvlnNISBBXl0Aft
         vB6sbOfvq2xGg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 39C8CE73854;
        Mon, 13 Jun 2022 18:10:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ 1/2] a2dp: disallow multiple SetConfiguration to same
 local SEP
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <165514381522.24573.3468564396925092282.git-patchwork-notify@kernel.org>
Date:   Mon, 13 Jun 2022 18:10:15 +0000
References: <20220605122927.110627-1-pav@iki.fi>
In-Reply-To: <20220605122927.110627-1-pav@iki.fi>
To:     Pauli Virtanen <pav@iki.fi>
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

This series was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Sun,  5 Jun 2022 15:29:26 +0300 you wrote:
> Using the remote SEP SetConfiguration DBus API, it's possible to make
> multiple remote endpoints use the same local SEP, if they are endpoints
> from different connected devices. This is invalid: successful
> configuration shall prevent a different device configuring the same SEP
> (AVDTP v1.3 Sec. 5.3).  Moreover, this breaks the assumption in the
> AVDTP code that each SEP has at most a single stream, and causes
> misbehavior later on (subsequent transport acquires fail with EPERM).
> 
> [...]

Here is the summary with links:
  - [BlueZ,1/2] a2dp: disallow multiple SetConfiguration to same local SEP
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=5f9d9a9a0b38
  - [BlueZ,2/2] a2dp: error return paths in a2dp_reconfig must free allocated setup
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=9c288dd23a3b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


