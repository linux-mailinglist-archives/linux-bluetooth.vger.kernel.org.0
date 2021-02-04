Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A43D1309FF6
	for <lists+linux-bluetooth@lfdr.de>; Mon,  1 Feb 2021 02:23:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230439AbhBABXZ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 31 Jan 2021 20:23:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:56218 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231196AbhBABWM (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 31 Jan 2021 20:22:12 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id AA30964E3D
        for <linux-bluetooth@vger.kernel.org>; Mon,  1 Feb 2021 01:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612142491;
        bh=T9NoDW89lOSARoVOHI8MaJoQq+eA5GZiZpqthPHVUOg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=j2pf1YpNiRcTjd/eN8InY5uFDygjgAvW0tn0YfH8N+aCieYJX8ejobsah/aFiiosJ
         tVC/KHVco4Bbt/dgvWzmPTAtyigCFo+bpse1v96fJco9m1B2gO2ld9vFhaMtS3KVJ/
         R+QhPv92uD28g52FVlgAqTHgTZYPX388LCDVZe7MgVJCNZOWzWif9Dc0upm8q6Y6YT
         J2JdcEt/uadP5qFUWSAPWcZ3rycq2K6n+BFiF5V9KLkC1B+VE1HqOEN0exexvjMXGz
         jRY3lcu2oVKMS6YHErSqqQN0hfuDuVWoPzM+6vk20xOmBMejbobk8v9HpuFw4sYiSA
         2rqXJAGOhEx+g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id A537465323; Mon,  1 Feb 2021 01:21:31 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 210681] kernel: Bluetooth: hci0: don't support firmware rome
 0x31010000
Date:   Mon, 01 Feb 2021 01:21:30 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210681-62941-93HDHlsiSy@https.bugzilla.kernel.org/>
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

--- Comment #27 from igorog (igorognev@mail.ru) ---
linux-bluetooth@vger.kernel.org - not available

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
