Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B06B9317003
	for <lists+linux-bluetooth@lfdr.de>; Wed, 10 Feb 2021 20:21:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233935AbhBJTVo (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 10 Feb 2021 14:21:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233646AbhBJTVk (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 10 Feb 2021 14:21:40 -0500
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73D03C061574
        for <linux-bluetooth@vger.kernel.org>; Wed, 10 Feb 2021 11:20:59 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id g46so740233ooi.9
        for <linux-bluetooth@vger.kernel.org>; Wed, 10 Feb 2021 11:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EgoY9Q5FD5YOoG24M4T+mVjTh7lerH6Btkq5kk3o8Gs=;
        b=ZF3mHFcePOOpn5LDL/Vd48GxIROmrkLwtwbUF7MWPndGdLpB+P2ah5ijimZ972plZ0
         cgQYvW6kFVN3FdfkQBCFE1GmPGThNKi4OsszujrMqajGdPjXh9p6KRdNXFrTE4fKr4eL
         oXdWDkvpX96L3KgwUyHmkIScJ9W9oxme0A5dYE41/i578dsHDKnwcLJ2m5bxlu9ZKyYY
         RUcpnxMiZrhG1FMbk9Y31oK7dWXpSZGG/s9WrFm9IuzdwMereTEkVETTS30UUFsXGlug
         OsjjnJgYB+HCo3x4t6WILROaxBGdbos7Oj4EUknUBGZtJSbxsKM4bEt5axEEFFul6JcN
         anbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EgoY9Q5FD5YOoG24M4T+mVjTh7lerH6Btkq5kk3o8Gs=;
        b=apPjur/OuB9Qvb9DYYRRKdQEv+VpC3l74JzkET86+gr5tdUXGOoW7tT8WAf/lagVS7
         QoDtwGUKlttKaDUQQfjnYEHvInRyVQp4BPtS4yP9A6j4Njh88PhQcA+dpoWpwguAKzy5
         zIVpJDpxsM3sZrkXjpIyiyB5nhx7MhALhgCbe2TSLO7tQft/mca+PQ2lSxlfsJ6hVWOm
         7gZYbMnJh7yd4WHReNhEp+8CuSW9WjEGAgNWG1HAL8xmNdaAOiPXdJlYNSDAcji6UN6u
         o+B31bwUHhwleKm+hQQmUmBqppw5r7YMjTHvXKEbnEUHaIIIoJmYEoT37Ay6zCVsGBox
         C5Dw==
X-Gm-Message-State: AOAM530pNJ5TQ2fMXRc4vEBaCKxkrvmEBl7Xq8bKFLQvgZe5bZ8916yN
        pOfThTl0MsI+Kcn2evcwnX6ambW4GS+RYhMu6J0=
X-Google-Smtp-Source: ABdhPJyiPYY8EAInQg7bT8V6ZEcNiP4td6dyAMg726HVHq2wAcaPgFq/nt0A9U2PkkYwgiohVO94/xIVhBPlno1cEek=
X-Received: by 2002:a4a:c44d:: with SMTP id h13mr1772ooq.65.1612984858786;
 Wed, 10 Feb 2021 11:20:58 -0800 (PST)
MIME-Version: 1.0
References: <20210210165916.2148856-1-luiz.dentz@gmail.com>
 <20210210165916.2148856-2-luiz.dentz@gmail.com> <b9c71d7433f22ca3d93c623c9239ecf14c53de40.camel@intel.com>
In-Reply-To: <b9c71d7433f22ca3d93c623c9239ecf14c53de40.camel@intel.com>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Wed, 10 Feb 2021 11:20:48 -0800
Message-ID: <CABBYNZK-a1-tb1XsEcoDuorewZxb=R2Y=qNjcEoxay58cZKJ9g@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] Bluetooth: btintel: Move operational checks after
 version check
To:     "An, Tedd" <tedd.an@intel.com>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Tedd,

On Wed, Feb 10, 2021 at 11:10 AM An, Tedd <tedd.an@intel.com> wrote:
>
> On Wed, 2021-02-10 at 08:59 -0800, Luiz Augusto von Dentz wrote:
> > From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> >
> > In order to allow new firmware to be loaded it first needs to check if
> > the firmware version on file matches the one loaded if it doesn't then
> > it needs to revert to boorloader mode in order to load the new firmware.
> >
> > Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> > ---
> >  drivers/bluetooth/btintel.c | 22 +++++++++++
> >  drivers/bluetooth/btusb.c   | 74 +++++++++++++++----------------------
> >  2 files changed, 52 insertions(+), 44 deletions(-)
> >
> > diff --git a/drivers/bluetooth/btintel.c b/drivers/bluetooth/btintel.c
> > index 89f85d54ca64..0d0f643f972a 100644
> > --- a/drivers/bluetooth/btintel.c
> > +++ b/drivers/bluetooth/btintel.c
> > @@ -949,6 +949,17 @@ int btintel_download_firmware(struct hci_dev *hdev,
> >               return -EALREADY;
> >       }
> >
> > +     /* The firmware variant determines if the device is in bootloader
> > +      * mode or is running operational firmware. The value 0x06 identifies
> > +      * the bootloader and the value 0x23 identifies the operational
> > +      * firmware.
> > +      *
> > +      * If the firmware version has changed that means it needs to be reset
> > +      * to bootloader when operational so the new firmware can be loaded.
> > +      */
> > +     if (ver->fw_variant == 0x23)
> > +             return -EINVAL;
> > +
> >       err = btintel_sfi_rsa_header_secure_send(hdev, fw);
> >       if (err)
> >               return err;
> > @@ -976,6 +987,17 @@ int btintel_download_firmware_newgen(struct hci_dev *hdev,
> >               return -EALREADY;
> >       }
> >
> > +     /* The firmware variant determines if the device is in bootloader
> > +      * mode or is running operational firmware. The value 0x03 identifies
> > +      * the bootloader and the value 0x23 identifies the operational
> > +      * firmware.
> > +      *
> > +      * If the firmware version has changed that means it needs to be reset
> > +      * to bootloader when operational so the new firmware can be loaded.
> > +      */
> > +     if (ver->img_type == 0x03)
> > +             return -EINVAL;
> > +
> >       /* iBT hardware variants 0x0b, 0x0c, 0x11, 0x12, 0x13, 0x14 support
> >        * only RSA secure boot engine. Hence, the corresponding sfi file will
> >        * have RSA header of 644 bytes followed by Command Buffer.
> > diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> > index c92060e7472c..a44f3cf25790 100644
> > --- a/drivers/bluetooth/btusb.c
> > +++ b/drivers/bluetooth/btusb.c
> > @@ -2469,14 +2469,30 @@ static int btusb_send_frame_intel(struct hci_dev *hdev, struct sk_buff *skb)
> >       return -EILSEQ;
> >  }
> >
> > -static bool btusb_setup_intel_new_get_fw_name(struct intel_version *ver,
> > +static int btusb_setup_intel_new_get_fw_name(struct intel_version *ver,
> >                                            struct intel_boot_params *params,
> >                                            char *fw_name, size_t len,
> >                                            const char *suffix)
> >  {
> > +     /* The hardware platform number has a fixed value of 0x37 and
> > +      * for now only accept this single value.
> > +      */
> > +     if (ver->hw_platform != 0x37)
> > +             return -EINVAL;
> > +
> >       switch (ver->hw_variant) {
> >       case 0x0b:      /* SfP */
> >       case 0x0c:      /* WsP */
> > +             /* The firmware variant determines if the device is in
> > +              * bootloader mode or is running operational firmware.
> > +              *
> > +              * Version checking cannot be performed in these models since
> > +              * the firmware versioning depends on the firmware being in
> > +              * bootloader mode.
> > +              */
> > +             if (ver->fw_variant == 0x23)
> > +                     return -EALREADY;
> > +
> >               snprintf(fw_name, len, "intel/ibt-%u-%u.%s",
> >                       le16_to_cpu(ver->hw_variant),
> >                       le16_to_cpu(params->dev_revid),
> > @@ -2493,9 +2509,10 @@ static bool btusb_setup_intel_new_get_fw_name(struct intel_version *ver,
> >                       suffix);
> >               break;
> >       default:
> > -             return false;
> > +             return -EINVAL;
> >       }
> > -     return true;
> > +
> > +     return 0;
>
> There is one more place in btusb_setup_intel_new()@btusb.c to update the handling of return
> value of this funcion, which is related to loading the DDC.
> Code like this...
>
> if (!err) {
>         bt_dev_err(hdev, "Unsupported Intel firmware naming");
> } else {

This should never fail though since the first one would check if the
firmware name cannot be generated if would fail and never reach this
one, that said perhaps static analyzer will complain about not
checking the return here.

>
>
> >  }
> >
> >  static void btusb_setup_intel_newgen_get_fw_name(const struct intel_version_tlv *ver_tlv,
> > @@ -2550,7 +2567,6 @@ static int btusb_intel_download_firmware_newgen(struct hci_dev *hdev,
> >       if (ver->img_type == 0x03) {
> >               clear_bit(BTUSB_BOOTLOADER, &data->flags);
> >               btintel_check_bdaddr(hdev);
> > -             return 0;
> >       }
> >
> >       /* Check for supported iBT hardware variants of this firmware
> > @@ -2694,35 +2710,6 @@ static int btusb_intel_download_firmware(struct hci_dev *hdev,
> >       if (!ver || !params)
> >               return -EINVAL;
> >
> > -     /* The hardware platform number has a fixed value of 0x37 and
> > -      * for now only accept this single value.
> > -      */
> > -     if (ver->hw_platform != 0x37) {
> > -             bt_dev_err(hdev, "Unsupported Intel hardware platform (%u)",
> > -                        ver->hw_platform);
> > -             return -EINVAL;
> > -     }
> > -
> > -     /* Check for supported iBT hardware variants of this firmware
> > -      * loading method.
> > -      *
> > -      * This check has been put in place to ensure correct forward
> > -      * compatibility options when newer hardware variants come along.
> > -      */
> > -     switch (ver->hw_variant) {
> > -     case 0x0b:      /* SfP */
> > -     case 0x0c:      /* WsP */
> > -     case 0x11:      /* JfP */
> > -     case 0x12:      /* ThP */
> > -     case 0x13:      /* HrP */
> > -     case 0x14:      /* CcP */
> > -             break;
> > -     default:
> > -             bt_dev_err(hdev, "Unsupported Intel hardware variant (%u)",
> > -                        ver->hw_variant);
> > -             return -EINVAL;
> > -     }
> > -
> >       btintel_version_info(hdev, ver);
> >
> >       /* The firmware variant determines if the device is in bootloader
> > @@ -2741,16 +2728,8 @@ static int btusb_intel_download_firmware(struct hci_dev *hdev,
> >       if (ver->fw_variant == 0x23) {
> >               clear_bit(BTUSB_BOOTLOADER, &data->flags);
> >               btintel_check_bdaddr(hdev);
> > -             return 0;
> > -     }
> > -
> > -     /* If the device is not in bootloader mode, then the only possible
> > -      * choice is to return an error and abort the device initialization.
> > -      */
> > -     if (ver->fw_variant != 0x06) {
> > -             bt_dev_err(hdev, "Unsupported Intel firmware variant (%u)",
> > -                        ver->fw_variant);
> > -             return -ENODEV;
> > +             /* Proceed to download to check if the version matches */
> > +             goto download;
> >       }
> >
> >       /* Read the secure boot parameters to identify the operating
> > @@ -2778,6 +2757,7 @@ static int btusb_intel_download_firmware(struct hci_dev *hdev,
> >               set_bit(HCI_QUIRK_INVALID_BDADDR, &hdev->quirks);
> >       }
> >
> > +download:
> >       /* With this Intel bootloader only the hardware variant and device
> >        * revision information are used to select the right firmware for SfP
> >        * and WsP.
> > @@ -2801,7 +2781,13 @@ static int btusb_intel_download_firmware(struct hci_dev *hdev,
> >        */
> >       err = btusb_setup_intel_new_get_fw_name(ver, params, fwname,
> >                                               sizeof(fwname), "sfi");
> > -     if (!err) {
> > +     if (err < 0) {
> > +             if (err == -EALREADY) {
> > +                     /* Firmware has already been loaded */
> > +                     set_bit(BTUSB_FIRMWARE_LOADED, &data->flags);
> > +                     goto done;
> > +             }
> > +
> >               bt_dev_err(hdev, "Unsupported Intel firmware naming");
> >               return -EINVAL;
> >       }



-- 
Luiz Augusto von Dentz
