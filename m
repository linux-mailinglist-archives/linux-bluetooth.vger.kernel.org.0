Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D47667B74B7
	for <lists+linux-bluetooth@lfdr.de>; Wed,  4 Oct 2023 01:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235041AbjJCXUf (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 3 Oct 2023 19:20:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235144AbjJCXUc (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 3 Oct 2023 19:20:32 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B110FD9
        for <linux-bluetooth@vger.kernel.org>; Tue,  3 Oct 2023 16:20:29 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57CC1C433CC;
        Tue,  3 Oct 2023 23:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696375229;
        bh=Id8/uDWy9gzf8X/TwkSnBAK9J0xaHVXtoI6NhRTP7rc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Ai97Nk3EMPb5N3eKfoN2h7uspxM9AxixpQFQkerUeEStTlJtSV8LrRfVghkeJxt7C
         DPYmoWjrPClfFijikCx05aFTc0mQifzt7qc2zh24lwWQp+hxSOD/Iy+a7bmY+ou/dG
         wPQcOsQ4XWr3Pt4C7bm4VKBlpht6PWnyACm5ItTEvQ72IjD3s6RZx0fEy56HgUHP/V
         dg9GP3KWkH6hDVw7zxXLegGrGw0XiyUSK4Lj41FoaBG5jbTYZUGQ/GjGHiHMCFzuJ6
         RfJaAoVaEgrRrqt+x97lz1ipa4hLfxJeOtIWEwlxHIIRId6Mn7vyH+KcjgTbh0P3nD
         0hKswikWCEUiw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 404F8E270F6;
        Tue,  3 Oct 2023 23:20:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ 0/1] iso-tester: Test bcast receiver with PA sync,
 no BIS
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <169637522925.21629.4960466643593190621.git-patchwork-notify@kernel.org>
Date:   Tue, 03 Oct 2023 23:20:29 +0000
References: <20231003145754.3667-1-iulia.tanasescu@nxp.com>
In-Reply-To: <20231003145754.3667-1-iulia.tanasescu@nxp.com>
To:     Iulia Tanasescu <iulia.tanasescu@nxp.com>
Cc:     linux-bluetooth@vger.kernel.org, claudia.rosu@nxp.com,
        mihai-octavian.urzica@nxp.com, silviu.barbulescu@nxp.com,
        vlad.pruteanu@nxp.com, andrei.istodorescu@nxp.com,
        luiz.dentz@gmail.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue,  3 Oct 2023 17:57:53 +0300 you wrote:
> Some BASS test scenarios require the BASS Server to only sync to the
> PA transmitted by a source, and not any BIS.
> 
> This patch implements a test to exercise this scenario, where a broadcast
> receiver is able to successfully perform PA sync, without listening for
> any BIS.
> 
> [...]

Here is the summary with links:
  - [BlueZ,1/1] iso-tester: Test bcast receiver with PA sync, no BIS
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=d9445f6d0f08

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


