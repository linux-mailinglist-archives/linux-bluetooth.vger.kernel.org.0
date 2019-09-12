Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EAC8B0F24
	for <lists+linux-bluetooth@lfdr.de>; Thu, 12 Sep 2019 14:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731754AbfILMxH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 12 Sep 2019 08:53:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:41480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731320AbfILMxH (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 12 Sep 2019 08:53:07 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 204585] Bluetooth Mouse Polling Rate Regressed to 20hz
Date:   Thu, 12 Sep 2019 12:53:06 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: trivial
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pavel@noa-labs.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204585-62941-4zyLeA8SAe@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204585-62941@https.bugzilla.kernel.org/>
References: <bug-204585-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=204585

--- Comment #5 from Pavel (pavel@noa-labs.com) ---
My device is rapoo 550 made on MXCHIP btle chipset

-- 
You are receiving this mail because:
You are the assignee for the bug.
