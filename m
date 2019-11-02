Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A113CECDE5
	for <lists+linux-bluetooth@lfdr.de>; Sat,  2 Nov 2019 10:54:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbfKBJyo convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 2 Nov 2019 05:54:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:51820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726163AbfKBJyo (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 2 Nov 2019 05:54:44 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 204765] debugfs: File 'le_min_key_size' in directory 'hci0'
 already present!
Date:   Sat, 02 Nov 2019 09:54:43 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: maximilian.ammann@googlemail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-204765-62941-TPTq9m6V1s@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204765-62941@https.bugzilla.kernel.org/>
References: <bug-204765-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=204765

Max Ammann (maximilian.ammann@googlemail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |maximilian.ammann@googlemai
                   |                            |l.com

--- Comment #2 from Max Ammann (maximilian.ammann@googlemail.com) ---
Created attachment 285745
  --> https://bugzilla.kernel.org/attachment.cgi?id=285745&action=edit
Output of lsusb (wifi/bluetooth chip is connected via usb on T490)

I'm experiencing the same problem. I'm also unable to reconnect to bluetooth
devices after the pairing and the initial connect succeeded.

-- 
You are receiving this mail because:
You are the assignee for the bug.
