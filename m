Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0556B3B76
	for <lists+linux-bluetooth@lfdr.de>; Mon, 16 Sep 2019 15:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727995AbfIPNen convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 16 Sep 2019 09:34:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:54940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727826AbfIPNen (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 16 Sep 2019 09:34:43 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 204877] [Regression] Linux 5.3 breaks connecting a DualShock 4
 controller via bluetooth
Date:   Mon, 16 Sep 2019 13:34:42 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204877-62941-ITM7lesNWR@https.bugzilla.kernel.org/>
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

George Gibbs (Vash63@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |Vash63@gmail.com

--- Comment #1 from George Gibbs (Vash63@gmail.com) ---
I can duplicate this issue on both a DS4 v1 (model CUH-ZTC1U) and a v2 (model
CUH-ZCT2U), though the crc check numbers are slightly different.

CUH-ZTC1U:
kernel: sony 0005:054C:05C4.0017: unknown main item tag 0x0
kernel: sony 0005:054C:05C4.0017: DualShock 4 calibration report's CRC check
failed, received crc 0x1cffff8c != 0xdfe3b226
kernel: sony 0005:054C:05C4.0017: Retrying DualShock 4 get calibration report
request
kernel: sony 0005:054C:05C4.0017: DualShock 4 calibration report's CRC check
failed, received crc 0x1cffff8c != 0xdfe3b226
kernel: sony 0005:054C:05C4.0017: Retrying DualShock 4 get calibration report
request
kernel: sony 0005:054C:05C4.0017: DualShock 4 calibration report's CRC check
failed, received crc 0x1cffff8c != 0xdfe3b226
kernel: sony 0005:054C:05C4.0017: Failed to get calibration data from Dualshock
4
kernel: sony 0005:054C:05C4.0017: hidraw18: BLUETOOTH HID v81.00 Gamepad
[Wireless Controller] on a0:c5:89:b5:44:e1
kernel: sony 0005:054C:05C4.0017: failed to claim input

CUH-ZCT2U:
kernel: sony 0005:054C:09CC.0019: unknown main item tag 0x0
kernel: sony 0005:054C:09CC.0019: DualShock 4 calibration report's CRC check
failed, received crc 0x1cffff8c != 0x48b66901
kernel: sony 0005:054C:09CC.0019: Retrying DualShock 4 get calibration report
request
kernel: sony 0005:054C:09CC.0019: DualShock 4 calibration report's CRC check
failed, received crc 0x1cffff8c != 0x48b66901
kernel: sony 0005:054C:09CC.0019: Retrying DualShock 4 get calibration report
request
kernel: sony 0005:054C:09CC.0019: DualShock 4 calibration report's CRC check
failed, received crc 0x1cffff8c != 0x48b66901
kernel: sony 0005:054C:09CC.0019: Failed to get calibration data from Dualshock
4
kernel: sony 0005:054C:09CC.0019: hidraw19: BLUETOOTH HID v80.01 Gamepad
[Wireless Controller] on a0:c5:89:b5:44:e1
kernel: sony 0005:054C:09CC.0019: failed to claim input

-- 
You are receiving this mail because:
You are the assignee for the bug.
