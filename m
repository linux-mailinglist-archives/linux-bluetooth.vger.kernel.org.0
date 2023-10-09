Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42F147BE812
	for <lists+linux-bluetooth@lfdr.de>; Mon,  9 Oct 2023 19:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377878AbjJIRb0 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 9 Oct 2023 13:31:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377419AbjJIRbZ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 9 Oct 2023 13:31:25 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0125D6
        for <linux-bluetooth@vger.kernel.org>; Mon,  9 Oct 2023 10:31:23 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c1854bebf5so59798201fa.1
        for <linux-bluetooth@vger.kernel.org>; Mon, 09 Oct 2023 10:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696872682; x=1697477482; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14xJWYxeZmNqGgJLY6tnhQOYOcCCy/7UMFQk3yerYLw=;
        b=WNKS34VybdvvI6vDBXYZ2s1H4VlqFdXUaaSfSbd4iPMX5OtfXywlqb9+QbbIy0fdiP
         7ALFpR25Trmmp9ADkpnUQb8CscPyb7a76KN8jkQTPmNZEXTRKYM10ryrIavspr4dlwHk
         Gdae3bwwgHhOmpU+FTZXF4AclTu0hGy+GVeEDqMoD91dBWXtRtz/3L0V8ifq+qMtAOWI
         6jHYBxE2JPjqE/Rv6TQq8g7hwbT2pCzD/jUOsjXsGC52QdaFc9Gpf9OtyBCsvFdOHKbM
         xY54t//Vx4lLNhLcM0uGMWgf6sgdNc0OiLsk/wizPBWNYj93Skt1quRnDjx2Avd7AS64
         jscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696872682; x=1697477482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14xJWYxeZmNqGgJLY6tnhQOYOcCCy/7UMFQk3yerYLw=;
        b=u9broxqO3/mRqMSzHm5r7aMtoAdz4Zv5KVU41nA0rPh1hhGtzU+k2RT9u4O1mP4EZt
         OU5+r0AcR2NEir76svWSHzMTbCPe1ijHOF+fg4TtffF4rh6aY0JHbDRviczlyedLJZBN
         9osid33eEUnCiBh04RjlgDu8w0CL/AszbnPUmoq423ssM02Zas9nrXRovYH2BonACYQr
         2Yc0XX9sHjtqldfKX51tIp2VU2M2NgS7X8Hp+GSrGv4aFDxDJRlw6OGWI+pRi/XvqBYY
         gfpqvatkiZnRnaF3m40sAuhFTHW3+pshiVu6we39VDVC9txSQhDLH5QTtEhuMvpMfhQE
         HiFQ==
X-Gm-Message-State: AOJu0YzERIYF2kqCJXiiFmnoK6ndWpKSN88Af2MVtitspqvMzN9EX2hm
        Yy9fUP709XaKGNKF6VJDzbr7pJdqyIokzwi4dAmebNqTcIIZQQ==
X-Google-Smtp-Source: AGHT+IG8C6sXk8eG7qItNZ43ZC5BLi1Qvs+Fme5Vb07QaxW1NlCUmZYJLU9Ycl95uezVtIKfWA/d3e79TOtZ8Hg9OXQ=
X-Received: by 2002:a2e:7d07:0:b0:2bc:b88c:64ed with SMTP id
 y7-20020a2e7d07000000b002bcb88c64edmr14133412ljc.12.1696872681382; Mon, 09
 Oct 2023 10:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <20231009123045.587882-1-william.xuanziyang@huawei.com>
In-Reply-To: <20231009123045.587882-1-william.xuanziyang@huawei.com>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Mon, 9 Oct 2023 10:31:09 -0700
Message-ID: <CABBYNZ+49MXzbbJcu2oOw6apXzxXBf8J6D3+PNE_v2aDnV1DdQ@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: Fix UAF for hci_chan
To:     Ziyang Xuan <william.xuanziyang@huawei.com>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi,

