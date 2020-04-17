Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3EF01AD3A0
	for <lists+linux-bluetooth@lfdr.de>; Fri, 17 Apr 2020 02:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727868AbgDQA33 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 16 Apr 2020 20:29:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725858AbgDQA32 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 16 Apr 2020 20:29:28 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76EA7C061A0C
        for <linux-bluetooth@vger.kernel.org>; Thu, 16 Apr 2020 17:29:27 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id t199so615668oif.7
        for <linux-bluetooth@vger.kernel.org>; Thu, 16 Apr 2020 17:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WVtfL6YSBcLR8LvBQ5QkjL3IgWy6PCrGlutfgFSJLsU=;
        b=QSXBCSMkcgAvSOsWujVe4J7T0HcqwvNVCYsF3E9t+/vzpIxUwZQvJ5nwBrxq88ZVxD
         wK+/TOcFzHE1Xdaog5gxzSsAfaJmnCmYZpJJaUAi46GBlc+INARlX2GmSuf8bCSbCSiI
         IWTMTeRQQ3RGhnGrlSUyb0NS88d/4lFyyCUnDb9k6oF5dzfRhSp7fyRxxM4Nwy3fkAOh
         Jc5dbESDPPEWmVf+P9Wu7hFI9fwdI94xeYToU3xwe1UJZFPa3vsgKi/lqODb0VNiay6X
         V7M1VIlzTDAdbBURmkUchVizuRFk+wnVBJ93sKEfm8Lz6qiBRx+Uy0NY/rCOXQgxY0yn
         s/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WVtfL6YSBcLR8LvBQ5QkjL3IgWy6PCrGlutfgFSJLsU=;
        b=Nx35fosK++Lqs7Qig2mNpneE4EnvWDdI/8+bwgQJuvSrye7L7RaPRHGXgjV4XvIil+
         fehQzBoWqDiIsCjVC3iNQEQEWCFLZ+zGPGPs2RhJoiMTavYB945FViQWbs8fZ34qdnyM
         fbX8enMaCKceIb9X+r+vLe0jOhR6DXmfzYYwqFOaaAwqNLiyJn2Os8sZZB0zLEvGimzx
         Ejo9ye8PpG1Tbh3whmdMiBb+bJFUMxB6f9ipMKsB4VTpl5v2e4C/eLgy4d12McIAntfR
         m6rYm0pz4r0Th5Pi1aPKwvgFqpmWUMAr1pn1ITaxPdDO7gtUDVQM3pBUAuZ4tmHIzMZh
         +d0g==
X-Gm-Message-State: AGi0PuaWFFHJ9ve4JwHLF4ogL7nvURsRPnITJGbSnUQ9E1kgjaOIUb4q
        0d+FEQvqBOnm5mKm+Sy4tj3Wu54rHFop9U2r5QqMPOm7Jbs=
X-Google-Smtp-Source: APiQypKfN8U7ofooZuwGpSPPjxHIrE5Y13JkreC7bUCz4aIOcU9KONHDEtVXIjX3a2aMlmYKAevlrMV3lIvH8cAQALs=
X-Received: by 2002:aca:f584:: with SMTP id t126mr553566oih.108.1587083366613;
 Thu, 16 Apr 2020 17:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200403153331.101846-1-alainm@chromium.org> <CALWDO_VvEBqSgJgKHMM7D9G3tTrDEC2u0NUTrPyOsNuOC_F5kQ@mail.gmail.com>
In-Reply-To: <CALWDO_VvEBqSgJgKHMM7D9G3tTrDEC2u0NUTrPyOsNuOC_F5kQ@mail.gmail.com>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Thu, 16 Apr 2020 17:29:15 -0700
Message-ID: <CABBYNZJ0SF-atqPx6B26P4Coz2YUXMvSFnW=QnXPUD6i98o-4g@mail.gmail.com>
Subject: Re: [Bluez PATCH v1 1/2] doc:adding a WidebandSpeechEnabled Api
To:     Alain Michaud <alainmichaud@google.com>
Cc:     Alain Michaud <alainm@chromium.org>,
        BlueZ <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Alain,

On Thu, Apr 16, 2020 at 1:32 PM Alain Michaud <alainmichaud@google.com> wrote:
>
> Friendly ping on this series.
>
>
> On Fri, Apr 3, 2020 at 11:33 AM Alain Michaud <alainm@chromium.org> wrote:
> >
> > This change adds an adapter Api to report the controller's
> > widebandspeech enabled state.

I wonder if this shouldn't be queried over SCO socket, or simple fail
with BT_VOICE when using BT_VOICE_TRANSPARENT which is how what is
normally used when using mSBC.

> > ---
> >
> >  doc/adapter-api.txt | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/doc/adapter-api.txt b/doc/adapter-api.txt
> > index acae032d9..d8865e795 100644
> > --- a/doc/adapter-api.txt
> > +++ b/doc/adapter-api.txt
> > @@ -326,3 +326,11 @@ Properties string Address [readonly]
> >
> >                         Local Device ID information in modalias format
> >                         used by the kernel and udev.
> > +
> > +               boolean WidebandSpeechEnabled [readonly]
> > +
> > +                       Returns true if the adapter's wideband speech feature is
> > +                       supported and enabled.

There seems to be some extra empty lines here.

> > +
> > +
> > +
> > --
> > 2.26.0.292.g33ef6b2f38-goog
> >



-- 
Luiz Augusto von Dentz
