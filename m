Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27B523743BF
	for <lists+linux-bluetooth@lfdr.de>; Wed,  5 May 2021 19:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235568AbhEEQvl (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 5 May 2021 12:51:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:58986 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236332AbhEEQtU (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 5 May 2021 12:49:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9A9161964;
        Wed,  5 May 2021 16:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620232635;
        bh=NhA81r/21O34t32sgvMAyeayTY8IyCEb3K2WiGMOdWI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Z+x7ftt/y3GyNhPC25vId9q4vtxg3ayXMe+xtDhPnB8zmdPMDE1vu14y0uG0/7QuQ
         9e5F31VEXu0Y18/daJKvQ/XABWinYS+wrjj5LDKmwOoyiifX9bdQFspSc+xUP2oEGt
         uDNN8+2qJIdp/oH1UTlZ/UcU2uITsgbh4bXWqaZW6jaWMOdczAqTVklgWt3uMdpZgu
         9JWL8BjcBODfAli6vp6y1cWPHL1R7lBmJj5MBzfCB54dNLVETpf9YSkllsmFYFXRgz
         grE24d3EivaXhsyuYVkcnNM9cGk9SfTeIA9yVt5rJgs03ePvSw8mLWDSJPko7WWMNg
         Qwo0wde1wNlxA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Archie Pusaka <apusaka@chromium.org>,
        syzbot+338f014a98367a08a114@syzkaller.appspotmail.com,
        Alain Michaud <alainm@chromium.org>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Sasha Levin <sashal@kernel.org>,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 18/85] Bluetooth: Set CONF_NOT_COMPLETE as l2cap_chan default
Date:   Wed,  5 May 2021 12:35:41 -0400
Message-Id: <20210505163648.3462507-18-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163648.3462507-1-sashal@kernel.org>
References: <20210505163648.3462507-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Archie Pusaka <apusaka@chromium.org>

[ Upstream commit 3a9d54b1947ecea8eea9a902c0b7eb58a98add8a ]

Currently l2cap_chan_set_defaults() reset chan->conf_state to zero.
However, there is a flag CONF_NOT_COMPLETE which is set when
creating the l2cap_chan. It is suggested that the flag should be
cleared when l2cap_chan is ready, but when l2cap_chan_set_defaults()
is called, l2cap_chan is not yet ready. Therefore, we must set this
flag as the default.

Example crash call trace:
__dump_stack lib/dump_stack.c:15 [inline]
dump_stack+0xc4/0x118 lib/dump_stack.c:56
panic+0x1c6/0x38b kernel/panic.c:117
__warn+0x170/0x1b9 kernel/panic.c:471
warn_slowpath_fmt+0xc7/0xf8 kernel/panic.c:494
debug_print_object+0x175/0x193 lib/debugobjects.c:260
debug_object_assert_init+0x171/0x1bf lib/debugobjects.c:614
debug_timer_assert_init kernel/time/timer.c:629 [inline]
debug_assert_init kernel/time/timer.c:677 [inline]
del_timer+0x7c/0x179 kernel/time/timer.c:1034
try_to_grab_pending+0x81/0x2e5 kernel/workqueue.c:1230
cancel_delayed_work+0x7c/0x1c4 kernel/workqueue.c:2929
l2cap_clear_timer+0x1e/0x41 include/net/bluetooth/l2cap.h:834
l2cap_chan_del+0x2d8/0x37e net/bluetooth/l2cap_core.c:640
l2cap_chan_close+0x532/0x5d8 net/bluetooth/l2cap_core.c:756
l2cap_sock_shutdown+0x806/0x969 net/bluetooth/l2cap_sock.c:1174
l2cap_sock_release+0x64/0x14d net/bluetooth/l2cap_sock.c:1217
__sock_release+0xda/0x217 net/socket.c:580
sock_close+0x1b/0x1f net/socket.c:1039
__fput+0x322/0x55c fs/file_table.c:208
____fput+0x17/0x19 fs/file_table.c:244
task_work_run+0x19b/0x1d3 kernel/task_work.c:115
exit_task_work include/linux/task_work.h:21 [inline]
do_exit+0xe4c/0x204a kernel/exit.c:766
do_group_exit+0x291/0x291 kernel/exit.c:891
get_signal+0x749/0x1093 kernel/signal.c:2396
do_signal+0xa5/0xcdb arch/x86/kernel/signal.c:737
exit_to_usermode_loop arch/x86/entry/common.c:243 [inline]
prepare_exit_to_usermode+0xed/0x235 arch/x86/entry/common.c:277
syscall_return_slowpath+0x3a7/0x3b3 arch/x86/entry/common.c:348
int_ret_from_sys_call+0x25/0xa3

Signed-off-by: Archie Pusaka <apusaka@chromium.org>
Reported-by: syzbot+338f014a98367a08a114@syzkaller.appspotmail.com
Reviewed-by: Alain Michaud <alainm@chromium.org>
Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Reviewed-by: Guenter Roeck <groeck@chromium.org>
Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/bluetooth/l2cap_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index 1ab27b90ddcb..3e18cddfbcc5 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -516,7 +516,9 @@ void l2cap_chan_set_defaults(struct l2cap_chan *chan)
 	chan->flush_to = L2CAP_DEFAULT_FLUSH_TO;
 	chan->retrans_timeout = L2CAP_DEFAULT_RETRANS_TO;
 	chan->monitor_timeout = L2CAP_DEFAULT_MONITOR_TO;
+
 	chan->conf_state = 0;
+	set_bit(CONF_NOT_COMPLETE, &chan->conf_state);
 
 	set_bit(FLAG_FORCE_ACTIVE, &chan->flags);
 }
-- 
2.30.2

