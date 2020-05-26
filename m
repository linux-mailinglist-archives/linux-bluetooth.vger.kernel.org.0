Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52C641D01A9
	for <lists+linux-bluetooth@lfdr.de>; Wed, 13 May 2020 00:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730952AbgELWMp convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 12 May 2020 18:12:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:45932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725950AbgELWMp (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 12 May 2020 18:12:45 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 207629] BISECTED Bluetooth: hci0: command 0x2042 tx timeout -
 suspend fails - Dell XPS 9300
Date:   Tue, 12 May 2020 22:12:44 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: abhishekpandit@chromium.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207629-62941-GwruxSuro1@https.bugzilla.kernel.org/>
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

--- Comment #9 from Abhishek Pandit-Subedi (abhishekpandit@chromium.org) ---
Could you collect grab dmesg w/ dynamic debug enabled? This will give us some
confirmation about what's going on in Bluetooth (especially since 0x0c1a is
sent before 0x2042 and that should be timing out first).

Dyndebug instructions:
https://www.kernel.org/doc/html/latest/admin-guide/dynamic-debug-howto.html

Please enable debug for files hci_core.c, hci_request.c and hci_event.c:
(for example: echo 'file hci_core.c +p' > <debugfs>/dynamic_debug/control)

Collecting this is probably the most useful observation of this bunch.

--

I'm not familiar with what power hooks Ubuntu uses but it might be worth
checking the systemd-sleep programs to see if any of them are going to rfkill
bluetooth:

https://wiki.archlinux.org/index.php/Power_management#Hooks_in_/usr/lib/systemd/system-sleep

--

You can also try running `rfkill event` in shell while suspending. This might
capture any service that is rfkill-ing without your knowledge.

http://manpages.ubuntu.com/manpages/bionic/man8/rfkill.8.html

-- 
You are receiving this mail because:
You are the assignee for the bug.
