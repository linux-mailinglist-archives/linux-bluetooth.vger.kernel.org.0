Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 320BA2AD37E
	for <lists+linux-bluetooth@lfdr.de>; Tue, 10 Nov 2020 11:19:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727651AbgKJKSq (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 10 Nov 2020 05:18:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbgKJKSn (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 10 Nov 2020 05:18:43 -0500
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3985FC0613D3
        for <linux-bluetooth@vger.kernel.org>; Tue, 10 Nov 2020 02:18:41 -0800 (PST)
Received: by mail-qk1-x749.google.com with SMTP id t64so8307961qkd.5
        for <linux-bluetooth@vger.kernel.org>; Tue, 10 Nov 2020 02:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=0MzzK5QGXbJzu974MwyqHzvYNMML0VPnlzv3We3j1VE=;
        b=gMaOh1pCOTzr+9g5eOr5OLO7aIpnxmMEyu3xmSxpxYPSdkGfgrkLxaZfzzshis4tdX
         hF+ClxyT0zL5M4649mabcs6d+dOwQJ4lwD2tuREi7yktBY1sLwtLgifpRjmyrBCUJ8HR
         mYO56Y4kXjMHIJrPu8vqB475TN6fdBlZRR9MvQt3FD2XfaNtej2+ChG22UAGAGlWhuOA
         3rKl7Y2t7miOL6cmGeZDpKrV2sEkpue5R/Y61pnJ+hCkLxCI2JqUF0qF0r7Gs8RptUST
         k/cOZPONiaztuMQ26u4LnlUT3V9OXo+sFMATZsJagcxkK3vicgjQVuV8pcakCq42XMbw
         HrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=0MzzK5QGXbJzu974MwyqHzvYNMML0VPnlzv3We3j1VE=;
        b=bFz1ZGc9Lb6RUAwmZIh4L8+Ai66b2J2J3qlxXZFbLBv2Kd/YzqBztknD5cKDAw7CoU
         xedJeD27aBtW6w9w1CWqbBO61Zivsgv/+Vz6iUxb9MlY4Ac9QpBbQkdn2rbvFfWXqEx8
         jI6GKm20CUUzjCcIFNGVfRqZy2fkLNjgRxmmsHA6n5HIH4su0rJ2Zarw29dKBjsJq9Fz
         78AzPn9VpxWTa1WW2Fg5RrKGE9GWB6yEeonRKVUU7Ga+m7YUdt3RwICN2Gs1bOizDKLu
         qhjbKTSBrKU+AJ6g4LPjidbanDscQ4lc+8X/07Wpxm3Dd8Jqf6UAeuTjjxvY2rn23U9C
         KoNw==
X-Gm-Message-State: AOAM532F53mXhJcDdfTW+dccRTnmZQGZgR/ya1Pw/oFvHXsdGPWMHYdt
        tO4qlxP5QgYik0avzapn9Ar8+tFmFRRtbGdLOL14ez1Lx1n0LVVr/EiHbR43K7MW4Vk8FlBzvWD
        h1+FHgePOVaP8pWvOLuqx2JdgsK9QUazb3aIbm3FmoBvm1YCR3BInsQDZUkqwyGbwos29WY4VJv
        PFNDsq1e9D0po=
X-Google-Smtp-Source: ABdhPJzem2k7PaSNYuBdVSkzysL4CxVpGuP/F0vc0CafxCaop/UtB27+JVNCZgYt4+knJCNXqmRuGv8SwDSptkbvww==
Sender: "howardchung via sendgmr" 
        <howardchung@howardchung-p920.tpe.corp.google.com>
X-Received: from howardchung-p920.tpe.corp.google.com ([2401:fa00:1:10:f693:9fff:fef4:4e45])
 (user=howardchung job=sendgmr) by 2002:a0c:ffd1:: with SMTP id
 h17mr1569954qvv.20.1605003520117; Tue, 10 Nov 2020 02:18:40 -0800 (PST)
Date:   Tue, 10 Nov 2020 18:17:50 +0800
Message-Id: <20201110181740.v8.1.I55fa38874edc240d726c1de6e82b2ce57b64f5eb@changeid>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.222.g5d2a92d10f8-goog
Subject: [PATCH v8 1/6] Bluetooth: Replace BT_DBG with bt_dev_dbg in HCI request
From:   Howard Chung <howardchung@google.com>
To:     linux-bluetooth@vger.kernel.org, marcel@holtmann.org,
        luiz.dentz@gmail.com
Cc:     mmandlik@chromium.org, mcchou@chromium.org, alainm@chromium.org,
        Howard Chung <howardchung@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This replaces the BT_DBG function to bt_dev_dbg as it is cleaner to show
the controller index in the debug message.

Signed-off-by: Howard Chung <howardchung@google.com>
---

Changes in v8:
- Simplified logic in __hci_update_interleaved_scan
- Remove hdev->name when calling bt_dev_dbg
- Remove 'default' in hci_req_add_le_interleaved_scan switch block
- Remove {} around :1915
- Update commit message and title in v7 4/5
- Add a cleanup patch for replacing BT_DBG with bt_dev_dbg

Changes in v7:
- Fix bt_dev_warn argument type warning

Changes in v6:
- Set parameter EnableAdvMonInterleaveScan to 1 byte long

Changes in v5:
- Rename 'adv_monitor' from many functions/variables
- Move __hci_update_interleaved_scan into hci_req_add_le_passive_scan
- Update the logic of update_adv_monitor_scan_state

Changes in v4:
- Rebase to bluetooth-next/master (previous 2 patches are applied)
- Fix over 80 chars limit in mgmt_config.c
- Set EnableAdvMonInterleaveScan default to Disable

Changes in v3:
- Remove 'Bluez' prefix

Changes in v2:
- remove 'case 0x001c' in mgmt_config.c

 net/bluetooth/hci_request.c | 52 ++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/net/bluetooth/hci_request.c b/net/bluetooth/hci_request.c
index 6a74097c50d34..048d4db9d4ea5 100644
--- a/net/bluetooth/hci_request.c
+++ b/net/bluetooth/hci_request.c
@@ -58,7 +58,7 @@ static int req_run(struct hci_request *req, hci_req_complete_t complete,
 	struct sk_buff *skb;
 	unsigned long flags;
 
-	BT_DBG("length %u", skb_queue_len(&req->cmd_q));
+	bt_dev_dbg(hdev, "length %u", skb_queue_len(&req->cmd_q));
 
 	/* If an error occurred during request building, remove all HCI
 	 * commands queued on the HCI request queue.
@@ -102,7 +102,7 @@ int hci_req_run_skb(struct hci_request *req, hci_req_complete_skb_t complete)
 static void hci_req_sync_complete(struct hci_dev *hdev, u8 result, u16 opcode,
 				  struct sk_buff *skb)
 {
-	BT_DBG("%s result 0x%2.2x", hdev->name, result);
+	bt_dev_dbg(hdev, "result 0x%2.2x", result);
 
 	if (hdev->req_status == HCI_REQ_PEND) {
 		hdev->req_result = result;
@@ -115,7 +115,7 @@ static void hci_req_sync_complete(struct hci_dev *hdev, u8 result, u16 opcode,
 
 void hci_req_sync_cancel(struct hci_dev *hdev, int err)
 {
-	BT_DBG("%s err 0x%2.2x", hdev->name, err);
+	bt_dev_dbg(hdev, "err 0x%2.2x", err);
 
 	if (hdev->req_status == HCI_REQ_PEND) {
 		hdev->req_result = err;
@@ -131,7 +131,7 @@ struct sk_buff *__hci_cmd_sync_ev(struct hci_dev *hdev, u16 opcode, u32 plen,
 	struct sk_buff *skb;
 	int err = 0;
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "");
 
 	hci_req_init(&req, hdev);
 
@@ -167,7 +167,7 @@ struct sk_buff *__hci_cmd_sync_ev(struct hci_dev *hdev, u16 opcode, u32 plen,
 	skb = hdev->req_skb;
 	hdev->req_skb = NULL;
 
-	BT_DBG("%s end: err %d", hdev->name, err);
+	bt_dev_dbg(hdev, "end: err %d", err);
 
 	if (err < 0) {
 		kfree_skb(skb);
@@ -196,7 +196,7 @@ int __hci_req_sync(struct hci_dev *hdev, int (*func)(struct hci_request *req,
 	struct hci_request req;
 	int err = 0;
 
-	BT_DBG("%s start", hdev->name);
+	bt_dev_dbg(hdev, "start");
 
 	hci_req_init(&req, hdev);
 
@@ -260,7 +260,7 @@ int __hci_req_sync(struct hci_dev *hdev, int (*func)(struct hci_request *req,
 	hdev->req_skb = NULL;
 	hdev->req_status = hdev->req_result = 0;
 
-	BT_DBG("%s end: err %d", hdev->name, err);
+	bt_dev_dbg(hdev, "end: err %d", err);
 
 	return err;
 }
@@ -300,7 +300,7 @@ struct sk_buff *hci_prepare_cmd(struct hci_dev *hdev, u16 opcode, u32 plen,
 	if (plen)
 		skb_put_data(skb, param, plen);
 
-	BT_DBG("skb len %d", skb->len);
+	bt_dev_dbg(hdev, "skb len %d", skb->len);
 
 	hci_skb_pkt_type(skb) = HCI_COMMAND_PKT;
 	hci_skb_opcode(skb) = opcode;
@@ -315,7 +315,7 @@ void hci_req_add_ev(struct hci_request *req, u16 opcode, u32 plen,
 	struct hci_dev *hdev = req->hdev;
 	struct sk_buff *skb;
 
-	BT_DBG("%s opcode 0x%4.4x plen %d", hdev->name, opcode, plen);
+	bt_dev_dbg(hdev, "opcode 0x%4.4x plen %d", opcode, plen);
 
 	/* If an error occurred during request building, there is no point in
 	 * queueing the HCI command. We can simply return.
@@ -413,8 +413,8 @@ static void __hci_update_background_scan(struct hci_request *req)
 	 */
 	hci_discovery_filter_clear(hdev);
 
-	BT_DBG("%s ADV monitoring is %s", hdev->name,
-	       hci_is_adv_monitoring(hdev) ? "on" : "off");
+	bt_dev_dbg(hdev, "ADV monitoring is %s",
+		   hci_is_adv_monitoring(hdev) ? "on" : "off");
 
 	if (list_empty(&hdev->pend_le_conns) &&
 	    list_empty(&hdev->pend_le_reports) &&
@@ -430,7 +430,7 @@ static void __hci_update_background_scan(struct hci_request *req)
 
 		hci_req_add_le_scan_disable(req, false);
 
-		BT_DBG("%s stopping background scanning", hdev->name);
+		bt_dev_dbg(hdev, "stopping background scanning");
 	} else {
 		/* If there is at least one pending LE connection, we should
 		 * keep the background scan running.
@@ -1826,7 +1826,7 @@ void hci_req_disable_address_resolution(struct hci_dev *hdev)
 
 static void adv_enable_complete(struct hci_dev *hdev, u8 status, u16 opcode)
 {
-	BT_DBG("%s status %u", hdev->name, status);
+	bt_dev_dbg(hdev, "status %u", status);
 }
 
 void hci_req_reenable_advertising(struct hci_dev *hdev)
@@ -1863,7 +1863,7 @@ static void adv_timeout_expire(struct work_struct *work)
 	struct hci_request req;
 	u8 instance;
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "");
 
 	hci_dev_lock(hdev);
 
@@ -2347,7 +2347,7 @@ static void set_random_addr(struct hci_request *req, bdaddr_t *rpa)
 	 */
 	if (hci_dev_test_flag(hdev, HCI_LE_ADV) ||
 	    hci_lookup_le_connect(hdev)) {
-		BT_DBG("Deferring random address update");
+		bt_dev_dbg(hdev, "Deferring random address update");
 		hci_dev_set_flag(hdev, HCI_RPA_EXPIRED);
 		return;
 	}
@@ -2572,7 +2572,7 @@ void __hci_req_update_class(struct hci_request *req)
 	struct hci_dev *hdev = req->hdev;
 	u8 cod[3];
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "");
 
 	if (!hdev_is_powered(hdev))
 		return;
@@ -2741,7 +2741,7 @@ void __hci_abort_conn(struct hci_request *req, struct hci_conn *conn,
 static void abort_conn_complete(struct hci_dev *hdev, u8 status, u16 opcode)
 {
 	if (status)
-		BT_DBG("Failed to abort connection: status 0x%2.2x", status);
+		bt_dev_dbg(hdev, "Failed to abort connection: status 0x%2.2x", status);
 }
 
 int hci_abort_conn(struct hci_conn *conn, u8 reason)
@@ -2804,7 +2804,7 @@ static int bredr_inquiry(struct hci_request *req, unsigned long opt)
 	const u8 liac[3] = { 0x00, 0x8b, 0x9e };
 	struct hci_cp_inquiry cp;
 
-	BT_DBG("%s", req->hdev->name);
+	bt_dev_dbg(req->hdev, "");
 
 	hci_dev_lock(req->hdev);
 	hci_inquiry_cache_flush(req->hdev);
@@ -2830,7 +2830,7 @@ static void le_scan_disable_work(struct work_struct *work)
 					    le_scan_disable.work);
 	u8 status;
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "");
 
 	if (!hci_dev_test_flag(hdev, HCI_LE_SCAN))
 		return;
@@ -2926,7 +2926,7 @@ static void le_scan_restart_work(struct work_struct *work)
 	unsigned long timeout, duration, scan_start, now;
 	u8 status;
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "");
 
 	hci_req_sync(hdev, le_scan_restart, 0, HCI_CMD_TIMEOUT, &status);
 	if (status) {
@@ -2980,7 +2980,7 @@ static int active_scan(struct hci_request *req, unsigned long opt)
 	bool addr_resolv = false;
 	int err;
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "");
 
 	/* If controller is scanning, it means the background scanning is
 	 * running. Thus, we should temporarily stop it in order to set the
@@ -3008,7 +3008,7 @@ static int interleaved_discov(struct hci_request *req, unsigned long opt)
 {
 	int err;
 
-	BT_DBG("%s", req->hdev->name);
+	bt_dev_dbg(req->hdev, "");
 
 	err = active_scan(req, opt);
 	if (err)
@@ -3021,7 +3021,7 @@ static void start_discovery(struct hci_dev *hdev, u8 *status)
 {
 	unsigned long timeout;
 
-	BT_DBG("%s type %u", hdev->name, hdev->discovery.type);
+	bt_dev_dbg(hdev, "type %u", hdev->discovery.type);
 
 	switch (hdev->discovery.type) {
 	case DISCOV_TYPE_BREDR:
@@ -3069,7 +3069,7 @@ static void start_discovery(struct hci_dev *hdev, u8 *status)
 	if (*status)
 		return;
 
-	BT_DBG("%s timeout %u ms", hdev->name, jiffies_to_msecs(timeout));
+	bt_dev_dbg(hdev, "timeout %u ms", jiffies_to_msecs(timeout));
 
 	/* When service discovery is used and the controller has a
 	 * strict duplicate filter, it is important to remember the
@@ -3094,7 +3094,7 @@ bool hci_req_stop_discovery(struct hci_request *req)
 	struct inquiry_entry *e;
 	bool ret = false;
 
-	BT_DBG("%s state %u", hdev->name, hdev->discovery.state);
+	bt_dev_dbg(hdev, "state %u", hdev->discovery.state);
 
 	if (d->state == DISCOVERY_FINDING || d->state == DISCOVERY_STOPPING) {
 		if (test_bit(HCI_INQUIRY, &hdev->flags))
@@ -3174,7 +3174,7 @@ static void discov_off(struct work_struct *work)
 	struct hci_dev *hdev = container_of(work, struct hci_dev,
 					    discov_off.work);
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "");
 
 	hci_dev_lock(hdev);
 
-- 
2.29.2.222.g5d2a92d10f8-goog

