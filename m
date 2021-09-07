Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38DED4026D1
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 Sep 2021 12:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244427AbhIGKJE (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 7 Sep 2021 06:09:04 -0400
Received: from mga17.intel.com ([192.55.52.151]:1677 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243048AbhIGKJD (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 7 Sep 2021 06:09:03 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="200362868"
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; 
   d="scan'208";a="200362868"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2021 03:07:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; 
   d="scan'208";a="512785262"
Received: from intel-lenovo-legion-y540-15irh-pg0.iind.intel.com ([10.224.186.95])
  by orsmga001.jf.intel.com with ESMTP; 07 Sep 2021 03:07:55 -0700
From:   Kiran K <kiran.k@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     ravishankar.srivatsa@intel.com, chethan.tumkur.narayan@intel.com,
        luiz.von.dentz@intel.com, michaelfsun@google.com
Subject: [PATCH v15 12/13] Bluetooth: Allow usb to auto-suspend when SCO use non-HCI transport
Date:   Tue,  7 Sep 2021 15:42:48 +0530
Message-Id: <20210907101249.7323-12-kiran.k@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210907101249.7323-1-kiran.k@intel.com>
References: <20210907101249.7323-1-kiran.k@intel.com>
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Chethan T N <chethan.tumkur.narayan@intel.com>

Currently usb tranport is not allowed to suspend when SCO over
HCI tranport is active.

This patch shall enable the usb tranport to suspend when SCO
link use non-HCI transport.

Signed-off-by: Chethan T N <chethan.tumkur.narayan@intel.com>
---

Notes:
    * changes in v15:
    - No changes
    
    * changes in v14:
     - Address review comments
    
    * changes in v13:
     - suspend usb in HFP offload use case

 net/bluetooth/hci_event.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index b48e24629fa4..fdf51f89754a 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -4444,6 +4444,7 @@ static void hci_sync_conn_complete_evt(struct hci_dev *hdev,
 {
 	struct hci_ev_sync_conn_complete *ev = (void *) skb->data;
 	struct hci_conn *conn;
+	unsigned int notify_evt;
 
 	BT_DBG("%s status 0x%2.2x", hdev->name, ev->status);
 
@@ -4518,15 +4519,21 @@ static void hci_sync_conn_complete_evt(struct hci_dev *hdev,
 
 	switch (ev->air_mode) {
 	case 0x02:
-		if (hdev->notify)
-			hdev->notify(hdev, HCI_NOTIFY_ENABLE_SCO_CVSD);
+		notify_evt = HCI_NOTIFY_ENABLE_SCO_CVSD;
 		break;
 	case 0x03:
-		if (hdev->notify)
-			hdev->notify(hdev, HCI_NOTIFY_ENABLE_SCO_TRANSP);
+		notify_evt = HCI_NOTIFY_ENABLE_SCO_TRANSP;
 		break;
 	}
 
+	/* Notify only in case of SCO over HCI transport data path which
+	 * is zero and non-zero value shall be non-HCI transport data path
+	 */
+	if (conn->codec.data_path == 0) {
+		if (hdev->notify)
+			hdev->notify(hdev, notify_evt);
+	}
+
 	hci_connect_cfm(conn, ev->status);
 	if (ev->status)
 		hci_conn_del(conn);
-- 
2.17.1

