Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 550833EC796
	for <lists+linux-bluetooth@lfdr.de>; Sun, 15 Aug 2021 07:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbhHOF3Q (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 15 Aug 2021 01:29:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:47670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229452AbhHOF3P (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 15 Aug 2021 01:29:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 229F4610CC
        for <linux-bluetooth@vger.kernel.org>; Sun, 15 Aug 2021 05:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629005326;
        bh=PSJkQc1wwtdOKX7I3N8ssFa6TDwLukNMHxQADoHLMtg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=a+c2HZb6A9waIJw/zuobllec790vHJwpsUZCSi/wWSHko89iXuasg5dZzCmbdOlO6
         Ix2hPUk6L4Z3Q12XwYJpB3AgS7O87/EduIbgE1ZaI5JaCA8ayRSwoGhQ5w1TpYEiDz
         PLyM4Ksx6SkxetUM+C0LhYJgXxmfGfYywe+dZt6+BHuzQQEhryzW4g8k3L5+w1jPAd
         LwEzxcL8JF2JY0o0ym5o+V8XtzZ0DACGVnIjSaPJVIW39KatavLc9As/axohlCTb1L
         g7WBoAzPO6ZQubDdvCvRGC+mLSYgwR23/CorarCGSVR72UWR+TXLeqTDfy7j2AAuNk
         SweKMbOu2SYWA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 1F9FC60FBF; Sun, 15 Aug 2021 05:28:46 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 60824] [PATCH][regression] Cambridge Silicon Radio, Ltd
 Bluetooth Dongle unusable
Date:   Sun, 15 Aug 2021 05:28:42 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: swyterzone@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-60824-62941-P7hvDafxuR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-60824-62941@https.bugzilla.kernel.org/>
References: <bug-60824-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D60824

--- Comment #196 from Swyter (swyterzone@gmail.com) ---
The 'Read Local Version Information' packet should show up when you unplug =
and
re-plug the dongle, it's one of the first HCI packets that get transmitted
during initialization. Even if the dongle gets stuck it should happen after
asking that.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
