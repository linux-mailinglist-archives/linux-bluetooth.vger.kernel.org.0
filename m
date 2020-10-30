Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BABEC2A0216
	for <lists+linux-bluetooth@lfdr.de>; Fri, 30 Oct 2020 11:05:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbgJ3KFw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 30 Oct 2020 06:05:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:45736 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725808AbgJ3KFw (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 30 Oct 2020 06:05:52 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 86931] hid-generic 0005:099A:0500.0001: unknown main item tag
 0x0
Date:   Fri, 30 Oct 2020 10:05:51 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jeroenjeurissen@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-86931-62941-XR7074kfUA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-86931-62941@https.bugzilla.kernel.org/>
References: <bug-86931-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=86931

Jeroen Jeurissen (jeroenjeurissen@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jeroenjeurissen@gmail.com

--- Comment #7 from Jeroen Jeurissen (jeroenjeurissen@gmail.com) ---
I have the same issues with my bluetooth keybloard on 5.9.2-1.g4133ad1-default
(Tumbleweed).

hid-generic 0005:04CA:006C.0009: unknown main item tag 0x0

Very annoying.

-- 
You are receiving this mail because:
You are the assignee for the bug.
