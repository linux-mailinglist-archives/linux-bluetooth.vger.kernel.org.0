Return-Path: <linux-bluetooth+bounces-4233-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C368B8EA9
	for <lists+linux-bluetooth@lfdr.de>; Wed,  1 May 2024 18:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0897282B9D
	for <lists+linux-bluetooth@lfdr.de>; Wed,  1 May 2024 16:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D16318030;
	Wed,  1 May 2024 16:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WwAJVDp/"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA4EE552
	for <linux-bluetooth@vger.kernel.org>; Wed,  1 May 2024 16:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714582676; cv=none; b=D6Ixrj2CM4pXDbmBQF76mqU4RwkkvEyZw3iJMnPeI07CJ2aKA/qpC933ts1Pa4ml31xC8/OgIcQyoIJwc41Rf2KM9S/u+zTU3+80ggOyXA6mMF/XoOfsoYpnimYZqCGXKeZALC5IU88v7SsAgDxljgnA4rsCOJg7tg1kLRfcyGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714582676; c=relaxed/simple;
	bh=Igg3ogpEtjG/nj+x4ek6tTlMBZm0RI3cTvuH50oPoEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQ9ZRZSugaRHpNMBHh+bndMi9VpyOS/odQjPBkFgocTmQh/RkbIYYL2xP0GK+fhHBVxH/9mCp3MHIVwk5xezgMPtq9pt7I68+M2vFwaerWEuZd7pMpbt2OFaEaYnYHFrGS6GF7hvjj/lKAngVUfomwp6QI4usU1a+MxjR9PTv0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WwAJVDp/; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-61b3be24dd9so8075057b3.0
        for <linux-bluetooth@vger.kernel.org>; Wed, 01 May 2024 09:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714582672; x=1715187472; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e53c4ZfjuiD8uSeDNlJwcj0WQiM0hIsBb4t4yswkpHI=;
        b=WwAJVDp/V7L0SvctvEQodb2i/da/qr3l/Fdda7pD6uym4jn1WSQ8ysqa090hOHVs3g
         qcqQjHzCFrxWer93OnTwdO8DIRsHVGFI2trgAa4LNXrt+2RoUCDJsc2JMC7Nrg8VCKhe
         LeM9XZtqBG+lvAKHu3YjdURIIm/Uh1Pach3Z8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714582672; x=1715187472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e53c4ZfjuiD8uSeDNlJwcj0WQiM0hIsBb4t4yswkpHI=;
        b=CfWb8DDsNkxHWPKsmJoTkz0wJNTV351JInw0XbRwE70ARb0bjhNIsKDaIQcXcqKvvS
         2AZYodxjGDOgXirRaC7i2hPjW3dKSm+SuWBMydFhUt4e6z7afJ2/82mCOLrIWCEXt4D+
         a4Uwl4+hJTNePQVJqw/wlJWKInicBZ5SgUupMtvT7dNoN9IFQ1zt/RGxSsQ5btl2f6Nm
         HfIi9ddRrAMPoUpckbSZ7ZI36pc9cX5/YN6IM6qqBOh3OXZAdl6YBkH+ezed55KA/085
         b9K8votKxmFpEcMJataBa3/jRO6F7EQTArHi3CPBWS5U38FjcXKFJlVSV6GF7785tw5a
         WReQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfY4YlkFAEKlrznqB7rviL5lFEW89E7q/7NO7PAqKJFFXb8L6sq+hj/H3opFkrLKMfI4Uv/g7TJoGFmZV4AcToDC5BB87GsT68PlH19hjA
X-Gm-Message-State: AOJu0YxPjMDYkrCNUZZR2XL/ysjZVFvuzJUKRbFGYf4udwXcmc2g/LEJ
	2FNsEjA5nRmccuIps6rLF2lYM/0JeHbu7+ehzBATQ3koAU094ULlK8z14eudcsxhaWuABdsfc31
	H/LiPlkr8b15ieHHsLN9zcW8AyNQ0kbBRsoD4
