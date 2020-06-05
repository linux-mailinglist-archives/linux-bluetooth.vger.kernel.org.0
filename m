Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 814911EFE75
	for <lists+linux-bluetooth@lfdr.de>; Fri,  5 Jun 2020 19:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbgFERDq (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 5 Jun 2020 13:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbgFERDq (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 5 Jun 2020 13:03:46 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 466F2C08C5C2
        for <linux-bluetooth@vger.kernel.org>; Fri,  5 Jun 2020 10:03:46 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id o7so8147538oti.9
        for <linux-bluetooth@vger.kernel.org>; Fri, 05 Jun 2020 10:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qfUdVLb5wmRJix3JnOGHU89SkZD+8MyJ3Zw71ZbOi4Y=;
        b=cHGB7RcSeO/qZ/Ms0GBqefj70z80zmFjSb1nJAYRIy8vJ8IsHvv0Nh0kqjOKI3fBK1
         t1XinJTqawQnRMZoSUMNM+eW2ukRe2HP8/Onms7yYXxDBkM+8EKyDJlOGKuaW7X95kTg
         UooCX9oa0aLCiGnJx5IAlyA9C1fPCbOsjNbInWF2KueshHlricGaz+0svNnJ7Th6MjIy
         UjcQKi8MvgBwBjM08gfCR8zxh9egelCBYAKLyPK8fav0COD/oKWcZQcOUVX5ZOqCz3aL
         nvxRQA1WKZHtk41bbVFJw5PyW31tgDrD0V55vWgXwGm8s8oTmqB5fXOkAxxL9MnOfQcJ
         G8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qfUdVLb5wmRJix3JnOGHU89SkZD+8MyJ3Zw71ZbOi4Y=;
        b=BnfICix6NB3e1oCfAJVRBd9b59aXvHt3m2oYdZ1zLtQMgouc+5ZHgSyRJfwfttbjYC
         c+BG0TQRYe49OX5AHpkEMEvzK20suZW9GUF3g3lfroacJq6VNUzEpAJcsC4BK8qxuohY
         5QEYffohkTJBX8bREL0nSCow1lk6Y3VTuDSWzN8VF0KqD8RxIFcZP9hJT2QVRY1Y5yOY
         oVofxf3WLLerhU1m5zd27yHJTWbZ0hPuFpPLw0yd21ewiiFP5kcVqSXyDTrEy7CcBQeX
         TBX8CeEAFBkVFhOFUXBjECRyXBKo1sGH/xyooNIJE9XdQ0b0g6VaFVMbl59Y0bHf/xMD
         uIUQ==
X-Gm-Message-State: AOAM530zN/8duCodAKLdWeuIRF0/1fp/7/GHa068C8UdZWhg+rNotzyy
        USnaoP8jzcBN65vjIbHuCCO9LiL8lJZxCicX28M=
X-Google-Smtp-Source: ABdhPJz7ZJVKLdsidZ9HCFHsO8s1yE31mniWvGIOEi6paYOFyD3y1VgcWuM6UyLdTFqRoo6ebllDFGy1fA9yw2UgJKA=
X-Received: by 2002:a9d:2049:: with SMTP id n67mr7501108ota.177.1591376625661;
 Fri, 05 Jun 2020 10:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200605142541.28412-1-amitx.k.singh@intel.com> <20200605142541.28412-4-amitx.k.singh@intel.com>
In-Reply-To: <20200605142541.28412-4-amitx.k.singh@intel.com>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Fri, 5 Jun 2020 10:03:34 -0700
Message-ID: <CABBYNZ+iO_0djYfBmTyURC3NU_jpUHRHBr21zF-gNXNJLKySGg@mail.gmail.com>
Subject: Re: [PATCH 1/2] bluez:load Generic access service
To:     Amitsi5x <amitx.k.singh@intel.com>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Amit,

On Fri, Jun 5, 2020 at 7:31 AM Amitsi5x <amitx.k.singh@intel.com> wrote:
>
> From: =E2=80=9CAmitSingh=E2=80=9D <amitx.k.singh@intel.com>
>
> It allow to load generic access service to database
>
> Signed-off-by: =E2=80=9CAmitSingh=E2=80=9D <amitx.k.singh@intel.com>
> ---
>  src/gatt-client.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/src/gatt-client.c b/src/gatt-client.c
> index 20c3fbec2..2ae258da0 100644
> --- a/src/gatt-client.c
> +++ b/src/gatt-client.c
> @@ -2009,9 +2009,6 @@ static void export_service(struct gatt_db_attribute=
 *attr, void *user_data)
>         struct btd_gatt_client *client =3D user_data;
>         struct service *service;
>
> -       if (gatt_db_service_get_claimed(attr))
> -               return;
> -

This is actually done on purpose in order to avoid extra traffic since
the daemon already exposes this information in other interfaces.

>         service =3D service_create(attr, client);
>         if (!service)
>                 return;
> --
> 2.17.1

--=20
Luiz Augusto von Dentz
