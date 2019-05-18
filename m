Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CBB522443
	for <lists+linux-bluetooth@lfdr.de>; Sat, 18 May 2019 19:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729206AbfERRf7 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 18 May 2019 13:35:59 -0400
Received: from mail.wl.linuxfoundation.org ([198.145.29.98]:59094 "EHLO
        mail.wl.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727380AbfERRf7 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 18 May 2019 13:35:59 -0400
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
        by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 7D6CE284D2
        for <linux-bluetooth@vger.kernel.org>; Sat, 18 May 2019 17:35:58 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
        id 581E328555; Sat, 18 May 2019 17:35:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
        pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS autolearn=ham version=3.3.1
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 203643] New: [REGRESSION][BISECTED] Sixaxis gamepad no longer
 connects via Bluetooth
Date:   Sat, 18 May 2019 17:35:57 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: spaz16@wp.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-203643-62941@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=203643

            Bug ID: 203643
           Summary: [REGRESSION][BISECTED] Sixaxis gamepad no longer
                    connects via Bluetooth
           Product: Drivers
           Version: 2.5
    Kernel Version: 4.14.119, 4.19.42, 5.0.16, 5.1.3
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Bluetooth
          Assignee: linux-bluetooth@vger.kernel.org
          Reporter: spaz16@wp.pl
        Regression: No

Hi,

Since commit d5bb334a8e171b262e48f378bd2096c0ea458265 some devices doesn't
connect via bluetooth (like Sixaxis gamepad). 'bluetoothctl' shows that device
is connected, and soon after disconnected.

Link for commit which causes the issue:
https://github.com/torvalds/linux/commit/d5bb334a8e171b262e48f378bd2096c0ea458265

I checked the "conn->enc_key_size", it reports the value of 0 for Sixaxis
gamepad (not the value of 7, which is the minimum encryption key size).

I noticed that other people also having issue after kernel upgrade, but I'm not
sure if it exactly the same bug:
https://forum.manjaro.org/t/solved-bluetooth-fail-after-2019-05-17-stable-update/87892

-- 
You are receiving this mail because:
You are the assignee for the bug.
