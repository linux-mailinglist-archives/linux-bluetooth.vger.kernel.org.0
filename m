Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A4375F1625
	for <lists+linux-bluetooth@lfdr.de>; Sat,  1 Oct 2022 00:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231233AbiI3Waw (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 30 Sep 2022 18:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230469AbiI3Wau (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 30 Sep 2022 18:30:50 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91698156545
        for <linux-bluetooth@vger.kernel.org>; Fri, 30 Sep 2022 15:30:48 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 207so3599277ybn.1
        for <linux-bluetooth@vger.kernel.org>; Fri, 30 Sep 2022 15:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ynUUF776hvbTO7RaoR/PaAJJm6BIrzM9Le2Vv0E+owo=;
        b=VRKpP10LYR+ulT2MMmZNp9z9QFZ5zqHDABMmKOAbEaDhVYzpdo2rRFYQKfgrKpv0qO
         kFMPddyexV0AhcDzULVCn5SK8LK9pCgs3gWiPrTWEmKqdUkmWSgq/jdN5IexsRRPlmMw
         UB+XujaXDw68TCNilYW1KYrbesSMKeQptMuP6Xl11dAgPXrtAOGiyL/hwU3psj4LoPhb
         +nbxZx1XR/6k0ldnlUhNggmdYNDT7Xq/BUoc+duKpSztfBx9Tx7nX/x880vLQW2yIudQ
         +FIFRPsYkSMgOWhk/Iy48ABYyCzAf50DMrlrmfWn1DjpXzk8ht84Iwz3Fq1RCgfViZdf
         LoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ynUUF776hvbTO7RaoR/PaAJJm6BIrzM9Le2Vv0E+owo=;
        b=kLiSZI8qj+G+7rqBMfac0GuVwwAb6EIhveiN6qOUR6G3kNndWGuW9EXl82epsEbMxx
         Juz8ULoVOQZS61CUzrCKS6zghzvZ55QtRxlEhBxq8+0bQsaOc1LZLOhc24P1QYAA7MS3
         wNqfYspyMu0gUzfQibAlFkiNGYbQqR0+yXWA2eqL9bgFB0SlC7rm0W+i4KwXzq8CgrfO
         Bs1PIbaNC8Ktpq1yWaEWlAqAK4gUbIRk3Cq1NcbS9WXTwclTGY0SHZ6QZv/hpj6zYi/+
         nM2WTPRZ8x7bMW7vqJrKMZgu3YprOyZV6ud948LvFKcDN1zxUBk8XNOR62NONtqS/Dj3
         4WWw==
X-Gm-Message-State: ACrzQf3rqqM715IemyRiBv+QV9qqmZ+W6GCEGPFipGf6CCTmKkqvNvWo
        WcYid5q3KxYv684M+mtbXp/weT9W1ObAJhLMe3EJfw==
X-Google-Smtp-Source: AMsMyM4HhT5xUXMx/QFwbxp/1hmlpguTvhIhVrXUZy6rgLubNRaRjrygq1rnObtBu/wUOW7jjCeIYp3ZjzUADjeUuKg=
X-Received: by 2002:a05:6902:1002:b0:6bc:829c:8ce7 with SMTP id
 w2-20020a056902100200b006bc829c8ce7mr10925386ybt.453.1664577047399; Fri, 30
 Sep 2022 15:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220930140655.2723164-1-ajye_huang@compal.corp-partner.google.com>
 <CABBYNZJZcgQ+VsPu68-14=EQGxxZ1VpHth37uO_NnGm+SsOnbw@mail.gmail.com>
In-Reply-To: <CABBYNZJZcgQ+VsPu68-14=EQGxxZ1VpHth37uO_NnGm+SsOnbw@mail.gmail.com>
From:   Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date:   Sat, 1 Oct 2022 06:30:38 +0800
Message-ID: <CALprXBaUMR0uxMKeJ8f8+BWHDesfB9CxDquy4Muptf4eppmQdA@mail.gmail.com>
Subject: Re: [PATCH v1] bluetooth: Fix the bluetooth icon status after running
 hciconfig hci0 up
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Sat, Oct 1, 2022 at 3:57 AM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Ajye,
>
> On Fri, Sep 30, 2022 at 7:07 AM Ajye Huang
> <ajye_huang@compal.corp-partner.google.com> wrote:
> >
> > When "hciconfig hci0 up" command is used to bluetooth ON, but
> > the bluetooth UI icon in settings still not be turned ON.
> >
> > Refer to commit 2ff13894cfb8 ("Bluetooth: Perform HCI update for power on synchronously")
> > Add back mgmt_power_on(hdev, ret) into function hci_dev_do_open(struct hci_dev *hdev)
> > in hci_core.c
> >
> > Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> > ---
> >  net/bluetooth/hci_core.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> > index 0540555b3704..5061845c8fc2 100644
> > --- a/net/bluetooth/hci_core.c
> > +++ b/net/bluetooth/hci_core.c
> > @@ -481,6 +481,7 @@ static int hci_dev_do_open(struct hci_dev *hdev)
> >         hci_req_sync_lock(hdev);
> >
> >         ret = hci_dev_open_sync(hdev);
> > +       mgmt_power_on(hdev, ret);
> >
> >         hci_req_sync_unlock(hdev);
> >         return ret;
> > --
> > 2.25.1
>
>
> I believe the culprit is actually the following change:
>
> git show cf75ad8b41d2a:
>
> @@ -1489,8 +1488,7 @@ static int hci_dev_do_open(struct hci_dev *hdev)
>                     !hci_dev_test_flag(hdev, HCI_USER_CHANNEL) &&
>                     hci_dev_test_flag(hdev, HCI_MGMT) &&
>                     hdev->dev_type == HCI_PRIMARY) {
> -                       ret = __hci_req_hci_power_on(hdev);
> -                       mgmt_power_on(hdev, ret);
> +                       ret = hci_powered_update_sync(hdev);
>
> So we should probably restore mgmt_power_on above.
>
> --
> Luiz Augusto von Dentz

Hi Luiz

Now, this code you mentioned in hci_dev_open_sync() was moved from
hci_core.c to hci_sync.c
The below modification is workable.
Do you agree?
If so, I will send you the v2 version. Thanks

index 15c75ef4c271..76c3107c9f91 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -4676,6 +4676,7 @@ int hci_dev_open_sync(struct hci_dev *hdev)
                    hci_dev_test_flag(hdev, HCI_MGMT) &&
                    hdev->dev_type == HCI_PRIMARY) {
                        ret = hci_powered_update_sync(hdev);
+                       mgmt_power_on(hdev, ret);
                }
        } else {
                /* Init failed, cleanup */
