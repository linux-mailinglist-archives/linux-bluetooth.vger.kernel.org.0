Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A4894D1D36
	for <lists+linux-bluetooth@lfdr.de>; Tue,  8 Mar 2022 17:31:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348345AbiCHQcY (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 8 Mar 2022 11:32:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233477AbiCHQcX (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 8 Mar 2022 11:32:23 -0500
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 764A8506F8
        for <linux-bluetooth@vger.kernel.org>; Tue,  8 Mar 2022 08:31:26 -0800 (PST)
Received: by mail-io1-f72.google.com with SMTP id f7-20020a056602088700b00645ebbe277cso2711841ioz.22
        for <linux-bluetooth@vger.kernel.org>; Tue, 08 Mar 2022 08:31:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=V1zLNO1KAqXnOsAbreZ3eBprRbDmLPsP43VZUANZ1eE=;
        b=IQX5BIGDliNZsVXPE7uESKJ7b375g52qHUxIDsmzIyIwJ+SZbnKBT9+qGWkqbRfB7P
         gBUtO+PzhoouoxIXZryrt/+4XRxrDez+572wyNKUU0FkOUM6QO1bZJE9FAVpPtHZFkdP
         XiPzPyqfVyDxKBx2KF3Fjen7S/44NpNYfvXvUsBbbMWEE3sZ2triDU44SpKxVQ8cVxGc
         V8+e+cCOm25kY+abchKyzuTrYas4SjY++obPMc1IuO2wSHfDm+6Kco3gV42YfRI8RLPp
         b0kfEd9mxe0JUhOapVyLunhX6qIL0XCy+eA9/6X5aVAj1g8Pf6wzmLl+Ra1yfSmeihb0
         bYnQ==
X-Gm-Message-State: AOAM530rHFPnTqSaZz7ltfuNLxtoD3ZoIQ1SAB+uhmkjTNWMXYunE7HC
        mK25esnmJ4sqjNNS/oe9IIxyONSYAIgT7BZMG8yPV87TQPXL
X-Google-Smtp-Source: ABdhPJz2wlhCoBGloN79xjSbYtO9yttKkeIGLgG5eHIjjuJ6B4OJHpcgxXKi5Qtx3q3ZgYzJZZI+3dM1OCybcO34ErYNuEZmv0oD
MIME-Version: 1.0
X-Received: by 2002:a5d:944a:0:b0:645:dc2c:46c6 with SMTP id
 x10-20020a5d944a000000b00645dc2c46c6mr5968524ior.190.1646757085832; Tue, 08
 Mar 2022 08:31:25 -0800 (PST)
Date:   Tue, 08 Mar 2022 08:31:25 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000021ebaf05d9b78339@google.com>
Subject: [syzbot] INFO: trying to register non-static key in sco_sock_timeout
From:   syzbot <syzbot+c893cac8686270f25523@syzkaller.appspotmail.com>
To:     davem@davemloft.net, johan.hedberg@gmail.com, kuba@kernel.org,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        luiz.dentz@gmail.com, marcel@holtmann.org, netdev@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    91265a6da44d Add linux-next specific files for 20220303
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1621ba59700000
kernel config:  https://syzkaller.appspot.com/x/.config?x=617f79440a35673a
dashboard link: https://syzkaller.appspot.com/bug?extid=c893cac8686270f25523
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c893cac8686270f25523@syzkaller.appspotmail.com

INFO: trying to register non-static key.
The code is fine but needs lockdep annotation, or maybe
you didn't initialize this object before use?
turning off the locking correctness validator.
CPU: 0 PID: 21810 Comm: kworker/0:3 Not tainted 5.17.0-rc6-next-20220303-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: events sco_sock_timeout
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 assign_lock_key kernel/locking/lockdep.c:980 [inline]
 register_lock_class+0xf04/0x11b0 kernel/locking/lockdep.c:1293
 __lock_acquire+0x10a/0x56c0 kernel/locking/lockdep.c:4939
 lock_acquire kernel/locking/lockdep.c:5672 [inline]
 lock_acquire+0x1ab/0x510 kernel/locking/lockdep.c:5637
 lock_sock_nested+0x36/0xf0 net/core/sock.c:3312
 lock_sock include/net/sock.h:1682 [inline]
 sco_sock_timeout+0xd2/0x290 net/bluetooth/sco.c:97
 process_one_work+0x996/0x1610 kernel/workqueue.c:2289
 worker_thread+0x665/0x1080 kernel/workqueue.c:2436
 kthread+0x2e9/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
