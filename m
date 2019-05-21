Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD2B425957
	for <lists+linux-bluetooth@lfdr.de>; Tue, 21 May 2019 22:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727319AbfEUUpv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 21 May 2019 16:45:51 -0400
Received: from mail.wl.linuxfoundation.org ([198.145.29.98]:41390 "EHLO
        mail.wl.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726766AbfEUUpv (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 21 May 2019 16:45:51 -0400
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
        by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 0FD4828B06
        for <linux-bluetooth@vger.kernel.org>; Tue, 21 May 2019 20:45:50 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
        id F2B8028B10; Tue, 21 May 2019 20:45:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
        pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS autolearn=ham version=3.3.1
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 203643] [REGRESSION][BISECTED] Sixaxis gamepad no longer
 connects via Bluetooth
Date:   Tue, 21 May 2019 20:45:49 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fabrice@bellet.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-203643-62941-jt7cGN5kTs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203643-62941@https.bugzilla.kernel.org/>
References: <bug-203643-62941@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=203643

Fabrice Bellet (fabrice@bellet.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |fabrice@bellet.info

--- Comment #4 from Fabrice Bellet (fabrice@bellet.info) ---
I confirm the bug related to this commit, and to its backported version in
5.0.15. My device is a Sony DR-BT21G headset. 

With this commit, the hcidump reports this error message:

> ACL data: handle 256 flags 0x02 dlen 12
     L2CAP(s): Connect req: psm 3 scid 0x0041
 < ACL data: handle 256 flags 0x00 dlen 16
    L2CAP(s): Connect rsp: dcid 0x0000 scid 0x0041 result 3 status 0
      Connection refused - security block

Without it, the hcidump reports a successful connection:

 > ACL data: handle 256 flags 0x02 dlen 12
     L2CAP(s): Connect req: psm 3 scid 0x0041
 < ACL data: handle 256 flags 0x00 dlen 16
    L2CAP(s): Connect rsp: dcid 0x0040 scid 0x0041 result 0 status 0
      Connection successful

-- 
You are receiving this mail because:
You are the assignee for the bug.
