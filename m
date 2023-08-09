Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 201BD77671C
	for <lists+linux-bluetooth@lfdr.de>; Wed,  9 Aug 2023 20:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbjHISUX (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 9 Aug 2023 14:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjHISUW (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 9 Aug 2023 14:20:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 265BDFE
        for <linux-bluetooth@vger.kernel.org>; Wed,  9 Aug 2023 11:20:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BA24D64354
        for <linux-bluetooth@vger.kernel.org>; Wed,  9 Aug 2023 18:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21C76C433C8;
        Wed,  9 Aug 2023 18:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691605221;
        bh=EEcDqhSaoXPh6YEatIY5MkTuMKDg6R22JxTA4Hlv50Q=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=NMrY0j2kg575N/B7mWnRhla2VrQB9ZrmzJNxhyzNJtstaXpJVq8YokDR++1YuaXLU
         hBlCyVFtR/9fZN1MSEUmPVhYlNwmrCfnsT0RMY4AUH1wvAwpRJZxzHxmNXOHK0YeXL
         LgI2pJTgBOAingjy16G+Ao0XAM+KOsTNJzA5ZFxjAJvDq4MR1vq/QA1MkdUTp5MmBN
         KqVkdT/5+aVbwQ4r+8PrMKVH6JeRdPXqw4V4K+juMS1IyYVa0YWDbvOtFuSwQK/oi7
         x6Qd/CkyyYtRBYSkLm4Dx12rxk1LDYcVfpd2clPflf5IFvIYRHpN+6FsbcaDkFUP8n
         MwRFXwIam+6Xg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 01CB6C3274B;
        Wed,  9 Aug 2023 18:20:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ v4 0/2] configure.ac: Install D-Bus policy in
 /usr/share, not /etc
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <169160522100.14644.4519904446970876636.git-patchwork-notify@kernel.org>
Date:   Wed, 09 Aug 2023 18:20:21 +0000
References: <20230809065143.2002324-1-gioele@svario.it>
In-Reply-To: <20230809065143.2002324-1-gioele@svario.it>
To:     Gioele Barabucci <gioele@svario.it>
Cc:     linux-bluetooth@vger.kernel.org
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello:

This series was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Wed,  9 Aug 2023 08:51:41 +0200 you wrote:
> [Sending again, this time with the right commit titles. Sorry for the noise.]
> 
> This patch changes configure.am to install the bluez D-Bus policy in
> `/usr/share/dbus-1/system.d` instead of `/etc/dbus-1/system.d`.
> 
> From https://bugs.debian.org/1006631:
> 
> [...]

Here is the summary with links:
  - [BlueZ,v4,1/2] configure.ac: Bump minimum D-Bus version to 1.10
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=8b6432a8728f
  - [BlueZ,v4,2/2] configure.ac: Install D-Bus policy in /usr/share, not /etc
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=fc6f5856d177

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


