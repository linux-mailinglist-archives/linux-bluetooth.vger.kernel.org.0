Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C18C395797
	for <lists+linux-bluetooth@lfdr.de>; Mon, 31 May 2021 10:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbhEaI5s (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 31 May 2021 04:57:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbhEaI5q (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 31 May 2021 04:57:46 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64737C061574
        for <linux-bluetooth@vger.kernel.org>; Mon, 31 May 2021 01:56:05 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id v3so2396302ljc.6
        for <linux-bluetooth@vger.kernel.org>; Mon, 31 May 2021 01:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tvHEbWi99MRQiSqQ0dpvehrTJbqzi24F4Mtjzu6mR6k=;
        b=a7D7xLP0kqqaj7oc5DObkDtPDhXJpwZUNNLM9BtSwtpaxPjJwUoggJVIrnr/Kr+Cus
         kZGRz4NzY5KGjSZ/7+5AlTUkwtflDAXuEghqGrYoCBOfV273X/wW51JGsJB7gWG+Xfv0
         e67m3gDGECjFaGkHI7VldKx6Yr94OSsy/1FNcqHNuqXGBY/T3dCj0EHTFC1MxfXcxBlZ
         kRuLEZ5BkcsPGDBhz0v4cMbetvdR1As9BoFWPEeB3aFhuytQc0oJg79XzAPmnvBBQmBT
         Lx/BLwlJW50gUMeYkSORenF8+jOTNL5z4WB6C7AZ3rNVDbETpKVpfUBX3jbJDOl0iUmL
         +r3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tvHEbWi99MRQiSqQ0dpvehrTJbqzi24F4Mtjzu6mR6k=;
        b=jKC9K9oebfSVIQsHELRkM0yAbyFWVA+kDndXPSXvCulucN/SoxOV5o+BqBMrBjfPu6
         krCVpSztVK6NqHFfu7hnUCn/KfBmjmDPzxLcvhNO0AduSIJJm0Uj5DnC4C/7XG81Ba93
         s7ojkr6IKeOBjzwD1U/dtwlYql3nBXRxmkN5Kx1bDhee76o3vpfFNamJWXRqN1eQLDRF
         hMhfVTNAByFNsmZfhjZZCHcVdmxtqlLUKjOyF05C/e9dyCiSoUv1M9RKEYa5gFHPt/kE
         M4FyFutWzHvO6y88jEKfhriDt7odBIT0a/yuCrjY0E3j2uh1tNt9Vq0FO/GXXkETYYCL
         uWlQ==
X-Gm-Message-State: AOAM532LRoUoO2p5dz7bRr5Msh3BZKhQfde78RmSusESMRx6B7yep2Ot
        Y0AGlhlsS9rdlVPlGdLxK2zA4tXN5s1WsyleIDAknA==
X-Google-Smtp-Source: ABdhPJymrCKvD50qJ0q7P/Q6YwoGiM1DNxzs/HyvQ3iD7hb5n3syYdNfNejRL5rBR2aNGii9kvLC7ZjTwZuJiTt1nek=
X-Received: by 2002:a2e:9a14:: with SMTP id o20mr16205587lji.309.1622451363555;
 Mon, 31 May 2021 01:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210527151951.v2.1.I4d214bb82746fb2ed94eb1c2100dda0f63cf9a25@changeid>
 <E1D8B7BD-2F62-4491-8289-BE925AB2B4D2@holtmann.org>
In-Reply-To: <E1D8B7BD-2F62-4491-8289-BE925AB2B4D2@holtmann.org>
From:   Archie Pusaka <apusaka@google.com>
Date:   Mon, 31 May 2021 16:55:52 +0800
Message-ID: <CAJQfnxFARoQkaP_NYVhtOZZr=hUimOjMUTYaF6ptU5QMHGYhhw@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: hci_h5: Add RTL8822CS capabilities
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        CrosBT Upstreaming <chromeos-bluetooth-upstreaming@chromium.org>,
        Archie Pusaka <apusaka@chromium.org>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Marcel,

On Thu, 27 May 2021 at 23:22, Marcel Holtmann <marcel@holtmann.org> wrote:
>
> Hi Archie,
>
> > RTL8822 chipset supports WBS, and this information is conveyed in
> > btusb.c. However, the UART driver doesn't have this information just
> > yet.
> >
> > Signed-off-by: Archie Pusaka <apusaka@chromium.org>
> > Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> >
> > ---
> >
> > Changes in v2:
> > * Add declaration for the case when CONFIG_BT_RTL is not enabled
> >
> > drivers/bluetooth/btrtl.c  | 26 ++++++++++++++++----------
> > drivers/bluetooth/btrtl.h  |  7 +++++++
> > drivers/bluetooth/hci_h5.c |  5 +----
> > 3 files changed, 24 insertions(+), 14 deletions(-)
>
> patch has been applied to bluetooth-next tree ..
>
> .. however I am not super happy with this. I think it is time that we cle=
an this stuff up. The vendor support for Realtek is getting messy and I don=
=E2=80=99t like that.

Thanks for your concern. I will initiate internal discussion to
hopefully shape things up.

Cheers,
Archie
