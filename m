Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFCD446350B
	for <lists+linux-bluetooth@lfdr.de>; Tue, 30 Nov 2021 14:01:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237292AbhK3NFI (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 30 Nov 2021 08:05:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236265AbhK3NFE (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 30 Nov 2021 08:05:04 -0500
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9EF9C061574
        for <linux-bluetooth@vger.kernel.org>; Tue, 30 Nov 2021 05:01:45 -0800 (PST)
Received: by mail-il1-x134.google.com with SMTP id j21so21074920ila.5
        for <linux-bluetooth@vger.kernel.org>; Tue, 30 Nov 2021 05:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Q0ARfKBEOm7i21XmqAN04osRqCtWpdUCjMKp9eeDZEg=;
        b=A1CdzlYna8Dhhi0GZjKOwM6MA4c4kMlHtkJ5lXaGgXvMMVz8p1vS/x1EB79jFrZ9Zp
         WBjAy0EAyVF4+y9x9Mvsl/kBxY+gRGDRiKXMXjNvjXWm0D565VCyvqLjz7tg7CfidnTu
         YISGuxVwHfPus7qIY89HfPC48bKyIYz72Ss3EEsjRFwimwOaJQsglVT9ByXDppi8wRbb
         SKwXiMc5EHeygp3H/6Dktl3Jlbtlcf60AIz1qc2ufcMslZpudolNunwKeKIFzKjqF5nI
         rjWs+0wyuoa4yvfONtY+BmTdyjKv8wOuR1FsCFbIK34JoJ7G0Vf7AJs2GtvicqneyhNC
         S0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Q0ARfKBEOm7i21XmqAN04osRqCtWpdUCjMKp9eeDZEg=;
        b=fL/RCuzUH06jvbj+HSbpwu+aSAGKtGBFQ3BnWOcR70u9D/OldDXUNktYDvLP3kaeMm
         Wjyc/XvohyyOF8EMnYGOKYZcFxYul8z31/CA6X+JcNMG/JB8QKfjvbnLbHHmvrQtX7lH
         lsysalmAOT+HvBclKuRygo34k0BZ5NOd2Ctcg2E447Oo60TWyd72qn/UdqKLVhEg9nTj
         /YIMpYkqE5+FaxeqBYAhCNwnd1bmL8SFX2mi1lNyXWGq97N/8QneoCflhQORgGtZfBCg
         rCz0jWinDBRxj0ir/jPivuHJV+i27YOEdRjuW4GWxdI6ZxbeCf0+g9xFP3dU51xnx/DF
         TXtg==
X-Gm-Message-State: AOAM533IoS5U0lXEG3g2xLEbXqdScuUlUnCnnihNolOajvPbBv4mMq+T
        kzECQCjQDsq57MG7P8vXruC3cWsdZ93kPlzv1Wnq
X-Google-Smtp-Source: ABdhPJw8hYnMtsqCa9EaLjA9wF43p8CVx3ugxwK5rG1qSEyk6jZivUcI3Q9vCPA65eEYOjeMaZ6VW7YNkNSEGrft9f4=
X-Received: by 2002:a92:caca:: with SMTP id m10mr49909658ilq.115.1638277304175;
 Tue, 30 Nov 2021 05:01:44 -0800 (PST)
MIME-Version: 1.0
References: <20211126221034.21331-1-lukasz.bartosik@semihalf.com--annotate> <1638223308-32622-1-git-send-email-sean.wang@mediatek.com>
In-Reply-To: <1638223308-32622-1-git-send-email-sean.wang@mediatek.com>
From:   =?UTF-8?Q?=C5=81ukasz_Bartosik?= <lb@semihalf.com>
Date:   Tue, 30 Nov 2021 13:01:32 +0000
Message-ID: <CAK8ByeKQeresPwe1_1-g249BADcR3z8m7ZYO9OFmT_QSvkpu-w@mail.gmail.com>
Subject: Re: [PATCH v1] Bluetooth: btmtksdio: enable msft opcode
To:     Sean Wang <sean.wang@mediatek.com>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        upstream@semihalf.com, linux-bluetooth@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

pon., 29 lis 2021 o 22:01 <sean.wang@mediatek.com> napisa=C5=82(a):
>
> From: Sean Wang <sean.wang@mediatek.com>
>
> >Enable msft opcode for btmtksdio driver.
> >
> >Signed-off-by: =C5=81ukasz Bartosik <lb@semihalf.com>
> >---
> > drivers/bluetooth/btmtksdio.c | 1 +
> > 1 file changed, 1 insertion(+)
> >
> >diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio=
.c index d9cf0c492e29..2a7a615663b9 100644
> >--- a/drivers/bluetooth/btmtksdio.c
> >+++ b/drivers/bluetooth/btmtksdio.c
> >@@ -887,6 +887,7 @@ static int btmtksdio_setup(struct hci_dev *hdev)
> >       if (enable_autosuspend)
> >               pm_runtime_allow(bdev->dev);
> >
> >+      hci_set_msft_opcode(hdev, 0xFD30);
>
> Hi =C5=81ukasz,
>
> msft feature is supposed only supported on mt7921. Could you help rework =
the patch to enalbe msft opocde only for mt7921?
>
>         Sean
>

Hi Sean,

Thanks for the input. I will update the patch so that msft opcode is
enabled only for mt7921.

Regards,
Lukasz

> >       bt_dev_info(hdev, "Device setup in %llu usecs", duration);
> >
> >       return 0;
> >
