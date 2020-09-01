Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBB6025861B
	for <lists+linux-bluetooth@lfdr.de>; Tue,  1 Sep 2020 05:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgIADT4 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 31 Aug 2020 23:19:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgIADTy (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 31 Aug 2020 23:19:54 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAE32C061366
        for <linux-bluetooth@vger.kernel.org>; Mon, 31 Aug 2020 20:19:53 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id c18so7861577wrm.9
        for <linux-bluetooth@vger.kernel.org>; Mon, 31 Aug 2020 20:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hW/k5b9/UGfTLPykwG66a89mG1GM25fvIAacARRYbQA=;
        b=e7E9L10SJs5IBDAZauvK6MQqSkpt3e/LYFm43uCeyFCp+3fz7mHQOxNxB7nLRJ1az0
         7kWra/Z+/3KeUDaZV6V2XsMrnlrAuzDOREOMpfa04rt7EXHl25JzJNHYTce/86uNLuEm
         JRdZjrnukkzsarZCXC/JgbIq0l5S1sxCQQ+Q13c8+rWoFyQqK4MwD3E1BxzcF56f0Mk+
         k1gjuCdtjope4C9GF+cfj1RxsuSbh/zBi/3KU9O2iPly8SOQuEKKzI7cbvYXpTovJj2u
         fEXddUtcb6oaWt4efwDcCMWHaqAeJ5R6hBrQCZcXDSYZ4XHOvm4h7VpopBILf+zch5BM
         cR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hW/k5b9/UGfTLPykwG66a89mG1GM25fvIAacARRYbQA=;
        b=olJ159smOLV71AQAYB9VIAQEjciegvtFGhRIPgSlyYP9GepjupwNlVEFwu6+xL4J2S
         xED5xx2LMJkS0Ok+bVUtPIlvLt4pXwCGHJSkPdqs/hSRLJDov+fJJ102XeaZ6RGTst1l
         WHXDyHK44+jv5YXwyYVV1X/rxgglgQ2+25ckoiWaowXLuk/WAJosTGCed82LKdx0MkbL
         WSGvlK8ldu92nIbEtlS+cMhCGhtdcPGnUTjZhKSg2oib9nyyY8lw2ITepOKA2EUuLfk0
         iFdkoJXkSSMjRtDhWvvchIHtzp0gax08fc9kyBdYjwm41f/a9ukeBA3HGuaqKYWHj9vY
         Bndg==
X-Gm-Message-State: AOAM531ekReeuMVIuNS+QWr9cPGtUC75I6oWJxZ7tWNabZx4XvwQtBpn
        lH5Pqep8GinihyICcZw/0ARdx9tgi4gFl5stxj9oDg==
X-Google-Smtp-Source: ABdhPJwiHkO4ftDBidx4SD3qYBXYINBJPu7nwrUNXd5vNl5bFOD0LEYL7Voe6+utfzz1un+WC0rXhARPz6AwHV9YlnU=
X-Received: by 2002:adf:dcc3:: with SMTP id x3mr4203661wrm.120.1598930392369;
 Mon, 31 Aug 2020 20:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200831153544.Bluez.v1.1.I6767a68b7e7b6cfb6d8046ee8b66c8e7d008d3e6@changeid>
 <CABBYNZ+Q84vmEDgfNuoYXAAMi6T3segO_hSkG5Oufc5F_w9Qeg@mail.gmail.com>
In-Reply-To: <CABBYNZ+Q84vmEDgfNuoYXAAMi6T3segO_hSkG5Oufc5F_w9Qeg@mail.gmail.com>
From:   Archie Pusaka <apusaka@google.com>
Date:   Tue, 1 Sep 2020 11:19:41 +0800
Message-ID: <CAJQfnxHyzFAG6zJfsuneLX_rW8yNkd2ZpKotHu3DV6vZABT-qw@mail.gmail.com>
Subject: Re: [Bluez PATCH v1 1/2] doc/media-api: Add Press method for MediaPlayer1
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        CrosBT Upstreaming <chromeos-bluetooth-upstreaming@chromium.org>,
        Archie Pusaka <apusaka@chromium.org>,
        Michael Sun <michaelfsun@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

The reason we introduced this method is because we need to send some
of AVRCP category 2 passthroughs in order to be able to qualify the
AVRCP absolute volume control as an audio source, despite we don't
actually plan to send any passthrough in the practice.
Therefore, which passthrough we send is actually not important (to
us), as long as we can do that to satisfy the requirement.
However, I see that there are over 50 passthroughs across category 1 -
4, and thought that it would be cumbersome to have a different method
for each key if one day we decided to support them all, hence the
generic method.

May I have some questions?
(1) Why do you prefer a dedicated method per key?
(2) Let's say I need to add a dedicated method for a single category 2
passthrough key, do you have a key in mind or I can just pick by
myself?

Thanks,
Archie


On Tue, 1 Sep 2020 at 01:16, Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Archie,
>
> On Mon, Aug 31, 2020 at 12:37 AM Archie Pusaka <apusaka@google.com> wrote:
> >
> > From: Archie Pusaka <apusaka@chromium.org>
> >
> > This allows us to send any passthrough command.
> >
> > Reviewed-by: Michael Sun <michaelfsun@google.com>
> > ---
> >
> >  doc/media-api.txt | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/doc/media-api.txt b/doc/media-api.txt
> > index dabc69936..fe7222eef 100644
> > --- a/doc/media-api.txt
> > +++ b/doc/media-api.txt
> > @@ -199,6 +199,14 @@ Methods            void Play()
> >                         Possible Errors: org.bluez.Error.NotSupported
> >                                          org.bluez.Error.Failed
> >
> > +               void Press(byte avc_key)
> > +
> > +                       Press a specific key to send as passthrough command.
> > +
> > +                       Possible Errors: org.bluez.Error.InvalidArguments
> > +                                        org.bluez.Error.NotSupported
> > +                                        org.bluez.Error.Failed
> > +
> >  Properties     string Equalizer [readwrite]
> >
> >                         Possible values: "off" or "on"
> > --
> > 2.28.0.402.g5ffc5be6b7-goog
>
> For now I would prefer to use dedicated method per key or are there
> many keys you would like to use from the upper layer?
>
>
> --
> Luiz Augusto von Dentz
