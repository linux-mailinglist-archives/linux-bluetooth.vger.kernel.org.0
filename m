Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E305C27624C
	for <lists+linux-bluetooth@lfdr.de>; Wed, 23 Sep 2020 22:41:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbgIWUlY (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 23 Sep 2020 16:41:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726599AbgIWUlY (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 23 Sep 2020 16:41:24 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CDD5C0613D1
        for <linux-bluetooth@vger.kernel.org>; Wed, 23 Sep 2020 13:41:24 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id e23so802410vsk.2
        for <linux-bluetooth@vger.kernel.org>; Wed, 23 Sep 2020 13:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WtnMpKEFk8XdbisKvZAYgb55+Tp7Iu2JFYEB4yZJj24=;
        b=FkDj/yGDWO7dTaq0x0xSMUm5/lbKNuWMUJOEmj8IECuFSkAIZqsWYybVdHKjdkeG+Q
         PKnmtqkRABkKepN55NXhuZlD+hNLVxGr6gYYQqdHZO3hMixceQBlVYZpBlk8m39QsHjx
         5Ag5qUa6bJnhUbOhNMnfFNd7xu7F/RWZibwtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WtnMpKEFk8XdbisKvZAYgb55+Tp7Iu2JFYEB4yZJj24=;
        b=nEfocc+s+4+luwUUneznrfgTsSWlVRFcx0GF9YJde8EwAuPs/io/s0dbfrSsxpXKml
         RIpjvVGtKTV56EgL86crPxxDDH/I7yfUdHSSTSUjyzZUbIvQZn9SFrPycPvegnh5HJeb
         MQOW27i2VELI6RxCfw8MKAFtIEaKAC7qE6v2nYjqCZs/6D5qVX9h4ou9c7/ruHpvjY8x
         Z0L+/YW1exgbnVo33CziM8y/YwX7KAZ25Lrqnx000/t3Ja7oLlRfeHkIzQV1s0HT/6fq
         AI0/aInbuwYxWYIlImZGh+wCpRlhFprOhw0/UUTKWcIGtNrMxRj4iFex1fLDLSDCMJJW
         7G4g==
X-Gm-Message-State: AOAM533ga0ZU9aSGN25Atj8PctR95z68Us0nHsG76H1dJgcRXTeEZ0kp
        56zs3/CG7tAR1IwZV4oPQ44MO1v+NJoyPmejdlbNBQ==
X-Google-Smtp-Source: ABdhPJy1qHbMclCv7vZN6/lw/+U4LzgqSa4XqBBOMOZgiEtM/Qeqh9eXwEZyUNz5dovHgqE1wibrzduraTVAN4qNN4E=
X-Received: by 2002:a67:fc48:: with SMTP id p8mr1728292vsq.53.1600893683267;
 Wed, 23 Sep 2020 13:41:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200923175602.9523-1-kai.heng.feng@canonical.com>
In-Reply-To: <20200923175602.9523-1-kai.heng.feng@canonical.com>
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date:   Wed, 23 Sep 2020 13:41:11 -0700
Message-ID: <CANFp7mV7fC9_EZHd7B0Cu-owgCVdA6CNd2bb7XwFf5+6b7FVpg@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btusb: Avoid unnecessary reset upon system resume
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Alex Lu <alex_lu@realsil.com.cn>,
        "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Kai-Heng,

Which Realtek controller is this on?

Specifically for RTL8822CE, we tested without reset_resume being set
and that was causing the controller being reset without bluez ever
learning about it (resulting in devices being unusable without
toggling the BT power).
If the firmware doesn't cut off power during suspend, maybe you
shouldn't set the BTUSB_WAKEUP_DISABLE flag for that controller.

I would prefer this doesn't get accepted in its current state.

Abhishek

On Wed, Sep 23, 2020 at 10:56 AM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> Realtek bluetooth controller may fail to work after system sleep:
> [ 1272.707670] Bluetooth: hci0: command 0x1001 tx timeout
> [ 1280.835712] Bluetooth: hci0: RTL: HCI_OP_READ_LOCAL_VERSION failed (-110)
>
> If platform firmware doesn't cut power off during suspend, the firmware
> is considered retained in controller but the driver is still asking USB
> core to perform a reset-resume. This can make bluetooth controller
> unusable.
>
> So avoid unnecessary reset to resolve the issue.
>
> For devices that really lose power during suspend, USB core will detect
> and handle reset-resume correctly.
>
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>  drivers/bluetooth/btusb.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 8d2608ddfd08..de86ef4388f9 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -4255,17 +4255,15 @@ static int btusb_suspend(struct usb_interface *intf, pm_message_t message)
>                 enable_irq(data->oob_wake_irq);
>         }
>
> -       /* For global suspend, Realtek devices lose the loaded fw
> -        * in them. But for autosuspend, firmware should remain.
> -        * Actually, it depends on whether the usb host sends
> +       /* For global suspend, Realtek devices lose the loaded fw in them if
> +        * platform firmware cut power off. But for autosuspend, firmware
> +        * should remain.  Actually, it depends on whether the usb host sends
>          * set feature (enable wakeup) or not.
>          */
>         if (test_bit(BTUSB_WAKEUP_DISABLE, &data->flags)) {
>                 if (PMSG_IS_AUTO(message) &&
>                     device_can_wakeup(&data->udev->dev))
>                         data->udev->do_remote_wakeup = 1;
> -               else if (!PMSG_IS_AUTO(message))
> -                       data->udev->reset_resume = 1;
>         }
>
>         return 0;
> --
> 2.17.1
>
