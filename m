Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 236031FEA3D
	for <lists+linux-bluetooth@lfdr.de>; Thu, 18 Jun 2020 06:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725895AbgFREhl (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 18 Jun 2020 00:37:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbgFREhk (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 18 Jun 2020 00:37:40 -0400
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AB00C06174E
        for <linux-bluetooth@vger.kernel.org>; Wed, 17 Jun 2020 21:37:40 -0700 (PDT)
Received: by mail-oo1-xc43.google.com with SMTP id e8so898761ooi.11
        for <linux-bluetooth@vger.kernel.org>; Wed, 17 Jun 2020 21:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fRvmAycIU7hRPHbJnKzISWgKxuOylbMMsMyHfRRyswE=;
        b=LZwvX7EfTIwmoBHOHzgPE0TvXDVCmSov2EFmeVqkGtQpM/8s80YnKnTRDrt0gsR55Z
         y2h0SUXNE9j9WHY527qF1otP1uKBnR8WDhWk0bs4mdl9zugcmBkMW7lmPJ68jR/m0XUc
         45pYYGr1j3DKpv0g5qGnCwi5wnZqLTa1Gp1W55PyUg8/SDehZtfxBCgamW2aRM0LPLq/
         5pcWGZhRYaCbEs/SAMJlOSDfSQG4k/LihsiXWX3W/moaIhp2qjZe+m28MgUkKqhQLyhw
         tn+7SOJvlJ1PpTgoTPAXedM5MyeX0/wlHjEf4awzOeXC0hr8r0f1ytanzz4Qb8J3vYX9
         sWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fRvmAycIU7hRPHbJnKzISWgKxuOylbMMsMyHfRRyswE=;
        b=YKjE3zAH7nVbMQFsdKb5tB+uCCkLW3PhEqMHiaA3KHC7ClbdoGYuZqZCTdCJWNdFar
         7KVjg8R3excY1YLGxV8rvuIqEIP45uqXzL8owCyQsKsJI3Zrwl+WpsTTlxXTNZIx5OM1
         Y6BnP4f1N378UfaBtjNx8DByiQ7JwSzpYmcu8oXFN+eJIAm5WpDA5hCjhU1pymxInhMj
         X13DMFjsBQNf2xAp24HZVQEj5of6FbSwLYxYnrNmTqfo0Z8lMwOBfnJ5e6oE4sQ4nM3i
         C7tKTcl3siIJFjxCu1tc//0nkONihdrbjK1/L6egRb61N8qKTM6Ab0YlzkGAV5ZDOQJT
         E8kQ==
X-Gm-Message-State: AOAM531Rb75PDCl6QddsasSLOsnWOGYahLoYkHDZlMWl/AifiKzFGJuy
        Lz64e1roPxHIubYGLV8exaiF9PTz+3k+WzX7xnoTYw==
X-Google-Smtp-Source: ABdhPJzlvo6U4C5p9uGWZAGfG7Fdu9mc+cBfapCC6/L9LJeqwF2rnqJFFd/YRP2qTL/nEOpK/XGqqOBzfb+61LJIre0=
X-Received: by 2002:a4a:ddd7:: with SMTP id i23mr2481203oov.9.1592455059540;
 Wed, 17 Jun 2020 21:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200616155641.BlueZ.v1.1.I5d071a56cb3a8d3640abf7c41d96e8233f14f8e6@changeid>
In-Reply-To: <20200616155641.BlueZ.v1.1.I5d071a56cb3a8d3640abf7c41d96e8233f14f8e6@changeid>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Wed, 17 Jun 2020 21:37:27 -0700
Message-ID: <CABBYNZJGtcO=9Sgp+UzPoxCzS2=4SV4BaHxx30fLKHZFFTbHBQ@mail.gmail.com>
Subject: Re: [BlueZ PATCH v1] lib: Correct the string for a mgmt op
To:     Miao-chen Chou <mcchou@chromium.org>
Cc:     Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>,
        Alain Michaud <alainm@chromium.org>,
        Manish Mandlik <mmandlik@chromium.org>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Miao,

On Tue, Jun 16, 2020 at 4:00 PM Miao-chen Chou <mcchou@chromium.org> wrote:
>
> This corrects the string of MGMT_OP_ADD_ADV_PATTERNS_MONITOR to match
> mgmt-api.txt.
> ---
>
>  lib/mgmt.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/mgmt.h b/lib/mgmt.h
> index bb31156ab..fad1f3dfe 100644
> --- a/lib/mgmt.h
> +++ b/lib/mgmt.h
> @@ -1008,7 +1008,7 @@ static const char *mgmt_op[] = {
>         "Read Default System Configuration",
>         "Set Default System Configuration",
>         "Read Advertisement Monitor Features",
> -       "Add Advertisement Monitor",
> +       "Add Advertisement Patterns Monitor",
>         "Remove Advertisement Monitor",
>  };
>
> --
> 2.26.2

Applied, thanks.

-- 
Luiz Augusto von Dentz
