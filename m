Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06A8C6A6552
	for <lists+linux-bluetooth@lfdr.de>; Wed,  1 Mar 2023 03:12:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbjCACMQ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 28 Feb 2023 21:12:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbjCACMP (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 28 Feb 2023 21:12:15 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22F34367D7
        for <linux-bluetooth@vger.kernel.org>; Tue, 28 Feb 2023 18:12:11 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id c2-20020a9d6842000000b0068bc93e7e34so6767191oto.4
        for <linux-bluetooth@vger.kernel.org>; Tue, 28 Feb 2023 18:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1677636730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mJqBoB/RasR5gtijI/jnSkUAz2BkidpYh3sfu2pzMM=;
        b=PAcBwU1xISVf9SONwn9/49J9KdjdUbIWtAhof0ALVrrd7xf6Y24Kj8H1jzaDuPNiMs
         YregHHthoHVt3/HZaB4ALnR3UMJnr2vIPwLiRst23FZdM+ZQ1f8zvNn59KlveqJdQQ6G
         Z4gSfSxsGqwKSwaYd8pM9Bk7ToDtKwKL8PTELOAUigBa0jmBxP2PnNDaJPOayYqSopsu
         hrghsAK7c/SUWlo8xXUuqy9IYmWDIuWOfOFHfHLD0PJIkXmrYbWPu1FMiCOEwE2zyO/H
         UIkmGTfaJlLQKSLJFPuD2UZyUo68Dab3b9oQXrr9WxcuXvZvf9WD6HvCtTQcuXkFnCam
         lG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677636730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1mJqBoB/RasR5gtijI/jnSkUAz2BkidpYh3sfu2pzMM=;
        b=8OLAbPTlYz99OFpHTP90VNklvAWbfMJHtKemwLNqkkJ/GDSBL5+nQWX4f5KQrE9eNA
         RM6FtPtGHVCsnX0kBoKEQm5Ck2QPshQFcKhFxWIRXqdtomqCqkzFG2zqqXzPFPdg0WF1
         L9DfFeDXMrzeA3KGa0UbXarIINRP2XHjslg5gKS52ID74dderxWlwnBCdrrjCXji0s8M
         OjRK69ImjVTS2FxfCFvzCt1oHARdRiStKlsgGjFOaoDhLAHVJIQ8Z9i7LVL23ZhjowxB
         PJO5D/agbNPCKr3f2481vUHOIa+bzqo6NyXTWnfW0nShCctVDHuo4TIYiAZcboE0VlJ5
         BYyg==
X-Gm-Message-State: AO0yUKUuFkwJh6WYamxixCv7jWXtFAJMQ29YWYI4e5sWlOjHlrm0l1ds
        8TKe8eosFPrnSpt+9N+VeEubST0rPCC03SyeE6rCiA==
X-Google-Smtp-Source: AK7set/A4z1FE3KDPYCmfRS8UGyF6L/pRuZZdTeVgetNQlhBj80fWP4lZ5v6khhztOwXbXVZ06B/KdYMhZlAvDbDtGM=
X-Received: by 2002:a9d:7082:0:b0:688:cfcc:ddb1 with SMTP id
 l2-20020a9d7082000000b00688cfccddb1mr1673676otj.5.1677636730164; Tue, 28 Feb
 2023 18:12:10 -0800 (PST)
MIME-Version: 1.0
References: <20230224195313.1877313-1-jiangzp@google.com> <20230224115310.kernel.v2.1.If0578b001c1f12567f2ebcac5856507f1adee745@changeid>
 <CABBYNZ+yVWssa09NB+ahp-N87sLXRqYF58-GJK-Vx8jn-Sa5Uw@mail.gmail.com>
 <CAB4PzUrO32Z1AF-3UJviYqTr3YvachGgJ7NiqkNW46ioWigtfw@mail.gmail.com>
 <CAB4PzUoErDkUzyj6sFQc_CSa7hibucX42yY+oVGw7C4DcJdQFA@mail.gmail.com>
 <CABBYNZL=u88Ro1dR8fYWpiS6E1sZ4E8TXg8BVU7nEGBodYhTrA@mail.gmail.com>
 <CAB4PzUr9vE2m-uWVvcTa0SaeryLxhj8sZbvRqSkqLKDFwMoeyQ@mail.gmail.com>
 <CABBYNZKVc3F_GdSfYTtXcQm9jGXkZJGBh3xV8eSxGkA4iKooGQ@mail.gmail.com>
 <CAB4PzUpw7dqguZNuk45pk1sGvAtBabRqm1vuGNW_kPvHpgc=FA@mail.gmail.com> <CABBYNZLvdCA3Nn7CduBxb0y5FcmnuUxgthtuWjrR89VkGn97ZQ@mail.gmail.com>
In-Reply-To: <CABBYNZLvdCA3Nn7CduBxb0y5FcmnuUxgthtuWjrR89VkGn97ZQ@mail.gmail.com>
From:   Zhengping Jiang <jiangzp@google.com>
Date:   Tue, 28 Feb 2023 18:11:59 -0800
Message-ID: <CAB4PzUpDMvdc8j2MdeSAy1KkAE-D3woprCwAdYWeOc-3v3c9Sw@mail.gmail.com>
Subject: Re: [kernel PATCH v2 1/1] Bluetooth: hci_sync: clear workqueue before
 clear mgmt cmd
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org, marcel@holtmann.org,
        mmandlik@google.com, chromeos-bluetooth-upstreaming@chromium.org,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

Thanks for testing these options!

> perhaps we need a dedicated flag to ensure cmd_sync cannot be schedule af=
ter a certain point
This actually sounds promising to me. I would think about this.

This does not happen in regular use, but one of our customers has a
script to run a stress test by turning on/off the adapter and
rebooting for a few cycles. Then the crash can be reproduced. If you
have any new ideas, I can schedule a test.

Just to confirm if you will submit the current patch or you would hold
it for a solid solution? The current patch to clear the cmd_sync list
indeed reduces the crash frequency.

Best,
Zhengping

On Tue, Feb 28, 2023 at 5:53=E2=80=AFPM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Zhengping,
>
> On Tue, Feb 28, 2023 at 4:18=E2=80=AFPM Zhengping Jiang <jiangzp@google.c=
om> wrote:
> >
> > Hi Luiz,
> >
> > This looks good to me. I still have a question. Does this prevent a
> > job scheduled between "hci_cmd_sync_work_list_clear(hdev);" and
> > "__mgmt_power_off(hdev);"? Otherwise, the chance for a race condition
> > is still there. Maybe using cancel_work_sync and re-init the workqueue
> > timer is the right thing to do?
>
> I tried the cancel_work_sync but it doesn't work since to
> cmd_sync_work itself can call hci_dev_close_sync so it deadlocks, Ive
> also tried stopping new scheduling of new work based on HCI_UP flag
> but that causes some tests not to run, perhaps we need a dedicated
> flag to ensure cmd_sync cannot be schedule after a certain point but I
> could found the exact point it is, anyway I fine leaving this to when
> we actually have a more clear understanding or a reproducer.
>
> > Thanks,
> > Zhengping
> >
> > On Tue, Feb 28, 2023 at 1:11=E2=80=AFPM Luiz Augusto von Dentz
> > <luiz.dentz@gmail.com> wrote:
> > >
> > > Hi Zhengping,
> > >
> > > On Mon, Feb 27, 2023 at 3:58=E2=80=AFPM Zhengping Jiang <jiangzp@goog=
le.com> wrote:
> > > >
> > > > Hi Luiz,
> > > >
> > > > Sure. Hope this helps.
> > > > Here is one log from the user.
> > > >
> > > > [   53.368740] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [   53.376167] BUG: KASAN: use-after-free in set_ssp_sync+0x44/0x15=
4 [bluetooth]
> > > > [   53.384303] Read of size 8 at addr ffffff80b7ee0318 by task kwor=
ker/u17:0/190
> > > > [   53.396342] CPU: 7 PID: 190 Comm: kworker/u17:0 Tainted: G      =
  W
> > > >         5.15.59-lockdep #1 29eed131ef0afd42bc369a6a0ca1c69d3653699b
> > > > [   53.408868] Hardware name: Qualcomm Technologies, Inc. sc7280 CR=
D
> > > > platform (rev5+) (DT)
> > > > [   53.417095] Workqueue: hci0 hci_cmd_sync_work [bluetooth]
> > > > [   53.422780] Call trace:
> > > > [   53.425310]  dump_backtrace+0x0/0x424
> > > > [   53.429108]  show_stack+0x20/0x2c
> > > >
> > > > [   53.432534]  dump_stack_lvl+0x84/0xb4
> > > > [   53.436514]  print_address_description+0x30/0x2fc
> > > > [   53.441369]  kasan_report+0x15c/0x19c
> > > > [   53.445975]  __asan_report_load8_noabort+0x44/0x50
> > > > [   53.450910]  set_ssp_sync+0x44/0x154 [bluetooth
> > > > 34f6fa2bbf49f3d7faf6ea04e8755ae16590a6b3]
> > > > [   53.460136]  hci_cmd_sync_work+0x1c8/0x2c8 [bluetooth
> > > > 34f6fa2bbf49f3d7faf6ea04e8755ae16590a6b3]
> > > > [   53.472214]  process_one_work+0x59c/0xa88
> > > > [   53.476990]  worker_thread+0x81c/0xd18
> > > > [   53.480854]  kthread+0x2d4/0x3d8
> > > > [   53.484272]  ret_from_fork+0x10/0x20
> > > >
> > > > [   53.489733] Allocated by task 1162:
> > > > [   53.493336]  kasan_save_stack+0x38/0x68
> > > > [   53.498115]  __kasan_kmalloc+0xb4/0xd0
> > > > [   53.501993]  kmem_cache_alloc_trace+0x29c/0x374
> > > > [   53.506661]  mgmt_pending_new+0x74/0x200 [bluetooth]
> > > > [   53.511905]  mgmt_pending_add+0x28/0xec [bluetooth]
> > > > [   53.517059]  set_ssp+0x2d8/0x5b0 [bluetooth]
> > > > [   53.521575]  hci_mgmt_cmd+0x5c4/0x8b0 [bluetooth]
> > > > [   53.526538]  hci_sock_sendmsg+0x28c/0x95c [bluetooth]
> > > > [   53.531850]  sock_sendmsg+0xb4/0xd8
> > > > [   53.535454]  sock_write_iter+0x1c0/0x2d0
> > > > [   53.539494]  do_iter_readv_writev+0x350/0x4e0
> > > > [   53.543980]  do_iter_write+0xf0/0x2e4
> > > > [   53.547747]  vfs_writev+0xd0/0x13c
> > > > [   53.551254]  do_writev+0xe8/0x1fc
> > > > [   53.554672]  __arm64_sys_writev+0x84/0x98
> > > > [   53.558805]  invoke_syscall+0x78/0x20c
> > > > [   53.562665]  el0_svc_common+0x12c/0x2f0
> > > > [   53.566618]  do_el0_svc+0x94/0x13c
> > > > [   53.570125]  el0_svc+0x5c/0x108
> > > > [   53.573374]  el0t_64_sync_handler+0x78/0x108
> > > > [   53.577773]  el0t_64_sync+0x1a4/0x1a8
> > > >
> > > > [   53.583089] Freed by task 3207:
> > > > [   53.586325]  kasan_save_stack+0x38/0x68
> > > > [   53.590282]  kasan_set_track+0x28/0x3c
> > > > [   53.594153]  kasan_set_free_info+0x28/0x4c
> > > > [   53.598369]  ____kasan_slab_free+0x138/0x17c
> > > > [   53.602767]  __kasan_slab_free+0x18/0x28
> > > > [   53.606803]  slab_free_freelist_hook+0x188/0x260
> > > > [   53.611559]  kfree+0x138/0x29c
> > > > [   53.614708]  mgmt_pending_free+0xac/0xdc [bluetooth]
> > > > [   53.619948]  mgmt_pending_remove+0xd8/0xf0 [bluetooth]
> > > > [   53.625357]  cmd_complete_rsp+0xc8/0x178 [bluetooth]
> > > > [   53.630586]  mgmt_pending_foreach+0xa8/0xf8 [bluetooth]
> > > > [   53.636076]  __mgmt_power_off+0x114/0x26c [bluetooth]
> > > > [   53.641390]  hci_dev_close_sync+0x314/0x814 [bluetooth]
> > > > [   53.646882]  hci_dev_do_close+0x3c/0x7c [bluetooth]
> > > > [   53.652017]  hci_dev_close+0xa4/0x15c [bluetooth]
> > > > [   53.656980]  hci_sock_ioctl+0x298/0x444 [bluetooth]
> > > > [   53.662117]  sock_do_ioctl+0xd0/0x1e8
> > > > [   53.665900]  sock_ioctl+0x4fc/0x72c
> > > > [   53.669500]  __arm64_sys_ioctl+0x118/0x154
> > > > [   53.673726]  invoke_syscall+0x78/0x20c
> > > > [   53.677587]  el0_svc_common+0x12c/0x2f0
> > > > [   53.681533]  do_el0_svc+0x94/0x13c
> > > > [   53.685043]  el0_svc+0x5c/0x108
> > > > [   53.688278]  el0t_64_sync_handler+0x78/0x108
> > > > [   53.692677]  el0t_64_sync+0x1a4/0x1a8
> > > >
> > > > [   53.697988] Last potentially related work creation:
> > > > [   53.703009]  kasan_save_stack+0x38/0x68
> > > > [   53.706962]  kasan_record_aux_stack+0x104/0x130
> > > > [   53.711622]  __call_rcu+0x14c/0x860
> > > > [   53.715212]  call_rcu+0x18/0x24
> > > > [   53.718448]  sk_filter_uncharge+0xc0/0x120
> > > > [   53.722667]  __sk_destruct+0xb4/0x4a8
> > > > [   53.726435]  sk_destruct+0x78/0xa0
> > > > [   53.729941]  __sk_free+0x190/0x270
> > > > [   53.733453]  sk_free+0x54/0x8c
> > > > [   53.736603]  deferred_put_nlk_sk+0x1d4/0x20c
> > > > [   53.741000]  rcu_do_batch+0x3e8/0xd08
> > > > [   53.744772]  nocb_cb_wait+0xc8/0xa3c
> > > > [   53.748453]  rcu_nocb_cb_kthread+0x48/0x134
> > > > [   53.752768]  kthread+0x2d4/0x3d8
> > > > [   53.756098]  ret_from_fork+0x10/0x20
> > > >
> > > > This is another one at a different function but with the same signa=
ture.
> > > >
> > > > [   43.363512] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [   43.370966] BUG: KASAN: use-after-free in
> > > > mgmt_remove_adv_monitor_sync+0x40/0xcc [bluetooth]
> > > > [   43.379813] Read of size 8 at addr ffffff8096c28d18 by task kwor=
ker/u17:0/192
> > > > [   43.387158]
> > > > [   43.388705] CPU: 6 PID: 192 Comm: kworker/u17:0 Tainted: G      =
  W
> > > >         5.15.59-lockdep #1 59f35e3dfc07f6688b084869895c7a39892c891a
> > > > localhost ~ # [   43.410184] Workqueue: hci0 hci_cmd_sync_work [blu=
etooth]
> > > >
> > > > [   43.418887] Call trace:
> > > > [   43.422407]  dump_backtrace+0x0/0x424
> > > > [   43.426191]  show_stack+0x20/0x2c
> > > > [   43.429608]  dump_stack_lvl+0x84/0xb4
> > > > [   43.433395]  print_address_description+0x30/0x2fc
> > > > [   43.438243]  kasan_report+0x15c/0x19c
> > > > [   43.442070]  __asan_report_load8_noabort+0x44/0x50
> > > > hciconfig hci0 up
> > > > [   43.447009]  mgmt_remove_adv_monitor_sync+0x40/0xcc [bluetooth
> > > > 8dae3a82177133cfa9626e7322b3b0c8f665102d]
> > > > [   43.458568]  hci_cmd_sync_work+0x1bc/0x2bc [bluetooth
> > > > 8dae3a82177133cfa9626e7322b3b0c8f665102d]
> > > > [   43.467656]  process_one_work+0x59c/0xa88
> > > > [   43.472530]  worker_thread+0x81c/0xd18
> > > > [   43.476410]  kthread+0x2d4/0x3d8
> > > > localhost ~ # [   43.479753]  ret_from_fork+0x10/0x20
> > > > [   43.486588]
> > > > [   43.488156] Allocated by task 1118:
> > > > [   43.491751]  kasan_save_stack+0x38/0x68
> > > > [   43.495709]  __kasan_kmalloc+0xb4/0xd0
> > > > [   43.499577]  kmem_cache_alloc_trace+0x29c/0x374
> > > > [   43.504238]  mgmt_pending_new+0x74/0x200 [bluetooth]
> > > > sleep 2[   43.509509]  mgmt_pending_add+0x28/0xec [bluetooth]
> > > >
> > > > [   43.515244]  remove_adv_monitor+0xf8/0x174 [bluetooth]
> > > > [   43.521533]  hci_mgmt_cmd+0x5c4/0x8b0 [bluetooth]
> > > > [   43.526527]  hci_sock_sendmsg+0x28c/0x95c [bluetooth]
> > > > [   43.531873]  sock_sendmsg+0xb4/0xd8
> > > > [   43.535472]  sock_write_iter+0x1c0/0x2d0
> > > > [   43.539519]  do_iter_readv_writev+0x350/0x4e0
> > > > [   43.544012]  do_iter_write+0xf0/0x2e4
> > > > [   43.547788]  vfs_writev+0xd0/0x13c
> > > > [   43.551295]  do_writev+0xe8/0x1fc
> > > > [   43.554710]  __arm64_sys_writev+0x84/0x98
> > > > [   43.558838]  invoke_syscall+0x78/0x20c
> > > > [   43.562709]  el0_svc_common+0x12c/0x2f0
> > > > [   43.566654]  do_el0_svc+0x94/0x13c
> > > > [   43.570155]  el0_svc+0x5c/0x108
> > > > [   43.573391]  el0t_64_sync_handler+0x78/0x108
> > > > [   43.577785]  el0t_64_sync+0x1a4/0x1a8
> > > > [   43.581564]
> > > > [   43.583115] Freed by task 3217:
> > > > [   43.586356]  kasan_save_stack+0x38/0x68
> > > > [   43.590314]  kasan_set_track+0x28/0x3c
> > > > [   43.594180]  kasan_set_free_info+0x28/0x4c
> > > > [   43.598396]  ____kasan_slab_free+0x138/0x17c
> > > > [   43.602794]  __kasan_slab_free+0x18/0x28
> > > > [   43.606838]  slab_free_freelist_hook+0x188/0x260
> > > > [   43.611591]  kfree+0x138/0x29c
> > > > [   43.614741]  mgmt_pending_free+0xac/0xdc [bluetooth]
> > > > [   43.620003]  mgmt_pending_remove+0xd8/0xf0 [bluetooth]
> > > > [   43.625434]  cmd_complete_rsp+0xc8/0x178 [bluetooth]
> > > > [   43.630686]  mgmt_pending_foreach+0xa8/0xf8 [bluetooth]
> > > > [   43.636198]  __mgmt_power_off+0x114/0x26c [bluetooth]
> > > > [   43.641532]  hci_dev_close_sync+0x2ec/0x7ec [bluetooth]
> > > > [   43.647049]  hci_dev_do_close+0x3c/0x7c [bluetooth]
> > > > [   43.652209]  hci_dev_close+0xac/0x164 [bluetooth]
> > > > [   43.657190]  hci_sock_ioctl+0x298/0x444 [bluetooth]
> > > > [   43.662353]  sock_do_ioctl+0xd0/0x1e8
> > > > [   43.666134]  sock_ioctl+0x4fc/0x72c
> > > > [   43.669736]  __arm64_sys_ioctl+0x118/0x154
> > > > [   43.673961]  invoke_syscall+0x78/0x20c
> > > > [   43.677820]  el0_svc_common+0x12c/0x2f0
> > > > [   43.681770]  do_el0_svc+0x94/0x13c
> > > > [   43.685278]  el0_svc+0x5c/0x108
> > > > [   43.688514]  el0t_64_sync_handler+0x78/0x108
> > > > [   43.692913]  el0t_64_sync+0x1a4/0x1a8
> > > >
> > > > Thanks,
> > > > Zhengping
> > >
> > > Ok, how about we do something like the following:
> > >
> > > https://gist.github.com/Vudentz/365d664275e4d2e2af157e47f0502f50
> > >
> > > The actual real culprit seem to be __mgmt_power_off does cleanup
> > > mgmt_pending but that is still accessible via cmd_sync_work_list, thi=
s
> > > is probably how hci_request was designed but in case of cmd_sync we
> > > normally have the data as part of cmd_sync_work_list.
> > >
> > > > On Mon, Feb 27, 2023 at 3:41=E2=80=AFPM Luiz Augusto von Dentz
> > > > <luiz.dentz@gmail.com> wrote:
> > > > >
> > > > > Hi Zhengping,
> > > > >
> > > > > On Sun, Feb 26, 2023 at 11:18=E2=80=AFPM Zhengping Jiang <jiangzp=
@google.com> wrote:
> > > > > >
> > > > > > Hi Luiz,
> > > > > >
> > > > > > I have a question. Given that each command in the cmd_sync queu=
e
> > > > > > should clean up the memory in a callback function. I was wonder=
ing if
> > > > > > the call to cmd_complete_rsp in __mgmt_power_off function is st=
ill
> > > > > > necessary? Will this always risk a race condition that cmd has =
been
> > > > > > released when the complete callback or _sync function is run?
> > > > >
> > > > > Not sure I follow you here, do you have a stack trace when the us=
er
> > > > > after free occurs?
> > > > >
> > > > > > Thanks,
> > > > > > Zhengping
> > > > > >
> > > > > > On Fri, Feb 24, 2023 at 2:37=E2=80=AFPM Zhengping Jiang <jiangz=
p@google.com> wrote:
> > > > > > >
> > > > > > > Hi Luiz,
> > > > > > >
> > > > > > > > Any particular reason why you are not using hci_cmd_sync_cl=
ear
> > > > > > > > instead?
> > > > > > >
> > > > > > > That is a good question and we used hci_cmd_sync_clear in the=
 first
