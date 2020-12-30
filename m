Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 076C12E799F
	for <lists+linux-bluetooth@lfdr.de>; Wed, 30 Dec 2020 14:22:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgL3NVn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 30 Dec 2020 08:21:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:60112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726908AbgL3NVn (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 30 Dec 2020 08:21:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 1C0D5223C8
        for <linux-bluetooth@vger.kernel.org>; Wed, 30 Dec 2020 13:21:03 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1869281F1E; Wed, 30 Dec 2020 13:21:03 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 209745] Bluetooth connection to Logitech MX Master 2S lost
 after each reboot
Date:   Wed, 30 Dec 2020 13:21:02 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kernel@cschramm.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209745-62941-dHzBCkbFxJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209745-62941@https.bugzilla.kernel.org/>
References: <bug-209745-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209745

--- Comment #18 from Christopher Schramm (kernel@cschramm.eu) ---
The fix found its way into 5.10.4 and 5.11-rc1.

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/net/bluetooth/hci_request.c?id=c98d3357920623bbb5a316907bfbc9c300552873

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/net/bluetooth/hci_request.c?id=1fb17dfc258ff6208f7873cc7b8e40e27515d2d5

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.
