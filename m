Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED5232A537
	for <lists+linux-bluetooth@lfdr.de>; Sat, 25 May 2019 18:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbfEYQVJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 25 May 2019 12:21:09 -0400
Received: from mail.wl.linuxfoundation.org ([198.145.29.98]:40028 "EHLO
        mail.wl.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727051AbfEYQVI (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 25 May 2019 12:21:08 -0400
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
        by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 1D61528A81
        for <linux-bluetooth@vger.kernel.org>; Sat, 25 May 2019 16:21:08 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
        id 01BD528A85; Sat, 25 May 2019 16:21:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
        pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS autolearn=ham version=3.3.1
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 200009] PS3 gamepad clone (Gasia Co.,Ltd PS(R) Gamepad) not
 pairing
Date:   Sat, 25 May 2019 16:21:07 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mmbossoni@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-200009-62941-GllsKBj1eA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-200009-62941@https.bugzilla.kernel.org/>
References: <bug-200009-62941@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=200009

--- Comment #10 from Marcelo (mmbossoni@gmail.com) ---
Guys from retrofit did a really nice fix for this.

It keeps already existent behavior and fixes gasia (at least for the model I
have here). Change is really neat.


https://github.com/RetroPie/RetroPie-Setup/pull/2263/commits/017f00f6e15f04b3272ff1abae8742dc4c47b608#diff-293af5b19ba1d1f50c86e8b9b0b1feaf

-- 
You are receiving this mail because:
You are the assignee for the bug.
