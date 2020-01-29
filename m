Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBC5614C68F
	for <lists+linux-bluetooth@lfdr.de>; Wed, 29 Jan 2020 07:35:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726020AbgA2Gfu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 29 Jan 2020 01:35:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:46946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725866AbgA2Gfu (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 29 Jan 2020 01:35:50 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 99881] 2015 Apple bluetooth keybord and magic mouse support
Date:   Wed, 29 Jan 2020 06:35:49 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mansour@oxplot.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-99881-62941-42ekUcJkic@https.bugzilla.kernel.org/>
In-Reply-To: <bug-99881-62941@https.bugzilla.kernel.org/>
References: <bug-99881-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=99881

--- Comment #66 from Mansour Behabadi (mansour@oxplot.com) ---
Submitted a patch to the kernel: https://lkml.org/lkml/2020/1/29/61 potentially
fixing https://bugzilla.kernel.org/show_bug.cgi?id=99881#c62 ,
https://bugzilla.kernel.org/show_bug.cgi?id=99881#c63 and
https://bugzilla.kernel.org/show_bug.cgi?id=99881#c64 .

-- 
You are receiving this mail because:
You are the assignee for the bug.
