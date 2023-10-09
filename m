Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14FE47BD9EB
	for <lists+linux-bluetooth@lfdr.de>; Mon,  9 Oct 2023 13:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346270AbjJILco (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 9 Oct 2023 07:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234521AbjJILcn (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 9 Oct 2023 07:32:43 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4417FAB;
        Mon,  9 Oct 2023 04:32:40 -0700 (PDT)
Received: from dggpeml500026.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4S3xcV6WgTzNpC0;
        Mon,  9 Oct 2023 19:28:42 +0800 (CST)
Received: from [10.174.178.66] (10.174.178.66) by
 dggpeml500026.china.huawei.com (7.185.36.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 9 Oct 2023 19:32:37 +0800
Message-ID: <1a3c2bf5-1984-be4e-79d3-edbe702d5a14@huawei.com>
Date:   Mon, 9 Oct 2023 19:32:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [syzbot] [bluetooth?] KASAN: slab-out-of-bounds Read in
 create_monitor_event
To:     syzbot <syzbot+c90849c50ed209d77689@syzkaller.appspotmail.com>,
        <davem@davemloft.net>, <edumazet@google.com>,
        <johan.hedberg@gmail.com>, <kuba@kernel.org>,
        <linux-bluetooth@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <luiz.dentz@gmail.com>, <luiz.von.dentz@intel.com>,
        <marcel@holtmann.org>, <netdev@vger.kernel.org>,
        <pabeni@redhat.com>, <syzkaller-bugs@googlegroups.com>
References: <000000000000ae9ff70607461186@google.com>
From:   shaozhengchao <shaozhengchao@huawei.com>
In-Reply-To: <000000000000ae9ff70607461186@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.66]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500026.china.huawei.com (7.185.36.106)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SORTED_RECIPS,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org



On 2023/10/9 18:29, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    f291209eca5e Merge tag 'net-6.6-rc5' of git://git.kernel.o..
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=11011862680000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=7a5682d32a74b423
> dashboard link: https://syzkaller.appspot.com/bug?extid=c90849c50ed209d77689
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14d8746e680000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1388dbae680000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/c35c46fb9748/disk-f291209e.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/f0cdf2349ddb/vmlinux-f291209e.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/2f4c7b7ed7c4/bzImage-f291209e.xz
> 
> The issue was bisected to:
> 
> commit dcda165706b9fbfd685898d46a6749d7d397e0c0
> Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> Date:   Fri Sep 15 21:42:27 2023 +0000
> 
>      Bluetooth: hci_core: Fix build warnings
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1279df95680000
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=1179df95680000
> console output: https://syzkaller.appspot.com/x/log.txt?x=1679df95680000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+c90849c50ed209d77689@syzkaller.appspotmail.com
> Fixes: dcda165706b9 ("Bluetooth: hci_core: Fix build warnings")
> 
> ==================================================================
> BUG: KASAN: slab-out-of-bounds in create_monitor_event+0x88d/0x930 net/bluetooth/hci_sock.c:491
> Read of size 8 at addr ffff88801e5458c7 by task syz-executor191/5038
> 
> CPU: 0 PID: 5038 Comm: syz-executor191 Not tainted 6.6.0-rc4-syzkaller-00158-gf291209eca5e #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/06/2023
> Call Trace:
>   <TASK>
>   __dump_stack lib/dump_stack.c:88 [inline]
>   dump_stack_lvl+0x1e7/0x2d0 lib/dump_stack.c:106
>   print_address_description mm/kasan/report.c:364 [inline]
>   print_report+0x163/0x540 mm/kasan/report.c:475
>   kasan_report+0x175/0x1b0 mm/kasan/report.c:588
>   create_monitor_event+0x88d/0x930 net/bluetooth/hci_sock.c:491
>   send_monitor_replay+0x7a/0x5d0 net/bluetooth/hci_sock.c:723
>   hci_sock_bind+0x85c/0x1140 net/bluetooth/hci_sock.c:1387
>   __sys_bind+0x23a/0x2e0 net/socket.c:1849
>   __do_sys_bind net/socket.c:1860 [inline]
>   __se_sys_bind net/socket.c:1858 [inline]
>   __x64_sys_bind+0x7a/0x90 net/socket.c:1858
>   do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>   do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
>   entry_SYSCALL_64_after_hwframe+0x63/0xcd
> RIP: 0033:0x7fa90faa64f9
> Code: 48 83 c4 28 c3 e8 17 19 00 00 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007ffc6a6f17b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000031
> RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 00007fa90faa64f9
> RDX: 0000000000000006 RSI: 0000000020000000 RDI: 0000000000000004
> RBP: 0000000000000003 R08: 000000ff00ffb650 R09: 000000ff00ffb650
> R10: 0000000000000000 R11: 0000000000000246 R12: 000055555604a370
> R13: 0000000000000072 R14: 00007fa90fb2a5b0 R15: 0000000000000001
>   </TASK>
> 
> Allocated by task 5038:
>   kasan_save_stack mm/kasan/common.c:45 [inline]
>   kasan_set_track+0x4f/0x70 mm/kasan/common.c:52
>   ____kasan_kmalloc mm/kasan/common.c:374 [inline]
>   __kasan_kmalloc+0x98/0xb0 mm/kasan/common.c:383
>   kasan_kmalloc include/linux/kasan.h:198 [inline]
>   __do_kmalloc_node mm/slab_common.c:1023 [inline]
>   __kmalloc_node_track_caller+0xb6/0x230 mm/slab_common.c:1043
>   kvasprintf+0xdf/0x190 lib/kasprintf.c:25
>   kobject_set_name_vargs+0x61/0x120 lib/kobject.c:272
>   dev_set_name+0xd5/0x120 drivers/base/core.c:3427
>   hci_register_dev+0x153/0xa40 net/bluetooth/hci_core.c:2620
>   __vhci_create_device drivers/bluetooth/hci_vhci.c:434 [inline]
>   vhci_create_device+0x3ba/0x720 drivers/bluetooth/hci_vhci.c:475
>   vhci_get_user drivers/bluetooth/hci_vhci.c:532 [inline]
>   vhci_write+0x3c7/0x480 drivers/bluetooth/hci_vhci.c:612
>   call_write_iter include/linux/fs.h:1956 [inline]
>   new_sync_write fs/read_write.c:491 [inline]
>   vfs_write+0x782/0xaf0 fs/read_write.c:584
>   ksys_write+0x1a0/0x2c0 fs/read_write.c:637
>   do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>   do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
>   entry_SYSCALL_64_after_hwframe+0x63/0xcd
> 
> The buggy address belongs to the object at ffff88801e5458c0
>   which belongs to the cache kmalloc-8 of size 8
> The buggy address is located 2 bytes to the right of
>   allocated 5-byte region [ffff88801e5458c0, ffff88801e5458c5)
> 
> The buggy address belongs to the physical page:
> page:ffffea0000795140 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1e545
> flags: 0xfff00000000800(slab|node=0|zone=1|lastcpupid=0x7ff)
> page_type: 0xffffffff()
> raw: 00fff00000000800 ffff888012841280 ffffea00004db540 dead000000000002
> raw: 0000000000000000 0000000000660066 00000001ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
> page_owner tracks the page as allocated
> page last allocated via order 0, migratetype Unmovable, gfp_mask 0x12c40(GFP_NOFS|__GFP_NOWARN|__GFP_NORETRY), pid 25, tgid 25 (kdevtmpfs), ts 9275165846, free_ts 9274763750
>   set_page_owner include/linux/page_owner.h:31 [inline]
>   post_alloc_hook+0x1e6/0x210 mm/page_alloc.c:1536
>   prep_new_page mm/page_alloc.c:1543 [inline]
>   get_page_from_freelist+0x31db/0x3360 mm/page_alloc.c:3170
>   __alloc_pages+0x255/0x670 mm/page_alloc.c:4426
>   alloc_slab_page+0x6a/0x160 mm/slub.c:1870
>   allocate_slab mm/slub.c:2017 [inline]
>   new_slab+0x84/0x2f0 mm/slub.c:2070
>   ___slab_alloc+0xc85/0x1310 mm/slub.c:3223
>   __slab_alloc mm/slub.c:3322 [inline]
>   __slab_alloc_node mm/slub.c:3375 [inline]
>   slab_alloc_node mm/slub.c:3468 [inline]
>   __kmem_cache_alloc_node+0x1af/0x270 mm/slub.c:3517
>   __do_kmalloc_node mm/slab_common.c:1022 [inline]
>   __kmalloc_node_track_caller+0xa5/0x230 mm/slab_common.c:1043
>   kstrdup+0x3a/0x70 mm/util.c:62
>   smack_inode_init_security+0x5ed/0x740 security/smack/smack_lsm.c:1046
>   security_inode_init_security+0x1a1/0x470 security/security.c:1648
>   shmem_mknod+0xc6/0x1d0 mm/shmem.c:3221
>   vfs_mknod+0x308/0x350 fs/namei.c:3998
>   handle_create drivers/base/devtmpfs.c:219 [inline]
>   handle drivers/base/devtmpfs.c:384 [inline]
>   devtmpfs_work_loop+0x95c/0x1030 drivers/base/devtmpfs.c:399
>   devtmpfsd+0x48/0x50 drivers/base/devtmpfs.c:441
>   kthread+0x2d3/0x370 kernel/kthread.c:388
> page last free stack trace:
>   reset_page_owner include/linux/page_owner.h:24 [inline]
>   free_pages_prepare mm/page_alloc.c:1136 [inline]
>   free_unref_page_prepare+0x8c3/0x9f0 mm/page_alloc.c:2312
>   free_unref_page+0x37/0x3f0 mm/page_alloc.c:2405
>   mm_free_pgd kernel/fork.c:803 [inline]
>   __mmdrop+0xb8/0x3d0 kernel/fork.c:919
>   free_bprm+0x144/0x330 fs/exec.c:1492
>   kernel_execve+0x8f5/0xa10 fs/exec.c:2026
>   call_usermodehelper_exec_async+0x233/0x370 kernel/umh.c:110
>   ret_from_fork+0x48/0x80 arch/x86/kernel/process.c:147
>   ret_from_fork_asm+0x11/0x20 arch/x86/entry/entry_64.S:304
> 
> Memory state around the buggy address:
>   ffff88801e545780: 05 fc fc fc fc 05 fc fc fc fc 05 fc fc fc fc 05
>   ffff88801e545800: fc fc fc fc 05 fc fc fc fc 00 fc fc fc fc 00 fc
>> ffff88801e545880: fc fc fc 00 fc fc fc fc 05 fc fc fc fc 00 fc fc
>                                             ^
>   ffff88801e545900: fc fc 00 fc fc fc fc 00 fc fc fc fc 05 fc fc fc
>   ffff88801e545980: fc 05 fc fc fc fc fa fc fc fc fc 00 fc fc fc fc
> ==================================================================
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> 
> If the bug is already fixed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
> 
> If you want to overwrite bug's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the bug is a duplicate of another bug, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup
> 
>
The size of the member name in struct hci_mon_new_index is fixed at 8
bytes. The size of the member name in struct hci_dev is not fixed. When 
the size of the member name in struct hci_dev is less than 8 bytes,
out-of-bounds read will occur.

It seems that the member name in struct hci_mon_new_index is no longer
used and can be removed directly.

Zhengchao Shao
