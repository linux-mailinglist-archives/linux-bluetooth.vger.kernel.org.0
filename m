Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD03D309D66
	for <lists+linux-bluetooth@lfdr.de>; Sun, 31 Jan 2021 16:24:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232403AbhAaOdX (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 31 Jan 2021 09:33:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:47274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232452AbhAaOT3 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 31 Jan 2021 09:19:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 353B064E35
        for <linux-bluetooth@vger.kernel.org>; Sun, 31 Jan 2021 14:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612102728;
        bh=NeubNGIaZd8jiyKtE4GU8TOOvEBBaib1OGYNRbzPSHY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Zd5+krnyAQaX/2lm/o3AMMKP9VcKUXT1ggnDAk0scx5bCVRtE1/SYqJaWDJq3Zuip
         RUn6lVnz6HtBes8Hx1RD9zQ7i4Yx2s1hm/SPjam0iONGO6LV8V/loh8iwBXhtr0VJf
         zFgFGTfOhNS1xLy+M0qQEEr0LoJAmydQNWtvizZfSgndbIADpc+JBXvBn4FM4GmbyH
         qkNGDJsidTLKwI7EOz8X90p7fy2CJUFYG74ILsAWuPVuNwIi6CSTpzL6MSVlL1k0zp
         5NTrekH0pFM0rX2NBIdlTG8/J/sP4tehxena24oOn4t0jMb+LGGI5frvABJr3DAnXZ
         j6ADMu6USqV+Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 2E5946531F; Sun, 31 Jan 2021 14:18:48 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 210681] kernel: Bluetooth: hci0: don't support firmware rome
 0x31010000
Date:   Sun, 31 Jan 2021 14:18:47 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: steeve.mccauley@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210681-62941-LLbUGWqG6k@https.bugzilla.kernel.org/>
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

--- Comment #26 from Steeve McCauley (steeve.mccauley@gmail.com) ---
I'm composing something now.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
