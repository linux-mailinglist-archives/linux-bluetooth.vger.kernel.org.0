Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B00F9305993
	for <lists+linux-bluetooth@lfdr.de>; Wed, 27 Jan 2021 12:24:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S313694AbhAZW6D convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 26 Jan 2021 17:58:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:58552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389181AbhAZQ7G (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 26 Jan 2021 11:59:06 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 3C26122EBD
        for <linux-bluetooth@vger.kernel.org>; Tue, 26 Jan 2021 16:52:15 +0000 (UTC)
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 3803E651E0; Tue, 26 Jan 2021 16:52:15 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 210681] kernel: Bluetooth: hci0: don't support firmware rome
 0x31010000
Date:   Tue, 26 Jan 2021 16:52:13 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: moreno.giussani@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-210681-62941-Rlhe1XFZQh@https.bugzilla.kernel.org/>
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

Moreno G (moreno.giussani@protonmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |moreno.giussani@protonmail.
                   |                            |com

--- Comment #22 from Moreno G (moreno.giussani@protonmail.com) ---
Created attachment 294865
  --> https://bugzilla.kernel.org/attachment.cgi?id=294865&action=edit
fix hci0: warn only if high rome

(In reply to Bradley Jarvis from comment #10)
> Created attachment 294393 [details]
> fix hci0: don't support firmware rome error
> 
> Avoid returning error code when bluetooth version match is not made from
> qca_devices_table and version high is set.
> 
> This reverts an error check that was removed to support WCN6855 which does
> have the high version set. The fix is to move the check after the table is
> scanned and no version match is made.
> 
> This fix will still produce the error message for example (for ATK3K
> 13d3:3402 IMC Networks Bluetooth USB Host Controller)
> 
> Bluetooth: hci0: don't support firmware rome 0x1020200
> 
> But the bluetooth hardware still works as it used to

Like Bradley Jarvis' fix, but it won't produce an error message but a warning
message for a possible incompatibility. Reverted the "don't care" comments for
other high ROM versions. Just my 2 cents

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.
