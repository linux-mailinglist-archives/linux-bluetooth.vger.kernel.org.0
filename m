Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01DA424BD86
	for <lists+linux-bluetooth@lfdr.de>; Thu, 20 Aug 2020 15:08:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729791AbgHTNHT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 20 Aug 2020 09:07:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:41194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728918AbgHTNHR (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 20 Aug 2020 09:07:17 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 208975] The bluetooth module prevents suspend: Bluetooth: hci0:
 command 0x2042 tx timeout
Date:   Thu, 20 Aug 2020 13:07:16 +0000
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
X-Bugzilla-Changed-Fields: dependson
Message-ID: <bug-208975-62941-ec9ZQ7tEBB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208975-62941@https.bugzilla.kernel.org/>
References: <bug-208975-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208975

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Depends on|                            |207629


Referenced Bugs:

https://bugzilla.kernel.org/show_bug.cgi?id=207629
[Bug 207629] BISECTED Bluetooth: hci0: command 0x2042 tx timeout - suspend
fails - Dell XPS 9300, Dell XPS 7390, Dell Inspiron 7386, Intel NUC7JYB
-- 
You are receiving this mail because:
You are the assignee for the bug.
