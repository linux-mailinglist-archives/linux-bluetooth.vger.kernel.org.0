Return-Path: <linux-bluetooth+bounces-9954-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A28A1A1CB41
	for <lists+linux-bluetooth@lfdr.de>; Sun, 26 Jan 2025 16:43:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1546E18863BC
	for <lists+linux-bluetooth@lfdr.de>; Sun, 26 Jan 2025 15:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A8D21D5A9;
	Sun, 26 Jan 2025 15:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SBC2qJOR"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6547921E086;
	Sun, 26 Jan 2025 15:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737903826; cv=none; b=eBTVmo5G7xkc3oHpj9Uyy5FV57Q1p4Cqruar/mq2ihhKYo6BAHxglYkliQz+iNFh5Ox3d1q8ugSKzcTCJc6HVcEl2Pl9apSyIm4QwX+p5kxSucoZ/zDzgaWY+oyQW8koQGMWB58+z/vWFFRbaxp8rlBeGtZ0sBqwkkYng/3SWYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737903826; c=relaxed/simple;
	bh=1Q47DR+yGNk8Fccc6ki38inGBV3TIeDToroqLH4JMoU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hIbD0dzTVstv+eW934BmDz3u/QPoCC728VkxBYUxuj+G+4f34nRz11lDKCjsxpBRN2GBzxwR+i2EnmxzKrSLEPt/4Pw7XDoonmsfTGAWKlqADIoopu0d82Y+JUTSOaE/f7Az56cbrqE8p3GyHiECisrduPxSPrIpiiGRkPQ4Rro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SBC2qJOR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24793C4CEE4;
	Sun, 26 Jan 2025 15:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737903826;
	bh=1Q47DR+yGNk8Fccc6ki38inGBV3TIeDToroqLH4JMoU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SBC2qJORrr7T1tvX3QXsZenBIc2e12mMkq9wBfIGPU+R0piu/ujxFFfZ233fqnyTQ
	 kvEk0kwqwOipppX2ms3QoRaXYAz1DOhUVOanSPe7as1PrP3ut6J2yE7NNVzO4dAu2r
	 5nh+9/DfaxzNQTDNsqm0VJRcSMwrTvV7mRUuXG0NjpK7GUD1HBQ0c16N4cisQg4aaa
	 refdBXVYUYDjOo1HlPvaUjAUW/Bv4Hdj8ET0ALrIIsMgkziR+gqyJ95idIjB1/e9Ox
	 Yw6xfIceGPVzbirAoQI1tU9H0gqUNy8Yj4vNYmgBWV8ccjppVmhJ9MTO8vOBX62VhM
	 Ut8GHJ2pk4GAw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mazin Al Haddad <mazin@getstate.dev>,
	syzbot+479aff51bb361ef5aa18@syzkaller.appspotmail.com,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Sasha Levin <sashal@kernel.org>,
	marcel@holtmann.org,
	johan.hedberg@gmail.com,
	luiz.dentz@gmail.com,
	linux-bluetooth@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 15/19] Bluetooth: MGMT: Fix slab-use-after-free Read in mgmt_remove_adv_monitor_sync
Date: Sun, 26 Jan 2025 10:03:10 -0500
Message-Id: <20250126150315.956795-15-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126150315.956795-1-sashal@kernel.org>
References: <20250126150315.956795-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.74
Content-Transfer-Encoding: 8bit

From: Mazin Al Haddad <mazin@getstate.dev>

[ Upstream commit 26fbd3494a7dd26269cb0817c289267dbcfdec06 ]

This fixes the following crash:

==================================================================
BUG: KASAN: slab-use-after-free in mgmt_remove_adv_monitor_sync+0x3a/0xd0 net/bluetooth/mgmt.c:5543
Read of size 8 at addr ffff88814128f898 by task kworker/u9:4/5961

