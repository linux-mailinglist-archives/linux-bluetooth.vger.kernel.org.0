Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 909552BC037
	for <lists+linux-bluetooth@lfdr.de>; Sat, 21 Nov 2020 16:20:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728188AbgKUPSl convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 21 Nov 2020 10:18:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:43924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727741AbgKUPSk (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 21 Nov 2020 10:18:40 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 208965] not working bluetooth mouse low energy rtl8822ce
Date:   Sat, 21 Nov 2020 15:18:39 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: francois@makotonoblog.be
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-208965-62941-iMnTzOvPVY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208965-62941@https.bugzilla.kernel.org/>
References: <bug-208965-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208965

Francois B (Makoto) (francois@makotonoblog.be) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |francois@makotonoblog.be

--- Comment #38 from Francois B (Makoto) (francois@makotonoblog.be) ---
(In reply to julian from comment #24)
> I must admit I am clueless...
> 
> We should probably start by comparing Laptop models and distro used to see
> if a pattern emerges.
> 
> I’m running Ubuntu 20.04 on a Huawei Matebook 13 AMD 2020 laptop. I’ve
> applied my patch on top of the 5.4.0 Ubuntu kernel
> (linux-image-unsigned-5.4.0-52-generic). I’m happy to share the .deb files
> if someone wants to give it a try.

It could be great if you can share your deb file. Thanks a lot :)

-- 
You are receiving this mail because:
You are the assignee for the bug.
