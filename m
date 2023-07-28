Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB2F7678A6
	for <lists+linux-bluetooth@lfdr.de>; Sat, 29 Jul 2023 00:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234552AbjG1Wu2 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 28 Jul 2023 18:50:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234331AbjG1WuZ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 28 Jul 2023 18:50:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1BB0173F
        for <linux-bluetooth@vger.kernel.org>; Fri, 28 Jul 2023 15:50:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5131062210
        for <linux-bluetooth@vger.kernel.org>; Fri, 28 Jul 2023 22:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ACBE8C433C7;
        Fri, 28 Jul 2023 22:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690584623;
        bh=UiFgVstKoqLhcxyrnXicMpDz7jFKGx0FTdJIKrO/r2I=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=LxJEAOa2Ssd0L2hzsT+s3SZnCcwFaB/vClFenf9K7fCbT4Z1ngJoDna4H5bGpM92A
         ddmZFevsOXZnM8y3J4ng7X1YcSmPoEXJL9LM+Ep6VjJncm5BPM8bXJm67QEDeoL9ET
         UMWjjcdsM3zR4iFCCSAZC8RDfB6nv/HyIHhEg3KBR4gkmapnjM7Pc+7gwismnoiS8O
         k9etRj4AoGVSisbCV/x+lkJTNBdoO2wHJnJgsM2K3zezeqpklfzkBuSWgofalQi7rZ
         ziAI0mhmEHm+hbdH3KkC9MjAm9EJk2M8q9jZ4srvzIEA8tIRuJZUjAzPJ0oAfQGxM5
         6I2UtzSjt1ktg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 951FCC39562;
        Fri, 28 Jul 2023 22:50:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] gatt-client: Add read-only handles to dbus
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <169058462360.19376.11738264209407954799.git-patchwork-notify@kernel.org>
Date:   Fri, 28 Jul 2023 22:50:23 +0000
References: <20230728044944.576220-1-simon.mikuda@streamunlimited.com>
In-Reply-To: <20230728044944.576220-1-simon.mikuda@streamunlimited.com>
To:     Simon Mikuda <simon.mikuda@streamunlimited.com>
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

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri, 28 Jul 2023 06:49:44 +0200 you wrote:
> This can be usefull when mapping names for services and characteristics
> to their handle numbers.
> ---
>  doc/gatt-api.txt  |  3 +++
>  src/gatt-client.c | 36 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 39 insertions(+)

Here is the summary with links:
  - [BlueZ] gatt-client: Add read-only handles to dbus
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=cda5549f2475

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


