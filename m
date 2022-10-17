Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57F70600811
	for <lists+linux-bluetooth@lfdr.de>; Mon, 17 Oct 2022 09:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbiJQHuh (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 17 Oct 2022 03:50:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbiJQHug (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 17 Oct 2022 03:50:36 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9C1423EA3;
        Mon, 17 Oct 2022 00:50:32 -0700 (PDT)
Received: from dggpeml500026.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MrTgP2N7MzHvnQ;
        Mon, 17 Oct 2022 15:50:25 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggpeml500026.china.huawei.com
 (7.185.36.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 15:50:13 +0800
From:   Zhengchao Shao <shaozhengchao@huawei.com>
To:     <linux-bluetooth@vger.kernel.org>, <netdev@vger.kernel.org>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>
CC:     <marcel@holtmann.org>, <johan.hedberg@gmail.com>,
        <luiz.dentz@gmail.com>, <weiyongjun1@huawei.com>,
        <yuehaibing@huawei.com>, <shaozhengchao@huawei.com>
Subject: [PATCH] Bluetooth: L2CAP: fix use-after-free in l2cap_conn_del()
Date:   Mon, 17 Oct 2022 15:58:13 +0800
Message-ID: <20221017075813.6071-1-shaozhengchao@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500026.china.huawei.com (7.185.36.106)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

When l2cap_recv_frame() is invoked to receive data, and the cid is
L2CAP_CID_A2MP, if the channel does not exist, it will create a channel.
However, after a channel is created, the hold operation of the channel
is not performed. In this case, the value of channel reference counting
is 1. As a result, after hci_error_reset() is triggered, l2cap_conn_del()
invokes the close hook function of A2MP to release the channel. Then
 l2cap_chan_unlock(chan) will trigger UAF issue.

The process is as follows:
Receive data:
l2cap_data_channel()
    a2mp_channel_create()  --->channel ref is 2
    l2cap_chan_put()       --->channel ref is 1

Triger event:
    hci_error_reset()
        hci_dev_do_close()
        ...
        l2cap_disconn_cfm()
            l2cap_conn_del()
                l2cap_chan_hold()    --->channel ref is 2
                l2cap_chan_del()     --->channel ref is 1
                a2mp_chan_close_cb() --->channel ref is 0, release channel
                l2cap_chan_unlock()  --->UAF of channel

The detailed Call Trace is as follows:
BUG: KASAN: use-after-free in __mutex_unlock_slowpath+0xa6/0x5e0
Read of size 8 at addr ffff8880160664b8 by task kworker/u11:1/7593
Workqueue: hci0 hci_error_reset
Call Trace:
 <TASK>
 dump_stack_lvl+0xcd/0x134
 print_report.cold+0x2ba/0x719
 kasan_report+0xb1/0x1e0
 kasan_check_range+0x140/0x190
 __mutex_unlock_slowpath+0xa6/0x5e0
 l2cap_conn_del+0x404/0x7b0
 l2cap_disconn_cfm+0x8c/0xc0
 hci_conn_hash_flush+0x11f/0x260
 hci_dev_close_sync+0x5f5/0x11f0
 hci_dev_do_close+0x2d/0x70
 hci_error_reset+0x9e/0x140
 process_one_work+0x98a/0x1620
 worker_thread+0x665/0x1080
 kthread+0x2e4/0x3a0
 ret_from_fork+0x1f/0x30
 </TASK>

Allocated by task 7593:
 kasan_save_stack+0x1e/0x40
 __kasan_kmalloc+0xa9/0xd0
 l2cap_chan_create+0x40/0x930
 amp_mgr_create+0x96/0x990
 a2mp_channel_create+0x7d/0x150
 l2cap_recv_frame+0x51b8/0x9a70
 l2cap_recv_acldata+0xaa3/0xc00
 hci_rx_work+0x702/0x1220
 process_one_work+0x98a/0x1620
 worker_thread+0x665/0x1080
 kthread+0x2e4/0x3a0
 ret_from_fork+0x1f/0x30

Freed by task 7593:
 kasan_save_stack+0x1e/0x40
 kasan_set_track+0x21/0x30
 kasan_set_free_info+0x20/0x30
 ____kasan_slab_free+0x167/0x1c0
 slab_free_freelist_hook+0x89/0x1c0
 kfree+0xe2/0x580
 l2cap_chan_put+0x22a/0x2d0
 l2cap_conn_del+0x3fc/0x7b0
 l2cap_disconn_cfm+0x8c/0xc0
 hci_conn_hash_flush+0x11f/0x260
 hci_dev_close_sync+0x5f5/0x11f0
 hci_dev_do_close+0x2d/0x70
 hci_error_reset+0x9e/0x140
 process_one_work+0x98a/0x1620
 worker_thread+0x665/0x1080
 kthread+0x2e4/0x3a0
 ret_from_fork+0x1f/0x30

Last potentially related work creation:
 kasan_save_stack+0x1e/0x40
 __kasan_record_aux_stack+0xbe/0xd0
 call_rcu+0x99/0x740
 netlink_release+0xe6a/0x1cf0
 __sock_release+0xcd/0x280
 sock_close+0x18/0x20
 __fput+0x27c/0xa90
 task_work_run+0xdd/0x1a0
 exit_to_user_mode_prepare+0x23c/0x250
 syscall_exit_to_user_mode+0x19/0x50
 do_syscall_64+0x42/0x80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

Second to last potentially related work creation:
 kasan_save_stack+0x1e/0x40
 __kasan_record_aux_stack+0xbe/0xd0
 call_rcu+0x99/0x740
 netlink_release+0xe6a/0x1cf0
 __sock_release+0xcd/0x280
 sock_close+0x18/0x20
 __fput+0x27c/0xa90
 task_work_run+0xdd/0x1a0
 exit_to_user_mode_prepare+0x23c/0x250
 syscall_exit_to_user_mode+0x19/0x50
 do_syscall_64+0x42/0x80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

Fixes: d0be8347c623 ("Bluetooth: L2CAP: Fix use-after-free caused by l2cap_chan_put")
Signed-off-by: Zhengchao Shao <shaozhengchao@huawei.com>
---
 net/bluetooth/l2cap_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index 2283871d3f01..9a32ce634919 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -7615,6 +7615,7 @@ static void l2cap_data_channel(struct l2cap_conn *conn, u16 cid,
 				return;
 			}
 
+			l2cap_chan_hold(chan);
 			l2cap_chan_lock(chan);
 		} else {
 			BT_DBG("unknown cid 0x%4.4x", cid);
-- 
2.17.1

