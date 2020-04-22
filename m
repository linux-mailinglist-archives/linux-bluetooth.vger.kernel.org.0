Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01E5D1B4887
	for <lists+linux-bluetooth@lfdr.de>; Wed, 22 Apr 2020 17:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbgDVPYr (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 22 Apr 2020 11:24:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbgDVPYq (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 22 Apr 2020 11:24:46 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE453C03C1A9
        for <linux-bluetooth@vger.kernel.org>; Wed, 22 Apr 2020 08:24:44 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id a8so1805392edv.2
        for <linux-bluetooth@vger.kernel.org>; Wed, 22 Apr 2020 08:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B1TftnPtnrSEPoU16eD2M6e3FXwAxSdcnJV604U4Mj4=;
        b=dGiEWwRgdBrB4rOrB6/Ic3W8Z68aiqzjegG/XXUIx5dhozpwXR2MGuZX3xdxHey/fY
         VIHSWtBdshjvgnFmqsjI5eA0xYec3JdiwGdGz4iZUdGIEUslFGT5dQ3wH9HVvZYnuD+S
         TwZWYiNIzz3f4xsXWFDomlMyh53drgE0FGC6PccHcxTIUjZEW1uvf19A0rsCzHPlaGrG
         0+WXUpUX0iDuE6Bc5t137ZDJZiyvKad0B12FMitGCNwbRmwysFjVp8gPZM1QWNuvoNWv
         x2u0KBpiwITzPaP8BXF5YYjvNNe57gs8EuK2ibCBdFZDt/sfGG+pzh2AYs7gxwLEP7qH
         xHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B1TftnPtnrSEPoU16eD2M6e3FXwAxSdcnJV604U4Mj4=;
        b=Pf9Mu2mJnixGL8/CIbF3A7L7hKQUP8x0nT3d6wPxPaBOpah5+2WnLJLEyfmVuAfBSu
         yRZ6eLTY7UC2gg5OtpamidRGgwWr9OQdP/beK5WilU//cF8ie3tpQZT9r4GlJ28NQjfN
         HtXoSvl53qjDWObW4so/LL3+MSqcGY0q5Vwk2lO6YtDi1QpiHha5M/udlQA/8Jjg4kuz
         N1SWEXD3EnXoHxHDGTqstWgNVrNkJf9EqjHP3EHBghFuQw9sFSCNtlud67hxN2gQLxia
         2Gr5UxOBAyxwjUbg+T20LYkt/OkFbdoN5bdXLS5tld3F5yvyi79aQbwoNA7dmQji2Q/4
         bHfw==
X-Gm-Message-State: AGi0PuY/1EJMY6db5bczhfTptn1vr7h+i97MzvTeW2FqRhTZ7a/CVSw7
        zu5NPjp79+h1lYlhIZ6GpAnus9ZbskffbgoRjzNe8to7
X-Google-Smtp-Source: APiQypLnS6yn4PUTVA0h3Mn2NIS7jaW4UA9tBz68Myavgvf5lApUBFI/VkWFL2L5JxXb6qcWFgL1PXRymFI8kHVRm1s=
X-Received: by 2002:a05:6402:1ad0:: with SMTP id ba16mr23935097edb.11.1587569083052;
 Wed, 22 Apr 2020 08:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAPHZWUeGeaN5jmNHv56VzSsdmCvS1WKfSnaYE+YCfd5E8+3S-Q@mail.gmail.com>
 <CABBYNZJ4MhhEWvxX+hw8fR9uOpqXd8XWQBsy2VjP_dVtL0R+7w@mail.gmail.com>
In-Reply-To: <CABBYNZJ4MhhEWvxX+hw8fR9uOpqXd8XWQBsy2VjP_dVtL0R+7w@mail.gmail.com>
From:   Yun-hao Chung <howardchung@google.com>
Date:   Wed, 22 Apr 2020 23:24:31 +0800
Message-ID: <CAPHZWUdaXVtde+i4jN16bHE1mznSX1gvyDXQwrspWcRMaSniug@mail.gmail.com>
Subject: Re: Auto-connect after disconnection from user on trusted devices
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        Sonny Sasaka <sonnysasaka@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Thanks for sharing your thoughts!

On Wed, Apr 22, 2020 at 2:12 AM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi,
>
> On Mon, Apr 20, 2020 at 9:30 PM Yun-hao Chung <howardchung@google.com> wrote:
> >
> > Hi linux-bluetooth,
> >
> > Bluez doesn't disable auto-connect for trusted devices even in
> > device.Disconnect. This causes users can't disconnect from peripherals
> > unless they untrust the device.
> >
> > The behavior seems to change into this way intentionally after this change:
> > https://www.spinics.net/lists/linux-bluetooth/msg72898.html
> >
> > I would like to understand why this change is needed and what is the
> > suggestion to disconnect a trusted device.
>
> This has been there for a while but if I recall correctly the problem
> is that we cannot really tell when the auto-connect was disabled,
> besides it was not really honoring that in case the daemon is
> restarted, etc, so instead of having yet another setting to persist it
> was simpler to just use the trust, or block, properties to control
> auto-connect which are persisted properly, that said maybe we can make
> disconnect auto block the device and then connect to unblock
> automatically but I think that having the application set the block
> property is probably clearer that we don't want it to be reconnected.
>
> --
> Luiz Augusto von Dentz
