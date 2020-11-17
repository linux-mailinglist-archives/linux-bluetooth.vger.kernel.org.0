Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9251B2B7209
	for <lists+linux-bluetooth@lfdr.de>; Wed, 18 Nov 2020 00:19:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgKQXRI (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 17 Nov 2020 18:17:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbgKQXRH (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 17 Nov 2020 18:17:07 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C36CDC0617A6
        for <linux-bluetooth@vger.kernel.org>; Tue, 17 Nov 2020 15:17:05 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id a16so69318ejj.5
        for <linux-bluetooth@vger.kernel.org>; Tue, 17 Nov 2020 15:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qqxZJ9JssL3zC2gnstOf4sOOpXC/m0c5v7GIjmwryvE=;
        b=I92fa5LS0Ws46zb7mB1yDUzPLtViXV2i1q4Ojn4iEDiBXRI5Yl0/RgtpTOkrz9TiOl
         pMLiJGPfGSI7JvwPp3whsi+KJ6rBsOKaXuc0kURlJFjlw+gzSVN/mm4Zffk0etrFBhQv
         WbcO0DjWJr2kP5b/G91ZAQEKYLO9eWbKL4ZgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qqxZJ9JssL3zC2gnstOf4sOOpXC/m0c5v7GIjmwryvE=;
        b=hLGXDM+6fwMrKC8n3Dem3HWH69zrElrz4GavMov9j7pkslqo3BDpwwrUVDLRx3mE3m
         iFfG0J06O1tG3iu5dBEa7NEIpHYXAl55GzbLFsYyLeIJBj0ItD6iZhlwgdpQt4R2w8yV
         PLAncD3lSYMdRZb+NfBUpRz83TQosPNDVnkbEj0ZikuxYXRmYRiALi6h1wFYINgef/X6
         co0s7gqPrgfQ93vqcyB4umhaYUq/bxQVbT+JWitENNE7KCidgPpJ/JoCwyHSQ00vInTg
         lMs0CrIzAMYu2Kb+GSSp1H+tySsHaZMiFh1kKnK8cNuzZBjjW+rukyzH3wt2vAZlWSBU
         Xgtg==
X-Gm-Message-State: AOAM531ZK7Y4G29hsKp5oN89XtRfnZp2CZ5KuXkn5vzDVbYohUr5sxNE
        XYcUGB7fshXc9770vrSC7eaFeKvzfMhddg==
X-Google-Smtp-Source: ABdhPJy9PjEzVVjQ/xQruYAp3Wx+V3UplSLo/oVncnKfGD38DmGjnB8ZIHGo6hLpCNM1RvY/LpjgDQ==
X-Received: by 2002:a17:906:8541:: with SMTP id h1mr3802324ejy.445.1605655024042;
        Tue, 17 Nov 2020 15:17:04 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id w18sm12469252edq.43.2020.11.17.15.17.02
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2020 15:17:03 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id a65so389379wme.1
        for <linux-bluetooth@vger.kernel.org>; Tue, 17 Nov 2020 15:17:02 -0800 (PST)
X-Received: by 2002:a1c:e4d4:: with SMTP id b203mr1279792wmh.141.1605655022430;
 Tue, 17 Nov 2020 15:17:02 -0800 (PST)
MIME-Version: 1.0
References: <20201111011745.2016-1-sonnysasaka@chromium.org>
 <20201111011745.2016-4-sonnysasaka@chromium.org> <CABBYNZJkyOBT63aAYEc4CtCJtqaQEW3bLyyrJ=XJQ_EpeDDmuQ@mail.gmail.com>
 <CAO271mkHCaQ0f+3PKjmnoAqszk1XuUFi_gF5rO9GvsgmqOOiVQ@mail.gmail.com> <CABBYNZKebbsGiQueqcE5svRbFON8hgL9wqTqtMFa9m=u+TsO4w@mail.gmail.com>
In-Reply-To: <CABBYNZKebbsGiQueqcE5svRbFON8hgL9wqTqtMFa9m=u+TsO4w@mail.gmail.com>
From:   Sonny Sasaka <sonnysasaka@chromium.org>
Date:   Tue, 17 Nov 2020 15:16:50 -0800
X-Gmail-Original-Message-ID: <CAO271m=CrnNwfWRg5NKUjTMyw-tHiw1xjHZDgzX9cUfJ9zWyHA@mail.gmail.com>
Message-ID: <CAO271m=CrnNwfWRg5NKUjTMyw-tHiw1xjHZDgzX9cUfJ9zWyHA@mail.gmail.com>
Subject: Re: [PATCH BlueZ v2 4/7] doc: Add Battery Provider API doc
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        Miao-chen Chou <mcchou@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

On Tue, Nov 17, 2020 at 3:01 PM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Sonny,
>
> On Tue, Nov 17, 2020 at 2:37 PM Sonny Sasaka <sonnysasaka@chromium.org> wrote:
> >
> > Hi Luiz,
> >
> > Thanks for the feedback. Please find my responses below.
> >
> > On Mon, Nov 16, 2020 at 4:17 PM Luiz Augusto von Dentz
> > <luiz.dentz@gmail.com> wrote:
> > >
> > > Hi Sonny,
> > >
> > > On Tue, Nov 10, 2020 at 5:22 PM Sonny Sasaka <sonnysasaka@chromium.org> wrote:
> > > >
> > > > This patch add the documentation of the Battery Provider which lets
> > > > external clients feed battery information to BlueZ if they are able to
> > > > decode battery reporting via any profile. BlueZ UI clients can then use
> > > > the org.bluez.Battery1 API as a single source of battery information
> > > > coming from many different profiles.
> > > >
> > > > Reviewed-by: Miao-chen Chou <mcchou@chromium.org>
> > > >
> > > > ---
> > > >  doc/battery-api.txt | 55 +++++++++++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 55 insertions(+)
> > > >
> > > > diff --git a/doc/battery-api.txt b/doc/battery-api.txt
> > > > index dc7dbeda2..058bf0c6e 100644
> > > > --- a/doc/battery-api.txt
> > > > +++ b/doc/battery-api.txt
> > > > @@ -12,3 +12,58 @@ Object path  [variable prefix]/{hci0,hci1,...}/dev_XX_XX_XX_XX_XX_XX
> > > >  Properties     byte Percentage [readonly]
> > > >
> > > >                         The percentage of battery left as an unsigned 8-bit integer.
> > > > +
> > > > +               string Source [readonly, optional, experimental]
> > > > +
> > > > +                       Describes where the battery information comes from
> > > > +                       (e.g. "HFP 1.7", "HID").
> > > > +                       This property is informational only and may be useful
> > > > +                       for debugging purposes.
> > >
> > > We should probably tight this to UUID instead.
> > Ack. Will update the doc to suggest UUID in this source field.
> >
> > >
> > > > +
> > > > +
> > > > +Battery Provider Manager hierarchy
> > > > +==================================
> > > > +A battery provider starts by registering itself as a battery provider with the
> > > > +RegisterBatteryProvider method passing an object path as the provider ID. Then,
> > > > +it can start exposing org.bluez.BatteryProvider1 objects having the path
> > > > +starting with the given provider ID. It can also remove objects at any time.
> > > > +BlueZ will stop monitoring these exposed and removed objects after
> > > > +UnregisterBatteryProvider is called for that provider ID.
> > > > +
> > > > +Service                org.bluez
> > > > +Interface      org.bluez.BatteryProviderManager1 [experimental]
> > > > +Object path    /org/bluez/{hci0,hci1,...}
> > > > +
> > > > +Methods                void RegisterBatteryProvider(object provider)
> > > > +
> > > > +                       This registers a battery provider. A registered
> > > > +                       battery provider can then expose objects with
> > > > +                       org.bluez.BatteryProvider1 interface described below.
> > > > +
> > > > +               void UnregisterBatteryProvider(object provider)
> > > > +
> > > > +                       This unregisters a battery provider. After
> > > > +                       unregistration, the BatteryProvider1 objects provided
> > > > +                       by this client are ignored by BlueZ.
> > >
> > > Not sure if you were followinging the monitor patches, for registering
> > > objects we do prefer the ObjectManager style so multiple provider can
> > > be registered at once, also we may want to tight the control of
> > > battery provider with Profile API so we guarantee that the same entity
> > > that handles the profile connection is the one providing the battery
> > > status.
> > It is actually already in ObjectManager style. After the "root path"
> > is registered, the provider can expose many D-Bus objects at once and
> > bluetoothd can detect it.
> > About tying it with the Profile API, I will take a look at how it could be done.
> >
> > >
> > > > +
> > > > +
> > > > +Battery Provider hierarchy
> > > > +==========================
> > > > +
> > > > +Service                <client D-Bus address>
> > > > +Interface      org.bluez.BatteryProvider1 [experimental]
> > > > +Object path    {provider_root}/org/bluez/{hci0,hci1,...}/dev_XX_XX_XX_XX_XX_XX
> > > > +
> > > > +Properties     byte Percentage [readonly]
> > > > +
> > > > +                       The percentage of battery left as an unsigned 8-bit
> > > > +                       integer.
> > > > +
> > > > +               string Source [readonly, optional]
> > > > +
> > > > +                       Describes where the battery information comes from
> > > > +                       (e.g. "HFP 1.7", "HID").
> > > > +                       This property is informational only and may be useful
> > > > +                       for debugging purposes. The content of this property is
> > > > +                       a free string, but it is recommended to include the
> > > > +                       profile name and version to be useful.
> > > > --
> > > > 2.26.2
> > >
> > > Perhaps we should make this use the same interface as we use for the
> > > daemon itself (Battery1) and the Source there as well. Last but not
> > > least, have you explored the idea of exporting the battery status over
> > > uHID? If I got this right this would aggregate the status of different
> > > sources and then make the daemon expose them, which while it works for
> > > now it means that upper layer have different interfaces for handling a
> > > battery status of something plugged over USB and over Bluetooth.
> > I am okay with naming the interface Battery1, the same as the daemon.
> > Will make an update.
> > About the exporting battery status via UHID, it is possible to be
> > done, but it is an orthogonal problem that we plan to tackle
> > separately. Right now, this API is general enough for Chrome OS to
> > allow both HFP and HID batteries to be consolidated in BlueZ. Chrome
> > OS's powerd feeds only Bluetooth battery levels from
> > /sys/class/power_supply and filters out USB devices so the UI layer
> > does not need to worry about it: everything from BlueZ is tied to a
> > Bluetooth device.
>
> But how about devices pushing their battery status over HID reports
> instead of GATT? Afaik this is possible since the HID device may have
> support for USB (wired) as well where it exposes its battery status
> over HID it may just choose to continue doing so while connected over
> Bluetooth.
If the Bluetooth device reports battery status via HID, it will go
into sys/class/power_supply. In Chrome OS, powerd sends this back to
BlueZ because it knows the Bluetooth device address from
/sys/class/power_supply/ file name. This way the UI can get the
battery value from BlueZ since it's tied to a Bluetooth device. In
most Linux desktops, upower already exposes /sys/class/power_supply to
the UI directly so it's fine also.
>
> > >
> > >
> > > --
> > > Luiz Augusto von Dentz
>
>
>
> --
> Luiz Augusto von Dentz
