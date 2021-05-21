Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8209D38C180
	for <lists+linux-bluetooth@lfdr.de>; Fri, 21 May 2021 10:15:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230295AbhEUIQX (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 21 May 2021 04:16:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:51392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229629AbhEUIQX (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 21 May 2021 04:16:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 73E94613C8
        for <linux-bluetooth@vger.kernel.org>; Fri, 21 May 2021 08:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621584900;
        bh=wmsc4Ioi8aPOQOvULjemWZzFCUk91/UYGNfQCHO2yeA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=bX8027I6QN+bO2eYMqJM44U1eO64hp0xylNcaM6fU5wgHlIiLVKMb7Nb8oCZSsk5U
         4ahVMfT0MeoeYiDYDgSPqvBXApttq54SoRiPRbxVSurKfkAmFQ4iovsLxSulbCYXkR
         t6Htk1lq0ZkOFcjLqtvurhke473fVV6E4ogmzyX+Saogf+6OMYJvDd3OKy1b2s0p47
         VzHRSRO5Nq0lp5ILLzkd9EE0JPB+FR9WPdeU8F7hHPaDTPEFRFw7VUWCSV+Kh5HpcH
         WZFUUpgIyDiZULXK8jY/TC3ULynC5jYsIlKAkCZU5iLf0zoQVMD+RAsqF4S2ffxQmY
         9bpJLkiYqhw7Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 6D4DC612A5; Fri, 21 May 2021 08:15:00 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 203753] Bluetooth: hci0: advertising data len corrected
Date:   Fri, 21 May 2021 08:15:00 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: szymon.janc@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-203753-62941-2rtYREwqvT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203753-62941@https.bugzilla.kernel.org/>
References: <bug-203753-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D203753

Szymon Janc (szymon.janc@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |szymon.janc@gmail.com

--- Comment #8 from Szymon Janc (szymon.janc@gmail.com) ---
This is now fixed in bluetooth-next and commit was marked with cc:stable

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
