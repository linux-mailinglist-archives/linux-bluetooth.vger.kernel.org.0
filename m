Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3578424AF0E
	for <lists+linux-bluetooth@lfdr.de>; Thu, 20 Aug 2020 08:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727811AbgHTGHa (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 20 Aug 2020 02:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727106AbgHTGH1 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 20 Aug 2020 02:07:27 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFB2BC061757;
        Wed, 19 Aug 2020 23:07:26 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id k13so435189plk.13;
        Wed, 19 Aug 2020 23:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TEwV+gAKUnRj1mZL3fDfuQy8JyNw5xNO138gnCj19os=;
        b=rtRjDmt5UUfqpo78XbWEZ0IEW77Ap958XcFh9IZO8Hib9H8QEMwK7C51gmFTGrZfCM
         CZHHmTNMZGdFyOsts960HDKghxtIW9DtASK5kkSFqmo6fCQq/w9uqgthLq9JtGhJ5wYL
         /vOu79veUaG9At6gwBacYEywMAZFFN5FT4ssaCys8bp2kfpuOkJ8ulLy1HLY3ythM9Nq
         SKqAvKtK6TxUqGdXKHyCk5PSx/jPiby4IO8AQDusBcqJvdb61eeeBT5X4Ds/LXIWtFL7
         LuvYF5/yGBnQtzSrJsD7k3FT2z7u0YPd8WxI5cpOpYmdcZEEt+MoquiOY/sCNvEi0Dyi
         4vzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TEwV+gAKUnRj1mZL3fDfuQy8JyNw5xNO138gnCj19os=;
        b=RJb8qS5RsTJkDIeRPHLeKljAocsSBusYo86/tqPVihTXj4j6PTGLTQfmlhLwG9+2f5
         5x8aCFZb7DTw+qnzvMK3TI6ujJcB0wETvCmWUd/0y5xiFoSt+27R9mcBlGs8OsqSVp5U
         ba79JpMkq4H6OXksCvqA++Ooi3AMAMtDN3znVSimzP3x3Zuup0504Kne2DLdQBsRbJ3U
         puWcRLgnzEIv8037yhULPTtFQ04ldSLg47vszfOa5FXAdsz2QhutXKplUMQIaCvcAK0S
         LFEabS+7MR2R2lQV3SRDsY1ErW1FFVqXCRpZ2DXBj1upPfLqDIeqYD9JD2rcJHC0oq5p
         PXJA==
X-Gm-Message-State: AOAM533z3LNKNOui/ghXuSArlWtN2k5B/j0socSvbdADMxRoiuu4/gWh
        1pTrzS44nh+QiCAW7hVuY9o=
X-Google-Smtp-Source: ABdhPJysPg7llFDXEbdNkggy0Zx6PGaskljQ8fbdAgXP/6VPUKIjhm441S5NYlkXYmxsHbjfymoimw==
X-Received: by 2002:a17:902:b589:: with SMTP id a9mr1395800pls.98.1597903646343;
        Wed, 19 Aug 2020 23:07:26 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id g1sm1250773pfr.97.2020.08.19.23.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 23:07:25 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Thu, 20 Aug 2020 14:07:13 +0800
To:     syzbot <syzbot+dd768a260f7358adbaf9@syzkaller.appspotmail.com>
Cc:     abhishekpandit@chromium.org, davem@davemloft.net,
        gregkh@linuxfoundation.org, johan.hedberg@gmail.com,
        kuba@kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, marcel@holtmann.org,
        netdev@vger.kernel.org, rafael@kernel.org,
        syzkaller-bugs@googlegroups.com,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: BUG: corrupted list in kobject_add_internal
Message-ID: <20200820060713.smilfw3otuunnepe@Rk>
References: <000000000000c57f2d05ac4c5b8e@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <000000000000c57f2d05ac4c5b8e@google.com>
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Fri, Aug 07, 2020 at 09:47:20AM -0700, syzbot wrote:
>Hello,
>
>syzbot found the following issue on:
>
>HEAD commit:    5a30a789 Merge tag 'x86-urgent-2020-08-02' of git://git.ke..
>git tree:       upstream
>console output: https://syzkaller.appspot.com/x/log.txt?x=1660c858900000
>kernel config:  https://syzkaller.appspot.com/x/.config?x=c0cfcf935bcc94d2
>dashboard link: https://syzkaller.appspot.com/bug?extid=dd768a260f7358adbaf9
>compiler:       gcc (GCC) 10.1.0-syz 20200507
>syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14b73afc900000
>C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=124893a4900000
>
>The issue was bisected to:
>
>commit 4f40afc6c76451daff7d0dcfc8a3d113ccf65bfc
>Author: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
>Date:   Wed Mar 11 15:54:01 2020 +0000
>
>    Bluetooth: Handle BR/EDR devices during suspend
>
>bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11cb1e0a900000
>final oops:     https://syzkaller.appspot.com/x/report.txt?x=13cb1e0a900000
>console output: https://syzkaller.appspot.com/x/log.txt?x=15cb1e0a900000
>
>IMPORTANT: if you fix the issue, please add the following tag to the commit:
>Reported-by: syzbot+dd768a260f7358adbaf9@syzkaller.appspotmail.com
>Fixes: 4f40afc6c764 ("Bluetooth: Handle BR/EDR devices during suspend")
>
>debugfs: Directory '200' with parent 'hci0' already present!
>list_add double add: new=ffff88808e9b6418, prev=ffff88808e9b6418, next=ffff8880a973ef00.
>------------[ cut here ]------------
>kernel BUG at lib/list_debug.c:29!
>invalid opcode: 0000 [#1] PREEMPT SMP KASAN
>CPU: 1 PID: 6882 Comm: kworker/u5:1 Not tainted 5.8.0-rc7-syzkaller #0
>Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
>Workqueue: hci0 hci_rx_work
>RIP: 0010:__list_add_valid.cold+0x26/0x3c lib/list_debug.c:29
>Code: 57 ff ff ff 4c 89 e1 48 c7 c7 20 92 93 88 e8 b1 f1 c1 fd 0f 0b 48 89 f2 4c 89 e1 48 89 ee 48 c7 c7 60 93 93 88 e8 9a f1 c1 fd <0f> 0b 48 89 f1 48 c7 c7 e0 92 93 88 4c 89 e6 e8 86 f1 c1 fd 0f 0b
>RSP: 0018:ffffc90001777830 EFLAGS: 00010282
>RAX: 0000000000000058 RBX: ffff8880a973ef00 RCX: 0000000000000000
>RDX: ffff888094f1c200 RSI: ffffffff815d4ef7 RDI: fffff520002eeef8
>RBP: ffff88808e9b6418 R08: 0000000000000058 R09: ffff8880ae7318e7
>R10: 0000000000000000 R11: 0000000000000000 R12: ffff8880a973ef00
>R13: ffff888087315270 R14: ffff88808e9b6430 R15: ffff88808e9b6418
>FS:  0000000000000000(0000) GS:ffff8880ae700000(0000) knlGS:0000000000000000
>CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>CR2: 00007ffdcd6db747 CR3: 000000009ba09000 CR4: 00000000001406e0
>DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>Call Trace:
> __list_add include/linux/list.h:67 [inline]
> list_add_tail include/linux/list.h:100 [inline]
> kobj_kset_join lib/kobject.c:196 [inline]
> kobject_add_internal+0x18d/0x940 lib/kobject.c:246
> kobject_add_varg lib/kobject.c:390 [inline]
> kobject_add+0x150/0x1c0 lib/kobject.c:442
> device_add+0x35a/0x1be0 drivers/base/core.c:2633
> hci_conn_add_sysfs+0x84/0xe0 net/bluetooth/hci_sysfs.c:53
> hci_conn_complete_evt net/bluetooth/hci_event.c:2607 [inline]
> hci_event_packet+0xe0b/0x86f5 net/bluetooth/hci_event.c:6033
> hci_rx_work+0x22e/0xb10 net/bluetooth/hci_core.c:4705
> process_one_work+0x94c/0x1670 kernel/workqueue.c:2269
> worker_thread+0x64c/0x1120 kernel/workqueue.c:2415
> kthread+0x3b5/0x4a0 kernel/kthread.c:291
> ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:293
>Modules linked in:
>---[ end trace b1bcc552c32d25e9 ]---
>RIP: 0010:__list_add_valid.cold+0x26/0x3c lib/list_debug.c:29
>Code: 57 ff ff ff 4c 89 e1 48 c7 c7 20 92 93 88 e8 b1 f1 c1 fd 0f 0b 48 89 f2 4c 89 e1 48 89 ee 48 c7 c7 60 93 93 88 e8 9a f1 c1 fd <0f> 0b 48 89 f1 48 c7 c7 e0 92 93 88 4c 89 e6 e8 86 f1 c1 fd 0f 0b
>RSP: 0018:ffffc90001777830 EFLAGS: 00010282
>RAX: 0000000000000058 RBX: ffff8880a973ef00 RCX: 0000000000000000
>RDX: ffff888094f1c200 RSI: ffffffff815d4ef7 RDI: fffff520002eeef8
>RBP: ffff88808e9b6418 R08: 0000000000000058 R09: ffff8880ae7318e7
>R10: 0000000000000000 R11: 0000000000000000 R12: ffff8880a973ef00
>R13: ffff888087315270 R14: ffff88808e9b6430 R15: ffff88808e9b6418
>FS:  0000000000000000(0000) GS:ffff8880ae700000(0000) knlGS:0000000000000000
>CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>CR2: 00007ffdcd6db747 CR3: 0000000009a79000 CR4: 00000000001406e0
>DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>
>
>---
>This report is generated by a bot. It may contain errors.
>See https://goo.gl/tpsmEJ for more information about syzbot.
>syzbot engineers can be reached at syzkaller@googlegroups.com.
>
>syzbot will keep track of this issue. See:
>https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>For information about bisection process see: https://goo.gl/tpsmEJ#bisection
>syzbot can test patches for this issue, for details see:
>https://goo.gl/tpsmEJ#testing-patches
>
>--
>You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
>To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
>To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/000000000000c57f2d05ac4c5b8e%40google.com.

This problem occurs because the HCI_EV_CONN_COMPLETE event packet is sent
twice for the same HCI connection,

     struct hci_ev_conn_complete complete;
     memset(&complete, 0, sizeof(complete));
     complete.status = 0;
     complete.handle = HCI_HANDLE_1;
     memset(&complete.bdaddr, 0xaa, 6);
     *(uint8_t*)&complete.bdaddr.b[5] = 0x10;
     complete.link_type = ACL_LINK;
     complete.encr_mode = 0;
     hci_send_event_packet(vhci_fd, HCI_EV_CONN_COMPLETE, &complete,
                             sizeof(complete));

which leads to kobject_add being called twice. Thus duplicate
(struct hci_conn *conn)->dev.kobj.entry is inserted into
(struct hci_conn *conn)->dev.kobj.kset->list.

But if it's the HCI connection creator's responsibility to
not send the HCI_EV_CONN_COMPLETE event packet twice, then it's not a
valid bug. Or should we make the kernel more robust by defending against
this case?

--
Best regards,
Coiby
