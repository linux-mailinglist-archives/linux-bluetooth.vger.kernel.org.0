Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3736019A85B
	for <lists+linux-bluetooth@lfdr.de>; Wed,  1 Apr 2020 11:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731608AbgDAJNJ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 1 Apr 2020 05:13:09 -0400
Received: from mail-qv1-f68.google.com ([209.85.219.68]:35333 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727627AbgDAJNJ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 1 Apr 2020 05:13:09 -0400
Received: by mail-qv1-f68.google.com with SMTP id q73so12437054qvq.2
        for <linux-bluetooth@vger.kernel.org>; Wed, 01 Apr 2020 02:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jkMgyGLx/BAkeNtxDN6Xm/ZbanBZQvNQbU7eOJcnXos=;
        b=gePLR3I5HlC84w7tgJzEsRDClSwTX0vkukGGPouc74j9tPxnFXOnMxG8zqKusXyLSD
         P1CXTLsHgRD/S8Q8S5YIH4ka/bNjg1DuR3op0rVEU8qu0/3qvutPbOxc2nl/iI4PR1x3
         kISWfSQmZqfiL2nFZ6Rb5KCWgl65Wka5UzT/xrbBgOXxVwSphSnqGCN+0f7ErOkgeCzo
         pdkfIyKq3i2TpWjKqfjvvvBKyxACnt5KZbkN1iV4yOXUi95SDk+EdLX7WIfIWb+0/FFM
         axOTi9LYHzFUG7NygICZeM4Vfcw9ZoImKssVQE87l7r8QgXtWFHq59KR2dylCJRYjYsK
         0DmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jkMgyGLx/BAkeNtxDN6Xm/ZbanBZQvNQbU7eOJcnXos=;
        b=VfmJv8SP7zMFiG9u8/0g7D+68Hi73ued6mkCRHt6NhGJofJZj/3csqZBWi4PHYe+V+
         ff9bWTGiqAy7zMsTU6V4A07WDWaZTUtcFh/Z8xlov4fO3Dv/IZRWvkUefNeLQaIq6XXz
         Nls42taQYCs0faENVmj4J2kaUYgLdhW4H/te4CyA8lzoBNdC+5QMJvXUZSpLlQfps7QG
         P4+0PZi9d0/MTEI5cPK0Ez/TDcZdx/3U/nI8t3MZKq4TimAwOqolyPWwBa/24dgiDJuh
         klqrF299u+nYooZ1a78G0owj0R6Ar8ykSX8ktnm3K8KsBKZJRFv859VM1o1WP8G7fNrP
         PlXg==
X-Gm-Message-State: ANhLgQ0CivXl3+FM6CddGOt9e7cyx7qiaD3mV1NesuIXejFhWZDiMjo9
        XVAoo8awHA1JWWZXSVUJfA0OsbQjlQMMB6yZOT4sIg==
X-Google-Smtp-Source: ADFU+vs06wImJZ2EPBdCY2ie1qh0IX+7CluGHJHL2V6FICU7OeYMC84ibT4JTW0BL1dvRyCt/qMHZuA5ONrD8dluF/U=
X-Received: by 2002:ad4:49d1:: with SMTP id j17mr21052173qvy.80.1585732387345;
 Wed, 01 Apr 2020 02:13:07 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000da6059059fcfdcf9@google.com> <0000000000005b022005a22a0050@google.com>
 <20200331174116.GA1844017@kroah.com> <CANEJEGuhZChGXFzbwaEwArM4UKjUxZo=WNbREPH3887xtu62Nw@mail.gmail.com>
In-Reply-To: <CANEJEGuhZChGXFzbwaEwArM4UKjUxZo=WNbREPH3887xtu62Nw@mail.gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Wed, 1 Apr 2020 11:12:55 +0200
Message-ID: <CACT4Y+Yk_93iScH6F0hhR2yo+pCx_0J32TaTC-_QfXy69pauMA@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in skb_release_data (2)
To:     Grant Grundler <grundler@chromium.org>,
        syzkaller <syzkaller@googlegroups.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        syzbot <syzbot+a66a7c2e996797bb4acb@syzkaller.appspotmail.com>,
        David Miller <davem@davemloft.net>, festevam@gmail.com,
        Hayes Wang <hayeswang@realtek.com>,
        Johan Hedberg <johan.hedberg@gmail.com>, kernel@pengutronix.de,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>, nishadkamdar@gmail.com,
        peter.chen@nxp.com, Prashant Malani <pmalani@chromium.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Tue, Mar 31, 2020 at 7:44 PM Grant Grundler <grundler@chromium.org> wrote:
>
> On Tue, Mar 31, 2020 at 10:41 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Mar 31, 2020 at 10:36:01AM -0700, syzbot wrote:
> > > syzbot suspects this bug was fixed by commit:
> > >
> > > commit d9958306d4be14f4c7466242b38ed3893a7b1386
> > > Author: Nishad Kamdar <nishadkamdar@gmail.com>
> > > Date:   Sun Mar 15 10:55:07 2020 +0000
> > >
> > >     USB: chipidea: Use the correct style for SPDX License Identifier
> > >
> > > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16d4940be00000
> > > start commit:   63623fd4 Merge tag 'for-linus' of git://git.kernel.org/pub..
> > > git tree:       upstream
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=5d2e033af114153f
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=a66a7c2e996797bb4acb
> > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13c25a81e00000
> > >
> > > If the result looks correct, please mark the bug fixed by replying with:
> > >
> > > #syz fix: USB: chipidea: Use the correct style for SPDX License Identifier
> >
> > I really doubt a comment change fixed a syzbot bug :)
>
> Just as I don't believe the bug was caused by pmalani's patch to r8152.
>
> syzbot is just having trouble automatically bisecting/tracking this
> bug since it appears only intermittently.

Checking if vmlinux changes after applying the patch looked like a
smart and simple way to detect all of:
- Comment-only change
- Documentation-only change
- Change to a non-current arch
- Changed to non-enabled configs
- Changes to tests only

But it's not working in reality, there is some bug in kernel or compiler:
https://github.com/google/syzkaller/issues/1271#issuecomment-559093018

You may see in this bisection log as well:
culprit signature:
85ed07d5a8769c26fa0d170475624841e367ea0d08ea79f55ca450a9e97429a0
parent  signature:
2244116b3fcae3bb24003990bcd2b06a03861effee2d94675e527446c3da078f

So this commit somehow does very realistically affect the kernel
binary. So far nobody figured out why...

Before you ask, syzkaller filters out debug info, etc:
https://github.com/google/syzkaller/blob/master/pkg/build/linux.go#L168-L178
