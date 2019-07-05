Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3085060A28
	for <lists+linux-bluetooth@lfdr.de>; Fri,  5 Jul 2019 18:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728389AbfGEQW4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 5 Jul 2019 12:22:56 -0400
Received: from mail.wl.linuxfoundation.org ([198.145.29.98]:44932 "EHLO
        mail.wl.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725730AbfGEQW4 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 5 Jul 2019 12:22:56 -0400
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
        by mail.wl.linuxfoundation.org (Postfix) with ESMTP id BB209289D6
        for <linux-bluetooth@vger.kernel.org>; Fri,  5 Jul 2019 16:22:55 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
        id ACFCC28A28; Fri,  5 Jul 2019 16:22:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
        pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS autolearn=ham version=3.3.1
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 199461] Unable to use Microsoft Surface Precision Mouse
Date:   Fri, 05 Jul 2019 16:22:55 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: harn-solo@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-199461-62941-E1cCLAX0Wl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-199461-62941@https.bugzilla.kernel.org/>
References: <bug-199461-62941@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=199461

--- Comment #11 from Michael Long (harn-solo@gmx.de) ---
Ok, I compared the kernel configs between the working and non-working systems,
it seems like the kernel config entry CONFIG_UHID (User-space I/O driver
support for HID subsystem) was missing.

Everything is running fine now. I hope both patches are picked up in their
following release.

Thanks again.

-- 
You are receiving this mail because:
You are the assignee for the bug.
