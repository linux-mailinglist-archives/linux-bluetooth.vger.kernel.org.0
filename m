Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CEA527F666
	for <lists+linux-bluetooth@lfdr.de>; Thu,  1 Oct 2020 01:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730736AbgI3X7o convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 30 Sep 2020 19:59:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:48524 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725372AbgI3X7n (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 30 Sep 2020 19:59:43 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 204765] debugfs: File 'le_min_key_size' in directory 'hci0'
 already present!
Date:   Wed, 30 Sep 2020 23:59:43 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mirh@protonmail.ch
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204765-62941-TcIpJFdcNJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204765-62941@https.bugzilla.kernel.org/>
References: <bug-204765-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=204765

mirh (mirh@protonmail.ch) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mirh@protonmail.ch

--- Comment #11 from mirh (mirh@protonmail.ch) ---
Of course you are seeing that error if you use 5.4 and the fix landed in 5.6
with no backports?

If any the true shame is that nobody has yet addressed the same problem with
"force_bredr_smp"

-- 
You are receiving this mail because:
You are the assignee for the bug.
