Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 035FA6BA116
	for <lists+linux-bluetooth@lfdr.de>; Tue, 14 Mar 2023 22:00:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbjCNVAW (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 14 Mar 2023 17:00:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjCNVAV (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 14 Mar 2023 17:00:21 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB33A2E81F
        for <linux-bluetooth@vger.kernel.org>; Tue, 14 Mar 2023 14:00:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9CDD8B81BC0
        for <linux-bluetooth@vger.kernel.org>; Tue, 14 Mar 2023 21:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4EBE0C433D2;
        Tue, 14 Mar 2023 21:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678827618;
        bh=sSz03aLyd6no8K7VRukgUNt+F/V4yR+i6Xf341Op92g=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=JCQg7+feMihCGCNxy9h3knMQM+ql47zbQZ03Kp8yBwpCyJEUyRyod5R4z0qB5e2ex
         coRxWoBuRCxvOdIsI4nksD0TFsDGJkfMKb16Z4DgCoAU8ijyzP6eFsYTHkpC4WyVgt
         VH1vJ3R9YzQpwsgLXegFHnh2AgwFrAsv0DZhR8qUTfLKg5F2IbCJX7eoTO2DHcvDWQ
         d+ow5aOYpMeW97kSypOsVTmDpDRRflFp1siAmDrGrEdfy1fhiopqNV5uN/71ekNp8M
         pT+JEFYC9vxvFHufOraudKkEW/tpSLjo+KWeq9OVRKM5VrPxiiqCHJGbuH03WidVtP
         OZhkBNnN0zYHw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3DC2BE66CB8;
        Tue, 14 Mar 2023 21:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] shared/gatt-client: Fix crash on
 bt_gatt_client_idle_unregister
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <167882761824.6962.13176622282046175345.git-patchwork-notify@kernel.org>
Date:   Tue, 14 Mar 2023 21:00:18 +0000
References: <20230314192325.464661-1-luiz.dentz@gmail.com>
In-Reply-To: <20230314192325.464661-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org
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

On Tue, 14 Mar 2023 12:23:25 -0700 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> This fixes the following crash:
> 
> Invalid read of size 8
>    at 0x1E1E0B: bt_gatt_client_idle_unregister (gatt-client.c:3812)
>    by 0x1EB6BD: bt_bap_detach (bap.c:3821)
>    by 0x1EB6BD: bt_bap_detach (bap.c:3808)
>    by 0x1D5631: queue_foreach (queue.c:207)
>    by 0x1DCAA3: disconnect_cb (att.c:713)
>    by 0x1F4404: watch_callback (io-glib.c:157)
>    by 0x48BBC7E: g_main_context_dispatch (in /usr/lib64/libglib-2.0.so.0.7400.6)
>    by 0x4912117: ??? (in /usr/lib64/libglib-2.0.so.0.7400.6)
>    by 0x48BB24E: g_main_loop_run (in /usr/lib64/libglib-2.0.so.0.7400.6)
>    by 0x1F4A54: mainloop_run (mainloop-glib.c:66)
>    by 0x1F4E21: mainloop_run_with_signal (mainloop-notify.c:188)
>    by 0x1304B4: main (main.c:1428)
>  Address 0x28 is not stack'd, malloc'd or (recently) free'd
> 
> [...]

Here is the summary with links:
  - [BlueZ] shared/gatt-client: Fix crash on bt_gatt_client_idle_unregister
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=857d9b96b384

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


