Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5389F376597
	for <lists+linux-bluetooth@lfdr.de>; Fri,  7 May 2021 14:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237108AbhEGMxA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 7 May 2021 08:53:00 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:42869 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236772AbhEGMw5 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 7 May 2021 08:52:57 -0400
Received: from smtpclient.apple (p4fefc624.dip0.t-ipconnect.de [79.239.198.36])
        by mail.holtmann.org (Postfix) with ESMTPSA id 27C9DCECE1;
        Fri,  7 May 2021 14:59:45 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: [PATCH] Bluetooth: btqca: Don't modify firmware contents in-place
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210507122733.11250-1-cwabbott0@gmail.com>
Date:   Fri, 7 May 2021 14:51:53 +0200
Cc:     Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
        stable@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <D6D4D8EB-4EE5-454C-928D-DE919809B42A@holtmann.org>
References: <20210507122733.11250-1-cwabbott0@gmail.com>
To:     Connor Abbott <cwabbott0@gmail.com>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Connor,

> struct firmware::data is marked const, and when the firmware is
> compressed with xz (default at least with Fedora) it's mapped read-only
> which results in a crash:
> 
> BUG: unable to handle page fault for address: ffffae57c0ca5047
> PGD 100000067 P4D 100000067 PUD 1001ce067 PMD 10165a067 PTE 8000000112bba161
> Oops: 0003 [#1] SMP NOPTI
> CPU: 3 PID: 204 Comm: kworker/u17:0 Not tainted 5.12.1-test+ #1
> Hardware name: Dell Inc. XPS 13 9310/0F7M4C, BIOS 1.2.5 12/10/2020
> Workqueue: hci0 hci_power_on [bluetooth]
> RIP: 0010:qca_download_firmware+0x27c/0x4e0 [btqca]
> Code: 1b 75 04 80 48 0c 01 0f b7 c6 8d 54 02 0c 41 39 d7 0f 8e 62 fe ff ff 48 63 c2 4c 01 e8 0f b7 38 0f b7 70 02 66 83 ff 11 75 d3 <80> 48 0c 80 41 83 fc 03 7e 6e 88 58 0d eb ce 41 0f b6 45 0e 48 8b
> RSP: 0018:ffffae57c08dfc68 EFLAGS: 00010246
> RAX: ffffae57c0ca503b RBX: 000000000000000e RCX: 0000000000000000
> RDX: 0000000000000037 RSI: 0000000000000006 RDI: 0000000000000011
> RBP: ffff978d9949e000 R08: ffff978d84ed7540 R09: ffffae57c0ca5000
> R10: 000000000010cd00 R11: 0000000000000001 R12: 0000000000000005
> R13: ffffae57c0ca5004 R14: ffff978d98ca8680 R15: 00000000000016a9
> FS:  0000000000000000(0000) GS:ffff9794ef6c0000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: ffffae57c0ca5047 CR3: 0000000113d5a004 CR4: 0000000000770ee0
> PKRU: 55555554
> Call Trace:
> qca_uart_setup+0x2cb/0x1390 [btqca]
> ? qca_read_soc_version+0x136/0x220 [btqca]
> qca_setup+0x288/0xab0 [hci_uart]
> hci_dev_do_open+0x1f3/0x780 [bluetooth]
> ? try_to_wake_up+0x1c1/0x4f0
> hci_power_on+0x3f/0x200 [bluetooth]
> process_one_work+0x1ec/0x380
> worker_thread+0x53/0x3e0
> ? process_one_work+0x380/0x380
> kthread+0x11b/0x140
> ? kthread_associate_blkcg+0xa0/0xa0
> ret_from_fork+0x1f/0x30
> Modules linked in: llc ip_set nf_tables nfnetlink snd_soc_skl_hda_dsp(+) ip6table_filter snd_soc_hdac_hdmi ip6_tables qrtr_mhi iptable_filter snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic s>
> dell_wmi_sysman(+) dell_smbios snd dcdbas mhi vfat videobuf2_vmalloc i2c_i801 videobuf2_memops videobuf2_v4l2 dell_wmi_descriptor fat wmi_bmof soundcore i2c_smbus videobuf2_common libarc4 mei_me mei hid_se>
> i2c_hid_acpi i2c_hid video pinctrl_tigerlake fuse
> CR2: ffffae57c0ca5047
> 
> This also seems to fix a failure to suspend due to the firmware
> download on bootup getting interrupted by the crash:
> 
> Bluetooth: hci0: SSR or FW download time out
> PM: dpm_run_callback(): acpi_subsys_suspend+0x0/0x60 returns -110
> PM: Device serial0-0 failed to suspend: error -110
> PM: Some devices failed to suspend, or early wake event detected
> 
> Fixes: 83e8196 ("Bluetooth: btqca: Introduce generic QCA ROME support")
> Cc: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
> drivers/bluetooth/btqca.c | 27 ++++++++++++++++++++-------
> 1 file changed, 20 insertions(+), 7 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

