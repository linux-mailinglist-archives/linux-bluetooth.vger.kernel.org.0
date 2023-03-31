Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C58896D2B35
	for <lists+linux-bluetooth@lfdr.de>; Sat,  1 Apr 2023 00:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbjCaWUW (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 31 Mar 2023 18:20:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbjCaWUU (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 31 Mar 2023 18:20:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C83C2032E
        for <linux-bluetooth@vger.kernel.org>; Fri, 31 Mar 2023 15:20:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B188162C45
        for <linux-bluetooth@vger.kernel.org>; Fri, 31 Mar 2023 22:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 197BBC433D2;
        Fri, 31 Mar 2023 22:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680301219;
        bh=DeL7eb9mk5JgPAM7bqt6HsFf1SaSKhOwv199E/OT+1w=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=InPhCnha4QCQnKopUIeqVkX5KBoUMEGiSi/a5a7f+5IIR7VCLYkZ33nYqqn9laieR
         29e+OokgJls+vHoAKkdOlgOJXL+9m5/HTBySi+zdJLkNWgxGw5rrB1f0ZWddWPh6OE
         i8PkFoE9paGiSQ5F7DCoKFTCObbdeHKHag4e4C684o8/fbhu5Z8hVvL/P8fMmQp1hF
         27sYw1CerIMLilMGBaeEVyL8AGRuX1zhNfUbTx91Ra9iuryx8sxuSWwaLm64VVvf6l
         JejimM99/dMUC8qRp7WVvah+23sREZ4gXmlOVYlOUQlztGe+nAcxh1YWmC6Vxs2vJg
         AtJzKc04bXLYg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F1DF6C395C3;
        Fri, 31 Mar 2023 22:20:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ v2] adapter: Use regular discovery for filters which
 only have discoverable set
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <168030121898.14188.14830989349670597911.git-patchwork-notify@kernel.org>
Date:   Fri, 31 Mar 2023 22:20:18 +0000
References: <20230331200329.461355-1-hdegoede@redhat.com>
In-Reply-To: <20230331200329.461355-1-hdegoede@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-bluetooth@vger.kernel.org, hadess@hadess.net
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri, 31 Mar 2023 22:03:29 +0200 you wrote:
> discovery_filter_to_mgmt_cp() does not add discovery_filter.discoverable
> to the created mgmt_cp_start_service_discovery struct.
> 
> Instead update_discovery_filter() separately checks
> client->discovery_filter->discoverable for all clients.
> 
> This means that for discovery-filters which only have the discoverable
> flag set, to put the adapter in discoverable mode while discovering,
> the created mgmt_cp_start_service_discovery struct is empty.
> 
> [...]

Here is the summary with links:
  - [BlueZ,v2] adapter: Use regular discovery for filters which only have discoverable set
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=de8e7cfce25b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


