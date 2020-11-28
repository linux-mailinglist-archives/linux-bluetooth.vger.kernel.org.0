Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1220A2C73EB
	for <lists+linux-bluetooth@lfdr.de>; Sat, 28 Nov 2020 23:15:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731501AbgK1Vtw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 28 Nov 2020 16:49:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:50400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387400AbgK1TG5 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 28 Nov 2020 14:06:57 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 208965] not working bluetooth mouse low energy rtl8822ce
Date:   Sat, 28 Nov 2020 18:59:21 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: funtoos@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208965-62941-ExVbcjY8eI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208965-62941@https.bugzilla.kernel.org/>
References: <bug-208965-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208965

--- Comment #40 from devsk (funtoos@yahoo.com) ---
(In reply to Steeve McCauley from comment #39)
> Also confirming that the patch works for the realtek 8761b usb bluetooth
> adaptor, on all 5.9.x kernels I've patched and tested, including some fedora
> kernels,
> 
>    cd
> ~/rpmbuild/BUILD/kernel-5.9.fc32/linux-5.9.8-100.fc32.x86_64/net/bluetooth/
> $ diff -u hci_core.c~ hci_core.c
> --- hci_core.c~       2020-11-17 16:36:11.387834274 -0500
> +++ hci_core.c        2020-11-26 06:35:22.422411928 -0500
> @@ -763,7 +763,7 @@
>                       hci_req_add(req, HCI_OP_LE_CLEAR_RESOLV_LIST, 0, NULL);
>               }
> 
> -             if (hdev->commands[35] & 0x40) {
> +             if (hdev->commands[35] & 0x04) {
>                       __le16 rpa_timeout = cpu_to_le16(hdev->rpa_timeout);
> 
>                       /* Set RPA timeout */

This patch does not resolve the issue of suspend/resume cycle leading to
disconnected USB device and hence requiring reboot to get the bluetooth adapter
back. https://bugzilla.kernel.org/show_bug.cgi?id=210141

-- 
You are receiving this mail because:
You are the assignee for the bug.
