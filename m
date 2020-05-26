Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3934F1A1374
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 Apr 2020 20:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgDGSTH (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 7 Apr 2020 14:19:07 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:56631 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgDGSTH (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 7 Apr 2020 14:19:07 -0400
Received: from localhost.localdomain (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 83F17CECDA
        for <linux-bluetooth@vger.kernel.org>; Tue,  7 Apr 2020 20:28:40 +0200 (CEST)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH] Bluetooth: Configure controller address resolution if available
Date:   Tue,  7 Apr 2020 20:19:01 +0200
Message-Id: <20200407181901.976627-1-marcel@holtmann.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

When the LL Privacy support is available, then as part of enabling or
disabling passive background scanning, it is required to set up the
controller based address resolution as well.

Since only passive background scanning is utilizing the whitelist, the
address resolution is now bound to the whitelist and passive background
scanning. All other resolution can be easily done by the host stack.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 include/net/bluetooth/hci.h      |  1 +
 include/net/bluetooth/hci_core.h |  4 ++++
 net/bluetooth/hci_request.c      | 12 ++++++++++++
 3 files changed, 17 insertions(+)

diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
index 5ef4547760db..58360538d42b 100644
--- a/include/net/bluetooth/hci.h
+++ b/include/net/bluetooth/hci.h
@@ -459,6 +459,7 @@ enum {
 #define HCI_LE_SLAVE_FEATURES		0x08
 #define HCI_LE_PING			0x10
 #define HCI_LE_DATA_LEN_EXT		0x20
+#define HCI_LE_LL_PRIVACY		0x40
 #define HCI_LE_EXT_SCAN_POLICY		0x80
 #define HCI_LE_PHY_2M			0x01
 #define HCI_LE_PHY_CODED		0x08
diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index 2f3275f1d1c4..663ffde9bd1d 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -645,6 +645,7 @@ extern struct mutex hci_cb_list_lock;
 	do {							\
 		hci_dev_clear_flag(hdev, HCI_LE_SCAN);		\
 		hci_dev_clear_flag(hdev, HCI_LE_ADV);		\
+		hci_dev_clear_flag(hdev, HCI_LL_RPA_RESOLUTION);\
 		hci_dev_clear_flag(hdev, HCI_PERIODIC_INQ);	\
 	} while (0)
 
@@ -1277,6 +1278,9 @@ void hci_conn_del_sysfs(struct hci_conn *conn);
 #define scan_coded(dev) (((dev)->le_tx_def_phys & HCI_LE_SET_PHY_CODED) || \
 			 ((dev)->le_rx_def_phys & HCI_LE_SET_PHY_CODED))
 
+/* Use LL Privacy based address resolution if supported */
+#define use_ll_privacy(dev) ((dev)->le_features[0] & HCI_LE_LL_PRIVACY)
+
 /* Use ext scanning if set ext scan param and ext scan enable is supported */
 #define use_ext_scan(dev) (((dev)->commands[37] & 0x20) && \
 			   ((dev)->commands[37] & 0x40))
diff --git a/net/bluetooth/hci_request.c b/net/bluetooth/hci_request.c
index 649e1e5ed446..97ba343cd75e 100644
--- a/net/bluetooth/hci_request.c
+++ b/net/bluetooth/hci_request.c
@@ -676,6 +676,12 @@ void hci_req_add_le_scan_disable(struct hci_request *req)
 		cp.enable = LE_SCAN_DISABLE;
 		hci_req_add(req, HCI_OP_LE_SET_SCAN_ENABLE, sizeof(cp), &cp);
 	}
+
+	if (use_ll_privacy(hdev) &&
+	    hci_dev_test_flag(hdev, HCI_LL_RPA_RESOLUTION)) {
+		__u8 enable = 0x00;
+		hci_req_add(req, HCI_OP_LE_SET_ADDR_RESOLV_ENABLE, 1, &enable);
+	}
 }
 
 static void del_from_white_list(struct hci_request *req, bdaddr_t *bdaddr,
@@ -926,6 +932,12 @@ void hci_req_add_le_passive_scan(struct hci_request *req)
 	    (hdev->le_features[0] & HCI_LE_EXT_SCAN_POLICY))
 		filter_policy |= 0x02;
 
+	if (use_ll_privacy(hdev) &&
+	    hci_dev_test_flag(hdev, HCI_LL_RPA_RESOLUTION)) {
+		__u8 enable = 0x01;
+		hci_req_add(req, HCI_OP_LE_SET_ADDR_RESOLV_ENABLE, 1, &enable);
+	}
+
 	if (hdev->suspended) {
 		window = LE_SUSPEND_SCAN_WINDOW;
 		interval = LE_SUSPEND_SCAN_INTERVAL;
-- 
2.25.2

