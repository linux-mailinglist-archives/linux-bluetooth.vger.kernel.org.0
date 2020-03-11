Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89903181DEB
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Mar 2020 17:32:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730192AbgCKQcT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 11 Mar 2020 12:32:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:60892 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729631AbgCKQcT (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 11 Mar 2020 12:32:19 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 196621] bluez-5.46: unit/test-gatt segfaults when running tests
Date:   Wed, 11 Mar 2020 16:32:18 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-196621-62941-dgybaCnK7j@https.bugzilla.kernel.org/>
In-Reply-To: <bug-196621-62941@https.bugzilla.kernel.org/>
References: <bug-196621-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=196621

--- Comment #10 from Brian Gix (brian.gix@gmail.com) ---
The User space API's in the kernel are needed for Bluetooth Mesh daemon
support, including at a minimum:

CONFIG_CRYPTO_USER
CONFIG_CRYPTO_USER_API
CONFIG_CRYPTO_USER_API_AEAD
CONFIG_CRYPTO_USER_API_HASH

CONFIG_CRYPTO_AES
CONFIG_CRYPTO_CCM
CONFIG_CRYPTO_AEAD
CONFIG_CRYPTO_CMAC

And there may be others.

-- 
You are receiving this mail because:
You are the assignee for the bug.
