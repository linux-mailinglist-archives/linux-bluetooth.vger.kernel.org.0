Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16C102A5D9
	for <lists+linux-bluetooth@lfdr.de>; Sat, 25 May 2019 19:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727350AbfEYRiU (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 25 May 2019 13:38:20 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:45025 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726647AbfEYRiG (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 25 May 2019 13:38:06 -0400
Received: by mail-io1-f69.google.com with SMTP id z10so10166608iom.11
        for <linux-bluetooth@vger.kernel.org>; Sat, 25 May 2019 10:38:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=W0sM+dkM5p+EzGcOUhbNOnMkSf+3EYQYnJRlw+QErig=;
        b=dp5+SZzNLVrHOSvpdZszlJV30iN5ulKfbanoi+SOqqfJk2FtYOvOAlfHYaKZzKTSkA
         +Y19XIhx6XGFNn0ovGy+0+tG9WiwVSQQUA3UCdhptKTE5hY74jMFtwGS3F6l/1wUgaN3
         aKrUBQPQxfYgJtOzdWAi+CJfQv7aHgwdPF/Km8SE0dEFkIMrpC+wR5YSwdMLnErCiqLL
         rwjWfivCo1zYesVQhTbmIxygLvfYWLP8fnM8ZopMuyWtARCDLfzdET5lyOl7U4fG7Zob
         F6ZWujr+i6nhqdpWnLekMavsxhjmd7wn6JZB9Ki/A8Qzpp9ryUUJAfNhioZveuJYGLCO
         pp2w==
X-Gm-Message-State: APjAAAXkcA3C7Jc67Rlze9jMN0/4aGM2K11ayKryB9dqir15UNxYPNhB
        bJebD2KveeSEw/iv95JWmmmI2R+lS7WbCSP8k9OTOP1TNiB3
X-Google-Smtp-Source: APXvYqzmCzxmhXot/pkKNomMM3XaJxwIL1NaHND0Utz8T5kE3LtJd7GN/NO/HFZnk5/+gXXmbaITmho3ro/+PY/Va91xxzpwx+Kb
MIME-Version: 1.0
X-Received: by 2002:a02:c7c9:: with SMTP id s9mr982338jao.82.1558805885471;
 Sat, 25 May 2019 10:38:05 -0700 (PDT)
Date:   Sat, 25 May 2019 10:38:05 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000013d4880589b9c7d3@google.com>
Subject: memory leak in bcsp_recv
From:   syzbot <syzbot+98162c885993b72f19c4@syzkaller.appspotmail.com>
To:     johan.hedberg@gmail.com, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, marcel@holtmann.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    c50bbf61 Merge tag 'platform-drivers-x86-v5.2-2' of git://..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=113f684ca00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=61dd9e15a761691d
dashboard link: https://syzkaller.appspot.com/bug?extid=98162c885993b72f19c4
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=143fcb8aa00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=137bd84ca00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+98162c885993b72f19c4@syzkaller.appspotmail.com

9 tx timeout
BUG: memory leak
unreferenced object 0xffff888123ccbc00 (size 224):
   comm "syz-executor717", pid 7249, jiffies 4295003727 (age 28.450s)
   hex dump (first 32 bytes):
     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
   backtrace:
     [<00000000600479ed>] kmemleak_alloc_recursive  
include/linux/kmemleak.h:55 [inline]
     [<00000000600479ed>] slab_post_alloc_hook mm/slab.h:439 [inline]
     [<00000000600479ed>] slab_alloc_node mm/slab.c:3269 [inline]
     [<00000000600479ed>] kmem_cache_alloc_node+0x153/0x2a0 mm/slab.c:3579
     [<0000000059f3ba6b>] __alloc_skb+0x6e/0x210 net/core/skbuff.c:198
     [<0000000074e70f06>] alloc_skb include/linux/skbuff.h:1058 [inline]
     [<0000000074e70f06>] bt_skb_alloc include/net/bluetooth/bluetooth.h:339  
[inline]
     [<0000000074e70f06>] bcsp_recv+0x1c3/0x540  
drivers/bluetooth/hci_bcsp.c:685
     [<00000000edf8c323>] hci_uart_tty_receive+0xba/0x200  
drivers/bluetooth/hci_ldisc.c:607
     [<000000009051651a>] tiocsti drivers/tty/tty_io.c:2195 [inline]
     [<000000009051651a>] tty_ioctl+0x81c/0xa30 drivers/tty/tty_io.c:2571
     [<000000005695f2c9>] vfs_ioctl fs/ioctl.c:46 [inline]
     [<000000005695f2c9>] file_ioctl fs/ioctl.c:509 [inline]
     [<000000005695f2c9>] do_vfs_ioctl+0x62a/0x810 fs/ioctl.c:696
     [<00000000be82d55d>] ksys_ioctl+0x86/0xb0 fs/ioctl.c:713
     [<00000000d19fa7dc>] __do_sys_ioctl fs/ioctl.c:720 [inline]
     [<00000000d19fa7dc>] __se_sys_ioctl fs/ioctl.c:718 [inline]
     [<00000000d19fa7dc>] __x64_sys_ioctl+0x1e/0x30 fs/ioctl.c:718
     [<0000000051eaf016>] do_syscall_64+0x76/0x1a0  
arch/x86/entry/common.c:301
     [<000000000b0b6970>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff888123ccbc00 (size 224):
   comm "syz-executor717", pid 7249, jiffies 4295003727 (age 30.380s)
   hex dump (first 32 bytes):
     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
   backtrace:
     [<00000000600479ed>] kmemleak_alloc_recursive  
include/linux/kmemleak.h:55 [inline]
     [<00000000600479ed>] slab_post_alloc_hook mm/slab.h:439 [inline]
     [<00000000600479ed>] slab_alloc_node mm/slab.c:3269 [inline]
     [<00000000600479ed>] kmem_cache_alloc_node+0x153/0x2a0 mm/slab.c:3579
     [<0000000059f3ba6b>] __alloc_skb+0x6e/0x210 net/core/skbuff.c:198
     [<0000000074e70f06>] alloc_skb include/linux/skbuff.h:1058 [inline]
     [<0000000074e70f06>] bt_skb_alloc include/net/bluetooth/bluetooth.h:339  
[inline]
     [<0000000074e70f06>] bcsp_recv+0x1c3/0x540  
drivers/bluetooth/hci_bcsp.c:685
     [<00000000edf8c323>] hci_uart_tty_receive+0xba/0x200  
drivers/bluetooth/hci_ldisc.c:607
     [<000000009051651a>] tiocsti drivers/tty/tty_io.c:2195 [inline]
     [<000000009051651a>] tty_ioctl+0x81c/0xa30 drivers/tty/tty_io.c:2571
     [<000000005695f2c9>] vfs_ioctl fs/ioctl.c:46 [inline]
     [<000000005695f2c9>] file_ioctl fs/ioctl.c:509 [inline]
     [<000000005695f2c9>] do_vfs_ioctl+0x62a/0x810 fs/ioctl.c:696
     [<00000000be82d55d>] ksys_ioctl+0x86/0xb0 fs/ioctl.c:713
     [<00000000d19fa7dc>] __do_sys_ioctl fs/ioctl.c:720 [inline]
     [<00000000d19fa7dc>] __se_sys_ioctl fs/ioctl.c:718 [inline]
     [<00000000d19fa7dc>] __x64_sys_ioctl+0x1e/0x30 fs/ioctl.c:718
     [<0000000051eaf016>] do_syscall_64+0x76/0x1a0  
arch/x86/entry/common.c:301
     [<000000000b0b6970>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff888123ccbc00 (size 224):
   comm "syz-executor717", pid 7249, jiffies 4295003727 (age 31.350s)
   hex dump (first 32 bytes):
     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
   backtrace:
     [<00000000600479ed>] kmemleak_alloc_recursive  
include/linux/kmemleak.h:55 [inline]
     [<00000000600479ed>] slab_post_alloc_hook mm/slab.h:439 [inline]
     [<00000000600479ed>] slab_alloc_node mm/slab.c:3269 [inline]
     [<00000000600479ed>] kmem_cache_alloc_node+0x153/0x2a0 mm/slab.c:3579
     [<0000000059f3ba6b>] __alloc_skb+0x6e/0x210 net/core/skbuff.c:198
     [<0000000074e70f06>] alloc_skb include/linux/skbuff.h:1058 [inline]
     [<0000000074e70f06>] bt_skb_alloc include/net/bluetooth/bluetooth.h:339  
[inline]
     [<0000000074e70f06>] bcsp_recv+0x1c3/0x540  
drivers/bluetooth/hci_bcsp.c:685
     [<00000000edf8c323>] hci_uart_tty_receive+0xba/0x200  
drivers/bluetooth/hci_ldisc.c:607
     [<000000009051651a>] tiocsti drivers/tty/tty_io.c:2195 [inline]
     [<000000009051651a>] tty_ioctl+0x81c/0xa30 drivers/tty/tty_io.c:2571
     [<000000005695f2c9>] vfs_ioctl fs/ioctl.c:46 [inline]
     [<000000005695f2c9>] file_ioctl fs/ioctl.c:509 [inline]
     [<000000005695f2c9>] do_vfs_ioctl+0x62a/0x810 fs/ioctl.c:696
     [<00000000be82d55d>] ksys_ioctl+0x86/0xb0 fs/ioctl.c:713
     [<00000000d19fa7dc>] __do_sys_ioctl fs/ioctl.c:720 [inline]
     [<00000000d19fa7dc>] __se_sys_ioctl fs/ioctl.c:718 [inline]
     [<00000000d19fa7dc>] __x64_sys_ioctl+0x1e/0x30 fs/ioctl.c:718
     [<0000000051eaf016>] do_syscall_64+0x76/0x1a0  
arch/x86/entry/common.c:301
     [<000000000b0b6970>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff888123ccbc00 (size 224):
   comm "syz-executor717", pid 7249, jiffies 4295003727 (age 31.400s)
   hex dump (first 32 bytes):
     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
   backtrace:
     [<00000000600479ed>] kmemleak_alloc_recursive  
include/linux/kmemleak.h:55 [inline]
     [<00000000600479ed>] slab_post_alloc_hook mm/slab.h:439 [inline]
     [<00000000600479ed>] slab_alloc_node mm/slab.c:3269 [inline]
     [<00000000600479ed>] kmem_cache_alloc_node+0x153/0x2a0 mm/slab.c:3579
     [<0000000059f3ba6b>] __alloc_skb+0x6e/0x210 net/core/skbuff.c:198
     [<0000000074e70f06>] alloc_skb include/linux/skbuff.h:1058 [inline]
     [<0000000074e70f06>] bt_skb_alloc include/net/bluetooth/bluetooth.h:339  
[inline]
     [<0000000074e70f06>] bcsp_recv+0x1c3/0x540  
drivers/bluetooth/hci_bcsp.c:685
     [<00000000edf8c323>] hci_uart_tty_receive+0xba/0x200  
drivers/bluetooth/hci_ldisc.c:607
     [<000000009051651a>] tiocsti drivers/tty/tty_io.c:2195 [inline]
     [<000000009051651a>] tty_ioctl+0x81c/0xa30 drivers/tty/tty_io.c:2571
     [<000000005695f2c9>] vfs_ioctl fs/ioctl.c:46 [inline]
     [<000000005695f2c9>] file_ioctl fs/ioctl.c:509 [inline]
     [<000000005695f2c9>] do_vfs_ioctl+0x62a/0x810 fs/ioctl.c:696
     [<00000000be82d55d>] ksys_ioctl+0x86/0xb0 fs/ioctl.c:713
     [<00000000d19fa7dc>] __do_sys_ioctl fs/ioctl.c:720 [inline]
     [<00000000d19fa7dc>] __se_sys_ioctl fs/ioctl.c:718 [inline]
     [<00000000d19fa7dc>] __x64_sys_ioctl+0x1e/0x30 fs/ioctl.c:718
     [<0000000051eaf016>] do_syscall_64+0x76/0x1a0  
arch/x86/entry/common.c:301
     [<000000000b0b6970>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff888123ccbc00 (size 224):
   comm "syz-executor717", pid 7249, jiffies 4295003727 (age 32.360s)
   hex dump (first 32 bytes):
     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
   backtrace:
     [<00000000600479ed>] kmemleak_alloc_recursive  
include/linux/kmemleak.h:55 [inline]
     [<00000000600479ed>] slab_post_alloc_hook mm/slab.h:439 [inline]
     [<00000000600479ed>] slab_alloc_node mm/slab.c:3269 [inline]
     [<00000000600479ed>] kmem_cache_alloc_node+0x153/0x2a0 mm/slab.c:3579
     [<0000000059f3ba6b>] __alloc_skb+0x6e/0x210 net/core/skbuff.c:198
     [<0000000074e70f06>] alloc_skb include/linux/skbuff.h:1058 [inline]
     [<0000000074e70f06>] bt_skb_alloc include/net/bluetooth/bluetooth.h:339  
[inline]
     [<0000000074e70f06>] bcsp_recv+0x1c3/0x540  
drivers/bluetooth/hci_bcsp.c:685
     [<00000000edf8c323>] hci_uart_tty_receive+0xba/0x200  
drivers/bluetooth/hci_ldisc.c:607
     [<000000009051651a>] tiocsti drivers/tty/tty_io.c:2195 [inline]
     [<000000009051651a>] tty_ioctl+0x81c/0xa30 drivers/tty/tty_io.c:2571
     [<000000005695f2c9>] vfs_ioctl fs/ioctl.c:46 [inline]
     [<000000005695f2c9>] file_ioctl fs/ioctl.c:509 [inline]
     [<000000005695f2c9>] do_vfs_ioctl+0x62a/0x810 fs/ioctl.c:696
     [<00000000be82d55d>] ksys_ioctl+0x86/0xb0 fs/ioctl.c:713
     [<00000000d19fa7dc>] __do_sys_ioctl fs/ioctl.c:720 [inline]
     [<00000000d19fa7dc>] __se_sys_ioctl fs/ioctl.c:718 [inline]
     [<00000000d19fa7dc>] __x64_sys_ioctl+0x1e/0x30 fs/ioctl.c:718
     [<0000000051eaf016>] do_syscall_64+0x76/0x1a0  
arch/x86/entry/common.c:301
     [<000000000b0b6970>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff888123ccbc00 (size 224):
   comm "syz-executor717", pid 7249, jiffies 4295003727 (age 33.320s)
   hex dump (first 32 bytes):
     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
   backtrace:
     [<00000000600479ed>] kmemleak_alloc_recursive  
include/linux/kmemleak.h:55 [inline]
     [<00000000600479ed>] slab_post_alloc_hook mm/slab.h:439 [inline]
     [<00000000600479ed>] slab_alloc_node mm/slab.c:3269 [inline]
     [<00000000600479ed>] kmem_cache_alloc_node+0x153/0x2a0 mm/slab.c:3579
     [<0000000059f3ba6b>] __alloc_skb+0x6e/0x210 net/core/skbuff.c:198
     [<0000000074e70f06>] alloc_skb include/linux/skbuff.h:1058 [inline]
     [<0000000074e70f06>] bt_skb_alloc include/net/bluetooth/bluetooth.h:339  
[inline]
     [<0000000074e70f06>] bcsp_recv+0x1c3/0x540  
drivers/bluetooth/hci_bcsp.c:685
     [<00000000edf8c323>] hci_uart_tty_receive+0xba/0x200  
drivers/bluetooth/hci_ldisc.c:607
     [<000000009051651a>] tiocsti drivers/tty/tty_io.c:2195 [inline]
     [<000000009051651a>] tty_ioctl+0x81c/0xa30 drivers/tty/tty_io.c:2571
     [<000000005695f2c9>] vfs_ioctl fs/ioctl.c:46 [inline]
     [<000000005695f2c9>] file_ioctl fs/ioctl.c:509 [inline]
     [<000000005695f2c9>] do_vfs_ioctl+0x62a/0x810 fs/ioctl.c:696
     [<00000000be82d55d>] ksys_ioctl+0x86/0xb0 fs/ioctl.c:713
     [<00000000d19fa7dc>] __do_sys_ioctl fs/ioctl.c:720 [inline]
     [<00000000d19fa7dc>] __se_sys_ioctl fs/ioctl.c:718 [inline]
     [<00000000d19fa7dc>] __x64_sys_ioctl+0x1e/0x30 fs/ioctl.c:718
     [<0000000051eaf016>] do_syscall_64+0x76/0x1a0  
arch/x86/entry/common.c:301
     [<000000000b0b6970>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff888123ccbc00 (size 224):
   comm "syz-executor717", pid 7249, jiffies 4295003727 (age 33.370s)
   hex dump (first 32 bytes):
     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
   backtrace:
     [<00000000600479ed>] kmemleak_alloc_recursive  
include/linux/kmemleak.h:55 [inline]
     [<00000000600479ed>] slab_post_alloc_hook mm/slab.h:439 [inline]
     [<00000000600479ed>] slab_alloc_node mm/slab.c:3269 [inline]
     [<00000000600479ed>] kmem_cache_alloc_node+0x153/0x2a0 mm/slab.c:3579
     [<0000000059f3ba6b>] __alloc_skb+0x6e/0x210 net/core/skbuff.c:198
     [<0000000074e70f06>] alloc_skb include/linux/skbuff.h:1058 [inline]
     [<0000000074e70f06>] bt_skb_alloc include/net/bluetooth/bluetooth.h:339  
[inline]
     [<0000000074e70f06>] bcsp_recv+0x1c3/0x540  
drivers/bluetooth/hci_bcsp.c:685
     [<00000000edf8c323>] hci_uart_tty_receive+0xba/0x200  
drivers/bluetooth/hci_ldisc.c:607
     [<000000009051651a>] tiocsti drivers/tty/tty_io.c:2195 [inline]
     [<000000009051651a>] tty_ioctl+0x81c/0xa30 drivers/tty/tty_io.c:2571
     [<000000005695f2c9>] vfs_ioctl fs/ioctl.c:46 [inline]
     [<000000005695f2c9>] file_ioctl fs/ioctl.c:509 [inline]
     [<000000005695f2c9>] do_vfs_ioctl+0x62a/0x810 fs/ioctl.c:696
     [<00000000be82d55d>] ksys_ioctl+0x86/0xb0 fs/ioctl.c:713
     [<00000000d19fa7dc>] __do_sys_ioctl fs/ioctl.c:720 [inline]
     [<00000000d19fa7dc>] __se_sys_ioctl fs/ioctl.c:718 [inline]
     [<00000000d19fa7dc>] __x64_sys_ioctl+0x1e/0x30 fs/ioctl.c:718
     [<0000000051eaf016>] do_syscall_64+0x76/0x1a0  
arch/x86/entry/common.c:301
     [<000000000b0b6970>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

executing program


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
