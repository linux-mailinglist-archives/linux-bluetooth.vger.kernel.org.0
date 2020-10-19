Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC1FA2926AE
	for <lists+linux-bluetooth@lfdr.de>; Mon, 19 Oct 2020 13:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbgJSLvD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 19 Oct 2020 07:51:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:44074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726736AbgJSLvC (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 19 Oct 2020 07:51:02 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 209717] Bluetooth mouse Logitech M720 doesn't work
Date:   Mon, 19 Oct 2020 11:51:01 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: leho@kraav.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209717-62941-kkCfsTaSAv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209717-62941@https.bugzilla.kernel.org/>
References: <bug-209717-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209717

--- Comment #4 from Leho Kraav (leho@kraav.com) ---
I downgraded to 5.8.16 and everything seems to be working fine again across my
home / work locations.

So this does not seem to be about BleedingTooth patches, but something deeper
changed during 5.8 -> 5.9 cycle. Unfortunately I don't have to bandwidth to
bisect.

-- 
You are receiving this mail because:
You are the assignee for the bug.
