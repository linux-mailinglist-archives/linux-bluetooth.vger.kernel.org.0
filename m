Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC1A2EBC86
	for <lists+linux-bluetooth@lfdr.de>; Wed,  6 Jan 2021 11:38:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbhAFKgy (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 6 Jan 2021 05:36:54 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:36463 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726051AbhAFKgx (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 6 Jan 2021 05:36:53 -0500
X-Originating-IP: 82.255.60.242
Received: from [192.168.1.150] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 717D21C0004;
        Wed,  6 Jan 2021 10:36:11 +0000 (UTC)
Message-ID: <82dbb44093e6ff236271bf4afcb31141c49e456d.camel@hadess.net>
Subject: Re: [PATCH] Bluetooth: L2CAP: Try harder to accept device not
 knowing options
From:   Bastien Nocera <hadess@hadess.net>
To:     Archie Pusaka <apusaka@google.com>
Cc:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        Florian Dollinger <dollinger.florian@gmx.de>
Date:   Wed, 06 Jan 2021 11:36:10 +0100
In-Reply-To: <CAJQfnxEpagJOSVdA0MaHg0foy53K6QSpSYk++OQ18hQue9jYCA@mail.gmail.com>
References: <20201208172912.4352-1-hadess@hadess.net>
         <CABBYNZJNTDek+kKS5wtrr67Xx8DmFGvcV13cLSxULgJRa5N+3g@mail.gmail.com>
         <6e6d72ff9aa14a65d6d0df5bd68a6ad6887f31c2.camel@hadess.net>
         <ebbb9f334f6f0cecdb46ddce63483df165ea12ec.camel@hadess.net>
         <CAJQfnxEpagJOSVdA0MaHg0foy53K6QSpSYk++OQ18hQue9jYCA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 (3.38.2-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Wed, 2021-01-06 at 17:47 +0800, Archie Pusaka wrote:
> Hi Bastien,
> 
> For the test L2CAP/COS/CFD/BV-14-C, this patch is required to pass
> it.
> https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git/commit/?id=5b8ec15d02f12148ef0185825217162b3bc341f4
> 
> I don't think it is merged yet into 5.10, so you might need to apply
> the patch yourself.
> 
> Thanks,
> Archie

Thank you Archie, much appreciated.

I'll rebuild my test kernels and report back.

