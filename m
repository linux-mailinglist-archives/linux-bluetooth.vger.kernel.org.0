Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A08DA31019F
	for <lists+linux-bluetooth@lfdr.de>; Fri,  5 Feb 2021 01:29:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231915AbhBEA2q (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 4 Feb 2021 19:28:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:56982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231838AbhBEA2p (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 4 Feb 2021 19:28:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id AFEE964FAE
        for <linux-bluetooth@vger.kernel.org>; Fri,  5 Feb 2021 00:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612484884;
        bh=0crlSFLWZHkt5ycPTSfDt1ki+n4jsyPc+2YSpG3IExA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=m9Da9HkiylnO7lSinZWGqdAin5us5mDB/1GaRpmVt49YltLs4LzqcBjXdObX/Smv3
         seDNFFLXzXLmiYVWHs/cJAQkQMP04s/FU1ok/pn86+NUVECsw4TvCZZ69bXn1zJm3J
         HeDOqy50dAzTV9DXyGNrMFsyWlTyGvXkBaMSK2mkzdRkPD8eqSOv2wkTgKmwA/vx/p
         MRcnwKpeQ1dNvl0KCcHFKSg+jlmfq+grwhdwhZ5OtoVEwS2JtyJqZhimso/i+GT/Kw
         V5nN5QdA58hQONaKqFJgAKvkuvSNADaEf1cdpsASz7EPZNL7gZYhwxKZPYtY4KfAmK
         mrufR6kY6KrHg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id A04B965339; Fri,  5 Feb 2021 00:28:04 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 211571] Bluetooth: hci0: don't support firmware rome 0x1020200
Date:   Fri, 05 Feb 2021 00:28:04 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dilipkonline@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211571-62941-2QBjbR0A5z@https.bugzilla.kernel.org/>
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

--- Comment #1 from dilipkonline@gmail.com ---
Extras:

System Information
        Manufacturer: ASUSTeK COMPUTER INC.
        Product Name: K55VM

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
