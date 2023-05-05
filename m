Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A79F16F88FD
	for <lists+linux-bluetooth@lfdr.de>; Fri,  5 May 2023 20:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233199AbjEESuv (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 5 May 2023 14:50:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233306AbjEESut (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 5 May 2023 14:50:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21F942269D
        for <linux-bluetooth@vger.kernel.org>; Fri,  5 May 2023 11:50:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B8DCC63FE6
        for <linux-bluetooth@vger.kernel.org>; Fri,  5 May 2023 18:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2405BC433D2;
        Fri,  5 May 2023 18:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683312622;
        bh=F1SmNu+8synsjXbGEazO7aJ0oS//mJRqdCI0G4ijUdY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=J6+UUclt3+Kw8N21fgoOEv4O1OvI9Z+szEYtQ9iVpLxdIc3uNyoPLWO+cadd8Y2Yp
         ogGrXSS8mF+KkzVwIBz69c2p6AE2vmubCWLmqyaTobVDBEEVilbqsA4iVsVmKs1bAY
         0mHBfY0bvwOfx1WWnHVJTginQbodyqfCqG19fc24c870pUbfDy2/eM/SH7T3vNNjch
         gdNPCyjMMSgvvJedc0g33z8bgJ2CuiZdQzZqp+FdCo9LVJGOlEZlq0AgjJktVjigqR
         DIjVKiTtcTZyK/GS6SJjOqi1wMN9rYqqF//BXgxLUA7BGCHd//vF887i/65EfHTflZ
         hdyjTUDDxBKbQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0B4E5C395FD;
        Fri,  5 May 2023 18:50:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ 0/5] Add initial code for handling BASS
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <168331262204.28569.10823196736816621597.git-patchwork-notify@kernel.org>
Date:   Fri, 05 May 2023 18:50:22 +0000
References: <20230505082943.92033-1-iulia.tanasescu@nxp.com>
In-Reply-To: <20230505082943.92033-1-iulia.tanasescu@nxp.com>
To:     Iulia Tanasescu <iulia.tanasescu@nxp.com>
Cc:     linux-bluetooth@vger.kernel.org
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

On Fri,  5 May 2023 11:29:38 +0300 you wrote:
> This patch series adds initial code for handling Broadcast Audio Scan Service.
> 
> Iulia Tanasescu (5):
>   lib/uuid: Add BASS UUIDs
>   shared/att-types: Add BT_ERROR_WRITE_REQUEST_REJECTED error code
>   shared/util: Add iovec helpers for pulling/pushing le32 and le24
>     values
>   shared/bass: Add initial code for handling BASS
>   profiles: Add initial code for BASS plugin
> 
> [...]

Here is the summary with links:
  - [BlueZ,1/5] lib/uuid: Add BASS UUIDs
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=4e549cf48b71
  - [BlueZ,2/5] shared/att-types: Add BT_ERROR_WRITE_REQUEST_REJECTED error code
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=d5d921881b7e
  - [BlueZ,3/5] shared/util: Add iovec helpers for pulling/pushing le32 and le24 values
    (no matching commit)
  - [BlueZ,4/5] shared/bass: Add initial code for handling BASS
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=a56c7fd16230
  - [BlueZ,5/5] profiles: Add initial code for BASS plugin
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=6bafe1c66515

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


