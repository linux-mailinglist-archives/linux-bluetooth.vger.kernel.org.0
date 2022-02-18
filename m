Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B3B94BC19C
	for <lists+linux-bluetooth@lfdr.de>; Fri, 18 Feb 2022 22:16:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237372AbiBRVQF (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 18 Feb 2022 16:16:05 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236379AbiBRVQE (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 18 Feb 2022 16:16:04 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D94E23DCDF
        for <linux-bluetooth@vger.kernel.org>; Fri, 18 Feb 2022 13:15:47 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id w63so712347ybe.10
        for <linux-bluetooth@vger.kernel.org>; Fri, 18 Feb 2022 13:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KpI0l6iKOyILMqU0thl72wCWKApU5a9TdsEdEmKeIC8=;
        b=p6JlrJQ0KqA5ukrqqAxr4iK+RZ9UcL2FGoVuJ1vjKR5/eGEu6ELBJb8Amh3LK2Zzd9
         F6RjugzRXGdJCaJDotorV1n10NNqHLL7Tl+mXPl3bTSpXq7A2dHbGVEKm5mExCoFb8Gf
         J4Bpjx3k6Gqgt1iaUNno/Cvn8d3aXnnlJ2sNNBn9G0KZyqHFzPHEN2tveZ3ZinRN99ZF
         Vi/A89ME+/cfWVx/ow5LR6aC0dFA27rMLPLtPoZhx936U0e6cggt1w1nj9GhE6dqIijE
         s48X/OKCwgj6iL+A85KSHkyjW1V13WW6hqORnnvGVCo8/89RR0jzbRag9nYQGxz/TjXX
         QIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KpI0l6iKOyILMqU0thl72wCWKApU5a9TdsEdEmKeIC8=;
        b=bf7QNfNSo/FMTp2QZvfzFQerY6dXdwFPSR2qMmkHofF5sZd13xEzNNOOs9QcbBsMI4
         YYST2R/GCqPGaITfKS8wQvPZZjYimVo8Kop7cOA+XaijMKFs0cSdUobh6Sk/8/rZyply
         n3Lhq5ggN/Ej5PembNpZQD+oP+3e4c3lmib2/Z5VwBe/9m0QdmSwWtR9d9c+UbPzfy3S
         Jg9mWOhtP4PKQv2LWkds28aYVYHA1h0Nxfyb+xIrK+7I/4mqnc0jSv6CZ8J3lJdXotUb
         iRMZmBF6LLJg4rlPz9dZk2l+njqJq0peha/hFjUVXBsp5CSkNhKt38lMy/XgCobWlpe+
         QBkA==
X-Gm-Message-State: AOAM533gF9s1zmfcWgXdlAHpXPZqX7IJC/9K56SsyX8IOAwW+wQEvEzD
        nTOJ1SbwkqWn0VVyiFda1L6QAnRa0ZGcQLrubFM=
X-Google-Smtp-Source: ABdhPJw424OFop1Von5O35fsv2sW0CBBtNqZRjVmOjnJ09pVy2UbU9nvwbTmZc8gc96TqCCKbstwiExuzsEMwwHK+XA=
X-Received: by 2002:a25:8546:0:b0:61e:1d34:ec71 with SMTP id
 f6-20020a258546000000b0061e1d34ec71mr8883045ybn.259.1645218946412; Fri, 18
 Feb 2022 13:15:46 -0800 (PST)
MIME-Version: 1.0
References: <f610b069-07ab-1004-e8f1-b84533593c92@gmail.com>
 <CABBYNZLA6bRCxd=Tse_XbUT8ReBo4QjvstSassfQAcTX+Fk9_g@mail.gmail.com>
 <b50b9b75-96ea-0d93-3687-3a79cdec5419@gmail.com> <CABBYNZKAUMOZ8vhk2ATPOaVHbcqCTg-DMD2vypkx_CTOjeVg2g@mail.gmail.com>
 <6bec2be7-a411-c5bf-6e5d-b3efee33b834@gmail.com> <CABBYNZLAZGoB1JKW63SNJuFB-4raDvHjjEk4w8y0K1MLwe4b7A@mail.gmail.com>
 <b7a2b073-fd69-36a4-6ce0-cb1b942ccde6@gmail.com> <CABBYNZKjUYAqctfpap2f36TcBuJFk0wX5P8jkUjpw1qqupeb0A@mail.gmail.com>
 <72b3b0ee-cca0-3804-ce78-1345c4590963@gmail.com>
In-Reply-To: <72b3b0ee-cca0-3804-ce78-1345c4590963@gmail.com>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Fri, 18 Feb 2022 13:15:35 -0800
Message-ID: <CABBYNZJL4YCpXHL8ihSFh04fEGAqcB7K8a9aR22E6TwB2Wj0Tg@mail.gmail.com>
Subject: Re: Lenovo Legion M600 wireless bluetooth mouse connected and paired
 yet not working
To:     Andrey Butirsky <butirsky@gmail.com>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
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

Hi Andrey,

On Fri, Feb 18, 2022 at 3:55 AM Andrey Butirsky <butirsky@gmail.com> wrote:
>
> On 17.02.2022 02:10, Luiz Augusto von Dentz wrote:
> > Hi Andrey,
> >
> > On Wed, Feb 16, 2022 at 2:36 PM Andrey Butirsky <butirsky@gmail.com> wrote:
> >> Tried BlueZ 5.63 on my Fedora installation, no luck. Will try to build
> >> head if no better idea..
> > If that doesn't work I'm afraid you will need a dedicated kernel
> > driver in order to deal with its HID reports since BlueZ just forwards
> > the reports to the kernel.
>
> Important addition: the mouse does work on Android 8.10.
>
> Does it mean Android has that special HID driver that missed on Linux?
> 8.10 came out long before the mouse even existed..
>
> Do you have explanation?

No, in fact android seems to also be using UHID, does it uses a vendor
app to set it up?

-- 
Luiz Augusto von Dentz
