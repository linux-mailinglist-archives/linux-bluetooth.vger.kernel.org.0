Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF470286B89
	for <lists+linux-bluetooth@lfdr.de>; Thu,  8 Oct 2020 01:32:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728259AbgJGXcD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 7 Oct 2020 19:32:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:38938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728239AbgJGXcD (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 7 Oct 2020 19:32:03 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 205685] Initialization failure for Cambridge Silicon Radio, Ltd
 Bluetooth Dongle
Date:   Wed, 07 Oct 2020 23:32:02 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: sisisisol@disroot.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205685-62941-wjwc76WOSw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205685-62941@https.bugzilla.kernel.org/>
References: <bug-205685-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=205685

sisisisol@disroot.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |sisisisol@disroot.org

--- Comment #2 from sisisisol@disroot.org ---

lsusb output

Bus 001 Device 003: ID 0a12:0001 Cambridge Silicon Radio, Ltd Bluetooth Dongle
(HCI mode)

It also doesn't work with the kernel of AVLinux (Debian + Ubuntu)

uname -a

Linux ***** 5.4.28avl2-lowlatency #22 SMP PREEMPT Fri Apr 3 05:54:55 EDT 2020
x86_64 GNU/Linux

-- 
You are receiving this mail because:
You are the assignee for the bug.
