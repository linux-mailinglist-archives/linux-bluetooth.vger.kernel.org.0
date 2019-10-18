Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AE20DBC12
	for <lists+linux-bluetooth@lfdr.de>; Fri, 18 Oct 2019 06:55:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441949AbfJREzH (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 18 Oct 2019 00:55:07 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:35307 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbfJREzF (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 18 Oct 2019 00:55:05 -0400
Received: by mail-qt1-f194.google.com with SMTP id m15so7364871qtq.2
        for <linux-bluetooth@vger.kernel.org>; Thu, 17 Oct 2019 21:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8aspMadhLtLdwap/HY8pYXIpI/022GVepCK2sUy5Jo4=;
        b=Qz9YB1cp2Zg6eSsNCQvAw6Xl7TdE+kvgwqY9mVMHfLFdjXB02ass8EAgL5EVNdqguV
         oidctHw4mrvIPU8WCuzS+lKh4XCCv8TRwm6eyjKrm8zPZEfkMLCUib6g57hPc6TISL0R
         RYuybrnZ7s4TaWGAE/9ruSfal9/1BdXMvE0DM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8aspMadhLtLdwap/HY8pYXIpI/022GVepCK2sUy5Jo4=;
        b=rMpF1aWCPUkfzapdmsGRpLZpSAKajQV5+Ih/JfLFDF4SLc8nf2PEhvBu8Ud9auTxzm
         D8hF8OIwcycQXMRd3VltsByWUV72W2AkM2l2jhyCA563pPEPA9Uko4Rogbv9WLLenzc0
         EKdSAXm2RlSongLEuh4wym8utpDNbZFNp8b//wqmJHJwhATLsKWtk/PL7dq8q4iIz9X+
         wHiIjLd9TgQ991GdGpRvtGggzcCZk8VmuyzAjcbTKiaOi1ys92+XwTa73xvmeU8ROCzn
         jzqmY7IBhj8TDTzcAahfmd5aeWujLl4oL6cEeTOocE6Q6qmP8/8yb1iQBqp0eixgXW/V
         9xjQ==
X-Gm-Message-State: APjAAAUC67Mi8HqfS0X8k5JE9Y7wSpzM1bswg/NyF/vqSevu/j6p3hX6
        RJEBHodaf+FxZiPC7IestiH40Cldms8=
X-Google-Smtp-Source: APXvYqz015B9LFh16sma4gMwU/5pJ0Hg4vHwCLGnWkgVosJiP3LqpWwepKomvWfxkmgFIDGs6qqKBQ==
X-Received: by 2002:ac8:6c4:: with SMTP id j4mr7571582qth.235.1571367608868;
        Thu, 17 Oct 2019 20:00:08 -0700 (PDT)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com. [209.85.222.179])
        by smtp.gmail.com with ESMTPSA id k199sm211054qke.0.2019.10.17.20.00.07
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2019 20:00:07 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id z67so3959749qkb.12
        for <linux-bluetooth@vger.kernel.org>; Thu, 17 Oct 2019 20:00:07 -0700 (PDT)
X-Received: by 2002:ae9:f30c:: with SMTP id p12mr6409294qkg.159.1571367606688;
 Thu, 17 Oct 2019 20:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <20191009085116.199922-1-tientzu@chromium.org> <238f01ec4b49fee4c0d08a0b8da7e95f@codeaurora.org>
 <74740c0ff64a6a658da2a44a9f9b7ac5@codeaurora.org>
In-Reply-To: <74740c0ff64a6a658da2a44a9f9b7ac5@codeaurora.org>
From:   Claire Chang <tientzu@chromium.org>
Date:   Fri, 18 Oct 2019 10:59:54 +0800
X-Gmail-Original-Message-ID: <CALiNf2_EcJxxTYd52UVyaJ-Q82YPM5MKTPBmMNUrBZryEShwqw@mail.gmail.com>
Message-ID: <CALiNf2_EcJxxTYd52UVyaJ-Q82YPM5MKTPBmMNUrBZryEShwqw@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: hci_qca: fix in-band sleep enablement
To:     Balakrishna Godavarthi <bgodavar@codeaurora.org>
Cc:     Harish Bandi <c-hbandi@codeaurora.org>, marcel@holtmann.org,
        johan.hedberg@gmail.com, linux-bluetooth@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>,
        Rocky Liao <rjliao@codeaurora.org>, rongchi@codeaurora.org,
        linux-bluetooth-owner@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Balakrishna,

Sorry for the late reply. I was on vacation for the past few days.
The chipset we use is QCA6174A-3 and rjliao has already confirmed that
IBS won't work without RAM fw downloaded.
Please ignore this change.

Thanks,
Claire


On Fri, Oct 11, 2019 at 3:21 PM Balakrishna Godavarthi
<bgodavar@codeaurora.org> wrote:
>
> Hi Claire,
>
> This change will not work  as we need fw files to be loaded tofor IBS to
> active.
> may i know on which chipset you have this issue of IBS active even with
> out fw download.
>
> On 2019-10-11 12:31, Harish Bandi wrote:
> > ++ Balakrishna
> >
> > On 2019-10-09 14:21, Claire Chang wrote:
> >> Enabling in-band sleep when there is no patch/nvm-config found and
> >> bluetooth is running with the original fw/config.
> >>
> >> Fixes: ba8f35979002 ("Bluetooth: hci_qca: Avoid setup failure on
> >> missing rampatch")
> >> Fixes: 7dc5fe0814c3 ("Bluetooth: hci_qca: Avoid missing rampatch
> >> failure with userspace fw loader")
> >> Signed-off-by: Claire Chang <tientzu@chromium.org>
> >> ---
> >>  drivers/bluetooth/hci_qca.c | 11 +++++++----
> >>  1 file changed, 7 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> >> index e3164c200eac..367eef893a11 100644
> >> --- a/drivers/bluetooth/hci_qca.c
> >> +++ b/drivers/bluetooth/hci_qca.c
> >> @@ -1291,10 +1291,8 @@ static int qca_setup(struct hci_uart *hu)
> >>      /* Setup patch / NVM configurations */
> >>      ret = qca_uart_setup(hdev, qca_baudrate, soc_type, soc_ver,
> >>                      firmware_name);
> >> -    if (!ret) {
> >> -            set_bit(QCA_IBS_ENABLED, &qca->flags);
> >> -            qca_debugfs_init(hdev);
> >> -    } else if (ret == -ENOENT) {
> >> +
> >> +    if (ret == -ENOENT) {
> >>              /* No patch/nvm-config found, run with original fw/config */
> >>              ret = 0;
> >>      } else if (ret == -EAGAIN) {
> >> @@ -1305,6 +1303,11 @@ static int qca_setup(struct hci_uart *hu)
> >>              ret = 0;
> >>      }
> >>
> >> +    if (!ret) {
> >> +            set_bit(QCA_IBS_ENABLED, &qca->flags);
> >> +            qca_debugfs_init(hdev);
> >> +    }
> >> +
> >>      /* Setup bdaddr */
> >>      if (qca_is_wcn399x(soc_type))
> >>              hu->hdev->set_bdaddr = qca_set_bdaddr;
>
> --
> Regards
> Balakrishna.
