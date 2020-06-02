Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F13A21EB321
	for <lists+linux-bluetooth@lfdr.de>; Tue,  2 Jun 2020 03:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbgFBBtM (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 1 Jun 2020 21:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbgFBBtM (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 1 Jun 2020 21:49:12 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43DBBC05BD43
        for <linux-bluetooth@vger.kernel.org>; Mon,  1 Jun 2020 18:49:12 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id q2so1139878vsr.1
        for <linux-bluetooth@vger.kernel.org>; Mon, 01 Jun 2020 18:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NDWXl875dqN44wgKFWnb7J8N8ciIKNPrxB/hfgmRf6E=;
        b=JRLmveybXPnxAdAR5ejEglrEmyOiyP2YL2RN5n/MlBp2MeNBhvGO9anSMkR3eqhh2t
         MgO/u4vY2vqOpbDz0WmA+G8JfN3AvlcSQNL+pgdrCUxXm7CigG5cODeMhRLWCjwTGpRn
         7eZF8CynOwdiB9tMawAwrh2u90FVicvWPMPcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NDWXl875dqN44wgKFWnb7J8N8ciIKNPrxB/hfgmRf6E=;
        b=ZXkkzGw8FswpeRkLUeixKvgM0GspltD9wkdJT9B9dY9WThSksctHbSJVccPFIqGFaw
         VV35yIalgKJxHUMSxsPjWyjxCbulJymClpqzX8ONbxdKuIp3VVAjYI4KbVRHDJ4tpBlo
         grIAQArnVfCOE2TPiu6eAt/y2pPr/oWDOqI4xGWHc6rkL0WaF5KtPZCDK9NXHqkXs0dk
         fs/9aFPmGY4oKK44Jf3WKJPmr83qRQKZ9T2NdNJvkAv8W8GgvhtA6XbDEROssEU0znQs
         dYy5h91P/oScL83FHInxXfPKw6jrRI+5zRxXqHRBWawQsQS4F9Y2U8LFP4DignVYkd1l
         +gpw==
X-Gm-Message-State: AOAM533rJ1uRh2Rol/LPHhrGzM7TOPLRY6J4nOudsXylBTvSjHU1T5sL
        S9Q7fHc7o9B8SqkkPtRyrhlrG50oTna4vBIjVUTOqA==
X-Google-Smtp-Source: ABdhPJxnHpMSeb4VtSaFWRyXvmhoyEPhwE9kbpqMX2s88ZGNeqayUOtFxrd5o6oexWenHvUstmO2cW6SOHcwY/BFIpg=
X-Received: by 2002:a67:b10c:: with SMTP id w12mr2735002vsl.96.1591062551158;
 Mon, 01 Jun 2020 18:49:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200601184223.1.I281c81384150e8fefbebf32fa79cb091d0311208@changeid>
In-Reply-To: <20200601184223.1.I281c81384150e8fefbebf32fa79cb091d0311208@changeid>
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date:   Mon, 1 Jun 2020 18:48:56 -0700
Message-ID: <CANFp7mXDvdicvyEpU-oDu4fBj92nQ7SENVdd_rG9TFQkqDevZg@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: Check scan state before disabling during suspend
To:     Manish Mandlik <mmandlik@google.com>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        ChromeOS Bluetooth Upstreaming 
        <chromeos-bluetooth-upstreaming@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        netdev <netdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hey linux-bluetooth,

We found this bug when reverting some Chromium maintained patches in
our repository that was conditionally dropping LE scan enable commands
if it wasn't toggling between true/false. On some Intel controllers,
disabling LE scan when it's already disabled resulted in a "Command
Disallowed" and this was causing suspend to fail.

On Mon, Jun 1, 2020 at 6:43 PM Manish Mandlik <mmandlik@google.com> wrote:
>
> Check current scan state by checking HCI_LE_SCAN flag and send scan
> disable command only if scan is already enabled.
>
> Signed-off-by: Manish Mandlik <mmandlik@google.com>
> ---
>
>  net/bluetooth/hci_request.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/net/bluetooth/hci_request.c b/net/bluetooth/hci_request.c
> index 1fc55685da62d..1acf5b8e0910c 100644
> --- a/net/bluetooth/hci_request.c
> +++ b/net/bluetooth/hci_request.c
> @@ -998,8 +998,9 @@ static void hci_req_set_event_filter(struct hci_request *req)
>
>  static void hci_req_config_le_suspend_scan(struct hci_request *req)
>  {
> -       /* Can't change params without disabling first */
> -       hci_req_add_le_scan_disable(req);
> +       /* Before changing params disable scan if enabled */
> +       if (hci_dev_test_flag(req->hdev, HCI_LE_SCAN))
> +               hci_req_add_le_scan_disable(req);
>
>         /* Configure params and enable scanning */
>         hci_req_add_le_passive_scan(req);
> @@ -1065,8 +1066,9 @@ void hci_req_prepare_suspend(struct hci_dev *hdev, enum suspended_state next)
>                 page_scan = SCAN_DISABLED;
>                 hci_req_add(&req, HCI_OP_WRITE_SCAN_ENABLE, 1, &page_scan);
>
> -               /* Disable LE passive scan */
> -               hci_req_add_le_scan_disable(&req);
> +               /* Disable LE passive scan if enabled */
> +               if (hci_dev_test_flag(hdev, HCI_LE_SCAN))
> +                       hci_req_add_le_scan_disable(&req);
>
>                 /* Mark task needing completion */
>                 set_bit(SUSPEND_SCAN_DISABLE, hdev->suspend_tasks);
> --
> 2.27.0.rc2.251.g90737beb825-goog
>

Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
