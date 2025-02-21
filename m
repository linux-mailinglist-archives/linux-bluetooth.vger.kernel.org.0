Return-Path: <linux-bluetooth+bounces-10557-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10686A3EA47
	for <lists+linux-bluetooth@lfdr.de>; Fri, 21 Feb 2025 02:43:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46F283B293E
	for <lists+linux-bluetooth@lfdr.de>; Fri, 21 Feb 2025 01:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F2E515530C;
	Fri, 21 Feb 2025 01:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c7+xkN4z"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C544213B787
	for <linux-bluetooth@vger.kernel.org>; Fri, 21 Feb 2025 01:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740102166; cv=none; b=tkw1HYd0gZIicF+78iD6DQlJkegcQQbOT5zsuEiJD6pWXbgPrXurac7XRa8Nk2rYf8oPqVAX1PXflIzySuEJh1D9x8PONaiH/Ln4lwn7+/DnI71/Xy8oSiv/z0n9H5HY/6wdoL1FFSyxmLdMFFskujBUNZlhhKwpB3ZQTHCxqnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740102166; c=relaxed/simple;
	bh=qsb/qAM/w6ThPYz0i3XfWMcwV6tAC/0iGnqjqFvKufY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UatB6BadHZqUsveOYdkk0kNobMINTUYY+S9iH9GWZWAyM6SNqZUXfKivNWH8CSfCHkpsnMZOqxwlNx32LBuftDeIuPOxd5N3MSL3t2lAI0OeQO3Vzah42huIPhNwunM+kpkCY54/8dtVy03N/WF5/xrcx7MnOkmi/8a/2SXBkQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c7+xkN4z; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e549b0f8d57so1469318276.3
        for <linux-bluetooth@vger.kernel.org>; Thu, 20 Feb 2025 17:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740102163; x=1740706963; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cq5wW7Mlxo5wbIWOTLy11yQHQNcqPwg4CfQNw3smvx8=;
        b=c7+xkN4zus6B77uMCft+l8gAl5H5NPR7G24krwTEGv8A2GwQVQckfvlHVKp63Hw5Ja
         J147u1DPkKIh9gmaaQqA+rfQUvD6UNGJAHWCWwcuHq3IJRclkBcyz4lKoFwpOxWbZDVa
         Xcisx3womfsK01Hx5+6mehkSREZDQ27PpYa4AY8FeqW0ixNCeXIpq3xxxKv8fleKyEiQ
         SpzmAULpMf4OOfFGnckgntitJpdjQdZDezzgElAZukQcyI0xBBSEmzp4cQInwvbEgUlr
         AfaKVUjfX62Za+iop9h1jJK4mW4Z5umijpmSXjwo+ce4zIg6r3javDjZjgq5DpTJ4WNo
         T4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740102163; x=1740706963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cq5wW7Mlxo5wbIWOTLy11yQHQNcqPwg4CfQNw3smvx8=;
        b=pA08l5YGUEKjm3rx3aFYIKMg0m+Rw0Qt5XoueIIbuARvpglwsGp7ABQRZgAFvjKTY4
         c9fnKCTDt+mlH6G1Hx7Y2ADpoIROZbRvkp122mk0n9XdY1nGOVJO4kyYqfKlmQVCiGCa
         raOtVS/pCBvxmfmTpB/LO+WP96YZg7jipve9MGO18y9/+RAoGw6PR3Cx1Siv5807pBM6
         3+W0P9tj/L56GdTNCOaavtf2vY9vWWegzktzghb2GGmKXwyds5d5RRL3ItvnThiYzd2g
         0nTONwBzPeZP0hw2+t3XdXYtLggi+yiOubrWHXZ3jT/KzjhUB9CJL/nJFlvR7Muyiu16
         7xww==
X-Gm-Message-State: AOJu0YzeK6Xjlj94cDnRWNE2/ahTxXBgb2j7ARe4ub4h0zzWz2s270KD
	bpxNIXSsI0VXuWDgcFa7/IDzr/7fpgLVUz5bMXkt3W91wFnLA9A731rS8aa3uUEuE7iZGnCVytg
	DfslBQG/ZB9q9ghzwU4MUv/usnrC403ygZlqjXW+hQsKb5KMW1Q==
