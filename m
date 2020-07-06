Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A169A2160D0
	for <lists+linux-bluetooth@lfdr.de>; Mon,  6 Jul 2020 23:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbgGFVFe (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 6 Jul 2020 17:05:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbgGFVFe (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 6 Jul 2020 17:05:34 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4A4CC08C5DF
        for <linux-bluetooth@vger.kernel.org>; Mon,  6 Jul 2020 14:05:33 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id d21so23466120lfb.6
        for <linux-bluetooth@vger.kernel.org>; Mon, 06 Jul 2020 14:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZIf5BAN7x2kxktXeQK1tz8O0tAhgpueX6XBodeYeUWU=;
        b=G88ybYN2JoC2gLQbYZnAHhHeRYyuWI/EaZ/NPsAE9s8SgZDV1E++W8K6TB6h0sLqZV
         0RVVM206wkSWJWkz/Zs0WB0IenfA3pY7Es2vvKWlSfEjaOXrvuAfTlqTwRqPeVQUsCxE
         oI6a0rwOWOy0jtk2LbEFmwjbAka7qT2PiEzew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZIf5BAN7x2kxktXeQK1tz8O0tAhgpueX6XBodeYeUWU=;
        b=uMFsivD25muyFq6m/BtcGJxkAY7pOQrhIHK25xxL/Hsk14VwO547IkosffRbtOSRnU
         9BDJg7b/4eCOCCaAJFBix2kB37efWsadqdwPxW/QL8nLlUSmBNtCj1/KslC1FMh4pLRJ
         HIrMIdZ/mqBa5XyRmf6V6Ke3aaK4iML4heA2aWRgg8aHnvkHNRWxUktvg6fBBpj5IT7n
         pKV1crCNv4hL4WYeyt7IDYWyPMy21E9cIPMM0qk+RO6WHT0jeDc0EGi6kIjks79V9wYk
         hD71NUTKR0RCYgKPaaFytlxKaJeAgbaZRCwl1VLyT5wKBkCFIPOXER4lrCUJXi1VxKtC
         0GLA==
X-Gm-Message-State: AOAM531ZgV7WuOC7kq5WSTdgKhqBsi0KmMeCWS0TX6Or/DcwGU+pTTfh
        h+Wnn6ltmXxwFX0HF3jaSkGJQLOEHjaLgJHkLkEj4g==
X-Google-Smtp-Source: ABdhPJw/C573wYg00zUcrBo1SJd6xbJ33WaRub/AC8BVEfvsSEBHLyWeDw7+PTsKYsSLlFM0Xc3zTWuUv5TYsAtqscI=
X-Received: by 2002:ac2:5619:: with SMTP id v25mr31528433lfd.117.1594069532077;
 Mon, 06 Jul 2020 14:05:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200629201441.v1.1.I162e3c6c4f4d963250c37733c3428329110c5989@changeid>
 <968D6753-8ACB-4298-91A4-F2C9438EAC06@holtmann.org> <CABmPvSFq36OA-dxXxjhhocZjoJ1ZMZXZ4TULRYyTxcpksuXA7g@mail.gmail.com>
In-Reply-To: <CABmPvSFq36OA-dxXxjhhocZjoJ1ZMZXZ4TULRYyTxcpksuXA7g@mail.gmail.com>
From:   Miao-chen Chou <mcchou@chromium.org>
Date:   Mon, 6 Jul 2020 14:05:21 -0700
Message-ID: <CABmPvSGAfWY-9UiApJ70ra-u9Mc66ED6PQCkB9zimt0HEaN3Zw@mail.gmail.com>
Subject: Re: [PATCH v1] Bluetooth: Fix kernel oops triggered by hci_adv_monitors_clear()
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>,
        Alain Michaud <alainm@chromium.org>,
        Pavel Machek <pavel@ucw.cz>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Marcel,

In case you missed this thread, my suggestion is to revert the
previous patch and apply this patch. Please see my earlier email for
the reason. Thanks.

Regards,
Miao

On Tue, Jun 30, 2020 at 2:55 PM Miao-chen Chou <mcchou@chromium.org> wrote:
>
> Hi Marcel,
>
> hci_unregister_dev() is invoked when the controller is intended to be
> removed by btusb driver. In other words, there should not be any
> activity on hdev's workqueue, so the destruction of the workqueue
> should be the first thing to do to prevent the clear helpers from
> issuing any work. So my suggestion is to revert the patch re-arranging
> the workqueue and apply this instead.
> I should have uploaded this earlier, but I encountered some troubles
> while verifying the changes. Sorry for the inconvenience.
>
> Regards,
> Miao
>
> On Mon, Jun 29, 2020 at 11:51 PM Marcel Holtmann <marcel@holtmann.org> wrote:
> >
> > Hi Miao-chen,
> >
> > > This fixes the kernel oops by removing unnecessary background scan
> > > update from hci_adv_monitors_clear() which shouldn't invoke any work
> > > queue.
> > >
> > > The following test was performed.
> > > - Run "rmmod btusb" and verify that no kernel oops is triggered.
> > >
> > > Signed-off-by: Miao-chen Chou <mcchou@chromium.org>
> > > Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > > Reviewed-by: Alain Michaud <alainm@chromium.org>
> > > ---
> > >
> > > net/bluetooth/hci_core.c | 2 --
> > > 1 file changed, 2 deletions(-)
> > >
> > > diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> > > index 5577cf9e2c7cd..77615161c7d72 100644
> > > --- a/net/bluetooth/hci_core.c
> > > +++ b/net/bluetooth/hci_core.c
> > > @@ -3005,8 +3005,6 @@ void hci_adv_monitors_clear(struct hci_dev *hdev)
> > >               hci_free_adv_monitor(monitor);
> > >
> > >       idr_destroy(&hdev->adv_monitors_idr);
> > > -
> > > -     hci_update_background_scan(hdev);
> > > }
> >
> > I am happy to apply this as well, but I also applied another patch re-arranging the workqueue destroy handling. Can you check which prefer or if we should include both patches.
> >
> > Regards
> >
> > Marcel
> >
