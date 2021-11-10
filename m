Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BD4044C308
	for <lists+linux-bluetooth@lfdr.de>; Wed, 10 Nov 2021 15:34:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232193AbhKJOh2 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 10 Nov 2021 09:37:28 -0500
Received: from mail-oi1-f178.google.com ([209.85.167.178]:37543 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231969AbhKJOh1 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 10 Nov 2021 09:37:27 -0500
Received: by mail-oi1-f178.google.com with SMTP id o83so5573599oif.4;
        Wed, 10 Nov 2021 06:34:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ltuRHUyJu75Lz+Lg0QKxeCcBkPmJESEW9RT7hk7vqlk=;
        b=L0dAlYOqgWnuTL3vaoXUCfe/DsfgD16vJm34ccZBg+EcXyXxm2v0U8HvWP+897bYC5
         E/6lGHmq75ipbpKvZpmPJirMMv1JNz5J5IGSBkg7IYVeViX76XSx51WT4BSkU9fh0gC9
         zDfPgzZdbbTaGPyWssLY29B/nMYyrezSAw53dLWVbycEv1bEr41PM9vnEasSIhWv9vT4
         VPUyXukXcAvrOqUQ6O239eWyKS1iJTxsspqSJN5xN4BQ5Fum2nyhyemhucA1Z18l0C/w
         YqsZrlZAxXTg7WP8UpdmiWAU4AQOZVDicS4WpJx4X6ZCzqzk00BjDfhZY+vh4KOCCc4+
         0gsQ==
X-Gm-Message-State: AOAM531VVEa8WdmpUs9iLsJ9Ud1bIhsFWzabIctHKB0lysAhfldDz+hV
        xlehqvZF1P1pyvOBOdSuoGVE4iMg/lnQrKZhCrA=
X-Google-Smtp-Source: ABdhPJxie2nBk72aCtKkQwG0x/ijdDPnpG2TziBes8wDCjj/PXuvkJqSOeKZQ59igXua+uOBGB9OLdCYgX12a+mhxg4=
X-Received: by 2002:aca:5c5:: with SMTP id 188mr41782oif.154.1636554879519;
 Wed, 10 Nov 2021 06:34:39 -0800 (PST)
MIME-Version: 1.0
References: <4693240.31r3eYUQgx@kreacher> <CAPDyKFr0c8zxrmTQYs1SWGc9GjyYQaQCQ0ty7LhgqKSfC9xrZw@mail.gmail.com>
In-Reply-To: <CAPDyKFr0c8zxrmTQYs1SWGc9GjyYQaQCQ0ty7LhgqKSfC9xrZw@mail.gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Wed, 10 Nov 2021 15:34:28 +0100
Message-ID: <CAJZ5v0g24vqwg2bz47WEMqnq9qLGHrdbUkK-DO1DMTADm_VEBA@mail.gmail.com>
Subject: Re: [PATCH] PM: sleep: Avoid calling put_device() under dpm_list_mtx
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux PM <linux-pm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Wed, Nov 10, 2021 at 3:26 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Thu, 4 Nov 2021 at 18:26, Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
> >
> > From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> >
> > It is generally unsafe to call put_device() with dpm_list_mtx held,
> > because the given device's release routine may carry out an action
> > depending on that lock which then may deadlock, so modify the
> > system-wide suspend and resume of devices to always drop dpm_list_mtx
> > before calling put_device() (and adjust white space somewhat while
> > at it).
> >
> > For instance, this prevents the following splat from showing up in
> > the kernel log after a system resume in certain configurations:
> >
> > [ 3290.969514] ======================================================
> > [ 3290.969517] WARNING: possible circular locking dependency detected
> > [ 3290.969519] 5.15.0+ #2420 Tainted: G S
> > [ 3290.969523] ------------------------------------------------------
> > [ 3290.969525] systemd-sleep/4553 is trying to acquire lock:
> > [ 3290.969529] ffff888117ab1138 ((wq_completion)hci0#2){+.+.}-{0:0}, at: flush_workqueue+0x87/0x4a0
> > [ 3290.969554]
> >                but task is already holding lock:
> > [ 3290.969556] ffffffff8280fca8 (dpm_list_mtx){+.+.}-{3:3}, at: dpm_resume+0x12e/0x3e0
> > [ 3290.969571]
> >                which lock already depends on the new lock.
> >
> > [ 3290.969573]
> >                the existing dependency chain (in reverse order) is:
> > [ 3290.969575]
> >                -> #3 (dpm_list_mtx){+.+.}-{3:3}:
> > [ 3290.969583]        __mutex_lock+0x9d/0xa30
> > [ 3290.969591]        device_pm_add+0x2e/0xe0
> > [ 3290.969597]        device_add+0x4d5/0x8f0
> > [ 3290.969605]        hci_conn_add_sysfs+0x43/0xb0 [bluetooth]
> > [ 3290.969689]        hci_conn_complete_evt.isra.71+0x124/0x750 [bluetooth]
> > [ 3290.969747]        hci_event_packet+0xd6c/0x28a0 [bluetooth]
> > [ 3290.969798]        hci_rx_work+0x213/0x640 [bluetooth]
> > [ 3290.969842]        process_one_work+0x2aa/0x650
> > [ 3290.969851]        worker_thread+0x39/0x400
> > [ 3290.969859]        kthread+0x142/0x170
> > [ 3290.969865]        ret_from_fork+0x22/0x30
> > [ 3290.969872]
> >                -> #2 (&hdev->lock){+.+.}-{3:3}:
> > [ 3290.969881]        __mutex_lock+0x9d/0xa30
> > [ 3290.969887]        hci_event_packet+0xba/0x28a0 [bluetooth]
> > [ 3290.969935]        hci_rx_work+0x213/0x640 [bluetooth]
> > [ 3290.969978]        process_one_work+0x2aa/0x650
> > [ 3290.969985]        worker_thread+0x39/0x400
> > [ 3290.969993]        kthread+0x142/0x170
> > [ 3290.969999]        ret_from_fork+0x22/0x30
> > [ 3290.970004]
> >                -> #1 ((work_completion)(&hdev->rx_work)){+.+.}-{0:0}:
> > [ 3290.970013]        process_one_work+0x27d/0x650
> > [ 3290.970020]        worker_thread+0x39/0x400
> > [ 3290.970028]        kthread+0x142/0x170
> > [ 3290.970033]        ret_from_fork+0x22/0x30
> > [ 3290.970038]
> >                -> #0 ((wq_completion)hci0#2){+.+.}-{0:0}:
> > [ 3290.970047]        __lock_acquire+0x15cb/0x1b50
> > [ 3290.970054]        lock_acquire+0x26c/0x300
> > [ 3290.970059]        flush_workqueue+0xae/0x4a0
> > [ 3290.970066]        drain_workqueue+0xa1/0x130
> > [ 3290.970073]        destroy_workqueue+0x34/0x1f0
> > [ 3290.970081]        hci_release_dev+0x49/0x180 [bluetooth]
> > [ 3290.970130]        bt_host_release+0x1d/0x30 [bluetooth]
> > [ 3290.970195]        device_release+0x33/0x90
> > [ 3290.970201]        kobject_release+0x63/0x160
> > [ 3290.970211]        dpm_resume+0x164/0x3e0
> > [ 3290.970215]        dpm_resume_end+0xd/0x20
> > [ 3290.970220]        suspend_devices_and_enter+0x1a4/0xba0
> > [ 3290.970229]        pm_suspend+0x26b/0x310
> > [ 3290.970236]        state_store+0x42/0x90
> > [ 3290.970243]        kernfs_fop_write_iter+0x135/0x1b0
> > [ 3290.970251]        new_sync_write+0x125/0x1c0
> > [ 3290.970257]        vfs_write+0x360/0x3c0
> > [ 3290.970263]        ksys_write+0xa7/0xe0
> > [ 3290.970269]        do_syscall_64+0x3a/0x80
> > [ 3290.970276]        entry_SYSCALL_64_after_hwframe+0x44/0xae
> > [ 3290.970284]
> >                other info that might help us debug this:
> >
> > [ 3290.970285] Chain exists of:
> >                  (wq_completion)hci0#2 --> &hdev->lock --> dpm_list_mtx
> >
> > [ 3290.970297]  Possible unsafe locking scenario:
> >
> > [ 3290.970299]        CPU0                    CPU1
> > [ 3290.970300]        ----                    ----
> > [ 3290.970302]   lock(dpm_list_mtx);
> > [ 3290.970306]                                lock(&hdev->lock);
> > [ 3290.970310]                                lock(dpm_list_mtx);
> > [ 3290.970314]   lock((wq_completion)hci0#2);
> > [ 3290.970319]
> >                 *** DEADLOCK ***
> >
> > [ 3290.970321] 7 locks held by systemd-sleep/4553:
> > [ 3290.970325]  #0: ffff888103bcd448 (sb_writers#4){.+.+}-{0:0}, at: ksys_write+0xa7/0xe0
> > [ 3290.970341]  #1: ffff888115a14488 (&of->mutex){+.+.}-{3:3}, at: kernfs_fop_write_iter+0x103/0x1b0
> > [ 3290.970355]  #2: ffff888100f719e0 (kn->active#233){.+.+}-{0:0}, at: kernfs_fop_write_iter+0x10c/0x1b0
> > [ 3290.970369]  #3: ffffffff82661048 (autosleep_lock){+.+.}-{3:3}, at: state_store+0x12/0x90
> > [ 3290.970384]  #4: ffffffff82658ac8 (system_transition_mutex){+.+.}-{3:3}, at: pm_suspend+0x9f/0x310
> > [ 3290.970399]  #5: ffffffff827f2a48 (acpi_scan_lock){+.+.}-{3:3}, at: acpi_suspend_begin+0x4c/0x80
> > [ 3290.970416]  #6: ffffffff8280fca8 (dpm_list_mtx){+.+.}-{3:3}, at: dpm_resume+0x12e/0x3e0
> > [ 3290.970428]
> >                stack backtrace:
> > [ 3290.970431] CPU: 3 PID: 4553 Comm: systemd-sleep Tainted: G S                5.15.0+ #2420
> > [ 3290.970438] Hardware name: Dell Inc. XPS 13 9380/0RYJWW, BIOS 1.5.0 06/03/2019
> > [ 3290.970441] Call Trace:
> > [ 3290.970446]  dump_stack_lvl+0x44/0x57
> > [ 3290.970454]  check_noncircular+0x105/0x120
> > [ 3290.970468]  ? __lock_acquire+0x15cb/0x1b50
> > [ 3290.970474]  __lock_acquire+0x15cb/0x1b50
> > [ 3290.970487]  lock_acquire+0x26c/0x300
> > [ 3290.970493]  ? flush_workqueue+0x87/0x4a0
> > [ 3290.970503]  ? __raw_spin_lock_init+0x3b/0x60
> > [ 3290.970510]  ? lockdep_init_map_type+0x58/0x240
> > [ 3290.970519]  flush_workqueue+0xae/0x4a0
> > [ 3290.970526]  ? flush_workqueue+0x87/0x4a0
> > [ 3290.970544]  ? drain_workqueue+0xa1/0x130
> > [ 3290.970552]  drain_workqueue+0xa1/0x130
> > [ 3290.970561]  destroy_workqueue+0x34/0x1f0
> > [ 3290.970572]  hci_release_dev+0x49/0x180 [bluetooth]
> > [ 3290.970624]  bt_host_release+0x1d/0x30 [bluetooth]
> > [ 3290.970687]  device_release+0x33/0x90
> > [ 3290.970695]  kobject_release+0x63/0x160
> > [ 3290.970705]  dpm_resume+0x164/0x3e0
> > [ 3290.970710]  ? dpm_resume_early+0x251/0x3b0
> > [ 3290.970718]  dpm_resume_end+0xd/0x20
> > [ 3290.970723]  suspend_devices_and_enter+0x1a4/0xba0
> > [ 3290.970737]  pm_suspend+0x26b/0x310
> > [ 3290.970746]  state_store+0x42/0x90
> > [ 3290.970755]  kernfs_fop_write_iter+0x135/0x1b0
> > [ 3290.970764]  new_sync_write+0x125/0x1c0
> > [ 3290.970777]  vfs_write+0x360/0x3c0
> > [ 3290.970785]  ksys_write+0xa7/0xe0
> > [ 3290.970794]  do_syscall_64+0x3a/0x80
> > [ 3290.970803]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> > [ 3290.970811] RIP: 0033:0x7f41b1328164
> > [ 3290.970819] Code: 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 80 00 00 00 00 8b 05 4a d2 2c 00 48 63 ff 85 c0 75 13 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 54 f3 c3 66 90 55 53 48 89 d5 48 89 f3 48 83
> > [ 3290.970824] RSP: 002b:00007ffe6ae21b28 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> > [ 3290.970831] RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 00007f41b1328164
> > [ 3290.970836] RDX: 0000000000000004 RSI: 000055965e651070 RDI: 0000000000000004
> > [ 3290.970839] RBP: 000055965e651070 R08: 000055965e64f390 R09: 00007f41b1e3d1c0
> > [ 3290.970843] R10: 000000000000000a R11: 0000000000000246 R12: 0000000000000004
> > [ 3290.970846] R13: 0000000000000001 R14: 000055965e64f2b0 R15: 0000000000000004
> >
> > Cc: All applicable <stable@vger.kernel.org>
> > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>
> Looks good to me!
>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Thanks a lot for the review and the tag, but I've just sent a PR with
it, sorry about that.
