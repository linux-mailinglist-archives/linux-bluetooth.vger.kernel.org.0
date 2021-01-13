Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B48E2F4B5C
	for <lists+linux-bluetooth@lfdr.de>; Wed, 13 Jan 2021 13:35:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727011AbhAMMdU (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 13 Jan 2021 07:33:20 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:33241 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbhAMMdU (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 13 Jan 2021 07:33:20 -0500
X-Originating-IP: 82.255.60.242
Received: from [192.168.1.150] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 98C3120010;
        Wed, 13 Jan 2021 12:32:38 +0000 (UTC)
Message-ID: <76108887c222f10900df58da1468144ea9ad938d.camel@hadess.net>
Subject: Re: [PATCH] Bluetooth: L2CAP: Try harder to accept device not
 knowing options
From:   Bastien Nocera <hadess@hadess.net>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        Florian Dollinger <dollinger.florian@gmx.de>
Date:   Wed, 13 Jan 2021 13:32:37 +0100
In-Reply-To: <CABBYNZ+41BSkQEGbXsemCgWQhmaEjB3KOkLrFyOjv_=_zMQy_Q@mail.gmail.com>
References: <20201208172912.4352-1-hadess@hadess.net>
         <CABBYNZ+41BSkQEGbXsemCgWQhmaEjB3KOkLrFyOjv_=_zMQy_Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 (3.38.2-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Thu, 2021-01-07 at 17:29 -0800, Luiz Augusto von Dentz wrote:
> Hi,
> 
> On Tue, Dec 8, 2020 at 9:36 AM Bastien Nocera <hadess@hadess.net>
> wrote:
> > 
> > The current implementation of L2CAP options negotiation will
> > continue
> > the negotiation when a device responds with L2CAP_CONF_UNACCEPT
> > ("unaccepted
> > options"), but not when the device replies with L2CAP_CONF_UNKNOWN
> > ("unknown
> > options").
> > 
> > Trying to continue the negotiation without ERTM support will allow
> > Bluetooth-capable XBox One controllers (notably models 1708 and
> > 1797)
> > to connect.
> <snip>
> Reviewed-by: Luiz Augusto Von Dentz <luiz.von.dentz@intel.com>

Marcel? Anything else that would need to be done to land this?

Cheers

