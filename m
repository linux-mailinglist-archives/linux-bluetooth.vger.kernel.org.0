Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5086927A109
	for <lists+linux-bluetooth@lfdr.de>; Sun, 27 Sep 2020 14:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbgI0Mp4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 27 Sep 2020 08:45:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:45108 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726280AbgI0Mp4 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 27 Sep 2020 08:45:56 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 60824] [PATCH][regression] Cambridge Silicon Radio, Ltd
 Bluetooth Dongle unusable
Date:   Sun, 27 Sep 2020 12:45:53 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vinodmishra@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-60824-62941-UpP9PYpiCy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-60824-62941@https.bugzilla.kernel.org/>
References: <bug-60824-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=60824

--- Comment #155 from vinodmishra@gmail.com ---
(In reply to Flole from comment #154)
> (In reply to Alex from comment #86)
> > Hi Swyter,
> > 
> > I also tried your patch v2 and actually in my case see no difference with
> > the previous ones I tried (see my comments 55/56
> > https://bugzilla.kernel.org/show_bug.cgi?id=60824#c55 )
> > 
> > Linux recognizes the controller, but it's unusable:
> > 
> > Can't init device hci0: Invalid argument (22)
> > 
> > > HCI Event: Command Complete (0x0e) plen 4                                 
> > >                                                                  #22
> [hci0]
> > > 11.191461
> >       Set Event Filter (0x03|0x0005) ncmd 1
> >         Status: Invalid HCI Command Parameters (0x12)
> > = Close Index: 00:1A:7D:DA:71:12                                            
> > [hci0] 11.191493
> > 
> > 
> > I've seen several people here have this issue, and I believe that comment
> 59
> > may be quite relevant here:
> > 
> > > Set Event fails, looking at hci_core.c the set filter and previous calls
> > are
> > > made only if device supports BREDR, is there any way to tell device
> doesn't
> > > support, or patch this ?
> 
> I have the same device, and my fix was simply changing the #define that
> checks if a device supports BREDR to "false" (aka disabling BREDR support
> completely) and that solved it.
Thanks so much. 
Same device and same issue on Pi Zero. Changing the "#define
lmp_bredr_capable(dev)" in hci_core.h to return false did the trick.

-- 
You are receiving this mail because:
You are the assignee for the bug.
