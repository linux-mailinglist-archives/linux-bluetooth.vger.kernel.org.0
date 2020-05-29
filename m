Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF8001E7C46
	for <lists+linux-bluetooth@lfdr.de>; Fri, 29 May 2020 13:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbgE2LuG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 29 May 2020 07:50:06 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:50449 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725795AbgE2LuF (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 29 May 2020 07:50:05 -0400
Received: from marcel-macbook.fritz.box (p4fefc5a7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 15816CECD3;
        Fri, 29 May 2020 13:59:51 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v2] Bluetooth: Acquire sk_lock.slock without disabling
 interrupts
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200528123512.o32lkytxjdpwzi7r@linutronix.de>
Date:   Fri, 29 May 2020 13:50:03 +0200
Cc:     kbuild test robot <lkp@intel.com>,
        "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>,
        kbuild-all@lists.01.org, Johan Hedberg <johan.hedberg@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Luis Claudio R . Goncalves" <lclaudio@uudg.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <C6CE8EBA-73DC-4A8A-9BD2-BC13BBDEC24A@holtmann.org>
References: <20200527193919.1655228-1-bigeasy@linutronix.de>
 <20200528071103.GA26242@xsang-OptiPlex-9020>
 <20200528123512.o32lkytxjdpwzi7r@linutronix.de>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Sebastian,

> There was a lockdep which led to commit
>   fad003b6c8e3d ("Bluetooth: Fix inconsistent lock state with RFCOMM")
> 
> Lockdep noticed that `sk->sk_lock.slock' was acquired without disabling
> the softirq while the lock was also used in softirq context.
> Unfortunately the solution back then was to disable interrupts before
> acquiring the lock which however made lockdep happy.
> It would have been enough to simply disable the softirq. Disabling
> interrupts before acquiring a spinlock_t is not allowed on PREEMPT_RT
> because these locks are converted to 'sleeping' spinlocks.
> 
> Use spin_lock_bh() in order to acquire the `sk_lock.slock'.
> 
> Reported-by: Luis Claudio R. Goncalves <lclaudio@uudg.org>
> Reported-by: kbuild test robot <lkp@intel.com> [missing unlock]
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
> 
> v1…v2: Unlock on the way out as reported by the lkp bot.
> 
> net/bluetooth/rfcomm/sock.c | 7 ++-----
> 1 file changed, 2 insertions(+), 5 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

