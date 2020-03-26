Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F933193B76
	for <lists+linux-bluetooth@lfdr.de>; Thu, 26 Mar 2020 10:05:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgCZJFe (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 26 Mar 2020 05:05:34 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:37187 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbgCZJFe (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 26 Mar 2020 05:05:34 -0400
Received: from localhost.localdomain (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 4CA2ECECDB
        for <linux-bluetooth@vger.kernel.org>; Thu, 26 Mar 2020 10:15:04 +0100 (CET)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v2 untested] Bluetooth: Add framework for Microsoft vendor extension
Date:   Thu, 26 Mar 2020 10:05:28 +0100
Message-Id: <20200326090528.129562-1-marcel@holtmann.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Miao-chen Chou <mcchou@chromium.org>

Micrsoft defined a set for HCI vendor extensions. Check the following
link for details:

https://docs.microsoft.com/en-us/windows-hardware/drivers/bluetooth/microsoft-defined-bluetooth-hci-commands-and-events

This provides the basic framework to enable the extension and read its
supported features. Drivers still have to declare support for this
extension before it can be utilized by the host stack.

Signed-off-by: Miao-chen Chou <mcchou@chromium.org>
Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 include/net/bluetooth/hci_core.h |   5 ++
 net/bluetooth/Kconfig            |   7 ++
 net/bluetooth/Makefile           |   1 +
 net/bluetooth/hci_core.c         |   5 ++
 net/bluetooth/hci_event.c        |   5 ++
 net/bluetooth/msft.c             | 150 +++++++++++++++++++++++++++++++
 net/bluetooth/msft.h             |  20 +++++
 7 files changed, 193 insertions(+)
 create mode 100644 net/bluetooth/msft.c
 create mode 100644 net/bluetooth/msft.h

diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index d4e28773d378..59ddcd3a52cc 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -484,6 +484,11 @@ struct hci_dev {
 	struct led_trigger	*power_led;
 #endif
 
+#if IS_ENABLED(CONFIG_BT_MSFTEXT)
+	__u16			msft_opcode;
+	void			*msft_data;
+#endif
+
 	int (*open)(struct hci_dev *hdev);
 	int (*close)(struct hci_dev *hdev);
 	int (*flush)(struct hci_dev *hdev);
diff --git a/net/bluetooth/Kconfig b/net/bluetooth/Kconfig
index 165148c7c4ce..d439be5c534e 100644
--- a/net/bluetooth/Kconfig
+++ b/net/bluetooth/Kconfig
@@ -93,6 +93,13 @@ config BT_LEDS
 	  This option selects a few LED triggers for different
 	  Bluetooth events.
 
+config BT_MSFTEXT
+	bool "Enable Microsoft extensions"
+	depends on BT
+	help
+	  This options enables support for the Microsoft defined HCI
+	  vendor extensions.
+
 config BT_SELFTEST
 	bool "Bluetooth self testing support"
 	depends on BT && DEBUG_KERNEL
diff --git a/net/bluetooth/Makefile b/net/bluetooth/Makefile
index fda41c0b4781..41dd541a44a5 100644
--- a/net/bluetooth/Makefile
+++ b/net/bluetooth/Makefile
@@ -19,5 +19,6 @@ bluetooth-y := af_bluetooth.o hci_core.o hci_conn.o hci_event.o mgmt.o \
 bluetooth-$(CONFIG_BT_BREDR) += sco.o
 bluetooth-$(CONFIG_BT_HS) += a2mp.o amp.o
 bluetooth-$(CONFIG_BT_LEDS) += leds.o
+bluetooth-$(CONFIG_BT_MSFTEXT) += msft.o
 bluetooth-$(CONFIG_BT_DEBUGFS) += hci_debugfs.o
 bluetooth-$(CONFIG_BT_SELFTEST) += selftest.o
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 2e7bc2da8371..09625e2cb02a 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -44,6 +44,7 @@
 #include "hci_debugfs.h"
 #include "smp.h"
 #include "leds.h"
+#include "msft.h"
 
 static void hci_rx_work(struct work_struct *work);
 static void hci_cmd_work(struct work_struct *work);
@@ -1563,6 +1564,8 @@ static int hci_dev_do_open(struct hci_dev *hdev)
 	    hci_dev_test_flag(hdev, HCI_VENDOR_DIAG) && hdev->set_diag)
 		ret = hdev->set_diag(hdev, true);
 
+	msft_do_open(hdev);
+
 	clear_bit(HCI_INIT, &hdev->flags);
 
 	if (!ret) {
@@ -1758,6 +1761,8 @@ int hci_dev_do_close(struct hci_dev *hdev)
 
 	hci_sock_dev_event(hdev, HCI_DEV_DOWN);
 
+	msft_do_close(hdev);
+
 	if (hdev->flush)
 		hdev->flush(hdev);
 
diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 0a591be8b0ae..ed2a96f1ef55 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -35,6 +35,7 @@
 #include "a2mp.h"
 #include "amp.h"
 #include "smp.h"
+#include "msft.h"
 
 #define ZERO_KEY "\x00\x00\x00\x00\x00\x00\x00\x00" \
 		 "\x00\x00\x00\x00\x00\x00\x00\x00"
@@ -6145,6 +6146,10 @@ void hci_event_packet(struct hci_dev *hdev, struct sk_buff *skb)
 		hci_num_comp_blocks_evt(hdev, skb);
 		break;
 
+	case HCI_EV_VENDOR:
+		msft_vendor_evt(hdev, skb);
+		break;
+
 	default:
 		BT_DBG("%s event 0x%2.2x", hdev->name, event);
 		break;
diff --git a/net/bluetooth/msft.c b/net/bluetooth/msft.c
new file mode 100644
index 000000000000..6f2af20507a1
--- /dev/null
+++ b/net/bluetooth/msft.c
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 Google Corporation
+ */
+
+#include <net/bluetooth/bluetooth.h>
+#include <net/bluetooth/hci_core.h>
+
+#include "msft.h"
+
+#define MSFT_OP_READ_SUPPORTED_FEATURES		0x00
+struct msft_cp_read_supported_features {
+	__u8   sub_opcode;
+} __packed;
+struct msft_rp_read_supported_features {
+	__u8   status;
+	__u8   sub_opcode;
+	__le64 features;
+	__u8   evt_prefix_len;
+	__u8   evt_prefix[0];
+} __packed;
+
+struct msft_data {
+	__u64 features;
+	__u8  evt_prefix_len;
+	__u8  *evt_prefix;
+};
+
+void msft_set_opcode(struct hci_dev *hdev, __u16 opcode)
+{
+	hdev->msft_opcode = opcode;
+
+	bt_dev_info(hdev, "Enabling MSFT extensions with opcode 0x%2.2x",
+		    hdev->msft_opcode);
+}
+
+static bool read_supported_features(struct hci_dev *hdev)
+{
+	struct msft_data *msft = hdev->msft_data;
+	struct msft_cp_read_supported_features cp;
+	struct msft_rp_read_supported_features *rp;
+	struct sk_buff *skb;
+
+	cp.sub_opcode = MSFT_OP_READ_SUPPORTED_FEATURES;
+
+	skb = __hci_cmd_sync(hdev, hdev->msft_opcode, sizeof(cp), &cp,
+			     HCI_CMD_TIMEOUT);
+	if (IS_ERR(skb)) {
+		bt_dev_err(hdev, "Failed to read MSFT supported features (%ld)",
+			   PTR_ERR(skb));
+		return false;
+	}
+
+	if (skb->len < sizeof(*rp)) {
+		bt_dev_err(hdev, "MSFT supported features length mismatch");
+		goto failed;
+	}
+
+	rp = (struct msft_rp_read_supported_features *)skb->data;
+
+	if (rp->sub_opcode != MSFT_OP_READ_SUPPORTED_FEATURES)
+		goto failed;
+
+	if (rp->evt_prefix_len > 0) {
+		msft->evt_prefix = kmemdup(rp->evt_prefix, rp->evt_prefix_len,
+					   GFP_KERNEL);
+		if (!msft->evt_prefix)
+			goto failed;
+	}
+
+	msft->evt_prefix_len = rp->evt_prefix_len;
+	msft->features = __le64_to_cpu(rp->features);
+	kfree_skb(skb);
+
+	bt_dev_info(hdev, "MSFT supported features %llx", msft->features);
+	return true;
+
+failed:
+	kfree_skb(skb);
+	return false;
+}
+
+void msft_do_open(struct hci_dev *hdev)
+{
+	struct msft_data *msft;
+
+	if (hdev->msft_opcode == HCI_OP_NOP)
+		return;
+
+	bt_dev_dbg(hdev, "Initialize MSFT extension");
+
+	msft = kzalloc(sizeof(*msft), GFP_KERNEL);
+	if (!msft)
+		return;
+
+	if (!read_supported_features(hdev)) {
+		kfree(msft);
+		return;
+	}
+
+	hdev->msft_data = msft;
+}
+
+void msft_do_close(struct hci_dev *hdev)
+{
+	struct msft_data *msft = hdev->msft_data;
+
+	if (!msft)
+		return;
+
+	bt_dev_dbg(hdev, "Cleanup of MSFT extension");
+
+	hdev->msft_data = NULL;
+
+	kfree(msft->evt_prefix);
+	kfree(msft);
+}
+
+void msft_vendor_evt(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	struct msft_data *msft = hdev->msft_data;
+	u8 event;
+
+	if (!msft)
+		return;
+
+	/* When the extension has defined an event prefix, check that it
+	 * matches, and otherwise just return.
+	 */
+	if (msft->evt_prefix_len > 0) {
+		if (skb->len < msft->evt_prefix_len)
+			return;
+
+		if (memcmp(skb->data, msft->evt_prefix, msft->evt_prefix_len))
+			return;
+
+		skb_pull(skb, msft->evt_prefix_len);
+	}
+
+	/* Every event starts at least with an event code and the rest of
+	 * the data is variable and depends on the event code.
+	 */
+	if (skb->len < 1)
+		return;
+
+	event = *skb->data;
+	skb_pull(skb, 1);
+
+	bt_dev_dbg(hdev, "MSFT vendor event %u", event);
+}
diff --git a/net/bluetooth/msft.h b/net/bluetooth/msft.h
new file mode 100644
index 000000000000..f3cf404457a8
--- /dev/null
+++ b/net/bluetooth/msft.h
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 Google Corporation
+ */
+
+#if IS_ENABLED(CONFIG_BT_MSFTEXT)
+
+void msft_set_opcode(struct hci_dev *hdev, __u16 opcode);
+void msft_do_open(struct hci_dev *hdev);
+void msft_do_close(struct hci_dev *hdev);
+void msft_vendor_evt(struct hci_dev *hdev, struct sk_buff *skb);
+
+#else
+
+static inline void msft_set_opcode(struct hci_dev *hdev, __u16 opcode) {}
+static inline void msft_do_open(struct hci_dev *hdev) {}
+static inline void msft_do_close(struct hci_dev *hdev) {}
+static inline void msft_vendor_evt(struct hci_dev *hdev, struct sk_buff *skb) {}
+
+#endif
-- 
2.25.1

