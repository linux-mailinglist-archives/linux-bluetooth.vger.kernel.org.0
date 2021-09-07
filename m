Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E11954026C8
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 Sep 2021 12:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244229AbhIGKIr (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 7 Sep 2021 06:08:47 -0400
Received: from mga17.intel.com ([192.55.52.151]:1677 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244061AbhIGKIq (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 7 Sep 2021 06:08:46 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="200362829"
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; 
   d="scan'208";a="200362829"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2021 03:07:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; 
   d="scan'208";a="512785144"
Received: from intel-lenovo-legion-y540-15irh-pg0.iind.intel.com ([10.224.186.95])
  by orsmga001.jf.intel.com with ESMTP; 07 Sep 2021 03:07:38 -0700
From:   Kiran K <kiran.k@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     ravishankar.srivatsa@intel.com, chethan.tumkur.narayan@intel.com,
        luiz.von.dentz@intel.com, michaelfsun@google.com,
        Kiran K <kiran.k@intel.com>
Subject: [PATCH v15 05/13] Bluetooth: btintel: Define callback to fetch data_path_id
Date:   Tue,  7 Sep 2021 15:42:41 +0530
Message-Id: <20210907101249.7323-5-kiran.k@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210907101249.7323-1-kiran.k@intel.com>
References: <20210907101249.7323-1-kiran.k@intel.com>
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

For Intel controllers supporting HFP offload usecase,
define a callback function to fetch data_path_id

Signed-off-by: Kiran K <kiran.k@intel.com>
Reviewed-by: Chethan T N <chethan.tumkur.narayan@intel.com>
Reviewed-by: Srivatsa Ravishankar <ravishankar.srivatsa@intel.com>
---

Notes:
    * changes in v15:
      - no changes
    
    * changes in v14:
      - no changes
    
    * changes in v13:
      - no changes
    
    * changes in v12:
      - no changes
    
    * changes in v11:
      - no changes
    
    * changes in v10:
      - new patch due to refactoring

 drivers/bluetooth/btintel.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/bluetooth/btintel.c b/drivers/bluetooth/btintel.c
index 60f9866c6792..751e0f0b8242 100644
--- a/drivers/bluetooth/btintel.c
+++ b/drivers/bluetooth/btintel.c
@@ -2158,6 +2158,13 @@ static int btintel_prepare_fw_download_tlv(struct hci_dev *hdev,
 	return err;
 }
 
+static int btintel_get_data_path_id(struct hci_dev *hdev, __u8 *data_path_id)
+{
+	/* Intel uses 1 as data path id for all the usecases */
+	*data_path_id = 1;
+	return 0;
+}
+
 static int btintel_configure_offload(struct hci_dev *hdev)
 {
 	struct sk_buff *skb;
@@ -2182,6 +2189,9 @@ static int btintel_configure_offload(struct hci_dev *hdev)
 		err = -bt_to_errno(skb->data[0]);
 		goto error;
 	}
+
+	if (use_cases->preset[0] & 0x03)
+		hdev->get_data_path_id = btintel_get_data_path_id;
 error:
 	kfree_skb(skb);
 	return err;
-- 
2.17.1

