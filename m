Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 208A9343920
	for <lists+linux-bluetooth@lfdr.de>; Mon, 22 Mar 2021 07:04:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbhCVGDi (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 22 Mar 2021 02:03:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbhCVGDS (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 22 Mar 2021 02:03:18 -0400
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DB31C061762
        for <linux-bluetooth@vger.kernel.org>; Sun, 21 Mar 2021 23:03:18 -0700 (PDT)
Received: by mail-pl1-x64a.google.com with SMTP id y19so6611365pll.8
        for <linux-bluetooth@vger.kernel.org>; Sun, 21 Mar 2021 23:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=BBThBlrE4t0qS0hQxdepmG5twB5J+RKrQ7EGY8fRoQ0=;
        b=WDHqFvoBWbW+cFFKyZ3TRnUGdtkgLHk3OCEAlFKiFudZSkVuni4bnbIc+wntXJyU6a
         XljXhZSbhauj9jqHA2nkuHNLmNvorRI9alCE8zNVDa15+JkR7aSWqX4QezA4hXr/wIgY
         5SE9KIaAQNRHNCz5DDIHLS9tRAnXlzEZfbYK8UKN6+N2FXgtgyS5fsv8gzDwzQ0vaYNl
         fvKDJOxO/EJSr7R2IcgVs96pcWvW42WmDcjkNoEYjEaqSmyhDgGLyDzOyyxHxMl/MfTt
         HXLDlO3IgswS+XN0Yyj20HOSIhm9+6cdId9c2AlVrR2EaA29YTJhHItWQp6tnTwObgJL
         8zjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=BBThBlrE4t0qS0hQxdepmG5twB5J+RKrQ7EGY8fRoQ0=;
        b=Or+YIh3IzG+B9x9RPaT21TAlPxnWGXdh5ugP5HYAO5PrK4eusdflp8V+miADSVUBCG
         bJY3bLyJ8UL2m8RW9jbzn4CEMI0xqdt8hmFgxBAJ0/MvBdFbLSVjebrpt98rzgxkpufb
         OTqWCjQ5Vyry+5IHYG+r+YR8KIauv4CXKY4TsN7U+isyWPg3NA8cMkwdzO+EpXFP/vJP
         gDnhFAck9T8VCGnXptl1ltAqZFdfxDxyR/no/+fol5snscrSSYPWU4bHNb3EoK8KV8t3
         teI8sPgJFpopR1mq7j9nGmGWkrxDNwI4cgVEKwoEEJNmKPY/cQLFJogzHR3OlX5A2s87
         B7Dw==
X-Gm-Message-State: AOAM5326VJfeKb6IjYn51+Z7faaEN7b2uZaX0E/T4Z47s2Y5UUqRY4wd
        dHVwi59uYhhC7hw3bPOv3vG4gjuz45m3kp8lCv+OWUiq8qE9QIvqNF+C9xHtHMmugnnDkTSFVkE
        vMYwmNXCUuLt8KeRvENmlJF2tTY5S07nXLBLrPLTw7+LVEexPamxDES/Aale1rpJyZzVO8dfV7Q
        3Q
X-Google-Smtp-Source: ABdhPJx2M8re/qJt2WXluKnSt1n1xM/g2KEzGadbRl0hMC3W37BsX9z1RxrRpiG9UABEODbaVwLwuQI0/LUA
X-Received: from apusaka-p920.tpe.corp.google.com ([2401:fa00:1:b:fdf3:9f7d:e4e3:ccad])
 (user=apusaka job=sendgmr) by 2002:a17:902:b088:b029:e6:e1d8:20cc with SMTP
 id p8-20020a170902b088b02900e6e1d820ccmr7601434plr.27.1616392997921; Sun, 21
 Mar 2021 23:03:17 -0700 (PDT)
Date:   Mon, 22 Mar 2021 14:03:11 +0800
Message-Id: <20210322140253.1.I269a2d44fcd122aa97e8533a836d968932430f95@changeid>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
Subject: [PATCH] Bluetooth: verify AMP hci_chan before amp_destroy
From:   Archie Pusaka <apusaka@google.com>
To:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>
Cc:     CrosBT Upstreaming <chromeos-bluetooth-upstreaming@chromium.org>,
        Archie Pusaka <apusaka@chromium.org>,
        syzbot+98228e7407314d2d4ba2@syzkaller.appspotmail.com,
        Alain Michaud <alainm@chromium.org>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Archie Pusaka <apusaka@chromium.org>

hci_chan can be created in 2 places: hci_loglink_complete_evt() if
it is an AMP hci_chan, or l2cap_conn_add() otherwise. In theory,
Only AMP hci_chan should be removed by a call to
hci_disconn_loglink_complete_evt(). However, the controller might mess
up, call that function, and destroy an hci_chan which is not initiated
by hci_loglink_complete_evt().

This patch adds a verification that the destroyed hci_chan must have
been init'd by hci_loglink_complete_evt().

Example crash call trace:
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0xe3/0x144 lib/dump_stack.c:118
 print_address_description+0x67/0x22a mm/kasan/report.c:256
 kasan_report_error mm/kasan/report.c:354 [inline]
 kasan_report mm/kasan/report.c:412 [inline]
 kasan_report+0x251/0x28f mm/kasan/report.c:396
 hci_send_acl+0x3b/0x56e net/bluetooth/hci_core.c:4072
 l2cap_send_cmd+0x5af/0x5c2 net/bluetooth/l2cap_core.c:877
 l2cap_send_move_chan_cfm_icid+0x8e/0xb1 net/bluetooth/l2cap_core.c:4661
 l2cap_move_fail net/bluetooth/l2cap_core.c:5146 [inline]
 l2cap_move_channel_rsp net/bluetooth/l2cap_core.c:5185 [inline]
 l2cap_bredr_sig_cmd net/bluetooth/l2cap_core.c:5464 [inline]
 l2cap_sig_channel net/bluetooth/l2cap_core.c:5799 [inline]
 l2cap_recv_frame+0x1d12/0x51aa net/bluetooth/l2cap_core.c:7023
 l2cap_recv_acldata+0x2ea/0x693 net/bluetooth/l2cap_core.c:7596
 hci_acldata_packet net/bluetooth/hci_core.c:4606 [inline]
 hci_rx_work+0x2bd/0x45e net/bluetooth/hci_core.c:4796
 process_one_work+0x6f8/0xb50 kernel/workqueue.c:2175
 worker_thread+0x4fc/0x670 kernel/workqueue.c:2321
 kthread+0x2f0/0x304 kernel/kthread.c:253
 ret_from_fork+0x3a/0x50 arch/x86/entry/entry_64.S:415

Allocated by task 38:
 set_track mm/kasan/kasan.c:460 [inline]
 kasan_kmalloc+0x8d/0x9a mm/kasan/kasan.c:553
 kmem_cache_alloc_trace+0x102/0x129 mm/slub.c:2787
 kmalloc include/linux/slab.h:515 [inline]
 kzalloc include/linux/slab.h:709 [inline]
 hci_chan_create+0x86/0x26d net/bluetooth/hci_conn.c:1674
 l2cap_conn_add.part.0+0x1c/0x814 net/bluetooth/l2cap_core.c:7062
 l2cap_conn_add net/bluetooth/l2cap_core.c:7059 [inline]
 l2cap_connect_cfm+0x134/0x852 net/bluetooth/l2cap_core.c:7381
 hci_connect_cfm+0x9d/0x122 include/net/bluetooth/hci_core.h:1404
 hci_remote_ext_features_evt net/bluetooth/hci_event.c:4161 [inline]
 hci_event_packet+0x463f/0x72fa net/bluetooth/hci_event.c:5981
 hci_rx_work+0x197/0x45e net/bluetooth/hci_core.c:4791
 process_one_work+0x6f8/0xb50 kernel/workqueue.c:2175
 worker_thread+0x4fc/0x670 kernel/workqueue.c:2321
 kthread+0x2f0/0x304 kernel/kthread.c:253
 ret_from_fork+0x3a/0x50 arch/x86/entry/entry_64.S:415

Freed by task 1732:
 set_track mm/kasan/kasan.c:460 [inline]
 __kasan_slab_free mm/kasan/kasan.c:521 [inline]
 __kasan_slab_free+0x106/0x128 mm/kasan/kasan.c:493
 slab_free_hook mm/slub.c:1409 [inline]
 slab_free_freelist_hook+0xaa/0xf6 mm/slub.c:1436
 slab_free mm/slub.c:3009 [inline]
 kfree+0x182/0x21e mm/slub.c:3972
 hci_disconn_loglink_complete_evt net/bluetooth/hci_event.c:4891 [inline]
 hci_event_packet+0x6a1c/0x72fa net/bluetooth/hci_event.c:6050
 hci_rx_work+0x197/0x45e net/bluetooth/hci_core.c:4791
 process_one_work+0x6f8/0xb50 kernel/workqueue.c:2175
 worker_thread+0x4fc/0x670 kernel/workqueue.c:2321
 kthread+0x2f0/0x304 kernel/kthread.c:253
 ret_from_fork+0x3a/0x50 arch/x86/entry/entry_64.S:415

The buggy address belongs to the object at ffff8881d7af9180
 which belongs to the cache kmalloc-128 of size 128
The buggy address is located 24 bytes inside of
 128-byte region [ffff8881d7af9180, ffff8881d7af9200)
The buggy address belongs to the page:
page:ffffea00075ebe40 count:1 mapcount:0 mapping:ffff8881da403200 index:0x0
flags: 0x8000000000000200(slab)
raw: 8000000000000200 dead000000000100 dead000000000200 ffff8881da403200
raw: 0000000000000000 0000000080150015 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff8881d7af9080: fc fc fc fc fc fc fc fc fb fb fb fb fb fb fb fb
 ffff8881d7af9100: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>ffff8881d7af9180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                            ^
 ffff8881d7af9200: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8881d7af9280: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc

Signed-off-by: Archie Pusaka <apusaka@chromium.org>
Reported-by: syzbot+98228e7407314d2d4ba2@syzkaller.appspotmail.com
Reviewed-by: Alain Michaud <alainm@chromium.org>
Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

 include/net/bluetooth/hci_core.h | 1 +
 net/bluetooth/hci_event.c        | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index ebdd4afe30d2..ca4ac6603b9a 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -704,6 +704,7 @@ struct hci_chan {
 	struct sk_buff_head data_q;
 	unsigned int	sent;
 	__u8		state;
+	bool		amp;
 };
 
 struct hci_conn_params {
diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index cf2f4a0abdbd..341c8ce93648 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -5032,6 +5032,7 @@ static void hci_loglink_complete_evt(struct hci_dev *hdev, struct sk_buff *skb)
 		return;
 
 	hchan->handle = le16_to_cpu(ev->handle);
+	hchan->amp = true;
 
 	BT_DBG("hcon %p mgr %p hchan %p", hcon, hcon->amp_mgr, hchan);
 
@@ -5064,7 +5065,7 @@ static void hci_disconn_loglink_complete_evt(struct hci_dev *hdev,
 	hci_dev_lock(hdev);
 
 	hchan = hci_chan_lookup_handle(hdev, le16_to_cpu(ev->handle));
-	if (!hchan)
+	if (!hchan || !hchan->amp)
 		goto unlock;
 
 	amp_destroy_logical_link(hchan, ev->reason);
-- 
2.31.0.rc2.261.g7f71774620-goog

