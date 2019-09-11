Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F02FAF7F2
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Sep 2019 10:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbfIKI3r convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 11 Sep 2019 04:29:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:51756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727079AbfIKI3r (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 11 Sep 2019 04:29:47 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 200039] BT advertising packet wakes up the system from S3 and
 suspend-to-idle
Date:   Wed, 11 Sep 2019 08:29:46 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tom@hale.ee
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-200039-62941-2YAoMtzgy9@https.bugzilla.kernel.org/>
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

Tom Hale (tom@hale.ee) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |tom@hale.ee

--- Comment #34 from Tom Hale (tom@hale.ee) ---
--- WORKAROUND ---

I've posted a systemd unit file and script on Unix and Linux Stack Exchange
which automatically disables and re-enables the USB bluetooth device on sleep /
suspend.

https://unix.stackexchange.com/questions/539762/how-do-i-suspend-sleep-while-bluetooth-is-active/539763#539763

-- 
You are receiving this mail because:
You are the assignee for the bug.
