Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6F5DBA00F
	for <lists+linux-bluetooth@lfdr.de>; Sun, 22 Sep 2019 02:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726981AbfIVAn7 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 21 Sep 2019 20:43:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:52322 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726973AbfIVAn7 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 21 Sep 2019 20:43:59 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 204877] [Regression] Linux 5.3 breaks connecting a DualShock 4
 controller via bluetooth
Date:   Sun, 22 Sep 2019 00:43:58 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Vash63@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204877-62941-71mx8lyA4i@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204877-62941@https.bugzilla.kernel.org/>
References: <bug-204877-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=204877

--- Comment #5 from George Gibbs (Vash63@gmail.com) ---
(In reply to Andrey Smirnov from comment #4)
> AFAICT this issue should be fixed by:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git/
> commit/?id=8bb3537095f107ed55ad51f6241165b397aaafac

Thanks, just tested with this patch and it's working great for me now.

-- 
You are receiving this mail because:
You are the assignee for the bug.
