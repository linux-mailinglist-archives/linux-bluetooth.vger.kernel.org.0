Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04CF720752F
	for <lists+linux-bluetooth@lfdr.de>; Wed, 24 Jun 2020 16:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404003AbgFXODd convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 24 Jun 2020 10:03:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:45034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403985AbgFXODd (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 24 Jun 2020 10:03:33 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 60824] [PATCH][regression] Cambridge Silicon Radio, Ltd
 Bluetooth Dongle unusable
Date:   Wed, 24 Jun 2020 14:03:31 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hello@andres.codes
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-60824-62941-okashMjsXQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-60824-62941@https.bugzilla.kernel.org/>
References: <bug-60824-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=60824

--- Comment #81 from Andrés Rodríguez (hello@andres.codes) ---
Hi Swyter, unfortunately I'm still unable to list the device. Blueman found no
adapters and neither does bluetoothctl list.

dmesg info messages say it's still being recognized and given the bcdDevice I
assume the quirk is being applied but seemingly is not enough:

[   67.847429] Bluetooth: hci0: CSR: New controller detected; bcdDevice=0x2520,
HCI manufacturer=10, HCI rev=0x3120, LMP subver=0x22bb
[   67.847432] Bluetooth: hci0: CSR: Unbranded CSR clone detected; adding
workaround

This is a cheap chinese dongle that says "CSR 4.0" on the side, I took a
(crappy) photo of the PCB: https://i.imgur.com/3I5aKMZ.jpg and here's a stock
one from the vendor showing the box and the dongle:
https://i.imgur.com/wyjJTU6.jpg

The super small nigh-unreadable text in the main chip says "AP1P181"

Let me know if you want me to try anything else.

-- 
You are receiving this mail because:
You are the assignee for the bug.
