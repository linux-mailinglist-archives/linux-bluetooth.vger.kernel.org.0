Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8359769FBF
	for <lists+linux-bluetooth@lfdr.de>; Mon, 31 Jul 2023 19:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbjGaRu2 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 31 Jul 2023 13:50:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbjGaRu0 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 31 Jul 2023 13:50:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66BDEFB
        for <linux-bluetooth@vger.kernel.org>; Mon, 31 Jul 2023 10:50:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ED23261261
        for <linux-bluetooth@vger.kernel.org>; Mon, 31 Jul 2023 17:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59639C433C7;
        Mon, 31 Jul 2023 17:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690825824;
        bh=nwxUXukcqzvI5pliqllGt3zV3+i5/+5Ez7PdhsDgtXs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=VRiVLa5vNY8w3AkdppND9M6OQq3el/u75ej+X+zGhkJUbRyBU3R0QkbowViZt1eEX
         M8cHXkd9cCDGo6BP2AQbXiloEhOWTPoMqpXH0fi7jLbgeuUcbRKUqfIgCNNtbpmvsJ
         Fj6FP1u0/XLlfU/97FKH14az0UOrCdXgpfSvLetx84jIRLAsrW6Yv1QNHUZKzEjaUT
         bGhjkM/klaEuhu5JUEyJO8DjPhNtATVcOvfn0U1mNuuTTQ0naxts6qKRUGcYYUPBpG
         A/DJnDWP3+ORND1EtOOEspjpTN8QSZtj9P+/N3k581Z2saQdFJDh8jWRvt7wFWQ3h+
         qDJNcGDT2leIQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3DB55C595C5;
        Mon, 31 Jul 2023 17:50:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ v3 0/1] Rename BAA_SERVICE to BCAA_SERVICE add
 BAA_SERVICE(0x1851)
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <169082582424.13999.9776795392562557907.git-patchwork-notify@kernel.org>
Date:   Mon, 31 Jul 2023 17:50:24 +0000
References: <20230731091642.3712-1-silviu.barbulescu@nxp.com>
In-Reply-To: <20230731091642.3712-1-silviu.barbulescu@nxp.com>
To:     Silviu Florian Barbulescu <silviu.barbulescu@nxp.com>
Cc:     linux-bluetooth@vger.kernel.org, claudia.rosu@nxp.com,
        mihai-octavian.urzica@nxp.com, vlad.pruteanu@nxp.com,
        andrei.istodorescu@nxp.com, iulia.tanasescu@nxp.com
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

On Mon, 31 Jul 2023 12:16:41 +0300 you wrote:
> Rename BAA_SERVICE to BCAA_SERVICE and added BAA_SERVICE(0x1851)
> as UUID for the broadcast sink.
> 
> Silviu Florian Barbulescu (1):
>   Rename BAA_SERVICE to BCAA_SERVICE and added BAA_SERVICE(0x1851) as
>     UUID for the broadcast sink.
> 
> [...]

Here is the summary with links:
  - [BlueZ,v3,1/1] Rename BAA_SERVICE to BCAA_SERVICE add BAA_SERVICE(0x1851)
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=1dbd9ba1f195

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


