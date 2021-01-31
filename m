Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7984A3099F2
	for <lists+linux-bluetooth@lfdr.de>; Sun, 31 Jan 2021 03:12:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232470AbhAaCMG (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 30 Jan 2021 21:12:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:55086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230168AbhAaCME (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 30 Jan 2021 21:12:04 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 5654764E2E
        for <linux-bluetooth@vger.kernel.org>; Sun, 31 Jan 2021 02:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612059084;
        bh=j1K+ib2w4ULaS756yH8S5/YN42YKAadkJ0IJ54C5S4c=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=TaL6my70br9mIfjlI0WcwIyb1iURvfvRWG1nGQqZwkF0hrh8tbJ6shiBQBM7Ep+PW
         A0h+JVkBB/aThpwHMuXvFDDdGldu7pwDqrS5/YNSasZ3IWXvBiBM96srHBikX5Fioa
         C0oxgRUc3EOb6sCosDD+9Pnr538dh6FUxEX+WcutuRBc2UicDCbMvYPCXa3cGY+v1G
         ymHoowRC1+xMdxGWZbLwvhqGpe5UYedY4SrJVKzfUE/8RNh+khaanJCZVXaopsj46V
         +YHglzyOe0PwVk9EA4Tde6/Lh+cl0GrKzF+obYpPPOpKrsiowutsCv1evuEEtcVMG7
         WFarDnqc1XNWQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 52F6C652F9; Sun, 31 Jan 2021 02:11:24 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 210681] kernel: Bluetooth: hci0: don't support firmware rome
 0x31010000
Date:   Sun, 31 Jan 2021 02:11:23 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: igorognev@mail.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210681-62941-GjRPJ3h7pq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210681-62941@https.bugzilla.kernel.org/>
References: <bug-210681-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210681

igorog (igorognev@mail.ru) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |igorognev@mail.ru

--- Comment #23 from igorog (igorognev@mail.ru) ---
Bluetooth: hci0: don't support firmware rome 0x1020200
>--------------------------------------------------------
Arch Linux 5.10.11-arch1-1
>03:00.0 Network controller: Qualcomm Atheros AR9485 Wireless Network Adapt=
er
>(rev 01)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
