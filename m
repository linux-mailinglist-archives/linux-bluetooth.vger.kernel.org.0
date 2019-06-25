Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A30A55548A
	for <lists+linux-bluetooth@lfdr.de>; Tue, 25 Jun 2019 18:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbfFYQdn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 25 Jun 2019 12:33:43 -0400
Received: from mail.wl.linuxfoundation.org ([198.145.29.98]:45210 "EHLO
        mail.wl.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726420AbfFYQdn (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 25 Jun 2019 12:33:43 -0400
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
        by mail.wl.linuxfoundation.org (Postfix) with ESMTP id C781328397
        for <linux-bluetooth@vger.kernel.org>; Tue, 25 Jun 2019 16:33:42 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
        id B4BAD28426; Tue, 25 Jun 2019 16:33:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
        pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS autolearn=ham version=3.3.1
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 203643] [REGRESSION][BISECTED] Sixaxis gamepad no longer
 connects via Bluetooth
Date:   Tue, 25 Jun 2019 16:33:41 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bluesun654@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-203643-62941-XlLj0iNUY3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203643-62941@https.bugzilla.kernel.org/>
References: <bug-203643-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=203643

Scall (bluesun654@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bluesun654@gmail.com

--- Comment #20 from Scall (bluesun654@gmail.com) ---
(In reply to Andriy Perevortkin from comment #10)
> Sadly the RFC patch above does not fix it for me, the revert does
> The device is edifier w330nb headset.

It also did not fix it for my two Sony DualShock 4 Wave Blue CUH-ZCT1 (the
issue was reproducible with both), although it did for the following devices:
* Sony DualShock 4 Glacier White CUH-ZCT1 (same generation as the Wave Blue
ones);
* Microsoft Bluetooth Mobile Keyboard 6000;
* Memteq Bluetooth Optical Mouse.

The only way to solve the issue for my two DualShock 4 Wave Blue was to revert
the culprit commit, just like it has been done recently ->
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v5.1.10&id=b528880e8b0167c34cb36c1b4e6165192f76267c

Just to confirm that patch does not work for all devices.

-- 
You are receiving this mail because:
You are the assignee for the bug.
