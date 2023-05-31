Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3F10718AD9
	for <lists+linux-bluetooth@lfdr.de>; Wed, 31 May 2023 22:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbjEaULQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 31 May 2023 16:11:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjEaULP (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 31 May 2023 16:11:15 -0400
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B8FD121
        for <linux-bluetooth@vger.kernel.org>; Wed, 31 May 2023 13:11:11 -0700 (PDT)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 39DB9240027
        for <linux-bluetooth@vger.kernel.org>; Wed, 31 May 2023 22:11:09 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4QWgPm4bPjz6txq;
        Wed, 31 May 2023 22:11:08 +0200 (CEST)
Message-ID: <3c4a8d5850a69eee1f73cbebf03bf19317b2a517.camel@iki.fi>
Subject: Re: [PATCH 1/6] Bluetooth: ISO: fix maximum number of CIS in Set
 CIG Parameters
From:   Pauli Virtanen <pav@iki.fi>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org
Date:   Wed, 31 May 2023 20:11:08 +0000
In-Reply-To: <CABBYNZJy7vC4cz5zrm4hkYx0w5hBRykxC5nRnJxEMMgKu1uRKQ@mail.gmail.com>
References: <cover.1685294131.git.pav@iki.fi>
         <46eefccceb45556120a0d1fa95cf27c576e9649a.1685294131.git.pav@iki.fi>
         <8eacbb0919470938a9ea10fc507d684b6a6d169f.camel@iki.fi>
         <CABBYNZJy7vC4cz5zrm4hkYx0w5hBRykxC5nRnJxEMMgKu1uRKQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NEUTRAL,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

ke, 2023-05-31 kello 12:16 -0700, Luiz Augusto von Dentz kirjoitti:
> Hi Pauli,
> 
> On Sun, May 28, 2023 at 4:58 PM Pauli Virtanen <pav@iki.fi> wrote:
> > 
> > su, 2023-05-28 kello 17:44 +0000, Pauli Virtanen kirjoitti:
> > > The maximum CIS_Count is 0x1f (Core v5.3 Vol 4 Part E Sec 7.8.97).
> > > 
> > > Fixes: 26afbd826ee3 ("Bluetooth: Add initial implementation of CIS connections")
> > > Signed-off-by: Pauli Virtanen <pav@iki.fi>
> > > ---
> > >  net/bluetooth/hci_conn.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
> > > index 1f906f8508bc..7b1a83ec50ae 100644
> > > --- a/net/bluetooth/hci_conn.c
> > > +++ b/net/bluetooth/hci_conn.c
> > > @@ -788,7 +788,7 @@ struct iso_list_data {
> > >       int count;
> > >       struct {
> > >               struct hci_cp_le_set_cig_params cp;
> > > -             struct hci_cis_params cis[0x11];
> > > +             struct hci_cis_params cis[0x1f];
> > >       } pdu;
> > >  };
> > > 
> > > @@ -1815,7 +1815,8 @@ static bool hci_le_set_cig_params(struct hci_conn *conn, struct bt_iso_qos *qos)
> > >       }
> > > 
> > >       /* Reprogram all CIS(s) with the same CIG */
> > > -     for (data.cig = qos->ucast.cig, data.cis = 0x00; data.cis < 0x11;
> > > +     for (data.cig = qos->ucast.cig, data.cis = 0x00;
> > > +          data.cis < ARRAY_SIZE(data.pdu.cis);
> > >            data.cis++) {
> > >               data.count = 0;
> > > 
> > 
> > Probably should also have cleaned up this loop while at it, the command
> > takes 0x1f configurations at most, but CIS IDs are <= 0xef. For v2...
> 
> Can you prioritize this set? I'd like to have it merged asap since
> without it CI is failing some tests.
> 

Sure, I'll do this first.

This is a bit delayed by:

Returning any error directly from hci_le_set_cig_params can trigger
kernel use-after-free in the emulator. If that's a problem, you may
want to hold off the patches that add new checks there.

Like this: in bluetooth-next/master change it to always error

diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
index 795b2daa5bac..2d95b9460af3 100644
--- a/net/bluetooth/hci_conn.c
+++ b/net/bluetooth/hci_conn.c
@@ -1788,6 +1788,8 @@ static bool hci_le_set_cig_params(struct hci_conn *conn, struct bt_iso_qos *qos)
        struct hci_dev *hdev = conn->hdev;
        struct iso_list_data data;
 
+       return false;
+
        memset(&data, 0, sizeof(data));
 
        /* Allocate first still reconfigurable CIG if not set */


Then

./tools/test-runner -k../linux/arch/x86_64/boot/bzImage -- ./tools/iso-tester -s "ISO QoS 8_1_1 - Success"
...
==================================================================
BUG: KASAN: slab-use-after-free in
hci_update_passive_scan_sync+0x780/0xf80
Read of size 8 at addr ffff888001b11c90 by task kworker/u3:2/43

CPU: 0 PID: 43 Comm: kworker/u3:2 Not tainted 6.3.0-rc7-02344-
g533e9a458c74-dirty #190
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-1.fc38
04/01/2014
Workqueue: hci0 hci_cmd_sync_work
Call Trace:
 <TASK>
 dump_stack_lvl+0x1d/0x30
 print_report+0xce/0x620
 ? __hci_cmd_sync_status_sk+0x63/0xb0
 ? __virt_addr_valid+0xd8/0x160
 ? hci_update_passive_scan_sync+0x780/0xf80
 kasan_report+0xb9/0xe0
 ? hci_update_passive_scan_sync+0x780/0xf80
 hci_update_passive_scan_sync+0x780/0xf80
 ? __pfx_hci_update_passive_scan_sync+0x10/0x10
 ? mutex_lock+0x11/0xe0
 ? __pfx_mutex_lock+0x10/0x10
 ? __pfx_mutex_unlock+0x10/0x10
 ? __pfx_update_passive_scan_sync+0x10/0x10
 hci_cmd_sync_work+0xf3/0x1d0
 process_one_work+0x3fe/0x6a0
 worker_thread+0xbb/0x720
 ? __pfx_worker_thread+0x10/0x10
 kthread+0x142/0x170
 ? __pfx_kthread+0x10/0x10
 ret_from_fork+0x2b/0x50
 </TASK>

Allocated by task 29:

Freed by task 15:

The buggy address belongs to the object at ffff888001b11c80
 which belongs to the cache kmalloc-96 of size 96
The buggy address is located 16 bytes inside of
 freed 96-byte region [ffff888001b11c80, ffff888001b11ce0)

The buggy address belongs to the physical page:

Memory state around the buggy address:
 ffff888001b11b80: 00 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc
 ffff888001b11c00: fa fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
>ffff888001b11c80: fa fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
                         ^
 ffff888001b11d00: fa fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
 ffff888001b11d80: fa fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
==================================================================
stack segment: 0000 [#1] PREEMPT KASAN PTI
CPU: 0 PID: 43 Comm: kworker/u3:2 Tainted: G    B              6.3.0-
rc7-02344-g533e9a458c74-dirty #190
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-1.fc38
04/01/2014
Workqueue: hci0 hci_cmd_sync_work
RIP: 0010:hci_le_add_accept_list_sync+0x11c/0x3d0
Code: 89 f7 e8 a7 1e 9f ff 4c 89 f7 e8 8f 0d 9f ff 48 8b 83 c8 10 00 00
48 0f ba e0 2b 72 25 48 8d 7d 26 4c 8d 75 20 e8 b4 09 9f ff <0f> b6 55
26 4c 89 f6 48 89 df e8 2
RSP: 0018:ffff888001f3fbe8 EFLAGS: 00010292
RAX: 0000000000000000 RBX: ffff888001dd0000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff888001f3fbb0
RBP: dead0000000000f0 R08: 0000000000000000 R09: ffff888001dd10cf
R10: ffffed10003ba219 R11: 0000000000000001 R12: 1ffff110003e7f80
R13: ffff888001f3fd28 R14: dead000000000110 R15: dead0000000000f0
FS:  0000000000000000(0000) GS:ffffffff82e9d000(0000)
knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f9617e48000 CR3: 0000000001ace000 CR4: 00000000000006f0
Call Trace:
 <TASK>
 ? add_taint+0x25/0x90
 ? __pfx_hci_le_add_accept_list_sync+0x10/0x10
 ? hci_update_passive_scan_sync+0x780/0xf80
 hci_update_passive_scan_sync+0x79f/0xf80
 ? __pfx_hci_update_passive_scan_sync+0x10/0x10
 ? mutex_lock+0x11/0xe0
 ? __pfx_mutex_lock+0x10/0x10
 ? __pfx_mutex_unlock+0x10/0x10
 ? __pfx_update_passive_scan_sync+0x10/0x10
 hci_cmd_sync_work+0xf3/0x1d0
 process_one_work+0x3fe/0x6a0
 worker_thread+0xbb/0x720
 ? __pfx_worker_thread+0x10/0x10
 kthread+0x142/0x170
 ? __pfx_kthread+0x10/0x10
 ret_from_fork+0x2b/0x50
 </TASK>
---[ end trace 0000000000000000 ]---
RIP: 0010:hci_le_add_accept_list_sync+0x11c/0x3d0
Code: 89 f7 e8 a7 1e 9f ff 4c 89 f7 e8 8f 0d 9f ff 48 8b 83 c8 10 00 00
48 0f ba e0 2b 72 25 48 8d 7d 26 4c 8d 75 20 e8 b4 09 9f ff <0f> b6 55
26 4c 89 f6 48 89 df e8 2
RSP: 0018:ffff888001f3fbe8 EFLAGS: 00010292
RAX: 0000000000000000 RBX: ffff888001dd0000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff888001f3fbb0
RBP: dead0000000000f0 R08: 0000000000000000 R09: ffff888001dd10cf
R10: ffffed10003ba219 R11: 0000000000000001 R12: 1ffff110003e7f80
R13: ffff888001f3fd28 R14: dead000000000110 R15: dead0000000000f0
FS:  0000000000000000(0000) GS:ffffffff82e9d000(0000)
knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f9617e48000 CR3: 0000000001ace000 CR4: 00000000000006f0

Didn't manage to find out how to fix that, but some tracebacks pointed
toward hci_conn_params of the CIS.

-- 
Pauli Virtanen
