Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8A5544C2EA
	for <lists+linux-bluetooth@lfdr.de>; Wed, 10 Nov 2021 15:26:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232057AbhKJO3f (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 10 Nov 2021 09:29:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231703AbhKJO3f (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 10 Nov 2021 09:29:35 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2405FC061767
        for <linux-bluetooth@vger.kernel.org>; Wed, 10 Nov 2021 06:26:47 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id y26so6358702lfa.11
        for <linux-bluetooth@vger.kernel.org>; Wed, 10 Nov 2021 06:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9FWzObXWkxZ00FTVodpTHaHUQppRVXkFK8NaBrCslw4=;
        b=X8SwZm50UKqs1JK5r2eucravEih4E/qyFL7J4EWTyR6fCtYT2KYqcfsLJrayaKiGac
         cdPgtZ5tjC7tza1AwL/XVv/nZYCjtGDp9b7eCmXCgO0Yl83t6AATbDcgm0koIE0GA/er
         NXOQwU7Nss6u/mLnRS18B7AAp5JEdnqE38bu6naSRRn+78JqM/vlRH88ghTi8Lu6LC/7
         FwNJ2Plk2gR0r6XaZ8moTWkr9mCTvpXp3TcoiY2AnkQm9EssIS0Mri/+d0yqA6g8US3h
         8QUA2CJRW9Eh+/4F0e5wjV+VPiQERpruBNGVEnsvx4TlUYobugFEENHCezxdGhkHUZZ/
         wJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9FWzObXWkxZ00FTVodpTHaHUQppRVXkFK8NaBrCslw4=;
        b=alceUIqVXQJCLZh4p946TIZu8qO5ruTJDsg3qM8Qtv+cdL//w6LbJUzKl51C/fkXMt
         3TjdvkO1L7NYhEhh1zBh9bSYqkDukQBOyUzorbsmzyBh45+7lZ97/WL4Kpkxuoexz1xG
         dQzW1pYONG5/H1mtXFnK4FsKA6x5OR/g7DyCzzEf4dkHB2YngUtbu/Z0+g6MlBb2wKWX
         TPFbUU8iT3pltWZRPWqcU0cYdJCXNtzANppNRqB8SXmy1T0B8fmlnRc2qiWMNLxxp9wl
         U493tz3cqKGhzXDRowvCpIbtnX0zrc/IlfY+DJ259m9nzFZo+zmob2x33z85pIESX8A2
         +4dQ==
X-Gm-Message-State: AOAM533rCeXodX/pjdGlsPPed75QKuAKe9ccKxhf8p4FB/capGh9bkmp
        FWrbQA2xR/WGPrmCqQezl96ipdZzf9YtixVobv3L7A==
X-Google-Smtp-Source: ABdhPJwaMFXLX52HLWZOdQi9gGoWswguHU1Gtn1RNR1SZYCVAKZN0CBcv6CQONZTngK+Ad8GLAri6TEste9ck2pUaU4=
X-Received: by 2002:a05:6512:1113:: with SMTP id l19mr156610lfg.184.1636554405250;
 Wed, 10 Nov 2021 06:26:45 -0800 (PST)
MIME-Version: 1.0
References: <4693240.31r3eYUQgx@kreacher>
In-Reply-To: <4693240.31r3eYUQgx@kreacher>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 10 Nov 2021 15:26:08 +0100
Message-ID: <CAPDyKFr0c8zxrmTQYs1SWGc9GjyYQaQCQ0ty7LhgqKSfC9xrZw@mail.gmail.com>
Subject: Re: [PATCH] PM: sleep: Avoid calling put_device() under dpm_list_mtx
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux PM <linux-pm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-bluetooth@vger.kernel.org,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Thu, 4 Nov 2021 at 18:26, Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
>
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>
> It is generally unsafe to call put_device() with dpm_list_mtx held,
> because the given device's release routine may carry out an action
> depending on that lock which then may deadlock, so modify the
> system-wide suspend and resume of devices to always drop dpm_list_mtx
> before calling put_device() (and adjust white space somewhat while
> at it).
>
> For instance, this prevents the following splat from showing up in
> the kernel log after a system resume in certain configurations:
>
> [ 3290.969514] ======================================================
> [ 3290.969517] WARNING: possible circular locking dependency detected
> [ 3290.969519] 5.15.0+ #2420 Tainted: G S
> [ 3290.969523] ------------------------------------------------------
> [ 3290.969525] systemd-sleep/4553 is trying to acquire lock:
> [ 3290.969529] ffff888117ab1138 ((wq_completion)hci0#2){+.+.}-{0:0}, at: flush_workqueue+0x87/0x4a0
> [ 3290.969554]
>                but task is already holding lock:
> [ 3290.969556] ffffffff8280fca8 (dpm_list_mtx){+.+.}-{3:3}, at: dpm_resume+0x12e/0x3e0
> [ 3290.969571]
>                which lock already depends on the new lock.
>
> [ 3290.969573]
>                the existing dependency chain (in reverse order) is:
> [ 3290.969575]
>                -> #3 (dpm_list_mtx){+.+.}-{3:3}:
> [ 3290.969583]        __mutex_lock+0x9d/0xa30
> [ 3290.969591]        device_pm_add+0x2e/0xe0
> [ 3290.969597]        device_add+0x4d5/0x8f0
> [ 3290.969605]        hci_conn_add_sysfs+0x43/0xb0 [bluetooth]
> [ 3290.969689]        hci_conn_complete_evt.isra.71+0x124/0x750 [bluetooth]
> [ 3290.969747]        hci_event_packet+0xd6c/0x28a0 [bluetooth]
> [ 3290.969798]        hci_rx_work+0x213/0x640 [bluetooth]
> [ 3290.969842]        process_one_work+0x2aa/0x650
> [ 3290.969851]        worker_thread+0x39/0x400
> [ 3290.969859]        kthread+0x142/0x170
> [ 3290.969865]        ret_from_fork+0x22/0x30
> [ 3290.969872]
>                -> #2 (&hdev->lock){+.+.}-{3:3}:
> [ 3290.969881]        __mutex_lock+0x9d/0xa30
> [ 3290.969887]        hci_event_packet+0xba/0x28a0 [bluetooth]
> [ 3290.969935]        hci_rx_work+0x213/0x640 [bluetooth]
> [ 3290.969978]        process_one_work+0x2aa/0x650
> [ 3290.969985]        worker_thread+0x39/0x400
> [ 3290.969993]        kthread+0x142/0x170
> [ 3290.969999]        ret_from_fork+0x22/0x30
> [ 3290.970004]
>                -> #1 ((work_completion)(&hdev->rx_work)){+.+.}-{0:0}:
> [ 3290.970013]        process_one_work+0x27d/0x650
> [ 3290.970020]        worker_thread+0x39/0x400
> [ 3290.970028]        kthread+0x142/0x170
> [ 3290.970033]        ret_from_fork+0x22/0x30
> [ 3290.970038]
>                -> #0 ((wq_completion)hci0#2){+.+.}-{0:0}:
> [ 3290.970047]        __lock_acquire+0x15cb/0x1b50
> [ 3290.970054]        lock_acquire+0x26c/0x300
> [ 3290.970059]        flush_workqueue+0xae/0x4a0
> [ 3290.970066]        drain_workqueue+0xa1/0x130
> [ 3290.970073]        destroy_workqueue+0x34/0x1f0
> [ 3290.970081]        hci_release_dev+0x49/0x180 [bluetooth]
> [ 3290.970130]        bt_host_release+0x1d/0x30 [bluetooth]
> [ 3290.970195]        device_release+0x33/0x90
> [ 3290.970201]        kobject_release+0x63/0x160
> [ 3290.970211]        dpm_resume+0x164/0x3e0
> [ 3290.970215]        dpm_resume_end+0xd/0x20
> [ 3290.970220]        suspend_devices_and_enter+0x1a4/0xba0
> [ 3290.970229]        pm_suspend+0x26b/0x310
> [ 3290.970236]        state_store+0x42/0x90
> [ 3290.970243]        kernfs_fop_write_iter+0x135/0x1b0
> [ 3290.970251]        new_sync_write+0x125/0x1c0
> [ 3290.970257]        vfs_write+0x360/0x3c0
> [ 3290.970263]        ksys_write+0xa7/0xe0
> [ 3290.970269]        do_syscall_64+0x3a/0x80
> [ 3290.970276]        entry_SYSCALL_64_after_hwframe+0x44/0xae
> [ 3290.970284]
>                other info that might help us debug this:
>
> [ 3290.970285] Chain exists of:
>                  (wq_completion)hci0#2 --> &hdev->lock --> dpm_list_mtx
>
> [ 3290.970297]  Possible unsafe locking scenario:
>
> [ 3290.970299]        CPU0                    CPU1
> [ 3290.970300]        ----                    ----
> [ 3290.970302]   lock(dpm_list_mtx);
> [ 3290.970306]                                lock(&hdev->lock);
> [ 3290.970310]                                lock(dpm_list_mtx);
> [ 3290.970314]   lock((wq_completion)hci0#2);
> [ 3290.970319]
>                 *** DEADLOCK ***
>
> [ 3290.970321] 7 locks held by systemd-sleep/4553:
> [ 3290.970325]  #0: ffff888103bcd448 (sb_writers#4){.+.+}-{0:0}, at: ksys_write+0xa7/0xe0
> [ 3290.970341]  #1: ffff888115a14488 (&of->mutex){+.+.}-{3:3}, at: kernfs_fop_write_iter+0x103/0x1b0
> [ 3290.970355]  #2: ffff888100f719e0 (kn->active#233){.+.+}-{0:0}, at: kernfs_fop_write_iter+0x10c/0x1b0
> [ 3290.970369]  #3: ffffffff82661048 (autosleep_lock){+.+.}-{3:3}, at: state_store+0x12/0x90
> [ 3290.970384]  #4: ffffffff82658ac8 (system_transition_mutex){+.+.}-{3:3}, at: pm_suspend+0x9f/0x310
> [ 3290.970399]  #5: ffffffff827f2a48 (acpi_scan_lock){+.+.}-{3:3}, at: acpi_suspend_begin+0x4c/0x80
> [ 3290.970416]  #6: ffffffff8280fca8 (dpm_list_mtx){+.+.}-{3:3}, at: dpm_resume+0x12e/0x3e0
> [ 3290.970428]
>                stack backtrace:
> [ 3290.970431] CPU: 3 PID: 4553 Comm: systemd-sleep Tainted: G S                5.15.0+ #2420
> [ 3290.970438] Hardware name: Dell Inc. XPS 13 9380/0RYJWW, BIOS 1.5.0 06/03/2019
> [ 3290.970441] Call Trace:
> [ 3290.970446]  dump_stack_lvl+0x44/0x57
> [ 3290.970454]  check_noncircular+0x105/0x120
> [ 3290.970468]  ? __lock_acquire+0x15cb/0x1b50
> [ 3290.970474]  __lock_acquire+0x15cb/0x1b50
> [ 3290.970487]  lock_acquire+0x26c/0x300
> [ 3290.970493]  ? flush_workqueue+0x87/0x4a0
> [ 3290.970503]  ? __raw_spin_lock_init+0x3b/0x60
> [ 3290.970510]  ? lockdep_init_map_type+0x58/0x240
> [ 3290.970519]  flush_workqueue+0xae/0x4a0
> [ 3290.970526]  ? flush_workqueue+0x87/0x4a0
> [ 3290.970544]  ? drain_workqueue+0xa1/0x130
> [ 3290.970552]  drain_workqueue+0xa1/0x130
> [ 3290.970561]  destroy_workqueue+0x34/0x1f0
> [ 3290.970572]  hci_release_dev+0x49/0x180 [bluetooth]
> [ 3290.970624]  bt_host_release+0x1d/0x30 [bluetooth]
> [ 3290.970687]  device_release+0x33/0x90
> [ 3290.970695]  kobject_release+0x63/0x160
> [ 3290.970705]  dpm_resume+0x164/0x3e0
> [ 3290.970710]  ? dpm_resume_early+0x251/0x3b0
> [ 3290.970718]  dpm_resume_end+0xd/0x20
> [ 3290.970723]  suspend_devices_and_enter+0x1a4/0xba0
> [ 3290.970737]  pm_suspend+0x26b/0x310
> [ 3290.970746]  state_store+0x42/0x90
> [ 3290.970755]  kernfs_fop_write_iter+0x135/0x1b0
> [ 3290.970764]  new_sync_write+0x125/0x1c0
> [ 3290.970777]  vfs_write+0x360/0x3c0
> [ 3290.970785]  ksys_write+0xa7/0xe0
> [ 3290.970794]  do_syscall_64+0x3a/0x80
> [ 3290.970803]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [ 3290.970811] RIP: 0033:0x7f41b1328164
> [ 3290.970819] Code: 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 80 00 00 00 00 8b 05 4a d2 2c 00 48 63 ff 85 c0 75 13 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 54 f3 c3 66 90 55 53 48 89 d5 48 89 f3 48 83
> [ 3290.970824] RSP: 002b:00007ffe6ae21b28 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> [ 3290.970831] RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 00007f41b1328164
> [ 3290.970836] RDX: 0000000000000004 RSI: 000055965e651070 RDI: 0000000000000004
> [ 3290.970839] RBP: 000055965e651070 R08: 000055965e64f390 R09: 00007f41b1e3d1c0
> [ 3290.970843] R10: 000000000000000a R11: 0000000000000246 R12: 0000000000000004
> [ 3290.970846] R13: 0000000000000001 R14: 000055965e64f2b0 R15: 0000000000000004
>
> Cc: All applicable <stable@vger.kernel.org>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Looks good to me!

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/base/power/main.c |   84 +++++++++++++++++++++++++++++++---------------
>  1 file changed, 57 insertions(+), 27 deletions(-)
>
> Index: linux-pm/drivers/base/power/main.c
> ===================================================================
> --- linux-pm.orig/drivers/base/power/main.c
> +++ linux-pm/drivers/base/power/main.c
> @@ -710,6 +710,7 @@ static void dpm_noirq_resume_devices(pm_
>                 dev = to_device(dpm_noirq_list.next);
>                 get_device(dev);
>                 list_move_tail(&dev->power.entry, &dpm_late_early_list);
> +
>                 mutex_unlock(&dpm_list_mtx);
>
>                 if (!is_async(dev)) {
> @@ -724,8 +725,9 @@ static void dpm_noirq_resume_devices(pm_
>                         }
>                 }
>
> -               mutex_lock(&dpm_list_mtx);
>                 put_device(dev);
> +
> +               mutex_lock(&dpm_list_mtx);
>         }
>         mutex_unlock(&dpm_list_mtx);
>         async_synchronize_full();
> @@ -849,6 +851,7 @@ void dpm_resume_early(pm_message_t state
>                 dev = to_device(dpm_late_early_list.next);
>                 get_device(dev);
>                 list_move_tail(&dev->power.entry, &dpm_suspended_list);
> +
>                 mutex_unlock(&dpm_list_mtx);
>
>                 if (!is_async(dev)) {
> @@ -862,8 +865,10 @@ void dpm_resume_early(pm_message_t state
>                                 pm_dev_err(dev, state, " early", error);
>                         }
>                 }
> -               mutex_lock(&dpm_list_mtx);
> +
>                 put_device(dev);
> +
> +               mutex_lock(&dpm_list_mtx);
>         }
>         mutex_unlock(&dpm_list_mtx);
>         async_synchronize_full();
> @@ -1026,7 +1031,12 @@ void dpm_resume(pm_message_t state)
>                 }
>                 if (!list_empty(&dev->power.entry))
>                         list_move_tail(&dev->power.entry, &dpm_prepared_list);
> +
> +               mutex_unlock(&dpm_list_mtx);
> +
>                 put_device(dev);
> +
> +               mutex_lock(&dpm_list_mtx);
>         }
>         mutex_unlock(&dpm_list_mtx);
>         async_synchronize_full();
> @@ -1104,14 +1114,16 @@ void dpm_complete(pm_message_t state)
>                 get_device(dev);
>                 dev->power.is_prepared = false;
>                 list_move(&dev->power.entry, &list);
> +
>                 mutex_unlock(&dpm_list_mtx);
>
>                 trace_device_pm_callback_start(dev, "", state.event);
>                 device_complete(dev, state);
>                 trace_device_pm_callback_end(dev, 0);
>
> -               mutex_lock(&dpm_list_mtx);
>                 put_device(dev);
> +
> +               mutex_lock(&dpm_list_mtx);
>         }
>         list_splice(&list, &dpm_list);
>         mutex_unlock(&dpm_list_mtx);
> @@ -1296,17 +1308,21 @@ static int dpm_noirq_suspend_devices(pm_
>                 error = device_suspend_noirq(dev);
>
>                 mutex_lock(&dpm_list_mtx);
> +
>                 if (error) {
>                         pm_dev_err(dev, state, " noirq", error);
>                         dpm_save_failed_dev(dev_name(dev));
> -                       put_device(dev);
> -                       break;
> -               }
> -               if (!list_empty(&dev->power.entry))
> +               } else if (!list_empty(&dev->power.entry)) {
>                         list_move(&dev->power.entry, &dpm_noirq_list);
> +               }
> +
> +               mutex_unlock(&dpm_list_mtx);
> +
>                 put_device(dev);
>
> -               if (async_error)
> +               mutex_lock(&dpm_list_mtx);
> +
> +               if (error || async_error)
>                         break;
>         }
>         mutex_unlock(&dpm_list_mtx);
> @@ -1471,23 +1487,28 @@ int dpm_suspend_late(pm_message_t state)
>                 struct device *dev = to_device(dpm_suspended_list.prev);
>
>                 get_device(dev);
> +
>                 mutex_unlock(&dpm_list_mtx);
>
>                 error = device_suspend_late(dev);
>
>                 mutex_lock(&dpm_list_mtx);
> +
>                 if (!list_empty(&dev->power.entry))
>                         list_move(&dev->power.entry, &dpm_late_early_list);
>
>                 if (error) {
>                         pm_dev_err(dev, state, " late", error);
>                         dpm_save_failed_dev(dev_name(dev));
> -                       put_device(dev);
> -                       break;
>                 }
> +
> +               mutex_unlock(&dpm_list_mtx);
> +
>                 put_device(dev);
>
> -               if (async_error)
> +               mutex_lock(&dpm_list_mtx);
> +
> +               if (error || async_error)
>                         break;
>         }
>         mutex_unlock(&dpm_list_mtx);
> @@ -1747,21 +1768,27 @@ int dpm_suspend(pm_message_t state)
>                 struct device *dev = to_device(dpm_prepared_list.prev);
>
>                 get_device(dev);
> +
>                 mutex_unlock(&dpm_list_mtx);
>
>                 error = device_suspend(dev);
>
>                 mutex_lock(&dpm_list_mtx);
> +
>                 if (error) {
>                         pm_dev_err(dev, state, "", error);
>                         dpm_save_failed_dev(dev_name(dev));
> -                       put_device(dev);
> -                       break;
> -               }
> -               if (!list_empty(&dev->power.entry))
> +               } else if (!list_empty(&dev->power.entry)) {
>                         list_move(&dev->power.entry, &dpm_suspended_list);
> +               }
> +
> +               mutex_unlock(&dpm_list_mtx);
> +
>                 put_device(dev);
> -               if (async_error)
> +
> +               mutex_lock(&dpm_list_mtx);
> +
> +               if (error || async_error)
>                         break;
>         }
>         mutex_unlock(&dpm_list_mtx);
> @@ -1878,6 +1905,7 @@ int dpm_prepare(pm_message_t state)
>                 struct device *dev = to_device(dpm_list.next);
>
>                 get_device(dev);
> +
>                 mutex_unlock(&dpm_list_mtx);
>
>                 trace_device_pm_callback_start(dev, "", state.event);
> @@ -1885,21 +1913,23 @@ int dpm_prepare(pm_message_t state)
>                 trace_device_pm_callback_end(dev, error);
>
>                 mutex_lock(&dpm_list_mtx);
> -               if (error) {
> -                       if (error == -EAGAIN) {
> -                               put_device(dev);
> -                               error = 0;
> -                               continue;
> -                       }
> +
> +               if (!error) {
> +                       dev->power.is_prepared = true;
> +                       if (!list_empty(&dev->power.entry))
> +                               list_move_tail(&dev->power.entry, &dpm_prepared_list);
> +               } else if (error == -EAGAIN) {
> +                       error = 0;
> +               } else {
>                         dev_info(dev, "not prepared for power transition: code %d\n",
>                                  error);
> -                       put_device(dev);
> -                       break;
>                 }
> -               dev->power.is_prepared = true;
> -               if (!list_empty(&dev->power.entry))
> -                       list_move_tail(&dev->power.entry, &dpm_prepared_list);
> +
> +               mutex_unlock(&dpm_list_mtx);
> +
>                 put_device(dev);
> +
> +               mutex_lock(&dpm_list_mtx);
>         }
>         mutex_unlock(&dpm_list_mtx);
>         trace_suspend_resume(TPS("dpm_prepare"), state.event, false);
>
>
>
