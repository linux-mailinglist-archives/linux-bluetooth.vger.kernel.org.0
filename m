Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35B3B713019
	for <lists+linux-bluetooth@lfdr.de>; Sat, 27 May 2023 00:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbjEZWkX (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 26 May 2023 18:40:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbjEZWkW (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 26 May 2023 18:40:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 529F09C
        for <linux-bluetooth@vger.kernel.org>; Fri, 26 May 2023 15:40:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DAAC36541A
        for <linux-bluetooth@vger.kernel.org>; Fri, 26 May 2023 22:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4AFD3C433EF;
        Fri, 26 May 2023 22:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685140820;
        bh=34Fk3ils7JZNUzteQ/zLQykm1cd1R4DDAJPtbxpfJ9M=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=pZtEUOuKB/DaTVtrTdozaeU+yKu5QX5cpkThed09I5fDzClhXTpRGx0RbU500b2bc
         K2ey8QWWt1Tyw4cx9oNd2Z+hJRf4uZmwgjBOj3p8hAo/RID9mKXZ3W/Rawdm0Vzrn8
         6TKcHe/DqlEV9PxP49JOEGGptkMSWjSt9mMuvA/PJDORFPLjqUcA198d7wX4jV0hbe
         hLCfPQcxrbqcSYCo2oqMeo5CiKhQWWKpFNEKVefOiSamTKOFhdPuXIFrj/plW8Iubi
         CmwignfuR6mEcgrjd2Nz6zncCuD0N4ncLFkDW1/pDgQVypYKoW5wi2IiDQlIB5qBps
         4nVWa8Tovss1Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3135EE270C2;
        Fri, 26 May 2023 22:40:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ 0/6] Add initial support for BAP broadcast source
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <168514082018.18404.15723399025465925950.git-patchwork-notify@kernel.org>
Date:   Fri, 26 May 2023 22:40:20 +0000
References: <20230523143504.3319-1-iulia.tanasescu@nxp.com>
In-Reply-To: <20230523143504.3319-1-iulia.tanasescu@nxp.com>
To:     Iulia Tanasescu <iulia.tanasescu@nxp.com>
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

This series was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 23 May 2023 17:34:58 +0300 you wrote:
> This patch adds initial support for BAP broadcast source.
> 
> The current implementation allows BAP source endpoint registration,
> media transport creation, transport acquiring and sending broadcast ISO data.
> 
> Currently, one BIG containing one BIS is supported.
> 
> [...]

Here is the summary with links:
  - [BlueZ,1/6] doc: Update Docs for BAP broadcast source
    (no matching commit)
  - [BlueZ,2/6] lib: Add macro definitions for BAP broadcast source support
    (no matching commit)
  - [BlueZ,3/6] monitor: Check for ISO broadcast support in controller
    (no matching commit)
  - [BlueZ,4/6] btio: Add support for setsockopt (BT_IO_OPT_BASE)
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=7002ecc8914a
  - [BlueZ,5/6] client/player: Update bluetoothctl with support for broadcast source
    (no matching commit)
  - [BlueZ,6/6] bap: Add initial support for BAP broadcast source
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


