Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14ECF1C2389
	for <lists+linux-bluetooth@lfdr.de>; Sat,  2 May 2020 08:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726842AbgEBGY5 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 2 May 2020 02:24:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726273AbgEBGY4 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 2 May 2020 02:24:56 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ACC9C061A0C
        for <linux-bluetooth@vger.kernel.org>; Fri,  1 May 2020 23:24:56 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id c124so1803776oib.13
        for <linux-bluetooth@vger.kernel.org>; Fri, 01 May 2020 23:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W9lwjOniEuAKuv1D0IsLIIuaReo7GkR8tnFw1PkbGMU=;
        b=m72VPhNvDdiI2jDSMca6OSF/Dk7JGdvV8HCKv1aY6zuHcAaEIwADKpraBi1czLPp3V
         4Bu6lGVhTn4bTwNeMnfX+UnitcItJiO8yblmc14JXuU6g4b4zzo5zMW8o+loB7XQmhOq
         Yx4tW+stkYcuUXgiMzhDGkyqB6If4jigICzY4LzRsD1EdOJyucowD5V61SeYutD13G9q
         m09AVGH1aIK9bEceL8rHmQ/d+qXM3uHu4KkoIQg1kEA7DC2kAGvemun5z5otVAOMdDwP
         PR3l79vnYrrwCS1PO3deKpyiuOOZ0PCxQkimwZ/9kTHk5oO+neyekeyyNu4UJukNGrOM
         u8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W9lwjOniEuAKuv1D0IsLIIuaReo7GkR8tnFw1PkbGMU=;
        b=cu1Fut5tJ6KqGH/gGeM6Uuz0/bi8ReXYpcBFawix+ou/GcHqwq+8Iky6YD8zY9/v7z
         gj2zxaxGs2pNS67c2mxWjxYjp5y6yWzucRs0X+k28CcQPUMHq+DNK5igjcpWRUNMQQ2T
         FXAL0WyOLSMSgVGtSk7AZjbNtVnzARn9Ym3lN3L3HKUDnRz91xXeqXPnrsB11opXYj+J
         WD1DPfslXb0gv/WDSesLORLEYybRQP05aNePBMfvgKoYDdogh25mCXjo57uSxa6blV0L
         fqE4zT611BqefvDOCSGo7BrCEEjnXtjSPtn/ITAGx7fLfxFnS4sGgrNg3owfAR7WbUTr
         wS8g==
X-Gm-Message-State: AGi0PuaANoO4LbXp/ZFkVdudrWQIvXlMTLnjRtpYBR8/ggJaTocFr8gW
        HC7H1Tv/3nvY6x27r/Z+ZSbIPXBZYKaXMac2dO4=
X-Google-Smtp-Source: APiQypJAdgg05eD4SiQ50JO4Gb3QKMBceYskNID1tDkdBtanLSfklzaYNzeDTMygASCVzRNhZkjFQucyQtwV2fqfEyk=
X-Received: by 2002:aca:b5d5:: with SMTP id e204mr2285844oif.108.1588400695494;
 Fri, 01 May 2020 23:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200501144037.1684-1-alainm@chromium.org> <4195BFB9-1586-435F-8FC2-ED215959A591@holtmann.org>
 <CALWDO_W4AquYjw5LZR+pbFnPEB=shYKDH7_JDGHexpsXUnC7aA@mail.gmail.com>
 <215E5E68-A360-4DD7-8DBC-E46278729FC6@holtmann.org> <CALWDO_XG7PG8KCy0rraZZm0L12baSyWzxfCJnUkNBJX=APhQ_A@mail.gmail.com>
 <D425C825-409E-47B2-9DDE-C7FD98EE1AF4@holtmann.org>
In-Reply-To: <D425C825-409E-47B2-9DDE-C7FD98EE1AF4@holtmann.org>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Fri, 1 May 2020 23:24:44 -0700
Message-ID: <CABBYNZJVriDTDuEJ_8ctP8iAMH+UWkfy_VZTyJPsns8t3t66Wg@mail.gmail.com>
Subject: Re: [BlueZ PATCH v1] shared/gatt-client:Ignore orphaned characteristics
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Alain Michaud <alainmichaud@google.com>,
        Alain Michaud <alainm@chromium.org>,
        BlueZ <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Marcel, Alain,

On Fri, May 1, 2020 at 11:04 AM Marcel Holtmann <marcel@holtmann.org> wrote:
>
> Hi Alain,
>
> >>>>> The gatt discovery proceedure simplification to discover all
> >>>>> characteristics at once has exposed a device side issue where some
> >>>>> device implementation reports orphaned characteristics.  While this
> >>>>> technically shouldn't be allowed, some instances of this were observed
> >>>>> (namely on some Android phones).
> >>>>>
> >>>>> The fix is to simply skip over orphaned characteristics and continue
> >>>>> with everything else that is valid.
> >>>>>
> >>>>> This has been tested as part of the Android CTS tests against an
> >>>>> affected platform and was confirmed to have worked around the issue.
> >>>>> ---
> >>>>>
> >>>>> src/shared/gatt-client.c | 5 ++++-
> >>>>> 1 file changed, 4 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/src/shared/gatt-client.c b/src/shared/gatt-client.c
> >>>>> index 963ad619f..d604c77a3 100644
> >>>>> --- a/src/shared/gatt-client.c
> >>>>> +++ b/src/shared/gatt-client.c
> >>>>> @@ -632,7 +632,10 @@ static bool discover_descs(struct discovery_op *op, bool *discovering)
> >>>>>                     util_debug(client->debug_callback, client->debug_data,
> >>>>>                             "Failed to insert characteristic at 0x%04x",
> >>>>>                             chrc_data->value_handle);
> >>>>> -                     goto failed;
> >>>>> +
> >>>>> +                     /* Skip over invalid characteristic */
> >>>>> +                     free(chrc_data);
> >>>>> +                     continue;
> >>>>>             }
> >>>>
> >>>> should we add a warning here?
> >>> Is there a good way other than the util_debug mechanism to write  a warning?
> >>
> >> you could just use btd_warn() here. If this gets too noisy, we either remove it later or we introduce a btd_warn_ratelimited() or btd_warn_once().
> > This being under src/shared, I wasn't sure if that was acceptable to
> > add a btd dependency here, especially with the work to avoid it via
> > the util_debug.  Happy to do either way, just want to make sure the
> > guidance is clear.
>
> good point. My bad. You better leave the logging out then.

There is already some logging a little bit before so I guess we are
covered here.

-- 
Luiz Augusto von Dentz
