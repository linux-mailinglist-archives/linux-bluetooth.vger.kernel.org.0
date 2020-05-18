Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C7FA1D8A0D
	for <lists+linux-bluetooth@lfdr.de>; Mon, 18 May 2020 23:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbgERVbb (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 18 May 2020 17:31:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726250AbgERVbb (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 18 May 2020 17:31:31 -0400
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FE38C061A0C
        for <linux-bluetooth@vger.kernel.org>; Mon, 18 May 2020 14:31:31 -0700 (PDT)
Received: by mail-oo1-xc42.google.com with SMTP id z6so2390400ooz.3
        for <linux-bluetooth@vger.kernel.org>; Mon, 18 May 2020 14:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h1L30+ssZWk6kBDnGWOhdvCAkG1HH5xHLSQ9AVfCuBk=;
        b=d3qnUtI0ykhEbHbIPyaNhdm2JQXDiyQH8rY9jc92eew+9vkKu+ssG5meKecbtLlnr0
         IFU0ECOUFS8E04GNAcSz+sZz6dNDZ4fnJTETY1jGGgJ18ELirED1jm/r89HHxKZibx0J
         Sit/gQGQZorCuuk2gyYmBGwz1VoebzgWwiDzJJOaHfMLKlPQL+9xkq+aKSfHwV1IfUoc
         RUM7JRFNWCPsQkUDEW70y9t5ahIGwowYNFSAJkpk2QpiXx8u2CqWeb4jxgoaR9P9OKT9
         rLDN4ezGMtsb0TVdPxRAUleAIkcH1OH0Oz8ucB1VwD/2OAGK4goCkf75WaFtqF6qA5vr
         dkog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h1L30+ssZWk6kBDnGWOhdvCAkG1HH5xHLSQ9AVfCuBk=;
        b=H1bXzSIV1Irl+RQKT/BUvb/v0JD+0pP20GT9MrBFSAvTWVcIY6TsOPBM6WrDR68Sdk
         XIcuFH7cJsCSRBq17dtrogHfSxUOsHspaG48Sm0CkB1jaQ9bfh/6hMltjwXc/IJDMD4R
         j+DRLcC4E8PeN0Iejy2GNevGsoGeB8qPGd5JO7foLRFdXQElKRFSgjGH1XO5yCqUVns2
         8bHiDtyDLp8Nc3uzC2BbPc6gq6EcaQf6hOoDQyMuFhw/h7Wbg4tRhpUJ/DwzHcZsOdKT
         DQnGIF1AKU70F6eO1PRt8OyLMA4V80mXOBqu2dZgFdWIZle1Tetoj+8CxCKAiHzXMB6h
         hmUA==
X-Gm-Message-State: AOAM531DocRSZzjANoVsrCuI3fzjiDMNwt/qEPf4Y6EJOz93e/wZYrR5
        Dhyuhgb06dlZ1iDNLxaEKmBJ4L7lbfIA73wY81KO0w==
X-Google-Smtp-Source: ABdhPJzpaIVo5LLfknmytab7tcnyVsjgnokuUifiEdrVFPtUGEax321hzDLf9tCdXmwpAAvfuflf0tRru0tv5v4IDuk=
X-Received: by 2002:a4a:e795:: with SMTP id x21mr14142196oov.91.1589837490495;
 Mon, 18 May 2020 14:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200516210238.3184629-1-haadr@negentropy.io>
In-Reply-To: <20200516210238.3184629-1-haadr@negentropy.io>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Mon, 18 May 2020 14:31:18 -0700
Message-ID: <CABBYNZJj1PhYJ+fY7NcggY2aQS_Nt=6LXWnGopRAe+W9GRAUSw@mail.gmail.com>
Subject: Re: [PATCH] Set vendor, product and version for all HoG instances
To:     Haakon Drews <haadr@negentropy.io>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Haakon,

On Sat, May 16, 2020 at 2:15 PM Haakon Drews <haadr@negentropy.io> wrote:
>
> Set the the correct vendor and product ids for all UHID/HoG
> devices when they are unknown at HoG creation time.
>
> Before this change, when connecting a BT device with multiple HoG
> services for the first time, only the first HoG instance's vendor,
> product and version fields would be set by the DIS callback. This meant
> that all HoG instances except the first would be left with unset values
> and their UHID devices would then be created with '0000:0000' as their
> vendor:product ids.
>
> Signed-off-by: Haakon Drews <haadr@negentropy.io>

Ive dropped the line above, we don't use that on userspace.

> ---
>  profiles/input/hog-lib.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/profiles/input/hog-lib.c b/profiles/input/hog-lib.c
> index 8fb0283ca..a544e062c 100644
> --- a/profiles/input/hog-lib.c
> +++ b/profiles/input/hog-lib.c
> @@ -1387,10 +1387,19 @@ static void dis_notify(uint8_t source, uint16_t vendor, uint16_t product,
>                                         uint16_t version, void *user_data)
>  {
>         struct bt_hog *hog = user_data;
> +       GSList *l;
>
>         hog->vendor = vendor;
>         hog->product = product;
>         hog->version = version;
> +
> +       for (l = hog->instances; l; l = l->next) {
> +               struct bt_hog *instance = l->data;
> +
> +               instance->vendor = vendor;
> +               instance->product = product;
> +               instance->version = version;
> +       }
>  }
>
>  struct bt_hog *bt_hog_new(int fd, const char *name, uint16_t vendor,
> --
> 2.26.2

Applied, thanks.

-- 
Luiz Augusto von Dentz
