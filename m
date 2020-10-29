Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD1F129DEAA
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Oct 2020 01:56:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727639AbgJ2A4A convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 28 Oct 2020 20:56:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:60518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731670AbgJ1WRk (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 28 Oct 2020 18:17:40 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 208965] not working bluetooth mouse low energy rtl8822ce
Date:   Wed, 28 Oct 2020 12:56:59 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: waffen03@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208965-62941-nHyzG3duNb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208965-62941@https.bugzilla.kernel.org/>
References: <bug-208965-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208965

--- Comment #28 from waffen03@gmail.com ---
(In reply to Edward Vear from comment #25)
> (In reply to david.zakarias from comment #20)
> > Is it possible that a newer firmware fixes the problem? I also have version
> > 0x09993aa1. 
> > Julian what version do you have?
> 
> Hi David,
> 
> I ran into the same Set Resolvable Private Address error with my adapter, an
> rtl8761b. I submitted a patch here with my understanding of the issue:
> https://marc.info/?l=linux-bluetooth&m=160378222632366&w=2. Could you check
> to see if that patch helps?
> 
> I don't believe it is related to the original issue seen in this thread
> though.

I had the same problem, patch worked for me. Thank you! Can confirm it now
works on 5.9.1.

-- 
You are receiving this mail because:
You are the assignee for the bug.
