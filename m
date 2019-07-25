Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C2DD7498B
	for <lists+linux-bluetooth@lfdr.de>; Thu, 25 Jul 2019 11:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390169AbfGYJEt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 25 Jul 2019 05:04:49 -0400
Received: from mail.wl.linuxfoundation.org ([198.145.29.98]:47092 "EHLO
        mail.wl.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388546AbfGYJEt (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 25 Jul 2019 05:04:49 -0400
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
        by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 0E79B28961
        for <linux-bluetooth@vger.kernel.org>; Thu, 25 Jul 2019 09:04:48 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
        id 01D6D2896D; Thu, 25 Jul 2019 09:04:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
        pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS autolearn=ham version=3.3.1
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 204275] bluetoothd consumes 100% cpu on keyboard disconnect
Date:   Thu, 25 Jul 2019 09:04:46 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: steve@snewbury.org.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204275-62941-FHtLbX10Wr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204275-62941@https.bugzilla.kernel.org/>
References: <bug-204275-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=204275

--- Comment #8 from Steven Newbury (steve@snewbury.org.uk) ---
Luiz, did you see (In reply to Luiz Von Dentz from comment #6)
> Ive sent a fix upstream:
> 
> https://lore.kernel.org/linux-bluetooth/20190724110151.4258-1-luiz.
> dentz@gmail.com/T/#u
> 
> Let me know if that works.

Luiz, did you see the patch I attached?  Perhaps it's better to remove the old
watcher first than not add another if it exists, but it shouldn't happen
anyway.  The explicit remove should happen to catch the case where the
connection is broken before being fully initialised but the callback should get
triggered once data starts to flow over the encrypted channel.

In my tests, allowing the channel to fully close by removing the sec_watch
prevents the keyboard from ever connecting, this is because the callback never
gets triggered.  I believe the bug is caused by the refcount sec_watch creates
not being automatically removed because the callback is left pending, it
doesn't get removed on channel shutdown, but has the side-effect of making it
work with the channel being already open when the device reconnects because it
triggers the callback.

What made it work every time is changing sec_watch to wait for G_IO_IN instead
of G_IO_OUT, but presumably it is G_IO_OUT for a reason?

-- 
You are receiving this mail because:
You are the assignee for the bug.
