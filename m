Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3EE2B7190
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Nov 2020 23:28:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729141AbgKQW0n (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 17 Nov 2020 17:26:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728640AbgKQW0m (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 17 Nov 2020 17:26:42 -0500
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C734C0613CF
        for <linux-bluetooth@vger.kernel.org>; Tue, 17 Nov 2020 14:26:42 -0800 (PST)
Received: by mail-ot1-x343.google.com with SMTP id g19so21045749otp.13
        for <linux-bluetooth@vger.kernel.org>; Tue, 17 Nov 2020 14:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sfSehidBKoYnhdQ5e+wGWEsX6JlizagXvBE2Fj2QX8k=;
        b=fwpfn/nE6Pj+V9dWgkgIyOVDTvP+svQYcwVvYr6JtcSQxznDft30nxn+KJZh0rgZ0V
         DKc7vZQX1GvQtfasXDLEngjBl5Xz4VBbVbqBuhZKzZZj3PPZRwwHR0LGY6xdS+11ilAM
         figI5AFVh/4I9SvzTPG6sZVaQeVBpCcYJDP6ZbJ5PhV+nXWH20uAUAT0odSMG/uJ2pT2
         jl8Uu3dynjEkEkDqg0poESGUigbYR1ik2k2IqK8ndSSADyhINlmz3keEVifI7Oqo8v0l
         MsyJoQf1h3CGT4jO43lgNLSQu3v1y8LaUlheskFfRxU7IhjNhFinyFZxpn9/wWKJQIUS
         zmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sfSehidBKoYnhdQ5e+wGWEsX6JlizagXvBE2Fj2QX8k=;
        b=DHPKwaSCJI87W0vT9nWC7L8a0Z/ePLJ9YkggPU2CS/syg3apW+pVCnA0GClzr1F5V8
         0bPY1IESZOOhxhtjp90XNVIzdJTFgyr7X2RfSz3pkzCQj3VQu0ZDCdpBTkz4XqPQEOL3
         0mSi2VW+rsgThGNSJKrHhAQAHR+2e4+3pOrw8hUegtio+UWgI1ebLJ60pfjyn+Ksjbs2
         kcJopdTSd19ymzUw7LwdIhyhgkYqFRv1Da1cM37u2oPdsXdvAibC/v45z0HLKhQlfh2L
         WjG/mNjMmrB31iqnycb9g3QFQ5GYsr/wW5NbV2VOiF8UAXyUcokM3vdeyDVl0DcW6Cxv
         Bwzg==
X-Gm-Message-State: AOAM5325gPQK0nf3vRvfMnj+6zPTxIzluWA+0zVqILd9GZeXJVIKNZzv
        bpR+nS8fCt2F/fLI7RfNl4zNPs1RItkZGgcrjjo=
X-Google-Smtp-Source: ABdhPJzLGIiZMvCVkC2AVubq/2hirdndOto79LO6hErQiqTds3ixqMCr1/Y/JIc7ax5TyR9lyS58sRR8/avqRw0v5WA=
X-Received: by 2002:a05:6830:18f8:: with SMTP id d24mr4748731otf.44.1605652001714;
 Tue, 17 Nov 2020 14:26:41 -0800 (PST)
MIME-Version: 1.0
References: <20201111011745.2016-1-sonnysasaka@chromium.org>
 <20201111011745.2016-7-sonnysasaka@chromium.org> <aa1c080e8a7813299e6a093608211684e074e427.camel@hadess.net>
 <CAO271m=O3hyS6Pp4fQ1pnsir7wYbLFwDm7f-a5yd0o4NTUUewA@mail.gmail.com>
In-Reply-To: <CAO271m=O3hyS6Pp4fQ1pnsir7wYbLFwDm7f-a5yd0o4NTUUewA@mail.gmail.com>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Tue, 17 Nov 2020 14:26:30 -0800
Message-ID: <CABBYNZJjgdjsDXOQk=v4wJ7PLyHr-u2w6d+jgLKgwxV9J5OYdQ@mail.gmail.com>
Subject: Re: [PATCH BlueZ v2 7/7] battery: Implement Battery Provider API
To:     Sonny Sasaka <sonnysasaka@chromium.org>
Cc:     Bastien Nocera <hadess@hadess.net>,
        BlueZ <linux-bluetooth@vger.kernel.org>,
        Miao-chen Chou <mcchou@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Sonny,

On Tue, Nov 17, 2020 at 2:20 PM Sonny Sasaka <sonnysasaka@chromium.org> wrote:
>
> Hi Bastien,
>
> Thank you for the feedback. Please find my answers below.
>
> On Tue, Nov 17, 2020 at 2:51 AM Bastien Nocera <hadess@hadess.net> wrote:
> >
> > Hey Sonny,
> >
> > On Tue, 2020-11-10 at 17:17 -0800, Sonny Sasaka wrote:
> > > This patch implements the BatteryProvider1 and
> > > BatteryProviderManager1
> > > API. This is a means for external clients to feed battery information
> > > to
> > > BlueZ if they handle some profile and can decode battery reporting.
> > >
> > > The battery information is then exposed externally via the existing
> > > Battery1 interface. UI components can consume this API to display
> > > Bluetooth peripherals' battery via a unified BlueZ API.
> >
> > Was this patch reviewed for potential security problems? From the top
> > of my head, the possible problems would be:
> > - I don't see any filters on which user could register battery
> > providers, so on a multi user system, you could have a user logged in
> > via SSH squatting all the battery providers, while the user "at the
> > console" can't have their own providers. Also, what happens if the user
> > at the console changes (fast user switching)?
> > - It looks like battery providers don't check for paired, trusted or
> > even connected devices, so I would be able to create nearly unbound
> > number of battery providers depending on how big the cache for "seen"
> > devices is.
> For security, the API can be access-limited at D-Bus level using D-Bus
> configuration files. For example, we can let only trusted UNIX users
> as the callers for this API. This D-Bus config file would be
> distribution-specific. In Chrome OS, for example, only the "audio" and
> "power" users are allowed to call this API. This way we can make sure
> that the callers do not abuse the API for denial-of-service kind of
> attack.

I guess there is still some the risk of conflicts even with the use of
D-Bus policy blocking roge applications, there could still be multiple
entities providing the battery status from the same source, which is
why I suggested we couple the Battery1 with the Profile1, so only the
entity that has registered to handle let say HFP can provide a battery
status and we automatically deduce the source is from HFP.

> >
> > Given that the interface between upower and bluez is supposedly
> > trusted, it might be good to ensure that there are no fuzzing problems
> > on the bluez API side that could translate to causing problems in
> > upower itself.
> Could you give an example of what potential problems of upower can be
> caused by communicating with BlueZ through this API?
>
> >
> > I didn't review the code in depth, but, having written this mechanism
> > for Bluetooth battery reporting, I think that this is the right way to
> > go to allow daemons like pulseaudio to report battery status.
> >
> > Cheers
> >



-- 
Luiz Augusto von Dentz
