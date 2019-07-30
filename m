Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 624DC7A437
	for <lists+linux-bluetooth@lfdr.de>; Tue, 30 Jul 2019 11:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731274AbfG3Jdt (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 30 Jul 2019 05:33:49 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:38637 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730931AbfG3Jdt (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 30 Jul 2019 05:33:49 -0400
Received: from localhost.localdomain (p5B3D2BA7.dip0.t-ipconnect.de [91.61.43.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 75099CECFD;
        Tue, 30 Jul 2019 11:42:25 +0200 (CEST)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     torvalds@linux-foundation.org
Cc:     linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org
Subject: [PATCH v5.3-rc2] Bluetooth: hci_uart: check for missing tty operations
Date:   Tue, 30 Jul 2019 11:33:45 +0200
Message-Id: <20190730093345.25573-1-marcel@holtmann.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Vladis Dronov <vdronov@redhat.com>

Certain ttys operations (pty_unix98_ops) lack tiocmget() and tiocmset()
functions which are called by the certain HCI UART protocols (hci_ath,
hci_bcm, hci_intel, hci_mrvl, hci_qca) via hci_uart_set_flow_control()
or directly. This leads to an execution at NULL and can be triggered by
an unprivileged user. Fix this by adding a helper function and a check
for the missing tty operations in the protocols code.

This fixes CVE-2019-10207. The Fixes: lines list commits where calls to
tiocm[gs]et() or hci_uart_set_flow_control() were added to the HCI UART
protocols.

Link: https://syzkaller.appspot.com/bug?id=1b42faa2848963564a5b1b7f8c837ea7b55ffa50
Reported-by: syzbot+79337b501d6aa974d0f6@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org # v2.6.36+
Fixes: b3190df62861 ("Bluetooth: Support for Atheros AR300x serial chip")
Fixes: 118612fb9165 ("Bluetooth: hci_bcm: Add suspend/resume PM functions")
Fixes: ff2895592f0f ("Bluetooth: hci_intel: Add Intel baudrate configuration support")
Fixes: 162f812f23ba ("Bluetooth: hci_uart: Add Marvell support")
Fixes: fa9ad876b8e0 ("Bluetooth: hci_qca: Add support for Qualcomm Bluetooth chip wcn3990")
Signed-off-by: Vladis Dronov <vdronov@redhat.com>
Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 drivers/bluetooth/hci_ath.c   |  3 +++
 drivers/bluetooth/hci_bcm.c   |  3 +++
 drivers/bluetooth/hci_intel.c |  3 +++
 drivers/bluetooth/hci_ldisc.c | 13 +++++++++++++
 drivers/bluetooth/hci_mrvl.c  |  3 +++
 drivers/bluetooth/hci_qca.c   |  3 +++
 drivers/bluetooth/hci_uart.h  |  1 +
 7 files changed, 29 insertions(+)

diff --git a/drivers/bluetooth/hci_ath.c b/drivers/bluetooth/hci_ath.c
index a55be205b91a..dbfe34664633 100644
--- a/drivers/bluetooth/hci_ath.c
+++ b/drivers/bluetooth/hci_ath.c
@@ -98,6 +98,9 @@ static int ath_open(struct hci_uart *hu)
 
 	BT_DBG("hu %p", hu);
 
+	if (!hci_uart_has_flow_control(hu))
+		return -EOPNOTSUPP;
+
 	ath = kzalloc(sizeof(*ath), GFP_KERNEL);
 	if (!ath)
 		return -ENOMEM;
diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index 8905ad2edde7..ae2624fce913 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -406,6 +406,9 @@ static int bcm_open(struct hci_uart *hu)
 
 	bt_dev_dbg(hu->hdev, "hu %p", hu);
 
+	if (!hci_uart_has_flow_control(hu))
+		return -EOPNOTSUPP;
+
 	bcm = kzalloc(sizeof(*bcm), GFP_KERNEL);
 	if (!bcm)
 		return -ENOMEM;
diff --git a/drivers/bluetooth/hci_intel.c b/drivers/bluetooth/hci_intel.c
index 207bae5e0d46..31f25153087d 100644
--- a/drivers/bluetooth/hci_intel.c
+++ b/drivers/bluetooth/hci_intel.c
@@ -391,6 +391,9 @@ static int intel_open(struct hci_uart *hu)
 
 	BT_DBG("hu %p", hu);
 
+	if (!hci_uart_has_flow_control(hu))
+		return -EOPNOTSUPP;
+
 	intel = kzalloc(sizeof(*intel), GFP_KERNEL);
 	if (!intel)
 		return -ENOMEM;
diff --git a/drivers/bluetooth/hci_ldisc.c b/drivers/bluetooth/hci_ldisc.c
index 8950e07889fe..85a30fb9177b 100644
--- a/drivers/bluetooth/hci_ldisc.c
+++ b/drivers/bluetooth/hci_ldisc.c
@@ -292,6 +292,19 @@ static int hci_uart_send_frame(struct hci_dev *hdev, struct sk_buff *skb)
 	return 0;
 }
 
+/* Check the underlying device or tty has flow control support */
+bool hci_uart_has_flow_control(struct hci_uart *hu)
+{
+	/* serdev nodes check if the needed operations are present */
+	if (hu->serdev)
+		return true;
+
+	if (hu->tty->driver->ops->tiocmget && hu->tty->driver->ops->tiocmset)
+		return true;
+
+	return false;
+}
+
 /* Flow control or un-flow control the device */
 void hci_uart_set_flow_control(struct hci_uart *hu, bool enable)
 {
diff --git a/drivers/bluetooth/hci_mrvl.c b/drivers/bluetooth/hci_mrvl.c
index f98e5cc343b2..fbc3f7c3a5c7 100644
--- a/drivers/bluetooth/hci_mrvl.c
+++ b/drivers/bluetooth/hci_mrvl.c
@@ -59,6 +59,9 @@ static int mrvl_open(struct hci_uart *hu)
 
 	BT_DBG("hu %p", hu);
 
+	if (!hci_uart_has_flow_control(hu))
+		return -EOPNOTSUPP;
+
 	mrvl = kzalloc(sizeof(*mrvl), GFP_KERNEL);
 	if (!mrvl)
 		return -ENOMEM;
diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 9a5c9c1f9484..82a0a3691a63 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -473,6 +473,9 @@ static int qca_open(struct hci_uart *hu)
 
 	BT_DBG("hu %p qca_open", hu);
 
+	if (!hci_uart_has_flow_control(hu))
+		return -EOPNOTSUPP;
+
 	qca = kzalloc(sizeof(struct qca_data), GFP_KERNEL);
 	if (!qca)
 		return -ENOMEM;
diff --git a/drivers/bluetooth/hci_uart.h b/drivers/bluetooth/hci_uart.h
index f11af3912ce6..6ab631101019 100644
--- a/drivers/bluetooth/hci_uart.h
+++ b/drivers/bluetooth/hci_uart.h
@@ -104,6 +104,7 @@ int hci_uart_wait_until_sent(struct hci_uart *hu);
 int hci_uart_init_ready(struct hci_uart *hu);
 void hci_uart_init_work(struct work_struct *work);
 void hci_uart_set_baudrate(struct hci_uart *hu, unsigned int speed);
+bool hci_uart_has_flow_control(struct hci_uart *hu);
 void hci_uart_set_flow_control(struct hci_uart *hu, bool enable);
 void hci_uart_set_speeds(struct hci_uart *hu, unsigned int init_speed,
 			 unsigned int oper_speed);
-- 
2.21.0

