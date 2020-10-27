Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28E5029B84F
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Oct 2020 17:08:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1800010AbgJ0Peg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 27 Oct 2020 11:34:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:52876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1800003AbgJ0Pef (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 27 Oct 2020 11:34:35 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 209745] Bluetooth connection to Logitech MX Master 2S lost
 after each reboot
Date:   Tue, 27 Oct 2020 15:34:34 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: matias@ufscar.br
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-209745-62941-mLcZRDKC9U@https.bugzilla.kernel.org/>
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

matias (matias@ufscar.br) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |matias@ufscar.br

--- Comment #5 from matias (matias@ufscar.br) ---
Same problem for me since 5.9.0 (remains with 5.9.1).

Adapter: USB, ID 8087:0025 Intel Corp. Wireless-AC 9260 Bluetooth Adapter

Tested with the following Bluetooth devices:

* Logitech MX Anywhere 2S: Requires a re-pair every time the radio goes off
either at the computer or at the device.

* Logitech MX Anywhere 2: Requires a re-pair every time the radio goes off
either at the computer or at the device.

* WI-XB400: Does not autoconnect to the computer after turned on, but works
after manually asking to connect on bluetoothctl. Does not require a re-pair.

-- 
You are receiving this mail because:
You are the assignee for the bug.