> > > > > > > version, but it will clear the queue and also close the timer=
. As a
> > > > > > > result, when the adapter is turned on again, the timer will n=
ot
> > > > > > > schedule any new jobs. So the option is to use hci_cmd_sync_c=
lear and
> > > > > > > re-initiate the queue or to write a new function which only c=
lears the
> > > > > > > queue.
> > > > > > >
> > > > > > > > We also may want to move the clearing logic to
> > > > > > > > hci_dev_close_sync since it should be equivalent to
> > > > > > > > hci_request_cancel_all.
> > > > > > >
> > > > > > > I actually have a question here. I saw
> > > > > > > "drain_workqueue(hdev->workqueue)" in hci_dev_close_sync and =
thought
> > > > > > > it should force clearing the cmd_sync queue. But it seems can=
not
> > > > > > > prevent the use-after-free situation.
> > > > > > >
> > > > > > > Any suggestions to improve the solution?
> > > > > > >
> > > > > > > Thanks,
> > > > > > > Zhengping
> > > > > > >
> > > > > > >
> > > > > > > On Fri, Feb 24, 2023 at 1:02 PM Luiz Augusto von Dentz
> > > > > > > <luiz.dentz@gmail.com> wrote:
> > > > > > > >
> > > > > > > > Hi Zhengping,
> > > > > > > >
> > > > > > > > On Fri, Feb 24, 2023 at 11:53 AM Zhengping Jiang <jiangzp@g=
oogle.com> wrote:
> > > > > > > > >
> > > > > > > > > Clear cmd_sync_work queue before clearing the mgmt cmd li=
st to avoid
> > > > > > > > > racing conditions which cause use-after-free.
> > > > > > > > >
> > > > > > > > > When powering off the adapter, the mgmt cmd list will be =
cleared. If a
> > > > > > > > > work is queued in the cmd_sync_work queue at the same tim=
e, it will
> > > > > > > > > cause the risk of use-after-free, as the cmd pointer is n=
ot checked
> > > > > > > > > before use.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Zhengping Jiang <jiangzp@google.com>
> > > > > > > > > ---
> > > > > > > > >
> > > > > > > > > Changes in v2:
> > > > > > > > > - Add function to clear the queue without stop the timer
> > > > > > > > >
> > > > > > > > > Changes in v1:
> > > > > > > > > - Clear cmd_sync_work queue before clearing the mgmt cmd =
list
> > > > > > > > >
> > > > > > > > >  net/bluetooth/hci_sync.c | 21 ++++++++++++++++++++-
> > > > > > > > >  1 file changed, 20 insertions(+), 1 deletion(-)
> > > > > > > > >
> > > > > > > > > diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci=
_sync.c
> > > > > > > > > index 117eedb6f709..b70365dfff0c 100644
> > > > > > > > > --- a/net/bluetooth/hci_sync.c
> > > > > > > > > +++ b/net/bluetooth/hci_sync.c
> > > > > > > > > @@ -636,6 +636,23 @@ void hci_cmd_sync_init(struct hci_de=
v *hdev)
> > > > > > > > >         INIT_DELAYED_WORK(&hdev->adv_instance_expire, adv=
_timeout_expire);
> > > > > > > > >  }
> > > > > > > > >
> > > > > > > > > +static void hci_pend_cmd_sync_clear(struct hci_dev *hdev=
)
> > > > > > > > > +{
> > > > > > > > > +       struct hci_cmd_sync_work_entry *entry, *tmp;
> > > > > > > > > +
> > > > > > > > > +       mutex_lock(&hdev->cmd_sync_work_lock);
> > > > > > > > > +       list_for_each_entry_safe(entry, tmp, &hdev->cmd_s=
ync_work_list, list) {
> > > > > > > > > +               if (entry->destroy) {
> > > > > > > > > +                       hci_req_sync_lock(hdev);
> > > > > > > > > +                       entry->destroy(hdev, entry->data,=
 -ECANCELED);
> > > > > > > > > +                       hci_req_sync_unlock(hdev);
> > > > > > > > > +               }
> > > > > > > > > +               list_del(&entry->list);
> > > > > > > > > +               kfree(entry);
> > > > > > > > > +       }
> > > > > > > > > +       mutex_unlock(&hdev->cmd_sync_work_lock);
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > >  void hci_cmd_sync_clear(struct hci_dev *hdev)
> > > > > > > > >  {
> > > > > > > > >         struct hci_cmd_sync_work_entry *entry, *tmp;
> > > > > > > > > @@ -4842,8 +4859,10 @@ int hci_dev_close_sync(struct hci_=
dev *hdev)
> > > > > > > > >
> > > > > > > > >         if (!auto_off && hdev->dev_type =3D=3D HCI_PRIMAR=
Y &&
> > > > > > > > >             !hci_dev_test_flag(hdev, HCI_USER_CHANNEL) &&
> > > > > > > > > -           hci_dev_test_flag(hdev, HCI_MGMT))
> > > > > > > > > +           hci_dev_test_flag(hdev, HCI_MGMT)) {
> > > > > > > > > +               hci_pend_cmd_sync_clear(hdev);
> > > > > > > >
> > > > > > > > Any particular reason why you are not using hci_cmd_sync_cl=
ear
> > > > > > > > instead? We also may want to move the clearing logic to
> > > > > > > > hci_dev_close_sync since it should be equivalent to
> > > > > > > > hci_request_cancel_all.
> > > > > > > >
> > > > > > > > >                 __mgmt_power_off(hdev);
> > > > > > > > > +       }
> > > > > > > > >
> > > > > > > > >         hci_inquiry_cache_flush(hdev);
> > > > > > > > >         hci_pend_le_actions_clear(hdev);
> > > > > > > > > --
> > > > > > > > > 2.39.2.722.g9855ee24e9-goog
> > > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > > --
> > > > > > > > Luiz Augusto von Dentz
> > > > >
> > > > >
> > > > >
> > > > > --
> > > > > Luiz Augusto von Dentz
> > >
> > >
> > >
> > > --
> > > Luiz Augusto von Dentz
>
>
>
> --
> Luiz Augusto von Dentz
