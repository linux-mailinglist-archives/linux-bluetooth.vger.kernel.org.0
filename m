Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB4A7D177A
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Oct 2023 22:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbjJTUu3 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 20 Oct 2023 16:50:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbjJTUu2 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 20 Oct 2023 16:50:28 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E94DDC2
        for <linux-bluetooth@vger.kernel.org>; Fri, 20 Oct 2023 13:50:25 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91672C433CB;
        Fri, 20 Oct 2023 20:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697835025;
        bh=Gq77VxajrnybuS+9zWxEXc0ZkCbQeqER5jy8Qr/v+Lc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=PeSq4nRhmW/Hy1IHIWooKecOEh6SlFw4pHPIGXtnnJ+96GKzxZ+nrFOUZS4NjPvN/
         Si8KTstfUhiKgxI1Ms6fi4BpjWPFD+wImFfvuzeKPQm0vxLaySdc1j6AWRmwHWX7fL
         kinLUdLxO7W4i7SuwtXkccmL0CS0mdkxtI9KKDnKawi13Q5iSk7aqWF93nvcXeQyxl
         tC7aYXpjghTf3ps2tr3F2KH6QNYDQ5GYBnEjMvYdw9xJYzTqU6os6qe26DRCYjzGyX
         5CVERQmOu4YOn/OD2zncgBrJKsSBHq1zLUZ2n2droN54igveHXGJkCxEj560jDVo+8
         guEzsgGDBFmTA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 788ABC73FE4;
        Fri, 20 Oct 2023 20:50:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1 1/5] media: Populate location to qos structure
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <169783502549.21183.6135327147932584720.git-patchwork-notify@kernel.org>
Date:   Fri, 20 Oct 2023 20:50:25 +0000
References: <20231020142554.486629-1-kiran.k@intel.com>
In-Reply-To: <20231020142554.486629-1-kiran.k@intel.com>
To:     Kiran K <kiran.k@intel.com>
Cc:     linux-bluetooth@vger.kernel.org, ravishankar.srivatsa@intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello:

This series was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri, 20 Oct 2023 19:55:50 +0530 you wrote:
> Allow clients to register Location for endpoint.
> ---
>  profiles/audio/media.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Here is the summary with links:
  - [v1,1/5] media: Populate location to qos structure
    (no matching commit)
  - [v1,2/5] bap: Fix update of sink location value
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=5f8323f2aaa3
  - [v1,3/5] bap: Do not set default location for sink and source
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=932e64206069
  - [v1,4/5] bap: Fix reading source codec capabilities
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=a564d6a0d533
  - [v1,5/5] media: Parse conext and supported context
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=f02e0c8664a6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


