Return-Path: <linux-bluetooth+bounces-3826-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD9B8AC473
	for <lists+linux-bluetooth@lfdr.de>; Mon, 22 Apr 2024 08:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E51D3282942
	for <lists+linux-bluetooth@lfdr.de>; Mon, 22 Apr 2024 06:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8D1A482CA;
	Mon, 22 Apr 2024 06:47:31 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31BB3FB3B
	for <linux-bluetooth@vger.kernel.org>; Mon, 22 Apr 2024 06:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713768451; cv=none; b=COipjXJ8fT6eK9JQrixHA3nsC/FNJNrHPO4iTaesJiUYb8X947JiZ5I1nb3t+HKcWPtfaZ2jSNuANW9loZ5BlAmzG1ROHJp95EMuBmDFqWRmt4jbCminiCVuzDp40bLqIgVlJe0R/1Csyr9Mv4F+RUqZYbgAIqlhpAwl18c1I1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713768451; c=relaxed/simple;
	bh=R/M5tKZUECu3z1c/Q+acpUIowhc4QjR65vJX14nNCKc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ddzno8WgDpDtgodiBuVJRBKUM3wxlpTS6xn+8M5GIUFi86PZUogmd3HpWtJRss0EwLxHT2116s1h48Pb08CgdWogffOln6jSf4JEytAi4Jg0KuttFmhEPkE0lt+pR/RdZ+lCNhmVrpFpMEr/BCHSlm0X3OfkjGDn+oFSFTavLKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7da4263700dso447474239f.3
        for <linux-bluetooth@vger.kernel.org>; Sun, 21 Apr 2024 23:47:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713768449; x=1714373249;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7rRTS6jUsZpgk/OuWhVL8HDWhPFYGclDxI4bVp/C/hM=;
        b=rDfX3tCNWVVopK6SFjMtQRVPuer1JX8f0FA8UcWm3LR9L7pDPk2JIOpEDIBQHDp7Vo
         vN7cNj6h44SKh01uOQ2KblVXaKKIEjPY+pZo0RpPDmCVZ8swAAvTiI+oix0ArZsH2Fqf
         kKncoFdju5LiKjgm7ZqxexSxcEgsCVJNgr2JEO8VtWwp4pdhJ23OiV9YvidAEZe2Y1us
         svg+oL84nBmAdrvqUCbaOQI49MR9GylZNPV/AsZm9f/yvzNDx9AOY7lB+h06CejYHlk9
         k3SoBVM6xcwV20UIslDI/AEMkzPmUaN2b3GtSYjHu6eVvOQXkeUI1kxrh2R79CZEK27Y
         pgjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjfRqHtjWYt+AX4tK4YF9XjAtCtp60F9TeGHjKmOLcQKchvqNjQ9TxxI7UsRbGM8tosQ2nd0CpkU7+6oL2k+4FWNi7Vspg7cNhRhfzxlXV
X-Gm-Message-State: AOJu0YwipMNZJ4gcG7ZeY7qQQjSyMnKcGRBqBYQzhOpDwU6hKP2UL/nY
	K6kiBAleAEO7u81UsuGTR5U2BnVMF5VgaOcymSlA420H6/uJtdvvaNKkFc6IRSw9XtSaNe2ci/s
	xmhCFR9p8pGZ54ODZ56JyynrJkFO1wIZuRXA3FzIPqi30krcKJlKUlAw=
X-Google-Smtp-Source: AGHT+IGndYAYwRM6L5hLm8HkvnpV9ZC/z2JIMvDvVuhMHWqSaRkQ08s3D60fTW20u63CVgd7y81DhcAU2SxMOIHv9dbXZB/LLdqL
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:841a:b0:485:7a8:42a6 with SMTP id
 iq26-20020a056638841a00b0048507a842a6mr487187jab.0.1713768448941; Sun, 21 Apr
 2024 23:47:28 -0700 (PDT)
Date: Sun, 21 Apr 2024 23:47:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a0703c0616a9cf58@google.com>
Subject: [syzbot] [bluetooth?] KASAN: slab-use-after-free Read in skb_release_head_state
From: syzbot <syzbot+d863bc2d28ef7ff42984@syzkaller.appspotmail.com>
To: johan.hedberg@gmail.com, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, luiz.dentz@gmail.com, marcel@holtmann.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    fe46a7dd189e Merge tag 'sound-6.9-rc1' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14dce3f3180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4d90a36f0cab495a
dashboard link: https://syzkaller.appspot.com/bug?extid=d863bc2d28ef7ff42984
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f6c04726a2ae/disk-fe46a7dd.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/09c26ce901ea/vmlinux-fe46a7dd.xz
kernel image: https://storage.googleapis.com/syzbot-assets/134acf7f5322/bzImage-fe46a7dd.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d863bc2d28ef7ff42984@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in skb_dst_drop include/net/dst.h:274 [inline]
BUG: KASAN: slab-use-after-free in skb_release_head_state+0x39/0x250 net/core/skbuff.c:1185
Read of size 8 at addr ffff88801e90fa58 by task syz-executor.0/19245

