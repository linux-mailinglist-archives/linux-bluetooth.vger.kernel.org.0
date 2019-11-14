Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F37BFCEA6
	for <lists+linux-bluetooth@lfdr.de>; Thu, 14 Nov 2019 20:20:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbfKNTU0 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 14 Nov 2019 14:20:26 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:42998 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbfKNTU0 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 14 Nov 2019 14:20:26 -0500
Received: by mail-qt1-f195.google.com with SMTP id t20so8022946qtn.9
        for <linux-bluetooth@vger.kernel.org>; Thu, 14 Nov 2019 11:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kkwRFJ8JxVgdpo/nC/ABdKBnp89T/DEojTkPf4HtCKM=;
        b=TLe7YGlj6WJefOzGFhO0G5c7NeQYJ1fI2d+sMS/QqoLjZaFilDPuds3IbV3kE37lVo
         CO/4LU6qfDO9dK9JYgsyVrB4x0i6I92khIntTjM8VlNQ4HlB9/KNpynBSRuZVvSQYTLh
         3IliyjzdXxiq9qvK9rdA3UveqIMBO/wqDlrXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kkwRFJ8JxVgdpo/nC/ABdKBnp89T/DEojTkPf4HtCKM=;
        b=W7hBFfUEtfsBXcQArvs29waYrXPyBccZL+C4rKBPzLKDV/uFJ3e46p3FT8OA53U5Ia
         75w/ZGzbDlb0PgSk+2LX1xadAxtr44iuhd3NnQ2bBtzA7cI/2scpz1zPCOA+7W0VThOw
         ftNG+83PKbhMR6dAHffE3HpAX2+iYnu1rYBAyaQAXtaYFXILZqUY8OcOI6PlszXeiy6M
         a5d/gaO7J8lWKqRhEC1mAkvRD5Y7T2LzHT869B9IA7D8HuT+pP7NOo/fWfatZxP9jTtI
         Dz7gHoEO1Z10tLOdQlaBld9Wiqrc1tkig3iyTNai+TXkK17yxPbPxotFIjlNiVIl49nA
         kigg==
X-Gm-Message-State: APjAAAV0DayXIFcbmHGra/rIDTbg8CY/Bq3tnRPRqb+hQz0s0oKG1Yrg
        A+pXuEgyzsai+dwdw3NEBB5QLr4uog8IuPDUA3RJTQ==
X-Google-Smtp-Source: APXvYqw1+jL9umsKndVRoE+d6jN4cpPkyHVFWUdzXu6CuGu8nopPMMAfao566XJYRUR0bHl2IAsw/1Oxc1hJMtnnnas=
X-Received: by 2002:ac8:754c:: with SMTP id b12mr9891870qtr.291.1573759225207;
 Thu, 14 Nov 2019 11:20:25 -0800 (PST)
MIME-Version: 1.0
References: <20191112230944.48716-1-abhishekpandit@chromium.org>
 <20191112230944.48716-5-abhishekpandit@chromium.org> <CAD=FV=UfGDAtePrDmsEsdCNsHQZwDkU8z6E=qzSu=opht7evpQ@mail.gmail.com>
In-Reply-To: <CAD=FV=UfGDAtePrDmsEsdCNsHQZwDkU8z6E=qzSu=opht7evpQ@mail.gmail.com>
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date:   Thu, 14 Nov 2019 11:20:14 -0800
Message-ID: <CANFp7mWT2GwkSEcE5SkxRnfOebHq2aYLoLh6dmCZ-HktUe+mYQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] dt-bindings: net: broadcom-bluetooth: Add pcm config
To:     Doug Anderson <dianders@chromium.org>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-bluetooth@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        netdev <netdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Ondrej Jirman <megous@megous.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Thu, Nov 14, 2019 at 9:29 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Tue, Nov 12, 2019 at 3:10 PM Abhishek Pandit-Subedi
> <abhishekpandit@chromium.org> wrote:
> >
> > Add documentation for pcm parameters.
> >
> > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> >
> > ---
> >
> > Changes in v4:
> > - Fix incorrect function name in hci_bcm
> >
> > Changes in v3:
> > - Change disallow baudrate setting to return -EBUSY if called before
> >   ready. bcm_proto is no longer modified and is back to being const.
> > - Changed btbcm_set_pcm_params to btbcm_set_pcm_int_params
> > - Changed brcm,sco-routing to brcm,bt-sco-routing
> >
> > Changes in v2:
> > - Use match data to disallow baudrate setting
> > - Parse pcm parameters by name instead of as a byte string
> > - Fix prefix for dt-bindings commit
> >
> >  .../devicetree/bindings/net/broadcom-bluetooth.txt    | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> > index c749dc297624..42fb2fa8143d 100644
> > --- a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> > +++ b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> > @@ -29,6 +29,11 @@ Optional properties:
> >     - "lpo": external low power 32.768 kHz clock
> >   - vbat-supply: phandle to regulator supply for VBAT
> >   - vddio-supply: phandle to regulator supply for VDDIO
> > + - brcm,bt-sco-routing: 0-3 (PCM, Transport, Codec, I2S)
> > + - brcm,pcm-interface-rate: 0-4 (128KBps, 256KBps, 512KBps, 1024KBps, 2048KBps)
> > + - brcm,pcm-frame-type: 0-1 (short, long)
> > + - brcm,pcm-sync-mode: 0-1 (slave, master)
> > + - brcm,pcm-clock-mode: 0-1 (slave, master)
>
> Since these are optional your patch should describe what happens if
> they are not present.  I think in patch #3 of the series you guys are
> discussing it, but whatever you end up with should be documented here.
>
Yes, I think I will document the default values here as well.

> That actually made me realize that this is patch #4 in the series.  To
> be pedantic, bindings are supposed to be _earlier_ in the series than
> the code that implements them.
>
>
> >  Example:
> > @@ -40,5 +45,11 @@ Example:
> >         bluetooth {
> >                 compatible = "brcm,bcm43438-bt";
> >                 max-speed = <921600>;
> > +
> > +               brcm,bt-sco-routing = [01];
> > +               brcm,pcm-interface-rate = [02];
> > +               brcm,pcm-frame-type = [00];
> > +               brcm,pcm-sync-mode = [01];
> > +               brcm,pcm-clock-mode = [01];
>
> I'm at least marginally curious why your example has a leading 0 for
> all numbers.  It makes me think you intend them to be represented in
> octal, though I don't know offhand if dtc uses that format for octal.
> I guess it doesn't matter since all your numbers are between 0 and 5,
> but it does seem strange.

It's a bytestring with a length of 1. See bytestrings under
https://devicetree-specification.readthedocs.io/en/latest/source-language.html#node-and-property-definitions

>
> -Doug
