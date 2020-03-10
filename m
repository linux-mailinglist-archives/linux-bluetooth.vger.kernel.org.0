Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4372117F776
	for <lists+linux-bluetooth@lfdr.de>; Tue, 10 Mar 2020 13:30:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgCJMa0 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 10 Mar 2020 08:30:26 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38036 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbgCJMa0 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 10 Mar 2020 08:30:26 -0400
Received: by mail-lj1-f194.google.com with SMTP id w1so13898394ljh.5
        for <linux-bluetooth@vger.kernel.org>; Tue, 10 Mar 2020 05:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gNdHB2eRgC38Rm6QBGIuzob7mej0xH2j8kwhYctFfZU=;
        b=H7UoZT8vFrRJ2xWjG8UWP5YQM8kc8XBjRovD1rszXyrjfuGXdkSlVf/NSwx/UBDDEY
         rO4LBQ8YWxg1cDIhxEh1qjt0kK3m1VzROe02ovlk1nifu0uK3+DZxvuyBPfye6zfuHNV
         qkg25/mqUM0C59SxY9rfdSDIEda6HVg6vi0288oJCeozZmIQVMaT5MIzJPFX9wp1epu1
         Lzdt9zp168/djQH615iH1F/B6LQPM8+WgtOaTB4i814eE7KbDgyZvS/wJ4YGTKOkHuDZ
         g+D4TIOSFZ15+ffOfRNj7OW6+vc6XVF9dWX+W+h/a1EEgWuPr/3TOYqF27SE+bA01WgG
         xDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gNdHB2eRgC38Rm6QBGIuzob7mej0xH2j8kwhYctFfZU=;
        b=BtqdxoLbhEOgU8yc+ZhE9iXkL8AJ0cmSiW5U2MndHVXsvYuqhS5NfRaauI572ZQd7Z
         wlp70/ffLIQj0zLX0IChlE1FbmGMCdsaBTg7pYp2snDJGHzQm19jdqjvFQMeuuVpOd3F
         Ai1763OmUQEbaenZPCnJ6uzoEpQy+2DkGqglUtW1LC9zuk3l1BscZCs+lBBhM88EtYK3
         Tm9C5s8PplrEfzNUT6NnoUgIRuJ1fKN1piqlcDfIcwQOyOWdS+8MocjVppG+MiU6LvSm
         oPsjH93DVFWKECnWzuPqr/1C/sMDho8CITAtev6fI02YcumQF91+ErdVzr0dQtwXhU1y
         woTQ==
X-Gm-Message-State: ANhLgQ1ShV84HXS1WvrD+6rIIOzS3K5TsFhgW1QEvhAXNhO8e+l6IJZT
        +wzEP3IzCDbdGs9QJ2euqXum8gG1pPbgFzS0X5YY6w==
X-Google-Smtp-Source: ADFU+vszxBZ5PU/s3oGLcqFUB8vx/ETa1PVL1NXDP8YU02hKaKh/3pSN8MLRtXdZWbgWToboUuEMqCueCvNqflRarJI=
X-Received: by 2002:a2e:3511:: with SMTP id z17mr10198568ljz.81.1583843424111;
 Tue, 10 Mar 2020 05:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200310023516.209146-1-alainm@chromium.org> <87A4E633-63CF-4C71-9BF6-916894790EED@holtmann.org>
 <CABBYNZKbc71WvOA34cFcKXVRcG-hYedJBT5LeTK9c3+H5Trjwg@mail.gmail.com>
In-Reply-To: <CABBYNZKbc71WvOA34cFcKXVRcG-hYedJBT5LeTK9c3+H5Trjwg@mail.gmail.com>
From:   Alain Michaud <alainmichaud@google.com>
Date:   Tue, 10 Mar 2020 08:30:12 -0400
Message-ID: <CALWDO_VNPFJm+je4N1u1bW=+n8WTCoe+xwzrOo=UZi4ymuwdsg@mail.gmail.com>
Subject: Re: [BlueZ PATCH 0/2] HID and HOGP connections from non-bonded devices.
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Alain Michaud <alainm@chromium.org>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

On Tue, Mar 10, 2020 at 2:27 AM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Marcel,
>
> On Mon, Mar 9, 2020 at 10:26 PM Marcel Holtmann <marcel@holtmann.org> wrote:
> >
> > Hi Alain,
> >
> > > It was discovered that BlueZ's HID and HOGP profiles implementations
> > > don't specifically require bonding between the device and the host.
> > >
> > > This creates an opportunity for an malicious device to connect to a
> > > target host to either impersonate an existing HID device without
> > > security or to cause an SDP or GATT service discovery to take place
> > > which would allow HID reports to be injected to the input subsystem from
> > > a non-bonded source.
> > >
> > > This patch series addresses the issue by ensuring that only connections
> > > from devices that are bonded are accepted by the HID and HOGP profile
> > > implementation.
> > >
> > > More information about the vulnerability is available here:
> > > https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00352.html
> > >
> > > Alain Michaud (2):
> > >  HOGP must only accept data from bonded devices.
> > >  HID accepts bonded device connections only.
> > >
> > > profiles/input/device.c   | 23 ++++++++++++++++++++++-
> > > profiles/input/device.h   |  1 +
> > > profiles/input/hog.c      |  4 ++++
> > > profiles/input/input.conf |  8 ++++++++
> > > profiles/input/manager.c  | 13 ++++++++++++-
> > > 5 files changed, 47 insertions(+), 2 deletions(-)
> >
> > both patches have been applied.
> >
> > However I changed BrBondedOnly configuration name into ClassicBondedOnly since that name seemed more obvious to me. The prefix Br has never been used and the Bluetooth SIG started calling it Classic a while back.
>
> Looks like you were quicker than me, anyway I do fill like we should
> attempt to bump to security instead of just refuse to connection in
> case of HoG since we are the central and the peripheral is not
> mandated to started it either it may be just the client application is
> attempting to connect to trigger pairing on demand, that would usually
> kick latter when reading the characteristics but with this changes it
> doesn't even get to that point if the devices was not bonded already.
The specification for HoG is that the device is bonded.  If client or
server attempts to access the service before it is bonded, it would
violate the specification.  For this reason, I believe it is both
safer and simpler to just reject any attempts to access the service
without first being bonded.
>
> --
> Luiz Augusto von Dentz
