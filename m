Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A62D717CFFD
	for <lists+linux-bluetooth@lfdr.de>; Sat,  7 Mar 2020 21:25:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgCGUZy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 7 Mar 2020 15:25:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:40932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726174AbgCGUZy (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 7 Mar 2020 15:25:54 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 206235] kernel BUG at mm/slub.c:294
Date:   Sat, 07 Mar 2020 20:25:53 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: steffen@sdaoden.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206235-62941-feQOzuXvfJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206235-62941@https.bugzilla.kernel.org/>
References: <bug-206235-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=206235

--- Comment #2 from Steffen Nurpmeso (steffen@sdaoden.eu) ---
P.S.: that zzz.sh has also

   command -v rfkill >/dev/null 2>&1 &&
      act '( rfkill block all ) </dev/null & sleep 2'

which should be the "rfkill".

I know the r8822be module (the only one, i cannot link it in) is in staging on
4.19.  (It seems to have been integrated in 5.4, yet i have had not time to
update to that one.)  It works just fine, how ever large it is, but i want to
remark that Wifi can get down to ISDN speed and less if i hear music via
bluetooth.  Not always, but in such situations, if i stop listening to music
via bluetooth, Wifi speed goes up to 3.6 Mbit per second (the maximum here)
immediately.

-- 
You are receiving this mail because:
You are the assignee for the bug.
