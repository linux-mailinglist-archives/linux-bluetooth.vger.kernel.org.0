Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F405431AA53
	for <lists+linux-bluetooth@lfdr.de>; Sat, 13 Feb 2021 08:00:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbhBMHAF (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 13 Feb 2021 02:00:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:33100 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229469AbhBMHAE (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 13 Feb 2021 02:00:04 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 38AE164E8D
        for <linux-bluetooth@vger.kernel.org>; Sat, 13 Feb 2021 06:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613199564;
        bh=Si2lPz5KPjc35irCIY7guXGeKrZdR34ny0tqvTIsJd0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=KGSkFn+til5fLuE35WVsPmPIqUmSytTPWoLOOV36issr0oGeAdz7DYJ+BdPVbWw1G
         4AN0W/ALlVNCAff1IpfB93+3bvSM4MpEkDATR8Bh3WvYuKIpa71CaY4NHL/OoWVCBR
         MsH+aYW0KYcXQhJHRMgbT37wxSv41RnsPUEIcs3rNOOWeUEbkUVddHFXQaELhYNo+a
         9XcitxDLIygDbHoTITrtWvDcM/S8D1mjrXUssSMKuj9XH4pgP9sx24WKr6oXUtvVEi
         UZeVP52ZxW+aCxes11u6qZj/SDdSYJurSvHPhCQdjBILrNyHAy+nvVW6tz+XzGmqZi
         ouoUlTGCrZ5GQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 2A7F765361; Sat, 13 Feb 2021 06:59:24 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 211571] Bluetooth: hci0: don't support firmware rome 0x1020200
Date:   Sat, 13 Feb 2021 06:59:23 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: carnil@debian.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211571-62941-On1L1MxxmQ@https.bugzilla.kernel.org/>
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

--- Comment #7 from Salvatore Bonaccorso (carnil@debian.org) ---
This is the same as https://bugzilla.kernel.org/show_bug.cgi?id=3D210681?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
