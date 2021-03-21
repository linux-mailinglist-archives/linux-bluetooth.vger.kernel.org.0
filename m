Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF3443430EC
	for <lists+linux-bluetooth@lfdr.de>; Sun, 21 Mar 2021 06:03:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbhCUFDI (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 21 Mar 2021 01:03:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:36876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229870AbhCUFCu (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 21 Mar 2021 01:02:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id F06566193E
        for <linux-bluetooth@vger.kernel.org>; Sun, 21 Mar 2021 05:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616302970;
        bh=45NQllJozQSgZJrOr1kAZqRX0yhSzQRjzgPRd3bnLv0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=BIsbuoF/NxD9m/1owEMT8OZm07t8c4PoIK6PUf2HOyalhawzYOIIA4w8ro5WDG7as
         VciXB1yXEZHmf9cDeiUnz80a6mQ/e9mAcjm3l6n7PpooullVbLEMrGKOdz6oLrDyAp
         Lh9hPEc7BvT+JYtpxdvwx/S/kA0PEli+R85qLLiTsOkGod/RY2mUaS8A8Eke6zyV3k
         e4ASiJOxw7Tas53rTQjCK0icideU8h07mh/iY5HhOcz8wTHQwh+FbVSv06RRArVNRT
         qicvLA4GcFOCOxARdROMjo/meRzMgkz7FiSRSGnew7GOWXmVBnXY8s4WZsZfuNsLak
         rxzDED7eSL40g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id DB63562AAE; Sun, 21 Mar 2021 05:02:49 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 211983] BUG: Unable to toggle bluetooth ON once switched off
 using rfkill
Date:   Sun, 21 Mar 2021 05:02:49 +0000
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
X-Bugzilla-Changed-Fields: component
Message-ID: <bug-211983-62941-NDirXG0fzi@https.bugzilla.kernel.org/>
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

Kunal Bhat (kunal.bhat2001@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|USB                         |Bluetooth

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
