Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCD72FD3BE
	for <lists+linux-bluetooth@lfdr.de>; Wed, 20 Jan 2021 16:19:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390499AbhATPSu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 20 Jan 2021 10:18:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:50924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390424AbhATPSK (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 20 Jan 2021 10:18:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id A8D91233EA
        for <linux-bluetooth@vger.kernel.org>; Wed, 20 Jan 2021 15:17:29 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A39FC815EB; Wed, 20 Jan 2021 15:17:29 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 210681] kernel: Bluetooth: hci0: don't support firmware rome
 0x31010000
Date:   Wed, 20 Jan 2021 15:17:29 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: janetesalesdeoliveira@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210681-62941-PsWXSpJRK6@https.bugzilla.kernel.org/>
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

jefferson (janetesalesdeoliveira@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |janetesalesdeoliveira@gmail
                   |                            |.com

--- Comment #16 from jefferson (janetesalesdeoliveira@gmail.com) ---
Install the kernel
https://mirror.netzspielplatz.de/manjaro/packages/pool/overlay/linux419-4.19.169-1-x86_64.pkg.tar.zst
$ sudo pacman -U linux419-4.19.169-1-x86_64 .pkg.tar.zst and reconfigure
grub.cfg $ sudo grub-mkconfig -o /boot/grub/grub.cfg. This kernel works well.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.
