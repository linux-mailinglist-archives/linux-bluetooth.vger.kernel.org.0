Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F23142C32E4
	for <lists+linux-bluetooth@lfdr.de>; Tue, 24 Nov 2020 22:30:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732365AbgKXVaO (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 24 Nov 2020 16:30:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732361AbgKXVaN (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 24 Nov 2020 16:30:13 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66B54C0613D6
        for <linux-bluetooth@vger.kernel.org>; Tue, 24 Nov 2020 13:30:13 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id y4so334456edy.5
        for <linux-bluetooth@vger.kernel.org>; Tue, 24 Nov 2020 13:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LhrOc0C3CS+TGTP7+4WNdJdSrv4dfvTQt387DCzhwxU=;
        b=CCcwG3LpV1y0B5O7a1jt0abYURqbZSsxjVFJr9zlwnIku3bcl8SRgF2SdE2oAJG9cu
         +uIGjSIIshzZ1yLlsze8Ai3fjIhW9ByBBQMwYQ6bfilnOxcwm1Rf5ldLNc6mxlViVBFC
         xJujXD2FEQ1tqHC9xR32kkySaaQctwWppgkSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LhrOc0C3CS+TGTP7+4WNdJdSrv4dfvTQt387DCzhwxU=;
        b=KKLJ5rzddPl/LLW19IYJjJTK3bNKxRH+E0e9tWM9Y67+i+zLq4iayCU/QKETu1S3kk
         +ZotpzodjVTym3R5ZBtZY8FpiElrSkD7nuIXou7HIQQ6amX5LLuZ+4QBsqhe7QpDMoUS
         kx2aEUUGucngKK4jYjgOTWK7Eg+tuhR9Of4ntY1hq9ukO5LmRh7NR0qsVI3RvxkVP3XU
         wsTyQ6pDmKL6eGdVnmQ3QFhUYlIUPPhZpBk7HTYr+5pOMf7OlUoIQzo7EIDZ+ohJweWO
         ymBW4uiws3CD8pHtcoN7/RudC0oe0E/UOd1Vy6zWFYJUpah3+rJxYEGDmOF5vdm/5Kk7
         sCPw==
X-Gm-Message-State: AOAM530rl6anuyHpCSl8UtyV9jGMXFDLWKl2Nt+yJhyZIXeEOPtVJdTZ
        PHxl9jhRUqFcVUnhnQGPrAZcRMM5JyRiMQ==
X-Google-Smtp-Source: ABdhPJyUedREw1/Gbem0FE20+viT1Hn0atsRnWZVPQjkDxxWQ/SIPDfQcPo/khcyQvj5wYMz5hMzIQ==
X-Received: by 2002:a50:b761:: with SMTP id g88mr463090ede.387.1606253411702;
        Tue, 24 Nov 2020 13:30:11 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id l27sm118751eja.20.2020.11.24.13.30.10
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 13:30:10 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id a65so325190wme.1
        for <linux-bluetooth@vger.kernel.org>; Tue, 24 Nov 2020 13:30:10 -0800 (PST)
X-Received: by 2002:a1c:9ecf:: with SMTP id h198mr404703wme.104.1606253410127;
 Tue, 24 Nov 2020 13:30:10 -0800 (PST)
MIME-Version: 1.0
References: <20201120205728.339325-1-sonnysasaka@chromium.org>
 <20201120205728.339325-4-sonnysasaka@chromium.org> <CABBYNZLsGs5KDC8kGY4ahfA1Bmdhz1XaR9kNRBKNxN7dTZoFHw@mail.gmail.com>
In-Reply-To: <CABBYNZLsGs5KDC8kGY4ahfA1Bmdhz1XaR9kNRBKNxN7dTZoFHw@mail.gmail.com>
From:   Sonny Sasaka <sonnysasaka@chromium.org>
Date:   Tue, 24 Nov 2020 13:29:58 -0800
X-Gmail-Original-Message-ID: <CAO271m=Bsz8NXtHzjAn5iYxMs0hxd17DW9QCUnXZACywTDVcvg@mail.gmail.com>
Message-ID: <CAO271m=Bsz8NXtHzjAn5iYxMs0hxd17DW9QCUnXZACywTDVcvg@mail.gmail.com>
Subject: Re: [PATCH BlueZ v3 4/7] doc: Add Battery Provider API doc
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        Miao-chen Chou <mcchou@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,


On Tue, Nov 24, 2020 at 1:21 PM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Sonny,
>
> On Fri, Nov 20, 2020 at 1:00 PM Sonny Sasaka <sonnysasaka@chromium.org> wrote:
> >
> > This patch add the documentation of the Battery Provider which lets
> > external clients feed battery information to BlueZ if they are able to
> > decode battery reporting via any profile. BlueZ UI clients can then use
> > the org.bluez.Battery1 API as a single source of battery information
> > coming from many different profiles.
> >
> > Reviewed-by: Miao-chen Chou <mcchou@chromium.org>
> >
> > ---
> > Changes in v3:
> > * Remove doc duplication in BatteryProvider1 and mention that it's the
> >   same as Battery1 instead.
> > * Suggest profile UUID in Source property.
> >
> >  doc/battery-api.txt | 49 +++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >
> > diff --git a/doc/battery-api.txt b/doc/battery-api.txt
> > index dc7dbeda2..b5c9a7be1 100644
> > --- a/doc/battery-api.txt
> > +++ b/doc/battery-api.txt
> > @@ -12,3 +12,52 @@ Object path  [variable prefix]/{hci0,hci1,...}/dev_XX_XX_XX_XX_XX_XX
> >  Properties     byte Percentage [readonly]
> >
> >                         The percentage of battery left as an unsigned 8-bit integer.
> > +
> > +               string Source [readonly, optional, experimental]
> > +
> > +                       Describes where the battery information comes from
> > +                       This property is informational only and may be useful
> > +                       for debugging purposes.
> > +                       Providers from BatteryProvider1 may make use of this
> > +                       property to indicate where the battery report comes from
> > +                       (e.g. "HFP 1.7", "HID", or the profile UUID).
>
> We might need to remove the version number here since there is no
> equivalent on UUID, in fact friendly names may be a bad idea after all
> since for new profiles we may not have a friendly name to do the
> translation and since this is property that would be hard to notify
> the provider that we don't understand what is the Source while UUIDs,
> if well formatted, should not have this problem so Id just get rid of
> the use of friendly names altogether and expect the Source to be a
> 128bits UUID in string format.
Ack. Will change to 128bit UUID format.
>
> > +
> > +
> > +Battery Provider Manager hierarchy
> > +==================================
> > +A battery provider starts by registering itself as a battery provider with the
> > +RegisterBatteryProvider method passing an object path as the provider ID. Then,
> > +it can start exposing org.bluez.BatteryProvider1 objects having the path
> > +starting with the given provider ID. It can also remove objects at any time.
> > +The objects and their properties exposed by battery providers will be reflected
> > +on org.bluez.Battery1 interface.
> > +
> > +BlueZ will stop monitoring these exposed and removed objects after
> > +UnregisterBatteryProvider is called for that provider ID.
> > +
> > +Service                org.bluez
> > +Interface      org.bluez.BatteryProviderManager1 [experimental]
> > +Object path    /org/bluez/{hci0,hci1,...}
> > +
> > +Methods                void RegisterBatteryProvider(object provider)
> > +
> > +                       This registers a battery provider. A registered
> > +                       battery provider can then expose objects with
> > +                       org.bluez.BatteryProvider1 interface described below.
>
> We should probably mention this expects an object implementing
> ObjectManaged in order to list the Battery1 provider.
Ack. Will add more explanation.
>
> > +               void UnregisterBatteryProvider(object provider)
> > +
> > +                       This unregisters a battery provider. After
> > +                       unregistration, the BatteryProvider1 objects provided
> > +                       by this client are ignored by BlueZ.
> > +
> > +
> > +Battery Provider hierarchy
> > +==========================
> > +
> > +Service                <client D-Bus address>
> > +Interface      org.bluez.BatteryProvider1 [experimental]
> > +Object path    {provider_root}/org/bluez/{hci0,hci1,...}/dev_XX_XX_XX_XX_XX_XX
>
> If this is on the client the object path does not necessarily need to
> follow our object hierarchy.
We need a convention to match the exposed object by the battery
provider and BlueZ's device. I am suggesting that the simplest
convention is to use the same path of the BlueZ's device object, which
is easy to follow and implement by providers. Otherwise, we would
still need another convention to match them, but I think any other
convention is likely more complex to implement by battery providers.
Can you suggest an alternative convention to match the battery and the
device?

>
> > +
> > +Properties     Objects provided on this interface contain the same properties
> > +               as org.bluez.Battery1 interface.
> > --
> > 2.26.2
>
>
>
> --
> Luiz Augusto von Dentz
