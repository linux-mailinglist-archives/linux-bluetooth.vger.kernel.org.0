Return-Path: <linux-bluetooth+bounces-10212-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 293B7A2D5F9
	for <lists+linux-bluetooth@lfdr.de>; Sat,  8 Feb 2025 13:08:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 229903A873C
	for <lists+linux-bluetooth@lfdr.de>; Sat,  8 Feb 2025 12:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902CA24632C;
	Sat,  8 Feb 2025 12:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SmT3KjK6"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BD21D8A0D
	for <linux-bluetooth@vger.kernel.org>; Sat,  8 Feb 2025 12:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739016497; cv=none; b=ApCPCcg/lZLiARa40YnzGzeW4YxodyKmRRUAAuvC3rGoEp2QgCuFlqqti4hvX7tuONfLcmTFTs6bhPoDg4lQmx1usHqasVGYQ3f83QqqtZh+gw6UPbNVfp7mv11ltVVKASZRg6oYOvfbj323CeD+LEX35Hn9X2TmTB8fDF+1DB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739016497; c=relaxed/simple;
	bh=Ssnyo9VyIAM8pva2OYMvXc2B0RHjo82FxMW3rjVc928=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g2fRcLgP7HlkVLL+IyCy7zPVuwxoAUk24uek/6JIuPlELtjeReV+OLG6QMYAe9OEbg/WyRQqWOVjALXoHrszN0flQFEHNpdyR4gXnTHiVD9d1B19JFDHnqImpmh/AKR1ve4v0Q8SLD7Z8nVALfnZtgo4c6o8oexf4HslG5TY5+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SmT3KjK6; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6f6cc13d103so22279647b3.0
        for <linux-bluetooth@vger.kernel.org>; Sat, 08 Feb 2025 04:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739016494; x=1739621294; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Zt8Zd6LBkBERA7ooFuXtkwFywenX9KvT5J9Ev7NBbY=;
        b=SmT3KjK6n61WH8vpSRzd2AXNFvRG3uPm90XyYrfqLzyj9pVX2MhHlXn5zx79Q1MBSM
         qzuqBhp+CiLCDPGyS3JxFycfHc6x+HuD7NsFQQ1Z1V1tRVDQDUZRc3tUt0UVvMaJJPQ2
         AAdHNGzkq7MD0ff+i191jNzlPjRPLn+JLvqFnfoENRl124ttioaLOy5QIH8v0B5PDvMJ
         HnMZlbjsb2rsdU7mS9HMUx86haLKO+fMUwt9qQFmfdpMrUx2ji8mz6AtR/ZjRmUn/ILh
         BKFsp74xtvjR70w6/XqJREGkljtPZAGfDvz87KSNrZTWFM9e1aAj/WqQFY3yNlluNKa3
         qnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739016494; x=1739621294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Zt8Zd6LBkBERA7ooFuXtkwFywenX9KvT5J9Ev7NBbY=;
        b=LLgJtLoDE//AuDM32ZrGg3BRA6ZSYTcwBlPmGe5qFgFv0vBK1h2/PBBftUPnspmYQQ
         +m9z4yIziZ+zaRdDmOBp+RQeD3N1hXU3x+q27IND4qweLGfgnLjf0LLHFExgqUblM/K6
         QttFi4nCYScEV8NTdfxIeMZEf5F9xnx3smfgxl1O5HlLz2GYyhZ3KTo4FgwQm0tiDAS3
         w3ylRUv+cZaIqDw3Bm93SByXnB2ux/+gImtp5leIKA/q6nQKW/rdUf50wadGeAPVur7t
         RbXtaaXpI+kMWI25DCYcIySG6wlSbi/efN+0lKlRUngf4yBjboN87+7ayPBj/Oivy6Ss
         en/A==
X-Gm-Message-State: AOJu0YwXJ4K0TJ1xQ6EPee7ONitzWgLvNj/twSMJVbvJ4A/I3C/HTS5m
	CP+byvGt+zSgPGGBH8PKLKZPv5Rm2Ns9giRKayTssG3xH+TfCLDUxRo2xfmxFJpHXlSbjECVv9R
	ThVoPgYhZGPwZAIbdCWoKNo+KMGTbRxQNPHSD+vFb13dPpNhGxMyT
X-Gm-Gg: ASbGnctxuhEbcXA5SOrA/YJGPompIWeAnnVwwBNjqmmYzigR/THt/rJhAaEpzTMZqXC
	Lzna2IH9U8q/wPTFRpAuq0a1WUAFRKfpO/cV+LntszeRcBNJVRDC6fMpXsAM6PDN4BrdxtRo=
