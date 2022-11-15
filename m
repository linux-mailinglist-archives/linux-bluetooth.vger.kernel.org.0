Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A00B6291CF
	for <lists+linux-bluetooth@lfdr.de>; Tue, 15 Nov 2022 07:26:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbiKOG0e (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 15 Nov 2022 01:26:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232085AbiKOG0c (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 15 Nov 2022 01:26:32 -0500
X-Greylist: delayed 335 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 14 Nov 2022 22:26:30 PST
Received: from mta-out1.inet.fi (mta-out1.inet.fi [62.71.2.226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AA30D49
        for <linux-bluetooth@vger.kernel.org>; Mon, 14 Nov 2022 22:26:30 -0800 (PST)
Received: from johanna3.inet.fi (unknown [10.16.62.35])
        by em201-smtpout82.rokki.sonera.fi (Postfix) with ESMTP id 783F055E0;
        Tue, 15 Nov 2022 08:20:51 +0200 (EET)
Received: from taipan.pilppa.org (195.165.183.197) by johanna3.inet.fi (9.0.019.26-1)
        id 63468112029C3C4F; Tue, 15 Nov 2022 08:20:51 +0200
Received: from mail.pilppa.org (mail.pilppa.org [195.165.183.197])
Date:   Tue, 15 Nov 2022 08:20:44 +0200 (EET)
From:   Mika Laitio <lamikr@pilppa.org>
To:     Swyter <swyterzone@gmail.com>
cc:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jack <ostroffjh@users.sourceforge.net>,
        linux-bluetooth@vger.kernel.org,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Marcel Holtmann <marcel@holtmann.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [Regression] Cambridge Silicon Radio, Ltd Bluetooth Dongle
In-Reply-To: <7ea187e5-7c70-db36-1fa8-148507b2e7c5@gmail.com>
Message-ID: <e382d911-90bc-de3f-9f3-6143ed8a9b75@pilppa.org>
References: <76cd4547-a68d-9d52-1d87-8299e29406ff@gmail.com> <LWPL3AC7.RRTERTU2.B5FO44IX@4YQH7VT3.DY2DZPQX.S6LIZ6VV> <CABBYNZKDEjYOW+b1snUsvBgidW37+tPbsidq0pXaOqWKvRC8uQ@mail.gmail.com> <7ea187e5-7c70-db36-1fa8-148507b2e7c5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_05,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

> Thanks to this last-effort parameter we can cover that last mile
> without people having to recompile custom versions of btusb.
>
> My dongle doesn't work? Easy, add this here. Most people won't
> have to bother with this, but that final ~3% would be screwed.

So what is the parameter needed for now? Might help users coming to this 
bug and finding this thread.

Mika
