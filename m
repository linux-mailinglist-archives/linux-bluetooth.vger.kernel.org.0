Return-Path: <linux-bluetooth+bounces-7882-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A7599D9FF
	for <lists+linux-bluetooth@lfdr.de>; Tue, 15 Oct 2024 01:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 595D8282DD8
	for <lists+linux-bluetooth@lfdr.de>; Mon, 14 Oct 2024 23:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2AA1D968E;
	Mon, 14 Oct 2024 23:11:25 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0E71CBE8B
	for <linux-bluetooth@vger.kernel.org>; Mon, 14 Oct 2024 23:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728947485; cv=none; b=QvNcfv2pTRfe5MeIlY7evY9KVpRV47rtxCLhJqUVylPZoN2EhL2bZ8YmjLgRmcT735AVdVUVWH2BYYiJESKKtpEpVLUEM/jmN6o6LzRNwg/YNYGTKe8WIDFicgBhMzNZ37StMG0/cUinn7XjF6Pt61dX8zfkW0eE0660PfBsdqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728947485; c=relaxed/simple;
	bh=cTPb/+CuKf6RzOOp01YUuyy7ZgHrNXQDBLiqaBFMdqk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=IuW9wtKEy102/8bcWc7blWsXv4040eprjI/z29QLtLic/Dm5fcyBbRlNc/BfTUjHKjC+viPay4s1CSzta+xYknZ995W/j94wrOdokGp7HU17NV2/Rt5zu5OZ8Ns/VghUG2YjFUqYIQ9LxRLjeaTUfg9B8vVWU+KKc+1EfgembK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3a3c3ecaaabso21232165ab.0
        for <linux-bluetooth@vger.kernel.org>; Mon, 14 Oct 2024 16:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728947483; x=1729552283;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jADd+awwER/GNY1SV/A2ec4ZVyfHexs847wg1ft/r10=;
        b=qkQPwwYiyJ958DhRfuv3/0omwC/CWE4LBZqGVvsX6UvOqvZBPKM9RLULj46YcFBmPw
         uhe+vo6lQ+MMml6/0JfiR4aNKDLxzCt4EF5Zqoth+2DuiV5oKV5qAQObUVRZVDAcvf4p
         gGWVOWS3V+Cw06+Gr8xrmmfpgLPjZJwGDaIUj6rk9N0cZ9ANzzbEqHOtDoolspJNV0j7
         SyM4iFIRHxkyxo9ds/+8GRVRBPOW+kOq8nmGUzx7u8ZVvGPa/DI9bGVnI9nAlLwXrdVu
         hbhsg4sk5kTPZ19oTwoBCr1d+7GDCCk+9mVtYSzIxZSBS+UkaKqxdYFY7UPT31vTXL+t
         s3JA==
X-Forwarded-Encrypted: i=1; AJvYcCV4u74jptQME3XZdawhy10jrzWjnZQIgZ3TWEgdH4RglShfs6fu13gkpe8xeBWWYcnaL4UDit9t3IIXpIT5Yz4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaPuvG/oFyZuoA2VZh3zmvDOJVI441mVxkW0I9R0kyAfKo+UIr
	kHasd7BL0SMMMSuERfkAyeTpCOgWlkTU3qmj9cYw68FgAj8m4lB8W17G0rFqnOVLh2bfd73Aiq7
	L9B9b1LP4uRRsvyoRkP3Lw2mkXKvmFBI8EE4bjRAl8uUM5g79td1jWz8=
X-Google-Smtp-Source: AGHT+IEdGt9cixSDWctMRkMkr4qELW5SlvCHwj5aT/xtHiemsiLiT/PsieRzLmsVVzuSdZUeRz1gbT6YaGdXQ1ijH1C1i+f8sfy3
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2181:b0:3a0:c88c:e674 with SMTP id
 e9e14a558f8ab-3a3b5f1de0bmr101237355ab.1.1728947483238; Mon, 14 Oct 2024
 16:11:23 -0700 (PDT)