X-Google-Smtp-Source: AGHT+IHbc5t216DziMKA/qH4qbQlaaLaZ7//6CCbqp1bfIXzjDsCdH1m5P2aIHIqrw7iwj/5iV2+qvQ71f00ZH2+wco=
X-Received: by 2002:a05:690c:6f83:b0:6ef:9017:3cd8 with SMTP id
 00721157ae682-6f9b2a1a007mr64731167b3.35.1739016493845; Sat, 08 Feb 2025
 04:08:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122131925.v2.1.If6f14aa2512336173a53fc3552756cd8a332b0a3@changeid>
 <CABBYNZKoXT4u4=KJZUvG4g1OEi+xQ-LchiH8gvEZURNTzJoQDw@mail.gmail.com>
 <CADg1FFdt2mQsN4YjLTn=zp_+MahopN371EDiXQEbp+GTSaNtBg@mail.gmail.com>
 <CABBYNZJ__OMJZtEE0BFpaUdKPQv+Ym-OnsJj-kN=i_gZCeVN5w@mail.gmail.com>
 <CABBYNZ+aEpJNnz1OSAeqOxFf4s2AbvoRC+FJcRS6y5+g0Mmu+g@mail.gmail.com> <CADg1FFfhwAFD+mthx3qw_ZUtt6=1Y6pR+jX7+etwMhQFX9Ja+w@mail.gmail.com>
In-Reply-To: <CADg1FFfhwAFD+mthx3qw_ZUtt6=1Y6pR+jX7+etwMhQFX9Ja+w@mail.gmail.com>
From: Hsin-chen Chuang <chharry@google.com>
Date: Sat, 8 Feb 2025 20:07:46 +0800
X-Gm-Features: AWEUYZkkWZgY0WytBMUAMmTgG7Qnm_AicD8qLTXE5k2MIbtU_c1bdYcXfTl-BF8
Message-ID: <CADg1FFeLhtU=anU0_SbcSvSYLpYj6qJDSbuABu+RwWBafYufQA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] Bluetooth: Fix possible race with userspace of
 sysfs isoc_alt
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, 
	chromeos-bluetooth-upstreaming@chromium.org, 
	Hsin-chen Chuang <chharry@chromium.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Johan Hedberg <johan.hedberg@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Ying Hsu <yinghsu@chromium.org>, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luiz,

