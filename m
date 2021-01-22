Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5269630048F
	for <lists+linux-bluetooth@lfdr.de>; Fri, 22 Jan 2021 14:51:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727958AbhAVNvF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 22 Jan 2021 08:51:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:58026 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727723AbhAVNu7 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 22 Jan 2021 08:50:59 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id DD55723A7A
        for <linux-bluetooth@vger.kernel.org>; Fri, 22 Jan 2021 13:50:18 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id DB2D3815EB; Fri, 22 Jan 2021 13:50:18 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 210681] kernel: Bluetooth: hci0: don't support firmware rome
 0x31010000
Date:   Fri, 22 Jan 2021 13:50:18 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210681-62941-3zL9vf05Iq@https.bugzilla.kernel.org/>
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

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jwrdegoede@fedoraproject.or
                   |                            |g

--- Comment #20 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Has anyone send a (direct) email to Rocky Liao, the author of the troublesome
"Bluetooth: btusb: Add Qualcomm Bluetooth SoC WCN6855 support" commit about
this?

That is likely the fastest way to get this resolved.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.
