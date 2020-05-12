Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E04E1D0069
	for <lists+linux-bluetooth@lfdr.de>; Tue, 12 May 2020 23:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728379AbgELVNF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 12 May 2020 17:13:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:56894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725950AbgELVNF (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 12 May 2020 17:13:05 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 198993] Intel Bluetooth 8260: Spurious wake events prevent from
 staying suspended in s2idle state on Dell Latitude 7275
Date:   Tue, 12 May 2020 21:13:04 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jerome.debretagne@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-198993-62941-Pi75wJlY83@https.bugzilla.kernel.org/>
In-Reply-To: <bug-198993-62941@https.bugzilla.kernel.org/>
References: <bug-198993-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=198993

Jérôme de Bretagne (jerome.debretagne@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |abhishekpandit@chromium.org

--- Comment #4 from Jérôme de Bretagne (jerome.debretagne@gmail.com) ---
Thanks a lot Abhishek.

The spurious events are going to be fixed with your patch series:
   https://lore.kernel.org/patchwork/cover/1208369/
with the 4 commits from 9952d90ea2885d7cbf80cd233f694f09a9c0eaec up to 
4867bd007d25a8dfd4ffc558534f7aec8b361789 

This series is being planned for v5.7, included from rc1 up to rc5 so far.

I've just tested it using the bluetooth-next tree, and I can confirm that this
is fixing this bug. I'll close and mark it as fixed once v5.7 is released.

Eager to see the 2nd part land to, allowing to set/unset a device as wakeable.

Cheers, Jérôme

-- 
You are receiving this mail because:
You are the assignee for the bug.
