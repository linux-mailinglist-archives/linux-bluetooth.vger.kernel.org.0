Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3AD21CF2D
	for <lists+linux-bluetooth@lfdr.de>; Mon, 13 Jul 2020 08:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729007AbgGMGIj (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 13 Jul 2020 02:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbgGMGIj (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 13 Jul 2020 02:08:39 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F0BAC061794
        for <linux-bluetooth@vger.kernel.org>; Sun, 12 Jul 2020 23:08:39 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id mn17so5696915pjb.4
        for <linux-bluetooth@vger.kernel.org>; Sun, 12 Jul 2020 23:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0uDYaKG7efI3+NfcjCvxS1+KgIa76fmhv33RI9RFLbw=;
        b=px2ksbWwSJhbjmUbIJ63HBzYBvOGlHyUBt9B0pF+4pgvgLXeq34BDrdMfO/gxmUZhp
         rYhY5ppi7cRTdLfhFiWmxYhgGYIZDEIJKHSxQVub8c6ZkMzIByaWxUZyBLCIcTO4DOdR
         Lt36K+tKEg5eJCT4CvnrE4QwjOe9aSspQlO0f1IfBS32TGpbYzPwbhwndW2Bsh5jbIn0
         kF0wlJj9ZEIrCFsl+UtFTNTweBAlw28PwJ12H8TwXE1S0+ug4VDK0qRFrL3shHznLgqB
         uTY1G7tF3n7pizLiWSFR/gG15sqenq+0xvWd1wlWxRe+O52sUPq4fCOzn1drvUAodTPG
         ggAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0uDYaKG7efI3+NfcjCvxS1+KgIa76fmhv33RI9RFLbw=;
        b=ZlZMOGQXnHZQ2KW9aAJZzRvSTD7KrFegWb2nujH84prTNrqLmXtdgSInz89CX4gSoi
         B/QSjC8Ze9pNrJ7MiAy/YGWWbMYWWsi4qaPcRdWEj/IjCz/0k7E1sBHTevJR+GjPfBJ2
         8WeoDfH3uDo4tVSHsdJ/UrK5qllf2UBlCr0p0fE8xWro7VSF/F2bOekhQiMxoetQNbBw
         auLZ8w0Iw3Qd35KvoPTna03jbt0Ydt/FSYfc0IhrIAkamBsWePOBN6SA7iaY1/CBOYSh
         hDt+ctI9wZ34yyG5XvhPCbY/yR7dkpYGVcg0gy655c45Pdk3RVoAEBZMn44LIm1OcXPX
         dLWg==
X-Gm-Message-State: AOAM533ikU+eupZJb/oO7st17RpclNYB3Ho6lCATj9GAe+4k8CdEISJR
        3om4ThPTCllKdx0AdFxl87woRqz/01pbFw==
X-Google-Smtp-Source: ABdhPJwNQ6NolcuI4fo2EMFSmZV5v3hizkmCsrOVSp897Tzx1OrF8N7vMAaCwW8no8YvsCBGHQcl6g==
X-Received: by 2002:a17:90a:21ef:: with SMTP id q102mr19042543pjc.101.1594620518503;
        Sun, 12 Jul 2020 23:08:38 -0700 (PDT)
Received: from nsathish-Latitude-7480.iind.intel.com ([192.55.54.40])
        by smtp.gmail.com with ESMTPSA id e5sm12787172pjy.26.2020.07.12.23.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 23:08:38 -0700 (PDT)
From:   Sathish Narasimman <nsathish41@gmail.com>
X-Google-Original-From: Sathish Narasimman <sathish.narasimman@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Sathish Narsimman <sathish.narasimman@intel.com>
Subject: [PATCH 2/8] Bluetooth: Configure controller address resolution if available
Date:   Mon, 13 Jul 2020 11:42:14 +0530
Message-Id: <20200713061220.3252-3-sathish.narasimman@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200713061220.3252-1-sathish.narasimman@intel.com>
References: <20200713061220.3252-1-sathish.narasimman@intel.com>
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Marcel Holtmann <marcel@holtmann.org>

When the LL Privacy support is available, then as part of enabling or
disabling passive background scanning, it is required to set up the
controller based address resolution as well.

Since only passive background scanning is utilizing the whitelist, the
address resolution is now bound to the whitelist and passive background
scanning. All other resolution can be easily done by the host stack.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Signed-off-by: Sathish Narsimman <sathish.narasimman@intel.com>
---
 include/net/bluetooth/hci_core.h |  3 +++
 net/bluetooth/hci_request.c      | 26 +++++++++++++++++++++++---
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index 34ad5b207598..065250242a1b 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -1359,6 +1359,9 @@ void hci_conn_del_sysfs(struct hci_conn *conn);
 #define scan_coded(dev) (((dev)->le_tx_def_phys & HCI_LE_SET_PHY_CODED) || \
 			 ((dev)->le_rx_def_phys & HCI_LE_SET_PHY_CODED))
 
+/* Use LL Privacy based address resolution if supported */
+#define use_ll_privacy(dev) ((dev)->le_features[0] & HCI_LE_LL_PRIVACY)
+
 /* Use ext scanning if set ext scan param and ext scan enable is supported */
 #define use_ext_scan(dev) (((dev)->commands[37] & 0x20) && \
 			   ((dev)->commands[37] & 0x40))
