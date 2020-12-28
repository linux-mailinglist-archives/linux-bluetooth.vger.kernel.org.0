Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B39112E687F
	for <lists+linux-bluetooth@lfdr.de>; Mon, 28 Dec 2020 17:37:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436478AbgL1QhQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 28 Dec 2020 11:37:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:42222 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2442016AbgL1Qgo (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 28 Dec 2020 11:36:44 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id BAA0C208D5
        for <linux-bluetooth@vger.kernel.org>; Mon, 28 Dec 2020 16:36:03 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B6A3B81F1E; Mon, 28 Dec 2020 16:36:03 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 209745] Bluetooth connection to Logitech MX Master 2S lost
 after each reboot
Date:   Mon, 28 Dec 2020 16:36:03 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Krzysztof.Krason@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-209745-62941-2xfsjfZMTt@https.bugzilla.kernel.org/>
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

Krzysztof.Krason@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |Krzysztof.Krason@gmail.com

--- Comment #17 from Krzysztof.Krason@gmail.com ---
I'm using kernel 5.10.1 (mainline, downloaded from kernel.org) and the issue
still exists.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.
