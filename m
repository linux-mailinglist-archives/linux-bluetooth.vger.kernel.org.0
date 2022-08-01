Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A2B9586F5C
	for <lists+linux-bluetooth@lfdr.de>; Mon,  1 Aug 2022 19:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233396AbiHARP1 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 1 Aug 2022 13:15:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233119AbiHARPT (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 1 Aug 2022 13:15:19 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2933063FB
        for <linux-bluetooth@vger.kernel.org>; Mon,  1 Aug 2022 10:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659374118; x=1690910118;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NKttana0ttN/WBqh7pAzR4E16KnYY/p5RJdmlgJ5Aa4=;
  b=XrG8+dORUotPo/dR/QTKJFT0/MUvoAiBI1s3oMyASfdKcYQCGnJJYlmg
   R7Klyxg1cBhd5SjuA0PJY5APvGWLoEy82fSDVanamxpr6JjN8t7N/JGFF
   307k78TDqdh2ItAsmelGfrh64fbGl9sMiXlZgIdEuwqIf8sxKKri+YgYN
   eHAsmKlriAlQ75ur/arSVsd7QIrHe9hSCPcujdpEcmKLjeA61wV/Oc85a
   8lxMIWwtb4NKkct2988nZ6EMf6aRVp+cQj15+5+rCMtJYZk2LFsrox7fy
   WEqRPXK5oGIf1oPuo8+bv2k/i+rzyC0sNKVK5ED98guCygtfZr1h6ceH0
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="276104767"
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; 
   d="scan'208";a="276104767"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 10:15:16 -0700
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; 
   d="scan'208";a="847899609"
Received: from gestarne-mobl.amr.corp.intel.com (HELO bgi1-mobl2.amr.corp.intel.com) ([10.212.120.49])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 10:15:15 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     marcel@holtmann.org, luiz.dentz@gmail.com, brian.gix@intel.com
Subject: [PATCH v6 01/10] Bluetooth: Convert le_scan_disable timeout to hci_sync
Date:   Mon,  1 Aug 2022 10:14:56 -0700
Message-Id: <20220801171505.1271059-2-brian.gix@intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220801171505.1271059-1-brian.gix@intel.com>
References: <20220801171505.1271059-1-brian.gix@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The le_scan_disable timeout was being performed on the deprecated
hci_request.c mechanism.  This timeout is performed in hci_sync.c

Signed-off-by: Brian Gix <brian.gix@intel.com>
---
 net/bluetooth/hci_request.c | 98 +------------------------------------
 net/bluetooth/hci_sync.c    | 73 +++++++++++++++++++++++++++
 2 files changed, 74 insertions(+), 97 deletions(-)

diff --git a/net/bluetooth/hci_request.c b/net/bluetooth/hci_request.c
index e64d558e5d69..32fefaa0d3ca 100644
--- a/net/bluetooth/hci_request.c
+++ b/net/bluetooth/hci_request.c
@@ -269,6 +269,7 @@ void hci_req_add_ev(struct hci_request *req, u16 opcode, u32 plen,
 void hci_req_add(struct hci_request *req, u16 opcode, u32 plen,
 		 const void *param)
 {
+	bt_dev_dbg(req->hdev, "HCI_REQ-0x%4.4x", opcode);
 	hci_req_add_ev(req, opcode, plen, param, 0);
 }
 
@@ -1974,101 +1975,6 @@ int hci_abort_conn(struct hci_conn *conn, u8 reason)
 	return 0;
 }
 
-static int le_scan_disable(struct hci_request *req, unsigned long opt)
-{
-	hci_req_add_le_scan_disable(req, false);
-	return 0;
-}
-
-static int bredr_inquiry(struct hci_request *req, unsigned long opt)
-{
-	u8 length = opt;
-	const u8 giac[3] = { 0x33, 0x8b, 0x9e };
-	const u8 liac[3] = { 0x00, 0x8b, 0x9e };
-	struct hci_cp_inquiry cp;
-
-	if (test_bit(HCI_INQUIRY, &req->hdev->flags))
-		return 0;
-
-	bt_dev_dbg(req->hdev, "");
-
-	hci_dev_lock(req->hdev);
-	hci_inquiry_cache_flush(req->hdev);
-	hci_dev_unlock(req->hdev);
-
-	memset(&cp, 0, sizeof(cp));
-
-	if (req->hdev->discovery.limited)
-		memcpy(&cp.lap, liac, sizeof(cp.lap));
-	else
-		memcpy(&cp.lap, giac, sizeof(cp.lap));
-
-	cp.length = length;
-
-	hci_req_add(req, HCI_OP_INQUIRY, sizeof(cp), &cp);
-
-	return 0;
-}
-
-static void le_scan_disable_work(struct work_struct *work)
-{
-	struct hci_dev *hdev = container_of(work, struct hci_dev,
-					    le_scan_disable.work);
-	u8 status;
-
-	bt_dev_dbg(hdev, "");
-
-	if (!hci_dev_test_flag(hdev, HCI_LE_SCAN))
-		return;
-
-	cancel_delayed_work(&hdev->le_scan_restart);
-
-	hci_req_sync(hdev, le_scan_disable, 0, HCI_CMD_TIMEOUT, &status);
-	if (status) {
-		bt_dev_err(hdev, "failed to disable LE scan: status 0x%02x",
-			   status);
-		return;
-	}
-
-	hdev->discovery.scan_start = 0;
-
-	/* If we were running LE only scan, change discovery state. If
-	 * we were running both LE and BR/EDR inquiry simultaneously,
-	 * and BR/EDR inquiry is already finished, stop discovery,
-	 * otherwise BR/EDR inquiry will stop discovery when finished.
-	 * If we will resolve remote device name, do not change
-	 * discovery state.
-	 */
-
-	if (hdev->discovery.type == DISCOV_TYPE_LE)
-		goto discov_stopped;
-
-	if (hdev->discovery.type != DISCOV_TYPE_INTERLEAVED)
-		return;
-
-	if (test_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks)) {
-		if (!test_bit(HCI_INQUIRY, &hdev->flags) &&
-		    hdev->discovery.state != DISCOVERY_RESOLVING)
-			goto discov_stopped;
-
-		return;
-	}
-
-	hci_req_sync(hdev, bredr_inquiry, DISCOV_INTERLEAVED_INQUIRY_LEN,
-		     HCI_CMD_TIMEOUT, &status);
-	if (status) {
-		bt_dev_err(hdev, "inquiry failed: status 0x%02x", status);
-		goto discov_stopped;
-	}
-
-	return;
-
-discov_stopped:
-	hci_dev_lock(hdev);
-	hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
-	hci_dev_unlock(hdev);
-}
-
 static int le_scan_restart(struct hci_request *req, unsigned long opt)
 {
 	struct hci_dev *hdev = req->hdev;
@@ -2252,7 +2158,6 @@ int hci_req_configure_datapath(struct hci_dev *hdev, struct bt_codec *codec)
 
 void hci_request_setup(struct hci_dev *hdev)
 {
-	INIT_DELAYED_WORK(&hdev->le_scan_disable, le_scan_disable_work);
 	INIT_DELAYED_WORK(&hdev->le_scan_restart, le_scan_restart_work);
 	INIT_DELAYED_WORK(&hdev->adv_instance_expire, adv_timeout_expire);
 	INIT_DELAYED_WORK(&hdev->interleave_scan, interleave_scan_work);
@@ -2262,7 +2167,6 @@ void hci_request_cancel_all(struct hci_dev *hdev)
 {
 	__hci_cmd_sync_cancel(hdev, ENODEV);
 
-	cancel_delayed_work_sync(&hdev->le_scan_disable);
 	cancel_delayed_work_sync(&hdev->le_scan_restart);
 
 	if (hdev->adv_instance_timeout) {
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index 148ce629a59f..7dae2ee1bb82 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -321,6 +321,77 @@ static void hci_cmd_sync_cancel_work(struct work_struct *work)
 	wake_up_interruptible(&hdev->req_wait_q);
 }
 
+static int hci_scan_disable_sync(struct hci_dev *hdev);
+static int scan_disable_sync(struct hci_dev *hdev, void *data)
+{
+	return hci_scan_disable_sync(hdev);
+}
+
+static int hci_inquiry_sync(struct hci_dev *hdev, u8 length);
+static int interleaved_inquiry_sync(struct hci_dev *hdev, void *data)
+{
+	return hci_inquiry_sync(hdev, DISCOV_INTERLEAVED_INQUIRY_LEN);
+}
+
+static void le_scan_disable(struct work_struct *work)
+{
+	struct hci_dev *hdev = container_of(work, struct hci_dev,
+					    le_scan_disable.work);
+	int status;
+
+	bt_dev_dbg(hdev, "");
+	hci_dev_lock(hdev);
+
+	if (!hci_dev_test_flag(hdev, HCI_LE_SCAN))
+		goto _return;
+
+	cancel_delayed_work(&hdev->le_scan_restart);
+
+	status = hci_cmd_sync_queue(hdev, scan_disable_sync, NULL, NULL);
+	if (status) {
+		bt_dev_err(hdev, "failed to disable LE scan: %d", status);
+		goto _return;
+	}
+
+	hdev->discovery.scan_start = 0;
+
+	/* If we were running LE only scan, change discovery state. If
+	 * we were running both LE and BR/EDR inquiry simultaneously,
+	 * and BR/EDR inquiry is already finished, stop discovery,
+	 * otherwise BR/EDR inquiry will stop discovery when finished.
+	 * If we will resolve remote device name, do not change
+	 * discovery state.
+	 */
+
+	if (hdev->discovery.type == DISCOV_TYPE_LE)
+		goto discov_stopped;
+
+	if (hdev->discovery.type != DISCOV_TYPE_INTERLEAVED)
+		goto _return;
+
+	if (test_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks)) {
+		if (!test_bit(HCI_INQUIRY, &hdev->flags) &&
+		    hdev->discovery.state != DISCOVERY_RESOLVING)
+			goto discov_stopped;
+
+		goto _return;
+	}
+
+	status = hci_cmd_sync_queue(hdev, interleaved_inquiry_sync, NULL, NULL);
+	if (status) {
+		bt_dev_err(hdev, "inquiry failed: status %d", status);
+		goto discov_stopped;
+	}
+
+	goto _return;
+
+discov_stopped:
+	hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
+
+_return:
+	hci_dev_unlock(hdev);
+}
+
 void hci_cmd_sync_init(struct hci_dev *hdev)
 {
 	INIT_WORK(&hdev->cmd_sync_work, hci_cmd_sync_work);
@@ -328,6 +399,7 @@ void hci_cmd_sync_init(struct hci_dev *hdev)
 	mutex_init(&hdev->cmd_sync_work_lock);
 
 	INIT_WORK(&hdev->cmd_sync_cancel_work, hci_cmd_sync_cancel_work);
+	INIT_DELAYED_WORK(&hdev->le_scan_disable, le_scan_disable);
 }
 
 void hci_cmd_sync_clear(struct hci_dev *hdev)
@@ -4415,6 +4487,7 @@ int hci_dev_close_sync(struct hci_dev *hdev)
 
 	cancel_delayed_work(&hdev->power_off);
 	cancel_delayed_work(&hdev->ncmd_timer);
+	cancel_delayed_work(&hdev->le_scan_disable);
 
 	hci_request_cancel_all(hdev);
 
-- 
2.37.1

