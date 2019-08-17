Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F55F90D01
	for <lists+linux-bluetooth@lfdr.de>; Sat, 17 Aug 2019 06:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbfHQEwy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 17 Aug 2019 00:52:54 -0400
Received: from mail.wl.linuxfoundation.org ([198.145.29.98]:56128 "EHLO
        mail.wl.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725829AbfHQEwy (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 17 Aug 2019 00:52:54 -0400
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
        by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 0277828AC0
        for <linux-bluetooth@vger.kernel.org>; Sat, 17 Aug 2019 04:52:53 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
        id E983228A9C; Sat, 17 Aug 2019 04:52:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
        pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS autolearn=unavailable version=3.3.1
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 60824] [PATCH][regression] Cambridge Silicon Radio, Ltd
 Bluetooth Dongle unusable
Date:   Sat, 17 Aug 2019 04:52:51 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: virtuousfox@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-60824-62941-8EApm0LHnw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-60824-62941@https.bugzilla.kernel.org/>
References: <bug-60824-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=60824

Sergey Kondakov (virtuousfox@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |virtuousfox@gmail.com

--- Comment #34 from Sergey Kondakov (virtuousfox@gmail.com) ---
(In reply to Arthur Fragoso from comment #33)
> Same here:
> 
> 0a12:0001 Cambridge Silicon Radio, Ltd Bluetooth Dongle (HCI mode).
> 
> But the product name is: JL AC69 A10
> 
> I tested in Linux 5.2.8-1-MANJARO, and the 4.19.57-1-MANJARO.
> 
> The problems are:
> 
> - After booting up the OS with the BT Dongle in, if I try to 'sudo
> bluetoothctl power on', it fails and 'btmon' returns this:
> ...
> I will try to apply the patch and compile the kernel to see if I can get it
> to work. It's crazy to think this thread started in November 2013, and
> currently there are many of those CSR dongles being sold.

At least it somehow works for you ! I just recently got one in attempt to
"upgrade" from 2.1 to 4.0 (also 0a12:0001) and have a spare for my Sony
DualShocks 3&4. It works under Windows but I don't actually remember if I
managed to successfully test it under Linux. Under kernel 5.2.8 bluez acts if
it wasn't there but in reality it fails with this ridiculous "Delete Stored
Link Key: Unsupported Feature or Parameter Value". btusb does not have 'quirks'
option and adding 'quirks=0a12:0001:HCI_QUIRK_BROKEN_STORED_LINK_KEY' to
usbcore doesn't seem to be doing anything.

But neither you or me are going to use that patch because BT stack was
completely rewritten and its logic is completely different now. If developers
don't want to ignore failures to initiate such "important" optional functions
and enable quirks automatically on pre-init sanity check then at least someone
could have said somewhere how to enable the damn things at runtime without
hard-coding IDs of your random noname dongles into kernel's code…

How the hell people are using those BT quirks ?

-- 
You are receiving this mail because:
You are the assignee for the bug.
