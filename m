Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F19F2D47BA
	for <lists+linux-bluetooth@lfdr.de>; Wed,  9 Dec 2020 18:19:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728739AbgLIRTe convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 9 Dec 2020 12:19:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:36006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726805AbgLIRTd (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 9 Dec 2020 12:19:33 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 210141] Bluetooth device driven by rtw_8822ce is lost after
 suspend to RAM
Date:   Wed, 09 Dec 2020 17:18:53 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: ericlevy@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210141-62941-AjcggCnVS5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210141-62941@https.bugzilla.kernel.org/>
References: <bug-210141-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=210141

ericlevy@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |ericlevy@gmail.com

--- Comment #2 from ericlevy@gmail.com ---
Confirmed. Same problem using RTL8821CE under Mint 2.0 kernel 5.8.0-31.


Would be nice if a workaround might be identified, in advance of a fix.
Currently I am rebooting whenever I need to regain use of bluetooth.

-- 
You are receiving this mail because:
You are the assignee for the bug.