diff --git a/net/bluetooth/hci_request.c b/net/bluetooth/hci_request.c
index 770b93758112..d3c7ddbcff33 100644
--- a/net/bluetooth/hci_request.c
+++ b/net/bluetooth/hci_request.c
@@ -675,6 +675,12 @@ void hci_req_add_le_scan_disable(struct hci_request *req)
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
@@ -816,7 +822,8 @@ static bool scan_use_rpa(struct hci_dev *hdev)
 }
 
 static void hci_req_start_scan(struct hci_request *req, u8 type, u16 interval,
-			       u16 window, u8 own_addr_type, u8 filter_policy)
+			       u16 window, u8 own_addr_type, u8 filter_policy,
+			       bool addr_resolv)
 {
 	struct hci_dev *hdev = req->hdev;
 
@@ -825,6 +832,11 @@ static void hci_req_start_scan(struct hci_request *req, u8 type, u16 interval,
 		return;
 	}
 
+	if (use_ll_privacy(hdev) && addr_resolv) {
+		u8 enable = 0x01;
+		hci_req_add(req, HCI_OP_LE_SET_ADDR_RESOLV_ENABLE, 1, &enable);
+	}
+
 	/* Use ext scanning if set ext scan param and ext scan enable is
 	 * supported
 	 */
@@ -898,12 +910,18 @@ static void hci_req_start_scan(struct hci_request *req, u8 type, u16 interval,
 	}
 }
 
+/* Ensure to call hci_req_add_le_scan_disable() first to disable the
+ * controller based address resolution to be able to reconfigure
+ * resolving list.
+ */
 void hci_req_add_le_passive_scan(struct hci_request *req)
 {
 	struct hci_dev *hdev = req->hdev;
 	u8 own_addr_type;
 	u8 filter_policy;
 	u16 window, interval;
+	/* Background scanning should run with address resolution */
+	bool addr_resolv = true;
 
 	if (hdev->scanning_paused) {
 		bt_dev_dbg(hdev, "Scanning is paused for suspend");
@@ -949,7 +967,7 @@ void hci_req_add_le_passive_scan(struct hci_request *req)
 
 	bt_dev_dbg(hdev, "LE passive scan with whitelist = %d", filter_policy);
 	hci_req_start_scan(req, LE_SCAN_PASSIVE, interval, window,
-			   own_addr_type, filter_policy);
+			   own_addr_type, filter_policy, addr_resolv);
 }
 
 static u8 get_adv_instance_scan_rsp_len(struct hci_dev *hdev, u8 instance)
@@ -2748,6 +2766,8 @@ static int active_scan(struct hci_request *req, unsigned long opt)
 	u8 own_addr_type;
 	/* White list is not used for discovery */
 	u8 filter_policy = 0x00;
+	/* Discovery doesn't require controller address resolution */
+	bool addr_resolv = false;
 	int err;
 
 	BT_DBG("%s", hdev->name);
@@ -2770,7 +2790,7 @@ static int active_scan(struct hci_request *req, unsigned long opt)
 
 	hci_req_start_scan(req, LE_SCAN_ACTIVE, interval,
 			   hdev->le_scan_window_discovery, own_addr_type,
-			   filter_policy);
+			   filter_policy, addr_resolv);
 	return 0;
 }
 
-- 
2.17.1

