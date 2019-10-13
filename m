Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12AE8D558B
	for <lists+linux-bluetooth@lfdr.de>; Sun, 13 Oct 2019 11:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728592AbfJMJuK (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 13 Oct 2019 05:50:10 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:36323 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728311AbfJMJuK (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 13 Oct 2019 05:50:10 -0400
Received: by mail-ot1-f45.google.com with SMTP id 67so11490913oto.3
        for <linux-bluetooth@vger.kernel.org>; Sun, 13 Oct 2019 02:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ndmo2zR4v/VUn2WdJp79EqABseJrfqkeY6BiwjImlSQ=;
        b=rLtzzTHkfm+CcbwbKFKaLGqsLY8N2iU4BCTJZqDm5vU5LyCQubkek06BymIVZXN5tf
         grPx9xYwA0KSrXopqXTebQvt5bBF6StZicxqiIUCaQEwcv+MRI2D61YDYKH7MvG7jzpM
         mHwnG+3fNgCP8M57NJyFM6/DRBN6gzmH5uUrjg3wlbsBQG297AOMszdqXL8sxXyOw1F+
         SnDaKnKjcpMKzV/fBMGM7KG2o8c4CfEtlo0ntm6OSLxJr79ONKCe9Ioxv9AC2qiiMg3E
         x0JTV5IZF6FWbAwaEcqUg87UOdulgcdcvkuqMSubVCoCU4vaYwPaECdfprBrnVaW9zTv
         qv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ndmo2zR4v/VUn2WdJp79EqABseJrfqkeY6BiwjImlSQ=;
        b=OOa7qYiwkWmdHPyRYAp8sTzWZ3fYmQaZTQU19AuLgizGnZ1VR1SeHLjvn9ltnSCTf2
         ZD1mMVutdx1CivJ3ze2EVaFFs7+lraD3ceQ3h8H9t8BpLekT5Y5R15JfXzutQJG6t91U
         zipIcyMHTNnJ4/23lNf3nKnWPRposevgk0zJA1J9MxTG9ia43QGpZe0SlenkWiSS8URb
         MZuqNQAgRwQ9JJWIqzxvXpDVdoR9NFH8CrD3utuMxuFs5gFyS9F9w5fxaljVp65Ao6+P
         eRzQrXxb4xwljx2MWOUvIC+Lz9Q4pVi3TIRZLTgGKLhX0GSY7JZjNpKlUFtuimNiKe0L
         OfxQ==
X-Gm-Message-State: APjAAAXy26cGyYXvoniernbOZQMmutrv8SaLelR5qZ+ObvI408mMxrZZ
        jvo9/e6mH7MTwRAF9LAmDC/4+7hn7qSSkXJU3RiTYsIr
X-Google-Smtp-Source: APXvYqwQj+0+zQyLQVqoJl8IfNAbGGWFTUNly7vGds6uZtHy/JKcKGT8l/BFsK85rBFd81gUXf2hsCxZIIfos5cN4pM=
X-Received: by 2002:a9d:197:: with SMTP id e23mr20669800ote.28.1570960208388;
 Sun, 13 Oct 2019 02:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20191011082723.t6w2jcg7v4erlnq6@pali> <319f751481bbdb5aa012e5fa4daa1d95965b54c3.camel@intel.com>
 <20191011183502.ao45xlyfabpbadxo@pali> <fea0a8efd80c4c444f56d4f3902aeae4f4f9de32.camel@intel.com>
 <64060b6a2bc9aee7b7eef0347ee3bafe3fddd18b.camel@intel.com>
 <20191011200420.hbrutdclfva2uqpv@pali> <CABBYNZL8u2kUnPqiA56DtZyAPZEAUQBaBOC-wuqUQmOW6ZJ=Og@mail.gmail.com>
 <20191013073603.6jnczqr4fk7lpyxq@pali> <CABBYNZJx6ZKfBftJoZ2b0pdUXyuY23kA1OUAsZTA4KHVLwoF3w@mail.gmail.com>
 <20191013093947.cbqczgnt3uo3f5wi@pali>
In-Reply-To: <20191013093947.cbqczgnt3uo3f5wi@pali>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Sun, 13 Oct 2019 12:49:54 +0300
Message-ID: <CABBYNZ+e_3Rjo0RGw1xVKy6rc=dsPjDOWPXSkKuXuoQGT8OxXw@mail.gmail.com>
Subject: Re: Determinate EDR speed
To:     =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc:     "Gix, Brian" <brian.gix@intel.com>,
        "iam@valdikss.org.ru" <iam@valdikss.org.ru>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Pali,

On Sun, Oct 13, 2019 at 12:39 PM Pali Roh=C3=A1r <pali.rohar@gmail.com> wro=
te:
>
> On Sunday 13 October 2019 11:45:58 Luiz Augusto von Dentz wrote:
> > Hi Pali,
> >
> > On Sun, Oct 13, 2019 at 10:36 AM Pali Roh=C3=A1r <pali.rohar@gmail.com>=
 wrote:
> > >
> > > On Saturday 12 October 2019 10:23:58 Luiz Augusto von Dentz wrote:
> > > > Hi Pali,
> > > >
> > > > On Fri, Oct 11, 2019 at 11:07 PM Pali Roh=C3=A1r <pali.rohar@gmail.=
com> wrote:
> > > > >
> > > > > On Friday 11 October 2019 19:05:56 Gix, Brian wrote:
> > > > > > On Fri, 2019-10-11 at 19:00 +0000, Gix, Brian wrote:
> > > > > > > Hi Pali,
> > > > > > >
> > > > > > > On Fri, 2019-10-11 at 20:35 +0200, Pali Roh=C3=A1r wrote:
> > > > > > > > Currently bluez API, method Acquire() already inform called=
 application
> > > > > > > > what is socket MTU for input and output. So from this infor=
mation it is
> > > > > > > > possible to detect if device supports EDR 3 or not.
> > > > > > > >
> > > > > > > > But it is too late to have this information. I need to send=
 SBC
> > > > > > > > parameters to bluez first when doing A2DP negotiation, this=
 is early
> > > > > > > > steps before Acquire() is called.
> > > > > > >
> > > > > > > This seems to be the kind of information which is fixed, for =
the life of the pairing.
> > > > > > >
> > > > > > > What if you assumed the lower speed the first time you connec=
ted, determined the
> > > > > > > speed during the first streaming, and then either immediately=
 renegotiate (caching the identifying
> > > > > > > information
> > > > > > > of the SNK), or just cache the information for future connect=
ions.
> > > > > > >
> > > > > > > Or the reverse, and assume fast, but immediately adjust down =
if you aren't getting what you hoped for.
> > > > > > >
> > > > > > > In any case, this would be a "Device Setup" glitch which you =
could note as a routine part of pairing in the
> > > > > > > documentation.
> > > > > >
> > > > > > Or, Stream "Silence" the first time you connect, in order to de=
termine throughput.  It would add 1-2 seconds to
> > > > > > your connection time perhaps, but would be less noticable to th=
e user.
> > > > >
> > > > > This increase connection time, increase complexity of implementat=
ion
> > > > > (lot of things can fail) and just complicate lot of things there.=
 Plus
> > > > > adds that glitch which is not user friendly.
> > > > >
> > > > > Also bluetooth devices, like headsets, probably do not expects th=
at
> > > > > somebody is going to do such thing and we can hit other implement=
ation
> > > > > problems...
> > > > >
> > > > > And moreover it is just big hack and workaround for that problem.=
 Not a
> > > > > reasonable solution.
> > > > >
> > > > > In btmon I can see it, so kernel already knows that information. =
Why it
> > > > > cannot tell it to userspace and bluetooth daemon to client applic=
ation?
> > > > >
> > > > > Client application (e.g. pulseaudio) should really know if is goi=
ng to
> > > > > talk with bluetooth device with EDR 2 or EDR 3.
> > > > >
> > > > > > >
> > > > > > > > Therefore I'm asking for some way how to get information if=
 device
> > > > > > > > supports EDR 2 or EDR 3. This is basically requirement for =
proper
> > > > > > > > implementation of SBC in high quality mode. So if there are=
 not such API
> > > > > > > > yet, could it be exported from kernel to userspace and blue=
toothd
> > > > > > > > daemon?
> > > > > > > >
> > > > > > > > See these two articles for more details about SBC and its h=
igh quality:
> > > > > > > >
> > > > > > > > https://habr.com/en/post/456182/
> > > > > > > > http://soundexpert.org/articles/-/blogs/audio-quality-of-sb=
c-xq-bluetooth-audio-codec
> > > > > > > >
> > > > > > > > > > Is there any bluez API for it?
> > > > > > > > > >
> > > >
> > > > There quite a few assumption here that are not really how it is
> > > > implemented in BlueZ:
> > > >
> > > > 1. The L2CAP MTU is not based on the ACL link (should be relatively
> > > > easy to change)
> > > > 2. L2CAP MTU is not required to be symmetric.
> > > > 3. Since the ACL link is shared for all channels we shouldn't reall=
y
> > > > assume all throughput will be available
> > > > 4. PA flow control is not just filling up packets and sending them
> > > > when they are full to maximize speed, instead it send packets when
> > > > necessary to maintain a constant speed so the MTU may not be fully
> > > > used, in fact trying to maximize the MTU may result in higher laten=
cy
> > > > since packets would be sent less frequently.
> > > >
> > > > With this in mind I think the only thing we should look into is to
> > > > adjust the default L2CAP MTU to match the underline ACL Link, so it
> > > > maximizes throughput, the remote side may choose a different MTU wh=
ich
> > > > will have to follow though.
> > >
> > > Hi Luiz! The main problem is not MTU size, as I wrote I cannot use it
> > > normally for distinguish for usage of SBC XQ or not. Instead of MTU I
> > > rather need to know if device supports EDR 2 or EDR 3.
> >
> > I was trying to implement this on the kernel to match the MTU size of
> > L2CAP with ACL but the packet type current in use by the connection is
> > not exposed in the connection complete, or at least I couldn't any
> > reference to it, we could possibly expose the packet types via socket
> > option as well but changing it at runtime is probably not a good idea.
>
> Hello, when I run btmon, I see following information very early before
> creating A2DP connection:
>
> HCI Event: Read Remote Supported Features (0x0b) plen 11
>         Status: Success (0x00)
>         Handle: 35
>         Features: 0xff 0xff 0x8f 0xfe 0x9b 0xff 0x59 0x87
>           ...
>           Enhanced Data Rate ACL 2 Mbps mode
>           Enhanced Data Rate ACL 3 Mbps mode
>
> I do not need to change MTU size, I would just like to know EDR features
> capabilities. Cannot be those information exported somehow from kernel?
> I guess that kernel should have these information if it can send it to
> btmon.

That only indicates the remote supports these packet types it doesn't
mean they would be actually in use, which is perhaps the reason 53
bitpool was recommended since going forward than that limits the
packet types the link layer can use. What we could do in practice is
to expose what packet types can be used then you can check if EDR is
supported but you will got to trust the controller link layer will
prioritize the use of them over other packet types.


--=20
Luiz Augusto von Dentz
