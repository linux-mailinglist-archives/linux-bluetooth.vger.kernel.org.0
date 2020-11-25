Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3041C2C362F
	for <lists+linux-bluetooth@lfdr.de>; Wed, 25 Nov 2020 02:20:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727913AbgKYBUy (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 24 Nov 2020 20:20:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727692AbgKYBUy (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 24 Nov 2020 20:20:54 -0500
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E95C4C0613D4
        for <linux-bluetooth@vger.kernel.org>; Tue, 24 Nov 2020 17:20:53 -0800 (PST)
Received: by mail-ed1-x544.google.com with SMTP id d17so43796edq.2
        for <linux-bluetooth@vger.kernel.org>; Tue, 24 Nov 2020 17:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L/Rdk0yma2bzgHMN56uxJpn0cv1FtkE/KGIxIAbRABI=;
        b=RV462q/cqNaSe34Z3c2fD45UIAgRJCzodPZZaXatTLGRQyFTIiEx6E3BmvGQelk9Ay
         TFT/pxPcam5JZnRO2gF7NONqEwvLDkaFDcolN+hd9vQqwtA/Mtb3ZnRqp3M5gD07e7hA
         b3TDbIcioYu/WjWrbzOJz7Be+ADugvkcL1I+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L/Rdk0yma2bzgHMN56uxJpn0cv1FtkE/KGIxIAbRABI=;
        b=RoQprJgrcEQWO3Baft1+9KHqY54HWxygOsVLc2rk2TGRQVEoaEYQs3Sw6CmqPkBYeu
         /i75kScfZwv4yNvtCEe4HozcjgYg+dYMdQKTaFKEVtlBk6R3h/96Gw4MGGvu3oZFzAgN
         8Le6p52o3N3BJK0WJ3x84u9t/PivXQfl1R2KeJwgHzUMgLCSO1tmJGxAch7yz6ObYKkc
         Yx2JcLXpanOY33DnFPOxqwkU4DHZEyWXL+kFqLaTPhg20bwII0eN+tVPKa7G7TUZvBzE
         6kVFyK1Ijz/PGlCNP8SYOv3B+ASxVpXBNeX3lru/sxhpMavHZR1nJiE4VbqmyKupBw1W
         qTsQ==
X-Gm-Message-State: AOAM530lTgqNuzMc5HQOgvs3IIqubtPXb8BU8716LqvWTU20ADWw67l+
        xztb3cUuknYDpG/OjpEEG7YTBWEvNHgv8A==
X-Google-Smtp-Source: ABdhPJw+wmM5Ze3n3gzA0D4Ik4johIw4gYx2X46cW9LlL9tXW3AwX7OgnZvbIPo59HWvOlybaPSi8A==
X-Received: by 2002:aa7:dd0d:: with SMTP id i13mr1292173edv.174.1606267252232;
        Tue, 24 Nov 2020 17:20:52 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id j7sm330107ejk.14.2020.11.24.17.20.51
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 17:20:51 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id a186so620900wme.1
        for <linux-bluetooth@vger.kernel.org>; Tue, 24 Nov 2020 17:20:51 -0800 (PST)
X-Received: by 2002:a1c:6306:: with SMTP id x6mr1132050wmb.154.1606267250864;
 Tue, 24 Nov 2020 17:20:50 -0800 (PST)
MIME-Version: 1.0
References: <20201120205728.339325-1-sonnysasaka@chromium.org>
 <20201120205728.339325-4-sonnysasaka@chromium.org> <CABBYNZLsGs5KDC8kGY4ahfA1Bmdhz1XaR9kNRBKNxN7dTZoFHw@mail.gmail.com>
 <CAO271m=Bsz8NXtHzjAn5iYxMs0hxd17DW9QCUnXZACywTDVcvg@mail.gmail.com> <CABBYNZ+ZtmfNxQRd1Zai__htG=xhg+iz-LZw=ktn3b49PwP1xg@mail.gmail.com>
In-Reply-To: <CABBYNZ+ZtmfNxQRd1Zai__htG=xhg+iz-LZw=ktn3b49PwP1xg@mail.gmail.com>
From:   Sonny Sasaka <sonnysasaka@chromium.org>
Date:   Tue, 24 Nov 2020 17:20:39 -0800
X-Gmail-Original-Message-ID: <CAO271mmNvaFuuG9Sv8EHZ6+giYvom8FfWCmQJvJTUfgmsJ3GjA@mail.gmail.com>
Message-ID: <CAO271mmNvaFuuG9Sv8EHZ6+giYvom8FfWCmQJvJTUfgmsJ3GjA@mail.gmail.com>
Subject: Re: [PATCH BlueZ v3 4/7] doc: Add Battery Provider API doc
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        Miao-chen Chou <mcchou@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

On Tue, Nov 24, 2020 at 4:23 PM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Sonny,
>
> On Tue, Nov 24, 2020 at 1:30 PM Sonny Sasaka <sonnysasaka@chromium.org> wrote:
> >
> > Hi Luiz,
> >
> >
> > On Tue, Nov 24, 2020 at 1:21 PM Luiz Augusto von Dentz
> > <luiz.dentz@gmail.com> wrote:
> > >
> > > Hi Sonny,
> > >
> > > On Fri, Nov 20, 2020 at 1:00 PM Sonny Sasaka <sonnysasaka@chromium.org> wrote:
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
> > > > Changes in v3:
> > > > * Remove doc duplication in BatteryProvider1 and mention that it's the
> > > >   same as Battery1 instead.
> > > > * Suggest profile UUID in Source property.
> > > >
> > > >  doc/battery-api.txt | 49 +++++++++++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 49 insertions(+)
> > > >
> > > > diff --git a/doc/battery-api.txt b/doc/battery-api.txt
> > > > index dc7dbeda2..b5c9a7be1 100644
> > > > --- a/doc/battery-api.txt
> > > > +++ b/doc/battery-api.txt
> > > > @@ -12,3 +12,52 @@ Object path  [variable prefix]/{hci0,hci1,...}/dev_XX_XX_XX_XX_XX_XX
> > > >  Properties     byte Percentage [readonly]
> > > >
> > > >                         The percentage of battery left as an unsigned 8-bit integer.
> > > > +
> > > > +               string Source [readonly, optional, experimental]
> > > > +
> > > > +                       Describes where the battery information comes from
> > > > +                       This property is informational only and may be useful
> > > > +                       for debugging purposes.
> > > > +                       Providers from BatteryProvider1 may make use of this
> > > > +                       property to indicate where the battery report comes from
> > > > +                       (e.g. "HFP 1.7", "HID", or the profile UUID).
> > >
> > > We might need to remove the version number here since there is no
> > > equivalent on UUID, in fact friendly names may be a bad idea after all
> > > since for new profiles we may not have a friendly name to do the
> > > translation and since this is property that would be hard to notify
> > > the provider that we don't understand what is the Source while UUIDs,
> > > if well formatted, should not have this problem so Id just get rid of
> > > the use of friendly names altogether and expect the Source to be a
> > > 128bits UUID in string format.
> > Ack. Will change to 128bit UUID format.
> > >
> > > > +
> > > > +
> > > > +Battery Provider Manager hierarchy
> > > > +==================================
> > > > +A battery provider starts by registering itself as a battery provider with the
> > > > +RegisterBatteryProvider method passing an object path as the provider ID. Then,
> > > > +it can start exposing org.bluez.BatteryProvider1 objects having the path
> > > > +starting with the given provider ID. It can also remove objects at any time.
> > > > +The objects and their properties exposed by battery providers will be reflected
> > > > +on org.bluez.Battery1 interface.
> > > > +
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
> > >
> > > We should probably mention this expects an object implementing
> > > ObjectManaged in order to list the Battery1 provider.
> > Ack. Will add more explanation.
> > >
> > > > +               void UnregisterBatteryProvider(object provider)
> > > > +
> > > > +                       This unregisters a battery provider. After
> > > > +                       unregistration, the BatteryProvider1 objects provided
> > > > +                       by this client are ignored by BlueZ.
> > > > +
> > > > +
> > > > +Battery Provider hierarchy
> > > > +==========================
> > > > +
> > > > +Service                <client D-Bus address>
> > > > +Interface      org.bluez.BatteryProvider1 [experimental]
> > > > +Object path    {provider_root}/org/bluez/{hci0,hci1,...}/dev_XX_XX_XX_XX_XX_XX
> > >
> > > If this is on the client the object path does not necessarily need to
> > > follow our object hierarchy.
> > We need a convention to match the exposed object by the battery
> > provider and BlueZ's device. I am suggesting that the simplest
> > convention is to use the same path of the BlueZ's device object, which
> > is easy to follow and implement by providers. Otherwise, we would
> > still need another convention to match them, but I think any other
> > convention is likely more complex to implement by battery providers.
> > Can you suggest an alternative convention to match the battery and the
> > device?
>
> I thought the objects would be registered directly on the device
> object itself but it looks like it is on the adapter thus why you need
> the device in the first place, but if you are using the object path it
> is just a matter of moving BatteryProviderManager1 to the device
> object.
If we move BatteryProviderManager1 to the device object, that means we
can't use the object manager style and providers have to register each
battery once rather than registering once in the beginning and expose
several objects afterwards, so this would lose your suggestion to use
object manager in the first place. I prefer we stick to using object
manager style, it is simple, easy to understand and implement for
providers (refer to my python test app in one of the patches in this
series).

>
> > >
> > > > +
> > > > +Properties     Objects provided on this interface contain the same properties
> > > > +               as org.bluez.Battery1 interface.
> > > > --
> > > > 2.26.2
> > >
> > >
> > >
> > > --
> > > Luiz Augusto von Dentz
>
>
>
> --
> Luiz Augusto von Dentz
