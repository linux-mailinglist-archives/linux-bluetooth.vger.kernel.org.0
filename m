Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4171D15FE49
	for <lists+linux-bluetooth@lfdr.de>; Sat, 15 Feb 2020 13:09:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbgBOMJK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 15 Feb 2020 07:09:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:43844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725937AbgBOMJJ (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 15 Feb 2020 07:09:09 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 99881] 2015 Apple bluetooth keybord and magic mouse support
Date:   Sat, 15 Feb 2020 12:09:08 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexzavistovi4@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-99881-62941-EMzyEF3nE0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-99881-62941@https.bugzilla.kernel.org/>
References: <bug-99881-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=99881

Dancon (alexzavistovi4@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexzavistovi4@gmail.com

--- Comment #67 from Dancon (alexzavistovi4@gmail.com) ---
(In reply to Mansour Behabadi from comment #66)
> Submitted a patch to the kernel: https://lkml.org/lkml/2020/1/29/61
> potentially fixing https://bugzilla.kernel.org/show_bug.cgi?id=99881#c62 ,
> https://bugzilla.kernel.org/show_bug.cgi?id=99881#c63 and
> https://bugzilla.kernel.org/show_bug.cgi?id=99881#c64 .

Thank u so much. It's save my day.

Linux 5.2.1-050201-generic, this patch fix fn key for MLA22

-- 
You are receiving this mail because:
You are the assignee for the bug.
