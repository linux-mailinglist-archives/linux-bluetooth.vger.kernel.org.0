Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E89662E2607
	for <lists+linux-bluetooth@lfdr.de>; Thu, 24 Dec 2020 12:09:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728058AbgLXLHu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 24 Dec 2020 06:07:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:48238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726591AbgLXLHu (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 24 Dec 2020 06:07:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 0001222255
        for <linux-bluetooth@vger.kernel.org>; Thu, 24 Dec 2020 11:07:09 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id F0644816EB; Thu, 24 Dec 2020 11:07:09 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 210681] kernel: Bluetooth: hci0: don't support firmware rome
 0x31010000
Date:   Thu, 24 Dec 2020 11:07:09 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: nizzi@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210681-62941-CxIOLK65eB@https.bugzilla.kernel.org/>
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

Lorenzo N (nizzi@outlook.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |nizzi@outlook.com

--- Comment #4 from Lorenzo N (nizzi@outlook.com) ---
Same here.

With 5.9.16 it works fine

I have an atheros ar3012 (bluetooth chipset) with kernel 5.10.2

sudo dmesg | grep hci0                                                   
[    9.739696] Bluetooth: hci0: don't support firmware rome 0x1020200

 >>> lsusb                                                                    
Bus 001 Device 002: ID 8087:8000 Intel Corp. Integrated Rate Matching Hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 003 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 002 Device 005: ID 0bda:0139 Realtek Semiconductor Corp. RTS5139 Card
Reader Controller
Bus 002 Device 004: ID 04f2:b3d8 Chicony Electronics Co., Ltd USB2.0 HD UVC
WebCam
Bus 002 Device 006: ID 13d3:3402 IMC Networks Bluetooth USB Host Controller
Bus 002 Device 002: ID 046d:c52b Logitech, Inc. Unifying Receiver
Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.
