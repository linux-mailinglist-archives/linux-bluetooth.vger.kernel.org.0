Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE72D29074F
	for <lists+linux-bluetooth@lfdr.de>; Fri, 16 Oct 2020 16:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408468AbgJPOjE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 16 Oct 2020 10:39:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:51704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406090AbgJPOjE (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 16 Oct 2020 10:39:04 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 209717] New: Bluetooth mouse Logitech M720 doesn't work
Date:   Fri, 16 Oct 2020 14:39:03 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathieu.ahtec@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-209717-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209717

            Bug ID: 209717
           Summary: Bluetooth mouse Logitech M720 doesn't work
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.9.0
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Bluetooth
          Assignee: linux-bluetooth@vger.kernel.org
          Reporter: mathieu.ahtec@gmail.com
        Regression: No

My bluetooth mouse stopped working when I moved from the kernel 5.8 to 5.9.

When I tried to pair the mouse without touching it, it didn't work. 

But if I keep on moving the mouse while pairing it, it works.

If I shutdown the computer or the mouse, I have to pair it again.


My Hardware :
Laptop : ASUS Zephyrus G14
CPU : AMD Ryzen 9 4900HS
Mouse : Logitech M720 Triathlon

-- 
You are receiving this mail because:
You are the assignee for the bug.
