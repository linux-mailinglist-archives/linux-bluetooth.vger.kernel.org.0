Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88A342926E3
	for <lists+linux-bluetooth@lfdr.de>; Mon, 19 Oct 2020 14:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbgJSMAW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 19 Oct 2020 08:00:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:52790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726087AbgJSMAW (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 19 Oct 2020 08:00:22 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 209745] New: Bluetooth connection to Logitech MX Master 2S lost
 after each reboot
Date:   Mon, 19 Oct 2020 12:00:21 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lithium@live.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-209745-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209745

            Bug ID: 209745
           Summary: Bluetooth connection to Logitech MX Master 2S lost
                    after each reboot
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.9.1
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Bluetooth
          Assignee: linux-bluetooth@vger.kernel.org
          Reporter: lithium@live.com
        Regression: No

Bluetooth connection to Logitech mouse lost after upgrading to kernel 5.9.1.
I have to remove the paired mouse and re-pair it every time I login to make it
work.


Laptop:    ThinkPad T14 Gen 1
CPU:       AMD Ryzen 7 PRO 4750U with Radeon Graphics (16) @ 1.700GHz
Network:   Intel Corporation Wi-Fi 6 AX200 (rev 1a)
Kernel:    Linux 5.9.1-arch1-1

-- 
You are receiving this mail because:
You are the assignee for the bug.
