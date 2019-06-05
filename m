Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DBAC35616
	for <lists+linux-bluetooth@lfdr.de>; Wed,  5 Jun 2019 06:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbfFEE7w convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 5 Jun 2019 00:59:52 -0400
Received: from mail.wl.linuxfoundation.org ([198.145.29.98]:36268 "EHLO
        mail.wl.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725268AbfFEE7v (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 5 Jun 2019 00:59:51 -0400
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
        by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 149D5288C5
        for <linux-bluetooth@vger.kernel.org>; Wed,  5 Jun 2019 04:59:51 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
        id 11F4B288DA; Wed,  5 Jun 2019 04:59:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
        pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS autolearn=ham version=3.3.1
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 203643] [REGRESSION][BISECTED] Sixaxis gamepad no longer
 connects via Bluetooth
Date:   Wed, 05 Jun 2019 04:59:50 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gus@projectgus.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-203643-62941-TdYZPrMrkA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203643-62941@https.bugzilla.kernel.org/>
References: <bug-203643-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=203643

Angus (gus@projectgus.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |gus@projectgus.com

--- Comment #16 from Angus (gus@projectgus.com) ---
One more that the RFC patch fixes: "Goldtouch Bluetooth Keyboard" on kernel
5.1.6.

-- 
You are receiving this mail because:
You are the assignee for the bug.
