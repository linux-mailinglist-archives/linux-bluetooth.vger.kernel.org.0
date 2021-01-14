Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF8612F6692
	for <lists+linux-bluetooth@lfdr.de>; Thu, 14 Jan 2021 18:00:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbhANQ7s convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 14 Jan 2021 11:59:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:53344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726043AbhANQ7s (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 14 Jan 2021 11:59:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 1D8EE23B4B
        for <linux-bluetooth@vger.kernel.org>; Thu, 14 Jan 2021 16:59:08 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 131C58672D; Thu, 14 Jan 2021 16:59:08 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 203535] Bluetooth: command tx timeout with Intel Corporation
 Wireless 7260 in A2DP mode
Date:   Thu, 14 Jan 2021 16:59:07 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: iam@valdikss.org.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-203535-62941-5fB2uXQckE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203535-62941@https.bugzilla.kernel.org/>
References: <bug-203535-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=203535

--- Comment #11 from ValdikSS (iam@valdikss.org.ru) ---
(In reply to Leonid Kalmaev from comment #10)

> Hi. This does not work for some reason in the case of sleep. After waking up
> from sleep in powertop I see a good state again. Can you advise on more
> options for this to work correctly?

It seems there's a bug (or a feature) in kernel, which switches the devices in
power save mode after suspend, without triggering UDEV events. Here's what tlp
developer says: https://github.com/linrunner/TLP/issues/545

>Imho the kernel never issued udev new device events for existing devices after
>resume. You may look into it yourself by enabling TLP's trace mode with
>TLP_DEBUG="run udev usb".

I use tlp software, with bluetooth module powersave blacklist configured and
patch which is mentioned in the URL above applied (`set_usb_suspend 0 auto` in
tlp resume handler)

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.
