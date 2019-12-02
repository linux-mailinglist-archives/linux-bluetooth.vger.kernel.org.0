Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A078910F2FA
	for <lists+linux-bluetooth@lfdr.de>; Mon,  2 Dec 2019 23:55:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbfLBWzJ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 2 Dec 2019 17:55:09 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:40813 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbfLBWzI (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 2 Dec 2019 17:55:08 -0500
Received: by mail-qt1-f196.google.com with SMTP id z22so1609636qto.7
        for <linux-bluetooth@vger.kernel.org>; Mon, 02 Dec 2019 14:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=p04VAJalNVcM1wKI1wNyT7o1NcBjHgxv0Xx73wtI7Uw=;
        b=DBjGmh5pKmn+iK8CQgTpxCXLqyiQJG9uyAwY9nd08tUBTD7EdZNQdCkUROtRV0IszW
         Ik9DYNnewG76/TeC83sHVxHYQwrMx3nuthATSCVyb9jMw4daw9ZMFKSqB7oxEtzWTp/0
         lreu79OC1dYu/O4Np+dsp0oz9IXG8f7xH1uoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=p04VAJalNVcM1wKI1wNyT7o1NcBjHgxv0Xx73wtI7Uw=;
        b=WdbqgGcqK7WVCR7bqZREhws9bces54O963ziF0rRXvMWv4DUyQTTfk7mJdWrR2+wVe
         XWCPGWiEUFv1gjIj06XewFGMU72wbbhOZ7OdNCS+b5/N669vYuN836Yu+dJBQRcBxsjj
         47IMxrHYZ/0o0+JXkyqF8HV2nna0CFOG73egczIcCDCU4QZRg4BE5juaeH2u40SFEpJU
         VMnlN+6zOCpz3zwl5IRJ7BgbHMLqPzz5J3BPgGqodD+3AMxmhTE1etb8d5YaVLXyBqPV
         AF7RaqwxuJjf1nNO4pZkD21YEmo63xYnqWDODFHPSJE/oxCXWvePqEIaGvDJ00ZLTb94
         8jGQ==
X-Gm-Message-State: APjAAAVvzntchUDXoxSumAxhlbpmRWvx8n9IaE/LXsZLdQTBd30RYX8l
        Z2t+IkKyxN0kSJOBYA4spEOVYHOTuahO2FbHoD/a6w==
X-Google-Smtp-Source: APXvYqx+knpHqLNbP/4kmVwRIQS9IqbMUxOuMcqsz6hyYcabkc8gLoz79VWWwIZmM8CQiV86Xtj8ei8hj4e8cKYZl30=
X-Received: by 2002:ac8:750b:: with SMTP id u11mr2133080qtq.170.1575327307548;
 Mon, 02 Dec 2019 14:55:07 -0800 (PST)
MIME-Version: 1.0
References: <20191127185139.65048-1-abhishekpandit@chromium.org>
 <20191201145357.ybq5gfty4ulnfasq@pali> <20191202012305.GQ248138@dtor-ws>
 <20191202084750.k7lafzzrf3yq2tqs@pali> <20191202175440.GA50317@dtor-ws>
 <20191202185340.nae4lljten5jqp3y@pali> <20191202193628.GI50317@dtor-ws>
In-Reply-To: <20191202193628.GI50317@dtor-ws>
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date:   Mon, 2 Dec 2019 14:54:56 -0800
Message-ID: <CANFp7mVr_cb89BH0ApuPWV2wgmBq7MVqeNUWC=OBjO9KTj=qnw@mail.gmail.com>
Subject: Re: [PATCH] Input: uinput - Add UI_SET_UNIQ ioctl handler
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>,
        linux-input@vger.kernel.org,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Logan Gunthorpe <logang@deltatee.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Kirill Smelkov <kirr@nexedi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Mon, Dec 2, 2019 at 11:36 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Mon, Dec 02, 2019 at 07:53:40PM +0100, Pali Roh=C3=A1r wrote:
> > On Monday 02 December 2019 09:54:40 Dmitry Torokhov wrote:
> > > On Mon, Dec 02, 2019 at 09:47:50AM +0100, Pali Roh=C3=A1r wrote:
> > > > On Sunday 01 December 2019 17:23:05 Dmitry Torokhov wrote:
> > > > > Hi Pali,
> > > > >
> > > > > On Sun, Dec 01, 2019 at 03:53:57PM +0100, Pali Roh=C3=A1r wrote:
> > > > > > Hello!
> > > > > >
> > > > > > On Wednesday 27 November 2019 10:51:39 Abhishek Pandit-Subedi w=
rote:
> > > > > > > Support setting the uniq attribute of the input device. The u=
niq
> > > > > > > attribute is used as a unique identifier for the connected de=
vice.
> > > > > > >
> > > > > > > For example, uinput devices created by BlueZ will store the a=
ddress of
> > > > > > > the connected device as the uniq property.
> > > > > > >
> > > > > > > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromiu=
m.org>
> > > > > >
> > > > > > ...
> > > > > >
> > > > > > > diff --git a/include/uapi/linux/uinput.h b/include/uapi/linux=
/uinput.h
> > > > > > > index c9e677e3af1d..d5b7767c1b02 100644
> > > > > > > --- a/include/uapi/linux/uinput.h
> > > > > > > +++ b/include/uapi/linux/uinput.h
> > > > > > > @@ -145,6 +145,7 @@ struct uinput_abs_setup {
> > > > > > >  #define UI_SET_PHYS                _IOW(UINPUT_IOCTL_BASE, 1=
08, char*)
> > > > > > >  #define UI_SET_SWBIT               _IOW(UINPUT_IOCTL_BASE, 1=
09, int)
> > > > > > >  #define UI_SET_PROPBIT             _IOW(UINPUT_IOCTL_BASE, 1=
10, int)
> > > > > > > +#define UI_SET_UNIQ                _IOW(UINPUT_IOCTL_BASE, 1=
11, char*)
> > > > > >
> > > > > > I think that usage of char* as type in _IOW would cause compati=
bility
> > > > > > problems like it is for UI_SET_PHYS (there is UI_SET_PHYS_COMPA=
T). Size
> > > > > > of char* pointer depends on userspace (32 vs 64bit), so 32bit p=
rocess on
> > > > > > 64bit kernel would not be able to call this new UI_SET_UNIQ ioc=
tl.
> > > > > >
> > > > > > I would suggest to define this ioctl as e.g.:
> > > > > >
> > > > > >   #define UI_SET_UNIQ         _IOW(_IOC_WRITE, UINPUT_IOCTL_BAS=
E, 111, 0)
> > > > > >
> > > > > > And then in uinput.c code handle it as:
> > > > > >
> > > > > >   case UI_SET_UNIQ & ~IOCSIZE_MASK:
> > > > > >
> > > > > > as part of section /* Now check variable-length commands */
> > > > >
> > > > > If we did not have UI_SET_PHYS in its current form, I'd agree wit=
h you,
> > > > > but I think there is benefit in having UI_SET_UNIQ be similar to
> > > > > UI_SET_PHYS.
> > > >
> > > > I thought that ioctl is just number, so we can define it as we want=
. And
> > > > because uinput.c has already switch for variable-length commands it
> > > > would be easy to use it. Final handling can be in separate function=
 like
