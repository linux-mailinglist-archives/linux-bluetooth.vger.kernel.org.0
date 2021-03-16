Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D65B433D57E
	for <lists+linux-bluetooth@lfdr.de>; Tue, 16 Mar 2021 15:08:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233240AbhCPOIO (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 16 Mar 2021 10:08:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:35382 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233676AbhCPOIE (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 16 Mar 2021 10:08:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA8416506D;
        Tue, 16 Mar 2021 14:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615903683;
        bh=zWZ73iwOO+BZ7pRVAq8eN3B2WuTodByP0vs5W1kQo/U=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=NmIQKjhs+jpFBz3QKar9IUp+qZCjIbFRxRusqQ3RhsuuIVuhW5aHWCKyAIanO/M7K
         RG7NOq1UGNQl/qzv4iEcpEQNlcF2+nLidnfeOaHYsEv6/6gLi0YdAjmpC5jXpAdyRO
         /3u/t/BmrnqxwcUBKz42wwNfcTRDbwqfWJXCrueqIDsuewRlg79WR2AyWz5m/+ygOX
         zgcXAQIjj4KotGHQ331ahiCzh8C4Gs+6tCQVfdO4U3zmMIuPXhfMeReedWh/OXrych
         NaDyPVVXWKH2WoVkObrjrleCeAUbIrPNLJkfVFUkl0ALi9E474JiVyjBo63n0d+q0t
         sHfEDU7xY6khQ==
Date:   Tue, 16 Mar 2021 15:08:00 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
cc:     linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Bluetooth: avoid deadlock between hci_dev->lock and socket
 lock
In-Reply-To: <nycvar.YFH.7.76.2103161125530.12405@cbobk.fhfr.pm>
Message-ID: <nycvar.YFH.7.76.2103161507280.12405@cbobk.fhfr.pm>
References: <nycvar.YFH.7.76.2103041405420.12405@cbobk.fhfr.pm> <nycvar.YFH.7.76.2103161125530.12405@cbobk.fhfr.pm>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Jiri Kosina <jkosina@suse.cz>

Commit eab2404ba798 ("Bluetooth: Add BT_PHY socket option") added a 
dependency between socket lock and hci_dev->lock that could lead to 
deadlock.

It turns out that hci_conn_get_phy() is not in any way relying on hdev 
being immutable during the runtime of this function, neither does it even 
look at any of the members of hdev, and as such there is no need to hold 
that lock.

This fixes the lockdep splat below:

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

Fixes: eab2404ba798 ("Bluetooth: Add BT_PHY socket option")
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
---
 net/bluetooth/hci_conn.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
index 6ffa89e3ba0a..f72646690539 100644
--- a/net/bluetooth/hci_conn.c
+++ b/net/bluetooth/hci_conn.c
@@ -1830,8 +1830,6 @@ u32 hci_conn_get_phy(struct hci_conn *conn)
 {
 	u32 phys = 0;
 
-	hci_dev_lock(conn->hdev);
-
 	/* BLUETOOTH CORE SPECIFICATION Version 5.2 | Vol 2, Part B page 471:
 	 * Table 6.2: Packets defined for synchronous, asynchronous, and
 	 * CSB logical transport types.
@@ -1928,7 +1926,5 @@ u32 hci_conn_get_phy(struct hci_conn *conn)
 		break;
 	}
 
-	hci_dev_unlock(conn->hdev);
-
 	return phys;
 }

-- 
Jiri Kosina
SUSE Labs

