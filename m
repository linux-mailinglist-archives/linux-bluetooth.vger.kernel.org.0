Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8316FBA94
	for <lists+linux-bluetooth@lfdr.de>; Wed, 13 Nov 2019 22:22:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbfKMVWq (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 13 Nov 2019 16:22:46 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:35771 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbfKMVWp (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 13 Nov 2019 16:22:45 -0500
Received: by mail-qk1-f195.google.com with SMTP id i19so3145579qki.2
        for <linux-bluetooth@vger.kernel.org>; Wed, 13 Nov 2019 13:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H5D+0l5YX7kW94tdUvORkwws9N/E0rSMWEMH/aWYGCM=;
        b=RuGtcHgyES0alZRPSvzuMKMS1akTNwu8rQqiiE0qNV3Qy3YnFzheMDE/xjJqUpG0n9
         EVGOjLnrQWIDNgAX0oTU7HKxDB6xJU2s7+XLerRGujebZFWK6n24xMEEQRgdD1lViHwG
         w8kUz0mo1XPBJQgPuFeKE7ef3jqWCBWgufGZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H5D+0l5YX7kW94tdUvORkwws9N/E0rSMWEMH/aWYGCM=;
        b=OLew7W04CGLO1WX2uPlwYMEF4RKOy+Lm1gmoIfPEOBhHcWfI97qGdqhVbWHlcMobwf
         EpheIbTzJLSdKpabK/NqlmiSTFWuLf3YYj/MuRLFvtU/qykaiUxckZEfILj5BoC2oBHG
         +7h6Y4AkhALw6Tz0EDYDqir+QtHlEx7EnEoH2Ug4CIMmRrjDFnd+HLgEj2FSrTebVm2g
         TOblXcKGY/OlocjZEy4vkgBb69EIn9pBaymteIiZLtav72tRdl22pFWbG32FSYHsnWEV
         OFv8CfDbxHeXJq1f9U3hygPm1xKL4hK3wbM93xYt1Ulb0NwYIkj2gCK0vrjjl9dILCu1
         FsBw==
X-Gm-Message-State: APjAAAUThmVZDBlc+frekfzRNuKfj70bioz+eW9Z0z8UK4t4dJa/NNZB
        mrOc2M/DejdxbUnt5VSxiNMJ+OUpO9f40RjdlAmV/g==
X-Google-Smtp-Source: APXvYqxiGunaKyUs/he4AdfvGfT2knL19MLF8BA0pVlIy1AoRxGy5c5Y/AE0teKVLEm1WL8traRZ3T2koVDdsnAhKoM=
X-Received: by 2002:a05:620a:1032:: with SMTP id a18mr3070746qkk.305.1573680162664;
 Wed, 13 Nov 2019 13:22:42 -0800 (PST)
MIME-Version: 1.0
References: <20191112230944.48716-1-abhishekpandit@chromium.org>
 <20191112230944.48716-4-abhishekpandit@chromium.org> <DCCD0A71-D696-4701-9BBB-ED6D8FECC7FB@holtmann.org>
In-Reply-To: <DCCD0A71-D696-4701-9BBB-ED6D8FECC7FB@holtmann.org>
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date:   Wed, 13 Nov 2019 13:22:31 -0800
Message-ID: <CANFp7mX0tXmBdJOkBUbar6Niwv9D60Fo9CvAcUkEKZKLnt--hQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] Bluetooth: hci_bcm: Support pcm params in dts
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-bluetooth@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Marcel,



On Tue, Nov 12, 2019 at 4:18 PM Marcel Holtmann <marcel@holtmann.org> wrote:
>
> Hi Abhishek,
>
> > BCM chips may require configuration of PCM to operate correctly and
> > there is a vendor specific HCI command to do this. Add support in the
> > hci_bcm driver to parse this from devicetree and configure the chip.
> >
> > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > ---
> >
> > Changes in v4: None
> > Changes in v3: None
> > Changes in v2: None
> >
> > drivers/bluetooth/hci_bcm.c | 32 ++++++++++++++++++++++++++++++++
> > 1 file changed, 32 insertions(+)
> >
> > diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
> > index 6134bff58748..4ee0b45be7e2 100644
> > --- a/drivers/bluetooth/hci_bcm.c
> > +++ b/drivers/bluetooth/hci_bcm.c
> > @@ -88,6 +88,8 @@ struct bcm_device_data {
> >  *    used to disable flow control during runtime suspend and system sleep
> >  * @is_suspended: whether flow control is currently disabled
> >  * @disallow_set_baudrate: don't allow set_baudrate
> > + * @has_pcm_params: whether PCM parameters need to be configured
> > + * @pcm_params: PCM and routing parameters
> >  */
> > struct bcm_device {
> >       /* Must be the first member, hci_serdev.c expects this. */
> > @@ -122,6 +124,9 @@ struct bcm_device {
> >       bool                    is_suspended;
> > #endif
> >       bool                    disallow_set_baudrate;
> > +
> > +     bool                            has_pcm_params;
> > +     struct bcm_set_pcm_int_params   pcm_params;
> > };
> >
> > /* generic bcm uart resources */
> > @@ -596,6 +601,16 @@ static int bcm_setup(struct hci_uart *hu)
> >                       host_set_baudrate(hu, speed);
> >       }
> >
> > +     /* PCM parameters if any*/
> > +     if (bcm->dev && bcm->dev->has_pcm_params) {
> > +             err = btbcm_set_pcm_int_params(hu->hdev, &bcm->dev->pcm_params);
> > +
> > +             if (err) {
> > +                     bt_dev_info(hu->hdev, "BCM: Set pcm params failed (%d)",
> > +                                 err);
> > +             }
> > +     }
> > +
> > finalize:
> >       release_firmware(fw);
> >
> > @@ -1132,7 +1147,24 @@ static int bcm_acpi_probe(struct bcm_device *dev)
> >
> > static int bcm_of_probe(struct bcm_device *bdev)
> > {
> > +     int err;
> > +
> >       device_property_read_u32(bdev->dev, "max-speed", &bdev->oper_speed);
> > +
> > +     err = device_property_read_u8(bdev->dev, "brcm,bt-sco-routing",
> > +                                   &bdev->pcm_params.routing);
> > +     if (!err)
> > +             bdev->has_pcm_params = true;
>
> I think in case of HCI as routing path, these should be using the default or zero values as defined by Broadcom.

I'm not sure what these default values should be. Wouldn't it be
reasonable to expect the user/developer to set the various brcm
parameters in device tree?
If unset, it's just 0.

>
> > +
> > +     device_property_read_u8(bdev->dev, "brcm,pcm-interface-rate",
> > +                             &bdev->pcm_params.rate);
> > +     device_property_read_u8(bdev->dev, "brcm,pcm-frame-type",
> > +                             &bdev->pcm_params.frame_sync);
> > +     device_property_read_u8(bdev->dev, "brcm,pcm-sync-mode",
> > +                             &bdev->pcm_params.sync_mode);
> > +     device_property_read_u8(bdev->dev, "brcm,pcm-clock-mode",
> > +                             &bdev->pcm_params.clock_mode);
> > +
>
> I would add some sanity checks here.
>
> Regards
>
> Marcel
>
