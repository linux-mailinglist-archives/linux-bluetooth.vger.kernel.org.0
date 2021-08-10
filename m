Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 886D03D798F
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jul 2021 17:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232511AbhG0PTQ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 27 Jul 2021 11:19:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:44540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232493AbhG0PTQ (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 27 Jul 2021 11:19:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3C06361B39
        for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jul 2021 15:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627399156;
        bh=mTcXFUfmPUcnUrSMWZ4X6iSk2F8ql99F7xhv2fpwq3E=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Cx8C8pIlwY/L8r9F6t3rMw8fpJs9NoeL9xZ+6+TK2RlXZ1LQsoej6rtNSIGrTr8Dh
         1fYHP0q0V10wAZJstGlNUAPZ4t7MnXICzGZgWkRalcwWJsbcpYtw9p2gGxe34kah4j
         thdTRNznHmg4e57rd4XmF49pwB9QxVpAycBTvNQNHtu6mQSciIvjAICVkOYScSxeZz
         f4CGNDa4aVGHAoZNDjQ+zUi/OSQfYE0ZoXq9fU/iHF0fBuDYabzrXX+63OqQERX9Y/
         2dJ1dBw7by8cx4ogReJLaxzjRt+MGcAvNDrbVIKVA6RbogVj3xFPBVqsTubWTIpfCR
         /SN2jz1uADvAA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 33FC760EBF; Tue, 27 Jul 2021 15:19:16 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 211983] BUG: Unable to toggle bluetooth ON once switched off
 using rfkill
Date:   Tue, 27 Jul 2021 15:19:15 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: kunal.bhat2001@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211983-62941-0vfxTHaZtq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211983-62941@https.bugzilla.kernel.org/>
References: <bug-211983-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D211983

--- Comment #4 from Kunal Bhat (kunal.bhat2001@gmail.com) ---
Was fixed in 5.12 but seems to have reappeared in 5.13

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
