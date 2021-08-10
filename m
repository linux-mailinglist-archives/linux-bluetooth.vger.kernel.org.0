Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87AA53D7158
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jul 2021 10:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235942AbhG0Imy (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 27 Jul 2021 04:42:54 -0400
Received: from mga17.intel.com ([192.55.52.151]:2131 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235629AbhG0Imy (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 27 Jul 2021 04:42:54 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="192677081"
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; 
   d="scan'208";a="192677081"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2021 01:42:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; 
   d="scan'208";a="662541252"
Received: from intel-lenovo-legion-y540-15irh-pg0.iind.intel.com ([10.224.186.95])
  by fmsmga006.fm.intel.com with ESMTP; 27 Jul 2021 01:42:50 -0700
From:   Kiran K <kiran.k@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     ravishankar.srivatsa@intel.com, chethan.tumkur.narayan@intel.com,
        Kiran K <kiran.k@intel.com>
Subject: [PATCH v11 01/10] Bluetooth: Enumerate local supported codec and cache details
Date:   Tue, 27 Jul 2021 14:17:04 +0530
Message-Id: <20210727084713.23038-1-kiran.k@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Move reading of supported local codecs into a separate init function,
query codecs capabilities and cache the data

Signed-off-by: Kiran K <kiran.k@intel.com>
Signed-off-by: Chethan T N <chethan.tumkur.narayan@intel.com>
Signed-off-by: Srivatsa Ravishankar <ravishankar.srivatsa@intel.com>
---
* changes in v11:
 - Remove Kconfig related changes
 - Address minor review comments
 - Move codec related functions to new file hci_codec.c

* changes in v10:
 - define Kconfig to control offload feature at build time
 - fix review comments

* changes in v9:
  - use shortname vnd instead of ven

* changes in v8:
  - add comments
  - split __u8 codec_id[5] into {__u8 id; __le16 cid, vid }
  - address review comment related codec caps structure

* changes in v7:
  - keep codec enumeration call in hci_init instead of having a separate
    function
  - Remove unused bitmasks defined for LE transports

* changes  in v6:
  - fix compiler warning reported for ARCH=arc

* changes in v5:
  - fix review comments
  - move code used to read standard/vendor codecs caps into single function

* changes in v4:
  - convert  reading of codecs and codecs caps calls from async to sync

* changes in v3
  move codec enumeration into a new init function

* changes in v2
  add skb length check before accessing data

 include/net/bluetooth/hci.h      |  41 +++++++
 include/net/bluetooth/hci_core.h |  17 +++
 net/bluetooth/Makefile           |   2 +-
 net/bluetooth/hci_codec.c        | 194 +++++++++++++++++++++++++++++++
 net/bluetooth/hci_codec.h        |   6 +
 net/bluetooth/hci_core.c         |  12 +-
 6 files changed, 266 insertions(+), 6 deletions(-)
 create mode 100644 net/bluetooth/hci_codec.c
 create mode 100644 net/bluetooth/hci_codec.h

diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
index b80415011dcd..f76849c8eafd 100644
--- a/include/net/bluetooth/hci.h
+++ b/include/net/bluetooth/hci.h
@@ -1307,6 +1307,28 @@ struct hci_rp_read_data_block_size {
 } __packed;
 
 #define HCI_OP_READ_LOCAL_CODECS	0x100b
+struct hci_std_codecs {
+	__u8	num;
+	__u8	codec[];
+} __packed;
+
+struct hci_vnd_codec {
+	/* company id */
+	__le16	cid;
+	/* vendor codec id */
+	__le16	vid;
+} __packed;
+
+struct hci_vnd_codecs {
+	__u8	num;
+	struct hci_vnd_codec codec[];
+} __packed;
+
+struct hci_rp_read_local_supported_codecs {
+	__u8	status;
+	struct hci_std_codecs std_codecs;
+	struct hci_vnd_codecs vnd_codecs;
+} __packed;
 
 #define HCI_OP_READ_LOCAL_PAIRING_OPTS	0x100c
 struct hci_rp_read_local_pairing_opts {
@@ -1315,6 +1337,25 @@ struct hci_rp_read_local_pairing_opts {
 	__u8     max_key_size;
 } __packed;
 
+#define HCI_OP_READ_LOCAL_CODEC_CAPS	0x100e
+struct hci_op_read_local_codec_caps {
+	__u8	id;
+	__le16	cid;
+	__le16	vid;
+	__u8	transport;
+	__u8	direction;
+} __packed;
+
+struct hci_codec_caps {
+	__u8	len;
+	__u8	data[];
+} __packed;
+
+struct hci_rp_read_local_codec_caps {
+	__u8	status;
+	__u8	num_caps;
+} __packed;
+
 #define HCI_OP_READ_PAGE_SCAN_ACTIVITY	0x0c1b
 struct hci_rp_read_page_scan_activity {
 	__u8     status;
diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index a53e94459ecd..6742e6ad7b37 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -131,6 +131,17 @@ struct bdaddr_list {
 	u8 bdaddr_type;
 };
 
+struct codec_list {
+	struct list_head list;
+	u8	id;
+	__u16	cid;
+	__u16	vid;
+	u8	transport;
+	u8	num_caps;
+	u32	len;
+	struct hci_codec_caps caps[];
+};
+
 struct bdaddr_list_with_irk {
 	struct list_head list;
 	bdaddr_t bdaddr;
@@ -535,6 +546,7 @@ struct hci_dev {
 	struct list_head	pend_le_conns;
 	struct list_head	pend_le_reports;
 	struct list_head	blocked_keys;
+	struct list_head	local_codecs;
 
 	struct hci_dev_stats	stat;
 
@@ -1849,4 +1861,9 @@ void hci_copy_identity_address(struct hci_dev *hdev, bdaddr_t *bdaddr,
 #define SCO_AIRMODE_CVSD       0x0000
 #define SCO_AIRMODE_TRANSP     0x0003
 
+#define LOCAL_CODEC_ACL_MASK	BIT(0)
+#define LOCAL_CODEC_SCO_MASK	BIT(1)
+
+#define TRANSPORT_TYPE_MAX	0x04
+
 #endif /* __HCI_CORE_H */
diff --git a/net/bluetooth/Makefile b/net/bluetooth/Makefile
index cc0995301f93..f3e439d98b85 100644
--- a/net/bluetooth/Makefile
+++ b/net/bluetooth/Makefile
@@ -14,7 +14,7 @@ bluetooth_6lowpan-y := 6lowpan.o
 
 bluetooth-y := af_bluetooth.o hci_core.o hci_conn.o hci_event.o mgmt.o \
 	hci_sock.o hci_sysfs.o l2cap_core.o l2cap_sock.o smp.o lib.o \
-	ecdh_helper.o hci_request.o mgmt_util.o mgmt_config.o
+	ecdh_helper.o hci_request.o mgmt_util.o mgmt_config.o hci_codec.o
 
 bluetooth-$(CONFIG_BT_BREDR) += sco.o
 bluetooth-$(CONFIG_BT_HS) += a2mp.o amp.o
diff --git a/net/bluetooth/hci_codec.c b/net/bluetooth/hci_codec.c
new file mode 100644
index 000000000000..205f3b04c172
--- /dev/null
+++ b/net/bluetooth/hci_codec.c
@@ -0,0 +1,194 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2021 Intel Corporation */
+
+#include <net/bluetooth/bluetooth.h>
+#include <net/bluetooth/hci_core.h>
+
+static int hci_codec_list_add(struct list_head *list,
+			      struct hci_op_read_local_codec_caps *sent,
+			      struct hci_rp_read_local_codec_caps *rp,
+			      void *caps,
+			      __u32 len)
+{
+	struct codec_list *entry;
+
+	entry = kzalloc(sizeof(*entry) + len, GFP_KERNEL);
+	if (!entry)
+		return -ENOMEM;
+
+	entry->id = sent->id;
+	if (sent->id == 0xFF) {
+		entry->cid = __le16_to_cpu(sent->cid);
+		entry->vid = __le16_to_cpu(sent->vid);
+	}
+	entry->transport = sent->transport;
+	entry->len = len;
+	entry->num_caps = rp->num_caps;
+	if (rp->num_caps)
+		memcpy(entry->caps, caps, len);
+	list_add(&entry->list, list);
+
+	return 0;
+}
+
+void hci_codec_list_clear(struct list_head *codec_list)
+{
+	struct codec_list *c, *n;
+
+	list_for_each_entry_safe(c, n, codec_list, list) {
+		list_del(&c->list);
+		kfree(c);
+	}
+}
+
+static void hci_read_codec_capabilities(struct hci_dev *hdev, void *codec_id,
+					__u8 transport, bool is_vnd_codec)
+{
+	struct hci_op_read_local_codec_caps cmd;
+	__u8 i;
+
+	memset(&cmd, 0, sizeof(cmd));
+
+	if (is_vnd_codec) {
+		struct hci_vnd_codec *vnd_codec;
+
+		vnd_codec = codec_id;
+		cmd.id = 0xFF;
+		cmd.cid = vnd_codec->cid;
+		cmd.vid = vnd_codec->vid;
+	} else {
+		cmd.id = *(__u8 *)codec_id;
+	}
+
+	cmd.direction = 0x00;
+
+	for (i = 0; i < TRANSPORT_TYPE_MAX; i++) {
+		if (transport & BIT(i)) {
+			struct hci_rp_read_local_codec_caps *rp;
+			struct hci_codec_caps *caps;
+			struct sk_buff *skb;
+			__u8 j;
+			__u32 len;
+
+			cmd.transport = i;
+			skb = __hci_cmd_sync(hdev, HCI_OP_READ_LOCAL_CODEC_CAPS,
+					     sizeof(cmd), &cmd,
+					     HCI_CMD_TIMEOUT);
+			if (IS_ERR(skb)) {
+				bt_dev_err(hdev, "Failed to read codec capabilities (%ld)",
+					   PTR_ERR(skb));
+				continue;
+			}
+
+			if (skb->len < sizeof(*rp))
+				goto error;
+
+			rp = (void *)skb->data;
+
+			if (rp->status)
+				goto error;
+
+			if (!rp->num_caps) {
+				len = 0;
+				/* this codec doesn't have capabilities */
+				goto skip_caps_parse;
+			}
+
+			skb_pull(skb, sizeof(*rp));
+
+			for (j = 0, len = 0; j < rp->num_caps; j++) {
+				caps = (void *)skb->data;
+				if (skb->len < sizeof(*caps))
+					goto error;
+				if (skb->len < caps->len)
+					goto error;
+				len += sizeof(caps->len) + caps->len;
+				skb_pull(skb,  sizeof(caps->len) + caps->len);
+			}
+
+skip_caps_parse:
+			hci_dev_lock(hdev);
+			hci_codec_list_add(&hdev->local_codecs, &cmd, rp,
+					   (__u8 *)rp + sizeof(*rp), len);
+			hci_dev_unlock(hdev);
+error:
+			kfree_skb(skb);
+		}
+	}
+}
+
+static void hci_codec_list_parse(struct hci_dev *hdev, __u8 num_codecs,
+				 void *codec_list, bool is_vnd_codec)
+{
+	__u8 i;
+
+	for (i = 0; i < num_codecs; i++) {
+		if (!is_vnd_codec) {
+			struct hci_std_codecs *codecs = codec_list;
+
+			hci_read_codec_capabilities(hdev, &codecs->codec[i],
+						    LOCAL_CODEC_ACL_MASK,
+						    is_vnd_codec);
+		} else {
+			struct hci_vnd_codecs *codecs = codec_list;
+
+			hci_read_codec_capabilities(hdev, &codecs->codec[i],
+						    LOCAL_CODEC_ACL_MASK,
+						    is_vnd_codec);
+		}
+	}
+}
+
+void hci_read_supported_codecs(struct hci_dev *hdev)
+{
+	struct sk_buff *skb;
+	struct hci_rp_read_local_supported_codecs *rp;
+	struct hci_std_codecs *std_codecs;
+	struct hci_vnd_codecs *vnd_codecs;
+
+	skb = __hci_cmd_sync(hdev, HCI_OP_READ_LOCAL_CODECS, 0, NULL,
+			     HCI_CMD_TIMEOUT);
+
+	if (IS_ERR(skb)) {
+		bt_dev_err(hdev, "Failed to read local supported codecs (%ld)",
+			   PTR_ERR(skb));
+		return;
+	}
+
+	if (skb->len < sizeof(*rp))
+		goto error;
+
+	rp = (void *)skb->data;
+
+	if (rp->status)
+		goto error;
+
+	skb_pull(skb, sizeof(rp->status));
+
+	std_codecs = (void *)skb->data;
+
+	/* validate codecs length before accessing */
+	if (skb->len < flex_array_size(std_codecs, codec, std_codecs->num)
+	    + sizeof(std_codecs->num))
+		goto error;
+
+	/* enumerate codec capabilities of standard codecs */
+	hci_codec_list_parse(hdev, std_codecs->num, std_codecs, false);
+
+	skb_pull(skb, flex_array_size(std_codecs, codec, std_codecs->num)
+		 + sizeof(std_codecs->num));
+
+	vnd_codecs = (void *)skb->data;
+
+	/* validate vendor codecs length before accessing */
+	if (skb->len <
+	    flex_array_size(vnd_codecs, codec, vnd_codecs->num)
+	    + sizeof(vnd_codecs->num))
+		goto error;
+
+	/* enumerate vendor codec capabilities */
+	hci_codec_list_parse(hdev, vnd_codecs->num, vnd_codecs, true);
+
+error:
+	kfree_skb(skb);
+}
diff --git a/net/bluetooth/hci_codec.h b/net/bluetooth/hci_codec.h
new file mode 100644
index 000000000000..e5e594933d07
--- /dev/null
+++ b/net/bluetooth/hci_codec.h
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/* Copyright (C) 2021 Intel Corporation */
+
+void hci_read_supported_codecs(struct hci_dev *hdev);
+void hci_codec_list_clear(struct list_head *codec_list);
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 2560ed2f144d..212d5066d413 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -45,6 +45,7 @@
 #include "leds.h"
 #include "msft.h"
 #include "aosp.h"
+#include "hci_codec.h"
 
 static void hci_rx_work(struct work_struct *work);
 static void hci_cmd_work(struct work_struct *work);
@@ -838,10 +839,6 @@ static int hci_init4_req(struct hci_request *req, unsigned long opt)
 	if (hdev->commands[22] & 0x04)
 		hci_set_event_mask_page_2(req);
 
-	/* Read local codec list if the HCI command is supported */
-	if (hdev->commands[29] & 0x20)
-		hci_req_add(req, HCI_OP_READ_LOCAL_CODECS, 0, NULL);
-
 	/* Read local pairing options if the HCI command is supported */
 	if (hdev->commands[41] & 0x08)
 		hci_req_add(req, HCI_OP_READ_LOCAL_PAIRING_OPTS, 0, NULL);
@@ -937,6 +934,10 @@ static int __hci_init(struct hci_dev *hdev)
 	if (err < 0)
 		return err;
 
+	/* Read local codec list if the HCI command is supported */
+	if (hdev->commands[29] & 0x20)
+		hci_read_supported_codecs(hdev);
+
 	/* This function is only called when the controller is actually in
 	 * configured state. When the controller is marked as unconfigured,
 	 * this initialization procedure is not run.
@@ -1841,6 +1842,7 @@ int hci_dev_do_close(struct hci_dev *hdev)
 	memset(hdev->eir, 0, sizeof(hdev->eir));
 	memset(hdev->dev_class, 0, sizeof(hdev->dev_class));
 	bacpy(&hdev->random_addr, BDADDR_ANY);
+	hci_codec_list_clear(&hdev->local_codecs);
 
 	hci_req_sync_unlock(hdev);
 
@@ -3842,7 +3844,7 @@ struct hci_dev *hci_alloc_dev(void)
 	INIT_LIST_HEAD(&hdev->conn_hash.list);
 	INIT_LIST_HEAD(&hdev->adv_instances);
 	INIT_LIST_HEAD(&hdev->blocked_keys);
-
+	INIT_LIST_HEAD(&hdev->local_codecs);
 	INIT_WORK(&hdev->rx_work, hci_rx_work);
 	INIT_WORK(&hdev->cmd_work, hci_cmd_work);
 	INIT_WORK(&hdev->tx_work, hci_tx_work);
-- 
2.17.1

