Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60335C07BB
	for <lists+linux-bluetooth@lfdr.de>; Fri, 27 Sep 2019 16:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727427AbfI0OjE (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 27 Sep 2019 10:39:04 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:38703 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726926AbfI0OjD (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 27 Sep 2019 10:39:03 -0400
Received: by mail-oi1-f196.google.com with SMTP id m16so5397921oic.5
        for <linux-bluetooth@vger.kernel.org>; Fri, 27 Sep 2019 07:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wWSROEV8RW0ondujQ3rdPkoiWybrO+/xVEfWa704mV8=;
        b=BsngVRIL7QkbuP6Pun+NoxAzuLOKqv3OAVqenjaNDhxWqyZuzyEKXq5QOwscu6DMqB
         Cs53kIKEDXpjHhj568Im7hQv7NPDVnKUlx1aeCafQcwauzElL1mSjn0zaCRo9mzfp/Ah
         dK/KUV5FxpUuUiNB4jFb/FpfCrPmVr2FT+30avZwItV9l5Th9sZqE2ffk3EBFNqNWMa2
         o1hRTbxa8f3wRfsjeqhcaZVVEK0wuttVp3jeB0M/wgYxy003MvyqsPL0v5lcJgp0ffhu
         xKkQO3xJ627ulSsWQvp5xvHVs+auoMpd9riOThMa6O5+RGR6pwqEeVyYu8/McuLKB1ZD
         j9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wWSROEV8RW0ondujQ3rdPkoiWybrO+/xVEfWa704mV8=;
        b=eX4qlW3fp7AnFf0lgFWQB5rPuUwDfjRlqWo365jWW/AF7Gm0UM2o5G37PT7A7oGI36
         DiCP7jsLs8MInHzAh3uZ/msUOvb5IswMzwja2pTh89e20ew3SJ74hPh0b2cXViXREW0n
         O4X5qESvuZhqCabNJF39Rwbe14ou8uVsfWQ6hir9PAbIJm3pzY4LCWMnGtzuzxLBmkXX
         QgYTXclSGE6Bm0kwU9sohi0m6Te7On5piHG0Mc0xeUk0rRe9dzcxrdelOR1G3osZyH4R
         /c9Hr1p+em29xeLofBOxqkTVDHhgmROQvopHb8DhWxifi6vj1se3jzmlZJJNxkUqqGb2
         H3Hg==
X-Gm-Message-State: APjAAAW1BFJTtBI1kYMoeGEYfPVIFk6nJtzr45omI3af+Xe7yp7vGYcl
        KLOgA+eSqIgh2xUrwpagjdDRZ6DzBCTTHmDg1nB4xYNT
X-Google-Smtp-Source: APXvYqyJV/+JDrL6eWclRlTsvtvyX7RraNf/xiRx0r9IIY016TMdRosS3IWMuQWchJokGs3vDgFkYf7H1uIjQWaoSh4=
X-Received: by 2002:a05:6808:ab9:: with SMTP id r25mr6972714oij.8.1569595142800;
 Fri, 27 Sep 2019 07:39:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190811070045.15406-1-inga.stotland@intel.com> <fb9e9c39bf24900c84bd7fe63d91c8443895ee3e.camel@intel.com>
In-Reply-To: <fb9e9c39bf24900c84bd7fe63d91c8443895ee3e.camel@intel.com>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Fri, 27 Sep 2019 17:38:49 +0300
Message-ID: <CABBYNZ+Jdh1CSZZXs9asUdF6GUc-18QZzxgt6d74szQ8SvTSpQ@mail.gmail.com>
Subject: Re: [PATCH BlueZ 0/1 v3] ELL based mainloop
To:     "Stotland, Inga" <inga.stotland@intel.com>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        "johan.hedberg@gmail.com" <johan.hedberg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Inga,

On Wed, Sep 25, 2019 at 9:19 PM Stotland, Inga <inga.stotland@intel.com> wrote:
>
> Ping
>
> On Sun, 2019-08-11 at 00:00 -0700, Inga Stotland wrote:
> > + timeout-ell.c
> >
> > This patch addresses a need to enable using common mainloop for the
> > ell-based apps that desire to use common bluetooth fuctionality
> > (e.g., bt_shell).
> >
> > Note: A bit awkward callback handling there is due to the discrepancy
> > in the arg type for signo (signal number).
> >
> > src/shared/mainloop.h:
> > typedef void (*mainloop_signal_func) (int signum, void *user_data)
> >
> > and ell/main.h:
> >
> > typedef void (*l_main_signal_cb_t) (uint32_t signo, void *user_data)
> >
> > My guess is that ell derives the unsigned int type from
> > <sys/signalfd.h>,
> > where ssi_signo is defined as uint32_t. BlueZ is probably following
> > the
> > standard Linux signal handling, where signal is represented as an
> > int.
> >
> > Inga Stotland (1):
> >   shared/mainloop: Add ell-based mainloop implementation
> >
> >  Makefile.am               |  11 +++-
> >  src/shared/mainloop-ell.c | 126
> > ++++++++++++++++++++++++++++++++++++++
> >  src/shared/timeout-ell.c  |  72 ++++++++++++++++++++++
> >  3 files changed, 206 insertions(+), 3 deletions(-)
> >  create mode 100644 src/shared/mainloop-ell.c
> >  create mode 100644 src/shared/timeout-ell.c
> >

Applied, thanks.

-- 
Luiz Augusto von Dentz
