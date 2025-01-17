Return-Path: <linux-bluetooth+bounces-9793-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF57A15594
	for <lists+linux-bluetooth@lfdr.de>; Fri, 17 Jan 2025 18:16:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBFD4188D1D8
	for <lists+linux-bluetooth@lfdr.de>; Fri, 17 Jan 2025 17:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC7581A2388;
	Fri, 17 Jan 2025 17:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkFeAvAJ"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A31F25A643
	for <linux-bluetooth@vger.kernel.org>; Fri, 17 Jan 2025 17:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737134184; cv=none; b=J5/H97bMfzN9EwtnY8vyp1ptbsLp9hFWj9pRElpXpJ+sgtofhag/2bUfRs2IRBMeKM/6t2tbRgCcZ7XPtA1bUkdP+ufTO2UeEnYDvavSDgnFcqvpoLtSjQrDDDCJ58KpOzwNSsatSAj94XRXqHwc3oVMbD3pPTk7F9B8iM+ja6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737134184; c=relaxed/simple;
	bh=sWTJ6LWhpH0pz77F0Ti5vbyirZJTv3/ZaXMWjUEttp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=L3ZBKzaeRzpsTMD++XhtfOpWG/XzO6/+r6TlEN8DuPYMRVu8oe5Iv/4+YNj+Ejaz6a0IoaMMnMvdUam4VnEfkPd1ut3CP9F1doDke6Rzlq7PvUO6QQQCRKfLUlnlg74n1ya2ErkoJyM3GoAc2ID2ibkNgFkz83UWVzzyjOD8LhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkFeAvAJ; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30613037309so23657721fa.3
        for <linux-bluetooth@vger.kernel.org>; Fri, 17 Jan 2025 09:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737134179; x=1737738979; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcexs645obFTURzRrrqhvlFpnY1wq7yIz4GncLvwXTA=;
        b=kkFeAvAJ+xUhpsGESvrtYTXk/8tlV80btmhOTV0Am5rg8FSwsbS9cBHe4M0JKsUpdg
         OzIrVRtTdj4UW38RpF8t8VLmP+L2yz498iHj8D9O8pKhi4vNnpxvgL7PChdwD+tQ8B5u
         MYzZxNvNFlL9ZNLyNwT/zv6mJrkTGA0AedCuCZhsDls6whG6P8ZAzH7C71oyIT2D/O55
         QxIKh47xu+iKjsdQQc+iFbTraZWaNyKw4XQs5hElLdgp3i/ye+rSGMMIL9r5JGVZnNa5
         zpWrpafsNjaTpuqjuFlkpJTDuuTKi1P3mpix+QwPy2xgNbZ5Yvcmmlnm3MmkJybVXjY+
         XGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737134179; x=1737738979;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hcexs645obFTURzRrrqhvlFpnY1wq7yIz4GncLvwXTA=;
        b=wymqakdaO+pEHw0A8M0N8PDGEkZIUH5qHqi3fbPzZid2FqbiSX8wZROh36qN4jZwnq
         NMkVAalB/XXaN7qiAAyDBc413DmQcg35BokuK2vuNu2r6vofBIVflYL9cfaD4jUOh4ot
         Hwc4h1jQv8TRjueZdixuZGsAo5ADnJ9v0YuqFaBmLc6lroN9RSsmCYdVCpdyxIrFyoUS
         9PtSk7fPbAKLcByy0adzkIQn95ah+ZMg4HSkGNsmX/kWOsco9tOjRLAky2e/2FtZz08t
         rDmIdGuMypOw2moDybFICsGohYLRNL2YIUfyv2/6ul/yhVKce89/H2uIIPvf3bL8ww5+
         yPcw==
X-Gm-Message-State: AOJu0Yym1VFENoNtrZpXxaiVz6Uz6l1IIQlqcwHLJ6i7HpszMtTNt0Xw
	H7w3vcnJoci82k9NCAPnN660xkvZsJuJgArF+zqjdZQEB2Qf+AWqJGjBIklPrZEYE4sX9Z6at1r
	Ioj57GKJJqWrAbovwZsFq91XQyKjTq+hP
X-Gm-Gg: ASbGncsa5UiJJcqPgPkH/NM1wel47WRPETgEITIQKswt7SfiASUwxtwjSVKtfGTbvM4
	9teUruoZ1fa59621TE4tXlqSS8qNE6mcCjeQp7eI=
X-Google-Smtp-Source: AGHT+IG5VCodg1gUuXLp/KMk78JNnuu48CdHTAws4W5KDdCTemZUdN+VsL1vAOwGxwMxoBLQoRziGQFNIFngqGvyraU=
X-Received: by 2002:a2e:b5cf:0:b0:2fe:e44d:6162 with SMTP id
 38308e7fff4ca-3072cb0def3mr13264681fa.26.1737134179166; Fri, 17 Jan 2025
 09:16:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250117171425.3881114-1-luiz.dentz@gmail.com>
