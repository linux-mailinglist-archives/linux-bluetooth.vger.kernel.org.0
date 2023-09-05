Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9E9792DEF
	for <lists+linux-bluetooth@lfdr.de>; Tue,  5 Sep 2023 20:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240978AbjIESzg (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 5 Sep 2023 14:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240568AbjIESzW (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 5 Sep 2023 14:55:22 -0400
X-Greylist: delayed 3119 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 05 Sep 2023 11:54:57 PDT
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F3AD10F8
        for <linux-bluetooth@vger.kernel.org>; Tue,  5 Sep 2023 11:54:57 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0A7BC4166B;
        Tue,  5 Sep 2023 18:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693940040;
        bh=SMBvzw67t2elYdhzb7P+nQvuGcY9DRZKKO3kPhexOXw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ocWADF697/aTpmt2TMTZPIoBkoUKDY+OtlvVZqer64fhbrlmS+eRNwTSEJpxIq2gB
         YiRLcOrD/7TASIP+K/QcyoBZnxSlQLrIAp6Cj87EQLwQkw2Xussc5VJBS0KdCHAJGS
         WB7MPEGa5gEMM09ByqJpLp745hHvyMS0ujquDT5dNaSLIL3PvxUoCW4YWQjwLZAjSO
         6UhKjucfczJrRc8HmsLIKa0Pq+gF1q8JH1xoiKiAuJFzXcLTRf5nuzfrexTuq+O20V
         m2MWQQWtOlHwDE8V5o3z6jGUYaTRnh9IB72VS84g+2KxcovxJWlk1NzNUrwAY98mxN
         GHt0BBiQ+ymZw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A5D7DC595C5;
        Tue,  5 Sep 2023 18:54:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ v2 0/4] Implementation  of MICS and MICP
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <169394004067.14332.15637091143647820919.git-patchwork-notify@kernel.org>
Date:   Tue, 05 Sep 2023 18:54:00 +0000
References: <20230905070912.82340-1-nitin.jadhav@nxp.com>
In-Reply-To: <20230905070912.82340-1-nitin.jadhav@nxp.com>
To:     Nitin Jadhav <nitin.jadhav@nxp.com>
Cc:     linux-bluetooth@vger.kernel.org, devyani.godbole@nxp.com,
        mahesh.talewad@nxp.com, luiz.dentz@gmail.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello:

This series was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue,  5 Sep 2023 10:09:08 +0300 you wrote:
> Hello Maintainers,
> 
> This Patch series contains following points:
> - code implementation of Mandatory features of MICS and MICP.
> - code implementation of Unit Test cases of MICS and MICP.
> 
> Implementation of following features have been handled in this Patch series.
> MICS-MICP:
> - MICS Service
> - Mute Characteristic[Read, Write, Notify]
> - Configure Mute Notifications
> - Read Mute
> - Set Mute
> 
> [...]

Here is the summary with links:
  - [BlueZ,v2,1/4] lib/uuid.h: Add UUID(s)
    (no matching commit)
  - [BlueZ,v2,2/4] src/shared/micp.c: To implement MICP profile MICS service
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=5c788b73b8a5
  - [BlueZ,v2,3/4] profiles/audio/micp.c: To implement MICP plugin
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=2e47711d4d81
  - [BlueZ,v2,4/4] unit/test-micp-test-mics: To implement unit tester code
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


