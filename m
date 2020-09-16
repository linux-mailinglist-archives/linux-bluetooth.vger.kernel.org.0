Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDD9D26CEDE
	for <lists+linux-bluetooth@lfdr.de>; Thu, 17 Sep 2020 00:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgIPWif (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 16 Sep 2020 18:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbgIPWie (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 16 Sep 2020 18:38:34 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26D7CC06174A
        for <linux-bluetooth@vger.kernel.org>; Wed, 16 Sep 2020 15:38:34 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id q13so59630ejo.9
        for <linux-bluetooth@vger.kernel.org>; Wed, 16 Sep 2020 15:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FA/vn/pf1ZmH6gVwWqHYRwnpefavwAOiKTwEHHpEftE=;
        b=bHdM/kQnKvHwc1ZN+MIc2/ajoKWIMMQtMUTFw2OeqV00Mu0JR46km0ENl9gQ0V5Sc/
         aQM8L0+vdwxiDiPeP4G0Cux2XOyj0mWoEVbyYNw09USRS1PGEF2GV+Px3t+VQQ6Bq0hM
         Ahxu72v7CzmkJJrMDO5Qom6LsvxvVDTdRo3DU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FA/vn/pf1ZmH6gVwWqHYRwnpefavwAOiKTwEHHpEftE=;
        b=TY3qhlRQ+I2V2bqzROlFoGKM2l7cjH2VWsqiedqJZ6jdIonhrGSiDoyKKe0ICEMely
         BeNEqTImSgZAOUjpud/yBepEbIs2a/UDvg4XiufdtGoNp+K9fzYidBxXekFnPnuZgaAs
         AgB+s8KQStQCYuX+cXItaXCasppql+v0vSOVpl7IIfm544k3rcmWjsrqARUrgnXomNyI
         2Xlsd60SAnTZPSaLlaZo0J9e2oKG9ZdQ7klfeyAW4mediwTKrWSuMcrPGBY1eFU6DYBw
         b/8w/Ofseq687qK6Ainez/Mis3cMV3AufmaB9TnmQrbsXxfZLD3Dja9ypbUz3uv3ohFr
         Mf9w==
X-Gm-Message-State: AOAM5305gwUUZI/hLJGtCIZg39nh7ltU0lyLW/pneXl81YQDE81+SZzP
        Nw36SNGAafdfjqQvdbbV/M/OMKDid2bNGA==
X-Google-Smtp-Source: ABdhPJw53kG0ZTuX/E9hYMV/Lsu1cXxmoy/NffJJ8CW81facYzBOFP5uqrEqCKYBhHgbZ5bOLN4G2g==
X-Received: by 2002:a17:907:20d0:: with SMTP id qq16mr4677571ejb.65.1600295907974;
        Wed, 16 Sep 2020 15:38:27 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id j10sm13450743ejf.116.2020.09.16.15.38.27
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2020 15:38:27 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id g4so8491308wrs.5
        for <linux-bluetooth@vger.kernel.org>; Wed, 16 Sep 2020 15:38:27 -0700 (PDT)
X-Received: by 2002:a5d:5307:: with SMTP id e7mr5881775wrv.215.1600295906572;
 Wed, 16 Sep 2020 15:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200821061643.16278-1-sonnysasaka@chromium.org>
In-Reply-To: <20200821061643.16278-1-sonnysasaka@chromium.org>
From:   Sonny Sasaka <sonnysasaka@chromium.org>
Date:   Wed, 16 Sep 2020 15:38:15 -0700
X-Gmail-Original-Message-ID: <CAO271m=UWgjM1nLWzrwfvG4r3V7c6wdPDJk7EvRtW4cgsLXqhg@mail.gmail.com>
Message-ID: <CAO271m=UWgjM1nLWzrwfvG4r3V7c6wdPDJk7EvRtW4cgsLXqhg@mail.gmail.com>
Subject: Re: [PATCH BlueZ 1/2] gatt: StartNotify is not allowed when device is disconnecting
To:     BlueZ <linux-bluetooth@vger.kernel.org>
Cc:     Joseph Hwang <josephsih@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Dear BlueZ maintainers,

Friendly ping to review this patch. Thanks!


On Thu, Aug 20, 2020 at 11:17 PM Sonny Sasaka <sonnysasaka@chromium.org> wrote:
>
> From: Joseph Hwang <josephsih@chromium.org>
>
> This patch fixed a bluetoothd crash in register_notify_cb(). The
> crash is incurred by an exception that under some situation, a
> characteristic may be freed when register_notify_cb() is invoked.
>
> When a device is disconnecting, the device interface would hold valid
> for a while until the disconnection procedure between the client and
> the server is completed. If another process happens to request to start
> notification of a characteristic on the disconnecting device, it may
> incur a problem. In this case, the client would still send the
> StartNotify request since the characteristic object is still valid.
> However, the characteristic may be freed soon and become invalid
> when the corresponding callback function is invoked later. This
> leads to the bluetoothd crash due to the segmentation fault.
>
> To handle the exception, if another process requests to start
> notification when the device is disconnecting, it should reject the
> request.
>
> Tested on Chrome OS that this patch fixes bluetoothd crash in
> register_notify_cb().
>
> ---
>  src/gatt-client.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/src/gatt-client.c b/src/gatt-client.c
> index 20c3fbec2..c706307c7 100644
> --- a/src/gatt-client.c
> +++ b/src/gatt-client.c
> @@ -1545,6 +1545,12 @@ static DBusMessage *characteristic_start_notify(DBusConnection *conn,
>         const char *sender = dbus_message_get_sender(msg);
>         struct async_dbus_op *op;
>         struct notify_client *client;
> +       struct btd_device *device = chrc->service->client->device;
> +
> +       if (device_is_disconnecting(device)) {
> +               error("Device is disconnecting. StartNotify is not allowed.");
> +               return btd_error_not_connected(msg);
> +       }
>
>         if (chrc->notify_io)
>                 return btd_error_not_permitted(msg, "Notify acquired");
> --
> 2.26.2
>
