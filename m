Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 667841CD025
	for <lists+linux-bluetooth@lfdr.de>; Mon, 11 May 2020 05:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727094AbgEKDFz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 10 May 2020 23:05:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:54924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725830AbgEKDFz (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 10 May 2020 23:05:55 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 207629] BISECTED Bluetooth: hci0: command 0x2042 tx timeout -
 suspend fails - Dell XPS 9300
Date:   Mon, 11 May 2020 03:05:54 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lenb@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc short_desc
Message-ID: <bug-207629-62941-Yc2xFJcOYw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207629-62941@https.bugzilla.kernel.org/>
References: <bug-207629-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207629

Len Brown (lenb@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |abhishekpandit@chromium.org
            Summary|Bluetooth: hci0: command    |BISECTED Bluetooth: hci0:
                   |0x2042 tx timeout - suspend |command 0x2042 tx timeout -
                   |fails - Dell XPS 9300       |suspend fails - Dell XPS
                   |                            |9300

--- Comment #4 from Len Brown (lenb@kernel.org) ---
dd522a7429b07e4441871ae75ebbfcf53635bdd4 is the first bad commit
commit dd522a7429b07e4441871ae75ebbfcf53635bdd4
Author: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date:   Wed Mar 11 08:54:02 2020 -0700

    Bluetooth: Handle LE devices during suspend

    To handle LE devices, we must first disable passive scanning and
    disconnect all connected devices. Once that is complete, we update the
    whitelist and re-enable scanning

    Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
    Signed-off-by: Marcel Holtmann <marcel@holtmann.org>


Unfortunately this commit, by itself, does not cleanly revert from upstream.

-- 
You are receiving this mail because:
You are the assignee for the bug.
