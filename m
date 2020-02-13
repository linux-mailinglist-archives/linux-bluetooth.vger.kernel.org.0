Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2695415CB92
	for <lists+linux-bluetooth@lfdr.de>; Thu, 13 Feb 2020 21:00:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728468AbgBMUAD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 13 Feb 2020 15:00:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:46428 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727797AbgBMUAD (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 13 Feb 2020 15:00:03 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 60824] [PATCH][regression] Cambridge Silicon Radio, Ltd
 Bluetooth Dongle unusable
Date:   Thu, 13 Feb 2020 19:59:51 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: littlefighter1996@googlemail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-60824-62941-56XsaMc8D6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-60824-62941@https.bugzilla.kernel.org/>
References: <bug-60824-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=60824

Patrick Zacharias (littlefighter1996@googlemail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |littlefighter1996@googlemai
                   |                            |l.com

--- Comment #54 from Patrick Zacharias (littlefighter1996@googlemail.com) ---
(In reply to Ruthger Dijt from comment #53)
> Hi, I've run into the same issue but adding the fixups option (from above)
> gives me this:  
> "btusb: unknown parameter 'fixups' ignored" at boot.
> 
> I'm running latest Manjaro kernel,
> 
> any ideas?
> 
> thanks.

You need to apply the patch:
https://bugzilla.kernel.org/attachment.cgi?id=285489
to btusb.c of kernel version 5.4 and load that kernel module.


I wanted to say that using this fixups option, I was able to get my bluetooth
adapter running as well.


Bus 003 Device 012: ID 1131:1001 Integrated System Solution Corp. KY-BT100
Bluetooth Adapter


The driver apparently didn't know the VID&PID,
so I inserted it with VID&PID = 0:

insmod btusb.ko "fixups=0x0800000:0x000004:0x0000:0x0000:0x0134"


btusb: New fixups. Device: 0x0000:0x0000/0x0134. Rule 1/1 (5 terms):
0x0000:0x0000/0x0134

-- 
You are receiving this mail because:
You are the assignee for the bug.
