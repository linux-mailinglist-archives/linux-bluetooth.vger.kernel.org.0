Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAEE23804A0
	for <lists+linux-bluetooth@lfdr.de>; Fri, 14 May 2021 09:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233169AbhENHv3 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 14 May 2021 03:51:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230252AbhENHv2 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 14 May 2021 03:51:28 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F080C061574
        for <linux-bluetooth@vger.kernel.org>; Fri, 14 May 2021 00:50:17 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id f29so15709785qka.0
        for <linux-bluetooth@vger.kernel.org>; Fri, 14 May 2021 00:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FVH2zIUnP9sz5lTX5KnCsMJbYs82gorNQPSx9fXvjHk=;
        b=jqKW66NFhksRG5U+2OA0I5FaMsDDdRWKyeELwYa6++jQX/WVTSntmgvZZrcD2cyeqa
         OI8y+VjWtelGTnQSTFfLbTC895vm/hrGprO3TgNgpx7ayVGT0IQvHafwPEE/SyAlf4Qw
         gaqrR0clbyT4QUSmnvsX5gGGAqMwk9GfqozE6P9lioNsiPVB4PuHZLRmfxdk5ZJw69VW
         LHHJDKiL68COg0qsYokAj9Vn5bAoULmMKk1roEraqJY9ZJIVgNe8wksmfA2YNe5M/p0Z
         Prv5JVze+mGu8igde8ze3fL9UiGdnhK9RThLKqyGKq4IiP1fdJMddpLygLpK+8k5Yvyc
         44dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FVH2zIUnP9sz5lTX5KnCsMJbYs82gorNQPSx9fXvjHk=;
        b=Yju61oBqOECVpGmc9Hd5wLSnL/bjxFNT6xBbWUNy66VXHOZApfPvtaIDyH77ErKVDJ
         opC0pb1PLaOc9jdVvRzj59jY0+06p8Nid2qsqBRPPC7njDsqFClfcCet2jCvDVz//u3R
         ev3GQslHpv2wEvxMFNIcp6l53uwXEVGJ2L99fWyi/YZLfarfZ8f14J5j0E5AQy0CQHkM
         /UN4v9WiE9SJikbyZcrMfchSrgFMdByNfnoXPRSfyqpam1rAwsS6mdKMr0vF1tlsPE5h
         I4t78V0rPcQRq1pUpx8zGMH083V/X2lj6htNAILLVBuGo83MXBiGtBHMg9TWInocaOBg
         p8tw==
X-Gm-Message-State: AOAM532Lf6aCkTa9tFgF716P1n7uctWZmfIlj4Y9LP3ub3jDz2kc2OEV
        EMEee9kbFG1+JwqkDV0RS6m91nTh1Jo51gV587zujA==
X-Google-Smtp-Source: ABdhPJzUEzHXNsQw5zClRc6RrnFOutjEN6xkX6IPJ12OJocjAQ6uixJ27Y3w8crf+IGiWWrD6kdcuN/HiekmnBwP6iY=
X-Received: by 2002:a37:4284:: with SMTP id p126mr23528523qka.501.1620978616514;
 Fri, 14 May 2021 00:50:16 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000001d48cd05abebd088@google.com> <000000000000987c8205c2446ac9@google.com>
In-Reply-To: <000000000000987c8205c2446ac9@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 14 May 2021 09:50:05 +0200
Message-ID: <CACT4Y+ZFfu6a4z_fFHLupQQndH-1dn=z9s41MAmPK=QmCg+aCA@mail.gmail.com>
Subject: Re: [syzbot] WARNING: ODEBUG bug in bt_host_release
To:     syzbot <syzbot+0ce8a29c6c6469b16632@syzkaller.appspotmail.com>
Cc:     David Miller <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>, linma@zju.edu.cn,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, luiz.dentz@gmail.com,
        Marcel Holtmann <marcel@holtmann.org>,
        netdev <netdev@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        syzscope@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Fri, May 14, 2021 at 8:33 AM syzbot
<syzbot+0ce8a29c6c6469b16632@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit e2cb6b891ad2b8caa9131e3be70f45243df82a80
> Author: Lin Ma <linma@zju.edu.cn>
> Date:   Mon Apr 12 11:17:57 2021 +0000
>
>     bluetooth: eliminate the potential race condition when removing the HCI controller
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15427145d00000
> start commit:   f873db9a Merge tag 'io_uring-5.9-2020-08-21' of git://git...
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=bb68b9e8a8cc842f
> dashboard link: https://syzkaller.appspot.com/bug?extid=0ce8a29c6c6469b16632
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10310972900000
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: bluetooth: eliminate the potential race condition when removing the HCI controller
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

Looks reasonable based on the commit and bisection log.
Unfortunately I cannot easily send this as my email client will wrap
the commit title line (longer than 80 chars)...
