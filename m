Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 413D8479933
	for <lists+linux-bluetooth@lfdr.de>; Sat, 18 Dec 2021 07:46:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232206AbhLRGqW (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 18 Dec 2021 01:46:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232199AbhLRGqW (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 18 Dec 2021 01:46:22 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23C82C061574
        for <linux-bluetooth@vger.kernel.org>; Fri, 17 Dec 2021 22:46:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ECFE760959
        for <linux-bluetooth@vger.kernel.org>; Sat, 18 Dec 2021 06:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 583E9C36AE8
        for <linux-bluetooth@vger.kernel.org>; Sat, 18 Dec 2021 06:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639809980;
        bh=VUZ7qpgOPVCRTt9wKw6KsioX6sOHyl1Un7WgHVkw1A8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fS4o0aDXyDLEthRuawR30vQP2oudmkoyzoALKat1ov4gITEGd0cywTy2C5eUE6+8N
         JXTvmOQ+4CBLZEvqzHWdeqPAj4xQiGUEuIwKRd1BWm41AKx3IAiFrviLSc/yrrjn/8
         sjzApyUTv7dABrXexvU4vOzcs1QOB79DVaP+EefzpQVqtg7S/wyeZ8VGQhoAsrCzlx
         Tw2WokKK8IqZX01xl9nar8luoHxb5H+L2gWnxXvv7P17UHbk89MK6gQBxmo2FfyDvR
         Zs8CZ0Xu1up0hKE2NzxQ6a+U62okopfSjaBrQYD41M/2xePvJbI3ooSGFOIiNkwCOz
         dfrz6+V9U9yVA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 37E1B60F55; Sat, 18 Dec 2021 06:46:20 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 215347] btintel: AX200 (8087:0029): hci crashes and can't
 recover after repeated rfkill on/off
Date:   Sat, 18 Dec 2021 06:46:20 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215347-62941-u69FSklbZG@https.bugzilla.kernel.org/>
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

--- Comment #7 from Hui Wang (hui.wang@canonical.com) ---
(In reply to Hui Wang from comment #6)
> And if the desktop is not gnome, we could replace
> "gnome-settings->bluetooth" with a command-line "bluetoothctl scan on", so
> the test steps are:
> - boot the system
> - open a terminal and run 'dmesg -w'
> - open another terminal and run 'bluetoothctl scan on' and wait for 5 sec=
onds
> - run bttest.sh

Please ignore this comment, "bluetoothctl scan on" doesn't help reproduce t=
he
crashing.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
