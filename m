Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91406198382
	for <lists+linux-bluetooth@lfdr.de>; Mon, 30 Mar 2020 20:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgC3SjJ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 30 Mar 2020 14:39:09 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:42354 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbgC3SjJ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 30 Mar 2020 14:39:09 -0400
Received: from localhost.localdomain (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id C79F6CECD2
        for <linux-bluetooth@vger.kernel.org>; Mon, 30 Mar 2020 20:40:42 +0200 (CEST)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH] Bluetooth: Add HCI device identifier for VIRTIO devices
Date:   Mon, 30 Mar 2020 20:31:05 +0200
Message-Id: <20200330183105.287856-1-marcel@holtmann.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch assigns the next free HCI device identifier to Bluetooth
devices based on VIRTIO devices.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 include/net/bluetooth/hci.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
index 5f60e135aeb6..5432ab84ee9c 100644
--- a/include/net/bluetooth/hci.h
+++ b/include/net/bluetooth/hci.h
@@ -65,6 +65,7 @@
 #define HCI_SPI		7
 #define HCI_I2C		8
 #define HCI_SMD		9
+#define HCI_VIRTIO	10
 
 /* HCI controller types */
 #define HCI_PRIMARY	0x00
-- 
2.25.1

