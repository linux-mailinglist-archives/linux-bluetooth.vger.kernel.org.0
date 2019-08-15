Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD488E8E7
	for <lists+linux-bluetooth@lfdr.de>; Thu, 15 Aug 2019 12:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730948AbfHOKTN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 15 Aug 2019 06:19:13 -0400
Received: from mail.wl.linuxfoundation.org ([198.145.29.98]:47526 "EHLO
        mail.wl.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729838AbfHOKTN (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 15 Aug 2019 06:19:13 -0400
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
        by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 0BAF72889C
        for <linux-bluetooth@vger.kernel.org>; Thu, 15 Aug 2019 10:19:12 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
        id 003EB288A2; Thu, 15 Aug 2019 10:19:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
        pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS autolearn=ham version=3.3.1
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 204589] New: Bluetooth touchpad (Apple Magic Trackpad)
 disconnects every few minutes
Date:   Thu, 15 Aug 2019 10:19:11 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: marcpalaus@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-204589-62941@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=204589

            Bug ID: 204589
           Summary: Bluetooth touchpad (Apple Magic Trackpad) disconnects
                    every few minutes
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.2.0-050200rc7-generic #201906300430 (and older)
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Bluetooth
          Assignee: linux-bluetooth@vger.kernel.org
          Reporter: marcpalaus@hotmail.com
        Regression: No

Hello.

I initially reported this bug to Ubuntu's bugtracking system, and from there I
was redirected here.

This is the initial bug report:
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1834085

Basically the bug is described in the bug report above, together with several
log files. I have an Apple Magic Trackpad 2 connected via bluetooth which
constantly disconnects and reconnects after a few secons, and I don't think it
has to do with the bluetooth module in my computer, as other bluetooth devices
work just fine.

I have experienced this issue in kernels v4.15.0-58-generic, v5.1.14 and
v5.2-rc6.

Tell me if you need more information I should provide.

Thanks in advance.

-- 
You are receiving this mail because:
You are the assignee for the bug.