X-Gm-Gg: ASbGncuWESCRElPoLVFqzAkoxRjiwNKqg5V7EKjpRathmvqjKUUp4vRS/M91XaOO567
	ZudA6q0tvzvSVf3G4BtIZ5g4gLWK+uRWVg2LkxjhV45S4elgNwF63kC60aEI9sGHpal1o4g4w2j
	7HXsB/YVzN
X-Google-Smtp-Source: AGHT+IHcO3NCLnBWYIcEnl3NgEG/pKUlRKt5tc+j8CKkuF05USkQ/01cpeODP4jWohKAsfkPcPOYjh1IQ0HbztY5gr8=
X-Received: by 2002:a05:6902:230d:b0:e5a:cece:f38d with SMTP id
 3f1490d57ef6-e5e245e77edmr1162202276.13.1740102163233; Thu, 20 Feb 2025
 17:42:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250219220255.v7.1.If6f14aa2512336173a53fc3552756cd8a332b0a3@changeid>
In-Reply-To: <20250219220255.v7.1.If6f14aa2512336173a53fc3552756cd8a332b0a3@changeid>
From: Hsin-chen Chuang <chharry@google.com>
Date: Fri, 21 Feb 2025 09:42:16 +0800
X-Gm-Features: AWEUYZlQLidDoKhTdpV_KHzPWs-VkWpNfJwvrhAjNMOnNOTN7JpIBytEj46gzRk
Message-ID: <CADg1FFfCjXupCu3VaGprdVtQd3HFn3+rEANBCaJhSZQVkm9e4g@mail.gmail.com>
Subject: Re: [PATCH v7] Bluetooth: Fix possible race with userspace of sysfs isoc_alt
To: linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com, 
	gregkh@linuxfoundation.org
Cc: chromeos-bluetooth-upstreaming@chromium.org, 
	Hsin-chen Chuang <chharry@chromium.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Johan Hedberg <johan.hedberg@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Ying Hsu <yinghsu@chromium.org>, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 10:03=E2=80=AFPM Hsin-chen Chuang <chharry@google.c=
