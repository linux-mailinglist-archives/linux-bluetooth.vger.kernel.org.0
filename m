Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA732981F9
	for <lists+linux-bluetooth@lfdr.de>; Sun, 25 Oct 2020 14:52:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1416435AbgJYNwC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 25 Oct 2020 09:52:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:40392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1414920AbgJYNwB (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 25 Oct 2020 09:52:01 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 209847] [Regression] keyboard doesn't connect after initial
 pair
Date:   Sun, 25 Oct 2020 13:52:01 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: kanru.kernel@kanru.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209847-62941-bTAbJIlL61@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209847-62941@https.bugzilla.kernel.org/>
References: <bug-209847-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209847

--- Comment #1 from Kan-Ru Chen (kanru.kernel@kanru.info) ---
Related reports and possible fix:

https://bbs.archlinux.org/viewtopic.php?id=259954
https://bugzilla.kernel.org/show_bug.cgi?id=209717
https://bugzilla.kernel.org/show_bug.cgi?id=209403
https://bugzilla.kernel.org/show_bug.cgi?id=209745

https://patchwork.kernel.org/project/bluetooth/patch/20201022082304.31757-1-sathish.narasimman@intel.com/

-- 
You are receiving this mail because:
You are the assignee for the bug.
