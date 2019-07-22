Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4BB7012F
	for <lists+linux-bluetooth@lfdr.de>; Mon, 22 Jul 2019 15:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728181AbfGVNgb convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 22 Jul 2019 09:36:31 -0400
Received: from mail.wl.linuxfoundation.org ([198.145.29.98]:38228 "EHLO
        mail.wl.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727778AbfGVNga (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 22 Jul 2019 09:36:30 -0400
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
        by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 6F84720501
        for <linux-bluetooth@vger.kernel.org>; Mon, 22 Jul 2019 13:36:30 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
        id 6360821BED; Mon, 22 Jul 2019 13:36:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
        pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=2.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS,URIBL_CSS autolearn=no version=3.3.1
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 204275] New: bluetoothd consumes 100% cpu on keyboard
 disconnect
Date:   Mon, 22 Jul 2019 13:36:29 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-204275-62941@https.bugzilla.kernel.org/>
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

            Bug ID: 204275
           Summary: bluetoothd consumes 100% cpu on keyboard disconnect
           Product: Drivers
           Version: 2.5
    Kernel Version: 3.x +
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Bluetooth
          Assignee: linux-bluetooth@vger.kernel.org
          Reporter: steve@snewbury.org.uk
        Regression: No

Many bluetooth HID keyboard profile devices disconnect on idle to save power, I
have two such devices:

Logitech Y-X5A77 keyboard

Sony PS3 bluetooth remote control

When the device disconnects on idle the g_io_channels get disconnected

bluetoothd[3167]: profiles/input/device.c:ctrl_watch_cb() Device
00:07:61:F6:C9:7D disconnected
bluetoothd[3167]: profiles/input/device.c:intr_watch_cb() Device
00:07:61:F6:C9:7D disconnected

But, something isn't closed properly (possibly g_io_add_watch) since bluetoothd
then spins at 100% CPU in g_main_loop_run() until the device reconnects, at
which point every works normally again until the device next idles.

This bug has been present for at least 2 years, I'm certain it's much longer:

https://bugs.launchpad.net/ubuntu/+source/bluez/+bug/1717796

-- 
You are receiving this mail because:
You are the assignee for the bug.
