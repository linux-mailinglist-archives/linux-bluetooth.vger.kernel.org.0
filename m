Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 943271D3896
	for <lists+linux-bluetooth@lfdr.de>; Thu, 14 May 2020 19:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgENRpM (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 14 May 2020 13:45:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726075AbgENRpL (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 14 May 2020 13:45:11 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 706C9C061A0E
        for <linux-bluetooth@vger.kernel.org>; Thu, 14 May 2020 10:45:11 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id v26so2411469vsa.1
        for <linux-bluetooth@vger.kernel.org>; Thu, 14 May 2020 10:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EojrK8utBvdbpLbqtZAoeps62LamVF3R2Nk7dYz9csk=;
        b=bZ/lxPNdj969sL9KNsybkON1ejiT5z04HIEyEDPFh0FkgrMkAolzWNYg10zLRsKc5c
         93nDcCW+torZzraEfPjrp8EkpdGd1fLzYaPCX+qNVIvXSWiHXczqwljUuLeKHM8F66K2
         MPrDFxsu+snE1egH3WFyKKnEC7wPMWjgx6Bx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EojrK8utBvdbpLbqtZAoeps62LamVF3R2Nk7dYz9csk=;
        b=FKOTduTNuwaAtkMM5JQ3+akX7bazbv0g3gdUJ0Td7CgPQZUYpvIIfNviBRU7q72FnP
         W2oEH1W3d4swRLtPSzFjtpsfajBl8g45iYTJQaX0C0a2Tjbucw+0CWQMJ7wU1F84UJks
         RVMnz7uSPFHlgiqOA7vCkoswRFILEbreC0KpdesUZEG2XDLvJ/Qde7cTwWk9RDggPjx/
         wX4ZFcdlYOLQqWzlWJaJ7fVgX/p6CBh4nyCG2Y8lrRDFzYHGqm0tpvDnjosuQkT40WjL
         HLpMQQDfdIc41Aa6r4idUkLVCVbB71vYW2qj5z+EFLTtompfP5lM0gyOyQIgnH0T6/4h
         /TOQ==
X-Gm-Message-State: AOAM532lloTWLxjv07jD5L/J3vzFnVAwwl9DrdHlJhUcNQ2Pr1QeD1Xy
        87iTvI8ZcH4DpA7x61CaaZQOvYCp4X6dgrbw23oT9A==
X-Google-Smtp-Source: ABdhPJxTrmQbZ5iLRcBSlHT9ZsBzluJut4GHMQGp16Usi2u2KeBFFzT0dGgdTOTl02dczGBFW8FJb+CMrB/FaqtFqUo=
X-Received: by 2002:a67:2c0f:: with SMTP id s15mr964402vss.86.1589478310617;
 Thu, 14 May 2020 10:45:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200513204111.1.I68404fc395a3dbc57c8a89ca02490013e8003a87@changeid>
 <20200514163048.GO4525@google.com>
In-Reply-To: <20200514163048.GO4525@google.com>
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date:   Thu, 14 May 2020 10:44:59 -0700
Message-ID: <CANFp7mX0+fLgZgtVPin1B=AC-N4qSk6aPzsqcwYcazM_M1WLmw@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: hci_qca: Enable WBS support for wcn3991
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        bgodavar@codeaurora.org, Alain Michaud <alainm@chromium.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        ChromeOS Bluetooth Upstreaming 
        <chromeos-bluetooth-upstreaming@chromium.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi,

On Thu, May 14, 2020 at 9:30 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Hi Abhishek,
>
> On Wed, May 13, 2020 at 08:41:25PM -0700, Abhishek Pandit-Subedi wrote:
> > WCN3991 supports transparent WBS (host encoded mSBC). Add a flag to the
> > device match data to show WBS is supported.
>
> In general this looks good to me, a few nits inside.
>
> > This requires the matching firmware for WCN3991 in linux-firmware:
> >         1a8b0dc00f77 (qca: Enable transparent WBS for WCN3991)
> >
> > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > ---
> >
> >  drivers/bluetooth/hci_qca.c | 23 +++++++++++++++++------
> >  1 file changed, 17 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> > index b3fd07a6f8127..305976c4dcf42 100644
> > --- a/drivers/bluetooth/hci_qca.c
> > +++ b/drivers/bluetooth/hci_qca.c
> > @@ -75,6 +75,9 @@ enum qca_flags {
> >       QCA_HW_ERROR_EVENT
> >  };
> >
> > +enum qca_driver_flags {
> > +     QCA_DRV_WIDEBAND_SPEECH_SUPPORTED = 0x1,
>
> s/0x1/BIT(0)/

Will change in next version.

>
> > +};
>
> The 'driver'/'DRV' midfix is a bit misleading. WBS support is a device
> capability, it's not something the driver supports or doesn't. Maybe
> name it 'qca_capabilities' or similar.
>
> >  /* HCI_IBS transmit side sleep protocol states */
> >  enum tx_ibs_states {
> > @@ -187,10 +190,11 @@ struct qca_vreg {
> >       unsigned int load_uA;
> >  };
> >
> > -struct qca_vreg_data {
> > +struct qca_device_data {
> >       enum qca_btsoc_type soc_type;
> >       struct qca_vreg *vregs;
> >       size_t num_vregs;
> > +     uint32_t flags;
>
> capabilities?

Capabilities sounds good to me.

Thanks for the feedback.
Abhishek
