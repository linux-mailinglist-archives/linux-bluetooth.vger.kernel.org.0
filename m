Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D73D74DE54
	for <lists+linux-bluetooth@lfdr.de>; Mon, 10 Jul 2023 21:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbjGJTk1 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 10 Jul 2023 15:40:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbjGJTkZ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 10 Jul 2023 15:40:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 686739E
        for <linux-bluetooth@vger.kernel.org>; Mon, 10 Jul 2023 12:40:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C4BF2611C3
        for <linux-bluetooth@vger.kernel.org>; Mon, 10 Jul 2023 19:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B91CC433CA;
        Mon, 10 Jul 2023 19:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689018023;
        bh=MPhSmKXmhIpWjaSI9eLBkIzsCEtzvHSe1WdXVfqYWv4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=H1ReiKMOsIGq+nOG0NblKF+14ypEqm4MkehOLbfv829895uPq4dGMuOqdSt5nHp1b
         n60c9LiZ5dG348GyAW1RqYVjmyxPpKS+6jLfeoUFgDpU6ePAv8uE30jh74cEw9H215
         n9Y8DyNDjElYn1CBJkrq59E58k05uiwZBNLIM6EtsTJH3hQUKKk6CKOB5Qo9ipf9RT
         v04eMbMdeBQ1Tl8p4GgezGkONpBqJKPXJB2PV1cL+DwwwzBPrwkyEQ86lJDiURUrrp
         yRam3qD2ZqTgPjRro1o3psl/8G3T7MsKG1sarEWuIBtwr+RfeXRrkXeztfezXgKezJ
         j29xUkcBI8G5A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0EDF6C73FEA;
        Mon, 10 Jul 2023 19:40:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] test-runner: Add documentation
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <168901802305.22137.9040598606850767691.git-patchwork-notify@kernel.org>
Date:   Mon, 10 Jul 2023 19:40:23 +0000
References: <20230706231000.451145-1-luiz.dentz@gmail.com>
In-Reply-To: <20230706231000.451145-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu,  6 Jul 2023 16:10:00 -0700 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> This adds test-runner.rst documentation with a few examples of how it
> can be used to run kernel testers like mgmt-tester and also bluetoothd,
> audio and Bluetooth controller plugged in the host system which is quite
> useful when trying experimental features such LE Audio, etc.
> 
> [...]

Here is the summary with links:
  - [BlueZ] test-runner: Add documentation
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=c96eb3ea5537

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


