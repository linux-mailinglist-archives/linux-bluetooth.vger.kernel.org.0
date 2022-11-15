Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FEA162A2CD
	for <lists+linux-bluetooth@lfdr.de>; Tue, 15 Nov 2022 21:28:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230498AbiKOU2h (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 15 Nov 2022 15:28:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbiKOU2h (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 15 Nov 2022 15:28:37 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76BB56259;
        Tue, 15 Nov 2022 12:28:35 -0800 (PST)
Message-ID: <20221115195802.415956561@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1668544113;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=N0+DYQIzJQiuGQVL9zG7WmZVX2CclyspM4BrFbhZiQ4=;
        b=M7ECxDE0fB4Eu8YucLFheDApDFsLZrYtCJcaFO+SOJLCYWeIswLu1kIiaw2A4DwSg7KQPs
        s1AZ5RzM2N9m/XwTQFVZRuYoLcHvbcSDs9wLQuQ2KBFeaqa0xwsKAtJ6o05zt8Ynmm8FTC
        njJ7KEfbuFvxFnQikQGBFrUrApiyvVt16OgJmB2MERr5pd4PYGmjjTj8CistfVWbGeYEeL
        nHhkSE+Dpiknoo1XdNL/jkkiqgZ3mvk0GOI2nSJvddEsPE9sUtqH87wetaMUm9To3RtQ+l
        H7XWTsjAldnu6cDgr0LFA82ogzpgjCKLWD4GLNmIPijLX000LKEdy3+W72VgOQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1668544113;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=N0+DYQIzJQiuGQVL9zG7WmZVX2CclyspM4BrFbhZiQ4=;
        b=fvWTUM9JRU6WBtEcA9FaxJnJobRgfpEAalgfSWHfdnd4NJtaxKu1epQKvYY3Z6S7g+tSVK
        8M5r+Fg9FZuU48Bg==
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Linus Torvalds <torvalds@linuxfoundation.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Arnd Bergmann <arnd@arndb.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-bluetooth@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org
Subject: [patch 00/15] timers: Provide timer_shutdown[_sync]()
Date:   Tue, 15 Nov 2022 21:28:32 +0100 (CET)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Tearing down timers can be tedious when there are circular dependencies to
other things which need to be torn down. A prime example is timer and
workqueue where the timer schedules work and the work arms the timer.

Steven and the Google Chromebook team ran into such an issue in the
Bluetooth HCI code.

Steven suggested to create a new function del_timer_free() which marks the
timer as shutdown. Rearm attempts of shutdown timers are discarded and he
wanted to emit a warning for that case:

   https://lore.kernel.org/all/20220407161745.7d6754b3@gandalf.local.home

This resulted in a lengthy discussion and suggestions how this should be
implemented. The patch series went through several iterations and during
the review of the last version it turned out that this approach is
suboptimal:

   https://lore.kernel.org/all/20221110064101.429013735@goodmis.org

The warning is not really helpful because it's entirely unclear how it
should be acted upon. The only way to address such a case is to add 'if
(in_shutdown)' conditionals all over the place. This is error prone and in
most cases of teardown like the HCI one which started this discussion not
required all.

What needs to prevented is that pending work which is drained via
destroy_workqueue() does not rearm the previously shutdown timer. Nothing
in that shutdown sequence relies on the timer being functional.

The conclusion was that the semantics of timer_shutdown_sync() should be:

    - timer is not enqueued
    - timer callback is not running
    - timer cannot be rearmed

Preventing the rearming of shutdown timers is done by discarding rearm
attempts silently.

As Steven is short of cycles, I made some spare cycles available and
reworked the patch series to follow the new semantics and plugged the races
which were discovered during review.

The patches have been split up into small pieces to make review easier and
I took the liberty to throw a bunch of overdue cleanups into the picture
instead of proliferating the existing state further.

The last patch in the series addresses the HCI teardown issue for real.

The series is also available from git:

   git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers

Thanks,

	tglx
---
 Documentation/RCU/Design/Requirements/Requirements.rst |    2 
 Documentation/core-api/local_ops.rst                   |    2 
 Documentation/kernel-hacking/locking.rst               |   13 
 arch/arm/mach-spear/time.c                             |    8 
 drivers/bluetooth/hci_qca.c                            |   10 
 drivers/char/tpm/tpm-dev-common.c                      |    4 
 drivers/clocksource/arm_arch_timer.c                   |   12 
 drivers/clocksource/timer-sp804.c                      |    6 
 drivers/staging/wlan-ng/hfa384x_usb.c                  |    4 
 drivers/staging/wlan-ng/prism2usb.c                    |    6 
 include/linux/timer.h                                  |   35 +
 kernel/time/timer.c                                    |  409 +++++++++++++----
 net/sunrpc/xprt.c                                      |    2 
 13 files changed, 383 insertions(+), 130 deletions(-)
