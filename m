Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B112244D036
	for <lists+linux-bluetooth@lfdr.de>; Thu, 11 Nov 2021 04:12:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbhKKDOv (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 10 Nov 2021 22:14:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:38810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229699AbhKKDOv (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 10 Nov 2021 22:14:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id B98D461211
        for <linux-bluetooth@vger.kernel.org>; Thu, 11 Nov 2021 03:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636600322;
        bh=dzPjJc+lLKlpKbuFNfJETxPVjgYJwGwQT40TQsKYd74=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Lfm1/FD56yFpAh343Pb/LTFhuZeLHgCtNb3PtJ/vT0+J5vm5rP95Iib+Wqo4H6PVS
         KOzkVznK3rcUtLIV+/koRmXCphmlf9CEuGb90nt5WU5M3VrhuVYLnech8IrYNQnsX1
         ZsbdC+LfFt9Kruuo6q8woLdcN1VVVHF3vRqqKjenPKQAZp/K7P1eNpUtcuf4BsomZC
         t3iij7xq+thj1RcXkc7YeeRAMSncOP4dJX2ii/55NrcQpNFgNTuM1sV8bPNPnSF915
         DXkRMyN94gavQSDv53pTORLVNEaEyaTtg5ms6rpSTSaivnmlQp3/k7giTew2iOwfIL
         /ozX0SIO0kW2Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id B478E610F9; Thu, 11 Nov 2021 03:12:02 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 213829] Intel AX210 Bluetooth controller doesn't start from
 warm boot
Date:   Thu, 11 Nov 2021 03:12:01 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gbin@gootz.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213829-62941-p3gqTfgi08@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213829-62941@https.bugzilla.kernel.org/>
References: <bug-213829-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213829

--- Comment #20 from Guillaume Binet (gbin@gootz.net) ---
(In reply to Tedd An from comment #19)
> This should be fixed with
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/
> drivers/bluetooth/btintel.c?id=3D35191a0fe986bacf69bd842de81119dca7970f11
>=20
> I tried it with 5.15 and didn't see the problem.

Sorry it is not.

Testing with the framework laptop on=20
testing/linux 5.15.1.arch1-2

Steps to reproduce: 1. go to the bios and save settings, it starts bt
correctly. 2. Just reboot with for example the reboot command or come out of
hibernation etc... it fails as usual.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
