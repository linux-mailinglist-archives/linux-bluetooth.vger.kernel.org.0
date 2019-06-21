Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93C094E113
	for <lists+linux-bluetooth@lfdr.de>; Fri, 21 Jun 2019 09:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbfFUHTN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 21 Jun 2019 03:19:13 -0400
Received: from mail.wl.linuxfoundation.org ([198.145.29.98]:48204 "EHLO
        mail.wl.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726025AbfFUHTM (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 21 Jun 2019 03:19:12 -0400
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
        by mail.wl.linuxfoundation.org (Postfix) with ESMTP id DBCFD287E2
        for <linux-bluetooth@vger.kernel.org>; Fri, 21 Jun 2019 07:19:11 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
        id CE5BA28917; Fri, 21 Jun 2019 07:19:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
        pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS autolearn=ham version=3.3.1
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 199461] Unable to use Microsoft Surface Precision Mouse
Date:   Fri, 21 Jun 2019 07:19:11 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: harn-solo@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-199461-62941-jEaCaKj6HB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-199461-62941@https.bugzilla.kernel.org/>
References: <bug-199461-62941@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=199461

--- Comment #10 from Michael Long (harn-solo@gmx.de) ---
I've patched bluez according to your link and after some hours of usage I
couldn't reproduce the scroll wheel issue. So on my primary device (laptop)
everything works!

Unfortunately on my desktop system I've another issue, again this could be
entirely unrelated:

After applying the kernel patch (and in anticipation the bluez patch) on my
desktop system, the pairing process also went smoothly. 

The mouse is shown as paired and connected according to the KDE plasma UI
tools, but apparently the mouse is not detected by the input system.
Dmesg only shows warning added by the patch and not any of the following input
stuff (taken from my laptop):

[    7.973258] input: BTLE Precision Mouse as
/devices/virtual/misc/uhid/0005:045E:0821.0004/input/input19
[    7.973526] input: BTLE Precision Mouse Keyboard as
/devices/virtual/misc/uhid/0005:045E:0821.0004/input/input20
[    7.973646] input: BTLE Precision Mouse Consumer Control as
/devices/virtual/misc/uhid/0005:045E:0821.0004/input/input21
[    7.973697] input: BTLE Precision Mouse as
/devices/virtual/misc/uhid/0005:045E:0821.0004/input/input22
[    7.973746] input: BTLE Precision Mouse as
/devices/virtual/misc/uhid/0005:045E:0821.0004/input/input23
[    7.973819] hid-generic 0005:045E:0821.0004: input,hidraw3: BLUETOOTH HID
v1.05 Mouse [BTLE Precision Mouse] on XX:XX:XX:XX:XX:XX

What could I missing out?

-- 
You are receiving this mail because:
You are the assignee for the bug.
