Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B73828DCE1
	for <lists+linux-bluetooth@lfdr.de>; Wed, 14 Aug 2019 20:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728421AbfHNSXA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 14 Aug 2019 14:23:00 -0400
Received: from mail.wl.linuxfoundation.org ([198.145.29.98]:44338 "EHLO
        mail.wl.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728188AbfHNSXA (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 14 Aug 2019 14:23:00 -0400
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
        by mail.wl.linuxfoundation.org (Postfix) with ESMTP id AAAAB288AA
        for <linux-bluetooth@vger.kernel.org>; Wed, 14 Aug 2019 18:22:59 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
        id 9EF4F288A2; Wed, 14 Aug 2019 18:22:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
        pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS autolearn=ham version=3.3.1
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 204585] New: Bluetooth Mouse Polling Rate Regressed to 20hz
Date:   Wed, 14 Aug 2019 18:22:59 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: worryag@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-204585-62941@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=204585

            Bug ID: 204585
           Summary: Bluetooth Mouse Polling Rate Regressed to 20hz
           Product: Drivers
           Version: 2.5
    Kernel Version: Linux arch 5.2.8-arch1-1-ARCH
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Bluetooth
          Assignee: linux-bluetooth@vger.kernel.org
          Reporter: worryag@gmail.com
        Regression: No

The problem arose with Microsoft BluetoothMouse3600. When you turn on the mouse
behaves sluggishly. The evhz utility shows a polling rate of 20Hz. The problem
is solved by changing the max and min values of the connection.

/usr/bin/hcitool con | grep " handle " | awk '{print $5}' | xargs -I {}
/usr/bin/hcitool lecup --handle {}  --min 6 --max 7 --latency 0

Maybe you should change the default value of conn_min_interval and
conn_max_interval.
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/net/bluetooth?h=v5.2.8&id=33401f6ba0d9f23ca5877540375b88d7cd5b1f8f

-- 
You are receiving this mail because:
You are the assignee for the bug.
