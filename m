Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 512D7ED2A6
	for <lists+linux-bluetooth@lfdr.de>; Sun,  3 Nov 2019 10:12:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727429AbfKCJMl convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 3 Nov 2019 04:12:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:35764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726408AbfKCJMl (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 3 Nov 2019 04:12:41 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 60824] [PATCH][regression] Cambridge Silicon Radio, Ltd
 Bluetooth Dongle unusable
Date:   Sun, 03 Nov 2019 09:12:39 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: takacsk2004@yahoo.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-60824-62941-DYZsjHYSay@https.bugzilla.kernel.org/>
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

takacsk2004@yahoo.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |takacsk2004@yahoo.com

--- Comment #43 from takacsk2004@yahoo.com ---

(In reply to Fernando Carvalho from comment #38)
> Hi,
> 
> I merged a few fixes and quirks (including some from this thread) and sent
> them to linux-bluetooth@vger.kernel.org :
> 
> https://www.spinics.net/lists/linux-bluetooth/msg81304.html
> 
> Feel free to test it if you have a simillar CSR device
> (ATTRS{idVendor}=="0a12", ATTRS{idProduct}=="0001",
> ATTRS{bcdDevice}=="8891").
> 
> It's not perfect, but it allows the use of the adapter and connect a headset
> (with some connect errors/retries now and then).
> 
> Regards.

I actually have two USB dongles with idVendor "0a12" and idProduct "0001". An
old one purchased from webshop and a brand new one purchased in a local store
with 5 years warranty. The old one does not work (as described by others), but
the new one works fine with 5.3.8-arch1-1 kernel. The one that works has
bcdDevice 88.91, the old one has 19.15. I don't know if your patch is already
in the kernel, or I am just lucky.

-- 
You are receiving this mail because:
You are the assignee for the bug.
