Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA14759C84
	for <lists+linux-bluetooth@lfdr.de>; Fri, 28 Jun 2019 15:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726842AbfF1NFJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 28 Jun 2019 09:05:09 -0400
Received: from mail.wl.linuxfoundation.org ([198.145.29.98]:35190 "EHLO
        mail.wl.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726558AbfF1NFH (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 28 Jun 2019 09:05:07 -0400
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
        by mail.wl.linuxfoundation.org (Postfix) with ESMTP id D0C7C27FC0
        for <linux-bluetooth@vger.kernel.org>; Fri, 28 Jun 2019 13:05:06 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
        id C559228812; Fri, 28 Jun 2019 13:05:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
        pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS autolearn=ham version=3.3.1
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 203997] [REGRESSION] Unable to connect BT audio device on
 5.1.15
Date:   Fri, 28 Jun 2019 13:05:05 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sgh@sgh.dk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-203997-62941-JRGT59dUaG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203997-62941@https.bugzilla.kernel.org/>
References: <bug-203997-62941@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=203997

Søren Holm (sgh@sgh.dk) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |sgh@sgh.dk

--- Comment #4 from Søren Holm (sgh@sgh.dk) ---
(In reply to Daniel Ponte from comment #3)
> Seeing similar with Logitech H800 headphones. Sometimes it stays connected.
> Curiously enough, HFP profile sometimes works (using tanuk's pulseaudio-hfp
> patch), but A2DP absolutely will not activate. The headphones will even
> register with pulseaudio as a bare device but A2DP remains unavailable.

I have the exact same problem also with H800 headset.

-- 
You are receiving this mail because:
You are the assignee for the bug.
