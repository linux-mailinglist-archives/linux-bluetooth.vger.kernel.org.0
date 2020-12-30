Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 624862E7759
	for <lists+linux-bluetooth@lfdr.de>; Wed, 30 Dec 2020 10:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbgL3JQV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 30 Dec 2020 04:16:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:58836 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725814AbgL3JQU (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 30 Dec 2020 04:16:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 64F52221F8
        for <linux-bluetooth@vger.kernel.org>; Wed, 30 Dec 2020 09:15:40 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 5366D8673C; Wed, 30 Dec 2020 09:15:40 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 210681] kernel: Bluetooth: hci0: don't support firmware rome
 0x31010000
Date:   Wed, 30 Dec 2020 09:15:40 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: antdev66@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210681-62941-w4dMDGd8vU@https.bugzilla.kernel.org/>
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

--- Comment #11 from Antonio (antdev66@gmail.com) ---
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


I have tried it (kernel 5.10.3), I confirm that it works.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.
