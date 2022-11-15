Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA04A62A2FD
	for <lists+linux-bluetooth@lfdr.de>; Tue, 15 Nov 2022 21:31:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237977AbiKOUbg (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 15 Nov 2022 15:31:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237900AbiKOUaU (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 15 Nov 2022 15:30:20 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFDB430F78;
        Tue, 15 Nov 2022 12:29:00 -0800 (PST)
Message-ID: <20221115202117.849485477@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1668544138;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         references:references; bh=VMt+lAYwXqKzwEHThJOieOqFot6Ei0mDFg2C3AsrckQ=;
        b=mucQ8oXb0C4aCUY5JIMHL0lQvqrUa82sVbkH31UQxuzVpLZFZOmZrs0aoHSqp8pIGl/3ks
        XzbBlbaPcq7AdSa8X4h2kftgSOMVq0C5uEW1sgpJkvQoDwU0yqOrm1FD/muU/i1qildMby
        3Hi4LCjz97NdVP1G1qQmV699Fe2I2dEXIR0EfIxNv/9KwsFNlwjyBEtPCFUJpSvHMhwFrM
        eA2HUfkCi7ahca5KpV4TI7TeG1Sbh22gIBXFxV3I+KZoNZpmsdlal4ZIax8x/yWtlwdybP
        FRU/wSK1ulaN4C96T3M46wWFUuj2HoJBfMu/F1M2zALqXL11TdMvSXtouh9STg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1668544138;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         references:references; bh=VMt+lAYwXqKzwEHThJOieOqFot6Ei0mDFg2C3AsrckQ=;
        b=OuvYR8kVkCDqlom60FXFh8tOQHo9j2OPSo2cnx3iin3PXTYDtXFF5m4yF0hgM7KN3NI2NA
        n/k4I9w9C1CNd/AQ==
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
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-bluetooth@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Marc Zyngier <maz@kernel.org>
Subject: [patch 15/15] Bluetooth: hci_qca: Fix the teardown problem for real
References: <20221115195802.415956561@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date:   Tue, 15 Nov 2022 21:28:57 +0100 (CET)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

While discussing solutions for the teardown problem which results from
circular dependencies between timers and workqueues, where timers schedule
work from their timer callback and workqueues arm the timers from work
items, it was discovered that the recent fix to the QCA code is incorrect.

That commit fixes the obvious problem of using del_timer() instead of
del_timer_sync() and reorders the teardown calls to

   destroy_workqueue(wq);
   del_timer_sync(t);

This makes it less likely to explode, but it's still broken:

   destroy_workqueue(wq);
   /* After this point @wq cannot be touched anymore */

   ---> timer expires
         queue_work(wq) <---- Results in a NULl pointer dereference
			      deep in the work queue core code.
   del_timer_sync(t);

Use the new timer_shutdown_sync() function to ensure that the timers are
disarmed, no timer callbacks are running and the timers cannot be armed
again. This restores the original teardown sequence:

   timer_shutdown_sync(t);
   destroy_workqueue(wq);

which is now correct because the timer core silently ignores potential
rearming attempts which can happen when destroy_workqueue() drains pending
work before mopping up the workqueue.

Fixes: 72ef98445aca ("Bluetooth: hci_qca: Use del_timer_sync() before freeing")
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Marcel Holtmann <marcel@holtmann.org>
Cc: Johan Hedberg <johan.hedberg@gmail.com>
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org
Link: https://lore.kernel.org/all/87iljhsftt.ffs@tglx
---
 drivers/bluetooth/hci_qca.c |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -696,9 +696,15 @@ static int qca_close(struct hci_uart *hu
 	skb_queue_purge(&qca->tx_wait_q);
 	skb_queue_purge(&qca->txq);
 	skb_queue_purge(&qca->rx_memdump_q);
+	/*
+	 * Shut the timers down so they can't be rearmed when
+	 * destroy_workqueue() drains pending work which in turn might try
+	 * to arm a timer.  After shutdown rearm attempts are silently
+	 * ignored by the timer core code.
+	 */
+	timer_shutdown_sync(&qca->tx_idle_timer);
+	timer_shutdown_sync(&qca->wake_retrans_timer);
 	destroy_workqueue(qca->workqueue);
-	del_timer_sync(&qca->tx_idle_timer);
-	del_timer_sync(&qca->wake_retrans_timer);
 	qca->hu = NULL;
 
 	kfree_skb(qca->rx_skb);

