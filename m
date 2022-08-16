Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D27675965F6
	for <lists+linux-bluetooth@lfdr.de>; Wed, 17 Aug 2022 01:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237433AbiHPXUT (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 16 Aug 2022 19:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233240AbiHPXUR (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 16 Aug 2022 19:20:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDABB74B9B
        for <linux-bluetooth@vger.kernel.org>; Tue, 16 Aug 2022 16:20:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6AB116130C
        for <linux-bluetooth@vger.kernel.org>; Tue, 16 Aug 2022 23:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC964C433D6;
        Tue, 16 Aug 2022 23:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660692015;
        bh=90B8svynqjGvNe4ayfrIIQkrjEMnn/iAzTNXJ+qKv4k=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Hz5qPJMHXOzBJZ9frWSxhLrm0SbG96nCrtTNryLvW5b0dTZjjBnia2LCTsmn8ySx2
         qW7bDiXp+IgZIR0VNMwPVUxDlotjfE0jr7ZsaLWNBdibAwUTdBlktOspxxyBSa7epa
         y3zzHN+ZO+RTTbQ4MjlnrL4wB6mLKAlHMqI6wAskkpPBDbjLAfTqexVvAQo7MfV5OA
         xfQnpNkt177e1stQcvcMgXKr+LWGkkNDySWuWAgRp1aqeEbBMPGbuFaiTfkmihO3KT
         vBKhgRo9X/iv3ZwqNxGWJDgdnswOkH5p0AM0SVLjK1nHxO6J2IAEW1gbsPyZloGSus
         iq7RnaE7wowuA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AEE5DE2A04C;
        Tue, 16 Aug 2022 23:20:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [BlueZ PATCH v2 1/2] hog-lib: Don't restrict Report MAP size
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <166069201571.20856.7160240760685936923.git-patchwork-notify@kernel.org>
Date:   Tue, 16 Aug 2022 23:20:15 +0000
References: <20220816220548.1555673-1-luiz.dentz@gmail.com>
In-Reply-To: <20220816220548.1555673-1-luiz.dentz@gmail.com>
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

This series was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 16 Aug 2022 15:05:47 -0700 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> Although HIDS spec is quite clear the Report MAP shall be limited to
> 512 bytes it doesn't seem OS do enforce that on the profile/client side
> and since there isn't any qualification test enforcing it either there
> are quite many devices which uses Report MAP bigger that 512 bytes
> (e.g.: Brydge W-Touch and Lenovo Duet 3 BT Folio).
> 
> [...]

Here is the summary with links:
  - [BlueZ,v2,1/2] hog-lib: Don't restrict Report MAP size
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=952c08ff50c5
  - [BlueZ,v2,2/2] hog-lib: Fix scan-build error
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=60663d4af3ff

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


