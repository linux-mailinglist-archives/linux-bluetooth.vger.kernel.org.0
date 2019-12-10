Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A888117C7A
	for <lists+linux-bluetooth@lfdr.de>; Tue, 10 Dec 2019 01:33:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727498AbfLJAcE (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 9 Dec 2019 19:32:04 -0500
Received: from mail-pg1-f180.google.com ([209.85.215.180]:35586 "EHLO
        mail-pg1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbfLJAcD (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 9 Dec 2019 19:32:03 -0500
Received: by mail-pg1-f180.google.com with SMTP id l24so7969047pgk.2
        for <linux-bluetooth@vger.kernel.org>; Mon, 09 Dec 2019 16:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=8evBcz4lmmsnelwBpdcYncDfyag5sO5/iQnS/q4ZdNE=;
        b=BqPM+szUPCtHdlyak+LwpzgEOtKX16NXvlBrqw1oVUryWfUXIp90VOF1E3XkoVSLjL
         v43BwyV/WnDbyLBsEZMyFSgvd8sh7K15AHZDwGGW9fVSBDAMrcJfF4lspFglA1wMfeNw
         Qwfz05tPp/L9QkOyXdxyRhCYxNV9FKbcWrf3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=8evBcz4lmmsnelwBpdcYncDfyag5sO5/iQnS/q4ZdNE=;
        b=jzGuDeBRhUPWTAsoS7nZPw9NrYDwyH6bGYjzFQph9T/rvsIZ+5zMKxMgCvSHDEif5E
         Um89pSTqcU/rotsF3z//aBBWFwTdW4VTTjoL8GbUlUP+Ouj+NAFqqT8BerXhnmoZBuYa
         y+TQGjeZ6qmrRJq1PPkGvx1Fcpa+n3y2oEZ31ZeYOS1up2xEr55L5nALr46gdJgcE7vj
         5wP0XnkEk9f6XI1ex7q0QCXUein6/SYkSIJJ83yz2dwbvbYTbkL2koPnLjeRvNyS6/5c
         SaXjJx9IU7LkNApeCba3ZXRfcD+ARf6yL/fWT+4wmszVAjX6b59uWfYP5nVDAESmwOij
         21Dw==
X-Gm-Message-State: APjAAAXrsR73KkancNEWuDdMwDOREv36PLO0zhoOOJEVvuNh2UcoY6B6
        fl2pTfDESJFmWQPvZzWHKbQcwA==
X-Google-Smtp-Source: APXvYqy4D9BE4heIvg/4fO4ARmu8vxDMpm3JJunhQwLtFR2lpNylP9ta2onTMh67OOu6CvvoPTIJWg==
X-Received: by 2002:a62:a117:: with SMTP id b23mr33014552pff.174.1575937923008;
        Mon, 09 Dec 2019 16:32:03 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id m45sm461387pje.32.2019.12.09.16.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2019 16:32:02 -0800 (PST)
Date:   Mon, 9 Dec 2019 16:32:01 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Marcel Holtmann <marcel@holtmann.org>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        BlueZ <linux-bluetooth@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/1] ARM: dts: rockchip: Add brcm bluetooth for
 rk3288-veyron
Message-ID: <20191210003201.GR228856@google.com>
References: <20191127223909.253873-1-abhishekpandit@chromium.org>
 <20191127223909.253873-2-abhishekpandit@chromium.org>
 <61639BAF-5AA0-4264-906F-E24E2A30088D@holtmann.org>
 <1788857.Va9C3Z3akr@diego>
 <CAD=FV=Xdrw1FC=DktQ8HjdEJcCKvdA3sx78gg-rn8=bBq=WrEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Xdrw1FC=DktQ8HjdEJcCKvdA3sx78gg-rn8=bBq=WrEw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Mon, Dec 09, 2019 at 03:56:14PM -0800, Doug Anderson wrote:
> Hi,
> 
> On Sun, Dec 8, 2019 at 4:03 PM Heiko Stübner <heiko@sntech.de> wrote:
> >
> > Am Montag, 9. Dezember 2019, 00:48:31 CET schrieb Marcel Holtmann:
> > > > This enables the Broadcom uart bluetooth driver on uart0 and gives it
> > > > ownership of its gpios. In order to use this, you must enable the
> > > > following kconfig options:
> > > > - CONFIG_BT_HCIUART_BCM
> > > > - CONFIG_SERIAL_DEV
> > > >
> > > > This is applicable to rk3288-veyron series boards that use the bcm43540
> > > > wifi+bt chips.
> > > >
> > > > As part of this change, also refactor the pinctrl across the various
> > > > boards. All the boards using broadcom bluetooth shouldn't touch the
> > > > bt_dev_wake pin.
> > >
> > > so have these changes being merged?
> >
> > not yet
> >
> > Doug wanted to give a Reviewed-by, once the underlying bluetooth
> > changes got merged - not sure what the status is though.
> 
> I have been out for the last week and am a bit backlogged.
> 
> I notice that this landed in our 4.19 kernel with +Matthias's
> Reviewed-by at <https://crrev.com/c/1772261>.  I don't feel any need
> to re-review this myself if Matthias has taken a final look on it, so
> unless he knows a reason why it shouldn't land then I'd say go ahead
> and land it.

Sorry, should have replied here in the first place. The changes look
good to me.

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