X-Google-Smtp-Source: AGHT+IFuA3Q+YbDuNF/9QYr5yOvIr8cB7MEkeT1KWgqaAjv39aL23wCgk0YOftla/SpoVW4byT4sfowNtyQmyiyVDOY=
X-Received: by 2002:a81:b721:0:b0:61a:d5b7:1e1c with SMTP id
 v33-20020a81b721000000b0061ad5b71e1cmr170112ywh.6.1714582672674; Wed, 01 May
 2024 09:57:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240422152500.1.I8939e49084a6fef78496eb73edafdf3c2c4afbf4@changeid>
 <CABBYNZLCjrJUiVzNf53XYM-ZHWL6TZD4yFNtNGOuYi=6s5Q+OA@mail.gmail.com>
 <CAJQfnxHUW+MdJUp9VCrF2Nq_-JZrd7mKBR9NdDoo0SOvgH5WUQ@mail.gmail.com>
 <CANFp7mU2Chj_cZ_26kfM8TE1OToZzUeFKz61D7j-0ykMBQeG4A@mail.gmail.com>
 <CABBYNZJK6zyYYmi66prKMdF69HkwfhOvMeB0TnEcGYRLTTr2jw@mail.gmail.com>
 <CANFp7mWWYmm9gPrsDBho3sDGu5q_fQztR+LJJUWQ_Faw0QRXFQ@mail.gmail.com> <CABBYNZLtDc2MVh8f=2vLK6czfiz8wN=940exiw+fDv-fkNkqJA@mail.gmail.com>
In-Reply-To: <CABBYNZLtDc2MVh8f=2vLK6czfiz8wN=940exiw+fDv-fkNkqJA@mail.gmail.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Wed, 1 May 2024 09:57:41 -0700
Message-ID: <CANFp7mUFn3U6z1b2+tMPAxHVOHQsazzo8tZZfFBOpCUaNMsP3A@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btusb: Add debugfs to force toggling remote wakeup
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Archie Pusaka <apusaka@google.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	Johan Hedberg <johan.hedberg@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, 
	CrosBT Upstreaming <chromeos-bluetooth-upstreaming@chromium.org>, 
	Archie Pusaka <apusaka@chromium.org>, Abhishek Pandit-Subedi <abhishekpandit@google.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 1, 2024 at 9:52=E2=80=AFAM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Abhishek,
>
> On Wed, May 1, 2024 at 12:34=E2=80=AFPM Abhishek Pandit-Subedi
> <abhishekpandit@chromium.org> wrote:
> >
> > On Tue, Apr 30, 2024 at 9:46=E2=80=AFAM Luiz Augusto von Dentz
> > <luiz.dentz@gmail.com> wrote:
> > >
> > > Hi Abhishek,
> > >
> > > On Fri, Apr 26, 2024 at 1:04=E2=80=AFPM Abhishek Pandit-Subedi
> > > <abhishekpandit@chromium.org> wrote:
> > > >
> > > > On Fri, Apr 26, 2024 at 2:08=E2=80=AFAM 'Archie Pusaka' via ChromeO=
S Bluetooth
> > > > Upstreaming <chromeos-bluetooth-upstreaming@chromium.org> wrote:
> > > > >
> > > > > Hi Luiz,
> > > > >
> > > > > On Thu, 25 Apr 2024 at 03:05, Luiz Augusto von Dentz
> > > > > <luiz.dentz@gmail.com> wrote:
> > > > > >
> > > > > > Hi Archie,
> > > > > >
> > > > > > On Mon, Apr 22, 2024 at 3:25=E2=80=AFAM Archie Pusaka <apusaka@=
google.com> wrote:
> > > > > > >
> > > > > > > From: Archie Pusaka <apusaka@chromium.org>
> > > > > > >
> > > > > > > Sometimes we want the controller to not wake the host up, e.g=
. to
> > > > > > > save the battery. Add some debugfs knobs to force the wake by=
 BT
