Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B94BEB00DB
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Sep 2019 18:05:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728917AbfIKQFs convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 11 Sep 2019 12:05:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:55948 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728837AbfIKQFs (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 11 Sep 2019 12:05:48 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 200039] BT advertising packet wakes up the system from S3 and
 suspend-to-idle
Date:   Wed, 11 Sep 2019 16:05:47 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: luiz.dentz@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-200039-62941-LDjfx93EuO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-200039-62941@https.bugzilla.kernel.org/>
References: <bug-200039-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=200039

--- Comment #36 from Luiz Von Dentz (luiz.dentz@gmail.com) ---
(In reply to Mario Limonciello from comment #35)
> @Tom:
> 
> The offending commit that caused this behavior is being reverted for 5.4:
> https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git/
> commit/?id=1ffdb51f28e8ec6be0a2b812c1765b5cf5c44a8f
> 
> You may also need to update to latest linux-firmware.git as well if your
> distro has old firmware.

Is is actually disabling remote wakeup? Doesn't that disable RX to wakeup the
host which pretty much breaks any traffic initiate from either the controller
or the remote device? If that is the case we might as well remove support for
auto-suspend since this would never gonna work if the controller cannot wakeup
the host.

-- 
You are receiving this mail because:
You are the assignee for the bug.
