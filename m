Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED92029DEE3
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Oct 2020 01:57:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731612AbgJ2A5O convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 28 Oct 2020 20:57:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:60502 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731611AbgJ1WRf (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 28 Oct 2020 18:17:35 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 209403] c123 Realtek Bluetooth Radio not detected with Kernel
 5.9
Date:   Wed, 28 Oct 2020 13:01:00 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: waffen03@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209403-62941-wpEqXLKNHU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209403-62941@https.bugzilla.kernel.org/>
References: <bug-209403-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209403

--- Comment #4 from waffen03@gmail.com ---
(In reply to Dominikus Gierlach from comment #3)
> The issue is still present with 5.9.1.
> 
> Additional information: dmesg output from module loading to `hciconfig hci0
> up':
> 
> [  741.324397] usbcore: registered new interface driver btusb
> [  741.326030] Bluetooth: hci0: RTL: examining hci_ver=0a hci_rev=000c
> lmp_ver=0a lmp_subver=8822
> [  741.327752] Bluetooth: hci0: RTL: rom_version status=0 version=3
> [  741.327757] Bluetooth: hci0: RTL: loading rtl_bt/rtl8822cu_fw.bin
> [  741.327889] Bluetooth: hci0: RTL: loading rtl_bt/rtl8822cu_config.bin
> [  741.327940] Bluetooth: hci0: RTL: cfg_sz 6, total sz 31422
> [  741.605079] Bluetooth: hci0: RTL: fw version 0x09993aa1
> [  772.977433] Bluetooth: hci0: RTL: examining hci_ver=0a hci_rev=0999
> lmp_ver=0a lmp_subver=3aa1
> [  772.977446] Bluetooth: hci0: RTL: unknown IC info, lmp subver 3aa1, hci
> rev 0999, hci ver 000a
> [  772.977447] Bluetooth: hci0: RTL: assuming no firmware upload needed
> [  772.994449] debugfs: File 'dut_mode' in directory 'hci0' already present!
> 
> 
> 
> hciconfig hci0 up prints:
> 
> envy# hciconfig hci0 up
> Can't init device hci0: Protocol not supported (93)

Edward's patch https://marc.info/?l=linux-bluetooth&m=160378222632366 
in https://bugzilla.kernel.org/show_bug.cgi?id=208965 worked for me on kernel
version 5.9.1.

-- 
You are receiving this mail because:
You are the assignee for the bug.
