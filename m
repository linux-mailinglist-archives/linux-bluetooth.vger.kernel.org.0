Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 140DE181DAD
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Mar 2020 17:24:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729584AbgCKQYX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 11 Mar 2020 12:24:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:46618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726314AbgCKQYX (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 11 Mar 2020 12:24:23 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 206815] bluez-5.53: unit/test-mesh-crypto fails
Date:   Wed, 11 Mar 2020 16:24:22 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: brian.gix@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-206815-62941-BwnSGMePqY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206815-62941@https.bugzilla.kernel.org/>
References: <bug-206815-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=206815

Brian Gix (brian.gix@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |brian.gix@gmail.com

--- Comment #1 from Brian Gix (brian.gix@gmail.com) ---
The output of this failure seems to indicate that the Kernel you are using
hasn't been compiled with the proper support for user space invokation of
AES-CCM.

I think your kernel needs to be recompiled with the following .config options:

CONFIG_CRYPTO_USER=m
CONFIG_CRYPTO_USER_API=y
CONFIG_CRYPTO_USER_API_AEAD=y

CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_CCM=y     --> My kernel actually has this set to "m"


These are *minimum* requirements, and this may cause a cascade of a few other
Crypto support options needing to be turned on.

-- 
You are receiving this mail because:
You are the assignee for the bug.