om> wrote:
>
> From: Hsin-chen Chuang <chharry@chromium.org>
>
> Expose the isoc_alt attr with device group to avoid the racing.
>
> Now we create a dev node for btusb. The isoc_alt attr belongs to it and
> it also becomes the parent device of hci dev.
>
> Fixes: b16b327edb4d ("Bluetooth: btusb: add sysfs attribute to control US=
B alt setting")
> Signed-off-by: Hsin-chen Chuang <chharry@chromium.org>
> ---
>
> Changes in v7:
> - Use container_of() rather than dev_set_drvdata() + dev_get_drvdata()
>
> Changes in v6:
> - Fix EXPORT_SYMBOL -> EXPORT_SYMBOL_GPL
> - Use container_of() rather than dev_set_drvdata() + dev_get_drvdata()
>
> Changes in v5:
> - Merge the ABI doc into this patch
> - Manage the driver data with device
>
> Changes in v4:
> - Create a dev node for btusb. It's now hci dev's parent and the
>   isoc_alt now belongs to it.
> - Since the changes is almost limitted in btusb, no need to add the
>   callbacks in hdev anymore.
>
> Changes in v3:
> - Make the attribute exported only when the isoc_alt is available.
> - In btusb_probe, determine data->isoc before calling hci_alloc_dev_priv
>   (which calls hci_init_sysfs).
> - Since hci_init_sysfs is called before btusb could modify the hdev,
>   add new argument add_isoc_alt_attr for btusb to inform hci_init_sysfs.
>
> Changes in v2:
> - The patch has been removed from series
>
>  .../ABI/stable/sysfs-class-bluetooth          |  13 ++
>  drivers/bluetooth/btusb.c                     | 114 +++++++++++++-----
>  include/net/bluetooth/hci_core.h              |   1 +
>  net/bluetooth/hci_sysfs.c                     |   3 +-
>  4 files changed, 103 insertions(+), 28 deletions(-)
>
> diff --git a/Documentation/ABI/stable/sysfs-class-bluetooth b/Documentati=
on/ABI/stable/sysfs-class-bluetooth
> index 36be02471174..c1024c7c4634 100644
> --- a/Documentation/ABI/stable/sysfs-class-bluetooth
> +++ b/Documentation/ABI/stable/sysfs-class-bluetooth
> @@ -7,3 +7,16 @@ Description:   This write-only attribute allows users to=
 trigger the vendor reset
>                 The reset may or may not be done through the device trans=
port
>                 (e.g., UART/USB), and can also be done through an out-of-=
band
>                 approach such as GPIO.
> +
> +What:          /sys/class/bluetooth/btusb<usb-intf>/isoc_alt
> +Date:          13-Feb-2025
> +KernelVersion: 6.13
> +Contact:       linux-bluetooth@vger.kernel.org
> +Description:   This attribute allows users to configure the USB Alternat=
e setting
> +               for the specific HCI device. Reading this attribute retur=
ns the
> +               current setting, and writing any supported numbers would =
change
> +               the setting. See the USB Alternate setting definition in =
Bluetooth
> +               core spec 5, vol 4, part B, table 2.1.
> +               If the HCI device is not yet init-ed, the write fails wit=
h -ENODEV.
> +               If the data is not a valid number, the write fails with -=
EINVAL.
> +               The other failures are vendor specific.
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index de3fa725d210..495f0ceba95d 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -920,6 +920,8 @@ struct btusb_data {
>         int oob_wake_irq;   /* irq for out-of-band wake-on-bt */
>
>         struct qca_dump_info qca_dump;
> +
> +       struct device dev;
>  };
>
>  static void btusb_reset(struct hci_dev *hdev)
> @@ -3682,7 +3684,7 @@ static ssize_t isoc_alt_show(struct device *dev,
>                              struct device_attribute *attr,
>                              char *buf)
>  {
> -       struct btusb_data *data =3D dev_get_drvdata(dev);
> +       struct btusb_data *data =3D container_of(dev, struct btusb_data, =
dev);
>
>         return sysfs_emit(buf, "%d\n", data->isoc_altsetting);
>  }
> @@ -3691,10 +3693,13 @@ static ssize_t isoc_alt_store(struct device *dev,
>                               struct device_attribute *attr,
>                               const char *buf, size_t count)
>  {
> -       struct btusb_data *data =3D dev_get_drvdata(dev);
> +       struct btusb_data *data =3D container_of(dev, struct btusb_data, =
dev);
>         int alt;
>         int ret;
>
> +       if (!data->hdev)
> +               return -ENODEV;
> +
>         if (kstrtoint(buf, 10, &alt))
>                 return -EINVAL;
>
> @@ -3704,6 +3709,36 @@ static ssize_t isoc_alt_store(struct device *dev,
>
>  static DEVICE_ATTR_RW(isoc_alt);
>
> +static struct attribute *btusb_sysfs_attrs[] =3D {
> +       NULL,
> +};
> +ATTRIBUTE_GROUPS(btusb_sysfs);
> +
> +static void btusb_sysfs_release(struct device *dev)
> +{
> +       struct btusb_data *data =3D container_of(dev, struct btusb_data, =
dev);
> +
> +       kfree(data);
> +}
> +
> +static const struct device_type btusb_sysfs =3D {
> +       .name    =3D "btusb",
> +       .release =3D btusb_sysfs_release,
> +       .groups  =3D btusb_sysfs_groups,
> +};
> +
> +static struct attribute *btusb_sysfs_isoc_alt_attrs[] =3D {
> +       &dev_attr_isoc_alt.attr,
> +       NULL,
> +};
> +ATTRIBUTE_GROUPS(btusb_sysfs_isoc_alt);
> +
> +static const struct device_type btusb_sysfs_isoc_alt =3D {
> +       .name    =3D "btusb",
> +       .release =3D btusb_sysfs_release,
> +       .groups  =3D btusb_sysfs_isoc_alt_groups,
> +};
> +
>  static int btusb_probe(struct usb_interface *intf,
>                        const struct usb_device_id *id)
>  {
> @@ -3745,7 +3780,7 @@ static int btusb_probe(struct usb_interface *intf,
>                         return -ENODEV;
>         }
>
> -       data =3D devm_kzalloc(&intf->dev, sizeof(*data), GFP_KERNEL);
> +       data =3D kzalloc(sizeof(*data), GFP_KERNEL);
>         if (!data)
>                 return -ENOMEM;
>
> @@ -3768,8 +3803,10 @@ static int btusb_probe(struct usb_interface *intf,
>                 }
>         }
>
> -       if (!data->intr_ep || !data->bulk_tx_ep || !data->bulk_rx_ep)
> -               return -ENODEV;
> +       if (!data->intr_ep || !data->bulk_tx_ep || !data->bulk_rx_ep) {
> +               err =3D -ENODEV;
> +               goto out_free_data;
> +       }
>
>         if (id->driver_info & BTUSB_AMP) {
>                 data->cmdreq_type =3D USB_TYPE_CLASS | 0x01;
> @@ -3823,16 +3860,46 @@ static int btusb_probe(struct usb_interface *intf=
,
>
>         data->recv_acl =3D hci_recv_frame;
>
> +       if (id->driver_info & BTUSB_AMP) {
> +               /* AMP controllers do not support SCO packets */
> +               data->isoc =3D NULL;
> +       } else {
> +               /* Interface orders are hardcoded in the specification */
> +               data->isoc =3D usb_ifnum_to_if(data->udev, ifnum_base + 1=
);
> +               data->isoc_ifnum =3D ifnum_base + 1;
> +       }
> +
> +       if (id->driver_info & BTUSB_BROKEN_ISOC)
> +               data->isoc =3D NULL;
> +
> +       /* Init a dev for btusb. The attr depends on the support of isoc.=
 */
> +       if (data->isoc)
> +               data->dev.type =3D &btusb_sysfs_isoc_alt;
> +       else
> +               data->dev.type =3D &btusb_sysfs;
> +       data->dev.class =3D &bt_class;
> +       data->dev.parent =3D &intf->dev;
> +
> +       err =3D dev_set_name(&data->dev, "btusb%s", dev_name(&intf->dev))=
;
> +       if (err)
> +               goto out_free_data;
> +
> +       err =3D device_register(&data->dev);
> +       if (err < 0)
> +               goto out_put_sysfs;
> +
>         hdev =3D hci_alloc_dev_priv(priv_size);
> -       if (!hdev)
> -               return -ENOMEM;
> +       if (!hdev) {
> +               err =3D -ENOMEM;
> +               goto out_free_sysfs;
> +       }
>
>         hdev->bus =3D HCI_USB;
>         hci_set_drvdata(hdev, data);
>
>         data->hdev =3D hdev;
>
> -       SET_HCIDEV_DEV(hdev, &intf->dev);
> +       SET_HCIDEV_DEV(hdev, &data->dev);
>
>         reset_gpio =3D gpiod_get_optional(&data->udev->dev, "reset",
>                                         GPIOD_OUT_LOW);
> @@ -3971,15 +4038,6 @@ static int btusb_probe(struct usb_interface *intf,
>                 hci_set_msft_opcode(hdev, 0xFD70);
>         }
>
> -       if (id->driver_info & BTUSB_AMP) {
> -               /* AMP controllers do not support SCO packets */
> -               data->isoc =3D NULL;
> -       } else {
> -               /* Interface orders are hardcoded in the specification */
> -               data->isoc =3D usb_ifnum_to_if(data->udev, ifnum_base + 1=
);
> -               data->isoc_ifnum =3D ifnum_base + 1;
> -       }
> -
>         if (IS_ENABLED(CONFIG_BT_HCIBTUSB_RTL) &&
>             (id->driver_info & BTUSB_REALTEK)) {
>                 btrtl_set_driver_name(hdev, btusb_driver.name);
> @@ -4012,9 +4070,6 @@ static int btusb_probe(struct usb_interface *intf,
>                         set_bit(HCI_QUIRK_FIXUP_BUFFER_SIZE, &hdev->quirk=
s);
>         }
>
> -       if (id->driver_info & BTUSB_BROKEN_ISOC)
> -               data->isoc =3D NULL;
> -
>         if (id->driver_info & BTUSB_WIDEBAND_SPEECH)
>                 set_bit(HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED, &hdev->quirk=
s);
>
> @@ -4067,10 +4122,6 @@ static int btusb_probe(struct usb_interface *intf,
>                                                  data->isoc, data);
>                 if (err < 0)
>                         goto out_free_dev;
> -
> -               err =3D device_create_file(&intf->dev, &dev_attr_isoc_alt=
);
> -               if (err)
> -                       goto out_free_dev;
>         }
>
>         if (IS_ENABLED(CONFIG_BT_HCIBTUSB_BCM) && data->diag) {
> @@ -4101,6 +4152,16 @@ static int btusb_probe(struct usb_interface *intf,
>         if (data->reset_gpio)
>                 gpiod_put(data->reset_gpio);
>         hci_free_dev(hdev);
> +
> +out_free_sysfs:
> +       device_del(&data->dev);
> +
> +out_put_sysfs:
> +       put_device(&data->dev);
> +       return err;
> +
> +out_free_data:
> +       kfree(data);
>         return err;
>  }
>
> @@ -4117,10 +4178,8 @@ static void btusb_disconnect(struct usb_interface =
*intf)
>         hdev =3D data->hdev;
>         usb_set_intfdata(data->intf, NULL);
>
> -       if (data->isoc) {
> -               device_remove_file(&intf->dev, &dev_attr_isoc_alt);
> +       if (data->isoc)
>                 usb_set_intfdata(data->isoc, NULL);
> -       }
>
>         if (data->diag)
>                 usb_set_intfdata(data->diag, NULL);
> @@ -4152,6 +4211,7 @@ static void btusb_disconnect(struct usb_interface *=
intf)
>                 gpiod_put(data->reset_gpio);
>
>         hci_free_dev(hdev);
> +       device_unregister(&data->dev);
>  }
>
>  #ifdef CONFIG_PM
> diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci=
_core.h
> index 05919848ea95..776dd6183509 100644
> --- a/include/net/bluetooth/hci_core.h
> +++ b/include/net/bluetooth/hci_core.h
> @@ -1843,6 +1843,7 @@ int hci_get_adv_monitor_offload_ext(struct hci_dev =
*hdev);
>
>  void hci_event_packet(struct hci_dev *hdev, struct sk_buff *skb);
>
> +extern const struct class bt_class;
>  void hci_init_sysfs(struct hci_dev *hdev);
>  void hci_conn_init_sysfs(struct hci_conn *conn);
>  void hci_conn_add_sysfs(struct hci_conn *conn);
> diff --git a/net/bluetooth/hci_sysfs.c b/net/bluetooth/hci_sysfs.c
> index 041ce9adc378..f8c2c1c3e887 100644
> --- a/net/bluetooth/hci_sysfs.c
> +++ b/net/bluetooth/hci_sysfs.c
> @@ -6,9 +6,10 @@
>  #include <net/bluetooth/bluetooth.h>
>  #include <net/bluetooth/hci_core.h>
>
> -static const struct class bt_class =3D {
> +const struct class bt_class =3D {
>         .name =3D "bluetooth",
>  };
> +EXPORT_SYMBOL_GPL(bt_class);
>
>  static void bt_link_release(struct device *dev)
>  {
> --
> 2.48.1.601.g30ceb7b040-goog
>

Hi Luiz and Greg,

Friendly ping for review, thanks.

--=20
Best Regards,
Hsin-chen

