Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5E31109367
	for <lists+linux-bluetooth@lfdr.de>; Mon, 25 Nov 2019 19:20:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729332AbfKYSUN (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 25 Nov 2019 13:20:13 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:36861 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbfKYSUM (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 25 Nov 2019 13:20:12 -0500
Received: by mail-qk1-f194.google.com with SMTP id d13so13661697qko.3
        for <linux-bluetooth@vger.kernel.org>; Mon, 25 Nov 2019 10:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=W09lgIqIKvECTOE849gv8T7YDNLO2Wc4fhvJ0YJldxk=;
        b=ERy+HFLCmw98rZ+6jHEb6CK3h+hzq2Xd1fFuuD5w5bfjxs7aw6AgNsqMmhI3QlbWoC
         y0EfJHErAyaz5xlU7Jv89vsAFHpCFp5adnNr6SmEtm7k5JicUESHRlKQftaWhofNPGO/
         2k6Bym+4k9FYiNEA40m6ydBprmxzen/r0nvrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=W09lgIqIKvECTOE849gv8T7YDNLO2Wc4fhvJ0YJldxk=;
        b=JBRlqQS3rnl2e383ppfnZHXFl5/RETGSqBw9kaxxK7XVwSpeGBqbg1dsMABkU/9/LC
         TCntHhTIZmUeyzam95jwM9sOxmVjs+TgsykwcE3z1rVQJrp1Z6JvcqNcg+pIahxS1qBj
         dTpruHcrLgcWNxIdV8BXr4JVyF1UEi6NlZjTvThiuZliuO8SigZgmccypuCOdT/XBoVb
         7MMvAal0GLV9EFf/QCfo8epDnZVO3Xy0kPZqozulyqo3G2+iuTzTFmBIBxvx3VcJOFQk
         Q3jA7mWIA86B3n2U4oQQWPL8GmRxnh94kKegHS3rPKeUtiob1xaZDe5tnJJSmh7hTF4E
         ntnA==
X-Gm-Message-State: APjAAAW/Xoxmb/1bdCqcPeoSruQW82OgIQbER0sp6rY8XxBgDqrFl6Tr
        xBCf4fxqV95ivGSpl7P7zdZSPdP4vemgqMhDxQHpyQ==
X-Google-Smtp-Source: APXvYqyViSiFgUBvDzO1mVVyfrDrv1aJlHc6bYxT/J8Hw5dcdeuarzA4nQsAObckQJK0CIoKANHAPwHuY9MKcyA5yUo=
X-Received: by 2002:a37:5b02:: with SMTP id p2mr27051982qkb.419.1574706011770;
 Mon, 25 Nov 2019 10:20:11 -0800 (PST)
MIME-Version: 1.0
References: <20191118192123.82430-1-abhishekpandit@chromium.org> <1CEDCBDC-221C-4E5F-90E9-898B02304562@holtmann.org>
In-Reply-To: <1CEDCBDC-221C-4E5F-90E9-898B02304562@holtmann.org>
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date:   Mon, 25 Nov 2019 10:20:00 -0800
Message-ID: <CANFp7mXNPsmfC_dDcxP1N9weiEFdogOvgSjuBLJSd+4-ONsoOQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] Bluetooth: hci_bcm: Additional changes for BCM4354 support
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-bluetooth@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        netdev <netdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Ondrej Jirman <megous@megous.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hey,

It looks about the same as one of my earlier patch series. Outside a
few nitpicks, I'm ok with merging this.

Thanks
Abhishek

On Sat, Nov 23, 2019 at 2:04 AM Marcel Holtmann <marcel@holtmann.org> wrote=
:
>
> Hi Abhishek,
>
> > While adding support for the BCM4354, I discovered a few more things
> > that weren't working as they should have.
> >
> > First, we disallow serdev from setting the baudrate on BCM4354. Serdev
> > sets the oper_speed first before calling hu->setup() in
> > hci_uart_setup(). On the BCM4354, this results in bcm_setup() failing
> > when the hci reset times out.
> >
> > Next, we add support for setting the PCM parameters, which consists of
> > a pair of vendor specific opcodes to set the pcm parameters. The
> > documentation for these params are available in the brcm_patchram_plus
> > package (i.e. https://github.com/balena-os/brcm_patchram_plus). This is
> > necessary for PCM to work properly.
> >
> > All changes were tested with rk3288-veyron-minnie.dts.
>
> so I have re-factored your patch set now to apply to latest bluetooth-nex=
t tree and posted it to the mailing list. Please have a look at it if this =
works for you. If it does, then we might just apply it this way and focus o=
n getting detailed PCM codec configuration for all vendors in once we have =
a second vendor to unify it.
>
> Regards
>
> Marcel
>
