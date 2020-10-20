Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B87BC28D094
	for <lists+linux-bluetooth@lfdr.de>; Tue, 13 Oct 2020 16:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388986AbgJMOpr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 13 Oct 2020 10:45:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:44220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388972AbgJMOpq (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 13 Oct 2020 10:45:46 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 208975] The bluetooth module prevents suspend: Bluetooth: hci0:
 command 0x2042 tx timeout
Date:   Tue, 13 Oct 2020 14:45:46 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: dep_changed
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
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-208975-62941-Qn3dMIUJWu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208975-62941@https.bugzilla.kernel.org/>
References: <bug-208975-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208975
Bug 208975 depends on bug 207629, which changed state.

Bug 207629 Summary: BISECTED Bluetooth: hci0: command 0x2042 tx timeout - suspend fails - Dell XPS 9300, Dell XPS 7390, Dell Inspiron 7386, Intel NUC7JYB
https://bugzilla.kernel.org/show_bug.cgi?id=207629

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

-- 
You are receiving this mail because:
You are the assignee for the bug.
