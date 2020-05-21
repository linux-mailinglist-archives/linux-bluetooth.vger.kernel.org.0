Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 798911DD30D
	for <lists+linux-bluetooth@lfdr.de>; Thu, 21 May 2020 18:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729532AbgEUQYv (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 21 May 2020 12:24:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728399AbgEUQYv (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 21 May 2020 12:24:51 -0400
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FEE2C061A0E
        for <linux-bluetooth@vger.kernel.org>; Thu, 21 May 2020 09:24:51 -0700 (PDT)
Received: by mail-oo1-xc41.google.com with SMTP id z26so1546946oog.8
        for <linux-bluetooth@vger.kernel.org>; Thu, 21 May 2020 09:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+aSdAGhDNk70FV8IK59ZoXJV2f5OF1mH42/BCOxBpBU=;
        b=W9i8Pixq1xHjD6vP6/Ltocl3o4+Y9iw5gQG3HzgSFYVGbcAxjUs3t5vQZVXmzze2cl
         83p1OZuER3vlzV8B3KAfmXdA8/9ByOzqvG5K+BujbX2QlatkdX1aCGORD8unys97lNO2
         QxcfjLQfaPptU6ZRczawAwt2v5BEgDgeLqy6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+aSdAGhDNk70FV8IK59ZoXJV2f5OF1mH42/BCOxBpBU=;
        b=BHBJtXvStKNCrEPAvxBBDnEwd1smrVk37d1/xeFZYHOmXdOU9nEPgdALXbY4/oT105
         Vl2CX5zhG30asGaB7wFIUF2yTZBFHz96i6fTbT0vx6nGCWSJ0BdhHRROO+jZUxQak5P0
         dH3blYFA1Rcumi/ErrP7vHVYxoCtKtFQ46jgOD19+MoxFHGafZMI11t/oxgljwj0+L8H
         ZC9/2aY/80BmY9ciY17OE/xYbzBsd1hlC3opsVEVslNq6pwaBAdDdrnDwhFTIj1BRVzH
         CsZUl6UJE4wxPFAfd4D7f5OeBamIA2KFMSZZdocMNPEQ2ccQSRdA2C2qEOIMOqOZ//gu
         3ZHg==
X-Gm-Message-State: AOAM5301YNN3Jep0qYshSZULHMmaZqRHGmm+csxUq43jJj7iLN10CByj
        VF/o4aQSMTkN6wi82FbdQgwSFUpWDW1yLv97U77iCQ==
X-Google-Smtp-Source: ABdhPJy47rmxE3NBLWx7D+kh2ze7QJFJ5PpaVWTEyFCVu0wqNl0m8RI6OEXyLgII3+CiVNEwklyX60We4w9FluM9f1I=
X-Received: by 2002:a4a:e759:: with SMTP id n25mr7907599oov.75.1590078290582;
 Thu, 21 May 2020 09:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200401221320.12105-1-sonnysasaka@chromium.org>
 <6A574E50-BBF3-4967-9C93-6F4B6DAFB47D@holtmann.org> <CAO271m=Rqq7QS6R362xLQWjbo6_ZLYPo-ttvevJmjqJ73HbAVQ@mail.gmail.com>
 <68C2E4A8-29E0-44D8-9D2F-F4E2354DE419@holtmann.org> <CAOxioNkw8g90tVwQjqgdpX38__f17JHHTTsqBZwCjEkjME0Zyg@mail.gmail.com>
 <6C21A2C1-6224-4FB6-B483-27B1C89864BE@holtmann.org> <CAOxioN=zqg59Kmc4rSEaceDuHd9PnS1-iHLkdN2DrUF_y=-40Q@mail.gmail.com>
 <EB4FAB97-6425-419D-89B8-D31A7D553BB8@holtmann.org>
In-Reply-To: <EB4FAB97-6425-419D-89B8-D31A7D553BB8@holtmann.org>
From:   Sonny Sasaka <sonnysasaka@chromium.org>
Date:   Thu, 21 May 2020 09:24:37 -0700
Message-ID: <CAOxioN=D2NVQn7YifUk=oATn-T0mcpQ3ABp1vPFQ_O1=Bup3sw@mail.gmail.com>
Subject: Re: [PATCH] device: Add device type property
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        Eric Caruso <ejcaruso@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Thanks for confirming, Marcel. I will come back with the modified
patch based on your feedback.

On Thu, May 21, 2020 at 12:02 AM Marcel Holtmann <marcel@holtmann.org> wrote:
>
> Hi Sonny,
>
> > I am okay with Types = ["le", "bredr"]. However, I don't understand
> > why a user should be able to change the Type, since this property
> > describes the fact about a peer device, not a local adapter. What does
> > it mean by a user changing the type of a peer device? Also, I don't
> > understand why HS needs to be considered in that property, since I see
> > org.bluez.Device1 objects as discovered devices either through Inquiry
> > (in which case it'd be "bredr") or Advertisement (in which case it'd
> > be "le"), or both. HS seems to be one of remote features rather than a
> > type. Also the HS information is also not readily available in the
> > struct btd_device, or even src/device.c, which suggests that it has
> > been treated differently.
>
> you are correct. I was thinking about the local role. My bad.
>
> Regards
>
> Marcel
>
