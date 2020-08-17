Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67312246736
	for <lists+linux-bluetooth@lfdr.de>; Mon, 17 Aug 2020 15:15:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728575AbgHQNPa convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 17 Aug 2020 09:15:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:41394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728767AbgHQNMW (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 17 Aug 2020 09:12:22 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 198919] Xbox (One) Wireless Controller won't connect
Date:   Mon, 17 Aug 2020 13:12:21 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: paananen.olli@tuta.io
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-198919-62941-ON7JMgpS0Q@https.bugzilla.kernel.org/>
In-Reply-To: <bug-198919-62941@https.bugzilla.kernel.org/>
References: <bug-198919-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=198919

paananen.olli@tuta.io changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |paananen.olli@tuta.io

--- Comment #4 from paananen.olli@tuta.io ---
Same issue in Arch linux kernel 5.8.1. Worked fine before with xpadneo or xpad
driver if disabled bluetooth ertm. Works properly with lts kernel (5.4.58) so
regression happened somewhere between 5.4 and 5.8. Systemctl status bluetooth
spams this:  

Refusing input device connect: No such file or directory (2)
Refusing connection from *controller mac*: unknown device

-- 
You are receiving this mail because:
You are the assignee for the bug.
