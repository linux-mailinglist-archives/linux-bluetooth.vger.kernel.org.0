Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92325DD8AF
	for <lists+linux-bluetooth@lfdr.de>; Sat, 19 Oct 2019 14:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725856AbfJSMDd (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 19 Oct 2019 08:03:33 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38204 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725792AbfJSMDd (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 19 Oct 2019 08:03:33 -0400
Received: by mail-ot1-f68.google.com with SMTP id e11so7224202otl.5
        for <linux-bluetooth@vger.kernel.org>; Sat, 19 Oct 2019 05:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=5I7O1O+xPdS3qOLwQ3d1t1JsbTBqfWGbJthe4msp3ZQ=;
        b=hnWJs/+P5c7FzaReAJrRI4M1Qmy8YsazdOBjuidZnoCKEIYq2HoIH+/8atBZ4d5mEy
         ash7eL6nS6S4/qepLUT54UNVwTW5MMbiXxPk0M2jAm7CUxiWi/7+sZgclqS593f8Ri0U
         mplZymHZALbWXVPi162jsLH6yliS/KQljaF+bq1iTRAYay/yyhnWZylqqo6gI1MBEvOt
         zWmOmPfsLY4d4BxN8+mwRRm9YA6a1GCF8xKVRHboe4IADncWASN1I6WUcEJqvzOIc67x
         vNj5oCEXq4id6DjBTO630+nkx9R7kNzUXLvFlQqUcvrGp+G2d2WTv2UAAkfuBpuQgwQL
         AwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=5I7O1O+xPdS3qOLwQ3d1t1JsbTBqfWGbJthe4msp3ZQ=;
        b=OevOQUF7hjWTgS5puTc0vS2boQnxpgy7/hDM3WE/TmSTPSw60cmkjf3jEd738/JJTm
         +0CRdQDP8mYlxRywuCwZOeOxwDP7SVDli+ciiMH1qSNF64MtErX8r4NRGZ+iND4kRxF+
         vrJMSIK0Zwqo6ZcvL8yhjjB8r0BP8d2IvhgTtLdWkzGNJBcBXxoCA6Lm8p/c7KLiggOa
         vi2CVGnvky6Sc4YBGDE0DA/xm0s7zlVr4Ky7qrkD5sj1/QKl33I+wCslWp33fetRMqt3
         9IZmg3A+4Owq+PphHnRozjnYyo2id0CRnP0xEzJUlpd7H7xXA3LNP7fN7O9eLkFVsbZ7
         AsFw==
X-Gm-Message-State: APjAAAWSSZMfH0xt5GBKrkgPTUv1XSrLlQWzIfufhhHtsvmu4ywnZqO5
        ImWRv70lhLirQhLofGiWtnfWoLafHRco83lYsLcb3OnH
X-Google-Smtp-Source: APXvYqzj6Tkuhe8qlq6FJd6su/DX6lnVRxUNV0hXeFFdqKvDgtul1GNbsCRqnB6jK002Ufv8KFdCXHOkfV+ODXe2XJ0=
X-Received: by 2002:a05:6830:1203:: with SMTP id r3mr11462990otp.11.1571486611577;
 Sat, 19 Oct 2019 05:03:31 -0700 (PDT)
MIME-Version: 1.0
References: <20191018105339.1297-1-luiz.dentz@gmail.com>
In-Reply-To: <20191018105339.1297-1-luiz.dentz@gmail.com>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Sat, 19 Oct 2019 15:03:19 +0300
Message-ID: <CABBYNZJc_Z_w2tTOrWj8RhfOgtvx72dFn7hFE=HehcKKUBX-fw@mail.gmail.com>
Subject: Re: [PATCH BlueZ] a2dp: Remove experimental flag for remote MediaEndpoint
To:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi,

On Fri, Oct 18, 2019 at 1:53 PM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
>
> This makes the MediaEndpoint and stable API for remote endpoints which
> aligns with RegisterApplication API which is already stable.
> ---
>  profiles/audio/a2dp.c | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
>
> diff --git a/profiles/audio/a2dp.c b/profiles/audio/a2dp.c
> index f98ec8505..e8262cdfe 100644
> --- a/profiles/audio/a2dp.c
> +++ b/profiles/audio/a2dp.c
> @@ -1761,7 +1761,7 @@ static DBusMessage *set_configuration(DBusConnection *conn, DBusMessage *msg,
>  }
>
>  static const GDBusMethodTable sep_methods[] = {
> -       { GDBUS_EXPERIMENTAL_ASYNC_METHOD("SetConfiguration",
> +       { GDBUS_ASYNC_METHOD("SetConfiguration",
>                                         GDBUS_ARGS({ "endpoint", "o" },
>                                                 { "properties", "a{sv}" } ),
>                                         NULL, set_configuration) },
> @@ -1837,14 +1837,10 @@ static gboolean get_device(const GDBusPropertyTable *property,
>  }
>
>  static const GDBusPropertyTable sep_properties[] = {
> -       { "UUID", "s", get_uuid, NULL, NULL,
> -                                       G_DBUS_PROPERTY_FLAG_EXPERIMENTAL },
> -       { "Codec", "y", get_codec, NULL, NULL,
> -                                       G_DBUS_PROPERTY_FLAG_EXPERIMENTAL },
> -       { "Capabilities", "ay", get_capabilities, NULL, NULL,
> -                                       G_DBUS_PROPERTY_FLAG_EXPERIMENTAL },
> -       { "Device", "o", get_device, NULL, NULL,
> -                                       G_DBUS_PROPERTY_FLAG_EXPERIMENTAL },
> +       { "UUID", "s", get_uuid, NULL, NULL },
> +       { "Codec", "y", get_codec, NULL, NULL },
> +       { "Capabilities", "ay", get_capabilities, NULL, NULL },
> +       { "Device", "o", get_device, NULL, NULL },
>         { }
>  };
>
> @@ -1862,9 +1858,6 @@ static void register_remote_sep(void *data, void *user_data)
>         sep->chan = chan;
>         sep->sep = rsep;
>
> -       if (!(g_dbus_get_flags() & G_DBUS_FLAG_ENABLE_EXPERIMENTAL))
> -               goto done;
> -
>         if (asprintf(&sep->path, "%s/sep%d",
>                                 device_get_path(chan->device),
>                                 avdtp_get_seid(rsep)) < 0) {
> --
> 2.21.0
>

Pushed.

-- 
Luiz Augusto von Dentz
