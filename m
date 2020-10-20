Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA62B292A33
	for <lists+linux-bluetooth@lfdr.de>; Mon, 19 Oct 2020 17:18:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730102AbgJSPSU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 19 Oct 2020 11:18:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:48306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730098AbgJSPSU (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 19 Oct 2020 11:18:20 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 209745] Bluetooth connection to Logitech MX Master 2S lost
 after each reboot
Date:   Mon, 19 Oct 2020 15:18:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ales.kounovsky@seznam.cz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-209745-62941-jYiWJWYl5l@https.bugzilla.kernel.org/>
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

Ales Kounovsky (ales.kounovsky@seznam.cz) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |ales.kounovsky@seznam.cz

--- Comment #2 from Ales Kounovsky (ales.kounovsky@seznam.cz) ---
The very same issue first appeared in 5.9.0 for me, still present in 5.9.1.
tested with Logitech MX Master 2 and Logitech MX Master 3.

Laptop:    ThinkPad T14 Gen 1
CPU:       AMD Ryzen 7 PRO 4750U with Radeon Graphics (16) @ 1.700GHz
Network:   Intel Corporation Wi-Fi 6 AX200 (rev 1a)
Kernel:    Linux 5.9.1-arch1-1

-- 
You are receiving this mail because:
You are the assignee for the bug.
