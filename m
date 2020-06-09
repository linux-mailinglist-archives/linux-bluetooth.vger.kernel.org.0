Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8296A1F493A
	for <lists+linux-bluetooth@lfdr.de>; Wed, 10 Jun 2020 00:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728200AbgFIWKG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 9 Jun 2020 18:10:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:60232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726992AbgFIWKG (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 9 Jun 2020 18:10:06 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 208109] bluetooth module blocking suspend on Toshiba X30-F
Date:   Tue, 09 Jun 2020 22:10:05 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: grbitt@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-208109-62941-k6SXC6cK5C@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208109-62941@https.bugzilla.kernel.org/>
References: <bug-208109-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208109

GRbit (grbitt@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |PATCH_ALREADY_AVAILABLE

--- Comment #2 from GRbit (grbitt@gmail.com) ---
Tested on 5.7.1 and it's working) I have some another trouble with entering
suspend, but since s2ram is 100% working, it seems to be xfce DE bug. 

Thank you

-- 
You are receiving this mail because:
You are the assignee for the bug.
