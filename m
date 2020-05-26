Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8C7119DEAA
	for <lists+linux-bluetooth@lfdr.de>; Fri,  3 Apr 2020 21:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728146AbgDCToN (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 3 Apr 2020 15:44:13 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:36930 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbgDCToN (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 3 Apr 2020 15:44:13 -0400
Received: from localhost.localdomain (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 8E178CED05
        for <linux-bluetooth@vger.kernel.org>; Fri,  3 Apr 2020 21:53:45 +0200 (CEST)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH 00/10] List of pending patches
Date:   Fri,  3 Apr 2020 21:43:57 +0200
Message-Id: <20200403194407.784943-1-marcel@holtmann.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This is the list of pending patches that are ready for bluetooth-next.

Marcel Holtmann (6):
  Bluetooth: Move debugfs configuration above the selftests
  Bluetooth: btusb: Enable Intel events even if already in operational
    mode
  Bluetooth: Add support for Read Local Simple Pairing Options
  Bluetooth: Add support for reading security information
  Bluetooth: Increment management interface revision
  Bluetooth: Add HCI device identifier for VIRTIO devices

Miao-chen Chou (2):
  Bluetooth: Add framework for Microsoft vendor extension
  Bluetooth: btusb: Enable MSFT extension for Intel ThunderPeak devices

Sathish Narasimman (1):
  Bluetooth: btusb: handle mSBC audio over USB Endpoints

Sathish Narsimman (1):
  Bluetooth: add support to notify using SCO air mode

 drivers/bluetooth/btusb.c        | 182 +++++++++++++++++++++++--------
 include/net/bluetooth/hci.h      |  11 ++
 include/net/bluetooth/hci_core.h |  15 +++
 include/net/bluetooth/mgmt.h     |   7 ++
 net/bluetooth/Kconfig            |  23 ++--
 net/bluetooth/Makefile           |   1 +
 net/bluetooth/hci_conn.c         |  25 ++++-
 net/bluetooth/hci_core.c         |   9 ++
 net/bluetooth/hci_event.c        |  49 ++++++++-
 net/bluetooth/mgmt.c             |  55 +++++++++-
 net/bluetooth/msft.c             | 141 ++++++++++++++++++++++++
 net/bluetooth/msft.h             |  18 +++
 12 files changed, 477 insertions(+), 59 deletions(-)
 create mode 100644 net/bluetooth/msft.c
 create mode 100644 net/bluetooth/msft.h

-- 
2.25.1

