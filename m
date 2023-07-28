Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29C947678A8
	for <lists+linux-bluetooth@lfdr.de>; Sat, 29 Jul 2023 00:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234826AbjG1Wua (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 28 Jul 2023 18:50:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234523AbjG1WuZ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 28 Jul 2023 18:50:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E90C019B6
        for <linux-bluetooth@vger.kernel.org>; Fri, 28 Jul 2023 15:50:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 63FA062213
        for <linux-bluetooth@vger.kernel.org>; Fri, 28 Jul 2023 22:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF1D8C433CC;
        Fri, 28 Jul 2023 22:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690584623;
        bh=hSD94h+HE87w0SRLe1Dd3fryrf5az/2oRAK9JRzvG+w=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Cx8nJTm9GwukyLOgT/Jy5SA2+u306oJcGyvk363c20TgUAbQN1AsgyBCgGGipZPTn
         NtJytC6DUIp/jPYHvVecq1i6reb3ysxZL3Ah45Gkvq5uQ/q/ed0a/C87P8qN4t3uaE
         MzJBhsO/6eET6svvJje0k92ZQavLmQ7g5rjMeB+Y1NqkHZSh8PcBjr2jBfwbgbJ+/p
         44hzrGLto7lzmI7lbhADcqwXtulGjWyP4hKH8p5yD44CNEN870y8c5h8nAHWhgz7rj
         bRDmv0D5ieEJoJj4OghVcnb4uC2qW/VdPZG5ZiWoPti4+i5sX56Q8sgyukYrdFPsh/
         +Dltz3Y1ZJ73A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AA711E21EC9;
        Fri, 28 Jul 2023 22:50:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] advertising: Fix peripheral adverts when Discoverable =
 false
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <169058462369.19376.17488433580048064618.git-patchwork-notify@kernel.org>
Date:   Fri, 28 Jul 2023 22:50:23 +0000
References: <20230728105604.948472-1-simon.mikuda@streamunlimited.com>
In-Reply-To: <20230728105604.948472-1-simon.mikuda@streamunlimited.com>
To:     Simon Mikuda <simon.mikuda@streamunlimited.com>
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

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri, 28 Jul 2023 12:56:04 +0200 you wrote:
> There is a problem with this configuration: Type = peripheral,
> Discoverable = false and Adapter is discoverable
> 
> In this state device will start advertise discoverable advertisements
> even when user wanted non-discoverable advertisements.
> 
> This change will add empty Flags when "Discoverable" parameter is set.
> 
> [...]

Here is the summary with links:
  - [BlueZ] advertising: Fix peripheral adverts when Discoverable = false
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=828bc564e6e8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


