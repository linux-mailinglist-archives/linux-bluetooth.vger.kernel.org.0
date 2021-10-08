Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF454426C0F
	for <lists+linux-bluetooth@lfdr.de>; Fri,  8 Oct 2021 15:53:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234491AbhJHNz2 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 8 Oct 2021 09:55:28 -0400
Received: from mga18.intel.com ([134.134.136.126]:60430 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240647AbhJHNz1 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 8 Oct 2021 09:55:27 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="213457772"
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; 
   d="scan'208";a="213457772"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2021 06:53:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; 
   d="scan'208";a="624744994"
Received: from intel-lenovo-legion-y540-15irh-pg0.iind.intel.com ([10.224.186.95])
  by fmsmga001.fm.intel.com with ESMTP; 08 Oct 2021 06:53:30 -0700
From:   Kiran K <kiran.k@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     ravishankar.srivatsa@intel.com, chethan.tumkur.narayan@intel.com,
        luiz.von.dentz@intel.com, Kiran K <kiran.k@intel.com>
Subject: [PATCH v1 5/7] Bluetooth: btintel: Add support to fetch data path id for a2dp offload
Date:   Fri,  8 Oct 2021 19:28:51 +0530
Message-Id: <20211008135853.8604-5-kiran.k@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211008135853.8604-1-kiran.k@intel.com>
References: <20211008135853.8604-1-kiran.k@intel.com>
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

During *setup*, when configuring offload, set get_data_path_id callback
function and support fetching of data path id for a2dp offload use case.

Signed-off-by: Kiran K <kiran.k@intel.com>
Change-Id: Id05bff65e5e88ac4e6379d4184a5775fb6330c6d
---
 drivers/bluetooth/btintel.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/bluetooth/btintel.c b/drivers/bluetooth/btintel.c
index de4667179efb..8dcb0e3c7386 100644
--- a/drivers/bluetooth/btintel.c
+++ b/drivers/bluetooth/btintel.c
@@ -2212,16 +2212,30 @@ static int btintel_get_data_path_id(struct hci_dev *hdev, __u8 transport,
 {
 	struct btintel_data *intel_data;
 
-	if (transport != HCI_TRANSPORT_SCO_ESCO)
+	if (transport != HCI_TRANSPORT_SCO_ESCO &&
+	    transport != HCI_TRANSPORT_ACL) {
+		bt_dev_err(hdev, "Invalid transport type %u", transport);
 		return -EINVAL;
+	}
 
 	intel_data = hci_get_priv((hdev));
 
-	if (intel_data->use_cases.preset[0] & 0x03) {
-		/* Intel uses 1 as data path id for all the usecases */
-		*data_path_id = 1;
-		return 0;
+	switch (transport) {
+	case HCI_TRANSPORT_SCO_ESCO:
+		if (intel_data->use_cases.preset[0] & 0x03) {
+			*data_path_id = 1;
+			return 0;
+		}
+		break;
+	case HCI_TRANSPORT_ACL:
+		if (intel_data->use_cases.preset[0] & 0x08) {
+			*data_path_id = 1;
+			return 0;
+		}
+		break;
 	}
+	bt_dev_err(hdev, "Required preset is not supported 0x%02x",
+		   intel_data->use_cases.preset[0]);
 	return  -EOPNOTSUPP;
 }
 
@@ -2260,6 +2274,10 @@ static int btintel_configure_offload(struct hci_dev *hdev)
 		hdev->get_codec_config_data = btintel_get_codec_config_data;
 	}
 
+	/* supports SBC codec for a2dp offload */
+	if (use_cases->preset[0] & 0x08)
+		hdev->get_data_path_id = btintel_get_data_path_id;
+
 error:
 	kfree_skb(skb);
 	return err;
-- 
2.17.1

