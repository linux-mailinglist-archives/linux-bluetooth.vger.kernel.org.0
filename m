Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19D3614D0A2
	for <lists+linux-bluetooth@lfdr.de>; Wed, 29 Jan 2020 19:45:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727302AbgA2SpQ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 29 Jan 2020 13:45:16 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:44108 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727024AbgA2SpQ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 29 Jan 2020 13:45:16 -0500
Received: by mail-ua1-f66.google.com with SMTP id x16so114401uao.11
        for <linux-bluetooth@vger.kernel.org>; Wed, 29 Jan 2020 10:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NdjZXw2pckiQPOXqyG9lh4xe/TEMQj8ac4D4/mbNXto=;
        b=HW7pxzzYZk7S8tAydngvNnb1BBox4itVa06TdMOf20d4DxnasSDn7ElAP0iP44f9Zh
         md3Zxb/9EmbDoHNNLWDEFWahz6aD8Tmi/bE7WRauza3/cgJ44huupeRdYB9nHyUYbUIV
         Uw7KoA+DAdF2spkZWnBpw7n+Pgy+n/zq+bADY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NdjZXw2pckiQPOXqyG9lh4xe/TEMQj8ac4D4/mbNXto=;
        b=TEFpWosVGIb/C99idIJRHfM3jMqImJoGtJzAzLn5pBtbGT7QJzgSrX1ACI+oidikmr
         n5Om/9nO8jXkHwq9DZVjt/ozn5Z6umLqKnegba7CryOUDm7BidZAzqUnKaCKyGK5w1RK
         pEz58KQQXSiXpg6IF8bAYjZiYaE1GAOFwvVucV5nWqxKuv1zAy+bxHXC28K2EWxD00uT
         EQIIgVx+SivN9i5VvFyGkLdw1Hy9lFMPMjqIU4pJQEAHv+Pwq3OMEQYD3tCDkOZc6yNG
         IzqrVViZ/JjRPmiGIEB32Ml8Rc3G8UvUHDLJNbzU4CnWU4LLBJTL2tqf7AJM4b/T0otc
         pc+Q==
X-Gm-Message-State: APjAAAUcgW8MsW/B+r2OzFY3ny2G/L7blek/do30TIw8i5/jb5NzAJ1n
        fAhJ1aDOoqOZbU4uAMQfV6m0Yp0Oeh3BaGcthyDc+A==
X-Google-Smtp-Source: APXvYqwcb2EkqqZ2XRGHR9Dxthg5myS6T5sGvz3Bt2xeKyuT5k/2Csn6xFQjk/t6Yke9owkDgC1NR64tmAoEzBqFTa8=
X-Received: by 2002:ab0:6894:: with SMTP id t20mr151888uar.100.1580323514483;
 Wed, 29 Jan 2020 10:45:14 -0800 (PST)
MIME-Version: 1.0
References: <20200128020505.239349-1-abhishekpandit@chromium.org>
 <20200127180433.BlueZ.v3.1.I999b93b65e613324dbbd16a1cf493be72fa06ad1@changeid>
 <137EB79B-88E6-43E0-894F-A0C8D5F9B710@holtmann.org> <CANFp7mUF=1ehF_Kwnf5kdCiypoOL8ph8PPEMbwm53NR-==D-hA@mail.gmail.com>
 <00B97550-7BB3-4F86-8463-A4053C84978A@holtmann.org>
In-Reply-To: <00B97550-7BB3-4F86-8463-A4053C84978A@holtmann.org>
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date:   Wed, 29 Jan 2020 10:45:02 -0800
Message-ID: <CANFp7mW5BV9oo2jya86+e8p+XWotMgrMyqJ63+0gjPforcYMuQ@mail.gmail.com>
Subject: Re: [BlueZ PATCH v3 1/5] mgmt: Add docs for Set Wake Capable
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Alain Michaud <alainm@chromium.org>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        chromeos-bluetooth-upstreaming@chromium.org,
        Johan Hedberg <johan.hedberg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Wed, Jan 29, 2020 at 10:06 AM Marcel Holtmann <marcel@holtmann.org> wrot=
