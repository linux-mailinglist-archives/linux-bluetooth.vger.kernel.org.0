Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3AA137FA78
	for <lists+linux-bluetooth@lfdr.de>; Thu, 13 May 2021 17:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234818AbhEMPTv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 13 May 2021 11:19:51 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:58022 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234810AbhEMPTu (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 13 May 2021 11:19:50 -0400
Received: from smtpclient.apple (p4fefc9d6.dip0.t-ipconnect.de [79.239.201.214])
        by mail.holtmann.org (Postfix) with ESMTPSA id A688CCED28;
        Thu, 13 May 2021 17:26:25 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: [PATCH] Bluetooth: Shutdown controller after workqueues are
 flushed or cancelled
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210511043029.43682-1-kai.heng.feng@canonical.com>
Date:   Thu, 13 May 2021 17:18:33 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        "open list:BLUETOOTH SUBSYSTEM" <linux-bluetooth@vger.kernel.org>,
        "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <F4ED8B6E-354E-4E88-8E48-4CF4169505CE@holtmann.org>
References: <20210511043029.43682-1-kai.heng.feng@canonical.com>
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Kai-Heng,

> Rfkill block and unblock Intel USB Bluetooth [8087:0026] may make it
> stops working:
> [  509.691509] Bluetooth: hci0: HCI reset during shutdown failed
> [  514.897584] Bluetooth: hci0: MSFT filter_enable is already on
> [  530.044751] usb 3-10: reset full-speed USB device number 5 using xhci_hcd
> [  545.660350] usb 3-10: device descriptor read/64, error -110
> [  561.283530] usb 3-10: device descriptor read/64, error -110
> [  561.519682] usb 3-10: reset full-speed USB device number 5 using xhci_hcd
> [  566.686650] Bluetooth: hci0: unexpected event for opcode 0x0500
> [  568.752452] Bluetooth: hci0: urb 0000000096cd309b failed to resubmit (113)
> [  578.797955] Bluetooth: hci0: Failed to read MSFT supported features (-110)
> [  586.286565] Bluetooth: hci0: urb 00000000c522f633 failed to resubmit (113)
> [  596.215302] Bluetooth: hci0: Failed to read MSFT supported features (-110)
> 
> Or kernel panics because other workqueues already freed skb:
> [ 2048.663763] BUG: kernel NULL pointer dereference, address: 0000000000000000
> [ 2048.663775] #PF: supervisor read access in kernel mode
> [ 2048.663779] #PF: error_code(0x0000) - not-present page
> [ 2048.663782] PGD 0 P4D 0
> [ 2048.663787] Oops: 0000 [#1] SMP NOPTI
> [ 2048.663793] CPU: 3 PID: 4491 Comm: rfkill Tainted: G        W         5.13.0-rc1-next-20210510+ #20
> [ 2048.663799] Hardware name: HP HP EliteBook 850 G8 Notebook PC/8846, BIOS T76 Ver. 01.01.04 12/02/2020
> [ 2048.663801] RIP: 0010:__skb_ext_put+0x6/0x50
> [ 2048.663814] Code: 8b 1b 48 85 db 75 db 5b 41 5c 5d c3 be 01 00 00 00 e8 de 13 c0 ff eb e7 be 02 00 00 00 e8 d2 13 c0 ff eb db 0f 1f 44 00 00 55 <8b> 07 48 89 e5 83 f8 01 74 14 b8 ff ff ff ff f0 0f c1
> 07 83 f8 01
> [ 2048.663819] RSP: 0018:ffffc1d105b6fd80 EFLAGS: 00010286
> [ 2048.663824] RAX: 0000000000000000 RBX: ffff9d9ac5649000 RCX: 0000000000000000
> [ 2048.663827] RDX: ffffffffc0d1daf6 RSI: 0000000000000206 RDI: 0000000000000000
> [ 2048.663830] RBP: ffffc1d105b6fd98 R08: 0000000000000001 R09: ffff9d9ace8ceac0
> [ 2048.663834] R10: ffff9d9ace8ceac0 R11: 0000000000000001 R12: ffff9d9ac5649000
> [ 2048.663838] R13: 0000000000000000 R14: 00007ffe0354d650 R15: 0000000000000000
> [ 2048.663843] FS:  00007fe02ab19740(0000) GS:ffff9d9e5f8c0000(0000) knlGS:0000000000000000
> [ 2048.663849] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 2048.663853] CR2: 0000000000000000 CR3: 0000000111a52004 CR4: 0000000000770ee0
> [ 2048.663856] PKRU: 55555554
> [ 2048.663859] Call Trace:
> [ 2048.663865]  ? skb_release_head_state+0x5e/0x80
> [ 2048.663873]  kfree_skb+0x2f/0xb0
> [ 2048.663881]  btusb_shutdown_intel_new+0x36/0x60 [btusb]
> [ 2048.663905]  hci_dev_do_close+0x48c/0x5e0 [bluetooth]
> [ 2048.663954]  ? __cond_resched+0x1a/0x50
> [ 2048.663962]  hci_rfkill_set_block+0x56/0xa0 [bluetooth]
> [ 2048.664007]  rfkill_set_block+0x98/0x170
> [ 2048.664016]  rfkill_fop_write+0x136/0x1e0
> [ 2048.664022]  vfs_write+0xc7/0x260
> [ 2048.664030]  ksys_write+0xb1/0xe0
> [ 2048.664035]  ? exit_to_user_mode_prepare+0x37/0x1c0
> [ 2048.664042]  __x64_sys_write+0x1a/0x20
> [ 2048.664048]  do_syscall_64+0x40/0xb0
> [ 2048.664055]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [ 2048.664060] RIP: 0033:0x7fe02ac23c27
> [ 2048.664066] Code: 0d 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
> [ 2048.664070] RSP: 002b:00007ffe0354d638 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> [ 2048.664075] RAX: ffffffffffffffda RBX: 0000000000000001 RCX: 00007fe02ac23c27
> [ 2048.664078] RDX: 0000000000000008 RSI: 00007ffe0354d650 RDI: 0000000000000003
> [ 2048.664081] RBP: 0000000000000000 R08: 0000559b05998440 R09: 0000559b05998440
> [ 2048.664084] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000003
> [ 2048.664086] R13: 0000000000000000 R14: ffffffff00000000 R15: 00000000ffffffff
> 
> So move the shutdown callback to a place where workqueues are either
> flushed or cancelled to resolve the issue.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
> net/bluetooth/hci_core.c | 16 ++++++++--------
> 1 file changed, 8 insertions(+), 8 deletions(-)

seems this one doesn’t apply cleanly to bluetooth-next, please rebase and re-send.

Regards

Marcel

