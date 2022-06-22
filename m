Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3DF75549A1
	for <lists+linux-bluetooth@lfdr.de>; Wed, 22 Jun 2022 14:17:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231434AbiFVKUn (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 22 Jun 2022 06:20:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbiFVKUj (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 22 Jun 2022 06:20:39 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09E253AA6D
        for <linux-bluetooth@vger.kernel.org>; Wed, 22 Jun 2022 03:20:34 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id z16so3491238ile.10
        for <linux-bluetooth@vger.kernel.org>; Wed, 22 Jun 2022 03:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Hbo3bnQKBNV6Tqr0l1RInVBr0FV0QXzKbFlMjhPdNYc=;
        b=bFeZ6HHtsVE5eIf2XgCYMp1WD7dwSCvnA+mdiyg55GOgz25oSnkTcY+xtLCmgr/gjy
         4PaxThwJfy8RV0iS7SqD8rQCzQ46KfgEbPr2ctANBmC8VtQ6FYs8XOZMtwjmktso0kGH
         Pn04gKBix6xHCo9bqV5T+6GWvOVLNBVPGO8jU8vPDkhcAr+RnbLCR1kVG8dD3G/2E9We
         aR2NcUgqZqi7gigz7d3Zfbur9iZ3AZKoeTCdADa6O9xuiEBGIlz4oBeNb2TLQCdKiKE5
         STHd3sHbfTNVudPO2c3vHafJZvhvfGRoZgV3OPcMNiFv374lg3oEykOPPpmhoyWXzAkR
         rMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Hbo3bnQKBNV6Tqr0l1RInVBr0FV0QXzKbFlMjhPdNYc=;
        b=rubafO1CVrTtIZUsJlpGUlLHxA7KLPs2QXsLhnIzTYgdXemhF4mPzXY7mQZR2uP0mF
         lJHWmPxlCSTevz5xRPJF2jlpLLgnViSUzMVp4VcysufNJ5OYwu4VrXvRzuxCDm8AVbgv
         78ytB1TUnyAeIMDThZIsQrMJs0tsB1aQWIS2AkK6J11tjQIggWgN3Uy+62pWFE/Q6nme
         sqYRIX2lCUd6M3LUAyDoHfGy/tDYmgo13hnXhxtjyQx+VNEsaRKkJYpXku8hpuzA5z0t
         DDYJPbmEFuOG+iDvN5Q9CezWAMdwG2GrpnVI81LlajDD6MvLoNTZxRXs2eyuFj1NdavR
         2gJw==
X-Gm-Message-State: AJIora/hW1VbOf0Pi61Igses8ZwMb8usO56LYZuchZoz/fSeUrQIPtm9
        KMEzlZ23vrR/0cKqBBcBAEE9aHNfRqQ0Sba2kbOk6A==
X-Google-Smtp-Source: AGRyM1sXeSQw6KYHS4znHE4W3JRadaDk+4aVoboZXFZJ+Q/TGW2Sm/R4VoeOXijwAbllyRaJf0iqqkRU7RpD/8evvBk=
X-Received: by 2002:a92:90d:0:b0:2d9:3458:7f79 with SMTP id
 y13-20020a92090d000000b002d934587f79mr1658534ilg.123.1655893233347; Wed, 22
 Jun 2022 03:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220607104015.2126118-1-poprdi@google.com> <CAPUC6bJbVMPn1FMLYnXg2GUX4ikesMSRjj=oPOOrS5H2DOx_bA@mail.gmail.com>
 <CAPUC6b+xMnk8VDGv_7p9j4GHD75FrxG3hWKpTSF2zHj508=x9A@mail.gmail.com>
In-Reply-To: <CAPUC6b+xMnk8VDGv_7p9j4GHD75FrxG3hWKpTSF2zHj508=x9A@mail.gmail.com>
From:   Aleksandr Nogikh <nogikh@google.com>
Date:   Wed, 22 Jun 2022 12:20:22 +0200
Message-ID: <CANp29Y7gb7cop8p8k-LqR1WoLwOLxi+QGRGLEZrbYW8Tw6_i2w@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: Collect kcov coverage from hci_rx_work
To:     =?UTF-8?Q?Tam=C3=A1s_Koczka?= <poprdi@google.com>,
        Dmitry Vyukov <dvyukov@google.com>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Nguyen <theflow@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

(Resending the reply I sent to the v1 of the patch. I sent it by
mistake with HTML content, so it did not reach lore.)

I checked out v5.18.1, applied this patch and fuzzed it with syzkaller
for a day. The fuzzer was indeed able to find and report more coverage
of the BT subsystem than without the patch.

Tested-by: Aleksandr Nogikh <nogikh@google.com>


On Tue, Jun 14, 2022 at 3:34 PM Tam=C3=A1s Koczka <poprdi@google.com> wrote=
:
>
> Hello Marcel,
>
> I hope this was the change you originally requested, and I did not
> misunderstand anything, but if you need any additional modification to
> the code or the commit, please feel free to let me know!
>
> Thank you,
> Tamas
>
> On Tue, Jun 7, 2022 at 1:44 PM Tam=C3=A1s Koczka <poprdi@google.com> wrot=
e:
> >
> > Hello Marcel,
> >
> > I added some comments into the code about what the kcov_remote calls do=
 and
> > why they were implemented and I also added some reasoning to the commit
> > message.
> >
> > I did not mention in the commit but these functions only run if the ker=
nel
> > is compiled with CONFIG_KCOV.
> >
> > Thank you again for reviewing the patch!
> >
> > --
> > Tamas
> >
> > On Tue, Jun 7, 2022 at 12:40 PM Tamas Koczka <poprdi@google.com> wrote:
> > >
> > > Annotate hci_rx_work() with kcov_remote_start() and kcov_remote_stop(=
)
> > > calls, so remote KCOV coverage is collected while processing the rx_q
> > > queue which is the main incoming Bluetooth packet queue.
> > >
> > > Coverage is associated with the thread which created the packet skb.
> > >
> > > The collected extra coverage helps kernel fuzzing efforts in finding
> > > vulnerabilities.
> > >
> > > Signed-off-by: Tamas Koczka <poprdi@google.com>
> > > ---
> > > Changelog since v1:
> > >  - add comment about why kcov_remote functions are called
> > >
> > > v1: https://lore.kernel.org/all/20220517094532.2729049-1-poprdi@googl=
e.com/
> > >
> > >  net/bluetooth/hci_core.c | 10 +++++++++-
> > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> > > index 45c2dd2e1590..0af43844c55a 100644
> > > --- a/net/bluetooth/hci_core.c
> > > +++ b/net/bluetooth/hci_core.c
> > > @@ -29,6 +29,7 @@
> > >  #include <linux/rfkill.h>
> > >  #include <linux/debugfs.h>
> > >  #include <linux/crypto.h>
> > > +#include <linux/kcov.h>
> > >  #include <linux/property.h>
> > >  #include <linux/suspend.h>
> > >  #include <linux/wait.h>
> > > @@ -3780,7 +3781,14 @@ static void hci_rx_work(struct work_struct *wo=
rk)
> > >
> > >         BT_DBG("%s", hdev->name);
> > >
> > > -       while ((skb =3D skb_dequeue(&hdev->rx_q))) {
> > > +       /* The kcov_remote functions used for collecting packet parsi=
ng
> > > +        * coverage information from this background thread and assoc=
iate
> > > +        * the coverage with the syscall's thread which originally in=
jected
> > > +        * the packet. This helps fuzzing the kernel.
> > > +        */
> > > +       for (; (skb =3D skb_dequeue(&hdev->rx_q)); kcov_remote_stop()=
) {
> > > +               kcov_remote_start_common(skb_get_kcov_handle(skb));
> > > +
> > >                 /* Send copy to monitor */
> > >                 hci_send_to_monitor(hdev, skb);
> > >
> > > --
> > > 2.36.1.255.ge46751e96f-goog
> > >
