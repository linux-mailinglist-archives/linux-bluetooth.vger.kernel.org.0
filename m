Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3871B1308DF
	for <lists+linux-bluetooth@lfdr.de>; Sun,  5 Jan 2020 16:51:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbgAEPvL (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 5 Jan 2020 10:51:11 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:34067 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgAEPvL (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 5 Jan 2020 10:51:11 -0500
Received: by mail-vs1-f68.google.com with SMTP id g15so30206724vsf.1
        for <linux-bluetooth@vger.kernel.org>; Sun, 05 Jan 2020 07:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=73UqDAHAeLeOmCQpBKC1MVRNc+FZxM3MT0Zqd5/3pyQ=;
        b=rCzoP+KwWjEBw916lWrFr5vDG7Qbp4wR2Sg7DMnJVJ8d0x671NqGypK4gYLA7SGXuh
         Nr5aOXSlonqdPSM+xB59rB070YIfRBfM33vUBGMKQZSRjzAM80fQeBiS7dGFWK84Gs3d
         oEx6yybKgU73QLM7PowKUlua1AeW8OwYvKOwZ2v0VIwlafGcDw69ZcTVIs1KT0oXmWt+
         lp1Dz7jkxH2P6LPNOeln7CZ6/nm/7l/VA7BwnANsxaYW/fdOvJj3QN4eGgsSIyj14e8R
         ID+utn7bvnEJ8bMIWkwTiCcrKC7uJxMQXZA4P/8/MoVpgb9loNh0MvVq0dIuiIjhE8y0
         V3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=73UqDAHAeLeOmCQpBKC1MVRNc+FZxM3MT0Zqd5/3pyQ=;
        b=tJgxPCGIN7wbeM8xpBMjAJtcRBaBvDRgcQmyxBVnaCkUbNWyDf1lA/UQNhgWvcppGc
         ItIxj2kkuGqBgkR1Wrun/B4oxDT9SvId4SRgq68+4uNBuUH44K/izqFcNaVKydwsSUER
         fxv717vDhojJZLvJs8Iy7fwqoikWoA0Lb61DMRMQdAim4/KcGxr4IhCz6OEvefaqktGk
         8uDJrccan2BOhsdcKpbirfTVC58jvt91wXTvesSOezuQhHww3kvuc+/86Rj1WbQUVRBB
         y3Pe5xGZzySZp1PRiUJfhsdu8T0P0Dn0zMAcidaN51iDKgw4rTYqrDmIR7Cv8VA+mkwf
         BNPg==
X-Gm-Message-State: APjAAAW4gyxRocN7Cdux0e6SJU5sfahOkf/F1uANugdLqmNvrRFth5Qg
        B8BOMF0EeZEqANp139Xap89cA3bLusHUa2WnKzw=
X-Google-Smtp-Source: APXvYqz2ssRhdqRdfxBfMJ6Tb3Q5mQ8c0ckFrADj6bgIWXYvvbq4ugPLdEhrYLhEGxhhC9srWScW8QfVsm1DdVfPZHg=
X-Received: by 2002:a67:2c83:: with SMTP id s125mr42063703vss.121.1578239470242;
 Sun, 05 Jan 2020 07:51:10 -0800 (PST)
MIME-Version: 1.0
References: <CGME20191206041323epcas5p35d6b7b22e50698d10af05d669001fd5a@epcas5p3.samsung.com>
 <1575605584-734-1-git-send-email-biradar.a@samsung.com>
In-Reply-To: <1575605584-734-1-git-send-email-biradar.a@samsung.com>
From:   anurag biradar <anuragbiradar@gmail.com>
Date:   Sun, 5 Jan 2020 21:20:58 +0530
Message-ID: <CAP1EGUJ1ir8K0HowPhM_h_P68qb63mB_QcRWkbvjOsfVYKkc5w@mail.gmail.com>
Subject: Re: [PATCH 1/1] meshctl: Fix infinite sock read
To:     Anurag Biradar <biradar.a@samsung.com>
Cc:     linux-bluetooth <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Fri, Dec 6, 2019 at 9:46 AM Anurag Biradar <biradar.a@samsung.com> wrote:
>
> When a stream socket peer has performed an orderly shutdown,
> then return value will be 0.
> ---
>  tools/mesh-gatt/gatt.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/tools/mesh-gatt/gatt.c b/tools/mesh-gatt/gatt.c
> index bff5947..1bd9868 100644
> --- a/tools/mesh-gatt/gatt.c
> +++ b/tools/mesh-gatt/gatt.c
> @@ -416,7 +416,7 @@ static bool sock_read(struct io *io, bool prov, void *user_data)
>         msg.msg_iovlen = 1;
>
>         while ((len = recvmsg(fd, &msg, MSG_DONTWAIT))) {
> -               if (len <= 0) {
> +               if (len < 0) {
>                         if (errno == EAGAIN)
>                                 break;
>                         return false;
> @@ -431,6 +431,11 @@ static bool sock_read(struct io *io, bool prov, void *user_data)
>                                 net_data_ready(res, len_sar);
>                 }
>         }
> +
> +       /* When socket is orderly closed, then recvmsg returns 0 */
> +       if (len == 0)
> +               return false;
> +
>         return true;
>  }
>
> --
> 2.7.4
>

Gentle Ping.

Thanks
Anurag
