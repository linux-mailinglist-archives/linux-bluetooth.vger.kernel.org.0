Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1772844FEC7
	for <lists+linux-bluetooth@lfdr.de>; Mon, 15 Nov 2021 07:44:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230423AbhKOGqw (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 15 Nov 2021 01:46:52 -0500
Received: from mga02.intel.com ([134.134.136.20]:7180 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230090AbhKOGqs (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 15 Nov 2021 01:46:48 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="220598228"
X-IronPort-AV: E=Sophos;i="5.87,235,1631602800"; 
   d="scan'208";a="220598228"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2021 22:43:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,235,1631602800"; 
   d="scan'208";a="453725963"
Received: from intel-lenovo-legion-y540-15irh-pg0.iind.intel.com ([10.224.186.95])
  by orsmga003.jf.intel.com with ESMTP; 14 Nov 2021 22:43:46 -0800
From:   Kiran K <kiran.k@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     ravishankar.srivatsa@intel.com, chethan.tumkur.narayan@intel.com,
        luiz.von.dentz@intel.com, Kiran K <kiran.k@intel.com>
Subject: [PATCH v3 05/13] Bluetooth: btintel: Add support to fetch data path id for a2dp offload
Date:   Mon, 15 Nov 2021 12:19:06 +0530
Message-Id: <20211115064914.2345-5-kiran.k@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211115064914.2345-1-kiran.k@intel.com>
References: <20211115064914.2345-1-kiran.k@intel.com>
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

During *setup*, when configuring offload, set get_data_path_id callback
function and support fetching of data path id for a2dp offload use case.

Signed-off-by: Kiran K <kiran.k@intel.com>
Reviewed-by: Chethan T N <chethan.tumkur.narayan@intel.com>
Reviewed-by: Srivatsa Ravishankar <ravishankar.srivatsa@intel.com>
---
 drivers/bluetooth/btintel.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/bluetooth/btintel.c b/drivers/bluetooth/btintel.c
index 4b6d7ea08425..1501376ccf72 100644
--- a/drivers/bluetooth/btintel.c
+++ b/drivers/bluetooth/btintel.c
@@ -2214,16 +2214,30 @@ static int btintel_get_data_path_id(struct hci_dev *hdev, __u8 transport,
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
 
@@ -2262,6 +2276,10 @@ static int btintel_configure_offload(struct hci_dev *hdev)
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