Date: Mon, 14 Oct 2024 16:11:23 -0700
In-Reply-To: <000000000000cd69c7061dfe35d2@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <670da51b.050a0220.f16b.0004.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] WARNING: ODEBUG bug in hci_release_dev (2)
From: syzbot <syzbot+b170dbf55520ebf5969a@syzkaller.appspotmail.com>
To: johan.hedberg@gmail.com, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, luiz.dentz@gmail.com, marcel@holtmann.org, 
	netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    0b84db5d8f25 MAINTAINERS: add Andrew Lunn as a co-maintain..
git tree:       net
console output: https://syzkaller.appspot.com/x/log.txt?x=10505727980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7cd9e7e4a8a0a15b
dashboard link: https://syzkaller.appspot.com/bug?extid=b170dbf55520ebf5969a
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16f84030580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/bd00feb30432/disk-0b84db5d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e39e30a1ae6d/vmlinux-0b84db5d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/87eafcdafd48/bzImage-0b84db5d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b170dbf55520ebf5969a@syzkaller.appspotmail.com

------------[ cut here ]------------
ODEBUG: free active (active state 0) object: ffff88806c380978 object type: timer_list hint: hci_cmd_timeout+0x0/0x1e0
WARNING: CPU: 1 PID: 11255 at lib/debugobjects.c:517 debug_print_object+0x17a/0x1f0 lib/debugobjects.c:514
Modules linked in:
CPU: 1 UID: 0 PID: 11255 Comm: syz.1.2889 Not tainted 6.12.0-rc2-syzkaller-00216-g0b84db5d8f25 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
RIP: 0010:debug_print_object+0x17a/0x1f0 lib/debugobjects.c:514
Code: e8 5b 1a 3c fd 4c 8b 0b 48 c7 c7 e0 04 61 8c 48 8b 74 24 08 48 89 ea 44 89 e1 4d 89 f8 ff 34 24 e8 db 63 93 fc 48 83 c4 08 90 <0f> 0b 90 90 ff 05 64 a7 5a 0b 48 83 c4 10 5b 41 5c 41 5d 41 5e 41
RSP: 0018:ffffc90003e17818 EFLAGS: 00010286
RAX: b20dce31d0d23300 RBX: ffffffff8c0cd900 RCX: ffff88807aa40000
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffffffff8c610660 R08: ffffffff8155e402 R09: fffffbfff1cf9fd8
R10: dffffc0000000000 R11: fffffbfff1cf9fd8 R12: 0000000000000000
R13: ffffffff8c610578 R14: dffffc0000000000 R15: ffff88806c380978
FS:  00007fd4093cf6c0(0000) GS:ffff8880b8700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f55ce736000 CR3: 0000000074a94000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __debug_check_no_obj_freed lib/debugobjects.c:989 [inline]
 debug_check_no_obj_freed+0x45b/0x580 lib/debugobjects.c:1019
 slab_free_hook mm/slub.c:2273 [inline]
 slab_free mm/slub.c:4579 [inline]
 kfree+0x11f/0x440 mm/slub.c:4727
 hci_release_dev+0x1525/0x16b0 net/bluetooth/hci_core.c:2759
 bt_host_release+0x83/0x90 net/bluetooth/hci_sysfs.c:94
 device_release+0x99/0x1c0
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x22f/0x480 lib/kobject.c:737
 hci_dev_put include/net/bluetooth/hci_core.h:1581 [inline]
 hci_dev_cmd+0x296/0xa50 net/bluetooth/hci_core.c:763
 sock_do_ioctl+0x158/0x460 net/socket.c:1227
 sock_ioctl+0x626/0x8e0 net/socket.c:1346
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fd40857dff9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fd4093cf038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fd408735f80 RCX: 00007fd40857dff9
RDX: 0000000020000240 RSI: 00000000400448dd RDI: 0000000000000004
RBP: 00007fd4085f0296 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007fd408735f80 R15: 00007ffd5284c118
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

