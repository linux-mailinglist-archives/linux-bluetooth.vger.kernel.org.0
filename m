Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06F681B76B3
	for <lists+linux-bluetooth@lfdr.de>; Fri, 24 Apr 2020 15:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726954AbgDXNOZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 24 Apr 2020 09:14:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:35270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726301AbgDXNOY (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 24 Apr 2020 09:14:24 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 60824] [PATCH][regression] Cambridge Silicon Radio, Ltd
 Bluetooth Dongle unusable
Date:   Fri, 24 Apr 2020 13:14:22 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paul.chaffey@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-60824-62941-qSMGFWNruP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-60824-62941@https.bugzilla.kernel.org/>
References: <bug-60824-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=60824

Paul Chaffey (paul.chaffey@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |paul.chaffey@gmail.com

--- Comment #62 from Paul Chaffey (paul.chaffey@gmail.com) ---
Will this patch get back-ported to 5.4.0-XX for *ubuntu LTS 20.04 ?


I have the same issue:

"Patch for CSR 0a12:0001 88.19 (kernel 5.4.14)"

"I bumped the patch for bcdDevice == 88.91, this makes it work with 5.4.14
kernel with the device below...."

I've added the fixups option to crs-bluetoothbongle.conf "options btusb
fixups=0x0800000:0x000004:0x0a12:0x0001:0x8891" which obviously reports unknown
option without the patch.

Currently using kubuntu 20.04 Linux server-2020 5.4.0-26-generic #30-Ubuntu SMP
Mon Apr 20 16:58:30 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux

I was hoping that this would turn up with an Ubuntu update 🤔

-- 
You are receiving this mail because:
You are the assignee for the bug.
