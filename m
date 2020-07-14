Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE94621E466
	for <lists+linux-bluetooth@lfdr.de>; Tue, 14 Jul 2020 02:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbgGNAUj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 13 Jul 2020 20:20:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:40880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726345AbgGNAUj (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 13 Jul 2020 20:20:39 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 207629] BISECTED Bluetooth: hci0: command 0x2042 tx timeout -
 suspend fails - Dell XPS 9300, Dell XPS 7390, Dell Inspiron 7386, Intel
 NUC7JYB
Date:   Tue, 14 Jul 2020 00:20:38 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: todd.e.brandt@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207629-62941-vjnzT7LZFP@https.bugzilla.kernel.org/>
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

--- Comment #26 from Todd Brandt (todd.e.brandt@linux.intel.com) ---
Hi Pandit, I only used one patch on the 5.8.0-rc2 build, sorry.

This time around a applied both patches and ran on 5.8.0-rc3 and 5.8.0-rc4 and
am very happy to say the bug has completely disappeared! :)

These are the machines that are now working (all that were affected):

otcpl-dell-7386-whl
otcpl-nuc-glk
otcpl-cml-s-1
otcpl-dell-7390-cmlu
otcpl-nuc-glk
otcpl-cml-s-2
otcpl-cml-u

So this fix is confirmed, thanks!

-- 
You are receiving this mail because:
You are the assignee for the bug.
