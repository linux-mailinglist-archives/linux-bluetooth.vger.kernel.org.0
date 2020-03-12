Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19CD5183D46
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Mar 2020 00:26:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbgCLX0D (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 12 Mar 2020 19:26:03 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:38802 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbgCLX0C (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 12 Mar 2020 19:26:02 -0400
Received: by mail-oi1-f196.google.com with SMTP id k21so7431873oij.5
        for <linux-bluetooth@vger.kernel.org>; Thu, 12 Mar 2020 16:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xFO91KX8Jhr6GKUhaE8mfxaaa5fDkLfqETUEih9egqQ=;
        b=WTTLjpoPAaYF+CigYNMmVpFXFgc1JdhnsSv8Q7iu6pbLMGmowjTe66iRyM0IOU0wVp
         8HDHQhHhaNmHHy2I7FQS+BBWcjdBP/HtQpSl328c1kR5IWsVXoyalFHsj3PO5d9QLFov
         e2jZqVa1FMDSh1mSLfGTgBE8ffAz7uOXoCkHTT3UTRmpJkcwxjUSehfUCqZzHMLVlDdu
         y9jIFrwFQKG1acjNFFNB5BF1RwdpKf8IfUM43+jPRExmD51C1AYfY1hJdiSZ0JRexqNH
         QAxIkCGymTd1egUZ5RozrRLyM4wUM9hpgTFSXsrIQaAfI3EAIxPwkx0czL+Ajh/DlJH4
         8Xgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xFO91KX8Jhr6GKUhaE8mfxaaa5fDkLfqETUEih9egqQ=;
        b=EspdoU6bV7Mz5+ljBurwSdA3cZRy8t7GvcWsL8GbinU/WLVALSaF7ymQQe8a6PWTdl
         WaTtiPawL3VmnSVzhaU3shYQA7qRbpA35k9k+uRGtclHZvSAXdHZTetfca7coabZULYW
         1/4770etERhaTHTfOz24QoEuYDlJ2lyVxtN3NLMDCM0EnKWqeHH/jS6RsPZMRPW3dWrp
         RqImiUGUVY5knVf/GcMpC+w2ZT8Zkzx7EgnUD3E/OOTpgmr/HB3bA+wyNpndd8l1nfHi
         OoIkywvajfpkO3ljKeg7YZImg1/lssbkQ44tY42DEPNkmMhphhDyLQ/Nfc7p4K8+w/jL
         mEug==
X-Gm-Message-State: ANhLgQ1x7YLAzVDUuwIFxjWhxhmUTujuAYsz2l0fU6/SqMMlU85LPbOk
        kKFJ6TXIrUNh2kZgeau6gYD7GZNEj91JXj3m5Khxf+AP
X-Google-Smtp-Source: ADFU+vtlbKGHePMzfu7zqEVnDicYyJTWwsXj6eiDBODDq9nkMow/N+IRkYsI64AN0Qs4BZmcO+GIpeyXko98Sf7IFtw=
X-Received: by 2002:aca:5345:: with SMTP id h66mr2919252oib.110.1584055561849;
 Thu, 12 Mar 2020 16:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200312135409.Bluez.v1.1.I24708f815f78397d51e263f5c68fc47ec0b76acd@changeid>
In-Reply-To: <20200312135409.Bluez.v1.1.I24708f815f78397d51e263f5c68fc47ec0b76acd@changeid>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Thu, 12 Mar 2020 16:25:50 -0700
Message-ID: <CABBYNZJiB706ghUVR57MVQ_J4hBswsh9Nwd1x-XVJaDQA+f47Q@mail.gmail.com>
Subject: Re: [Bluez PATCH v1] a2dp: Fix race when connecting and being
 connected at the same time
To:     Archie Pusaka <apusaka@google.com>
Cc:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        Archie Pusaka <apusaka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Archie,

On Wed, Mar 11, 2020 at 10:55 PM Archie Pusaka <apusaka@google.com> wrote:
>
> From: Archie Pusaka <apusaka@chromium.org>
>
> There is a possibility where BlueZ initiate an A2DP connection just
> around the same time as the peripheral also initiate it.
>
> One scenario is the peripheral initiate the connection first, so
> confirm_cb() on /profiles/audio/a2dp.c is called. However, while we
> are waiting for the authentication step, BlueZ initiate a connection
> to the peripheral, therefore a2dp_sink_connect() is called, which
> from there a2dp_avdtp_get() is called.
>
> If this happens: When calling confirm_cb(), chan for the
> corresponding device is created.
>
> Then when calling a2dp_avdtp_get(), chan will be found as it is
> created in confirm_cb(), and the value of chan->io is not NULL.
> However, a NULL is supplied instead to create a new session and
> assigned to chan->session.
>
> Then when calling connect_cb(), chan->session will NOT be NULL, as
> it is assigned in a2dp_avdtp_get(). Nevertheless, chan->session is
> always assigned a new value.
>
> These cause failure in connection.
>
> Therefore, fixing this by supplying the value of chan->io inside
> a2dp_avdtp_get() (it's going to be NULL on the normal case so it is
> fine), and check whether chan->session already assigned inside
> connect_cb().
> ---
>
>  profiles/audio/a2dp.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/profiles/audio/a2dp.c b/profiles/audio/a2dp.c
> index e8262cdfe..a5590b24c 100644
> --- a/profiles/audio/a2dp.c
> +++ b/profiles/audio/a2dp.c
> @@ -2118,7 +2118,7 @@ struct avdtp *a2dp_avdtp_get(struct btd_device *device)
>         return NULL;
>
>  found:
> -       chan->session = avdtp_new(NULL, device, server->seps);
> +       chan->session = avdtp_new(chan->io, device, server->seps);
>         if (!chan->session) {
>                 channel_remove(chan);
>                 return NULL;
> @@ -2136,10 +2136,13 @@ static void connect_cb(GIOChannel *io, GError *err, gpointer user_data)
>                 goto fail;
>         }
>
> -       chan->session = avdtp_new(chan->io, chan->device, chan->server->seps);
>         if (!chan->session) {
> -               error("Unable to create AVDTP session");
> -               goto fail;
> +               chan->session = avdtp_new(chan->io, chan->device,
> +                                                       chan->server->seps);
> +               if (!chan->session) {
> +                       error("Unable to create AVDTP session");
> +                       goto fail;
> +               }
>         }
>
>         g_io_channel_unref(chan->io);
> --
> 2.25.1.481.gfbce0eb801-goog

Applied, thanks.

-- 
Luiz Augusto von Dentz