> > > > > > > behavior.
> > > > > > >
> > > > > > > Signed-off-by: Archie Pusaka <apusaka@chromium.org>
> > > > > > > Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@google.co=
m>
> > > > > > >
> > > > > > > ---
> > > > > > >
> > > > > > >  drivers/bluetooth/btusb.c | 19 +++++++++++++++++++
> > > > > > >  1 file changed, 19 insertions(+)
> > > > > > >
> > > > > > > diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/bt=
usb.c
> > > > > > > index 8bede0a335668..846b15fc3c04c 100644
> > > > > > > --- a/drivers/bluetooth/btusb.c
> > > > > > > +++ b/drivers/bluetooth/btusb.c
> > > > > > > @@ -873,6 +873,9 @@ struct btusb_data {
> > > > > > >         unsigned cmd_timeout_cnt;
> > > > > > >
> > > > > > >         struct qca_dump_info qca_dump;
> > > > > > > +
> > > > > > > +       bool force_enable_remote_wake;
> > > > > > > +       bool force_disable_remote_wake;
> > > > > > >  };
> > > > > > >
> > > > > > >  static void btusb_reset(struct hci_dev *hdev)
> > > > > > > @@ -4596,6 +4599,10 @@ static int btusb_probe(struct usb_inte=
rface *intf,
> > > > > > >
> > > > > > >         debugfs_create_file("force_poll_sync", 0644, hdev->de=
bugfs, data,
> > > > > > >                             &force_poll_sync_fops);
> > > > > > > +       debugfs_create_bool("force_enable_remote_wake", 0644,=
 hdev->debugfs,
> > > > > > > +                           &data->force_enable_remote_wake);
> > > > > > > +       debugfs_create_bool("force_disable_remote_wake", 0644=
, hdev->debugfs,
> > > > > > > +                           &data->force_disable_remote_wake)=
;
> > > > > > >
> > > > > > >         return 0;
> > > > > > >
> > > > > > > @@ -4702,6 +4709,18 @@ static int btusb_suspend(struct usb_in=
terface *intf, pm_message_t message)
> > > > > > >                 }
> > > > > > >         }
> > > > > > >
> > > > > > > +       if (!PMSG_IS_AUTO(message)) {
> > > > > > > +               if (data->force_enable_remote_wake) {
> > > > > > > +                       data->udev->do_remote_wakeup =3D 1;
> > > > > > > +                       if (test_bit(BTUSB_WAKEUP_AUTOSUSPEND=
, &data->flags))
> > > > > > > +                               data->udev->reset_resume =3D =
0;
> > > > > > > +               } else if (data->force_disable_remote_wake) {
> > > > > > > +                       data->udev->do_remote_wakeup =3D 0;
> > > > > > > +                       if (test_bit(BTUSB_WAKEUP_AUTOSUSPEND=
, &data->flags))
> > > > > > > +                               data->udev->reset_resume =3D =
1;
> > > > > > > +               }
> > > > > > > +       }
> > > > > > > +
> > > > > > >         return 0;
> > > > > > >  }
> > > > > > >
> > > > > > > --
> > > > > > > 2.44.0.769.g3c40516874-goog
> > > > > >
> > > > > > There is a D-Bus interface available to overwrite the wakeup se=
tting:
> > > > > >
> > > > > > https://github.com/bluez/bluez/blob/master/doc/org.bluez.Device=
.rst#boolean-wakeallowed-readwrite
> > > > > >
> > > > > > Or do you want a master switch for it? On the other hand aren't=
 we
