Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0CCC149F0E
	for <lists+linux-bluetooth@lfdr.de>; Mon, 27 Jan 2020 07:42:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgA0GmR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 27 Jan 2020 01:42:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:48616 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725775AbgA0GmR (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 27 Jan 2020 01:42:17 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 117251] btusb and/or btintel cannot correctly restore after
 resume from suspend
Date:   Mon, 27 Jan 2020 06:42:16 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: russianneuromancer@ya.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-117251-62941-fQnpwbXSpf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-117251-62941@https.bugzilla.kernel.org/>
References: <bug-117251-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=117251

RussianNeuroMancer (russianneuromancer@ya.ru) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |russianneuromancer@ya.ru

--- Comment #3 from RussianNeuroMancer (russianneuromancer@ya.ru) ---
Is it still reproducible for you with Linux 5.5?

-- 
You are receiving this mail because:
You are the assignee for the bug.
