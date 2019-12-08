Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16B58116046
	for <lists+linux-bluetooth@lfdr.de>; Sun,  8 Dec 2019 05:12:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726453AbfLHEMA (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 7 Dec 2019 23:12:00 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:33273 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbfLHEL7 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 7 Dec 2019 23:11:59 -0500
Received: by mail-oi1-f194.google.com with SMTP id v140so3503256oie.0
        for <linux-bluetooth@vger.kernel.org>; Sat, 07 Dec 2019 20:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qoU+TzXI1T/jxVp6DkRd5FCE6Lv/eR23QggHUbmn1xo=;
        b=Ce2TRY82pqmfqi0LTvm2HPjTcbQkJn2Ig2BCMZTqOh+EJepbJaB5Xn9PUPw6wcECD3
         yWfeggC1yS69tFIk46s8b5uILKcdw2Wb5fMli6g1Ac6op+3Hb1W8N+/LXLcg6XPYvmdt
         O0DHgHTuh76PWzvVD+ujxbC4wpwzVcmpBV24m+SHoSTSh2ezV0IPygPPl1nuM37YFXi1
         EjJ9Pg1v9IHxQTs8UecMpTa50wq4HWwrWTKavttsob6STxj9HCR8LLlpTsEJxBulgARb
         7F/xWbo9x4EjpUZUuHdcUmL/OYwhwPSx44kfOyN/jSG+udxOrcKpOOpIWkjLtmEmLvve
         Ff5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qoU+TzXI1T/jxVp6DkRd5FCE6Lv/eR23QggHUbmn1xo=;
        b=pczjCvfsLPGmDSC62ouLc3a0CfhngJZg4XiMNB4aky4iduXGw240OOxJN1LbMi1VML
         xvK5neU73M/S75Z/8UN52ww+vFS3/NpzIL0sycVNoONSR8L/CmkA142WBXiKDzqp4po5
         8nDdgyjtOXisBWDB4umppsqcPqDQtdfrbvx9K5iDHiUglqjGOI2XDAc/UttRBrOFvjUJ
         bJjVRav+4IfWB9z9RWyYFttw6YiNGNxhOyxIs/bh4ZkXxnUklJUUbH/CmnnfQHHEvSLL
         OZqtaUQsL1whT5AoYoAEre9DdwT2FvZDjFVE4ut+oiWMS0YUVQkzVrwmmbl6N1ebGSAe
         0DsA==
X-Gm-Message-State: APjAAAWeeXxdyZbaDrF6Sov6RH+2As1wDYxEjFtE11jtzUE8XP7Baj+o
        JBLWNYrThdaGUUTU0D/0RRv9q5PSR/WwcL0axVYZm8L0
X-Google-Smtp-Source: APXvYqxDk6OjPrbA0UUlemhCxE7GuHynagNkdjtOB5snRhE2uYcPpsm61/b1oRil1fEfINdfI/Ji96WcbxD9rF4P8Sk=
X-Received: by 2002:a54:4f8e:: with SMTP id g14mr3056942oiy.8.1575778318610;
 Sat, 07 Dec 2019 20:11:58 -0800 (PST)
MIME-Version: 1.0
References: <CGME20191203094848epcas5p296450885dea6e4939072c7b8b50e71fa@epcas5p2.samsung.com>
 <1575366522-7742-1-git-send-email-s.syam@samsung.com>
In-Reply-To: <1575366522-7742-1-git-send-email-s.syam@samsung.com>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Sun, 8 Dec 2019 06:11:46 +0200
Message-ID: <CABBYNZ+BAGZv6vw_aK=t9J6RUhtefVLWFPD9Q2nQZJfejxiUuA@mail.gmail.com>
Subject: Re: [PATCH 1/1] client: Fix memory leak
To:     Syam Sidhardhan <s.syam@samsung.com>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Syam,

On Tue, Dec 3, 2019 at 11:51 AM Syam Sidhardhan <s.syam@samsung.com> wrote:
>
> ---
>  client/main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/client/main.c b/client/main.c
> index 68dabda..8bd0bac 100644
> --- a/client/main.c
> +++ b/client/main.c
> @@ -1792,11 +1792,11 @@ static void remove_device(GDBusProxy *proxy)
>  {
>         char *path;
>
> -       path = g_strdup(g_dbus_proxy_get_path(proxy));
> -
>         if (!default_ctrl)
>                 return;
>
> +       path = g_strdup(g_dbus_proxy_get_path(proxy));
> +
>         if (g_dbus_proxy_method_call(default_ctrl->proxy, "RemoveDevice",
>                                                 remove_device_setup,
>                                                 remove_device_reply,
> --
> 2.7.4

Applied, thanks.

-- 
Luiz Augusto von Dentz
