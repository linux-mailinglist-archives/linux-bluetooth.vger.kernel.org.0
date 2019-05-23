Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C47DB2749E
	for <lists+linux-bluetooth@lfdr.de>; Thu, 23 May 2019 04:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730028AbfEWCvp convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 22 May 2019 22:51:45 -0400
Received: from mail.wl.linuxfoundation.org ([198.145.29.98]:44552 "EHLO
        mail.wl.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729877AbfEWCvn (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 22 May 2019 22:51:43 -0400
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
        by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 9386826E3A
        for <linux-bluetooth@vger.kernel.org>; Thu, 23 May 2019 02:51:42 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
        id 8830727D29; Thu, 23 May 2019 02:51:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
        pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS autolearn=ham version=3.3.1
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 203685] failed to load firmware after resume
Date:   Thu, 23 May 2019 02:51:41 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rui.zhang@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: blocked
Message-ID: <bug-203685-62941-7x91u45nsK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203685-62941@https.bugzilla.kernel.org/>
References: <bug-203685-62941@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=203685

Zhang Rui (rui.zhang@intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Blocks|                            |178231

--- Comment #1 from Zhang Rui (rui.zhang@intel.com) ---
This happens on a HP kabylake-r laptop.


Referenced Bugs:

https://bugzilla.kernel.org/show_bug.cgi?id=178231
[Bug 178231] Meta-bug: Linux suspend-to-mem and freeze performance optimization
-- 
You are receiving this mail because:
You are the assignee for the bug.
