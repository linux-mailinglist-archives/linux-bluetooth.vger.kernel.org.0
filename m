Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21BE536989D
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Apr 2021 19:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231400AbhDWRoy (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 23 Apr 2021 13:44:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:38666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229549AbhDWRoy (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 23 Apr 2021 13:44:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 82B9F61425
        for <linux-bluetooth@vger.kernel.org>; Fri, 23 Apr 2021 17:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619199857;
        bh=iSskdoJnBa4aMMB81JwNTIfXpA8LiUOeHr2loyzu/Ks=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ILuYnKTkSJdnmJG9qrnXAO6/oI6lCOW4W78Tlf4XSg5Ly4m+fVoCGzWlq35AuGkOC
         +lUwOrhQ34hzyOK+uqHnRiLLCWfk8GPru4gvxi7fMHyfRh5zJWqIFy/Ffxx+ME7TUW
         aAD4kNjb53uAsfYtItupTsF6oANrVNaoD2UyGOTC7580ZJ27M0kvWgcfgOQVeJJ/9c
         +4U/ANgOT+yXXx0OfPMhhOLQNNxnmWZpCl53wqODXd0rUv1c4TqZJZ6Z4qTAwwlBBv
         ff3zTbJwCoNRIjvB/FIuUk31ljVGjwjtzHjtlrFIsiIx23k2TnLVBxv7Q9stBPnzJD
         gQ0o6USQxGHsw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 7CCEC60F53; Fri, 23 Apr 2021 17:44:17 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 203753] Bluetooth: hci0: advertising data len corrected
Date:   Fri, 23 Apr 2021 17:44:17 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sheepdestroyer@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-203753-62941-OprmO5ljRX@https.bugzilla.kernel.org/>
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

--- Comment #7 from sheepdestroyer (sheepdestroyer@gmail.com) ---
fedora 33=20
Kernel 5.11.16-200.fc33.x86_64
bluez-5.58-1.fc33

Thinkpad X230 with integrated Broadcom Bluetooth :
Device 010: ID 0a5c:21e6 Broadcom Corp. BCM20702 Bluetooth 4.0 [ThinkPad]


still flooded by :
Bluetooth: hci0: advertising data len corrected 20 -> 19=20
Bluetooth: hci0: advertising data len corrected 20 -> 19=20

bt_err_ratelimited: 2 callbacks suppressed=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20

Bluetooth: hci0: advertising data len corrected 20 -> 19

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