CPU: 1 PID: 19245 Comm: syz-executor.0 Not tainted 6.8.0-syzkaller-08951-gfe46a7dd189e #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/27/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:114
 print_address_description mm/kasan/report.c:377 [inline]
 print_report+0x169/0x550 mm/kasan/report.c:488
 kasan_report+0x143/0x180 mm/kasan/report.c:601
 skb_dst_drop include/net/dst.h:274 [inline]
 skb_release_head_state+0x39/0x250 net/core/skbuff.c:1185
 skb_release_all net/core/skbuff.c:1200 [inline]
 __kfree_skb net/core/skbuff.c:1216 [inline]
 kfree_skb_reason+0x15d/0x390 net/core/skbuff.c:1252
 kfree_skb include/linux/skbuff.h:1267 [inline]
 __hci_req_sync+0x62f/0x950 net/bluetooth/hci_request.c:182
 hci_req_sync+0xa9/0xd0 net/bluetooth/hci_request.c:204
 hci_inquiry+0x44b/0x870 net/bluetooth/hci_core.c:425
 sock_do_ioctl+0x158/0x460 net/socket.c:1222
 sock_ioctl+0x629/0x8e0 net/socket.c:1341
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:904 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:890
 do_syscall_64+0xfb/0x240
 entry_SYSCALL_64_after_hwframe+0x6d/0x75
RIP: 0033:0x7f8668c7de69
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 e1 20 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f8669aaf0c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f8668dabf80 RCX: 00007f8668c7de69
RDX: 0000000020001c80 RSI: 00000000800448f0 RDI: 0000000000000009
RBP: 00007f8668cca47a R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 000000000000000b R14: 00007f8668dabf80 R15: 00007ffd40ae2748
 </TASK>

Allocated by task 4457:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
 unpoison_slab_object mm/kasan/common.c:312 [inline]
 __kasan_slab_alloc+0x66/0x80 mm/kasan/common.c:338
 kasan_slab_alloc include/linux/kasan.h:201 [inline]
 slab_post_alloc_hook mm/slub.c:3798 [inline]
 slab_alloc_node mm/slub.c:3845 [inline]
 kmem_cache_alloc+0x174/0x340 mm/slub.c:3852
 skb_clone+0x20c/0x390 net/core/skbuff.c:2063
 hci_send_cmd_sync net/bluetooth/hci_core.c:4220 [inline]
 hci_cmd_work+0x29c/0x660 net/bluetooth/hci_core.c:4240
 process_one_work kernel/workqueue.c:3254 [inline]
 process_scheduled_works+0xa00/0x1770 kernel/workqueue.c:3335
 worker_thread+0x86d/0xd70 kernel/workqueue.c:3416
 kthread+0x2f0/0x390 kernel/kthread.c:388
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:243

Freed by task 4457:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:579
 poison_slab_object+0xa6/0xe0 mm/kasan/common.c:240
 __kasan_slab_free+0x37/0x60 mm/kasan/common.c:256
 kasan_slab_free include/linux/kasan.h:184 [inline]
 slab_free_hook mm/slub.c:2106 [inline]
 slab_free mm/slub.c:4280 [inline]
 kmem_cache_free+0x102/0x2b0 mm/slub.c:4344
 kfree_skb include/linux/skbuff.h:1267 [inline]
 hci_send_cmd_sync net/bluetooth/hci_core.c:4219 [inline]
 hci_cmd_work+0x271/0x660 net/bluetooth/hci_core.c:4240
 process_one_work kernel/workqueue.c:3254 [inline]
 process_scheduled_works+0xa00/0x1770 kernel/workqueue.c:3335
 worker_thread+0x86d/0xd70 kernel/workqueue.c:3416
 kthread+0x2f0/0x390 kernel/kthread.c:388
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:243

The buggy address belongs to the object at ffff88801e90fa00
 which belongs to the cache skbuff_head_cache of size 240
