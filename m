Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B6A675E93E
	for <lists+linux-bluetooth@lfdr.de>; Mon, 24 Jul 2023 03:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232829AbjGXBtk (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 23 Jul 2023 21:49:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233247AbjGXBsy (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 23 Jul 2023 21:48:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2ABA449C;
        Sun, 23 Jul 2023 18:41:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 54DB060FB0;
        Mon, 24 Jul 2023 01:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D602C433C7;
        Mon, 24 Jul 2023 01:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690162527;
        bh=HmzOirBpGAbBxSbqXfZmXLdZlHH/heyAjDXjNtDxvoY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=d0/mdwCop1rFPZy6BkbDbugQi1DkRb6ktmxHQKjDdxC+F3kI0oMvymfmwXmEoGHni
         2J3R7PB7HpgfOXP9EHYLLkqn72Q2wTgyKDhqo25+sqPOj2DGi/edYj4X2jKShwI5cc
         Wij4ykm8D+k7e4BQqq3hAiGDZ+iKloyF0XsC3vk3hsmy3zuzpy5g9skD8TW2w0EaAY
         XiDYih72NAO34OqJnGvWS7j+2c9YLbx40LA6IW7zQnxkNQqoDmHxPSFXJMwl06eA4z
         vEBAGKozzZQM+SXR4BdPJPiT8Us5iAI/nIiMWa1LSk6Bp/DcSyCHgUxlq+maht6zVS
         Oj5oAauHTDzVg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Sungwoo Kim <iam@sung-woo.kim>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Sasha Levin <sashal@kernel.org>, marcel@holtmann.org,
        gustavo@padovan.org, johan.hedberg@gmail.com, davem@davemloft.net,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 8/9] Bluetooth: L2CAP: Fix use-after-free in l2cap_sock_ready_cb
Date:   Sun, 23 Jul 2023 21:34:44 -0400
Message-Id: <20230724013445.2334326-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724013445.2334326-1-sashal@kernel.org>
References: <20230724013445.2334326-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.288
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Sungwoo Kim <iam@sung-woo.kim>

[ Upstream commit 1728137b33c00d5a2b5110ed7aafb42e7c32e4a1 ]

l2cap_sock_release(sk) frees sk. However, sk's children are still alive
and point to the already free'd sk's address.
To fix this, l2cap_sock_release(sk) also cleans sk's children.

==================================================================
BUG: KASAN: use-after-free in l2cap_sock_ready_cb+0xb7/0x100 net/bluetooth/l2cap_sock.c:1650
Read of size 8 at addr ffff888104617aa8 by task kworker/u3:0/276

CPU: 0 PID: 276 Comm: kworker/u3:0 Not tainted 6.2.0-00001-gef397bd4d5fb-dirty #59
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
Workqueue: hci2 hci_rx_work
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x72/0x95 lib/dump_stack.c:106
 print_address_description mm/kasan/report.c:306 [inline]
 print_report+0x175/0x478 mm/kasan/report.c:417
 kasan_report+0xb1/0x130 mm/kasan/report.c:517
 l2cap_sock_ready_cb+0xb7/0x100 net/bluetooth/l2cap_sock.c:1650
 l2cap_chan_ready+0x10e/0x1e0 net/bluetooth/l2cap_core.c:1386
 l2cap_config_req+0x753/0x9f0 net/bluetooth/l2cap_core.c:4480
 l2cap_bredr_sig_cmd net/bluetooth/l2cap_core.c:5739 [inline]
 l2cap_sig_channel net/bluetooth/l2cap_core.c:6509 [inline]
 l2cap_recv_frame+0xe2e/0x43c0 net/bluetooth/l2cap_core.c:7788
 l2cap_recv_acldata+0x6ed/0x7e0 net/bluetooth/l2cap_core.c:8506
 hci_acldata_packet net/bluetooth/hci_core.c:3813 [inline]
 hci_rx_work+0x66e/0xbc0 net/bluetooth/hci_core.c:4048
 process_one_work+0x4ea/0x8e0 kernel/workqueue.c:2289
 worker_thread+0x364/0x8e0 kernel/workqueue.c:2436
 kthread+0x1b9/0x200 kernel/kthread.c:376
 ret_from_fork+0x2c/0x50 arch/x86/entry/entry_64.S:308
 </TASK>

Allocated by task 288:
 kasan_save_stack+0x22/0x50 mm/kasan/common.c:45
 kasan_set_track+0x25/0x30 mm/kasan/common.c:52
 ____kasan_kmalloc mm/kasan/common.c:374 [inline]
 __kasan_kmalloc+0x82/0x90 mm/kasan/common.c:383
 kasan_kmalloc include/linux/kasan.h:211 [inline]
 __do_kmalloc_node mm/slab_common.c:968 [inline]
 __kmalloc+0x5a/0x140 mm/slab_common.c:981
 kmalloc include/linux/slab.h:584 [inline]
 sk_prot_alloc+0x113/0x1f0 net/core/sock.c:2040
 sk_alloc+0x36/0x3c0 net/core/sock.c:2093
 l2cap_sock_alloc.constprop.0+0x39/0x1c0 net/bluetooth/l2cap_sock.c:1852
 l2cap_sock_create+0x10d/0x220 net/bluetooth/l2cap_sock.c:1898
 bt_sock_create+0x183/0x290 net/bluetooth/af_bluetooth.c:132
 __sock_create+0x226/0x380 net/socket.c:1518
 sock_create net/socket.c:1569 [inline]
 __sys_socket_create net/socket.c:1606 [inline]
 __sys_socket_create net/socket.c:1591 [inline]
 __sys_socket+0x112/0x200 net/socket.c:1639
 __do_sys_socket net/socket.c:1652 [inline]
 __se_sys_socket net/socket.c:1650 [inline]
 __x64_sys_socket+0x40/0x50 net/socket.c:1650
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3f/0x90 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x72/0xdc

Freed by task 288:
 kasan_save_stack+0x22/0x50 mm/kasan/common.c:45
 kasan_set_track+0x25/0x30 mm/kasan/common.c:52
 kasan_save_free_info+0x2e/0x50 mm/kasan/generic.c:523
 ____kasan_slab_free mm/kasan/common.c:236 [inline]
 ____kasan_slab_free mm/kasan/common.c:200 [inline]
 __kasan_slab_free+0x10a/0x190 mm/kasan/common.c:244
 kasan_slab_free include/linux/kasan.h:177 [inline]
 slab_free_hook mm/slub.c:1781 [inline]
 slab_free_freelist_hook mm/slub.c:1807 [inline]
 slab_free mm/slub.c:3787 [inline]
 __kmem_cache_free+0x88/0x1f0 mm/slub.c:3800
 sk_prot_free net/core/sock.c:2076 [inline]
 __sk_destruct+0x347/0x430 net/core/sock.c:2168
 sk_destruct+0x9c/0xb0 net/core/sock.c:2183
 __sk_free+0x82/0x220 net/core/sock.c:2194
 sk_free+0x7c/0xa0 net/core/sock.c:2205
 sock_put include/net/sock.h:1991 [inline]
 l2cap_sock_kill+0x256/0x2b0 net/bluetooth/l2cap_sock.c:1257
 l2cap_sock_release+0x1a7/0x220 net/bluetooth/l2cap_sock.c:1428
 __sock_release+0x80/0x150 net/socket.c:650
 sock_close+0x19/0x30 net/socket.c:1368
 __fput+0x17a/0x5c0 fs/file_table.c:320
 task_work_run+0x132/0x1c0 kernel/task_work.c:179
 resume_user_mode_work include/linux/resume_user_mode.h:49 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:171 [inline]
 exit_to_user_mode_prepare+0x113/0x120 kernel/entry/common.c:203
 __syscall_exit_to_user_mode_work kernel/entry/common.c:285 [inline]
 syscall_exit_to_user_mode+0x21/0x50 kernel/entry/common.c:296
 do_syscall_64+0x4c/0x90 arch/x86/entry/common.c:86
 entry_SYSCALL_64_after_hwframe+0x72/0xdc

The buggy address belongs to the object at ffff888104617800
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 680 bytes inside of
 1024-byte region [ffff888104617800, ffff888104617c00)

The buggy address belongs to the physical page:
page:00000000dbca6a80 refcount:1 mapcount:0 mapping:0000000000000000 index:0xffff888104614000 pfn:0x104614
head:00000000dbca6a80 order:2 compound_mapcount:0 subpages_mapcount:0 compound_pincount:0
flags: 0x200000000010200(slab|head|node=0|zone=2)
raw: 0200000000010200 ffff888100041dc0 ffffea0004212c10 ffffea0004234b10
raw: ffff888104614000 0000000000080002 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff888104617980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888104617a00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888104617a80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                  ^
 ffff888104617b00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888104617b80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================

Ack: This bug is found by FuzzBT with a modified Syzkaller. Other
contributors are Ruoyu Wu and Hui Peng.
Signed-off-by: Sungwoo Kim <iam@sung-woo.kim>
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/bluetooth/l2cap_sock.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/bluetooth/l2cap_sock.c b/net/bluetooth/l2cap_sock.c
index 1c6d01a27e0e8..b831e5fe3ebc1 100644
--- a/net/bluetooth/l2cap_sock.c
+++ b/net/bluetooth/l2cap_sock.c
@@ -45,6 +45,7 @@ static const struct proto_ops l2cap_sock_ops;
 static void l2cap_sock_init(struct sock *sk, struct sock *parent);
 static struct sock *l2cap_sock_alloc(struct net *net, struct socket *sock,
 				     int proto, gfp_t prio, int kern);
+static void l2cap_sock_cleanup_listen(struct sock *parent);
 
 bool l2cap_is_socket(struct socket *sock)
 {
@@ -1205,6 +1206,7 @@ static int l2cap_sock_release(struct socket *sock)
 	if (!sk)
 		return 0;
 
+	l2cap_sock_cleanup_listen(sk);
 	bt_sock_unlink(&l2cap_sk_list, sk);
 
 	err = l2cap_sock_shutdown(sock, 2);
-- 
2.39.2

