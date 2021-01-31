Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48310309CCF
	for <lists+linux-bluetooth@lfdr.de>; Sun, 31 Jan 2021 15:27:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232011AbhAaOUt (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 31 Jan 2021 09:20:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:49878 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232509AbhAaNgv (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 31 Jan 2021 08:36:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 6761864E37
        for <linux-bluetooth@vger.kernel.org>; Sun, 31 Jan 2021 13:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612100167;
        bh=4L+ebJzfhGmYxQzQWPAro6XT7ykzr01oWzLbtx4KQ9k=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Mx01sgEmYyO6KHIxacOf6/+m0ERifgAE/MLA6kS3Wx2Q0VV6vIU0RWzTJqjX7WlNH
         4DQmcJiuNIsU2L5no+y6h/shc8aK27+hK56bMXaPAqH4ZiKgyKGirjTQ7qa2/lQPNU
         sgdOhnjfmCrk3fSchO3olZXExVYTuMc9Ce+N50+6NPWbUY8PJoa8G7XWlXKEAaU7PF
         oT+yyw/2tSflTIU89SUIWykSeebS2Yp41R2YEQ0n2au+J+BSTc56twigWa9QHZexjH
         LQFSlOfe/hAyvOm4gxSmeva9Qd0TtV66MlyGXeUg+F8eoLD8F1CWDdi9vgVuNwGnor
         odTbLStU0y9UQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 64C026531E; Sun, 31 Jan 2021 13:36:07 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 210681] kernel: Bluetooth: hci0: don't support firmware rome
 0x31010000
Date:   Sun, 31 Jan 2021 13:36:06 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210681-62941-EWcKXPpxo6@https.bugzilla.kernel.org/>
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

--- Comment #25 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
> Is a fix for this bug planned?

As I've mentioned before someone needs to report this to the upstream bluet=
ooth
developers. Please send an email to:

Rocky Liao <rjliao@codeaurora.org>

Who is the author of the troublesome "Bluetooth: btusb: Add Qualcomm Blueto=
oth
SoC WCN6855 support" commit and add:

linux-bluetooth@vger.kernel.org

To the Cc of this email.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
