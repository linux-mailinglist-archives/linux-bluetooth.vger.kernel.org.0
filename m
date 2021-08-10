Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2FAF3DD1F0
	for <lists+linux-bluetooth@lfdr.de>; Mon,  2 Aug 2021 10:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232734AbhHBI2Q (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 2 Aug 2021 04:28:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:40892 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232678AbhHBI2Q (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 2 Aug 2021 04:28:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6374360EFD
        for <linux-bluetooth@vger.kernel.org>; Mon,  2 Aug 2021 08:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627892887;
        bh=YbEfCm1li1KCWf+MoP7pm4cyq/CyHxBeTnyJx2iJZeg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=osQbeA2QiZsv//oa4+ur0RpgJn4b6LIsEjFYWA8Z/yduVRG6gzVydRE/yiJkW2VQ3
         HZa5TXnvQueGhm31djpwVq9VWqVDO9ywVbINaZLo/gr9Dmhl6evRoka18AI/IvnIUO
         p728/rXQ6RWnasFWw9mRwnHLusripscqsFyYgRzoE6mQmH5SopfIIE3nnobgzyuI73
         P3Tak898TMFZGcyPsx2gr1bbJQoviJTSIYxfu4drHlz1px8GXgrgb2gSi0zskQ+Htg
         UO0yNzhCbZoeLMr1gbOPMcmt/kE7F+vz9HtgtU/cG+LDi2keBTl/Dg31TQf1HArOBX
         0//i3i5ALUM1g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 5616C60E4C; Mon,  2 Aug 2021 08:28:07 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 213923] Bluetooth: AC9560 doesn't respond any more after
 suspend multiple times
Date:   Mon, 02 Aug 2021 08:28:06 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: koba.ko@canonical.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213923-62941-beOvQtTtDZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213923-62941@https.bugzilla.kernel.org/>
References: <bug-213923-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213923

--- Comment #2 from KobaKo (koba.ko@canonical.com) ---
Created attachment 298149
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298149&action=3Dedit
dmesg_20210802

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
