Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56F8710C094
	for <lists+linux-bluetooth@lfdr.de>; Thu, 28 Nov 2019 00:25:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbfK0XZI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 27 Nov 2019 18:25:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:33594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727031AbfK0XZI (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 27 Nov 2019 18:25:08 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 205685] New: Initialization failure for Cambridge Silicon
 Radio, Ltd Bluetooth Dongle
Date:   Wed, 27 Nov 2019 23:25:07 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: net@dalmat.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-205685-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=205685

            Bug ID: 205685
           Summary: Initialization failure for Cambridge Silicon Radio,
                    Ltd Bluetooth Dongle
           Product: Drivers
           Version: 2.5
    Kernel Version: 4.19.67-2+deb10u2
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: low
          Priority: P1
         Component: Bluetooth
          Assignee: linux-bluetooth@vger.kernel.org
          Reporter: net@dalmat.net
        Regression: No

Created attachment 286091
  --> https://bugzilla.kernel.org/attachment.cgi?id=286091&action=edit
btmon trace

Hello,

I own a bluetooth USB adapter that fails to initialize.
The other bugs I saw deal with other device, hence this new one.


$ sudo hciconfig
hci0:   Type: Primary  Bus: USB
        BD Address: 00:1A:7D:DA:XX:XX  ACL MTU: 679:9  SCO MTU: 48:16
        DOWN 
        RX bytes:1722 acl:0 sco:0 events:90 errors:0
        TX bytes:1104 acl:0 sco:0 commands:90 errors:0

$ sudo hciconfig hci0 up
Can't init device hci0: Operation not supported (95)

The device is the following one (full lsusb output attached as file)
Bus 001 Device 008: ID 0a12:0001 Cambridge Silicon Radio, Ltd Bluetooth Dongle
(HCI mode)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               1.10
  bDeviceClass          224 Wireless
  bDeviceSubClass         1 Radio Frequency
  bDeviceProtocol         1 Bluetooth
  bMaxPacketSize0        64
  idVendor           0x0a12 Cambridge Silicon Radio, Ltd
  idProduct          0x0001 Bluetooth Dongle (HCI mode)
  bcdDevice           88.91
  iManufacturer           0 
  iProduct                2 
  iSerial                 0 

I attach a btmon trace that seems to indicate that the "Delete Stored Link Key"
is not supported.

Is there a way to support this device in degraded mode in case the feature is
not supported ?

Cheers

-- 
You are receiving this mail because:
You are the assignee for the bug.
