Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 241132D4260
	for <lists+linux-bluetooth@lfdr.de>; Wed,  9 Dec 2020 13:48:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731758AbgLIMrt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 9 Dec 2020 07:47:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:51090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730658AbgLIMrt (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 9 Dec 2020 07:47:49 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 203753] Bluetooth: hci0: advertising data len corrected
Date:   Wed, 09 Dec 2020 12:47:08 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andras.tim@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-203753-62941-hugcYXT4So@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203753-62941@https.bugzilla.kernel.org/>
References: <bug-203753-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=203753

--- Comment #4 from Andras Tim (andras.tim@gmail.com) ---
(In reply to Andras Tim from comment #2)
> This problem is affected me also on Ubuntu 20.20 with
> Linux tia 4.15.0-122-generic #124~16.04.1-Ubuntu SMP Thu Oct 15 16:08:36 UTC
> 2020 x86_64 x86_64 x86_64 GNU/Linux

Unfortunately, I copied wrong kernel version. The affected is:

[kernel]
Linux server 5.4.0-56-generic #62-Ubuntu SMP Mon Nov 23 19:20:19 UTC 2020
x86_64 x86_64 x86_64 GNU/Linux

[bluez]
5.53-0ubuntu3

[dongle]
Bus 001 Device 014: ID 0a12:0001 Cambridge Silicon Radio, Ltd Bluetooth Dongle
(HCI mode

-- 
You are receiving this mail because:
You are the assignee for the bug.
