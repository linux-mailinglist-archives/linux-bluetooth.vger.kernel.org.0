Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C42D42349D8
	for <lists+linux-bluetooth@lfdr.de>; Fri, 31 Jul 2020 19:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733072AbgGaREY (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 31 Jul 2020 13:04:24 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:38100 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732973AbgGaREX (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 31 Jul 2020 13:04:23 -0400
Received: by mail-io1-f72.google.com with SMTP id a65so12443502iog.5
        for <linux-bluetooth@vger.kernel.org>; Fri, 31 Jul 2020 10:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=ZdAnHGVy9LgoO3SJHEMpX6y3/EdWZ4Nira0XtxekYaE=;
        b=f95R7Q2yroqz1LnI+l2g/9OTjUischlDqouGY0XpVqZqwiwfzWs/KD28Z7OyJbBI4q
         Z9tTy/1nlQDsnRxMkS7/nZqaWQqSoxEZZeZgLSYmrm9wRIw84LnK3OU4IDe+2Ye0gQ3b
         2kvEhrauPPafHRAh5xh7+2X8WibAQ3xMnzys+m5TgsZA5tqQCxz0uNTbt8j6wywXxn0A
         ofBFu4X4LH86d+D0TruIQ1XQgUZ/qQY7zpzN065CvVnuovsSY1KSt6Ogq2ePUwKWCNLu
         mnglWGb7ZF3xI6hfhtuBnoXpgroSiYM3RPsorCmT7IGsPTu6jTJbjDjtjnMmS2Y1mVHp
         6xFw==
X-Gm-Message-State: AOAM533HmmrMXkA2LMS7Em7DTCZ2ezPGN4SyKJ0Q65a1i3wSpzKV2gJr
        dqmQKkGA4scx2elX0Px07Jz+dZTjUMkhcakxjO4V4ZK1sJgU
X-Google-Smtp-Source: ABdhPJxjiOxqxzdFpC1XBmA7iIoooMkgjCPCp2JMxWYhW4zWLMdOs5xQbJ5qjdoB0lxgaA8MJokuspLO3/3N/aulcDJqfFKuv+Qh
MIME-Version: 1.0
X-Received: by 2002:a05:6638:13c5:: with SMTP id i5mr6006394jaj.29.1596215062006;
 Fri, 31 Jul 2020 10:04:22 -0700 (PDT)
Date:   Fri, 31 Jul 2020 10:04:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c18f1a05abbfc792@google.com>
Subject: KASAN: null-ptr-deref Write in amp_read_loc_assoc_final_data
From:   syzbot <syzbot+f4fb0eaafdb51c32a153@syzkaller.appspotmail.com>
To:     corbet@lwn.net, coreteam@netfilter.org, davem@davemloft.net,
        johan.hedberg@gmail.com, kaber@trash.net, kadlec@blackhole.kfki.hu,
        kuba@kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux@armlinux.org.uk, marcel@holtmann.org, mchehab@kernel.org,
        mchehab@s-opensource.com, netdev@vger.kernel.org,
        netfilter-devel@vger.kernel.org, pablo@netfilter.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    83bdc727 random32: remove net_rand_state from the latent e..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=176e5d12900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e59ee776d5aa8d55
dashboard link: https://syzkaller.appspot.com/bug?extid=f4fb0eaafdb51c32a153
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13d5ed24900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1381a56c900000

The issue was bisected to:

commit a4585c31c5018578b4abf699ddfdff719dd1c313
Author: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Date:   Tue Oct 18 19:44:09 2016 +0000

    [media] marvell-ccic: don't break long lines

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=160d627c900000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=150d627c900000
console output: https://syzkaller.appspot.com/x/log.txt?x=110d627c900000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f4fb0eaafdb51c32a153@syzkaller.appspotmail.com
Fixes: a4585c31c501 ("[media] marvell-ccic: don't break long lines")

==================================================================
BUG: KASAN: null-ptr-deref in instrument_atomic_write include/linux/instrumented.h:71 [inline]
BUG: KASAN: null-ptr-deref in set_bit include/asm-generic/bitops/instrumented-atomic.h:28 [inline]
BUG: KASAN: null-ptr-deref in amp_read_loc_assoc_final_data+0x115/0x260 net/bluetooth/amp.c:304
Write of size 8 at addr 0000000000000030 by task kworker/u5:2/6842

CPU: 1 PID: 6842 Comm: kworker/u5:2 Not tainted 5.8.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: hci0 hci_rx_work
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x1f0/0x31e lib/dump_stack.c:118
 __kasan_report mm/kasan/report.c:517 [inline]
 kasan_report+0x151/0x1d0 mm/kasan/report.c:530
 check_memory_region_inline mm/kasan/generic.c:183 [inline]
 check_memory_region+0x2b5/0x2f0 mm/kasan/generic.c:192
 instrument_atomic_write include/linux/instrumented.h:71 [inline]
 set_bit include/asm-generic/bitops/instrumented-atomic.h:28 [inline]
 amp_read_loc_assoc_final_data+0x115/0x260 net/bluetooth/amp.c:304
 hci_chan_selected_evt net/bluetooth/hci_event.c:4897 [inline]
 hci_event_packet+0x8289/0x18240 net/bluetooth/hci_event.c:6164
 hci_rx_work+0x236/0x9c0 net/bluetooth/hci_core.c:4705
 process_one_work+0x789/0xfc0 kernel/workqueue.c:2269
 worker_thread+0xaa4/0x1460 kernel/workqueue.c:2415
 kthread+0x37e/0x3a0 drivers/block/aoe/aoecmd.c:1234
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:293
==================================================================
Kernel panic - not syncing: panic_on_warn set ...
CPU: 1 PID: 6842 Comm: kworker/u5:2 Tainted: G    B             5.8.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: hci0 hci_rx_work
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x1f0/0x31e lib/dump_stack.c:118
 panic+0x264/0x7a0 kernel/panic.c:231
 end_report mm/kasan/report.c:104 [inline]
 __kasan_report mm/kasan/report.c:520 [inline]
 kasan_report+0x1c9/0x1d0 mm/kasan/report.c:530
 check_memory_region_inline mm/kasan/generic.c:183 [inline]
 check_memory_region+0x2b5/0x2f0 mm/kasan/generic.c:192
 instrument_atomic_write include/linux/instrumented.h:71 [inline]
 set_bit include/asm-generic/bitops/instrumented-atomic.h:28 [inline]
 amp_read_loc_assoc_final_data+0x115/0x260 net/bluetooth/amp.c:304
 hci_chan_selected_evt net/bluetooth/hci_event.c:4897 [inline]
 hci_event_packet+0x8289/0x18240 net/bluetooth/hci_event.c:6164
 hci_rx_work+0x236/0x9c0 net/bluetooth/hci_core.c:4705
 process_one_work+0x789/0xfc0 kernel/workqueue.c:2269
 worker_thread+0xaa4/0x1460 kernel/workqueue.c:2415
 kthread+0x37e/0x3a0 drivers/block/aoe/aoecmd.c:1234
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:293
Kernel Offset: disabled
Rebooting in 86400 seconds..


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
