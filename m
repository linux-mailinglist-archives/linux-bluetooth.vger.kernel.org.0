Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C08250C11F
	for <lists+linux-bluetooth@lfdr.de>; Fri, 22 Apr 2022 23:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbiDVViy (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 22 Apr 2022 17:38:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbiDVViv (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 22 Apr 2022 17:38:51 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 608742C8C2D
        for <linux-bluetooth@vger.kernel.org>; Fri, 22 Apr 2022 13:44:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2556AB831B9
        for <linux-bluetooth@vger.kernel.org>; Fri, 22 Apr 2022 20:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1786C385A0;
        Fri, 22 Apr 2022 20:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650658212;
        bh=alD3a8CaOoOfEWdC4N5dgt1hlxttPAoDZdHYKqAe4FQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=dT3jtcL00Vx/oo/ekX/Ig1QVzdfsw8lJJAevG1bw1ctJwFewIHUR8fwJLCmJAsGoM
         /B7F0LJvpLgAVi/+mCJDdwzldETA/Xi2zP2+ymNRzBXchCBMkkN9YzQH6vvzM2FExx
         UR4qp1vUppxOqXQBLAz7s3puRP9Xjw0PwHzwfeiDzISmHQKMPI+aXrlLr4jDK0e2hO
         MrXmwCQSIEBpqKB0+RTO9bgIgIgf8RvyMX0YxZ+/+mwEiG11zFFycqqLxFfQipsfYg
         fuwJrRvd2B6yEwpA2HaBnBrFwmGU57W5NI57tROHc9cazZ4y38BLKb9Zmi4w2A5Sac
         E+MkFUWfidG5g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C64B4E8DD85;
        Fri, 22 Apr 2022 20:10:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] btmon: Fix decoding of Enhanced Credit Connection
 Request
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <165065821280.18982.1090623628580636909.git-patchwork-notify@kernel.org>
Date:   Fri, 22 Apr 2022 20:10:12 +0000
References: <20220420234609.2968138-1-luiz.dentz@gmail.com>
In-Reply-To: <20220420234609.2968138-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Wed, 20 Apr 2022 16:46:09 -0700 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> This fixes the decoding of Enhanced Credit Connection Request which was
> not accounting the fields correctly causing 2 extra Source CID to be
> printed.
> ---
>  monitor/l2cap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [BlueZ] btmon: Fix decoding of Enhanced Credit Connection Request
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=3e2ad5009c0f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


