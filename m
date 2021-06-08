Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80FA239F657
	for <lists+linux-bluetooth@lfdr.de>; Tue,  8 Jun 2021 14:21:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232541AbhFHMWq (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 8 Jun 2021 08:22:46 -0400
Received: from mga04.intel.com ([192.55.52.120]:22776 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232539AbhFHMWq (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 8 Jun 2021 08:22:46 -0400
IronPort-SDR: zmNMonpd4lLnFJ1GxX6nJgqUCaQAx2DgwCo1woVyFXlXHwKwsX7OhL8L/cwQriuKnWGHMndS0p
 CXgMwyhAoiWA==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="202973553"
X-IronPort-AV: E=Sophos;i="5.83,258,1616482800"; 
   d="scan'208";a="202973553"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2021 05:20:53 -0700
IronPort-SDR: CYUJd/pgLhFnOsvxa/uwC+8CO7T94dpUjtAblJnZ/D9GKckzBJM3MGstQLAt49+H/M6lSbGotu
 fSzeYtyk6wcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,258,1616482800"; 
   d="scan'208";a="619283449"
Received: from intel-lenovo-legion-y540-15irh-pg0.iind.intel.com ([10.224.186.95])
  by orsmga005.jf.intel.com with ESMTP; 08 Jun 2021 05:20:52 -0700
From:   Kiran K <kiran.k@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Kiran K <kiran.k@intel.com>
Subject: [PATCH v9 04/10] Bluetooth: btintel: set get_data_path callback
Date:   Tue,  8 Jun 2021 17:54:49 +0530
Message-Id: <20210608122455.19583-4-kiran.k@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210608122455.19583-1-kiran.k@intel.com>
References: <20210608122455.19583-1-kiran.k@intel.com>
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Read supported offload usecases and set get_data_path callback if
controller suppports offload codecs.

Signed-off-by: Kiran K <kiran.k@intel.com>
Reviewed-by: Chethan T N <chethan.tumkur.narayan@intel.com>
Reviewed-by: Srivatsa Ravishankar <ravishankar.srivatsa@intel.com>
---
 drivers/bluetooth/btintel.c | 36 ++++++++++++++++++++++++++++++++++++
 drivers/bluetooth/btintel.h | 18 ++++++++++++++++++
 drivers/bluetooth/btusb.c   |  8 ++++++++
 3 files changed, 62 insertions(+)

diff --git a/drivers/bluetooth/btintel.c b/drivers/bluetooth/btintel.c
index e44b6993cf91..95c6a1bef35e 100644
--- a/drivers/bluetooth/btintel.c
+++ b/drivers/bluetooth/btintel.c
@@ -1272,6 +1272,42 @@ int btintel_set_debug_features(struct hci_dev *hdev,
 }
 EXPORT_SYMBOL_GPL(btintel_set_debug_features);
 
+int btintel_get_data_path(struct hci_dev *hdev)
+{
+	return 1;
+}
+EXPORT_SYMBOL_GPL(btintel_get_data_path);
+
+int btintel_read_offload_usecases(struct hci_dev *hdev,
+				  struct intel_offload_usecases *usecases)
+{
+	struct sk_buff *skb;
+	int err = 0;
+
+	skb = __hci_cmd_sync(hdev, 0xfc86, 0, NULL, HCI_INIT_TIMEOUT);
+	if (IS_ERR(skb)) {
+		bt_dev_err(hdev, "Reading offload usecases failed (%ld)",
+			   PTR_ERR(skb));
+		return PTR_ERR(skb);
+	}
+
+	if (skb->len < sizeof(*usecases)) {
+		err = -EIO;
+		goto error;
+	}
+
+	if (skb->data[0]) {
+		err = -bt_to_errno(skb->data[0]);
+		goto error;
+	}
+
+	memcpy(usecases, skb->data, sizeof(*usecases));
+error:
+	kfree_skb(skb);
+	return err;
+}
+EXPORT_SYMBOL_GPL(btintel_read_offload_usecases);
+
 MODULE_AUTHOR("Marcel Holtmann <marcel@holtmann.org>");
 MODULE_DESCRIPTION("Bluetooth support for Intel devices ver " VERSION);
 MODULE_VERSION(VERSION);
diff --git a/drivers/bluetooth/btintel.h b/drivers/bluetooth/btintel.h
index d184064a5e7c..9bcc489680db 100644
--- a/drivers/bluetooth/btintel.h
+++ b/drivers/bluetooth/btintel.h
@@ -132,6 +132,11 @@ struct intel_debug_features {
 	__u8    page1[16];
 } __packed;
 
+struct intel_offload_usecases {
+	__u8	status;
+	__u8	preset[8];
+} __packed;
+
 #define INTEL_HW_PLATFORM(cnvx_bt)	((u8)(((cnvx_bt) & 0x0000ff00) >> 8))
 #define INTEL_HW_VARIANT(cnvx_bt)	((u8)(((cnvx_bt) & 0x003f0000) >> 16))
 #define INTEL_CNVX_TOP_TYPE(cnvx_top)	((cnvx_top) & 0x00000fff)
@@ -175,6 +180,9 @@ int btintel_read_debug_features(struct hci_dev *hdev,
 				struct intel_debug_features *features);
 int btintel_set_debug_features(struct hci_dev *hdev,
 			       const struct intel_debug_features *features);
+int btintel_read_offload_usecases(struct hci_dev *hdev,
+				  struct intel_offload_usecases *usecases);
+int btintel_get_data_path(struct hci_dev *hdev);
 #else
 
 static inline int btintel_check_bdaddr(struct hci_dev *hdev)
@@ -307,4 +315,14 @@ static inline int btintel_set_debug_features(struct hci_dev *hdev,
 	return -EOPNOTSUPP;
 }
 
+static int btintel_read_offload_usecases(struct hci_dev *hdev,
+					 struct intel_offload_usecases *usecases)
+{
+	return -EOPNOTSUPP;
+}
+
+static int btintel_get_data_path(struct hci_dev *hdev)
+{
+	return -EOPNOTSUPP;
+}
 #endif
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index a9855a2dd561..1e51beec5776 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2952,6 +2952,7 @@ static int btusb_setup_intel_newgen(struct hci_dev *hdev)
 	int err;
 	struct intel_debug_features features;
 	struct intel_version_tlv version;
+	struct intel_offload_usecases usecases;
 
 	bt_dev_dbg(hdev, "");
 
@@ -3008,6 +3009,13 @@ static int btusb_setup_intel_newgen(struct hci_dev *hdev)
 	/* Set DDC mask for available debug features */
 	btintel_set_debug_features(hdev, &features);
 
+	err = btintel_read_offload_usecases(hdev, &usecases);
+	if (!err) {
+		/* set get_data_path callback if offload is supported */
+		if (usecases.preset[0] & 0x03)
+			hdev->get_data_path = btintel_get_data_path;
+	}
+
 	/* Read the Intel version information after loading the FW  */
 	err = btintel_read_version_tlv(hdev, &version);
 	if (err)
-- 
2.17.1

