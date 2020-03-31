Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9220C199D28
	for <lists+linux-bluetooth@lfdr.de>; Tue, 31 Mar 2020 19:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726208AbgCaRol (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 31 Mar 2020 13:44:41 -0400
Received: from mail-yb1-f193.google.com ([209.85.219.193]:41787 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbgCaRol (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 31 Mar 2020 13:44:41 -0400
Received: by mail-yb1-f193.google.com with SMTP id t10so4084694ybk.8
        for <linux-bluetooth@vger.kernel.org>; Tue, 31 Mar 2020 10:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jR1ZIvGGpwr49EcYtbAyRYtsyb7fcIsCPTJgz8brLjg=;
        b=SHQb2BZb1NJwzySP/s/k9r0GQUXNdN+AowbsOZXgtxeugyf1Pbz5h9RYTfQ/txGmiz
         NW6n042eS9IZqgphrdA1Ix0kbn9I1Dcc9NfMaX1Oc352yj3IUPLpe6Ts7yzbDQTDV+ms
         wOMIWDEWIRPaVQTApzIEL2LXOw28qnygtqLrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jR1ZIvGGpwr49EcYtbAyRYtsyb7fcIsCPTJgz8brLjg=;
        b=JoIURcHyOCRynxO5/iTqvkj/m7PtfPoLgcaxo945MjwNQZqwq081kK7ZAkOHUkx2gM
         xwnxbihNLb4Z5tJS6GUX+uq9F577frAuUVEQRz76SqnmmCYqUKF7/FRrUzhDkbY5tqh8
         j4GJtekGpgp9t2LfyoWyUaDfVgNVycQ7FWcErbTLhN8im80VBey5iOb1ruXO6p1UsUOs
         uX3pp2UXgFnRZ9qzFqlbbBFbfB46zX0/R8TlqUn4djuRUsFjMCo/yXL7f9RPAgH7CI6U
         bhWTuiz901mfBimy55Aljc6ssZI1VXBqO43UYC3CTdY9XnKiqXjnXEWD+yEp8adrHLr1
         056A==
X-Gm-Message-State: ANhLgQ1FVWkEU9/jW+1iopxqPwFuWlZ4Eo+Z4gA387yCx0p2IWmmcwee
        Cs3CaRne/hLkjqhH8+cuYc2e0er+rBSrdJdhWKv9WQ==
X-Google-Smtp-Source: ADFU+vve5e1tGuJEA3r0In28yh8ZrkCmYIkMq/ET420MGqIwCwN7MftCJTiN7MqyF8fIt9NpdjXD9GAtvkLDqJQBdlo=
X-Received: by 2002:a25:6042:: with SMTP id u63mr31758293ybb.77.1585676679963;
 Tue, 31 Mar 2020 10:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000da6059059fcfdcf9@google.com> <0000000000005b022005a22a0050@google.com>
 <20200331174116.GA1844017@kroah.com>
In-Reply-To: <20200331174116.GA1844017@kroah.com>
From:   Grant Grundler <grundler@chromium.org>
Date:   Tue, 31 Mar 2020 10:44:29 -0700
Message-ID: <CANEJEGuhZChGXFzbwaEwArM4UKjUxZo=WNbREPH3887xtu62Nw@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in skb_release_data (2)
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     syzbot <syzbot+a66a7c2e996797bb4acb@syzkaller.appspotmail.com>,
        David Miller <davem@davemloft.net>, festevam@gmail.com,
        Grant Grundler <grundler@chromium.org>,
        Hayes Wang <hayeswang@realtek.com>, johan.hedberg@gmail.com,
        kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
        linux-bluetooth@vger.kernel.org, linux-imx@nxp.com,
        LKML <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org,
        marcel@holtmann.org, nishadkamdar@gmail.com, peter.chen@nxp.com,
        Prashant Malani <pmalani@chromium.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, shawnguo@kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Tue, Mar 31, 2020 at 10:41 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Mar 31, 2020 at 10:36:01AM -0700, syzbot wrote:
> > syzbot suspects this bug was fixed by commit:
> >
> > commit d9958306d4be14f4c7466242b38ed3893a7b1386
> > Author: Nishad Kamdar <nishadkamdar@gmail.com>
> > Date:   Sun Mar 15 10:55:07 2020 +0000
> >
> >     USB: chipidea: Use the correct style for SPDX License Identifier
> >
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16d4940be00000
> > start commit:   63623fd4 Merge tag 'for-linus' of git://git.kernel.org/pub..
> > git tree:       upstream
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=5d2e033af114153f
> > dashboard link: https://syzkaller.appspot.com/bug?extid=a66a7c2e996797bb4acb
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13c25a81e00000
> >
> > If the result looks correct, please mark the bug fixed by replying with:
> >
> > #syz fix: USB: chipidea: Use the correct style for SPDX License Identifier
>
> I really doubt a comment change fixed a syzbot bug :)

Just as I don't believe the bug was caused by pmalani's patch to r8152.

syzbot is just having trouble automatically bisecting/tracking this
bug since it appears only intermittently.

cheers,
grant
