Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0529D16B418
	for <lists+linux-bluetooth@lfdr.de>; Mon, 24 Feb 2020 23:33:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727670AbgBXWdP (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 24 Feb 2020 17:33:15 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:36744 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726651AbgBXWdO (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 24 Feb 2020 17:33:14 -0500
Received: by mail-ot1-f65.google.com with SMTP id j20so10306513otq.3
        for <linux-bluetooth@vger.kernel.org>; Mon, 24 Feb 2020 14:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7ik8Suev1wn9gM+r6boW5emKP4kGGDxI8AQFnWGxpzs=;
        b=LzrrnZStsmhe13X2FRsryeRzs0hsO5y2uEEFwDj0YGBPMbUUC3bntxoDfivcdfcrXo
         1fXVTqogg/F28ex2IpbQJBmxgBePrvMzb80Dm74m5Bx2MRbw/XDKCPwGqpR8PCKUalR6
         8JqKx90pIpbk6eHKwl+qUTlQ2POboXQmN4Gs9wuvTiScJRbWnZJu4I7rHMxe5xUc8LyN
         hcuXKRniX+SwRHFAOfv2Q+P0opysuMD2iiwfMHqUG8hWcU4fVRTUqOeBFS6T4ncGHeaT
         o8mRLZwZImhLONuLtNFhA9oD4xulNmxGSaQF3J8HYsugsaAcsVFhAkgyd89THsPNcu8m
         x0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7ik8Suev1wn9gM+r6boW5emKP4kGGDxI8AQFnWGxpzs=;
        b=UgxP6W9s+3b8FzBhriaxhn1wmedajBnZsgQqJxhjeVIi4oCKXTYpvFl5NACYFWJb5e
         MNmevty7FJrjWZZb+qdUtiSI0oEboQ29uSy2e7CIcSnGewSwm9vvwKi4de/FifR/BjEJ
         rqAzYqv95PfJ0EfPM33XZIx0d184Rrh6lFUjHuW+qE/zxJcRqbFUpIZpZH1ljqPQKeSy
         vMMwpXK0f48fpDZKRYalbmfShZ+RPM3OAOpgYy2aGA1Eo/fUobA7gdx8S0tqvMvcS+at
         I1VTCvL9PzgNH+h6ddjkwxhBNn6qTj2f3cHaTh08kSNx4toRe/HKNFFx/G2PyAHGD8AD
         JdLg==
X-Gm-Message-State: APjAAAX5zPahctKXCWhDACPfPNIfxOIfWq5XQkpbe+NO2MVdfh3jGq+b
        CUZVSj4Na1sYw7k2TqeyoDBN2bIdXHr2zudeX7g=
X-Google-Smtp-Source: APXvYqyX7MK5E2/Hw9ro/NYVKxDh6GduxfyRDSBs5OoX7M8+PFwuF1IMucqY0S9VME/7IEWN1XuXdC0GE8xr55Ecwrg=
X-Received: by 2002:a05:6830:88:: with SMTP id a8mr27527566oto.177.1582583593619;
 Mon, 24 Feb 2020 14:33:13 -0800 (PST)
MIME-Version: 1.0
References: <CAJ_gUqbKKxt15OhizRN_x4Dy-RvyuEUH0Bwcah_KEcMsQakQoA@mail.gmail.com>
 <CABBYNZKG6hFMgy7ifuEW2kxyQYd=Gw0cWefjBy-fdWS00OWL+g@mail.gmail.com> <CAJ_gUqZ5rsV55tO5O07fUYxEoJa=CG0gAz5P3hJ-Lb-kYws2rg@mail.gmail.com>
In-Reply-To: <CAJ_gUqZ5rsV55tO5O07fUYxEoJa=CG0gAz5P3hJ-Lb-kYws2rg@mail.gmail.com>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Mon, 24 Feb 2020 14:33:01 -0800
Message-ID: <CABBYNZJhPqb=H0r93mTnLxBMR-AazXdfopHTT-pw+ZXgj1QzeA@mail.gmail.com>
Subject: Re: Adding support for DuplicateData into the kernel
To:     Scott Shawcroft <scott@adafruit.com>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Scott,

On Mon, Feb 24, 2020 at 1:51 PM Scott Shawcroft <scott@adafruit.com> wrote:
>
> On Mon, Feb 24, 2020 at 10:57 AM Luiz Augusto von Dentz
> <luiz.dentz@gmail.com> wrote:
> >
> > Hi Scott,
> >
> > On Thu, Feb 20, 2020 at 8:34 PM Scott Shawcroft <scott@adafruit.com> wrote:
> > >
> > > Hi!
> > >
> > > I'm trying to create a bridge between BLE advertisements and the web
> > > for sensor data logging. The BLE advertisements use manufacturer data
> > > to transmit the sensor data. I'm running on a Raspberry Pi 3b.
> > >
> > > I've been trying to use the Bluez dbus interface with DuplicateData,
> > > trying both true and false, and I never seem to get duplicates back. I
> > > dug into it via hcidump and noticed that the scan enable still has
> > > filter duplicates set to true regardless. I can only manage to get it
> > > set to False when using hcitool.
> > >
> > > I believe I've tracked the issue down into the kernel here:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git/tree/net/bluetooth/hci_request.c#n858
> > > where enabling duplicate filtering is hardcoded. It seems that hcitool
> > > side steps this by talking directly to the hci device.
> >
> > Yep, the kernel code don't actually allow setting the duplicate filter
> > unfortunately.
> >
> > > Could someone confirm I'm on the right track? I'd be willing to plumb
> > > the DuplicateData value through to the kernel if someone could help me
> > > find the call path down.
> >
> > In the past Marcel was against turning off the duplicate filtering but
> > since we do have a similar setting over D-Bus, though the later shall
> > not be confused since tracks duplicates by itself since over D-Bus we
> > are doing it to prevent duplicate signals, Im with the opinion that
> > DuplicateData could be used to disable duplicate filtering, default
> > should be still be enabled though.
> >
> > --
> > Luiz Augusto von Dentz
>
> Thanks for the reply!
>
> I agree the default should be to filter duplicates. I'd love to see
> the Dbus setting actually used in the kernel. Did I find the correct
> place to change? I'm not sure how it is called from bluez though.
> (Maybe through the mgmt API?)

Yes, we would need to add it to Start Service Discover or create a new
one, while at it we may add support for adding both the interval and
window to SetDiscoveryFilter, Id actually think we might be better off
adding a new command e.g. Start Filtered Discover which can then
accomodate all these details, but it probably won't be very simple to
do as we learn from the addition of the filters making it work with
multiple clients complicates it a little bit, anyway I don't think we
want this to be global but rather per client.


-- 
Luiz Augusto von Dentz
