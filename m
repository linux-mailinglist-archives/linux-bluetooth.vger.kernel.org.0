Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D183251C04
	for <lists+linux-bluetooth@lfdr.de>; Tue, 25 Aug 2020 17:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbgHYPRm convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 25 Aug 2020 11:17:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:46282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726627AbgHYPRV (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 25 Aug 2020 11:17:21 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 60824] [PATCH][regression] Cambridge Silicon Radio, Ltd
 Bluetooth Dongle unusable
Date:   Tue, 25 Aug 2020 15:17:09 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mmdesai20@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-60824-62941-Itfr71Ib20@https.bugzilla.kernel.org/>
In-Reply-To: <bug-60824-62941@https.bugzilla.kernel.org/>
References: <bug-60824-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=60824

--- Comment #142 from MMD (mmdesai20@gmail.com) ---
(In reply to Swyter from comment #137)
> Hi! There's actually a script that should help with this, at least as
> reference:
> https://gist.github.com/nevack/6b36b82d715dc025163d9e9124840a07
> 
> It's for newer kernels, though. So while the btusb.c part should more or
> less apply cleanly (because the existing/original CSR workaround stuff has
> been there for a while) the ERR_DATA_REPORTING stuff (on hci_core.c) is new
> and will need to be stripped out when back-porting the patch.
> 
> Who knows, maybe it's a good idea to ask someone from Canonical to add it to
> Ubuntu, once it's been more battle-tested. Hopefully (as it officially gets
> into stable kernels) distros downstream will pick this up, even on super old
> Linux versions.
> 
> Hope that helps. :)

Yes...finally it is working...
I installed kernel 5.8.3 and ran script at..
And it is working...
Thank you very much....

-- 
You are receiving this mail because:
You are the assignee for the bug.
