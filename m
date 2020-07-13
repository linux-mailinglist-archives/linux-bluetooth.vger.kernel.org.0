Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1D1421DE21
	for <lists+linux-bluetooth@lfdr.de>; Mon, 13 Jul 2020 19:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729869AbgGMRDD (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 13 Jul 2020 13:03:03 -0400
Received: from fgw22-4.mail.saunalahti.fi ([62.142.5.109]:60056 "EHLO
        fgw22-4.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729751AbgGMRDD (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 13 Jul 2020 13:03:03 -0400
X-Greylist: delayed 962 seconds by postgrey-1.27 at vger.kernel.org; Mon, 13 Jul 2020 13:03:01 EDT
Received: from ydin.reaktio.net (reaktio.net [85.76.255.15])
        by fgw22.mail.saunalahti.fi (Halon) with ESMTP
        id 7720d933-c528-11ea-88ca-005056bdf889;
        Mon, 13 Jul 2020 19:46:58 +0300 (EEST)
Received: by ydin.reaktio.net (Postfix, from userid 1001)
        id 94B1336C0F6; Mon, 13 Jul 2020 19:46:57 +0300 (EEST)
Date:   Mon, 13 Jul 2020 19:46:57 +0300
From:   Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
        Ujjwal Sharma <ryzokuken@igalia.com>,
        Andrew Fuller <mactalla.obair@gmail.com>,
        Aleksandar Kostadinov <akostadi@redhat.com>,
        David Heidelberg <david@ixit.cz>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>, usharma@chromium.org
Subject: Re: Bluetooth: Allow to use configure SCO socket codec parameters
Message-ID: <20200713164657.GD12041@reaktio.net>
References: <177c5794-1cd7-8f76-b66f-e9473ed37a31@redhat.com>
 <CAB5wbS97WQTduY9sKgiLjAnpsmka+9hGQOBDdbAEHgkcwnze1w@mail.gmail.com>
 <CABBYNZ+TQ+oSYgL1wGsC0rs9faecd0RtQkFE9fbnV89D1r=LOg@mail.gmail.com>
 <20200516075340.3z37ejs3fuhctunl@pali>
 <CABBYNZLWsYHeOo3_+hcq4r+gY_0sLBQhftW7My7Y4D1n9o5jxg@mail.gmail.com>
 <20200518165011.jfarrp5mtqoy3mqz@pali>
 <6da08b42-34d5-9d20-bfc1-161cc8d0f2ea@igalia.com>
 <CABBYNZ+myxfFmobLuzGeYfP_G5tM_ptKgCQCmpQCiUkPZYemuQ@mail.gmail.com>
 <aff611bb-4b38-7614-ce61-fc3e7c012615@igalia.com>
 <20200604204343.eor47oe3fbzf6rbv@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200604204343.eor47oe3fbzf6rbv@pali>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello Luiz,

On Thu, Jun 04, 2020 at 10:43:43PM +0200, Pali Roh�r wrote:
> On Wednesday 27 May 2020 21:54:18 Ujjwal Sharma wrote:
> > Hi Luiz!
> > 
> > Thanks for your response.
> > 
> > On 5/27/20 9:18 PM, Luiz Augusto von Dentz wrote:
> > > Hi Ujjwal,
> > > ...
> > > Testing is one thing but for production we would need a qualifyable
> > > solution, that said I wouldn't oppose to have the socket option behind
> > > a module options (runtime) or Kconfig (build-time) so people willing
> > > to run this code can do on their own.
> > 
> > 1. What do you think is lacking in this solution that would make it
> > qualifyable for production? I believe there are multiple people in this
> > thread including Pali who are willing to put in the extra effort.
> > 
> > 2. I'd be happy with a runtime option which would allow me to test this
> > as well.
> 
> Have I missed something? setsockopt() solution which I described in
> <20200419234937.4zozkqgpt557m3o6@pali> email is already runtime option.
>

Luiz: Please comment here.. what's missing from these patches? How can we get these merged?

Pulseaudio support is pending this kernel support/patches..


Thanks a lot,

-- Pasi

