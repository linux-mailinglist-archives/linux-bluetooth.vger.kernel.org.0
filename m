Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1D7718A15A
	for <lists+linux-bluetooth@lfdr.de>; Wed, 18 Mar 2020 18:17:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbgCRRRW (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 18 Mar 2020 13:17:22 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38684 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726796AbgCRRRV (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 18 Mar 2020 13:17:21 -0400
Received: by mail-ot1-f68.google.com with SMTP id t28so23683748ott.5
        for <linux-bluetooth@vger.kernel.org>; Wed, 18 Mar 2020 10:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=a0pO0BDSH3enU1Pe1XcKvjKuWFK0EAiwm+9wxatHEQs=;
        b=uQ4kjFVoKZiQ4mR4QCm8QzXGVd3k0bBCNL8ABfNS8zIRJEb2T84TLUdccMqWpVKtcd
         JWCFhjAQInIrieWMYoquGlabZqVBQ63VNboYVmVf88k5O7+uO+3u3hQApwsaFcLKQCn3
         aat6Uh5nltbUQQwccp+RJt6hpzpG44tGp0f5kKHabA3Plo8MZO0VjwCuwL0eDDF8p/Qi
         Wh1X61YhBmHpxfp8cvRz4AMvlMYPc0xfl3I2SmJ3wmUO1kv9EOGHkV0S9imSqi6wdhl3
         mlFf9rmjWWsT1OqtQqS+GDyA1c/N/rDDvWRg1eXmoscCYRHYMHcVdrEmiRLJQo6rQ9jB
         3kEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=a0pO0BDSH3enU1Pe1XcKvjKuWFK0EAiwm+9wxatHEQs=;
        b=bvHa/kl8wuJd+yaXZ+iJgPkCHO4oaDWov7HXid1fi5QHOlyrt/htIKFH1H5jS06WkC
         OYFgVpWzNpqmM3i73eDHK6QYjupDmgPq23OG3YgDPgNXhjHHOGgHFm2EwtBcLSKjSW06
         XDYUrWj+aQBjArfKgu5m/HqcPRCujhW0aA6uqHpWQUxWus34acmStdvm2spkOcu/Fcq7
         6Me1XS6R5igObyBJEyry6ShyJGzYSwQOICzhTWsZTwAk2MUx2lgODTPDhAzzC/aL7/U0
         zd3/yoh0Tydv8SaaahujNICWKLnF/rLNhjZlnQhqet8C0HZV8iqc4eJnlZXb/QmptsVx
         hTng==
X-Gm-Message-State: ANhLgQ2cS0buSq1ODR4gRkj1b8+zMnoXNk0idbu5hLMiGqv2xBPJeJ2P
        wHQMnbZ5U9ZIIRmVdA6Z9nJXQyi+L5IZAIPhJojXgmaI
X-Google-Smtp-Source: ADFU+vvwTmucD5XXkjqQIOTNxSCrxeQKWtaJQh0rC37yF+hghrf9aPyh4Ob+zXxoS9khvWkw17CglCL2/GX7nMu+Drk=
X-Received: by 2002:a05:6830:19c7:: with SMTP id p7mr5025745otp.79.1584551840947;
 Wed, 18 Mar 2020 10:17:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200312222454.5079-1-luiz.dentz@gmail.com> <20200312222454.5079-3-luiz.dentz@gmail.com>
 <9F37D24D-BB2A-45B4-922D-8E2E1AB31C2C@holtmann.org>
In-Reply-To: <9F37D24D-BB2A-45B4-922D-8E2E1AB31C2C@holtmann.org>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Wed, 18 Mar 2020 10:17:09 -0700
Message-ID: <CABBYNZJ70enQjBcMPkXaHP+p4dno4ADnafhutFwzB3458Ywgpg@mail.gmail.com>
Subject: Re: [PATCH 2/2] Bluetooth: Add BT_MODE socket option
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Marcel,

On Wed, Mar 18, 2020 at 4:19 AM Marcel Holtmann <marcel@holtmann.org> wrote=
:
>
> Hi Luiz,
>
> > This adds BT_MODE socket option which can be used to set L2CAP modes,
> > including modes only supported over LE which were not supported using
> > the L2CAP_OPTIONS.
> >
> > Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> > ---
> > include/net/bluetooth/bluetooth.h |  2 +
> > net/bluetooth/l2cap_sock.c        | 79 +++++++++++++++++++++++++------
> > 2 files changed, 66 insertions(+), 15 deletions(-)
> >
> > diff --git a/include/net/bluetooth/bluetooth.h b/include/net/bluetooth/=
bluetooth.h
> > index 1576353a2773..c361ec7b06aa 100644
> > --- a/include/net/bluetooth/bluetooth.h
> > +++ b/include/net/bluetooth/bluetooth.h
> > @@ -139,6 +139,8 @@ struct bt_voice {
> > #define BT_PHY_LE_CODED_TX    0x00002000
> > #define BT_PHY_LE_CODED_RX    0x00004000
> >
> > +#define BT_MODE                      15
> > +
>
> I would cleanly define the BT_MODE_xx constants here. They don=E2=80=99t =
need to match spec numbers from L2CAP actually. I would also leave the not =
used BR/EDR constants out of it and just add modes we do support.

Id leave the same values since it makes easier to fallback if BT_MODE
is not supported e.g. BT_IO_MODE would have to declare 2 different
namespaces for the new and the old sockopt.

> > __printf(1, 2)
> > void bt_info(const char *fmt, ...);
> > __printf(1, 2)
> > diff --git a/net/bluetooth/l2cap_sock.c b/net/bluetooth/l2cap_sock.c
> > index e43a90e05972..7a8a199c373d 100644
> > --- a/net/bluetooth/l2cap_sock.c
> > +++ b/net/bluetooth/l2cap_sock.c
> > @@ -619,6 +619,21 @@ static int l2cap_sock_getsockopt(struct socket *so=
ck, int level, int optname,
> >                       err =3D -EFAULT;
> >               break;
> >
> > +     case BT_MODE:
> > +             if (!enable_ecred) {
> > +                     err =3D -ENOPROTOOPT;
> > +                     break;
> > +             }
> > +
> > +             if (chan->chan_type !=3D L2CAP_CHAN_CONN_ORIENTED) {
> > +                     err =3D -EINVAL;
> > +                     break;
> > +             }
> > +
> > +             if (put_user(chan->mode, (u8 __user *) optval))
> > +                     err =3D -EFAULT;
> > +             break;
> > +
> >       default:
> >               err =3D -ENOPROTOOPT;
> >               break;
> > @@ -644,6 +659,29 @@ static bool l2cap_valid_mtu(struct l2cap_chan *cha=
n, u16 mtu)
> >       return true;
> > }
> >
> > +static int l2cap_set_mode(struct l2cap_chan *chan, u8 mode)
> > +{
> > +     switch (chan->mode) {
> > +     case L2CAP_MODE_LE_FLOWCTL:
> > +     case L2CAP_MODE_EXT_FLOWCTL:
> > +             break;
> > +     case L2CAP_MODE_BASIC:
> > +             clear_bit(CONF_STATE2_DEVICE, &chan->conf_state);
> > +             break;
> > +     case L2CAP_MODE_ERTM:
> > +     case L2CAP_MODE_STREAMING:
> > +             if (!disable_ertm)
> > +                     break;
> > +             /* fall through */
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     chan->mode =3D mode;
> > +
> > +     return 0;
> > +}
> > +
> > static int l2cap_sock_setsockopt_old(struct socket *sock, int optname,
> >                                    char __user *optval, unsigned int op=
tlen)
> > {
> > @@ -693,22 +731,9 @@ static int l2cap_sock_setsockopt_old(struct socket=
 *sock, int optname,
> >                       break;
> >               }
> >
> > -             chan->mode =3D opts.mode;
> > -             switch (chan->mode) {
> > -             case L2CAP_MODE_LE_FLOWCTL:
> > -                     break;
> > -             case L2CAP_MODE_BASIC:
> > -                     clear_bit(CONF_STATE2_DEVICE, &chan->conf_state);
> > -                     break;
> > -             case L2CAP_MODE_ERTM:
> > -             case L2CAP_MODE_STREAMING:
> > -                     if (!disable_ertm)
> > -                             break;
> > -                     /* fall through */
> > -             default:
> > -                     err =3D -EINVAL;
> > +             err =3D l2cap_set_mode(chan, opts.mode);
> > +             if (err)
> >                       break;
> > -             }
> >
>
> I would not yet try to break this out into a separate helper. I think L2C=
AP_OPTIONS should maybe just stay as it is. And as noted above, we define o=
ur own list of constants.

That would complicate userspace code a little to much since that means
we would have 2 different namespace for BT_IO_MODE, as mentioned about
Id keep the same values for modes as in L2CAP_OPTIONS just adding new
definitions names, otherwise we will need a new option for bt_io to
avoid the namespaces to overlap but I rather not do that as BT_IO_MODE
already maps quite well to BT_MODE.

> >               BT_DBG("mode 0x%2.2x", chan->mode);
> >
> > @@ -963,6 +988,30 @@ static int l2cap_sock_setsockopt(struct socket *so=
ck, int level, int optname,
> >
> >               break;
> >
> > +     case BT_MODE:
> > +             if (!enable_ecred) {
> > +                     err =3D -ENOPROTOOPT;
> > +                     break;
> > +             }
> > +
> > +             if (chan->chan_type !=3D L2CAP_CHAN_CONN_ORIENTED) {
> > +                     err =3D -EINVAL;
> > +                     break;
> > +             }
>
> Especially here I would also check if the mode is valid on the choose tra=
nsport. For me this would also mean we should require a bind() before allow=
ing to set the mode. So we have at least some idea what transport is planne=
d to be used.

I will make it check for BOUND state, though l2cap_set_mode does check
the mode already, or you are saying that if we do use a different
namespace we would have to convert, well I guess this further
reinforces my argument that making the values compatible makes things
a lot simpler.

> > +
> > +             if (get_user(opt, (u8 __user *) optval)) {
> > +                     err =3D -EFAULT;
> > +                     break;
> > +             }
> > +
> > +             err =3D l2cap_set_mode(chan, opt);
> > +             if (err)
> > +                     break;
> > +
> > +             BT_DBG("mode 0x%2.2x", chan->mode);
> > +
> > +             break;
> > +
> >       default:
> >               err =3D -ENOPROTOOPT;
> >               break;
>
> Regards
>
> Marcel
>


--=20
Luiz Augusto von Dentz
