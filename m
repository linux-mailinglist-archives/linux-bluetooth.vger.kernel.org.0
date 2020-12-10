Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB8732D5697
	for <lists+linux-bluetooth@lfdr.de>; Thu, 10 Dec 2020 10:17:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730988AbgLJJQM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 10 Dec 2020 04:16:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:59560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731713AbgLJJQJ (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 10 Dec 2020 04:16:09 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 210595] Gamepad Sony PLAYSTATION(R)3 Controller doesn't pair
Date:   Thu, 10 Dec 2020 09:15:28 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bugzilla@hadess.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210595-62941-cdSWAy3Md4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210595-62941@https.bugzilla.kernel.org/>
References: <bug-210595-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=210595

Bastien Nocera (bugzilla@hadess.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bugzilla@hadess.net

--- Comment #2 from Bastien Nocera (bugzilla@hadess.net) ---
(In reply to Szymon Janc from comment #1)
> Hi,
> 
> AFAIR DS3 doesn't support pairing. You need to use sixaxis plugin in bluez
> and configure it via USB.
> 
> steps:
> make sure you DS3 is not connected over BT
> plug it via USB
> unplug
> press PS button
> authorize incoming bluetooth connection from BT

No. It's supposed to be:
- start bluetoothctl or GNOME Settings
- plug it in via USB
- allow pairing
- unplug
- press the PS button

-- 
You are receiving this mail because:
You are the assignee for the bug.
