Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EB83291893
	for <lists+linux-bluetooth@lfdr.de>; Sun, 18 Oct 2020 19:18:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgJRRSC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 18 Oct 2020 13:18:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:56108 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726357AbgJRRSC (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 18 Oct 2020 13:18:02 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 209717] Bluetooth mouse Logitech M720 doesn't work
Date:   Sun, 18 Oct 2020 17:18:01 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: leho@kraav.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-209717-62941-u7DF6k5ZZX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209717-62941@https.bugzilla.kernel.org/>
References: <bug-209717-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209717

Leho Kraav (leho@kraav.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |leho@kraav.com

--- Comment #1 from Leho Kraav (leho@kraav.com) ---
Yes, something is wrong with 5.9 bluetooth stack.

My DELL keyboard and MX Ergo mouse both stop connecting after upgrading from
5.8.

I managed to somehow reconnect them once, but after they disconnect in idle,
they fail to reconnect on their own and no amount of bluetooth toggling gets
them back.

BT toggling shows "[13543.597906] Bluetooth: hci0: HCI reset during shutdown
failed" in demsg.

-- 
You are receiving this mail because:
You are the assignee for the bug.
