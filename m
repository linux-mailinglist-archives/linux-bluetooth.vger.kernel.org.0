Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 095BC1FEA48
	for <lists+linux-bluetooth@lfdr.de>; Thu, 18 Jun 2020 06:41:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgFRElJ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 18 Jun 2020 00:41:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbgFRElH (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 18 Jun 2020 00:41:07 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCC37C06174E
        for <linux-bluetooth@vger.kernel.org>; Wed, 17 Jun 2020 21:41:07 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id m2so3497876otr.12
        for <linux-bluetooth@vger.kernel.org>; Wed, 17 Jun 2020 21:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w3sCUp2rgh5RKQcJxoLWtXqBhZSKg+aDZdHcLr2HlEc=;
        b=afD18gdDE67H0h0b4sQ/cmZfMnPjMKrPPDwh/FeCraMwbEVPWkjwNTCm4Aw8ZX+yJq
         YkiefPRJcTW409X78bfn/7mZc/BlIcGjZocVC2Hc310OhyDYpmQD7fhMYkhtG7sRzXhQ
         64ghxxfsrgcgPtqrsbl186gG9LsWkYetrFu4ihvrFUQA5cAbArLwpKB9lxjP+og+CA96
         SebvqnSfOBIwdx26ZUiXOkiUlnV5YmQCO5I1/9JxsfGksbLygMBo3yYCcSZXXCKiraTv
         S0RBzrFF5BhTHW2OYdRubor7rVdV1mshQwDYBCQWFQ6ui0gD8axh94rqZei20lLxFEq8
         hMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w3sCUp2rgh5RKQcJxoLWtXqBhZSKg+aDZdHcLr2HlEc=;
        b=Opw0Bz3hrLw1wKLlkP3v+juI8AFi2CQVnIQzEy9x5dZqd5nj25wNbzKavhy0A7UFQL
         r/2/ub6WAOrWoSjhnBa17nDk0R1N1Lw1K1XtgWl4+n1HC9e91rYwtVBKrjahMXmijOC8
         catszPZx/nGxSDofhZi+Fp2ztS1zbFsiJJuJT9y5hwrEc1Wca6FuL9vNW+3hXOT6Nncc
         cgUG3qIlTC0HbMO90jvNO2+QQ2pWF00Jj/Rb7sOGfCjmGYPI4TEYUCfJ5rN9coBV+4zh
         LwidGgsStpjnE02U8KYe0eWKYdw2QURYu1m+IWg//as5VtigeSmkVzJ00prYypCOjAok
         TjyQ==
X-Gm-Message-State: AOAM531aO4apuZXPaF9JKkrqaitBKtZmFnDO1fOg7B/AgOQbdShF+mKV
        4EjlRMSQs4sNBHNihw6k18LzwOKjIj8QYJRzlCw=
X-Google-Smtp-Source: ABdhPJy0fP061ujxy0svICHV8SFHxsNe85jtgcU3FY2OmNXbsAQ4OG8Fp+Sb8zDncdLUk7ncaZ4xuf3c3gF6G6UCyYc=
X-Received: by 2002:a05:6830:1e85:: with SMTP id n5mr1916743otr.362.1592455267000;
 Wed, 17 Jun 2020 21:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200615145221.224747-1-alainm@chromium.org>
In-Reply-To: <20200615145221.224747-1-alainm@chromium.org>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Wed, 17 Jun 2020 21:40:56 -0700
Message-ID: <CABBYNZLTorEmM3t5BCWqYLGF6Q4e7kOXo2TTj20YShrFEV3Z0g@mail.gmail.com>
Subject: Re: [BlueZ PATCH v1] main: adding missing connection parameter entries
To:     Alain Michaud <alainm@chromium.org>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Alain,

On Mon, Jun 15, 2020 at 7:55 AM Alain Michaud <alainm@chromium.org> wrote:
>
> This patch adds the missing connection parameter entries for loading
> connection parameters from main.conf
>
> ---
>
>  src/main.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/src/main.c b/src/main.c
> index 77886d58e..ceb839d11 100644
> --- a/src/main.c
> +++ b/src/main.c
> @@ -411,6 +411,22 @@ static void parse_controller_config(GKeyFile *config)
>                   &main_opts.default_params.le_scan_win_connect,
>                   0x0004,
>                   0x4000},
> +               { "LEMinConnectionInterval",
> +                 &main_opts.default_params.le_min_conn_interval,
> +                 0x0006,
> +                 0x0C80},
> +               { "LEMaxConnectionInterval",
> +                 &main_opts.default_params.le_max_conn_interval,
> +                 0x0006,
> +                 0x0C80},
> +               { "LEConnectionLatency",
> +                 &main_opts.default_params.le_conn_latency,
> +                 0x0000,
> +                 0x01F3},
> +               { "LEConnectionSupervisionTimeout",
> +                 &main_opts.default_params.le_conn_lsto,
> +                 0x000A,
> +                 0x0C80},
>                 { "LEAutoconnecttimeout",
>                   &main_opts.default_params.le_autoconnect_timeout,
>                   0x0001,
> --
> 2.27.0.290.gba653c62da-goog

Applied, thanks.

-- 
Luiz Augusto von Dentz
