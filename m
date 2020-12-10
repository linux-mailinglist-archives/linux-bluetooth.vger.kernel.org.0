Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8862D5C31
	for <lists+linux-bluetooth@lfdr.de>; Thu, 10 Dec 2020 14:47:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732601AbgLJNr3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 10 Dec 2020 08:47:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:46778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726253AbgLJNr3 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 10 Dec 2020 08:47:29 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 210595] Gamepad Sony PLAYSTATION(R)3 Controller doesn't pair
Date:   Thu, 10 Dec 2020 13:46:48 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: orbea@riseup.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210595-62941-9GiZJccAgS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210595-62941@https.bugzilla.kernel.org/>
References: <bug-210595-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=210595

--- Comment #3 from orbea@riseup.net ---
I followed the instructions described in the gentoo wiki and in similar issues.
The results always seem the same.

https://wiki.gentoo.org/wiki/Sony_DualShock#DualShock_3
https://bugzilla.kernel.org/show_bug.cgi?id=200009

I also have both a Shenwen and Gasia ds3 gamepads which fail in the same way.

-- 
You are receiving this mail because:
You are the assignee for the bug.
