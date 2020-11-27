Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2752C65C1
	for <lists+linux-bluetooth@lfdr.de>; Fri, 27 Nov 2020 13:32:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728013AbgK0Mbu (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 27 Nov 2020 07:31:50 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:58963 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbgK0Mbu (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 27 Nov 2020 07:31:50 -0500
X-Originating-IP: 82.255.60.242
Received: from [192.168.0.28] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 3D81D1BF207;
        Fri, 27 Nov 2020 12:31:47 +0000 (UTC)
Message-ID: <ec514dae04260d4ef78ce56f3e0f78d4e2fb094c.camel@hadess.net>
Subject: Re: [PATCH BlueZ v3 4/7] doc: Add Battery Provider API doc
From:   Bastien Nocera <hadess@hadess.net>
To:     Sonny Sasaka <sonnysasaka@chromium.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        Miao-chen Chou <mcchou@chromium.org>
Date:   Fri, 27 Nov 2020 13:31:47 +0100
In-Reply-To: <CAO271m=Bsz8NXtHzjAn5iYxMs0hxd17DW9QCUnXZACywTDVcvg@mail.gmail.com>
References: <20201120205728.339325-1-sonnysasaka@chromium.org>
         <20201120205728.339325-4-sonnysasaka@chromium.org>
         <CABBYNZLsGs5KDC8kGY4ahfA1Bmdhz1XaR9kNRBKNxN7dTZoFHw@mail.gmail.com>
         <CAO271m=Bsz8NXtHzjAn5iYxMs0hxd17DW9QCUnXZACywTDVcvg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Tue, 2020-11-24 at 13:29 -0800, Sonny Sasaka wrote:
> 
> We need a convention to match the exposed object by the battery
> provider and BlueZ's device. I am suggesting that the simplest
> convention is to use the same path of the BlueZ's device object,
> which
> is easy to follow and implement by providers. Otherwise, we would
> still need another convention to match them, but I think any other
> convention is likely more complex to implement by battery providers.
> Can you suggest an alternative convention to match the battery and
> the
> device?

You should match on the interface being available, not the object
path. 

UPower does that, it just watches for ObjectManager signals, and checks
whether the expected interface is available when a new object appears:
https://gitlab.freedesktop.org/upower/upower/-/blob/master/src/linux/up-backend.c#L314-357

There's no reason to care about the object path.