In-Reply-To: <20250117171425.3881114-1-luiz.dentz@gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 17 Jan 2025 12:16:07 -0500
X-Gm-Features: AbW1kvY1bTQhOA0CwhZLuTHJ9vl6WhpRcb4xfqGVPl8USZetRBFXQs0UQ13W-s8
Message-ID: <CABBYNZKyZKqM4pNxjqPEc1ot5fi50Oy_0VnujUXrJOe_ZeWNWA@mail.gmail.com>
Subject: Re: [PATCH v3] Bluetooth: L2CAP: Fix slab-use-after-free Read in l2cap_send_cmd
To: linux-bluetooth@vger.kernel.org, 
	syzbot+31c2f641b850a348a734@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

#syz test

On Fri, Jan 17, 2025 at 12:14=E2=80=AFPM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
>
> After the hci sync command releases l2cap_conn, the hci receive data work
> queue references the released l2cap_conn when sending to the upper layer.
> Add hci dev lock to the hci receive data work queue to synchronize the tw=
o.
>
> [1]
> BUG: KASAN: slab-use-after-free in l2cap_send_cmd+0x187/0x8d0 net/bluetoo=
th/l2cap_core.c:954
> Read of size 8 at addr ffff8880271a4000 by task kworker/u9:2/5837
>
> CPU: 0 UID: 0 PID: 5837 Comm: kworker/u9:2 Not tainted 6.13.0-rc5-syzkall=
er-00163-gab75170520d4 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 09/13/2024
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
> Closes: https://syzkaller.appspot.com/bug?extid=3D31c2f641b850a348a734
> Tested-by: syzbot+31c2f641b850a348a734@syzkaller.appspotmail.com
> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
>  net/bluetooth/l2cap_core.c | 38 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 2 deletions(-)
>
> diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
> index 27b4c4a2ba1f..cf3597682011 100644
> --- a/net/bluetooth/l2cap_core.c
> +++ b/net/bluetooth/l2cap_core.c
> @@ -951,11 +951,18 @@ static u8 l2cap_get_ident(struct l2cap_conn *conn)
>  static void l2cap_send_cmd(struct l2cap_conn *conn, u8 ident, u8 code, u=
16 len,
>                            void *data)
>  {
> -       struct sk_buff *skb =3D l2cap_build_cmd(conn, code, ident, len, d=
ata);
> +       struct sk_buff *skb;
>         u8 flags;
>
> +       /* Check if hchan has been dropped since it means hci_chan_del ha=
s
> +        * been called.
> +        */
> +       if (!conn->hchan)
> +               return;
> +
>         BT_DBG("code 0x%2.2x", code);
>
> +       skb =3D l2cap_build_cmd(conn, code, ident, len, data);
>         if (!skb)
>                 return;
>
> @@ -6785,6 +6792,12 @@ static void l2cap_recv_frame(struct l2cap_conn *co=
nn, struct sk_buff *skb)
>         u16 cid, len;
>         __le16 psm;
>
> +       /* Check if hchan has been dropped then drop any packets as well =
*/
> +       if (!conn->hchan) {
> +               kfree_skb(skb);
> +               return;
> +       }
> +
>         if (hcon->state !=3D BT_CONNECTED) {
>                 BT_DBG("queueing pending rx skb");
>                 skb_queue_tail(&conn->pending_rx, skb);
> @@ -7466,14 +7479,33 @@ static void l2cap_recv_reset(struct l2cap_conn *c=
onn)
>         conn->rx_len =3D 0;
>  }
>
> +static struct l2cap_conn *l2cap_conn_hold_unless_zero(struct l2cap_conn =
*c)
> +{
> +       BT_DBG("conn %p orig refcnt %u", c, kref_read(&c->ref));
> +
> +       if (!kref_get_unless_zero(&c->ref))
> +               return NULL;
> +
> +       return c;
> +}
> +
>  void l2cap_recv_acldata(struct hci_conn *hcon, struct sk_buff *skb, u16 =
flags)
>  {
> -       struct l2cap_conn *conn =3D hcon->l2cap_data;
> +       struct l2cap_conn *conn;
>         int len;
>
> +       /* Lock hdev to access l2cap_data to avoid race with l2cap_conn_d=
el */
> +       hci_dev_lock(hcon->hdev);
> +
> +       conn =3D hcon->l2cap_data;
> +
>         if (!conn)
>                 conn =3D l2cap_conn_add(hcon);
>
> +       conn =3D l2cap_conn_hold_unless_zero(conn);
> +
> +       hci_dev_unlock(hcon->hdev);
> +
>         if (!conn)
>                 goto drop;
>
> @@ -7565,6 +7597,8 @@ void l2cap_recv_acldata(struct hci_conn *hcon, stru=
ct sk_buff *skb, u16 flags)
>                 break;
>         }
>
> +       l2cap_conn_put(conn);
> +
>  drop:
>         kfree_skb(skb);
>  }
> --
> 2.47.1
>


--=20
Luiz Augusto von Dentz