The buggy address is located 88 bytes inside of
 freed 240-byte region [ffff88801e90fa00, ffff88801e90faf0)

The buggy address belongs to the physical page:
page:ffffea00007a43c0 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1e90f
ksm flags: 0xfff00000000800(slab|node=0|zone=1|lastcpupid=0x7ff)
page_type: 0xffffffff()
raw: 00fff00000000800 ffff88801968f780 ffffea0001bd7680 dead000000000003
raw: 0000000000000000 00000000000c000c 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x112820(GFP_ATOMIC|__GFP_NOWARN|__GFP_NORETRY|__GFP_HARDWALL), pid 5060, tgid 5059 (syz-fuzzer), ts 415373569576, free_ts 415310225812
 set_page_owner include/linux/page_owner.h:31 [inline]
 post_alloc_hook+0x1ea/0x210 mm/page_alloc.c:1533
 prep_new_page mm/page_alloc.c:1540 [inline]
 get_page_from_freelist+0x33ea/0x3580 mm/page_alloc.c:3311
 __alloc_pages+0x256/0x680 mm/page_alloc.c:4569
 __alloc_pages_node include/linux/gfp.h:238 [inline]
 alloc_pages_node include/linux/gfp.h:261 [inline]
 alloc_slab_page+0x5f/0x160 mm/slub.c:2175
 allocate_slab mm/slub.c:2338 [inline]
 new_slab+0x84/0x2f0 mm/slub.c:2391
 ___slab_alloc+0xc73/0x1260 mm/slub.c:3525
 __kmem_cache_alloc_bulk mm/slub.c:4555 [inline]
 kmem_cache_alloc_bulk+0x22e/0x790 mm/slub.c:4629
 napi_skb_cache_get+0x166/0x230 net/core/skbuff.c:348
 __napi_build_skb net/core/skbuff.c:527 [inline]
 __napi_alloc_skb+0x217/0x540 net/core/skbuff.c:846
 napi_alloc_skb include/linux/skbuff.h:3363 [inline]
 page_to_skb+0x275/0x9b0 drivers/net/virtio_net.c:569
 receive_mergeable drivers/net/virtio_net.c:1683 [inline]
 receive_buf+0x3b3/0x3890 drivers/net/virtio_net.c:1804
 virtnet_receive drivers/net/virtio_net.c:2110 [inline]
 virtnet_poll+0x720/0x18f0 drivers/net/virtio_net.c:2203
 __napi_poll+0xcb/0x490 net/core/dev.c:6632
 napi_poll net/core/dev.c:6701 [inline]
 net_rx_action+0x7bb/0x1090 net/core/dev.c:6813
 __do_softirq+0x2bc/0x943 kernel/softirq.c:554
page last free pid 12584 tgid 12583 stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1140 [inline]
 free_unref_page_prepare+0x95d/0xa80 mm/page_alloc.c:2346
 free_unref_page_list+0x5a3/0x850 mm/page_alloc.c:2532
 release_pages+0x2117/0x2400 mm/swap.c:1042
 tlb_batch_pages_flush mm/mmu_gather.c:98 [inline]
 tlb_flush_mmu_free mm/mmu_gather.c:293 [inline]
 tlb_flush_mmu+0x34d/0x4e0 mm/mmu_gather.c:300
 tlb_finish_mmu+0xd4/0x200 mm/mmu_gather.c:392
 exit_mmap+0x4b6/0xd40 mm/mmap.c:3300
 __mmput+0x115/0x3c0 kernel/fork.c:1345
 exit_mm+0x220/0x310 kernel/exit.c:569
 do_exit+0x99e/0x27e0 kernel/exit.c:865
 do_group_exit+0x207/0x2c0 kernel/exit.c:1027
 get_signal+0x176e/0x1850 kernel/signal.c:2907
 arch_do_signal_or_restart+0x96/0x860 arch/x86/kernel/signal.c:310
 exit_to_user_mode_loop kernel/entry/common.c:105 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:328 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:201 [inline]
 syscall_exit_to_user_mode+0xc9/0x360 kernel/entry/common.c:212
 do_syscall_64+0x10a/0x240 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x6d/0x75

Memory state around the buggy address:
 ffff88801e90f900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88801e90f980: fb fb fb fb fb fb fc fc fc fc fc fc fc fc fc fc
>ffff88801e90fa00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                    ^
 ffff88801e90fa80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fc fc
 ffff88801e90fb00: fc fc fc fc fc fc fc fc fa fb fb fb fb fb fb fb
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

