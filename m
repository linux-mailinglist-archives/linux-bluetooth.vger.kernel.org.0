Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F11965A94E8
	for <lists+linux-bluetooth@lfdr.de>; Thu,  1 Sep 2022 12:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233452AbiIAKn2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 1 Sep 2022 06:43:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232714AbiIAKnR (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 1 Sep 2022 06:43:17 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17313DB04F
        for <linux-bluetooth@vger.kernel.org>; Thu,  1 Sep 2022 03:43:15 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 8A6BA100006;
        Thu,  1 Sep 2022 10:43:11 +0000 (UTC)
Message-ID: <e62a374b72b54f2e49059d5266f7fafe06b18abb.camel@hadess.net>
Subject: Re: [PATCH BlueZ v4 2/6] adapter: Implement PowerState property
From:   Bastien Nocera <hadess@hadess.net>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Date:   Thu, 01 Sep 2022 12:43:05 +0200
In-Reply-To: <CABBYNZ+aqTbSR-=R7CP8pY48=QxoEjsYnY7oCWc=niLYr7o2fg@mail.gmail.com>
References: <20220831091912.47894-1-hadess@hadess.net>
         <20220831091912.47894-2-hadess@hadess.net>
         <CABBYNZ+aqTbSR-=R7CP8pY48=QxoEjsYnY7oCWc=niLYr7o2fg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Wed, 2022-08-31 at 13:03 -0700, Luiz Augusto von Dentz wrote:
> > +enum {
> > +       ADAPTER_POWER_STATE_TARGET_NONE = 0,
> > +       ADAPTER_POWER_STATE_TARGET_OFF,
> > +       ADAPTER_POWER_STATE_TARGET_ON
> > +};
> 
> Lets take out the TARGET portion and have all the states PowerState
> can assume including the transitioning ones.

Done, with the rest of the changes, in v5.

I've also fixed the initial rfkill state if the adapter is blocked
before bluetoothd is started.
