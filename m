Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99E6A1F4009
	for <lists+linux-bluetooth@lfdr.de>; Tue,  9 Jun 2020 18:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731060AbgFIQAq (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 9 Jun 2020 12:00:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730640AbgFIQAo (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 9 Jun 2020 12:00:44 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3E61C08C5C2
        for <linux-bluetooth@vger.kernel.org>; Tue,  9 Jun 2020 09:00:42 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id j13so12313964vsn.3
        for <linux-bluetooth@vger.kernel.org>; Tue, 09 Jun 2020 09:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FVbKhA/NezMaX3sdFKjoaZBxdKpUb0BC4Yh1wEUX1i8=;
        b=HbbZVpX8lEl1/PAJKl/LIFIScwEcEtm8iQCb2cSgM4H01kZLkY0m1q6Dfu/nQhkJ2u
         BidyYYPVASIl2b1khHkuTADsCtKHzx57+fTgXQXWkl3/FFk33PEvEbHzPQfs5P7eDRdG
         4Tohzxve7vwXPz/S9P4Dwv5Vky64S84P7KzKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FVbKhA/NezMaX3sdFKjoaZBxdKpUb0BC4Yh1wEUX1i8=;
        b=JTcJGMHOlzz9WefUzGt4Xuy0vc/g+H3wastlwGtElryP7kcGvKZ3Ik+zk9vY4HhGbY
         u8fBw8hdL+8Seku08dZbM+Mea+l9Q9VThB5nbzR4tZPFbh0tlramLpe/u58noYaLIXxR
         5ISmGdity3mW2uClAHRwqe9ntc/EhhljsGc8a79c/wKRCz+EI83gNiehd8V33O4XwJyK
         2J8XeFmZP+k7A46xPnRbySXSSDM54SFHQSeDne96ZHoPDh5FuSXcmrq3XLKlPzEiBOW9
         OLJpl0zh2rnnCRjqDJbVcHScpMg6oPSnTO7WW5S9VQByeyyLRBGM4Oj/8KHfCqDAd8Za
         eYZg==
X-Gm-Message-State: AOAM5326mHsZJeY/JLVc0S2dxxeBBOJ1USvjPBeK3Y3sQBeR943BlL4M
        +t2OwtQ9gk2cgC/1NmLhnlZ6wkHFBRxJ7OXZuLdb4RTRkdk=
X-Google-Smtp-Source: ABdhPJx1Ay9r98Ol06bQfHruUDmVmqjfK/8k9ZGDrj+ekPNXTbJRyHNheNoU9kuUloYfvosgpr2CQOweMDeGNH8gWeI=
X-Received: by 2002:a67:6a01:: with SMTP id f1mr4034591vsc.86.1591718441472;
 Tue, 09 Jun 2020 09:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <1591718228-18819-1-git-send-email-gubbaven@codeaurora.org>
In-Reply-To: <1591718228-18819-1-git-send-email-gubbaven@codeaurora.org>
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date:   Tue, 9 Jun 2020 09:00:29 -0700
Message-ID: <CANFp7mUT68Y9vGbSXdCTZE8JzWxYv47f2RZK8+V_4Bn=FVnypw@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: hci_qca: Bug fix during SSR timeout
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        Rocky Liao <rjliao@codeaurora.org>, hbandi@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Looks good to me.

Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

On Tue, Jun 9, 2020 at 8:57 AM Venkata Lakshmi Narayana Gubba
<gubbaven@codeaurora.org> wrote:
>
> Due to race conditions between qca_hw_error and qca_controller_memdump
> during SSR timeout,the same pointer is freed twice. This results in a
> double free. Now a lock is acquired before checking the stauts of SSR
> state.
>
> Fixes: d841502c79e3 ("Bluetooth: hci_qca: Collect controller memory dump during SSR")
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
>  drivers/bluetooth/hci_qca.c | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 28c34a1..f3fde99 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -981,8 +981,11 @@ static void qca_controller_memdump(struct work_struct *work)
>         while ((skb = skb_dequeue(&qca->rx_memdump_q))) {
>
>                 mutex_lock(&qca->hci_memdump_lock);
> -               /* Skip processing the received packets if timeout detected. */
> -               if (qca->memdump_state == QCA_MEMDUMP_TIMEOUT) {
> +               /* Skip processing the received packets if timeout detected
> +                * or memdump collection completed.
> +                */
> +               if (qca->memdump_state == QCA_MEMDUMP_TIMEOUT ||
> +                   qca->memdump_state == QCA_MEMDUMP_COLLECTED) {
>                         mutex_unlock(&qca->hci_memdump_lock);
>                         return;
>                 }
> @@ -1483,8 +1486,6 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>  {
>         struct hci_uart *hu = hci_get_drvdata(hdev);
>         struct qca_data *qca = hu->priv;
> -       struct qca_memdump_data *qca_memdump = qca->qca_memdump;
> -       char *memdump_buf = NULL;
>
>         set_bit(QCA_HW_ERROR_EVENT, &qca->flags);
>         bt_dev_info(hdev, "mem_dump_status: %d", qca->memdump_state);
> @@ -1507,19 +1508,23 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>                 qca_wait_for_dump_collection(hdev);
>         }
>
> +       mutex_lock(&qca->hci_memdump_lock);
>         if (qca->memdump_state != QCA_MEMDUMP_COLLECTED) {
>                 bt_dev_err(hu->hdev, "clearing allocated memory due to memdump timeout");
> -               mutex_lock(&qca->hci_memdump_lock);
> -               if (qca_memdump)
> -                       memdump_buf = qca_memdump->memdump_buf_head;
> -               vfree(memdump_buf);
> -               kfree(qca_memdump);
> -               qca->qca_memdump = NULL;
> +               if (qca->qca_memdump) {
> +                       vfree(qca->qca_memdump->memdump_buf_head);
> +                       kfree(qca->qca_memdump);
> +                       qca->qca_memdump = NULL;
> +               }
>                 qca->memdump_state = QCA_MEMDUMP_TIMEOUT;
>                 cancel_delayed_work(&qca->ctrl_memdump_timeout);
> -               skb_queue_purge(&qca->rx_memdump_q);
> -               mutex_unlock(&qca->hci_memdump_lock);
> +       }
> +       mutex_unlock(&qca->hci_memdump_lock);
> +
> +       if (qca->memdump_state == QCA_MEMDUMP_TIMEOUT ||
> +           qca->memdump_state == QCA_MEMDUMP_COLLECTED) {
>                 cancel_work_sync(&qca->ctrl_memdump_evt);
> +               skb_queue_purge(&qca->rx_memdump_q);
>         }
>
>         clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
