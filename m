Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E7B37B6E24
	for <lists+linux-bluetooth@lfdr.de>; Tue,  3 Oct 2023 18:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240355AbjJCQLD (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 3 Oct 2023 12:11:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231669AbjJCQLC (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 3 Oct 2023 12:11:02 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADFBEA7;
        Tue,  3 Oct 2023 09:10:58 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-d86574d9bcaso1147294276.2;
        Tue, 03 Oct 2023 09:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696349458; x=1696954258; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJIb/JY4n8tGZSqHXme95COkElXYXHHoPPYozHgYq+o=;
        b=KGpK32eiIH9wsfEk35xkw7NyQk2hNMfln2JHvbGANmqHzMoh2NnaK2cLwNRYwexLwH
         UpGkndb4Rk4w1UoJjqFQfQHCe40j5ZDIqwRqTApUttjJzMS+rh7YgnqlFa504AzEFEyG
         44nksJhDP7RWbM3oJRKbL+J7u84Bp0N2RJq5bdufoxF0HGNzkCq0peq4XsfYdF1oUdtO
         JddKJrzNysMXTVQ+yNj/0TEs1UFUj7ClfOxrH1Vh2z0WNomsjl/Hg8+lnlnHcYFdN3cl
         hA94nAos+MNsdIE3vLqx+UksKWXBuDta1+MFvfRvlvsigTHenQbIY60LYtbFnm4lPVNt
         IYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696349458; x=1696954258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJIb/JY4n8tGZSqHXme95COkElXYXHHoPPYozHgYq+o=;
        b=EaG5vGmFr0BJ3jvA/kLennQuoVf/vy+GzOxRKlMPH2FNt7asRkuRoHVV7ni31iripz
         GGwFkVjjxY5ltyhJKwNjzxp4UaBgrcpkBW3oVqzZcgf1Ah9ge3iX9q7GB2LcEUa2Gq3Y
         Afkz4ygh47YZBPEh4KmrksJsQrPeoNLwRPX44C5HkMJs3tb9u9mNcHqjg32z/UHCci/0
         lm3L8Xx0Bg1xdIbIi3sg9hjob+CKqnd0b6iy15PjJmhMq3PYvby/VZLbeXDuQE3Q4c3N
         bYb0iZAhzm7rivzi/4PP5tq2UOxTcxElKo9cM1tsnk8O4KFy3yWblEhsMe6463nVojDQ
         Z0Vw==
X-Gm-Message-State: AOJu0YxcfQSb3fgUXhTwIYGwBDYG/elOb3p7xN5KmnYnLg25b+D8reDU
        +iXrTuizFxxIsXdV1jYU+Rp62+IwprpvaMtlEOY=
X-Google-Smtp-Source: AGHT+IG/rOtVRw7F1FQYoc2gJxlkY9rYdDDcV+U8qqwVIQAeOKxjsSAmjvcNMnfvzHJq5/eE+kYTAKspnaDSyL4EZ10=
X-Received: by 2002:a25:cf95:0:b0:d80:1161:5ec1 with SMTP id
 f143-20020a25cf95000000b00d8011615ec1mr13414568ybg.20.1696349457871; Tue, 03
 Oct 2023 09:10:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAH7-e5sb+kT_LRb1_y-c5JaFN0=KrrRT97otUPKzTCgzGsVdrQ@mail.gmail.com>
 <ZRtWcgiH5JhD5NU2@debian.me> <CAH7-e5uspavg_VBJxKLOKJfU3nAq-OrPqzihF2opffY-ReiC-w@mail.gmail.com>
 <834062302e6a98e773dc4b03d7ed568a0f1c44fc.camel@nordicsemi.no>
 <CAH7-e5uZzmnFJAJrG664G6_JbK--DfbKC50aeVN5gMMxDJ51UA@mail.gmail.com> <ba7aaaed859ea2c4f5aac597deb382cceab33d65.camel@nordicsemi.no>
In-Reply-To: <ba7aaaed859ea2c4f5aac597deb382cceab33d65.camel@nordicsemi.no>
From:   =?UTF-8?Q?Erik_Dob=C3=A1k?= <erik.dobak@gmail.com>
Date:   Tue, 3 Oct 2023 18:10:46 +0200
Message-ID: <CAH7-e5unq6ggNjVkSsriUAmpvk4s7-NCYJrZnLK_3BjFO_Dceg@mail.gmail.com>
Subject: Re: bluetooth issues since kernel 6.4 - not discovering other bt
 devices - /linux/drivers/bluetooth/btusb.c
To:     =?UTF-8?Q?Tomasz_Mo=C5=84?= <tomasz.mon@nordicsemi.no>
Cc:     Bagas Sanjaya <bagasdotme@gmail.com>,
        Linux Stable <stable@vger.kernel.org>,
        Linux Bluetooth <linux-bluetooth@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Mediatek <linux-mediatek@lists.infradead.org>,
        Linux Regressions <regressions@lists.linux.dev>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Sorry Tomasz,

that must have been a reality glitch with your commit (cant find the
page refering to your commit now). But yes it is probably a kernel bug
as it manifests kernels 6.4 and not in the 6.1 LTS version.

Yours

E

On Tue, 3 Oct 2023 at 15:08, Tomasz Mo=C5=84 <tomasz.mon@nordicsemi.no> wro=
te:
>
> On Tue, 2023-10-03 at 14:42 +0200, Erik Dob=C3=A1k wrote:
> > Sure here you go:
> >
> > # lsusb -d 04c5:1670 -v
> >
> > Bus 001 Device 004: ID 04c5:1670 Fujitsu, Ltd Bluetooth Radio
> > Device Descriptor:
> >   bLength                18
> >   bDescriptorType         1
> >   bcdUSB               1.00
> >   bDeviceClass          224 Wireless
> >   bDeviceSubClass         1 Radio Frequency
> >   bDeviceProtocol         1 Bluetooth
> >   bMaxPacketSize0        64
> >   idVendor           0x04c5 Fujitsu, Ltd
> >   idProduct          0x1670
> >   bcdDevice            0.00
> >   iManufacturer           1 Realtek
> >   iProduct                2 Bluetooth Radio
> >   iSerial                 3 00e04c000001
> >   bNumConfigurations      1
> >   Configuration Descriptor:
> >     bLength                 9
> >     bDescriptorType         2
> >     wTotalLength       0x00b1
> >     bNumInterfaces          2
> >     bConfigurationValue     1
> >     iConfiguration          0
> >     bmAttributes         0xe0
> >       Self Powered
> >       Remote Wakeup
> >     MaxPower              500mA
> >     Interface Descriptor:
> >       bLength                 9
> >       bDescriptorType         4
> >       bInterfaceNumber        0
> >       bAlternateSetting       0
> >       bNumEndpoints           3
> >       bInterfaceClass       224 Wireless
> >       bInterfaceSubClass      1 Radio Frequency
> >       bInterfaceProtocol      1 Bluetooth
> >       iInterface              4 Bluetooth Radio
>
> I have no idea why you referred to my commits, i.e. c13380a55522
> ("Bluetooth: btusb: Do not require hardcoded interface numbers") later
> fixed by eaac6e223a0d ("Bluetooth: btusb: Fix bluetooth on Intel
> Macbook 2014") in the first place.
>
> BTUSB_IFNUM_2 is not even getting set for this device and therefore the
> patches have no impact on your issue. If you were affected, like the
> Intel Macbook 2014 was, then bear in mind that the issue would manifest
> as btusb driver not even binding to the device. From your emails
> however it appears that the issue is something different.
>
> I honestly don't think it has anything to do with my patches. If you
> know a Linux version where your bluetooth device works, then the next
> step would be to bisect to find the first bad commit.
>
> Best Regards,
> Tomasz Mo=C5=84
