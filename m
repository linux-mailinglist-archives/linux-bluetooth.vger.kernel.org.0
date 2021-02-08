Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39026312898
	for <lists+linux-bluetooth@lfdr.de>; Mon,  8 Feb 2021 01:30:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbhBHA3w (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 7 Feb 2021 19:29:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:41152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229537AbhBHA3v (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 7 Feb 2021 19:29:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id C611664E3B
        for <linux-bluetooth@vger.kernel.org>; Mon,  8 Feb 2021 00:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612744150;
        bh=jkTO5IGtKtdy/T55K0D1Go4qeuEgp0WE09mD2qjaCcQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=iCHfTzsy1CYr6i883Xdli95KWK2bUblaayIzM49VIZUzpXangg1b3qyPrA93xR44L
         Th2LNCCjlAJwvDkh5RfJDkHdx5sGquh4iN4iNN5EcK92r8Wx2B0yfd/xz1P7XrrkRR
         ikKy/3kGkEkU1jUGH1ZDYPqDAwmWJoup/Fg6Iszjjm6W9HlAVTp5RJmNEIAHFFNHTs
         VLPK1g19Yzpz/QxpuB1C+vc3b6nNa2NhyjDu4NHyadnFitOkb2LoQwb1uKyVkgwyNf
         CYvcq8cXmoaWMwohWYOLj62DjGkUEaCMfpOs7pEt14VeO/00xz1q2+GW/8CptDzxZb
         QeRdAOdneJ3ZA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id B235665358; Mon,  8 Feb 2021 00:29:10 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 211571] Bluetooth: hci0: don't support firmware rome 0x1020200
Date:   Mon, 08 Feb 2021 00:29:10 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sinekonata@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211571-62941-t9LgfOdXxE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211571-62941@https.bugzilla.kernel.org/>
References: <bug-211571-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D211571

--- Comment #3 from sinekonata@gmail.com ---
Extras:

sudo dmesg|grep DMI:
[    0.000000] DMI: ASUSTeK COMPUTER INC. K56CA/K56CA, BIOS K56CA.208
11/13/2012(In reply to sinekonata from comment #2)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
