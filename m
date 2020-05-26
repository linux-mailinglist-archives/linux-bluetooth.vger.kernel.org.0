Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA4B51C6A99
	for <lists+linux-bluetooth@lfdr.de>; Wed,  6 May 2020 09:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728419AbgEFH6A (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 6 May 2020 03:58:00 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:32877 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728280AbgEFH6A (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 6 May 2020 03:58:00 -0400
Received: from localhost.localdomain (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 5F0E7CED01
        for <linux-bluetooth@vger.kernel.org>; Wed,  6 May 2020 10:07:38 +0200 (CEST)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v3 0/7] Patches introducing experimental feature support
Date:   Wed,  6 May 2020 09:57:45 +0200
Message-Id: <cover.1588751831.git.marcel@holtmann.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Marcel Holtmann (7):
  Bluetooth: Add MGMT_EV_PHY_CONFIGURATION_CHANGED to supported list
  Bluetooth: Replace BT_DBG with bt_dev_dbg for management support
  Bluetooth: replace zero-length array with flexible-array member
  Bluetooth: Introduce HCI_MGMT_HDEV_OPTIONAL option
  Bluetooth: Replace BT_DBG with bt_dev_dbg for security manager 
    support
  Bluetooth: Add support for experimental features configuration
  Bluetooth: Introduce debug feature when dynamic debug is disabled

 include/net/bluetooth/bluetooth.h |  11 +
 include/net/bluetooth/hci.h       |   1 +
 include/net/bluetooth/hci_core.h  |   1 +
 include/net/bluetooth/mgmt.h      |  69 ++++--
 net/bluetooth/Kconfig             |   7 +
 net/bluetooth/hci_sock.c          |  12 +-
 net/bluetooth/lib.c               |  33 +++
 net/bluetooth/mgmt.c              | 364 +++++++++++++++++++++---------
 net/bluetooth/smp.c               |   8 +-
 9 files changed, 365 insertions(+), 141 deletions(-)

-- 
2.26.2

