Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9353B1219EF
	for <lists+linux-bluetooth@lfdr.de>; Mon, 16 Dec 2019 20:32:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727188AbfLPT3P (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 16 Dec 2019 14:29:15 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:45184 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfLPT3P (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 16 Dec 2019 14:29:15 -0500
Received: by mail-vs1-f65.google.com with SMTP id l24so4839042vsr.12
        for <linux-bluetooth@vger.kernel.org>; Mon, 16 Dec 2019 11:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x8Xzx0seGNgO73hnwCUt78Q5JjYJnfBh8nshT5JtITU=;
        b=FJW4xgqSh5a/O2CUVNjPYRBXY74pPDy4QIoSGisOiMeSnHhVx4x7WmsEYq/C1aARh2
         o25dmJ5gkBc34HgKuBdX6vJoKfJ7vPb7WZLgliAToedhYlNr8nt1JngCb8UzCP1kFKmI
         QjeLH+Cs8rWWuVmAb72lCvAPcNVii/xoEU63s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x8Xzx0seGNgO73hnwCUt78Q5JjYJnfBh8nshT5JtITU=;
        b=MCVPyo6LIYJdWdhgRsMDI3rVowk4DM7WkOnB5nmyXSYNdQ+sVKF7uKMZx5MFsuBW7X
         s/44GnLj6Zz+cWMvMzEXYWiIdUOqusYREmUie5FqO7K7w49wtr/CuPxwdZzuVA/M+ILd
         BdzNFz99z2YSWOuyb2eb/nwqneIIKr+oaBHXW1tv/X4jaDDdpyZnNOxsN8A3kQ0hWAvZ
         PVtuSgzjk6Z5TFluWxrcd38w6GR9ZlmV+Y8494wCMPRCFjUFJl3lYNNNn7/SvkRuKoAT
         w1Prvq9C816iWghF3DA211E7D91+4VU6JkfHdIeFwomXh4Uy8BZaVAxBIhNXdg/JaGQg
         1+Hg==
X-Gm-Message-State: APjAAAWtmtFUwuQtv5529CmWY5g0kuJ9YyirP4AiGBgQKEQxsDsMEbLu
        rMLW5sSxxtUlaWxM0pKAf9SAdJyeG2NmcmLcaoftQA==
X-Google-Smtp-Source: APXvYqzq/Wjfn9HsXPu0Kmf0tLhdL8GHb4eZwK2nmAxrayk1ebVFL1ajC+pqXAwYewI3IgNW08qyvQE/D6dLOQc1TnA=
X-Received: by 2002:a67:d007:: with SMTP id r7mr349749vsi.93.1576524554661;
 Mon, 16 Dec 2019 11:29:14 -0800 (PST)
MIME-Version: 1.0
References: <20191127223909.253873-1-abhishekpandit@chromium.org>
 <20191127223909.253873-2-abhishekpandit@chromium.org> <4093066.yl7jOIBBcd@phil>
In-Reply-To: <4093066.yl7jOIBBcd@phil>
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date:   Mon, 16 Dec 2019 11:29:03 -0800
Message-ID: <CANFp7mV61sjQ2sy9hAtVQ5hUNmwRbytL+sDPe5eAHP50TwiMfQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] ARM: dts: rockchip: Add brcm bluetooth for rk3288-veyron
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Sorry, I was out last week and didn't get a chance to respond.

Thanks for following up on this. Happy to see this merged. :)

On Tue, Dec 10, 2019 at 2:32 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Am Mittwoch, 27. November 2019, 23:39:09 CET schrieb Abhishek Pandit-Subedi:
> > This enables the Broadcom uart bluetooth driver on uart0 and gives it
> > ownership of its gpios. In order to use this, you must enable the
> > following kconfig options:
> > - CONFIG_BT_HCIUART_BCM
> > - CONFIG_SERIAL_DEV
> >
> > This is applicable to rk3288-veyron series boards that use the bcm43540
> > wifi+bt chips.
> >
> > As part of this change, also refactor the pinctrl across the various
> > boards. All the boards using broadcom bluetooth shouldn't touch the
> > bt_dev_wake pin.
> >
> > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
>
> applied for 5.6 with Matthias' Rb.
>
> Thanks
> Heiko
>
>
