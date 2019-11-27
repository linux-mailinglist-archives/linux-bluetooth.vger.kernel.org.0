Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1E010B3BD
	for <lists+linux-bluetooth@lfdr.de>; Wed, 27 Nov 2019 17:45:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727096AbfK0Qo7 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 27 Nov 2019 11:44:59 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38657 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbfK0Qo7 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 27 Nov 2019 11:44:59 -0500
Received: by mail-lj1-f194.google.com with SMTP id k8so14678390ljh.5
        for <linux-bluetooth@vger.kernel.org>; Wed, 27 Nov 2019 08:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=o7v0iri1xznoORrO8tt9R9HlpBOv+2jUUOI9T8+7g5U=;
        b=L5JE/7HgwqDGPqU4xJ+/WvhrLHA8UulFY6xcOs33EPf+Zld3f8dgrpWc6tv+fn+FH0
         IeorUXmMW6nseDw5VlsynruUEDBABDW8EmXZtZNso5fBQ+s/FHFb/ZExwHEJB8YX0IA0
         XXz5Q82h9qwYI4MIbOclIE/2aS3cIVdrZHP9U4uazDoL6BJvLYLaRDb4ehuVSCF3CCFF
         4oOW69AYMjk00AblBXLrsvrq5bfdjq+rJ6VwMky/T6NpzFdcp95eoU41H6WkLY06KPJH
         prVBwwFGMIZCXSX7GkFNYVlV26aagC3+siHm7QHAJ1sRe4BaZMuesX2WYXE9HxVs8lzb
         XyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=o7v0iri1xznoORrO8tt9R9HlpBOv+2jUUOI9T8+7g5U=;
        b=Nn5/StHd4Pw4CDEYujVOl/yvdq48x+lFyH7U+7ZIu+LU52s8rf4A7LfOz1xMrtCs1W
         ygZhDoxNaNlfcpQpvFlY97DJJdsDNY3vBpWZthP00zWDUwKYEIW3FuAA0z9KfJeZh1fH
         keHk6/sG40q1SU5MhEek27y5Z3b9uyALYfwo2Oz2fOh5zeaAimsV0XOrxhRsYfy7dlSg
         FVVMUndj3XG2O+EzgsQkW3iULhP9s18I3KK7/YNdyY5rplirrA1DdKDZuCH8iBzma7+1
         OgenvX5usAd2zSoo/l41bA45co/sMFxmnaPlJkywmd/8W+Iz9UHfK73Mynip3Y785FBk
         hMBA==
X-Gm-Message-State: APjAAAUwumIyeqVM8Lo3Ca1wc/E8kq8rEyG7PpXIGWM5TzdzCPpHi6iv
        Zdz/dPKf/Dy4P9X0SCu/fk6ZXtQSKZiF0HDQWtBy8w==
X-Google-Smtp-Source: APXvYqxr32NlM8HrdowZPbgWlfPnbKfZa5MI6cK9K1Fl2P5lwvdRBBQ07uRA1Fea+Fon0TePkBRUAqu4Uf2LqTQjUKI=
X-Received: by 2002:a2e:b4ba:: with SMTP id q26mr30919920ljm.60.1574873097023;
 Wed, 27 Nov 2019 08:44:57 -0800 (PST)
MIME-Version: 1.0
References: <20191126191452.23603-1-alainm@chromium.org> <7223C834-7E4C-4521-9C1E-CA7C2F26EC63@holtmann.org>
 <CABBYNZLg5+QM_+ZDBp3mfBnLq=3w05gTxb8=oRFLiYdTyDNsYA@mail.gmail.com>
In-Reply-To: <CABBYNZLg5+QM_+ZDBp3mfBnLq=3w05gTxb8=oRFLiYdTyDNsYA@mail.gmail.com>
From:   Alain Michaud <alainmichaud@google.com>
Date:   Wed, 27 Nov 2019 11:44:45 -0500
Message-ID: <CALWDO_V5SU59JSt5yTz+iswFdAFgG4nYxgyF7uTmkE0bVVvXQw@mail.gmail.com>
Subject: Re: [PATCH] Blocked key mgmt Api definition
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Alain Michaud <alainm@chromium.org>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

Yes, look for more patches from me on this next week.

Thanks,
Alain


On Wed, Nov 27, 2019 at 10:54 AM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Marcel, Alain,
>
> On Wed, Nov 27, 2019 at 8:02 AM Marcel Holtmann <marcel@holtmann.org> wro=
te:
> >
> > Hi Alain,
> >
> > > ---
> > > doc/mgmt-api.txt | 33 +++++++++++++++++++++++++++++++++
> > > 1 file changed, 33 insertions(+)
> >
> > patch has been applied.
> >
> > > +
> > > +     This command can be used at anypoint to add to the list of bloc=
ked keys.  Any connections that
> > > +     are attempting to use the keys will be terminated. If a device =
tries to distribute the keys during
> > > +     pairing, pairing will fail.
> > > +
> >
> > However, I ended up rewording this part since it doesn=E2=80=99t sounde=
d right to me. We can adjust this once we have the implementation to match =
against, but for now I kept it simple. Oh, and we need to stay within the r=
ule that it has to readable in 80 character wide terminal. So no long lines=
.
>
> Will there be a follow up change to add support for this in the
> daemon, I suspect we will need to have it given as a file or will the
> blacklist be just hardcoded?
>
> --
> Luiz Augusto von Dentz