> > > > > > getting into the rfkill area if you really want to switch off r=
adio
> > > > > > activity while suspended? That seems like a better idea then ju=
st
> > > > > > disable remote wakeup.
> > > >
> > > > This DBUS api is different from the quirk this is introducing.
> > > >
> > > > The `Wake Allowed` field in D-bus controls whether we add the addre=
ss
> > > > to the Classic Event Filter (HIDP) or LE Filter Accept List (HOGP) =
but
> > > > not whether we allow wake at the transport level (which is why
> > > > hdev->wakeup exists).
> > > >
> > > > This change specifically addresses a quirk with Realtek chipsets:
> > > > RTL8822/RTL8852 will do "global shutdown" and power off Bluetooth i=
f
> > > > USB Remote Wake bit is not set. The USB remote_wake bit is normally
> > > > set by the USB stack based on whether device_may_wakeup(udev) =3D=
=3D true.
> > > > This means that RTL88x2 will lose power around suspend/resume if th=
ere
> > > > are no wake capable devices connected.
> > > >
> > > > ChromeOS decided to use idle power and resume-time to determine
> > > > whether to allow remote wake or not for these chipsets and we want =
to
> > > > move this control to userspace so that we don't have to hold CHROMI=
UM
> > > > patches in the kernel applying this policy (we want udev rules
> > > > instead). RTL8852 gets force enabled remote wake because the
> > > > RESET_RESUME behavior of this chip would otherwise increase our res=
ume
> > > > time >1s which breaks one of our platform requirements.
> > > >
> > > > The end-goal of these changes:
> > > > * We detect RTL8822 or RTL8852 with udev and apply the right policy=
.
> > > > * RTL8822 gets force_disable_remote_wake (idle power consumption to=
o
> > > > high otherwise)
> > > > * RTL8852 gets force_enable_remote_wake (resume time too long other=
wise)
> > >
> > > Got it, but the suggestion was to instead of using
> > > force_enable_remote_wake, which is sort of non-standard, why don't
> > > Chrome OS simply use rkill interface to tell the driver to shutdown?
> > > On resume then you can just unblock via rfkill that should have the
> > > same result as using force_enable_remote_wake, well except if there i=
s
> > > a bug in the driver that is not handling rfkill as a 'global
> > > shutdown', but then you need to fix the driver not introduce yet
> > > another debugfs entry to bypass it.
> >
> > Did you mean `force_disable_remote_wake`? rfkill will work for that
> > around system suspend. We preferred not to do it because we don't use
> > userspace suspend signals with Bluez today (preferring the kernel
> > suspend notifier).
>
> Yeah, that said rfkill has nothing to do with suspend afaik, it is
> more for achieving flight mode and as far I know it is a kernel
> interface.
>
> > `force_enable_remote_wake` still needs debugfs as rfkill can't force
> > an interface to stay awake as far as I know.
>
> You mixing up, Im not saying to use rfkill to enable/disable wake
> support, the remains the same, what changes is that if you want to
> overwrite that it just use rfkill to block the traffic while suspended
> that way wake being enable or not doesn't matter since the controller
> radio shall be off if it is blocked.

Ah, the problem with resume time is not how long it takes for the
Bluetooth link to come up. The problem is that it takes >1s for all
the driver resume callbacks to run after a wake IRQ occurs and blocks
user space from running at all.

The root cause seems to be that reset-resume (which correctly gets set
for Realtek) will block USB port resume and, since the resume path
seems to be synchronous, it blocks other drivers from resuming too.

>
> >
> > >
> > > > Hope this provides enough context for why this change is necessary.
> > > >
> > > > >
> > > > > Yes, the initial idea was a master switch.
> > > > > Thanks for your suggestions.
> > > > > Let me discuss it with Abhishek.
> > > > > >
> > > > > > --
> > > > > > Luiz Augusto von Dentz
> > > > >
> > > > > Thanks,
> > > > > Archie
> > > > >
> > > > > --
> > > > > You received this message because you are subscribed to the Googl=
e Groups "ChromeOS Bluetooth Upstreaming" group.
> > > > > To unsubscribe from this group and stop receiving emails from it,=
 send an email to chromeos-bluetooth-upstreaming+unsubscribe@chromium.org.
> > > > > To post to this group, send email to chromeos-bluetooth-upstreami=
ng@chromium.org.
> > > > > To view this discussion on the web visit https://groups.google.co=
m/a/chromium.org/d/msgid/chromeos-bluetooth-upstreaming/CAJQfnxHUW%2BMdJUp9=
VCrF2Nq_-JZrd7mKBR9NdDoo0SOvgH5WUQ%40mail.gmail.com.
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

