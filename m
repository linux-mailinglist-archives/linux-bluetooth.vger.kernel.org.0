Return-Path: <linux-bluetooth+bounces-9924-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4913CA1B3B8
	for <lists+linux-bluetooth@lfdr.de>; Fri, 24 Jan 2025 11:46:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 847BC16B2E6
	for <lists+linux-bluetooth@lfdr.de>; Fri, 24 Jan 2025 10:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B57EB1D14E2;
	Fri, 24 Jan 2025 10:45:55 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail115-118.sinamail.sina.com.cn (mail115-118.sinamail.sina.com.cn [218.30.115.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592CB23B0
	for <linux-bluetooth@vger.kernel.org>; Fri, 24 Jan 2025 10:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.30.115.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737715555; cv=none; b=DdzRKdRcesBA0lzeHJB9R/M/apP0joPFrPym1QGm3l2jnhNBXjoTemjgbu5+oSZT7Y/zeB4LizguLOnDXEAu9K2EUZoHcUBJj3uZPglG2wE1PTfWyYMfWTdY5GmOQqto7Kk4l3+MBeBTjJc84+EGnYdyMtN0Bj6sLXmko/kr6OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737715555; c=relaxed/simple;
	bh=6NeoBC31Qgfp04p3fUf7gZUMfysk1+VUBzrkDq5kKi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QZWgSaD5/iG411Hqoi0oVPNPUgF73VwvfhXYDMLLBCjsuX+ev08hACqW9KNsLhg/7dalIbO1SfCETo8Nfw/vx5mNi7+KVuJp3ylZGKmLVz/p21+N++ML2KxKeSMzppvxKi58ruSqaNYiQs0fRvmF0MKtqBASV3UGpZr3hPfww+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=218.30.115.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([113.88.49.166])
	by sina.com (10.185.250.24) with ESMTP
	id 67936F4E000013C6; Fri, 24 Jan 2025 18:45:40 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 66828610748379
X-SMAIL-UIID: 65C8C76C5D6E48DEAC8C78F8B41265AA-20250124-184540-1
From: Hillf Danton <hdanton@sina.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v6] Bluetooth: L2CAP: Fix slab-use-after-free Read in l2cap_send_cmd
Date: Fri, 24 Jan 2025 18:45:27 +0800
Message-ID: <20250124104528.1777-1-hdanton@sina.com>
In-Reply-To: <20250122212514.164262-1-luiz.dentz@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 22 Jan 2025 16:25:14 -0500
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
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

Given V6, feel free to add change log as a maintainer Luiz.

>  net/bluetooth/l2cap_core.c | 39 +++++++++++++++++++++++++++++++++-----
>  1 file changed, 34 insertions(+), 5 deletions(-)
> 
> diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
> index 27b4c4a2ba1f..adb8c33ac595 100644
> --- a/net/bluetooth/l2cap_core.c
> +++ b/net/bluetooth/l2cap_core.c
> @@ -948,6 +948,16 @@ static u8 l2cap_get_ident(struct l2cap_conn *conn)
>  	return id;
>  }
>  
> +static void l2cap_send_acl(struct l2cap_conn *conn, struct sk_buff *skb,
> +			   u8 flags)
> +{
> +	/* Check if the hcon still valid before attempting to send */
> +	if (hci_conn_valid(conn->hcon->hdev, conn->hcon))

Checking validity makes no sense because nothing prevents hcon from
becoming invalid after check.

PS spin with linux-kernel@vger.kernel.org, netdev@vger.kernel.org cced.

> +		hci_send_acl(conn->hchan, skb, flags);
> +	else
> +		kfree_skb(skb);
> +}
> +
>  static void l2cap_send_cmd(struct l2cap_conn *conn, u8 ident, u8 code, u16 len,
>  			   void *data)
>  {
> @@ -970,7 +980,7 @@ static void l2cap_send_cmd(struct l2cap_conn *conn, u8 ident, u8 code, u16 len,
>  	bt_cb(skb)->force_active = BT_POWER_FORCE_ACTIVE_ON;
>  	skb->priority = HCI_PRIO_MAX;
>  
> -	hci_send_acl(conn->hchan, skb, flags);
> +	l2cap_send_acl(conn, skb, flags);
>  }
>  
>  static void l2cap_do_send(struct l2cap_chan *chan, struct sk_buff *skb)
> @@ -1792,13 +1802,10 @@ static void l2cap_conn_del(struct hci_conn *hcon, int err)
>  
>  	mutex_unlock(&conn->chan_lock);
>  
> -	hci_chan_del(conn->hchan);
> -
>  	if (conn->info_state & L2CAP_INFO_FEAT_MASK_REQ_SENT)
>  		cancel_delayed_work_sync(&conn->info_timer);
>  
>  	hcon->l2cap_data = NULL;
> -	conn->hchan = NULL;
>  	l2cap_conn_put(conn);
>  }
>  
> @@ -1806,6 +1813,7 @@ static void l2cap_conn_free(struct kref *ref)
>  {
>  	struct l2cap_conn *conn = container_of(ref, struct l2cap_conn, ref);
>  
> +	hci_chan_del(conn->hchan);
>  	hci_conn_put(conn->hcon);
>  	kfree(conn);
>  }
> @@ -7466,14 +7474,33 @@ static void l2cap_recv_reset(struct l2cap_conn *conn)
>  	conn->rx_len = 0;
>  }
>  
> +static struct l2cap_conn *l2cap_conn_hold_unless_zero(struct l2cap_conn *c)
> +{
> +	BT_DBG("conn %p orig refcnt %u", c, kref_read(&c->ref));
> +
> +	if (!kref_get_unless_zero(&c->ref))
> +		return NULL;
> +
> +	return c;
> +}
> +
>  void l2cap_recv_acldata(struct hci_conn *hcon, struct sk_buff *skb, u16 flags)
>  {
> -	struct l2cap_conn *conn = hcon->l2cap_data;
> +	struct l2cap_conn *conn;
>  	int len;
>  
> +	/* Lock hdev to access l2cap_data to avoid race with l2cap_conn_del */
> +	hci_dev_lock(hcon->hdev);
> +
> +	conn = hcon->l2cap_data;
> +
>  	if (!conn)
>  		conn = l2cap_conn_add(hcon);
>  
> +	conn = l2cap_conn_hold_unless_zero(conn);
> +
> +	hci_dev_unlock(hcon->hdev);
> +
>  	if (!conn)
>  		goto drop;
>  
> @@ -7565,6 +7592,8 @@ void l2cap_recv_acldata(struct hci_conn *hcon, struct sk_buff *skb, u16 flags)
>  		break;
>  	}
>  
> +	l2cap_conn_put(conn);
> +
>  drop:
>  	kfree_skb(skb);
>  }
> -- 
> 2.48.1

