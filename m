Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2AA30DB61
	for <lists+linux-bluetooth@lfdr.de>; Wed,  3 Feb 2021 14:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232026AbhBCNem (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 3 Feb 2021 08:34:42 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:47055 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232014AbhBCNeb (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 3 Feb 2021 08:34:31 -0500
Received: from marcel-macbook.holtmann.net (p4fefcdd8.dip0.t-ipconnect.de [79.239.205.216])
        by mail.holtmann.org (Postfix) with ESMTPSA id 5C58FCECFC;
        Wed,  3 Feb 2021 14:41:00 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH v1] Bluetooth: Fix crash in
 mgmt_add_adv_patterns_monitor_complete
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210203150907.v1.1.I23ab3f91f23508bf84908e62d470bfab1d844f63@changeid>
Date:   Wed, 3 Feb 2021 14:33:32 +0100
Cc:     Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>,
        Miao-chen Chou <mcchou@chromium.org>,
        Manish Mandlik <mmandlik@chromium.org>,
        Archie Pusaka <apusaka@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <FF91258F-2875-4569-9195-6321409DFEA6@holtmann.org>
References: <20210203150907.v1.1.I23ab3f91f23508bf84908e62d470bfab1d844f63@changeid>
To:     Howard Chung <howardchung@google.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Howard,

> If hci_add_adv_monitor is a pending command(e.g. forward to
> msft_add_monitor_pattern), it is possible that
> mgmt_add_adv_patterns_monitor_complete gets called before
> cmd->user_data gets set, which will cause a crash when we
> try to get the moniter handle through cmd->user_data in
> mgmt_add_adv_patterns_monitor_complete.
> 
> This moves the cmd->user_data assignment earlier than
> hci_add_adv_monitor.
> 
> RIP: 0010:mgmt_add_adv_patterns_monitor_complete+0x82/0x187 [bluetooth]
> Code: 1e bf 03 00 00 00 be 52 00 00 00 4c 89 ea e8 9e
> e4 02 00 49 89 c6 48 85 c0 0f 84 06 01 00 00 48 89 5d b8 4c 89 fb 4d 8b
> 7e 30 <41> 0f b7 47 18 66 89 45 c0 45 84 e4 75 5a 4d 8b 56 28 48 8d 4d
> c8
> RSP: 0018:ffffae81807dbcb8 EFLAGS: 00010286
> RAX: ffff91c4bdf723c0 RBX: 0000000000000000 RCX: ffff91c4e5da5b80
> RDX: ffff91c405680000 RSI: 0000000000000052 RDI: ffff91c49d654c00
> RBP: ffffae81807dbd00 R08: ffff91c49fb157e0 R09: ffff91c49fb157e0
> R10: 000000000002a4f0 R11: ffffffffc0819cfd R12: 0000000000000000
> R13: ffff91c405680000 R14: ffff91c4bdf723c0 R15: 0000000000000000
> FS:  0000000000000000(0000) GS:ffff91c4ea300000(0000)
> knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000018 CR3: 0000000133612002 CR4:
> 00000000003606e0
> Call Trace:
> ? msft_le_monitor_advertisement_cb+0x111/0x141
> [bluetooth]
> hci_event_packet+0x425e/0x631c [bluetooth]
> ? printk+0x59/0x73
> ? __switch_to_asm+0x41/0x70
> ?
> msft_le_set_advertisement_filter_enable_cb+0xa6/0xa6 [bluetooth]
> ? bt_dbg+0xb4/0xbb [bluetooth]
> ? __switch_to_asm+0x41/0x70
> hci_rx_work+0x101/0x319 [bluetooth]
> process_one_work+0x257/0x506
> worker_thread+0x10d/0x284
> kthread+0x14c/0x154
> ? process_one_work+0x506/0x506
> ? kthread_blkcg+0x2c/0x2c
> ret_from_fork+0x1f/0x40
> 
> Reviewed-by: Miao-chen Chou <mcchou@chromium.org>
> Reviewed-by: Manish Mandlik <mmandlik@chromium.org>
> Reviewed-by: Archie Pusaka <apusaka@chromium.org>
> Signed-off-by: Howard Chung <howardchung@google.com>
> ---
> 
> net/bluetooth/mgmt.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

