Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 669A15A15D2
	for <lists+linux-bluetooth@lfdr.de>; Thu, 25 Aug 2022 17:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242901AbiHYPbm convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 25 Aug 2022 11:31:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243250AbiHYPbE (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 25 Aug 2022 11:31:04 -0400
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A971D96753
        for <linux-bluetooth@vger.kernel.org>; Thu, 25 Aug 2022 08:30:50 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 4B785200007
        for <linux-bluetooth@vger.kernel.org>; Thu, 25 Aug 2022 15:30:49 +0000 (UTC)
Message-ID: <6422b1f3f94e959917f919af20a2aa43b4c13a89.camel@hadess.net>
Subject: Re: [PATCH] adapter: Implement PowerState property
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-bluetooth@vger.kernel.org
Date:   Thu, 25 Aug 2022 17:30:42 +0200
In-Reply-To: <db39101f70c945026e76d7b49ee358d9a2330358.camel@hadess.net>
References: <db39101f70c945026e76d7b49ee358d9a2330358.camel@hadess.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Thu, 2022-08-25 at 15:26 +0200, Bastien Nocera wrote:
> This property should allow any program to show the transitional
> state,
> not just the one that requested the change, and will also show
> transitional states that were the results of other system changes,
> like
> rfkill changes.

Looks like the bot doesn't like where I put those comments.

If anyone can comment on the API I used, and I'll iterate the actual
implementation. I'd like the API to be settled by the time GNOME 43
ships, so we can rely on it there.

Cheers
