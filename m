Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44E342B727E
	for <lists+linux-bluetooth@lfdr.de>; Wed, 18 Nov 2020 00:35:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727665AbgKQXdY (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 17 Nov 2020 18:33:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbgKQXdX (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 17 Nov 2020 18:33:23 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1811FC0613CF
        for <linux-bluetooth@vger.kernel.org>; Tue, 17 Nov 2020 15:33:22 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id l36so21250059ota.4
        for <linux-bluetooth@vger.kernel.org>; Tue, 17 Nov 2020 15:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=towJVI58Fjwl7UW5ZaEbi/B+g4nldF9jp4KiDNZAB+A=;
        b=WoaangG2k2E0FhCjYF8ioVPegheyk0yc7uXUbzWmYqfWr/8gz7fBa1GWFUQl0CslXm
         24mcXzzkNvO9zT53Z2M0Nrf+/z8e/R1GBWqPFxaBU9HEDWTSLbUTENoxD4PsmbGMxXwd
         r6FlJ2o5WKN4lR4JqsuzKGInm5cJxDZ8TZw9UGgJUFWGFmrI5HIP5s3Z12ZJLNMXuEyM
         F8OQ7QqDOs9C3uz0LjdX6kt7H5rlVx3IB18oNRsX4fqNgcuxaI/+P1dqRP02CXuX0MGG
         3W3vHCL9TWYw/EGEhwOKtGZQ9oon/I3d4qSQsKziUFyIRocZZJGmsVk0EuEnT0/La9pA
         9dpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=towJVI58Fjwl7UW5ZaEbi/B+g4nldF9jp4KiDNZAB+A=;
        b=LFSMm2k0+AN5V0i88EaUkgA6GzWB404Q1B2cRLgkf8fJ1bBLNywQbhkGpvGvhmOKaA
         egSVEa9kqwWMFIlcNkNywlZRRDD01yTYw0DmjfdbGmQ8cBfrMM2kYsGC5ypbq0S7bdc/
         uXw7vAhwBb3ZHrPCCSzBK/g/tcVwSLz2gN8sXQikz8/VR7qtPX4hxnuFLwMQZgOKA1oZ
         H4gWQ3pAVHcB7uHtK+VlpbtnQxLjAhWDbgbB6wg/SWB0a8J8cuPHL9A2X5yOHRBPhYDf
         ver4ETvapclNICFgfBApRdZWbgTLS8fxDdYFTWNIO3C7irViF0WZYR/pF1Suw+wrG877
         tfDQ==
X-Gm-Message-State: AOAM533IxyFDbbGO1bkbNgaCTvYGjZsviL6dCADTPAB3xdbOzLcKFDjn
        BYxpgZV+flcPolNPOx1QBRdPDXIrC0iQxePgkqw=
X-Google-Smtp-Source: ABdhPJxaUk6q1R364uQ8xz8uJVuae0YvzGM+amIlcVWeMWx4mEJwiFd3TRWVQHvvU5RepT1uVXrxBtEJE57EIseHab0=
X-Received: by 2002:a9d:4b81:: with SMTP id k1mr4863202otf.371.1605656001323;
 Tue, 17 Nov 2020 15:33:21 -0800 (PST)
MIME-Version: 1.0
References: <20201111011745.2016-1-sonnysasaka@chromium.org>
 <20201111011745.2016-4-sonnysasaka@chromium.org> <CABBYNZJkyOBT63aAYEc4CtCJtqaQEW3bLyyrJ=XJQ_EpeDDmuQ@mail.gmail.com>
 <CAO271mkHCaQ0f+3PKjmnoAqszk1XuUFi_gF5rO9GvsgmqOOiVQ@mail.gmail.com>
 <CABBYNZKebbsGiQueqcE5svRbFON8hgL9wqTqtMFa9m=u+TsO4w@mail.gmail.com> <CAO271m=CrnNwfWRg5NKUjTMyw-tHiw1xjHZDgzX9cUfJ9zWyHA@mail.gmail.com>
In-Reply-To: <CAO271m=CrnNwfWRg5NKUjTMyw-tHiw1xjHZDgzX9cUfJ9zWyHA@mail.gmail.com>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Tue, 17 Nov 2020 15:33:10 -0800
Message-ID: <CABBYNZJ3fwUVusqq2gqeOFu3u+ZD-OQaWdrUHMM1Z7PtgY5jvQ@mail.gmail.com>
Subject: Re: [PATCH BlueZ v2 4/7] doc: Add Battery Provider API doc
To:     Sonny Sasaka <sonnysasaka@chromium.org>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        Miao-chen Chou <mcchou@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Sonny,

On Tue, Nov 17, 2020 at 3:17 PM Sonny Sasaka <sonnysasaka@chromium.org> wrote:
>
> Hi Luiz,
>
> On Tue, Nov 17, 2020 at 3:01 PM Luiz Augusto von Dentz
> <luiz.dentz@gmail.com> wrote:
> >
> > Hi Sonny,
> >
> > On Tue, Nov 17, 2020 at 2:37 PM Sonny Sasaka <sonnysasaka@chromium.org> wrote:
> > >
> > > Hi Luiz,
> > >
> > > Thanks for the feedback. Please find my responses below.
> > >
> > > On Mon, Nov 16, 2020 at 4:17 PM Luiz Augusto von Dentz
> > > <luiz.dentz@gmail.com> wrote:
> > > >
> > > > Hi Sonny,
> > > >
> > > > On Tue, Nov 10, 2020 at 5:22 PM Sonny Sasaka <sonnysasaka@chromium.org> wrote:
> > > > >
> > > > > This patch add the documentation of the Battery Provider which lets
> > > > > external clients feed battery information to BlueZ if they are able to
> > > > > decode battery reporting via any profile. BlueZ UI clients can then use
> > > > > the org.bluez.Battery1 API as a single source of battery information
> > > > > coming from many different profiles.
> > > > >
> > > > > Reviewed-by: Miao-chen Chou <mcchou@chromium.org>
> > > > >
> > > > > ---
> > > > >  doc/battery-api.txt | 55 +++++++++++++++++++++++++++++++++++++++++++++
> > > > >  1 file changed, 55 insertions(+)
> > > > >
> > > > > diff --git a/doc/battery-api.txt b/doc/battery-api.txt
> > > > > index dc7dbeda2..058bf0c6e 100644
> > > > > --- a/doc/battery-api.txt
> > > > > +++ b/doc/battery-api.txt
> > > > > @@ -12,3 +12,58 @@ Object path  [variable prefix]/{hci0,hci1,...}/dev_XX_XX_XX_XX_XX_XX
> > > > >  Properties     byte Percentage [readonly]
> > > > >
> > > > >                         The percentage of battery left as an unsigned 8-bit integer.
> > > > > +
> > > > > +               string Source [readonly, optional, experimental]
> > > > > +
> > > > > +                       Describes where the battery information comes from
> > > > > +                       (e.g. "HFP 1.7", "HID").
> > > > > +                       This property is informational only and may be useful
> > > > > +                       for debugging purposes.
> > > >
> > > > We should probably tight this to UUID instead.
> > > Ack. Will update the doc to suggest UUID in this source field.
> > >
> > > >
> > > > > +
> > > > > +
> > > > > +Battery Provider Manager hierarchy
> > > > > +==================================
> > > > > +A battery provider starts by registering itself as a battery provider with the
> > > > > +RegisterBatteryProvider method passing an object path as the provider ID. Then,
> > > > > +it can start exposing org.bluez.BatteryProvider1 objects having the path
> > > > > +starting with the given provider ID. It can also remove objects at any time.
> > > > > +BlueZ will stop monitoring these exposed and removed objects after
> > > > > +UnregisterBatteryProvider is called for that provider ID.
> > > > > +
> > > > > +Service                org.bluez
> > > > > +Interface      org.bluez.BatteryProviderManager1 [experimental]
> > > > > +Object path    /org/bluez/{hci0,hci1,...}
> > > > > +
> > > > > +Methods                void RegisterBatteryProvider(object provider)
> > > > > +
> > > > > +                       This registers a battery provider. A registered
> > > > > +                       battery provider can then expose objects with
> > > > > +                       org.bluez.BatteryProvider1 interface described below.
> > > > > +
> > > > > +               void UnregisterBatteryProvider(object provider)
> > > > > +
> > > > > +                       This unregisters a battery provider. After
> > > > > +                       unregistration, the BatteryProvider1 objects provided
> > > > > +                       by this client are ignored by BlueZ.
> > > >
> > > > Not sure if you were followinging the monitor patches, for registering
> > > > objects we do prefer the ObjectManager style so multiple provider can
> > > > be registered at once, also we may want to tight the control of
> > > > battery provider with Profile API so we guarantee that the same entity
> > > > that handles the profile connection is the one providing the battery
> > > > status.
> > > It is actually already in ObjectManager style. After the "root path"
> > > is registered, the provider can expose many D-Bus objects at once and
> > > bluetoothd can detect it.
> > > About tying it with the Profile API, I will take a look at how it could be done.
> > >
> > > >
> > > > > +
> > > > > +
> > > > > +Battery Provider hierarchy
> > > > > +==========================
> > > > > +
> > > > > +Service                <client D-Bus address>
> > > > > +Interface      org.bluez.BatteryProvider1 [experimental]
> > > > > +Object path    {provider_root}/org/bluez/{hci0,hci1,...}/dev_XX_XX_XX_XX_XX_XX
> > > > > +
> > > > > +Properties     byte Percentage [readonly]
> > > > > +
> > > > > +                       The percentage of battery left as an unsigned 8-bit
> > > > > +                       integer.
> > > > > +
> > > > > +               string Source [readonly, optional]
> > > > > +
> > > > > +                       Describes where the battery information comes from
> > > > > +                       (e.g. "HFP 1.7", "HID").
> > > > > +                       This property is informational only and may be useful
> > > > > +                       for debugging purposes. The content of this property is
> > > > > +                       a free string, but it is recommended to include the
> > > > > +                       profile name and version to be useful.
> > > > > --
> > > > > 2.26.2
> > > >
> > > > Perhaps we should make this use the same interface as we use for the
> > > > daemon itself (Battery1) and the Source there as well. Last but not
> > > > least, have you explored the idea of exporting the battery status over
> > > > uHID? If I got this right this would aggregate the status of different
> > > > sources and then make the daemon expose them, which while it works for
> > > > now it means that upper layer have different interfaces for handling a
> > > > battery status of something plugged over USB and over Bluetooth.
> > > I am okay with naming the interface Battery1, the same as the daemon.
> > > Will make an update.
> > > About the exporting battery status via UHID, it is possible to be
> > > done, but it is an orthogonal problem that we plan to tackle
> > > separately. Right now, this API is general enough for Chrome OS to
> > > allow both HFP and HID batteries to be consolidated in BlueZ. Chrome
> > > OS's powerd feeds only Bluetooth battery levels from
> > > /sys/class/power_supply and filters out USB devices so the UI layer
> > > does not need to worry about it: everything from BlueZ is tied to a
> > > Bluetooth device.
> >
> > But how about devices pushing their battery status over HID reports
> > instead of GATT? Afaik this is possible since the HID device may have
> > support for USB (wired) as well where it exposes its battery status
> > over HID it may just choose to continue doing so while connected over
> > Bluetooth.
> If the Bluetooth device reports battery status via HID, it will go
> into sys/class/power_supply. In Chrome OS, powerd sends this back to
> BlueZ because it knows the Bluetooth device address from
> /sys/class/power_supply/ file name.

Well that is something Id like to avoid since if we do in the future
create an HID report this sort of logic could cause duplications as it
either the daemon or the kernel may start parsing these so we will
need some way to identify each source (perhaps by UUID) to avoid
duplications. Also having differences in upower and powerd really
doesn't help us unifying the handling here, I hope at least for
Bluetooth we end up with something similar when either daemons are
used, otherwise we may need plugins for each separately.

> >
> > > >
> > > >
> > > > --
> > > > Luiz Augusto von Dentz
> >
> >
> >
> > --
> > Luiz Augusto von Dentz



-- 
Luiz Augusto von Dentz
