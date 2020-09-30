Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D72D827EA87
	for <lists+linux-bluetooth@lfdr.de>; Wed, 30 Sep 2020 16:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730188AbgI3ODC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 30 Sep 2020 10:03:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:52246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730104AbgI3ODC (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 30 Sep 2020 10:03:02 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 85161] Bluetooth: hci0 SCO packet for unknown connection handle
 41
Date:   Wed, 30 Sep 2020 14:03:01 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wrl94265@eoopy.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-85161-62941-JNHohUbLWk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-85161-62941@https.bugzilla.kernel.org/>
References: <bug-85161-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=85161

gandomi (wrl94265@eoopy.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |wrl94265@eoopy.com

--- Comment #2 from gandomi (wrl94265@eoopy.com) ---
(In reply to Cristian Aravena Romero from comment #0)
> Open bug in launchpad.net
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1374084
> 
> "[63716.030347] input: 00:1E:7C:22:33:21 as /devices/virtual/input/input13
> [63721.787306] Bluetooth: hci0 SCO packet for unknown connection handle 41
> [63721.787316] Bluetooth: hci0 SCO packet for unknown connection handle 41
> [63814.034162] Bluetooth: hci0 SCO packet for unknown connection handle 35
> [63814.034176] Bluetooth: hci0 SCO packet for unknown connection handle 35
> [63814.034183] Bluetooth: hci0 SCO packet for unknown connection handle 35"

https://www.gandomvip.com/

-- 
You are receiving this mail because:
You are the assignee for the bug.
