Return-Path: <linux-bluetooth+bounces-9817-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 113C9A16024
	for <lists+linux-bluetooth@lfdr.de>; Sun, 19 Jan 2025 04:57:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47B7818845DD
	for <lists+linux-bluetooth@lfdr.de>; Sun, 19 Jan 2025 03:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D1D1534F7;
	Sun, 19 Jan 2025 03:56:43 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail114-241.sinamail.sina.com.cn (mail114-241.sinamail.sina.com.cn [218.30.114.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086413CF58
	for <linux-bluetooth@vger.kernel.org>; Sun, 19 Jan 2025 03:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.30.114.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737259003; cv=none; b=T+cNkcWbhNx107Zggwjv6RGrhNsoCDu4Jx/5/bwi/DJFUaMntOm9DYelvcxsOE1kFcA9TxJS2HdcWBzOq3j6Kf26y7JcjbMPY/GJrioGXjouP34C4DtFed4ufeZVeYMVOho+6PO0Nn5t22sY1mqw4hRY4hH+UOp/fwypfFUQ5xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737259003; c=relaxed/simple;
	bh=AAZJ78EHVYqHdIl0MlsCXuvaT8fw7vtTovQdUF/ejLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PwWtOS5qQiiJWQ3dScB7yrawKFiKwa+IXWQkU5aj5tKgVKn94utPMcKfzxaSJTpWx695y/vN4FAyN5/R8L1FltSP6AYKdJlOttids+raHRRZJXDg/iKVgO/RDH6EpxK5Xj3Bik8dl0OOYIKafN9fHcGQwSSkCF5uHunvX5RRPLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=218.30.114.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([116.24.10.102])
	by sina.com (10.185.250.23) with ESMTP
	id 678C77E8000041EB; Sun, 19 Jan 2025 11:56:28 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 7764818913397
X-SMAIL-UIID: 14703BCB8B5D4FE19BE0BC229F039064-20250119-115628-1
From: Hillf Danton <hdanton@sina.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Edward Adam Davis <eadavis@qq.com>,
	netdev@vger.kernel.org,
	syzbot+31c2f641b850a348a734@syzkaller.appspotmail.com,
	johan.hedberg@gmail.com,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	marcel@holtmann.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH v4] Bluetooth: L2CAP: Fix slab-use-after-free Read in l2cap_send_cmd
Date: Sun, 19 Jan 2025 11:56:13 +0800
Message-ID: <20250119035614.2077-1-hdanton@sina.com>
In-Reply-To: <20250117184202.3895460-1-luiz.dentz@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 17 Jan 2025 13:42:02 -0500
> 
> After the hci sync command releases l2cap_conn, the hci receive data work
> queue references the released l2cap_conn when sending to the upper layer.
> Add hci dev lock to the hci receive data work queue to synchronize the two.
> 
> [1]
> BUG: KASAN: slab-use-after-free in l2cap_send_cmd+0x187/0x8d0 net/bluetooth/l2cap_core.c:954
> Read of size 8 at addr ffff8880271a4000 by task kworker/u9:2/5837
> 
> CPU: 0 UID: 0 PID: 5837 Comm: kworker/u9:2 Not tainted 6.13.0-rc5-syzkaller-00163-gab75170520d4 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
> Workqueue: hci1 hci_rx_work
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:94 [inline]
>  dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
>  print_address_description mm/kasan/report.c:378 [inline]
>  print_report+0x169/0x550 mm/kasan/report.c:489
>  kasan_report+0x143/0x180 mm/kasan/report.c:602
>  l2cap_build_cmd net/bluetooth/l2cap_core.c:2964 [inline]
>  l2cap_send_cmd+0x187/0x8d0 net/bluetooth/l2cap_core.c:954
>  l2cap_sig_send_rej net/bluetooth/l2cap_core.c:5502 [inline]
>  l2cap_sig_channel net/bluetooth/l2cap_core.c:5538 [inline]
>  l2cap_recv_frame+0x221f/0x10db0 net/bluetooth/l2cap_core.c:6817
>  hci_acldata_packet net/bluetooth/hci_core.c:3797 [inline]
>  hci_rx_work+0x508/0xdb0 net/bluetooth/hci_core.c:4040
>  process_one_work kernel/workqueue.c:3229 [inline]
>  process_scheduled_works+0xa66/0x1840 kernel/workqueue.c:3310
>  worker_thread+0x870/0xd30 kernel/workqueue.c:3391
>  kthread+0x2f0/0x390 kernel/kthread.c:389
>  ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
>  </TASK>
> 
> Allocated by task 5837:
>  kasan_save_stack mm/kasan/common.c:47 [inline]
>  kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
>  poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
>  __kasan_kmalloc+0x98/0xb0 mm/kasan/common.c:394
>  kasan_kmalloc include/linux/kasan.h:260 [inline]
>  __kmalloc_cache_noprof+0x243/0x390 mm/slub.c:4329
>  kmalloc_noprof include/linux/slab.h:901 [inline]
>  kzalloc_noprof include/linux/slab.h:1037 [inline]
>  l2cap_conn_add+0xa9/0x8e0 net/bluetooth/l2cap_core.c:6860
>  l2cap_connect_cfm+0x115/0x1090 net/bluetooth/l2cap_core.c:7239
>  hci_connect_cfm include/net/bluetooth/hci_core.h:2057 [inline]
>  hci_remote_features_evt+0x68e/0xac0 net/bluetooth/hci_event.c:3726
>  hci_event_func net/bluetooth/hci_event.c:7473 [inline]
>  hci_event_packet+0xac2/0x1540 net/bluetooth/hci_event.c:7525
>  hci_rx_work+0x3f3/0xdb0 net/bluetooth/hci_core.c:4035
>  process_one_work kernel/workqueue.c:3229 [inline]
>  process_scheduled_works+0xa66/0x1840 kernel/workqueue.c:3310
>  worker_thread+0x870/0xd30 kernel/workqueue.c:3391
>  kthread+0x2f0/0x390 kernel/kthread.c:389
>  ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
> 
> Freed by task 54:
>  kasan_save_stack mm/kasan/common.c:47 [inline]
>  kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
>  kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:582
>  poison_slab_object mm/kasan/common.c:247 [inline]
>  __kasan_slab_free+0x59/0x70 mm/kasan/common.c:264
>  kasan_slab_free include/linux/kasan.h:233 [inline]
>  slab_free_hook mm/slub.c:2353 [inline]
>  slab_free mm/slub.c:4613 [inline]
>  kfree+0x196/0x430 mm/slub.c:4761
>  l2cap_connect_cfm+0xcc/0x1090 net/bluetooth/l2cap_core.c:7235
>  hci_connect_cfm include/net/bluetooth/hci_core.h:2057 [inline]
>  hci_conn_failed+0x287/0x400 net/bluetooth/hci_conn.c:1266
>  hci_abort_conn_sync+0x56c/0x11f0 net/bluetooth/hci_sync.c:5603
>  hci_cmd_sync_work+0x22b/0x400 net/bluetooth/hci_sync.c:332
>  process_one_work kernel/workqueue.c:3229 [inline]
>  process_scheduled_works+0xa66/0x1840 kernel/workqueue.c:3310
>  worker_thread+0x870/0xd30 kernel/workqueue.c:3391
>  kthread+0x2f0/0x390 kernel/kthread.c:389
>  ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
> 
> Reported-by: syzbot+31c2f641b850a348a734@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=31c2f641b850a348a734
> Tested-by: syzbot+31c2f641b850a348a734@syzkaller.appspotmail.com
> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
>  net/bluetooth/l2cap_core.c | 45 ++++++++++++++++++++++++++++++++++----
>  1 file changed, 41 insertions(+), 4 deletions(-)
> 
> diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
> index 27b4c4a2ba1f..cc730135e5d9 100644
> --- a/net/bluetooth/l2cap_core.c
> +++ b/net/bluetooth/l2cap_core.c
> @@ -951,11 +951,18 @@ static u8 l2cap_get_ident(struct l2cap_conn *conn)
>  static void l2cap_send_cmd(struct l2cap_conn *conn, u8 ident, u8 code, u16 len,
>  			   void *data)
>  {
> -	struct sk_buff *skb = l2cap_build_cmd(conn, code, ident, len, data);
> +	struct sk_buff *skb;
>  	u8 flags;
>  
> +	/* Check if hchan has been dropped since it means hci_chan_del has
> +	 * been called.
> +	 */
> +	if (!conn->hchan)
> +		return;
> +
This does not work because nothing prevents ->hchan from being freed after this check.

>  	BT_DBG("code 0x%2.2x", code);
>  
> +	skb = l2cap_build_cmd(conn, code, ident, len, data);
>  	if (!skb)
>  		return;
>  
> @@ -1751,12 +1758,16 @@ static void l2cap_conn_del(struct hci_conn *hcon, int err)
>  {
>  	struct l2cap_conn *conn = hcon->l2cap_data;
>  	struct l2cap_chan *chan, *l;
> +	struct hci_chan *hchan;
>  
>  	if (!conn)
>  		return;
>  
>  	BT_DBG("hcon %p conn %p, err %d", hcon, conn, err);
>  
> +	hchan = conn->hchan;
> +	conn->hchan = NULL;
> +
>  	kfree_skb(conn->rx_skb);
>  
>  	skb_queue_purge(&conn->pending_rx);
> @@ -1792,13 +1803,12 @@ static void l2cap_conn_del(struct hci_conn *hcon, int err)
> 
>  	mutex_unlock(&conn->chan_lock);
> 
> -	hci_chan_del(conn->hchan);
> +	hci_chan_del(hchan);
> 
>  	if (conn->info_state & L2CAP_INFO_FEAT_MASK_REQ_SENT)
>  		cancel_delayed_work_sync(&conn->info_timer);
> 
>  	hcon->l2cap_data = NULL;
> -	conn->hchan = NULL;
>  	l2cap_conn_put(conn);
>  }

