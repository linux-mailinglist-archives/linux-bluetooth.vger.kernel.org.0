Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBE8E2DE222
	for <lists+linux-bluetooth@lfdr.de>; Fri, 18 Dec 2020 12:43:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726301AbgLRLng convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 18 Dec 2020 06:43:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:51042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726297AbgLRLnf (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 18 Dec 2020 06:43:35 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 210453] rtl8822cu device : "Bluetooth : No device found"
Date:   Fri, 18 Dec 2020 11:42:55 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: forum.viennet@free.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210453-62941-jtofVgJ2HV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210453-62941@https.bugzilla.kernel.org/>
References: <bug-210453-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=210453

--- Comment #2 from Olivier V (forum.viennet@free.fr) ---
As asked here https://bugs.launchpad.net/ubuntu/+s...x/+bug/1906515 I've done a
git bisect.

Here is the answer :

meloli@Asus-A17:~/Bureau/meloli/GITBISECT/linux$ git bisect bad
b2cc23398e8166b38f8715026273503b081c2a7a is the first bad commit
commit b2cc23398e8166b38f8715026273503b081c2a7a
Author: Sathish Narasimman <nsathish41@gmail.com>
Date:   Thu Jul 23 18:09:02 2020 +0530

    Bluetooth: Enable RPA Timeout

    Enable RPA timeout during bluetooth initialization.
    The RPA timeout value is used from hdev, which initialized from
    debug_fs

    Signed-off-by: Sathish Narasimman <sathish.narasimman@intel.com>
    Signed-off-by: Marcel Holtmann <marcel@holtmann.org>

 include/net/bluetooth/hci.h | 2 ++
 net/bluetooth/hci_core.c    | 8 ++++++++
 2 files changed, 10 insertions(+)

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.
