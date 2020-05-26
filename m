Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1554E1D7EDF
	for <lists+linux-bluetooth@lfdr.de>; Mon, 18 May 2020 18:44:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728487AbgERQoJ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 18 May 2020 12:44:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgERQoI (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 18 May 2020 12:44:08 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A31B7C061A0C
        for <linux-bluetooth@vger.kernel.org>; Mon, 18 May 2020 09:44:08 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id o24so9581426oic.0
        for <linux-bluetooth@vger.kernel.org>; Mon, 18 May 2020 09:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=x9TZ5GTrRnh9VZ5sfAYrIDFieqNUTw75b4mjTe4SCqA=;
        b=tCCqkGtZT6/Xik85plV0loZ5molh5dykMrBGCi3kQkAO9EVqx3SYykllWHVCSYnY6F
         22UOW0G+rBdyEb+sTxgzvhtU17hfZbiXg6Jcslm5IydynNbPIAK/AxwLnqgd8iRobojq
         Dm3TTb7Shy1Qmx5/8C7Ud/Fek+aDYRH/sAKEMB5yrYZNDKhNFvWZchjMtV0CZsUUf4s1
         ZobZgtmJq4VS7bmevbTsU9kHSJGo9CTyxeKO1c09X9mkUi43ANhH79kto402oWOLY54c
         icCt9+23+JYRHDw+0M5xsaNSOmfHV2KjP1fKEHzD9cclI4kjQqEQcJ1Wc32LTYQgCgvW
         OKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=x9TZ5GTrRnh9VZ5sfAYrIDFieqNUTw75b4mjTe4SCqA=;
        b=JnBHVeQfF3oASAioiG+fXeqdlnvrffbewSDRDK5NuBu38l+eOThq7l/TZBnE027Nmv
         LKJiAWamj0m1ASqgs7D6KIgc7IslKJI4sFEwhoXj9qr3uNJpiH43S14a0Y6zE4pVK7gq
         +QsnqOpEJVT80yEAV+OnOhtByYeyctCIfxZ1tuoKnXAMVv9Z2vtKZeVtJtFVnxWfu2Tt
         yAZ/lK8Na7YcWQO4B+qsi17jwIbQjz5Bd2bdyyYHlwUcWWG7+bqi+abuNHOejNU430YF
         jeuBFhkSHVlzyfUsHwEX4oaWrrG5wBybYat5QrBFzn6lL52U2K6ZnOd1OUUplTR6riK2
         uonA==
X-Gm-Message-State: AOAM5334cxxyEnhFyCGzq+k0HQNLJYrMtCCPzszJ2bkr3B2IxhBDFNAo
        AC9kJ5T9oWqMvwiKPk3Z+Ktki9zkFcZtlRJ6v4A=
X-Google-Smtp-Source: ABdhPJzUo+3B7Pjg3B9ikcVE3aGF+S7irIVowYcSkudHYUOs3uAWcTnZnRHvUEjnUWtTz/HFVmF2TY/F6x0PUWviaXQ=
X-Received: by 2002:aca:1b1a:: with SMTP id b26mr193047oib.82.1589820247851;
 Mon, 18 May 2020 09:44:07 -0700 (PDT)
MIME-Version: 1.0
References: <B6A143FD-717D-44F9-B62F-17CF357961A1@holtmann.org>
 <20200219120940.1509224-1-david@ixit.cz> <20200419234937.4zozkqgpt557m3o6@pali>
 <177c5794-1cd7-8f76-b66f-e9473ed37a31@redhat.com> <CAB5wbS97WQTduY9sKgiLjAnpsmka+9hGQOBDdbAEHgkcwnze1w@mail.gmail.com>
 <CABBYNZ+TQ+oSYgL1wGsC0rs9faecd0RtQkFE9fbnV89D1r=LOg@mail.gmail.com> <20200516075340.3z37ejs3fuhctunl@pali>
In-Reply-To: <20200516075340.3z37ejs3fuhctunl@pali>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Mon, 18 May 2020 09:43:55 -0700
Message-ID: <CABBYNZLWsYHeOo3_+hcq4r+gY_0sLBQhftW7My7Y4D1n9o5jxg@mail.gmail.com>
Subject: Re: Bluetooth: Allow to use configure SCO socket codec parameters
To:     =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc:     Andrew Fuller <mactalla.obair@gmail.com>,
        Aleksandar Kostadinov <akostadi@redhat.com>,
        David Heidelberg <david@ixit.cz>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Pali,

On Sat, May 16, 2020 at 12:53 AM Pali Roh=C3=A1r <pali@kernel.org> wrote:
>
> On Friday 15 May 2020 16:08:45 Luiz Augusto von Dentz wrote:
> > Hi Andrew, Aleksandar,
> >
> > On Fri, May 15, 2020 at 3:46 PM Andrew Fuller <mactalla.obair@gmail.com=
> wrote:
> > >
> > > On Thu, 14 May 2020 at 13:09, Aleksandar Kostadinov <akostadi@redhat.=
com> wrote:
> > > >
> > > > Pali Roh=C3=A1r wrote on 20.04.20 =D0=B3. 2:49 =D1=87.:
> > > > <...>
> > > > > Please let me know what do you think about it. Thanks
> > > >
> > > > <...>
> > > > Thus I and I assume all headphones users will appreciate very much =
any
> > > > support to get things moving forward.
> > >
> > > To add to what Aleksandar said, a number of us would be more than
> > > willing to help out in any way we can.  Certainly myself, but I expec=
t
> > > a number of others, too.  We have bluetooth cards in our computers
> > > with wideband speech support.  We have bluetooth headsets with
> > > wideband speech support.  Many of the links in the chain are in place=
.
> > > If we can continue building that chain then we can have a higher
> > > quality experience in this era of teleconferencing in particular.
> > >
> > > So if there's anything we can lend a hand with, then please let us
> > > know and we can see this through.
> >
> > Just to be clear here, WBS is already supported what is not supported
> > is hardware based codecs,
>
> Luiz, this is not truth. What is not supported are also custom
> parameters and custom codecs; including hardware mSBC support.
>
> Last year I started this thread because kernel blocks usage of
> AuriStream codec in any form (software or hardware).
>
> And AuriStream is supported by many bluetooth headsets and should have
> better quality than CVSD codec.

You are still talking about hardware codec not WBS which is a HFP
feature, without a proper HFP implementation it is not even possible
to select AuriStream so it beats me why you want to bring that up.

> > we spend a lot of time enabling WBS on oFono
> > but it looks like people are now trying to come with their own
> > solutions and complaining about lack of WBS is not really justified
> > since the combination of BlueZ + oFono has been in use by the car
> > industry for years but desktop folks has not been interested in a
> > proper HFP solution so instead we have modem manager, network manager,
> > etc, which doesn't even cover all desktop use cases properly as you
> > are experience first hand here.
>
> Apparently all people who are periodically writing me private emails are
> not interested in car industry, but are ordinary desktop / laptop users
> and ofono is not ready for these use cases and are not going to fix it.
> I guess that Aleksander and Andrew too are desktop / laptop users and
> not from car industry.

Once you written and qualified your own HFP implementation we can
start talking about integrating it for desktop / laptop use, otherwise
the _only_ real option here is oFono, whether that requires a modem or
not is a different history, something that perhaps we should take on
to oFono to enable VoIP application to act as modems but that needs to
be discussed with oFono community.

--=20
Luiz Augusto von Dentz
