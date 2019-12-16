Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE336121A28
	for <lists+linux-bluetooth@lfdr.de>; Mon, 16 Dec 2019 20:42:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726556AbfLPTmi (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 16 Dec 2019 14:42:38 -0500
Received: from vps.xff.cz ([195.181.215.36]:52702 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726191AbfLPTmi (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 16 Dec 2019 14:42:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1576525356; bh=qZuiZ+B2txWHdnCJbb77EA33RIGkpS7YWruV8b0DAEk=;
        h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
        b=aZ/B4DgIvLt+4aaqo6PW8tETJ+fycJcGYVVFUxHsx/AfC6OOMRizxH27pDDUP644k
         1cOMqMhNYVyZVh7O6KqMYbLEjdS2oE1NxlNwN2g3xmryP3HkAxAodtUAuc21RA9y6q
         IJvQWn1kZez0vnGypmnYdMqa0kKHKePwCZ/aLZ8Y=
Date:   Mon, 16 Dec 2019 20:42:35 +0100
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     Stefan Wahren <wahrenst@gmx.net>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-bluetooth@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH V4 01/10] bluetooth: hci_bcm: Fix RTS handling during
 startup
Message-ID: <20191216194235.4pq2xpfl7nz3p55w@core.my.home>
Mail-Followup-To: Stefan Wahren <wahrenst@gmx.net>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-bluetooth@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
References: <1570375708-26965-1-git-send-email-wahrenst@gmx.net>
 <1570375708-26965-2-git-send-email-wahrenst@gmx.net>
 <61789264-a4c2-ac85-9d74-d186213ec70a@gmx.net>
 <20191216132509.ofqcdpwxsd7324ql@core.my.home>
 <6f05f4d8-fa84-ae81-ac4f-00ab12fabeea@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6f05f4d8-fa84-ae81-ac4f-00ab12fabeea@gmx.net>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello Stefan,

On Mon, Dec 16, 2019 at 07:28:04PM +0100, Stefan Wahren wrote:
> Hi Ondrej,
> 
> sorry, i don't have access to a Orange Pi 3.
> 
> I looked at a  AP6256 datasheet [1], but i couldn't find any helpful
> information about flow control during power up.
> 
> Are you able to analyze this issue more further before we revert this patch?

I'd like to, but I'll not be able to attach logic probe to the AP6256
module. It's too fine pitch for soldering.

I may try setting CTS/RTS to gpio/input mode and grab the capture of
the GPIO port states in time to see what's happening during probe
of bt_bcm module.

I don't really understand what effect your patch is supposed to have
on the CTS/RTS lines during power up from the commit description.
Can you please explain it more concretely?

I'll be able to get to playing with this after the holidays.

> I would like to know if this is some kind of timing issue, since in
> patch "bluetooth: hci_bcm: Give more time to come out of reset" you
> introduced a huge power on delay.

I wouldn't mind if we could get rid of that.

> Meanwhile i will play with modifications of original patch on the
> Raspberry Pi 4 and come back to you.

thank you,
	o.

> Thanks
> Stefan
> 
> [1] -
> http://www.sparklan.com/p2-products-detail.php?PKey=4984FVukjcpylzifQiM-TGFE-IKXD--BCwf4P15KfrU&AP6256
> 