> > > > for UI_SET_PHYS which can look like same.
> > >
> > > Yes, we can define ioctl number as whatever we want. What I was tryin=
g
> > > to say, right now users do this:
> > >
> > >     rc =3D ioctl(fd, UI_SET_PHYS, "whatever");
> > >     ...
> > >
> > > and with UI_SET_UNIQ they expect the following to work:
> > >
> > >     rc =3D ioctl(fd, UI_SET_UNIQ, "whatever");
> > >     ...
> >
> > And would not following definition
> >
> >   #define UI_SET_UNIQ _IOW(_IOC_WRITE, UINPUT_IOCTL_BASE, 111, 0)
> >
> > allow userspace to call
> >
> >   rc =3D ioctl(fd, UI_SET_UNIQ, "whatever");
> >
> > as you want?
>
> OK, so what you are saying is that we can have whatever in the size
> portion of ioctl number and simply ignore it in the driver (and I do not
> think we need to do any of "UI_SET_UNIQ & ~IOCSIZE_MASK" really).
> While this would work, I am not sure it is the best option as I think
> we'd have to comment extensively why we have arbitrary number in place
> of the size.
>
> And we still do not really save anything, as we still have to go through
> compat ioctl handler (since we have it already) and it is very simple to
> add a case for UI_SET_UNIQ there...
>
> Thanks.
>
> --
> Dmitry

Since the compat handling already exists for UI_SET_PHYS, I think I
would prefer to go with the simpler solution of just duplicating that
for UI_SET_UNIQ. Next patch is coming with that change.

Thanks
Abhishek