On Mon, Oct 9, 2023 at 5:30=E2=80=AFAM Ziyang Xuan
<william.xuanziyang@huawei.com> wrote:
>
> Syzbot reports a UAF problem as follows:
>
> BUG: KASAN: slab-use-after-free in hci_send_acl+0x48/0xe70 net/bluetooth/=
hci_core.c:3231
> ...
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:88 [inline]
>  dump_stack_lvl+0x1e7/0x2d0 lib/dump_stack.c:106
>  print_address_description mm/kasan/report.c:364 [inline]
>  print_report+0x163/0x540 mm/kasan/report.c:475
>  kasan_report+0x175/0x1b0 mm/kasan/report.c:588
>  hci_send_acl+0x48/0xe70 net/bluetooth/hci_core.c:3231
>  l2cap_send_conn_req net/bluetooth/l2cap_core.c:1286 [inline]
>  l2cap_start_connection+0x465/0x620 net/bluetooth/l2cap_core.c:1514
>  l2cap_conn_start+0xbf3/0x1130 net/bluetooth/l2cap_core.c:1661
>  process_one_work kernel/workqueue.c:2630 [inline]
>  process_scheduled_works+0x90f/0x1400 kernel/workqueue.c:2703
>  worker_thread+0xa5f/0xff0 kernel/workqueue.c:2784
>  kthread+0x2d3/0x370 kernel/kthread.c:388
>  ret_from_fork+0x48/0x80 arch/x86/kernel/process.c:147
>  ret_from_fork_asm+0x11/0x20 arch/x86/entry/entry_64.S:304
>  </TASK>
>
> Allocated by task 27110:
>  kasan_save_stack mm/kasan/common.c:45 [inline]
>  kasan_set_track+0x4f/0x70 mm/kasan/common.c:52
>  ____kasan_kmalloc mm/kasan/common.c:374 [inline]
>  __kasan_kmalloc+0x98/0xb0 mm/kasan/common.c:383
>  kmalloc include/linux/slab.h:599 [inline]
>  kzalloc include/linux/slab.h:720 [inline]
>  hci_chan_create+0xc8/0x300 net/bluetooth/hci_conn.c:2714
>  l2cap_conn_add+0x69/0xc10 net/bluetooth/l2cap_core.c:7841
>  l2cap_chan_connect+0x61f/0xeb0 net/bluetooth/l2cap_core.c:8053
>  bt_6lowpan_connect net/bluetooth/6lowpan.c:894 [inline]
>  lowpan_control_write+0x55e/0x850 net/bluetooth/6lowpan.c:1129
>  full_proxy_write+0x113/0x1c0 fs/debugfs/file.c:236
>  vfs_write+0x286/0xaf0 fs/read_write.c:582
>  ksys_write+0x1a0/0x2c0 fs/read_write.c:637
>  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>  do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
>  entry_SYSCALL_64_after_hwframe+0x63/0xcd
>
> Freed by task 5067:
>  kasan_save_stack mm/kasan/common.c:45 [inline]
>  kasan_set_track+0x4f/0x70 mm/kasan/common.c:52
>  kasan_save_free_info+0x28/0x40 mm/kasan/generic.c:522
>  ____kasan_slab_free+0xd6/0x120 mm/kasan/common.c:236
>  kasan_slab_free include/linux/kasan.h:164 [inline]
>  slab_free_hook mm/slub.c:1800 [inline]
>  slab_free_freelist_hook mm/slub.c:1826 [inline]
>  slab_free mm/slub.c:3809 [inline]
>  __kmem_cache_free+0x25f/0x3b0 mm/slub.c:3822
>  hci_chan_list_flush net/bluetooth/hci_conn.c:2754 [inline]
>  hci_conn_cleanup net/bluetooth/hci_conn.c:152 [inline]
>  hci_conn_del+0x4f8/0xc40 net/bluetooth/hci_conn.c:1156
>  hci_abort_conn_sync+0xa45/0xfe0
>  hci_cmd_sync_work+0x228/0x400 net/bluetooth/hci_sync.c:306
>  process_one_work kernel/workqueue.c:2630 [inline]
>  process_scheduled_works+0x90f/0x1400 kernel/workqueue.c:2703
>  worker_thread+0xa5f/0xff0 kernel/workqueue.c:2784
>  kthread+0x2d3/0x370 kernel/kthread.c:388
>  ret_from_fork+0x48/0x80 arch/x86/kernel/process.c:147
>  ret_from_fork_asm+0x11/0x20 arch/x86/entry/entry_64.S:304
>
> There are two main reasons for this:
> 1. In the case of hci_conn_add() concurrency, the handle of
> hci_conn allocated through hci_conn_hash_alloc_unset() is not unique.
> That will result in getting the wrong hci_conn by
> hci_conn_hash_lookup_handle().
> 2. The processes related to hci_abort_conn() can re-enter for the same
> hci_conn because atomic_dec_and_test(&hci_conn->refcnt) is established
> in hci_conn_drop(). That will make hci_conn UAF.
>
> To fix this, use ida to manage the allocation of conn->handle, and
> add the HCI_CONN_DISC flag to avoid re-entering of the processes related
> to hci_abort_conn().
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Ziyang Xuan <william.xuanziyang@huawei.com>
> ---
> v2:
>   - Rebase patch base on newest repo.
>   - Remove HCI_CONN_DISC check in lookup interfaces.
> ---
>  include/net/bluetooth/hci_core.h |  6 ++++-
>  net/bluetooth/hci_conn.c         | 38 ++++++++++++++++----------------
>  net/bluetooth/hci_core.c         |  3 +++
>  3 files changed, 27 insertions(+), 20 deletions(-)
>
> diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci=
_core.h
> index f36c1fd5d64e..4f44f2bffa57 100644
> --- a/include/net/bluetooth/hci_core.h
> +++ b/include/net/bluetooth/hci_core.h
> @@ -350,6 +350,8 @@ struct hci_dev {
>         struct list_head list;
>         struct mutex    lock;
>
> +       struct ida      unset_handle_ida;
> +
>         const char      *name;
>         unsigned long   flags;
>         __u16           id;
> @@ -969,6 +971,7 @@ enum {
>         HCI_CONN_AUTH_INITIATOR,
>         HCI_CONN_DROP,
>         HCI_CONN_CANCEL,
> +       HCI_CONN_DISC,

Can't we just use HCI_CONN_DROP instead of introducing yet another flag?

>         HCI_CONN_PARAM_REMOVAL_PEND,
>         HCI_CONN_NEW_LINK_KEY,
>         HCI_CONN_SCANNING,
> @@ -1543,7 +1546,8 @@ static inline void hci_conn_drop(struct hci_conn *c=
onn)
>  {
>         BT_DBG("hcon %p orig refcnt %d", conn, atomic_read(&conn->refcnt)=
);
>
> -       if (atomic_dec_and_test(&conn->refcnt)) {
> +       if (atomic_dec_and_test(&conn->refcnt) &&
> +           !test_bit(HCI_CONN_DISC, &conn->flags)) {
>                 unsigned long timeo;
>
>                 switch (conn->type) {
> diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
> index 974631e652c1..f87281b4386f 100644
> --- a/net/bluetooth/hci_conn.c
> +++ b/net/bluetooth/hci_conn.c
> @@ -153,6 +153,9 @@ static void hci_conn_cleanup(struct hci_conn *conn)
>
>         hci_conn_hash_del(hdev, conn);
>
> +       if (HCI_CONN_HANDLE_UNSET(conn->handle))
> +               ida_free(&hdev->unset_handle_ida, conn->handle);
> +
>         if (conn->cleanup)
>                 conn->cleanup(conn);
>
> @@ -929,29 +932,17 @@ static void cis_cleanup(struct hci_conn *conn)
>         hci_le_remove_cig(hdev, conn->iso_qos.ucast.cig);
>  }
>
> -static u16 hci_conn_hash_alloc_unset(struct hci_dev *hdev)
> +static int hci_conn_hash_alloc_unset(struct hci_dev *hdev)
>  {
> -       struct hci_conn_hash *h =3D &hdev->conn_hash;
> -       struct hci_conn  *c;
> -       u16 handle =3D HCI_CONN_HANDLE_MAX + 1;
> -
> -       rcu_read_lock();
> -
> -       list_for_each_entry_rcu(c, &h->list, list) {
> -               /* Find the first unused handle */
> -               if (handle =3D=3D 0xffff || c->handle !=3D handle)
> -                       break;
> -               handle++;
> -       }
> -       rcu_read_unlock();
> -
> -       return handle;
> +       return ida_alloc_range(&hdev->unset_handle_ida, HCI_CONN_HANDLE_M=
AX + 1,
> +                              U16_MAX, GFP_ATOMIC);
>  }
>
>  struct hci_conn *hci_conn_add(struct hci_dev *hdev, int type, bdaddr_t *=
dst,
>                               u8 role)
>  {
>         struct hci_conn *conn;
> +       int handle;
>
>         BT_DBG("%s dst %pMR", hdev->name, dst);
>
> @@ -961,7 +952,12 @@ struct hci_conn *hci_conn_add(struct hci_dev *hdev, =
int type, bdaddr_t *dst,
>
>         bacpy(&conn->dst, dst);
>         bacpy(&conn->src, &hdev->bdaddr);
> -       conn->handle =3D hci_conn_hash_alloc_unset(hdev);
> +       handle =3D hci_conn_hash_alloc_unset(hdev);
> +       if (unlikely(handle < 0)) {
> +               kfree(conn);
> +               return NULL;
> +       }
> +       conn->handle =3D handle;
>         conn->hdev  =3D hdev;
>         conn->type  =3D type;
>         conn->role  =3D role;
> @@ -2933,6 +2929,7 @@ static int abort_conn_sync(struct hci_dev *hdev, vo=
id *data)
>  int hci_abort_conn(struct hci_conn *conn, u8 reason)
>  {
>         struct hci_dev *hdev =3D conn->hdev;
> +       int ret;
>
>         /* If abort_reason has already been set it means the connection i=
s
>          * already being aborted so don't attempt to overwrite it.
> @@ -2961,6 +2958,9 @@ int hci_abort_conn(struct hci_conn *conn, u8 reason=
)
>                 }
>         }
>
> -       return hci_cmd_sync_queue(hdev, abort_conn_sync, UINT_PTR(conn->h=
andle),
> -                                 NULL);
> +       ret =3D hci_cmd_sync_queue(hdev, abort_conn_sync,
> +                                UINT_PTR(conn->handle), NULL);
> +       if (!ret)
> +               set_bit(HCI_CONN_DISC, &conn->flags);
> +       return ret;
>  }
> diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> index 195aea2198a9..65601aa52e0d 100644
> --- a/net/bluetooth/hci_core.c
> +++ b/net/bluetooth/hci_core.c
> @@ -2535,6 +2535,8 @@ struct hci_dev *hci_alloc_dev_priv(int sizeof_priv)
>         mutex_init(&hdev->lock);
>         mutex_init(&hdev->req_lock);
>
> +       ida_init(&hdev->unset_handle_ida);
> +
>         INIT_LIST_HEAD(&hdev->mesh_pending);
>         INIT_LIST_HEAD(&hdev->mgmt_pending);
>         INIT_LIST_HEAD(&hdev->reject_list);
> @@ -2789,6 +2791,7 @@ void hci_release_dev(struct hci_dev *hdev)
>         hci_codec_list_clear(&hdev->local_codecs);
>         hci_dev_unlock(hdev);
>
> +       ida_destroy(&hdev->unset_handle_ida);
>         ida_simple_remove(&hci_index_ida, hdev->id);
>         kfree_skb(hdev->sent_cmd);
>         kfree_skb(hdev->recv_event);
> --
> 2.25.1
>


--=20
Luiz Augusto von Dentz
