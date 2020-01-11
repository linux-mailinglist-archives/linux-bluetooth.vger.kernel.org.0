Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB7DF137C41
	for <lists+linux-bluetooth@lfdr.de>; Sat, 11 Jan 2020 09:02:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728523AbgAKICX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 11 Jan 2020 03:02:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:46850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728517AbgAKICX (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 11 Jan 2020 03:02:23 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 99881] 2015 Apple bluetooth keybord and magic mouse support
Date:   Sat, 11 Jan 2020 08:02:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: me@joshgoebel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-99881-62941-Gc5oZ8j4MR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-99881-62941@https.bugzilla.kernel.org/>
References: <bug-99881-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=99881

Josh Goebel (me@joshgoebel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |me@joshgoebel.com

--- Comment #63 from Josh Goebel (me@joshgoebel.com) ---
I have a version 1.0 identifying Apple Magic Keyboard 2.  From what I can tell
(at a quick glance) it's descriptor does NOT match what the kernel is
expecting.

The kernel is expecting either 0xFF000003 or 0x00FF0003 for Usage HID.  From my
reading of the description it seems like it would be: 0xFF010003.

Seems we need at add another Usage HID variant?

Relevant descriptor dump:

```
     Report Count (1),
        Report Size (1),
        Logical Minimum (0),
        Logical Maximum (1),
        Usage Page (Consumer),                      ; Consumer (0Ch)
        Usage (Eject),                              ; Eject (B8h, one-shot
control)
        Input (Variable),
        Report Count (1),
        Report Size (1),
        Usage Page (FF01h),                         ; FF01h, vendor-defined
        Usage (03h),
        Input (Variable),
```

Sorry if this is formatted terribly.  Not matter what I do the Preview looks
terrible and this is my first time posting here.

-- 
You are receiving this mail because:
You are the assignee for the bug.
