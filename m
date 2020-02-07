Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A6A4155C20
	for <lists+linux-bluetooth@lfdr.de>; Fri,  7 Feb 2020 17:50:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbgBGQuY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 7 Feb 2020 11:50:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:49136 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726874AbgBGQuY (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 7 Feb 2020 11:50:24 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 60824] [PATCH][regression] Cambridge Silicon Radio, Ltd
 Bluetooth Dongle unusable
Date:   Fri, 07 Feb 2020 16:50:21 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Abhishekkumartux@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-60824-62941-DTPmN3Cmon@https.bugzilla.kernel.org/>
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

Abhishekkumartux@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |Abhishekkumartux@gmail.com

--- Comment #50 from Abhishekkumartux@gmail.com ---
Hey guys,
I can also confirm that the adapter is not getting recognized.

uname -r   
5.5.2-arch1-1

journalctl -f
Feb 07 10:46:21 archlinux kernel: usb 1-5.3: new full-speed USB device number 9
using xhci_hcd
Feb 07 10:46:21 archlinux kernel: usb 1-5.3: New USB device found,
idVendor=0a12, idProduct=0001, bcdDevice=88.91
Feb 07 10:46:21 archlinux kernel: usb 1-5.3: New USB device strings: Mfr=0,
Product=2, SerialNumber=0
Feb 07 10:46:21 archlinux kernel: usb 1-5.3: Product: CSR8510 A10
Feb 07 10:46:21 archlinux krunner[3104]: UdevQt: unhandled device action "bind"
Feb 07 10:46:21 archlinux kded5[846]: UdevQt: unhandled device action "bind"
Feb 07 10:46:21 archlinux systemd[794]: Reached target Bluetooth.
Feb 07 10:46:21 archlinux systemd[1]: Reached target Bluetooth.
Feb 07 10:46:21 archlinux plasmashell[903]: UdevQt: unhandled device action
"bind"
Feb 07 10:46:21 archlinux kmix[990]: UdevQt: unhandled device action "bind"
Feb 07 10:46:21 archlinux dolphin[971]: UdevQt: unhandled device action "bind"
Feb 07 10:46:21 archlinux dolphin[978]: UdevQt: unhandled device action "bind"
Feb 07 10:46:21 archlinux baloo_file[901]: UdevQt: unhandled device action
"bind"
Feb 07 10:46:21 archlinux plasmashell[903]: UdevQt: unhandled device action
"bind"
Feb 07 10:46:21 archlinux baloo_file[901]: UdevQt: unhandled device action
"bind"
Feb 07 10:46:21 archlinux dolphin[971]: UdevQt: unhandled device action "bind"
Feb 07 10:46:21 archlinux dolphin[978]: UdevQt: unhandled device action "bind"
Feb 07 10:46:21 archlinux kded5[846]: UdevQt: unhandled device action "bind"
Feb 07 10:46:21 archlinux kmix[990]: UdevQt: unhandled device action "bind"
Feb 07 10:46:21 archlinux krunner[3104]: UdevQt: unhandled device action "bind"
Feb 07 10:46:21 archlinux krunner[3104]: UdevQt: unhandled device action "bind"
Feb 07 10:46:21 archlinux baloo_file[901]: UdevQt: unhandled device action
"bind"
Feb 07 10:46:21 archlinux plasmashell[903]: UdevQt: unhandled device action
"bind"
Feb 07 10:46:21 archlinux kded5[846]: UdevQt: unhandled device action "bind"
Feb 07 10:46:21 archlinux kmix[990]: UdevQt: unhandled device action "bind"
Feb 07 10:46:21 archlinux dolphin[971]: UdevQt: unhandled device action "bind"
Feb 07 10:46:21 archlinux dolphin[978]: UdevQt: unhandled device action "bind"
Feb 07 10:46:21 archlinux bluetooth-meshd[641]: Hci dev 0000 removed
Feb 07 10:46:21 archlinux bluetooth-meshd[641]: Failed to initialize HCI
Feb 07 10:46:26 archlinux systemd[1]: systemd-rfkill.service: Succeeded.

bluetoothctl  
Agent registered
[bluetooth]# devices
No default controller available

rfkill list   
2: hci0: Bluetooth
        Soft blocked: no
        Hard blocked: no

-- 
You are receiving this mail because:
You are the assignee for the bug.
