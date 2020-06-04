Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B2F01EE700
	for <lists+linux-bluetooth@lfdr.de>; Thu,  4 Jun 2020 16:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729134AbgFDOxx convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 4 Jun 2020 10:53:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:35520 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729128AbgFDOxx (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 4 Jun 2020 10:53:53 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 207629] BISECTED Bluetooth: hci0: command 0x2042 tx timeout -
 suspend fails - Dell XPS 9300, Dell XPS 7390, Dell Inspiron 7386, Intel
 NUC7JYB
Date:   Thu, 04 Jun 2020 14:53:52 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rjw@rjwysocki.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-207629-62941-pDEYXEPrJS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207629-62941@https.bugzilla.kernel.org/>
References: <bug-207629-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207629

Rafael J. Wysocki (rjw@rjwysocki.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |rjw@rjwysocki.net

--- Comment #22 from Rafael J. Wysocki (rjw@rjwysocki.net) ---
Patch to test: https://patchwork.kernel.org/patch/11586221/

-- 
You are receiving this mail because:
You are the assignee for the bug.
