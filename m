Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98EAB140B2F
	for <lists+linux-bluetooth@lfdr.de>; Fri, 17 Jan 2020 14:42:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbgAQNmx convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 17 Jan 2020 08:42:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:43600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726566AbgAQNmx (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 17 Jan 2020 08:42:53 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 206235] kernel BUG at mm/slub.c:294
Date:   Fri, 17 Jan 2020 13:42:52 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: steffen@sdaoden.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc rep_platform
Message-ID: <bug-206235-62941-Hb829nuBvP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206235-62941@https.bugzilla.kernel.org/>
References: <bug-206235-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=206235

Steffen Nurpmeso (steffen@sdaoden.eu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |steffen@sdaoden.eu
           Hardware|All                         |x86-64

-- 
You are receiving this mail because:
You are the assignee for the bug.
