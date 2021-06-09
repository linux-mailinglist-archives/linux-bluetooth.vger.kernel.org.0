Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0456C3A1B8E
	for <lists+linux-bluetooth@lfdr.de>; Wed,  9 Jun 2021 19:11:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbhFIRNv (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 9 Jun 2021 13:13:51 -0400
Received: from mail-yb1-f180.google.com ([209.85.219.180]:34786 "EHLO
        mail-yb1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbhFIRNu (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 9 Jun 2021 13:13:50 -0400
Received: by mail-yb1-f180.google.com with SMTP id i6so21877237ybm.1
        for <linux-bluetooth@vger.kernel.org>; Wed, 09 Jun 2021 10:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=26jC/wgBZ+t1Ap5tkofW0NlWVxgOjqt14XFXYTZhyC4=;
        b=kFjRh2cfpp7Sb35yP/Rkj5hjgxutlnQ2M22Z6wIOe4LDfoZvDtqrrq8IaGyFB2PoVc
         nEkymGsVDmZQwEDSDyib8z/OQ0A8mtp5z1AOqZTNMTvYxrXNUU26mmk6fAwnoF9aliay
         k+FziOh3jBNynVfNc0oi1l1g2YF13GbsMXu3n+4+LV/Q/5Y/o0zshP6kOFcxGjABMElf
         Y2e/W0rN2ikuJdAfpPWOiKDHBb5s7q37aD/TgJzcNmmFGV7RJQ7SFFbyfLdCs238St/F
         i6Uo2rMArB/sP74iD8axsDXmOO2ZFvK7WzGIFjeUwGi+75eEGGd+5Vmgs/ps2a5C+BWZ
         a17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=26jC/wgBZ+t1Ap5tkofW0NlWVxgOjqt14XFXYTZhyC4=;
        b=uecexJ2lyFxu29XQfS4nk9+FeuRn4Fl1MD21+hTy+BKXscZhXKTM4gi1rSrIjq8fta
         mHZGQzN/WygUeez3KdoIhd8jXql4qTYhZXNZlTP2LcwjItbUfW+u+gzaD7c+366b1ccC
         ffPI5Fds3IS86+xLQMKHcxypCx6onLArZ/ridXQxxdxd/bfUEXGtZTGJ7ZHZc7ay6SLQ
         O6e4hG4ekzMFUq7jWNSmUCUOf+pYyF+2bQRrmVK915zNUFXHMOh/7Pm7CTbr8e5hSxTT
         ROszqRn2RxLtnBwD+TUMnkNezlrQmYScLD+zWSIKdhKCq0GFAgbtNhLO/BLzEiWBlmvf
         olQw==
X-Gm-Message-State: AOAM530XvPflqCkxAo2Esjf1TWdGGH7ZjXbVv086U5jrvxeGYOfjrJn3
        clgP7Ln5GbOvKsmkSO8pCZDIMLdCf/siHfAQqaXXNA36
X-Google-Smtp-Source: ABdhPJyK5r+ySLCfrd9lsg7PSoxi6Qyy37pk+0Q7wzkfFNM8CYoTyLuXcOw3XB0Rg6dv1hyyXmk0FwTxY66PaQP8xBo=
X-Received: by 2002:a25:c60a:: with SMTP id k10mr1360290ybf.264.1623258643018;
 Wed, 09 Jun 2021 10:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210608184457.3069064-1-luiz.dentz@gmail.com> <6AC22489-B3C4-49B8-AF19-A0AEC8CFD91B@holtmann.org>
In-Reply-To: <6AC22489-B3C4-49B8-AF19-A0AEC8CFD91B@holtmann.org>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Wed, 9 Jun 2021 10:10:32 -0700
Message-ID: <CABBYNZKTr+MVGfpoLA_YQOossdiLGV6sigKbKhc-Avi11Hp5MA@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: HCI: Fix Set Extended (Scan Response) Data
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Marcel,

On Tue, Jun 8, 2021 at 9:52 PM Marcel Holtmann <marcel@holtmann.org> wrote:
>
> Hi Luiz,
>
> > These command do have variable length and the length can go up to 251,
> > so this changes the struct to not use a fixed size and then when
> > creating the PDU only the actual length of the data send to the
> > controller.
> >
> > Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> > ---
> > include/net/bluetooth/hci.h      |  6 ++--
> > include/net/bluetooth/hci_core.h |  8 ++---
> > net/bluetooth/hci_request.c      | 51 ++++++++++++++++++--------------
> > 3 files changed, 37 insertions(+), 28 deletions(-)
>
> if possible, please git blame and add Fixes: tag.
>
> Regards
>
> Marcel

Will do.

-- 
Luiz Augusto von Dentz
