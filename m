Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30F494B636
	for <lists+linux-bluetooth@lfdr.de>; Wed, 19 Jun 2019 12:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731446AbfFSKcc convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 19 Jun 2019 06:32:32 -0400
Received: from mail.wl.linuxfoundation.org ([198.145.29.98]:37468 "EHLO
        mail.wl.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731398AbfFSKcc (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 19 Jun 2019 06:32:32 -0400
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
        by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 6662828ACB
        for <linux-bluetooth@vger.kernel.org>; Wed, 19 Jun 2019 10:32:31 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
        id 5A7B728AD7; Wed, 19 Jun 2019 10:32:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
        pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS autolearn=ham version=3.3.1
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 199461] Unable to use Microsoft Surface Precision Mouse
Date:   Wed, 19 Jun 2019 10:32:30 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: maarten.fonville@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-199461-62941-1jAJRIE75s@https.bugzilla.kernel.org/>
In-Reply-To: <bug-199461-62941@https.bugzilla.kernel.org/>
References: <bug-199461-62941@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=199461

--- Comment #8 from Maarten Fonville (maarten.fonville@gmail.com) ---
@Michael

the scroll wheel that stops working is not related to Bluetooth.
I experienced the very same issue with the scroll wheel when using the mouse
via USB. This happened since the upgrade to Ubuntu 19.04 and I think it is
related to the desktop environment. It seems to be sometimes triggered by lock
screen or suspend (but not 100% reproducible). Reconnecting the USB (or
reconnecting via bluetooth) lets the desktop re-initialize the mouse and
resolves the scroll wheel issue.

-- 
You are receiving this mail because:
You are the assignee for the bug.
