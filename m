Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 478F4479925
	for <lists+linux-bluetooth@lfdr.de>; Sat, 18 Dec 2021 07:14:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232147AbhLRGOr (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 18 Dec 2021 01:14:47 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:57396 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231274AbhLRGOq (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 18 Dec 2021 01:14:46 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7D62C60C1D
        for <linux-bluetooth@vger.kernel.org>; Sat, 18 Dec 2021 06:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DEBD1C36AE1
        for <linux-bluetooth@vger.kernel.org>; Sat, 18 Dec 2021 06:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639808085;
        bh=TSsnA6mvqInpqmHuJDvS4Mr8hb05EOzTts+RGtdWswk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=UpAepvxLaxuKEVNKYRV0nbn3IjU4ThEc/xRPcxTUPThx/trytZaIPbgMGnFthSlKk
         dpvyorM7DMa8RLzLvatbeY+kXVNI5UKALiDULtRiEPnvDbFROYLeGxtSqV4eZ13hYz
         xPlIvQi2xr2elwVmJyyyNxWXt/WPR0MTaN3zwZuCWMd/a2dWal6+1UqaxaaGtRKSVc
         mi/u+ExdCbISFzkuFO72HQtugBtcBzDXxpREqm8rkADgDmjxHQ9o8OIeU+VWro3Cu1
         GdTYswBexj0L1GNHwg1T4LMQgkQLIdINu/hclN7mLHvG3EDTQ93iMgKIQIK/uMfNM6
         UrXs9NOVvJGXw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id C9B3460F55; Sat, 18 Dec 2021 06:14:45 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 215347] btintel: AX200 (8087:0029): hci crashes and can't
 recover after repeated rfkill on/off
Date:   Sat, 18 Dec 2021 06:14:45 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: hui.wang@canonical.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215347-62941-OHgojW1InP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215347-62941@https.bugzilla.kernel.org/>
References: <bug-215347-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215347

--- Comment #4 from Hui Wang (hui.wang@canonical.com) ---
Created attachment 300057
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300057&action=3Dedit
dmesg of the kernel bluetooth-next

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
