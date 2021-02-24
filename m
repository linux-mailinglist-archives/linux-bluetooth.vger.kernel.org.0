Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F62D324153
	for <lists+linux-bluetooth@lfdr.de>; Wed, 24 Feb 2021 17:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236101AbhBXPrV (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 24 Feb 2021 10:47:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:42520 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232821AbhBXOpI (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 24 Feb 2021 09:45:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id F01A064F18
        for <linux-bluetooth@vger.kernel.org>; Wed, 24 Feb 2021 14:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614177868;
        bh=7Do31jvCjJS8qkBDf4hxUqoYZZAYh2rXpSDEXaRcs78=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=VxPu9/XZ772Nx+kRRkwx88t3DQxsK5achNmSDHC8g4tfh3z6In+Xw08IN78h+aoIu
         bTJSFDPKqEtrWy1c7KCRMxZr4sdiMQ30/NjI/09ySL00DeCmZrpWlsTsCqrQiEi2O8
         oj1X6uBl1Beh5T70MiN2ZcCWaJUBDOUyGm93zVky55tYXoZquvQzwuTUF6e8ixZ10y
         /M8Cc/dCMKeG34M1w835cZKvmtWk6IesIfBxnqBWcVykaCNcTvhjWAcckuDn2PluLZ
         8aE43Xm/eb0vYNBTdD8s6fg69f8sl/cSqqr5/jbJJ2C6FnI2tbiumvZ9XhvOdt4vN5
         RB9xWp4cSqzRw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id ED09C65381; Wed, 24 Feb 2021 14:44:27 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 210681] kernel: Bluetooth: hci0: don't support firmware rome
 0x31010000
Date:   Wed, 24 Feb 2021 14:44:26 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: antdev66@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210681-62941-WHQEoRKcTT@https.bugzilla.kernel.org/>
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

--- Comment #43 from Antonio (antdev66@gmail.com) ---
kernel 5.11.1: problem still exists, need to patch.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
