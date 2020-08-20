Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D45324BF7D
	for <lists+linux-bluetooth@lfdr.de>; Thu, 20 Aug 2020 15:50:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728688AbgHTNjC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 20 Aug 2020 09:39:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:48674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730426AbgHTNiz (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 20 Aug 2020 09:38:55 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 207629] BISECTED Bluetooth: hci0: command 0x2042 tx timeout -
 suspend fails - Dell XPS 9300, Dell XPS 7390, Dell Inspiron 7386, Intel
 NUC7JYB
Date:   Thu, 20 Aug 2020 13:38:54 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207629-62941-kGVugyV1tK@https.bugzilla.kernel.org/>
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

--- Comment #27 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to Abhishek Pandit-Subedi from comment #25)
> Todd, can you confirm you picked up both
> https://patchwork.kernel.org/patch/11582831/ and
> https://patchwork.kernel.org/patch/11586221/?
> 
> Also, what kind of failure are you seeing? Is it failing to enter suspend
> completely? Is it waking spuriously? Is it not entering S0ix? (sent up a fix
> for this recently)
> 
> It would be helpful to have logs for a failure case. Could you collect some
> logs with dynamic debug for BT (see comment #11) and collect a btmon trace
> (btmon -w /tmp/btsnoop) when reproducing this issue?

Why haven't these patches been merged with stable? Linux 5.7.15 has neither of
them.

-- 
You are receiving this mail because:
You are the assignee for the bug.