CPU: 1 UID: 0 PID: 5961 Comm: kworker/u9:4 Not tainted 6.12.0-syzkaller-10684-gf1cd565ce577 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
Workqueue: hci0 hci_cmd_sync_work
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x169/0x550 mm/kasan/report.c:489
 kasan_report+0x143/0x180 mm/kasan/report.c:602
 mgmt_remove_adv_monitor_sync+0x3a/0xd0 net/bluetooth/mgmt.c:5543
 hci_cmd_sync_work+0x22b/0x400 net/bluetooth/hci_sync.c:332
 process_one_work kernel/workqueue.c:3229 [inline]
 process_scheduled_works+0xa63/0x1850 kernel/workqueue.c:3310
 worker_thread+0x870/0xd30 kernel/workqueue.c:3391
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>

Allocated by task 16026:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x98/0xb0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __kmalloc_cache_noprof+0x243/0x390 mm/slub.c:4314
 kmalloc_noprof include/linux/slab.h:901 [inline]
 kzalloc_noprof include/linux/slab.h:1037 [inline]
 mgmt_pending_new+0x65/0x250 net/bluetooth/mgmt_util.c:269
 mgmt_pending_add+0x36/0x120 net/bluetooth/mgmt_util.c:296
 remove_adv_monitor+0x102/0x1b0 net/bluetooth/mgmt.c:5568
 hci_mgmt_cmd+0xc47/0x11d0 net/bluetooth/hci_sock.c:1712
 hci_sock_sendmsg+0x7b8/0x11c0 net/bluetooth/hci_sock.c:1832
 sock_sendmsg_nosec net/socket.c:711 [inline]
 __sock_sendmsg+0x221/0x270 net/socket.c:726
 sock_write_iter+0x2d7/0x3f0 net/socket.c:1147
 new_sync_write fs/read_write.c:586 [inline]
 vfs_write+0xaeb/0xd30 fs/read_write.c:679
 ksys_write+0x18f/0x2b0 fs/read_write.c:731
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 16022:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:582
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x59/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2338 [inline]
 slab_free mm/slub.c:4598 [inline]
 kfree+0x196/0x420 mm/slub.c:4746
 mgmt_pending_foreach+0xd1/0x130 net/bluetooth/mgmt_util.c:259
 __mgmt_power_off+0x183/0x430 net/bluetooth/mgmt.c:9550
 hci_dev_close_sync+0x6c4/0x11c0 net/bluetooth/hci_sync.c:5208
 hci_dev_do_close net/bluetooth/hci_core.c:483 [inline]
 hci_dev_close+0x112/0x210 net/bluetooth/hci_core.c:508
 sock_do_ioctl+0x158/0x460 net/socket.c:1209
 sock_ioctl+0x626/0x8e0 net/socket.c:1328
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl+0xf5/0x170 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Reported-by: syzbot+479aff51bb361ef5aa18@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=479aff51bb361ef5aa18
Tested-by: syzbot+479aff51bb361ef5aa18@syzkaller.appspotmail.com
Signed-off-by: Mazin Al Haddad <mazin@getstate.dev>
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/bluetooth/mgmt.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index e3440f0d7d9d9..b36254107ef57 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -5453,10 +5453,16 @@ static void mgmt_remove_adv_monitor_complete(struct hci_dev *hdev,
 {
 	struct mgmt_rp_remove_adv_monitor rp;
 	struct mgmt_pending_cmd *cmd = data;
-	struct mgmt_cp_remove_adv_monitor *cp = cmd->param;
+	struct mgmt_cp_remove_adv_monitor *cp;
+
+	if (status == -ECANCELED ||
+	    cmd != pending_find(MGMT_OP_REMOVE_ADV_MONITOR, hdev))
+		return;
 
 	hci_dev_lock(hdev);
 
+	cp = cmd->param;
+
 	rp.monitor_handle = cp->monitor_handle;
 
 	if (!status)
@@ -5474,6 +5480,10 @@ static void mgmt_remove_adv_monitor_complete(struct hci_dev *hdev,
 static int mgmt_remove_adv_monitor_sync(struct hci_dev *hdev, void *data)
 {
 	struct mgmt_pending_cmd *cmd = data;
+
+	if (cmd != pending_find(MGMT_OP_REMOVE_ADV_MONITOR, hdev))
+		return -ECANCELED;
+
 	struct mgmt_cp_remove_adv_monitor *cp = cmd->param;
 	u16 handle = __le16_to_cpu(cp->monitor_handle);
 
-- 
2.39.5