On Fri, Jan 31, 2025 at 6:23=E2=80=AFPM Hsin-chen Chuang <chharry@google.co=
m> wrote:
>
> Hi Luiz,
>
> Good point. Although the sysfs-bus-usb API only supports reading
> rather than writing the alt setting, I'll look for the opportunity to
> configure it through libusb first.
>
> Thanks
>
> On Sat, Jan 25, 2025 at 12:06=E2=80=AFAM Luiz Augusto von Dentz
> <luiz.dentz@gmail.com> wrote:
> >
> > Hi Hsin-chen,
> >
> > On Fri, Jan 24, 2025 at 10:54=E2=80=AFAM Luiz Augusto von Dentz
> > <luiz.dentz@gmail.com> wrote:
> > >
> > > Hi Hsin-chen,
> > >
> > > On Wed, Jan 22, 2025 at 11:57=E2=80=AFPM Hsin-chen Chuang <chharry@go=
ogle.com> wrote:
> > > >
> > > > Hi Luiz,
> > > >
> > > > On Thu, Jan 23, 2025 at 3:35=E2=80=AFAM Luiz Augusto von Dentz
> > > > <luiz.dentz@gmail.com> wrote:
> > > > >
> > > > > Hi Hsin-chen,
> > > > >
> > > > > On Wed, Jan 22, 2025 at 12:20=E2=80=AFAM Hsin-chen Chuang <chharr=
y@google.com> wrote:
> > > > > >
> > > > > > From: Hsin-chen Chuang <chharry@chromium.org>
> > > > > >
> > > > > > Use device group to avoid the racing. To reuse the group define=
d in
> > > > > > hci_sysfs.c, defined 2 callbacks switch_usb_alt_setting and
> > > > > > read_usb_alt_setting which are only registered in btusb.
> > > > > >
> > > > > > Fixes: b16b327edb4d ("Bluetooth: btusb: add sysfs attribute to =
control USB alt setting")
> > > > > > Signed-off-by: Hsin-chen Chuang <chharry@chromium.org>
> > > > > > ---
> > > > > >
> > > > > > (no changes since v1)
> > > > > >
> > > > > >  drivers/bluetooth/btusb.c        | 42 ++++++++----------------=
--------
> > > > > >  include/net/bluetooth/hci_core.h |  2 ++
> > > > > >  net/bluetooth/hci_sysfs.c        | 33 ++++++++++++++++++++++++=
+
> > > > > >  3 files changed, 45 insertions(+), 32 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btus=
b.c
> > > > > > index 75a0f15819c4..bf210275e5b7 100644
> > > > > > --- a/drivers/bluetooth/btusb.c
> > > > > > +++ b/drivers/bluetooth/btusb.c
> > > > > > @@ -2221,6 +2221,13 @@ static int btusb_switch_alt_setting(stru=
ct hci_dev *hdev, int new_alts)
> > > > > >         return 0;
> > > > > >  }
> > > > > >
> > > > > > +static int btusb_read_alt_setting(struct hci_dev *hdev)
> > > > > > +{
> > > > > > +       struct btusb_data *data =3D hci_get_drvdata(hdev);
> > > > > > +
> > > > > > +       return data->isoc_altsetting;
> > > > > > +}
> > > > > > +
> > > > > >  static struct usb_host_interface *btusb_find_altsetting(struct=
 btusb_data *data,
> > > > > >                                                         int alt=
)
> > > > > >  {
> > > > > > @@ -3650,32 +3657,6 @@ static const struct file_operations forc=
e_poll_sync_fops =3D {
> > > > > >         .llseek         =3D default_llseek,
> > > > > >  };
> > > > > >
> > > > > > -static ssize_t isoc_alt_show(struct device *dev,
> > > > > > -                            struct device_attribute *attr,
> > > > > > -                            char *buf)
> > > > > > -{
> > > > > > -       struct btusb_data *data =3D dev_get_drvdata(dev);
> > > > > > -
> > > > > > -       return sysfs_emit(buf, "%d\n", data->isoc_altsetting);
> > > > > > -}
> > > > > > -
> > > > > > -static ssize_t isoc_alt_store(struct device *dev,
> > > > > > -                             struct device_attribute *attr,
> > > > > > -                             const char *buf, size_t count)
> > > > > > -{
> > > > > > -       struct btusb_data *data =3D dev_get_drvdata(dev);
> > > > > > -       int alt;
> > > > > > -       int ret;
> > > > > > -
> > > > > > -       if (kstrtoint(buf, 10, &alt))
> > > > > > -               return -EINVAL;
> > > > > > -
> > > > > > -       ret =3D btusb_switch_alt_setting(data->hdev, alt);
> > > > > > -       return ret < 0 ? ret : count;
> > > > > > -}
> > > > > > -
> > > > > > -static DEVICE_ATTR_RW(isoc_alt);
> > > > > > -
> > > > > >  static int btusb_probe(struct usb_interface *intf,
> > > > > >                        const struct usb_device_id *id)
> > > > > >  {
> > > > > > @@ -4040,9 +4021,8 @@ static int btusb_probe(struct usb_interfa=
ce *intf,
> > > > > >                 if (err < 0)
> > > > > >                         goto out_free_dev;
> > > > > >
> > > > > > -               err =3D device_create_file(&intf->dev, &dev_att=
r_isoc_alt);
> > > > > > -               if (err)
> > > > > > -                       goto out_free_dev;
> > > > > > +               hdev->switch_usb_alt_setting =3D btusb_switch_a=
lt_setting;
> > > > > > +               hdev->read_usb_alt_setting =3D btusb_read_alt_s=
etting;
> > > > > >         }
> > > > > >
> > > > > >         if (IS_ENABLED(CONFIG_BT_HCIBTUSB_BCM) && data->diag) {
> > > > > > @@ -4089,10 +4069,8 @@ static void btusb_disconnect(struct usb_=
interface *intf)
> > > > > >         hdev =3D data->hdev;
> > > > > >         usb_set_intfdata(data->intf, NULL);
> > > > > >
> > > > > > -       if (data->isoc) {
> > > > > > -               device_remove_file(&intf->dev, &dev_attr_isoc_a=
lt);
> > > > > > +       if (data->isoc)
> > > > > >                 usb_set_intfdata(data->isoc, NULL);
> > > > > > -       }
> > > > > >
> > > > > >         if (data->diag)
> > > > > >                 usb_set_intfdata(data->diag, NULL);
> > > > > > diff --git a/include/net/bluetooth/hci_core.h b/include/net/blu=
etooth/hci_core.h
> > > > > > index f756fac95488..5d3ec5ff5adb 100644
> > > > > > --- a/include/net/bluetooth/hci_core.h
> > > > > > +++ b/include/net/bluetooth/hci_core.h
> > > > > > @@ -641,6 +641,8 @@ struct hci_dev {
> > > > > >                                      struct bt_codec *codec, __=
u8 *vnd_len,
> > > > > >                                      __u8 **vnd_data);
> > > > > >         u8 (*classify_pkt_type)(struct hci_dev *hdev, struct sk=
_buff *skb);
> > > > > > +       int (*switch_usb_alt_setting)(struct hci_dev *hdev, int=
 new_alts);
> > > > > > +       int (*read_usb_alt_setting)(struct hci_dev *hdev);
> > > > > >  };
> > > > > >
> > > > > >  #define HCI_PHY_HANDLE(handle) (handle & 0xff)
> > > > > > diff --git a/net/bluetooth/hci_sysfs.c b/net/bluetooth/hci_sysf=
s.c
> > > > > > index 041ce9adc378..887aa1935b1e 100644
> > > > > > --- a/net/bluetooth/hci_sysfs.c
> > > > > > +++ b/net/bluetooth/hci_sysfs.c
> > > > > > @@ -102,8 +102,41 @@ static ssize_t reset_store(struct device *=
dev, struct device_attribute *attr,
> > > > > >  }
> > > > > >  static DEVICE_ATTR_WO(reset);
> > > > > >
> > > > > > +static ssize_t isoc_alt_show(struct device *dev,
> > > > > > +                            struct device_attribute *attr,
> > > > > > +                            char *buf)
> > > > > > +{
> > > > > > +       struct hci_dev *hdev =3D to_hci_dev(dev);
> > > > > > +
> > > > > > +       if (hdev->read_usb_alt_setting)
> > > > > > +               return sysfs_emit(buf, "%d\n", hdev->read_usb_a=
lt_setting(hdev));
> > > > > > +
> > > > > > +       return -ENODEV;
> > > > > > +}
> > > > > > +
> > > > > > +static ssize_t isoc_alt_store(struct device *dev,
> > > > > > +                             struct device_attribute *attr,
> > > > > > +                             const char *buf, size_t count)
> > > > > > +{
> > > > > > +       struct hci_dev *hdev =3D to_hci_dev(dev);
> > > > > > +       int alt;
> > > > > > +       int ret;
> > > > > > +
> > > > > > +       if (kstrtoint(buf, 10, &alt))
> > > > > > +               return -EINVAL;
> > > > > > +
> > > > > > +       if (hdev->switch_usb_alt_setting) {
> > > > > > +               ret =3D hdev->switch_usb_alt_setting(hdev, alt)=
;
> > > > > > +               return ret < 0 ? ret : count;
> > > > > > +       }
> > > > > > +
> > > > > > +       return -ENODEV;
> > > > > > +}
> > > > > > +static DEVICE_ATTR_RW(isoc_alt);
> > > > > > +
> > > > > >  static struct attribute *bt_host_attrs[] =3D {
> > > > > >         &dev_attr_reset.attr,
> > > > > > +       &dev_attr_isoc_alt.attr,
> > > > > >         NULL,
> > > > > >  };
> > > > > >  ATTRIBUTE_GROUPS(bt_host);
> > > > >
> > > > > While this fixes the race it also forces the inclusion of an attr=
ibute
> > > > > that is driver specific, so I wonder if we should introduce some
> > > > > internal interface to register driver specific entries like this.
> > > >
> > > > Do you mean you prefer the original interface that only exports the
> > > > attribute when isoc_altsetting is supported?
> > > > Agree it makes more sense but I hit the obstacle: hci_init_sysfs is
> > > > called earlier than data->isoc is determined. I need some time to
> > > > verify whether changing the order won't break anything.
> > >
> > > We might have to do something like the following within hci_init_sysf=
s:
> > >
> > > if (hdev->isoc_alt)
> > >     dev->type =3D bt_host_isoc_alt
> > > else
> > >     dev->type =3D bt_host
> > >
> > > Now perhaps instead of adding the callbacks to hdev we add the
> > > attribute itself, btw did you check if there isn't a sysfs entry to
> > > interact with USB alternate settings? Because contrary to reset this
> > > actually operates directly on the driver bus so it sort of made more
> > > sense to me that this would be handled by USB rather than Bluetooth.

Unfortunately I tried the libusb API and it requires detaching the
kernel driver, which means the user channel would be broken. I'll send
out a new version which addresses the above comments, thanks.

> >
> > A quick git grep shows that this exists:
> >
> > Documentation/ABI/testing/sysfs-bus-usb:What:
> > /sys/bus/usb/devices/usbX/bAlternateSetting
> >
> > > > >
> > > > > > --
> > > > > > 2.48.1.262.g85cc9f2d1e-goog
> > > > > >
> > > > >
> > > > >
> > > > > --
> > > > > Luiz Augusto von Dentz
> > >
> > >
> > >
> > > --
> > > Luiz Augusto von Dentz
> >
> >
> >
> > --
> > Luiz Augusto von Dentz

--=20
Best Regards,
Hsin-chen

