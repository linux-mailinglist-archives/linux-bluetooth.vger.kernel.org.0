Return-Path: <linux-bluetooth+bounces-364-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84650803303
	for <lists+linux-bluetooth@lfdr.de>; Mon,  4 Dec 2023 13:38:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B22631C20A1E
	for <lists+linux-bluetooth@lfdr.de>; Mon,  4 Dec 2023 12:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38CDA23768;
	Mon,  4 Dec 2023 12:38:27 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8D8FC0
	for <linux-bluetooth@vger.kernel.org>; Mon,  4 Dec 2023 04:38:23 -0800 (PST)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6d88101a54cso1790781a34.1
        for <linux-bluetooth@vger.kernel.org>; Mon, 04 Dec 2023 04:38:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701693503; x=1702298303;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H9ex8njANx8xLMq+LleaHJO8Je9o1d+q9WnLUOEn/Fw=;
        b=DHUs8RfvPDYC/+mCMOZ2B11o04HyOaBfBRm7wQSmc/TzTFPqD4xud1wD4OyKrCqK5w
         eRc1ZPzRO/YlbtOFwnmiip5PYiSwAtDfAH3bGJDaFickXXwBUxy88XTztbO3cd8ivdRw
         biUHv6infLLlxoBcsVdzw1o8qOKA+r1V7cs5lqgB6WWlwyCSnkwWcNP+3WqM81+/Rexo
         HgoIwxakuznfaHrlfp5BIsjB9cmdABr9jrtI3xGHmAWfGnrzfvdPL6Xjp6p8oHO9qEBF
         gpSe24v/hQAsEbXvYxI9XEgTFPY1QrjBmeNN0s4LgIdx3C/3B2gmzmCo5edwwatj4Nzo
         IlpQ==
X-Gm-Message-State: AOJu0Yy4MBHFkXgDhWqeQ6Nl7145rr2Pog4jucPm2nWrgH6JEtpxW6QC
	DOOHcdhwkF2aFpgqwTuV3B3zSV1AysKQNpCyZet4A2kTPKdl
X-Google-Smtp-Source: AGHT+IG4BnF6V3c1ra8kAveWVvbkMgZSTspVOuvZHNgnZzmDtNlqZOCBTlmHxRBZRU8peH0UXacGlKmq5DshwDWlwbGTz7Q3+kZw
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6830:4682:b0:6d9:adfe:36ce with SMTP id
 ay2-20020a056830468200b006d9adfe36cemr51380otb.3.1701693503288; Mon, 04 Dec
 2023 04:38:23 -0800 (PST)
Date: Mon, 04 Dec 2023 04:38:23 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c7bcce060bae642f@google.com>
Subject: [syzbot] Monthly bluetooth report (Dec 2023)
From: syzbot <syzbot+list5592d5c09aec7961e337@syzkaller.appspotmail.com>
To: johan.hedberg@gmail.com, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, luiz.dentz@gmail.com, marcel@holtmann.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello bluetooth maintainers/developers,

This is a 31-day syzbot report for the bluetooth subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/bluetooth

During the period, 6 new issues were detected and 0 were fixed.
In total, 35 issues are still open and 58 have been fixed so far.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  14730   Yes   possible deadlock in rfcomm_sk_state_change
                   https://syzkaller.appspot.com/bug?extid=d7ce59b06b3eb14fd218
<2>  7414    Yes   possible deadlock in rfcomm_dlc_exists
                   https://syzkaller.appspot.com/bug?extid=b69a625d06e8ece26415
<3>  4858    Yes   WARNING in hci_conn_timeout
                   https://syzkaller.appspot.com/bug?extid=2446dd3cb07277388db6
<4>  4864    Yes   possible deadlock in hci_dev_do_close
                   https://syzkaller.appspot.com/bug?extid=4e3a76c5c505a3f49083
<5>  2074    Yes   possible deadlock in hci_rfkill_set_block
                   https://syzkaller.appspot.com/bug?extid=f93d183bc91522d90de9
<6>  1321    Yes   KASAN: slab-use-after-free Read in hci_send_acl
                   https://syzkaller.appspot.com/bug?extid=a0c80b06ae2cb8895bc4
<7>  421     Yes   WARNING in call_timer_fn
                   https://syzkaller.appspot.com/bug?extid=6fb78d577e89e69602f9
<8>  170     No    possible deadlock in hci_unregister_dev
                   https://syzkaller.appspot.com/bug?extid=c933391d8e4089f1f53e
<9>  120     No    possible deadlock in discov_off
                   https://syzkaller.appspot.com/bug?extid=f047480b1e906b46a3f4
<10> 61      Yes   KASAN: slab-use-after-free Write in sco_sock_timeout
                   https://syzkaller.appspot.com/bug?extid=4c0d0c4cde787116d465

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

