Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0995AB3C2
	for <lists+linux-bluetooth@lfdr.de>; Fri,  6 Sep 2019 10:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388889AbfIFIN2 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 6 Sep 2019 04:13:28 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44508 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbfIFIN1 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 6 Sep 2019 04:13:27 -0400
Received: by mail-ot1-f67.google.com with SMTP id 21so4933167otj.11
        for <linux-bluetooth@vger.kernel.org>; Fri, 06 Sep 2019 01:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FVr0EfphfWPjVA/FX/Uzaty1rCHgw15nNOatw9D6lso=;
        b=XH2evxw6ROoM0G1/6rM+CGNw0O0SefSX56io8enDL11AelW9aZ78PwOCBEIwNnhUfq
         XdSOrdwgwhs3p+YzDR7Vme2Gxy74PZdEpZrrZSOb5ZxpaE68NlHoVsv9fuRtI+PjQeFM
         JfH3KG6Szyr9k76e0Y7bm7F4r6V/ShiLExaxZyACOUQXn4H8xbrDsehHJujzkh9eOktS
         Tk2uzjl7QdiVy0S14xQZC2RwU8ZaCNtzKCSalVjfOP2S2/mBdJkuJgzAsueGIUlYubzb
         vovSE7Bx4c2Cs0dyifHwe4+dlBl0gLwkcqTTZ00liHRnKJt1S258H0wEWTXXjN9O6MS0
         Q/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FVr0EfphfWPjVA/FX/Uzaty1rCHgw15nNOatw9D6lso=;
        b=nH7ACLAIfa7ddmrdxtWm818zlT4vj07zajydf6k5GvhcYpEAu7G/1mbBdM/kysjOrY
         pUYc5586uifwVC0l7XGe7ovDzeP7IsyZck2FpbNNNrby4PntIGuNv/HaMDIIAOAwyYwL
         lIaKTcMBV3yL/n9AftOdxYS0ZxwP8hlyGq1Aif90mhc/V+lt5QlQQaa+Z5H6TnAP7UE1
         N6Ln3csGr/oSTL/aArZc2R8ofQg6Q4kxrz3RgvR64Rmc9Suo84bSIPH1gvSH+8jbV9Jp
         S+FSJ/9YwYG5acEB/YFILiXwiLzRDLbdDjqOY0PWU//jh5L71OzWUMKvlp5wUUgkZ3zX
         J/8w==
X-Gm-Message-State: APjAAAUA87k9NQaNg3ImiCVB8bu2tocxBEUmItBGWH4yiZ5/pzFNyTQI
        2QwB1NHzAcU9ikN8VQ77HLyWn56pFRsPoe4iNXo=
X-Google-Smtp-Source: APXvYqyteAcbIiZRSWc8IIB69H7BA2vO+hw8M/CR3A41rqFGJnqetG+Kt0Kx0kT6SLBwEhe1G6yjB+T2JDM0AqVNgPs=
X-Received: by 2002:a9d:734c:: with SMTP id l12mr584092otk.28.1567757606907;
 Fri, 06 Sep 2019 01:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190814230034.15031-1-rpigott@berkeley.edu>
In-Reply-To: <20190814230034.15031-1-rpigott@berkeley.edu>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Fri, 6 Sep 2019 11:13:14 +0300
Message-ID: <CABBYNZKs+gG6Pa17AySLHv5tp1KRfybEbR2c6kh5NTnjHsQcRA@mail.gmail.com>
Subject: Re: [PATCH BlueZ] shared/shell: fix help message typo
To:     Ronan Pigott <rpigott314@gmail.com>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        Ronan Pigott <rpigott@berkeley.edu>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi,

On Thu, Aug 15, 2019 at 2:57 AM Ronan Pigott <rpigott314@gmail.com> wrote:
>
> From: Ronan Pigott <rpigott@berkeley.edu>
>
> ---
>  src/shared/shell.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/src/shared/shell.c b/src/shared/shell.c
> index eac654f40..df621295f 100644
> --- a/src/shared/shell.c
> +++ b/src/shared/shell.c
> @@ -267,7 +267,7 @@ static const struct bt_shell_menu_entry default_menu[] = {
>         { "help",         NULL,       cmd_help,
>                                         "Display help about this program" },
>         { "export",       NULL,       cmd_export,
> -                                               "Print evironment variables" },
> +                                               "Print environment variables" },
>         { }
>  };
>
> --
> 2.22.0

Applied, thanks.

-- 
Luiz Augusto von Dentz
