Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D643D239BFA
	for <lists+linux-bluetooth@lfdr.de>; Sun,  2 Aug 2020 22:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727995AbgHBUqV (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 2 Aug 2020 16:46:21 -0400
Received: from mail-il1-f200.google.com ([209.85.166.200]:39572 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727919AbgHBUqU (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 2 Aug 2020 16:46:20 -0400
Received: by mail-il1-f200.google.com with SMTP id i66so17677404ile.6
        for <linux-bluetooth@vger.kernel.org>; Sun, 02 Aug 2020 13:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=gb1bfcM4gWAnNmFB6x9ih5/iUQPdrS6TKSoNqV7OW28=;
        b=tpH2aGnZn8xKPmm/AkCkz6sPhnh+DWZV8nv/26Bbqn8bFv4EP1F37gNw+6TQ20WQi6
         srL2QiavAeVG9i1TdFJQh7J2DwZOrVti1MlezMReoQp2MsH+F7q9oQO2C/0/4jdTI5wj
         lDSqP8W4MjfYcnBRZ18Y1eSrYYs2D+39ZpdgGRqVPZkuKncvKyin3zILQoAFJvoIROcS
         4pKqb6TlrYPfTQZ0M4nvTHy0FqJoeGY8UdTHegk+rr2YYJtYtMGALLZzGSgBwqLeCj5E
         2UHDqyi0oc4Q3vJPRf9cE0za4mjyS1p2YDopvWp3JfWlrVCsw99G4hSWbQyhGTlc3BJV
         HY1Q==
X-Gm-Message-State: AOAM531OtM3fGPUyRZo9SleFegp5/oI1QmF9qPm70ffiJ9HKIpNu42Ng
        ILyh6kSAY+pMTBm8VajNytP8rub55jP8VfuRjvdBaucYhOWb
X-Google-Smtp-Source: ABdhPJz7mj17MBSURQBMv5KS03Lt3OtdtOLBNNjQvilwwvX1G4E5QRCMfbqyg7nZk+NKYsCvDasVLq+D+43TBGEvxDXjyrRQdLdK
MIME-Version: 1.0
X-Received: by 2002:a6b:da0d:: with SMTP id x13mr13949462iob.138.1596401179576;
 Sun, 02 Aug 2020 13:46:19 -0700 (PDT)
Date:   Sun, 02 Aug 2020 13:46:19 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003a51d705abeb1d74@google.com>
Subject: KMSAN: uninit-value in process_adv_report
From:   syzbot <syzbot+e4244d85e5b777ac4d3d@syzkaller.appspotmail.com>
To:     davem@davemloft.net, glider@google.com, johan.hedberg@gmail.com,
        kuba@kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
        marcel@holtmann.org, netdev@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    93f54a72 instrumented.h: fix KMSAN support
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=13238a42900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fa4f3b91169c2501
dashboard link: https://syzkaller.appspot.com/bug?extid=e4244d85e5b777ac4d3d
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=108830ec900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12f9336c900000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e4244d85e5b777ac4d3d@syzkaller.appspotmail.com

Bluetooth: hci0: unknown advertising packet type: 0x2b
=====================================================
BUG: KMSAN: uninit-value in hci_bdaddr_is_rpa include/net/bluetooth/hci_core.h:1486 [inline]
BUG: KMSAN: uninit-value in process_adv_report+0x781/0x2000 net/bluetooth/hci_event.c:5409
CPU: 0 PID: 2202 Comm: kworker/u5:0 Not tainted 5.8.0-rc5-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: hci0 hci_rx_work
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x1df/0x240 lib/dump_stack.c:118
 kmsan_report+0xf7/0x1e0 mm/kmsan/kmsan_report.c:121
 __msan_warning+0x58/0xa0 mm/kmsan/kmsan_instr.c:215
 hci_bdaddr_is_rpa include/net/bluetooth/hci_core.h:1486 [inline]
 process_adv_report+0x781/0x2000 net/bluetooth/hci_event.c:5409
 hci_le_direct_adv_report_evt net/bluetooth/hci_event.c:5837 [inline]
 hci_le_meta_evt net/bluetooth/hci_event.c:5902 [inline]
 hci_event_packet+0x1d08/0x33ee0 net/bluetooth/hci_event.c:6155
 hci_rx_work+0x95f/0xce0 net/bluetooth/hci_core.c:4705
 process_one_work+0x1540/0x1f30 kernel/workqueue.c:2269
 worker_thread+0xed2/0x23f0 kernel/workqueue.c:2415
 kthread+0x515/0x550 kernel/kthread.c:292
 ret_from_fork+0x22/0x30 arch/x86/entry/entry_64.S:293

Uninit was created at:
 kmsan_save_stack_with_flags mm/kmsan/kmsan.c:144 [inline]
 kmsan_internal_poison_shadow+0x66/0xd0 mm/kmsan/kmsan.c:127
 kmsan_slab_alloc+0x8a/0xe0 mm/kmsan/kmsan_hooks.c:80
 slab_alloc_node mm/slub.c:2839 [inline]
 __kmalloc_node_track_caller+0xb40/0x1200 mm/slub.c:4478
 __kmalloc_reserve net/core/skbuff.c:142 [inline]
 __alloc_skb+0x2fd/0xac0 net/core/skbuff.c:210
 alloc_skb include/linux/skbuff.h:1083 [inline]
 bt_skb_alloc include/net/bluetooth/bluetooth.h:377 [inline]
 vhci_get_user drivers/bluetooth/hci_vhci.c:165 [inline]
 vhci_write+0x15b/0x800 drivers/bluetooth/hci_vhci.c:285
 call_write_iter include/linux/fs.h:1908 [inline]
 new_sync_write fs/read_write.c:503 [inline]
 vfs_write+0xd98/0x1480 fs/read_write.c:578
 ksys_write+0x267/0x450 fs/read_write.c:631
 __do_sys_write fs/read_write.c:643 [inline]
 __se_sys_write+0x92/0xb0 fs/read_write.c:640
 __ia32_sys_write+0x4a/0x70 fs/read_write.c:640
 do_syscall_32_irqs_on arch/x86/entry/common.c:430 [inline]
 __do_fast_syscall_32+0x2aa/0x400 arch/x86/entry/common.c:477
 do_fast_syscall_32+0x6b/0xd0 arch/x86/entry/common.c:505
 do_SYSENTER_32+0x73/0x90 arch/x86/entry/common.c:554
 entry_SYSENTER_compat_after_hwframe+0x4d/0x5c
=====================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
