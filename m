Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8BB530019C
	for <lists+linux-bluetooth@lfdr.de>; Fri, 22 Jan 2021 12:32:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727275AbhAVLba convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 22 Jan 2021 06:31:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:58696 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728371AbhAVL2p (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 22 Jan 2021 06:28:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 367BF23A5B
        for <linux-bluetooth@vger.kernel.org>; Fri, 22 Jan 2021 11:28:03 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 342D581649; Fri, 22 Jan 2021 11:28:03 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 210681] kernel: Bluetooth: hci0: don't support firmware rome
 0x31010000
Date:   Fri, 22 Jan 2021 11:28:02 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: steeve.mccauley@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210681-62941-VxEt3Ep1oo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210681-62941@https.bugzilla.kernel.org/>
References: <bug-210681-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=210681

Steeve McCauley (steeve.mccauley@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |steeve.mccauley@gmail.com

--- Comment #18 from Steeve McCauley (steeve.mccauley@gmail.com) ---
(In reply to Bradley Jarvis from comment #10)
> Created attachment 294393 [details]
> fix hci0: don't support firmware rome error
> 
> Avoid returning error code when bluetooth version match is not made from


Can confirm that this issue exists on fedora 33 5.10.x kernel for atheros usb
bluetooth.  Installing a kernel.org kernel with Bradley's fix solves the
problem.
The adaptor shows up as Lite-On Technologoy Corp: Bus 001 Device 004: ID
04ca:3006 Lite-On Technology Corp.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.