e:
>
> Hi Abhishek,
>
> >>> Add docs for new management operation to mark a device as wake capabl=
e.
> >>>
> >>> ---
> >>>
> >>> Changes in v3: None
> >>> Changes in v2:
> >>> * Separated docs/mgmt-api.txt into its own patch
> >>>
> >>> doc/mgmt-api.txt | 19 +++++++++++++++++++
> >>> 1 file changed, 19 insertions(+)
> >>>
> >>> diff --git a/doc/mgmt-api.txt b/doc/mgmt-api.txt
> >>> index 1e59acc54..8a73a9bb9 100644
> >>> --- a/doc/mgmt-api.txt
> >>> +++ b/doc/mgmt-api.txt
> >>> @@ -3047,6 +3047,25 @@ Load Blocked Keys Command
> >>>      Possible errors:        Invalid Parameters
> >>>                              Invalid Index
> >>>
> >>> +Set Wake Capable Command
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >>> +
> >>> +     Command Code:           0x0047
> >>> +     Controller Index:       <controller id>
> >>> +     Command Parameters:     Address (6 Octets)
> >>> +                             Address_Type (1 Octet)
> >>> +                             Wake Capable (1 Octet)
> >>> +     Return Parameters:      Address (6 Octets)
> >>> +                             Address_Type (1 Octet)
> >>> +                             Wake Capable (1 Octet)
> >>> +
> >>> +     This command sets whether a bluetooth device is capable of waki=
ng the
> >>> +     system from suspend. This property is used to set the event fil=
ter and
> >>> +     LE whitelist when the system enters suspend.
> >>> +
> >>> +     Possible errors:        Failed
> >>> +                             Invalid Parameters
> >>> +                             Invalid Index
> >>>
> >>
> >> my current thinking goes into this API addition:
> >>
> >> --- a/doc/mgmt-api.txt
> >> +++ b/doc/mgmt-api.txt
> >> @@ -2003,6 +2003,7 @@ Add Device Command
> >>                0       Background scan for device
> >>                1       Allow incoming connection
> >>                2       Auto-connect remote device
> >> +               3       Allow incoming connection to wake up the syste=
m
> >>
> >>        With the Action 0, when the device is found, a new Device Found
> >>        event will be sent indicating this device is available. This
> >> @@ -2018,6 +2019,9 @@ Add Device Command
> >>        and if successful a Device Connected event will be sent. This
> >>        action is only valid for LE Public and LE Random address types.
> >>
> >> +       With the Action 3, the device is allowed to connect the same w=
ay
> >> +       as with Action 1, but allows to wake up the system from suspen=
d.
> >> +
> >>        When a device is blocked using Block Device command, then it is
> >>        valid to add the device here, but all actions will be ignored
> >>        until the device is unblocked.
> >>
> >> Since we are really talking about incoming connections, then the Add D=
evice command is the one that handles this. Giving a device the option to w=
ake us up that is not set up for incoming connections makes no sense. We ca=
n discuss if certain LE advertising packets should wake us up, but that is =
a total different API in my book.
> >
> > I originally tried implementing this with the Add Device api as you
> > suggested in the RFC email back in November (when we first talked
> > about this). I had trouble figuring out when/where in bluez to
> > actually send the Add Device command.
> >
> > Whether a device supports wake-up is a profile level setting (i.e. HID
> > only so far). As far as I can tell, Add Device is called before the
> > profile connection is established. Bluez has two apis that call
> > MGMT_OP_ADD_DEVICE:
> > * adapter_auto_connect_add (this seems to be LE)
> > * adapter_whitelist_add (this seems to be BR/EDR)
> >
> > Both seem to be called BEFORE the registered profiles have a chance to
> > accept the connection.
>
> this is something for Luiz or Johan to comment on. Maybe our code is not =
as good as I was thinking in this regard. Or maybe this is actually legacy =
code that I am trying to rid of by requiring a mgmt API revision that has A=
dd Device support.
>
> In general once we bonded with a device, we should be able to assign cert=
ain properties to it that are kept persistently.
>

It looks like add_device would work if I opted to use it as an
"update_device_params" type of function (I think I can use it in the
same location I currently use adapter_set_wake_capable; I would just
check that the device has already been added first).

You would still need to make a separate call from the original
add_device so your original criticism of requiring another mgmt call
for every param being set is still there. I could refactor the action
parameter to accept flags (i.e. 0x3 =3D Set connection parameters) and
then add a uint16_t flags parameter (i.e. 1 << 0: Allow wakeup from
incoming connection).

What do you think?

> Regards
>
> Marcel
>
