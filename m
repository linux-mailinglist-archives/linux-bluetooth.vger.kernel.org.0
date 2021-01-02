Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9522B2E877F
	for <lists+linux-bluetooth@lfdr.de>; Sat,  2 Jan 2021 14:45:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbhABNoI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 2 Jan 2021 08:44:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:39594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726567AbhABNoI (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 2 Jan 2021 08:44:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 943F122482
        for <linux-bluetooth@vger.kernel.org>; Sat,  2 Jan 2021 13:43:27 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7C5BB8162C; Sat,  2 Jan 2021 13:43:27 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 204765] debugfs: File 'le_min_key_size' in directory 'hci0'
 already present!
Date:   Sat, 02 Jan 2021 13:43:27 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: icegood1980@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204765-62941-lvxcvjHdJj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204765-62941@https.bugzilla.kernel.org/>
References: <bug-204765-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=204765

Sergey Ivanov (icegood1980@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |icegood1980@gmail.com

--- Comment #13 from Sergey Ivanov (icegood1980@gmail.com) ---
Hi all. I don't see why only 5.11 fixes this. As for me I see such an issue
after BT was off and there was the sleep of laptop. 

debugfs: File 'force_bredr_smp' in directory 'hci0' already present!

uname -a
Linux ice-ubuntu 5.8.0-34-generic #37-Ubuntu SMP Thu Dec 10 18:01:14 UTC 2020
x86_64 x86_64 x86_64 GNU/Linux

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.
