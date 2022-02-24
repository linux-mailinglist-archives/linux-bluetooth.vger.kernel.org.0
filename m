Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E57494C2F8F
	for <lists+linux-bluetooth@lfdr.de>; Thu, 24 Feb 2022 16:26:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236257AbiBXP0N (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 24 Feb 2022 10:26:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235606AbiBXP0H (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 24 Feb 2022 10:26:07 -0500
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB5F622A284
        for <linux-bluetooth@vger.kernel.org>; Thu, 24 Feb 2022 07:25:37 -0800 (PST)
Received: by mail-il1-x133.google.com with SMTP id 9so1952398ily.11
        for <linux-bluetooth@vger.kernel.org>; Thu, 24 Feb 2022 07:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eBxrN36oywWw3XK2F0WmZKoM52lc2gAS0BisdshERCo=;
        b=ISQvkIqirnnDBdYOcW1sR7vpDwLACRfUWPqiEKfurONysgRKTpFGRA0q2sitDsnnhp
         ja7vW1Z9sPbDeqIkBuczTI07o7vn7quK3PEXmS2XgtzGfVYhdNpP75pmJ2AW8DsQ+AyG
         kUGa8KRPghqTCxuH+NMqsRFOFRe4RfzRsgeyfzh/gmco9MvWaZpMqAxUxyW6ShQVdR/P
         0nBUsnMqDJ1pM63paXqN6ybtvLiTBo+Y0dvkZgic75ADpxNemRzMXMaY/0z7dL+Lv8uy
         HlO9TsMrJHf/QNkLL0b4Nf3XNEk4xmjC12UoSbYZ46TbePCl3GQAm+od2SRCdUN6umOM
         QPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eBxrN36oywWw3XK2F0WmZKoM52lc2gAS0BisdshERCo=;
        b=CgN4ytm/fkSUJF/NGfsO3hbrsiI0qoYiqxPG4ksK6ts/Bl/OZMYVjAJYQbKG+NoG1i
         RO8Fn+38x07PQ4dDA+nO+OpboH/ClyrqXXOlcjhY6CUlq8qSIu5kIgYLsDPOlYerVnsa
         v/N2f+2SZ3iZOAuQkabU6prMamF5aEYfWBrX675LTg1ZfoBB+UQvbNjxJXawJp4YE6u2
         tazPpr+0fMPECOLJEKiWCXHU/foA4iWgYnMj+IttU0dxwmYyguKS3DcyWyLDnKnlsbcp
         gFf1/5p8yuAWjhnqROUQwnUoUaGH8Wfeh6pL44Z8u5QnyowJyV495kGZqdmFNjt+cUKz
         YAiw==
X-Gm-Message-State: AOAM532s/20iMnLIL96GOD3F0UVWNTPyfO4hSoQyYpyApcGPZ7FzpdW2
        Im+dmQrVhWIV8RiuJpKo8k/hhqkdcQVPh1iVKR8=
X-Google-Smtp-Source: ABdhPJwl/Ukc+0maSEFnue6gpJb6B4T0JPXtTePtU1QcrUbmmmWcjZOQz+LTTENg1oZs33TJPzack3zs0vQY2p3hRis=
X-Received: by 2002:a92:c243:0:b0:2c1:c5f5:bf5f with SMTP id
 k3-20020a92c243000000b002c1c5f5bf5fmr2712323ilo.243.1645716337167; Thu, 24
 Feb 2022 07:25:37 -0800 (PST)
MIME-Version: 1.0
References: <20220215015938.1950978-1-luiz.dentz@gmail.com>
 <E428782F-C1D1-43FB-8CB3-009BD97A2D14@holtmann.org> <c418c95d-339c-5b8a-5349-26078424abe4@leemhuis.info>
 <db329421-ff6c-50c9-69f6-ae8e1b9e9063@leemhuis.info>
In-Reply-To: <db329421-ff6c-50c9-69f6-ae8e1b9e9063@leemhuis.info>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Thu, 24 Feb 2022 07:25:26 -0800
Message-ID: <CABBYNZKT5fFoEscWuHqLtkHjJJgwwqePHSQy8Q3-dEgWFT5AWA@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: Fix bt_skb_sendmmsg not allocating partial chunks
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Thorsten,

On Thu, Feb 24, 2022 at 6:09 AM Thorsten Leemhuis <linux@leemhuis.info> wrote:
>
> Hi, this is your Linux kernel regression tracker again. Top-posting for
> once, to make this easily accessible for everyone.
>
> I sent below inquiry on Saturday and didn't get a reply; and I didn't
> notice any other activity to get this regression fix mainlined soon.
>
> Bluetooth maintainers, what's up here? I'd like to avoid getting Linus
> involved, but I guess I'm out of options if this mail doesn't get things
> rolling -- or alternatively an answer why this fix might better wait for
> the next merge window to get merged.

As you probably noticed we have some other regression going on, we are
planning to have a pull request to net.git once they are resolved.

> Ciao, Thorsten
>
> On 19.02.22 10:18, Thorsten Leemhuis wrote:
> >
> > [CCing Johan, Jakub and Dave]
> >
> > Hi Bluetooth maintainers!
> >
> > On 16.02.22 11:26, Marcel Holtmann wrote:
> >>
> >>> Since bt_skb_sendmmsg can be used with the likes of SOCK_STREAM it
> >>> shall return the partial chunks it could allocate instead of freeing
> >>> everything as otherwise it can cause problems like bellow.
> >>>
> >>> Link: https://lore.kernel.org/linux-bluetooth/aa3ee7ac-6c52-3861-1798-3cc1a37f6ebf@molgen.mpg.de/T/#m1f9673e4ab0d55a7dccf87905337ab2e67d689f1
> >>> Fixes: 81be03e026dc ("Bluetooth: RFCOMM: Replace use of memcpy_from_msg with bt_skb_sendmmsg")
> >>> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> >>> ---
> >>> include/net/bluetooth/bluetooth.h | 3 +--
> >>> 1 file changed, 1 insertion(+), 2 deletions(-)
> >>
> >> patch has been applied to bluetooth-next tree.
> >
> > Luiz, Marcel, thx for fixing this 5.16 regression and picking the patch
> > up for merging. But I have to wonder: why was this simple fix put into a
> > tree that apparently is meant to only get merged to mainline during the
> > the next merge window? That will mean this regression will bother people
> > (maybe Paul is not the only one that is affected by this) for weeks to
> > come and even make it into 5.17, before it gets fixed for 5.18-rc1.
> > Despite the lack of a "Cc: <stable@vger.kernel.org>" tag it likely will
> > get backporting to 5.17.y and 5.16.y afterwards, but the latter soon
> > after will be EOLed anyway.
> >
> > Correct me if I'm wrong, but that afaik is not how the Linux development
> > process is meant to handle such regressions. This approach also
> > contributes to the huge stable and longterm releases after the end of
> > each merge window, which some people see as a problem.
> >
> > I bring this up because there were other regression fixes in the last
> > few weeks that took such a slow path towards mainline. I also checked
> > MAINTAINERS and noticed you even have a tree that could feed fixes like
> > this to Linus via the regular net tree, but apparently you haven't used
> > it in quite a while:
> > https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git
> > I rechecked and noticed not a single bluetooth fix was merged between
> > v5.16-rc1..v5.16. I doubt Jakub or Dave are the reason, as they merge
> > fixes from downstream trees every week and send them to Linus shortly
> > after that.
> >
> > So why are things like that? Or is there something wrong with my look on
> > things?
> >
> > Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> >
> > P.S.: As the Linux kernel's regression tracker I'm getting a lot of
> > reports on my table. I can only look briefly into most of them and lack
> > knowledge about most of the areas they concern. I thus unfortunately
> > will sometimes get things wrong or miss something important. I hope
> > that's not the case here; if you think it is, don't hesitate to tell me
> > in a public reply, it's in everyone's interest to set the public record
> > straight.



-- 
Luiz Augusto von Dentz
