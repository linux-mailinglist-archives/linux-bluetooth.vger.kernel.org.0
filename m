Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B92427D5C3
	for <lists+linux-bluetooth@lfdr.de>; Tue, 29 Sep 2020 20:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728206AbgI2S26 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 29 Sep 2020 14:28:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:33628 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727605AbgI2S26 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 29 Sep 2020 14:28:58 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 209403] c123 Realtek Bluetooth Radio not detected with Kernel
 5.9
Date:   Tue, 29 Sep 2020 18:28:57 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: simon@freakmail.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-209403-62941-BdiwjjpHjX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209403-62941@https.bugzilla.kernel.org/>
References: <bug-209403-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209403

Simon (simon@freakmail.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|5.9-rc6                     |5.9-rc7

--- Comment #2 from Simon (simon@freakmail.de) ---
Same with Kernel 5.9.0-050900rc7-generic #202009272231 SMP Sun Sep 27 22:33:57
UTC 2020 x86_64 x86_64 x86_64 GNU/Linux

-- 
You are receiving this mail because:
You are the assignee for the bug.
