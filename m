Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5DFD32D3E6
	for <lists+linux-bluetooth@lfdr.de>; Thu,  4 Mar 2021 14:10:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241145AbhCDNJj (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 4 Mar 2021 08:09:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:43478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241138AbhCDNJT (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 4 Mar 2021 08:09:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A3BE60200;
        Thu,  4 Mar 2021 13:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614863318;
        bh=2QR5McJgn4rfMKUP2x+w+ee1woXk/Fx6uAArQBOUhZk=;
        h=Date:From:To:cc:Subject:From;
        b=KXr20cgjKyUOLfbRMXjPhr3ZbvtClRo2LROxYyA69BgHWZgiSTBe4yeibbupe5u8n
         3k9e6iKZlMYYk6+5SV741lDisVHEmRD2TZbj4pcZwkAe5wTVfiWZ+Cp+G3jLz/RvkY
         Uix2yjpgKW0x1yGC1s9/CvkPDr1p3Q1//Ycn1rl5mkSRRshQe7JSN1lvvilR9qlPDU
         Ybxh2SSD/kd2rZSiArP3/zV5s9VomvD5LbTOrCRSB3K8GRznrVxFVddmSP3aFoyNaj
         61iCgtEudFdm7wP4LqsusR4rMlHvYGcGZ9tPdM6fbbuy0i+4GFfzZb4ms3h6gVEjOK
         /Bq5TBP/K7COQ==
Date:   Thu, 4 Mar 2021 14:08:34 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
cc:     linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Lockdep report for hci_conn_get_phy()
Message-ID: <nycvar.YFH.7.76.2103041405420.12405@cbobk.fhfr.pm>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi,

I am getting the lockdep splat below with current Linus' tree (5.12-rc1). 
I haven't yet analyzed the dependency chain and the code, but sending out 
early in case someone has seen this before and analyzed / fixed it 
already.

Thanks.

 ======================================================
 WARNING: possible circular locking dependency detected
 5.12.0-rc1-00026-g73d464503354 #10 Not tainted
 ------------------------------------------------------
 bluetoothd/1118 is trying to acquire lock:
 ffff8f078383c078 (&hdev->lock){+.+.}-{3:3}, at: hci_conn_get_phy+0x1c/0x150 [bluetooth]
 
 but task is already holding lock:
 ffff8f07e831d920 (sk_lock-AF_BLUETOOTH-BTPROTO_L2CAP){+.+.}-{0:0}, at: l2cap_sock_getsockopt+0x8b/0x610 

 
 which lock already depends on the new lock.

 
 the existing dependency chain (in reverse order) is:
 
 -> #3 (sk_lock-AF_BLUETOOTH-BTPROTO_L2CAP){+.+.}-{0:0}:
        lock_sock_nested+0x72/0xa0
        l2cap_sock_ready_cb+0x18/0x70 [bluetooth]
        l2cap_config_rsp+0x27a/0x520 [bluetooth]
        l2cap_sig_channel+0x658/0x1330 [bluetooth]
        l2cap_recv_frame+0x1ba/0x310 [bluetooth]
        hci_rx_work+0x1cc/0x640 [bluetooth]
        process_one_work+0x244/0x5f0
        worker_thread+0x3c/0x380
        kthread+0x13e/0x160
        ret_from_fork+0x22/0x30
 
 -> #2 (&chan->lock#2/1){+.+.}-{3:3}:
        __mutex_lock+0xa3/0xa10
        l2cap_chan_connect+0x33a/0x940 [bluetooth]
        l2cap_sock_connect+0x141/0x2a0 [bluetooth]
        __sys_connect+0x9b/0xc0
        __x64_sys_connect+0x16/0x20
        do_syscall_64+0x33/0x80
        entry_SYSCALL_64_after_hwframe+0x44/0xae
 
 -> #1 (&conn->chan_lock){+.+.}-{3:3}:
        __mutex_lock+0xa3/0xa10
        l2cap_chan_connect+0x322/0x940 [bluetooth]
        l2cap_sock_connect+0x141/0x2a0 [bluetooth]
        __sys_connect+0x9b/0xc0
        __x64_sys_connect+0x16/0x20
        do_syscall_64+0x33/0x80
        entry_SYSCALL_64_after_hwframe+0x44/0xae
 
 -> #0 (&hdev->lock){+.+.}-{3:3}:
        __lock_acquire+0x147a/0x1a50
        lock_acquire+0x277/0x3d0
        __mutex_lock+0xa3/0xa10
        hci_conn_get_phy+0x1c/0x150 [bluetooth]
        l2cap_sock_getsockopt+0x5a9/0x610 [bluetooth]
        __sys_getsockopt+0xcc/0x200
        __x64_sys_getsockopt+0x20/0x30
        do_syscall_64+0x33/0x80
        entry_SYSCALL_64_after_hwframe+0x44/0xae
 
 other info that might help us debug this:

 Chain exists of:
   &hdev->lock --> &chan->lock#2/1 --> sk_lock-AF_BLUETOOTH-BTPROTO_L2CAP
  Possible unsafe locking scenario:

        CPU0                    CPU1
        ----                    ----
   lock(sk_lock-AF_BLUETOOTH-BTPROTO_L2CAP);
                                lock(&chan->lock#2/1);
                                lock(sk_lock-AF_BLUETOOTH-BTPROTO_L2CAP);
   lock(&hdev->lock);
 
  *** DEADLOCK ***

 1 lock held by bluetoothd/1118:
  #0: ffff8f07e831d920 (sk_lock-AF_BLUETOOTH-BTPROTO_L2CAP){+.+.}-{0:0}, at: l2cap_sock_getsockopt+0x8b/0x610 [bluetooth]
 
 stack backtrace:
 CPU: 3 PID: 1118 Comm: bluetoothd Not tainted 5.12.0-rc1-00026-g73d464503354 #10
 Hardware name: LENOVO 20K5S22R00/20K5S22R00, BIOS R0IET38W (1.16 ) 05/31/2017
 Call Trace:
  dump_stack+0x7f/0xa1
  check_noncircular+0x105/0x120
  ? __lock_acquire+0x147a/0x1a50
  __lock_acquire+0x147a/0x1a50
  lock_acquire+0x277/0x3d0
  ? hci_conn_get_phy+0x1c/0x150 [bluetooth]
  ? __lock_acquire+0x2e1/0x1a50
  ? lock_is_held_type+0xb4/0x120
  ? hci_conn_get_phy+0x1c/0x150 [bluetooth]
  __mutex_lock+0xa3/0xa10
  ? hci_conn_get_phy+0x1c/0x150 [bluetooth]
  ? lock_acquire+0x277/0x3d0
  ? mark_held_locks+0x49/0x70
  ? mark_held_locks+0x49/0x70
  ? hci_conn_get_phy+0x1c/0x150 [bluetooth]
  hci_conn_get_phy+0x1c/0x150 [bluetooth]
  l2cap_sock_getsockopt+0x5a9/0x610 [bluetooth]
  __sys_getsockopt+0xcc/0x200
  __x64_sys_getsockopt+0x20/0x30
  do_syscall_64+0x33/0x80
  entry_SYSCALL_64_after_hwframe+0x44/0xae
 RIP: 0033:0x7fb73df33eee
 Code: 48 8b 0d 85 0f 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 37 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 52 0f 0c 00 f7 d8 64 89 01 48
 RSP: 002b:00007fffcfbbbf08 EFLAGS: 00000203 ORIG_RAX: 0000000000000037
 RAX: ffffffffffffffda RBX: 0000000000000019 RCX: 00007fb73df33eee
 RDX: 000000000000000e RSI: 0000000000000112 RDI: 0000000000000018
 RBP: 0000000000000000 R08: 00007fffcfbbbf44 R09: 0000000000000000
 R10: 00007fffcfbbbf3c R11: 0000000000000203 R12: 0000000000000000
 R13: 0000000000000018 R14: 0000000000000000 R15: 0000556fcefc70d0


-- 
Jiri Kosina
SUSE Labs

