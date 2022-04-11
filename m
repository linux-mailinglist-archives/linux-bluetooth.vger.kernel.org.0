Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 585CA4FC829
	for <lists+linux-bluetooth@lfdr.de>; Tue, 12 Apr 2022 01:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233937AbiDKXjZ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 11 Apr 2022 19:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233751AbiDKXjY (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 11 Apr 2022 19:39:24 -0400
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3589B1EAEB
        for <linux-bluetooth@vger.kernel.org>; Mon, 11 Apr 2022 16:37:08 -0700 (PDT)
Received: by mail-il1-f198.google.com with SMTP id g7-20020a92c7c7000000b002ca31b0b53cso11619216ilk.2
        for <linux-bluetooth@vger.kernel.org>; Mon, 11 Apr 2022 16:37:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=6wm6A4K1sXTgAaXWp98hFA37mMOc4f0Zo2VPNnmg3uI=;
        b=vc+yqq13h/MFS6HjzrjP1udDdatPOqQGOEY5uEIUdBHfVCx6tYNNlU3hI7UIwy2MDv
         uoElAp30yV+RXFb5H4LG8vgCmEvzcrJ4Pz2j/TDKC1kv+6fPKNpXoue0VW7pSKLfcrrK
         lmfiWI6FTRabVxkk3OOZ7XTquGFZpwYf83ubVLnErsR0r+wBds45rtkRo4WL1/+baqeF
         UKZn8qhPUXxbAqR1k7l7X3CG1PW/l5/36EZjyTNPCugm5ek0yIPcN9jCvQQQeG3ZMSgP
         ZqBUtILUNY3K0fii+5ZqC7XwHRhFECT2Csp5YO/zM7Vc8f6L8zOVWK+Xrh7zH5FhXipr
         PbiQ==
X-Gm-Message-State: AOAM531exv10JAbZ1ijjJdKgk1L63GGMAdb6CZ6guncw9RVasSZai+Fo
        qs+VkNwi4Chk5/SNihUPAmcZqfSaQaelSNR0q22jtPgJMVDx
X-Google-Smtp-Source: ABdhPJwHgXWI9kMbXBwCc+BIF1olF6aLcRb1noI9LobRpsQpZ1GFT33gXam3z9lEH1gWcTJRpcYo9LUt0YCVGbJNCiIdUuiVY3kn
MIME-Version: 1.0
X-Received: by 2002:a02:2a0d:0:b0:321:35ab:9fe6 with SMTP id
 w13-20020a022a0d000000b0032135ab9fe6mr16583814jaw.173.1649720227560; Mon, 11
 Apr 2022 16:37:07 -0700 (PDT)
Date:   Mon, 11 Apr 2022 16:37:07 -0700
In-Reply-To: <20220411232710.6167-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000024829a05dc696c50@google.com>
Subject: Re: [syzbot] possible deadlock in sco_conn_del
From:   syzbot <syzbot+b825d87fe2d043e3e652@syzkaller.appspotmail.com>
To:     hdanton@sina.com, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
possible deadlock in sco_conn_del

======================================================
WARNING: possible circular locking dependency detected
5.18.0-rc1-next-20220411-syzkaller-dirty #0 Not tainted
------------------------------------------------------
syz-executor129/4082 is trying to acquire lock:
ffff88807c11d130 (sk_lock-AF_BLUETOOTH-BTPROTO_SCO){+.+.}-{0:0}, at: lock_sock include/net/sock.h:1682 [inline]
ffff88807c11d130 (sk_lock-AF_BLUETOOTH-BTPROTO_SCO){+.+.}-{0:0}, at: sco_conn_del+0x131/0x2c0 net/bluetooth/sco.c:197

but task is already holding lock:
ffffffff8d777e08 (hci_cb_list_lock){+.+.}-{3:3}, at: hci_disconn_cfm include/net/bluetooth/hci_core.h:1580 [inline]
ffffffff8d777e08 (hci_cb_list_lock){+.+.}-{3:3}, at: hci_conn_hash_flush+0xda/0x260 net/bluetooth/hci_conn.c:1458

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (hci_cb_list_lock){+.+.}-{3:3}:
       __mutex_lock_common kernel/locking/mutex.c:603 [inline]
       __mutex_lock+0x12f/0x1350 kernel/locking/mutex.c:747
       hci_connect_cfm+0x26/0x140 include/net/bluetooth/hci_core.h:1565
       le_conn_complete_evt.part.0+0x145e/0x17e0 net/bluetooth/hci_event.c:5666
       le_conn_complete_evt net/bluetooth/hci_event.c:5692 [inline]
       hci_le_conn_complete_evt+0x2fd/0x390 net/bluetooth/hci_event.c:5692
       hci_le_meta_evt+0x2bd/0x520 net/bluetooth/hci_event.c:6559
       hci_event_func net/bluetooth/hci_event.c:6889 [inline]
       hci_event_packet+0x5da/0xf60 net/bluetooth/hci_event.c:6941
       hci_rx_work+0x522/0xd60 net/bluetooth/hci_core.c:3819
       process_one_work+0x996/0x1610 kernel/workqueue.c:2289
       worker_thread+0x665/0x1080 kernel/workqueue.c:2436
       kthread+0x2e9/0x3a0 kernel/kthread.c:376
       ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:298

-> #1 (&hdev->lock){+.+.}-{3:3}:
       __mutex_lock_common kernel/locking/mutex.c:603 [inline]
       __mutex_lock+0x12f/0x1350 kernel/locking/mutex.c:747
       sco_sock_connect+0x1eb/0xa80 net/bluetooth/sco.c:593
       __sys_connect_file+0x14f/0x190 net/socket.c:1900
       __sys_connect+0x161/0x190 net/socket.c:1917
       __do_sys_connect net/socket.c:1927 [inline]
       __se_sys_connect net/socket.c:1924 [inline]
       __x64_sys_connect+0x6f/0xb0 net/socket.c:1924
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x44/0xae

-> #0 (sk_lock-AF_BLUETOOTH-BTPROTO_SCO){+.+.}-{0:0}:
       check_prev_add kernel/locking/lockdep.c:3095 [inline]
       check_prevs_add kernel/locking/lockdep.c:3214 [inline]
       validate_chain kernel/locking/lockdep.c:3829 [inline]
       __lock_acquire+0x2abe/0x5660 kernel/locking/lockdep.c:5053
       lock_acquire kernel/locking/lockdep.c:5665 [inline]
       lock_acquire+0x1ab/0x570 kernel/locking/lockdep.c:5630
       lock_sock_nested+0x36/0xf0 net/core/sock.c:3314
       lock_sock include/net/sock.h:1682 [inline]
       sco_conn_del+0x131/0x2c0 net/bluetooth/sco.c:197
       sco_disconn_cfm+0x71/0xb0 net/bluetooth/sco.c:1379
       hci_disconn_cfm include/net/bluetooth/hci_core.h:1583 [inline]
       hci_conn_hash_flush+0x127/0x260 net/bluetooth/hci_conn.c:1458
       hci_dev_close_sync+0x567/0x1140 net/bluetooth/hci_sync.c:4152
       hci_dev_do_close+0x32/0x70 net/bluetooth/hci_core.c:553
       hci_rfkill_set_block+0x19c/0x1d0 net/bluetooth/hci_core.c:935
       rfkill_set_block+0x1f9/0x540 net/rfkill/core.c:345
       rfkill_fop_write+0x2c3/0x570 net/rfkill/core.c:1286
       vfs_write+0x269/0xac0 fs/read_write.c:589
       ksys_write+0x1e8/0x250 fs/read_write.c:644
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x44/0xae

other info that might help us debug this:

Chain exists of:
  sk_lock-AF_BLUETOOTH-BTPROTO_SCO --> &hdev->lock --> hci_cb_list_lock

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(hci_cb_list_lock);
                               lock(&hdev->lock);
                               lock(hci_cb_list_lock);
  lock(sk_lock-AF_BLUETOOTH-BTPROTO_SCO);

 *** DEADLOCK ***

4 locks held by syz-executor129/4082:
 #0: ffffffff8d9583a8 (rfkill_global_mutex){+.+.}-{3:3}, at: rfkill_fop_write+0x15c/0x570 net/rfkill/core.c:1278
 #1: ffff88801f891048 (&hdev->req_lock){+.+.}-{3:3}, at: hci_dev_do_close+0x2a/0x70 net/bluetooth/hci_core.c:551
 #2: ffff88801f890078 (&hdev->lock){+.+.}-{3:3}, at: hci_dev_close_sync+0x26d/0x1140 net/bluetooth/hci_sync.c:4139
 #3: ffffffff8d777e08 (hci_cb_list_lock){+.+.}-{3:3}, at: hci_disconn_cfm include/net/bluetooth/hci_core.h:1580 [inline]
 #3: ffffffff8d777e08 (hci_cb_list_lock){+.+.}-{3:3}, at: hci_conn_hash_flush+0xda/0x260 net/bluetooth/hci_conn.c:1458

stack backtrace:
CPU: 1 PID: 4082 Comm: syz-executor129 Not tainted 5.18.0-rc1-next-20220411-syzkaller-dirty #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 check_noncircular+0x25f/0x2e0 kernel/locking/lockdep.c:2175
 check_prev_add kernel/locking/lockdep.c:3095 [inline]
 check_prevs_add kernel/locking/lockdep.c:3214 [inline]
 validate_chain kernel/locking/lockdep.c:3829 [inline]
 __lock_acquire+0x2abe/0x5660 kernel/locking/lockdep.c:5053
 lock_acquire kernel/locking/lockdep.c:5665 [inline]
 lock_acquire+0x1ab/0x570 kernel/locking/lockdep.c:5630
 lock_sock_nested+0x36/0xf0 net/core/sock.c:3314
 lock_sock include/net/sock.h:1682 [inline]
 sco_conn_del+0x131/0x2c0 net/bluetooth/sco.c:197
 sco_disconn_cfm+0x71/0xb0 net/bluetooth/sco.c:1379
 hci_disconn_cfm include/net/bluetooth/hci_core.h:1583 [inline]
 hci_conn_hash_flush+0x127/0x260 net/bluetooth/hci_conn.c:1458
 hci_dev_close_sync+0x567/0x1140 net/bluetooth/hci_sync.c:4152
 hci_dev_do_close+0x32/0x70 net/bluetooth/hci_core.c:553
 hci_rfkill_set_block+0x19c/0x1d0 net/bluetooth/hci_core.c:935
 rfkill_set_block+0x1f9/0x540 net/rfkill/core.c:345
 rfkill_fop_write+0x2c3/0x570 net/rfkill/core.c:1286
 vfs_write+0x269/0xac0 fs/read_write.c:589
 ksys_write+0x1e8/0x250 fs/read_write.c:644
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7fab5d4df609
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 d1 15 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fab5cc8e2f8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007fab5d5684c0 RCX: 00007fab5d4df609
RDX: 0000000000000008 RSI: 0000000020000080 RDI: 0000000000000003
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffeea3e1ffe
R13: 00007ffeea3e1fff R14: 00007fab5d5684c8 R15: 0000000000022000
 </TASK>


Tested on:

commit:         d12d7e1c Add linux-next specific files for 20220411
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/
console output: https://syzkaller.appspot.com/x/log.txt?x=14908904f00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=58fcaf7d8df169a6
dashboard link: https://syzkaller.appspot.com/bug?extid=b825d87fe2d043e3e652
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16223d2f700000

