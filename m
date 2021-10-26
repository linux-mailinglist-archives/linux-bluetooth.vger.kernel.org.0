Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7133A43BD9A
	for <lists+linux-bluetooth@lfdr.de>; Wed, 27 Oct 2021 01:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240190AbhJZXGM (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 26 Oct 2021 19:06:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240181AbhJZXGK (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 26 Oct 2021 19:06:10 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E8EDC061570
        for <linux-bluetooth@vger.kernel.org>; Tue, 26 Oct 2021 16:03:45 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id w16so645154plg.3
        for <linux-bluetooth@vger.kernel.org>; Tue, 26 Oct 2021 16:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9PhQdqugswnS9QSDhdazoy7tBVgFlC6vizikyUvlKB4=;
        b=JlPndpQDylCJYbDnoJAhDkJmIABx+oJRHHPt4+yDQ/rWI3LfG9FJLvezoQJmCtXZFN
         mVI4nKOOaeFFPnzEI6APTftCabDpgCuwsclq/QgIhahIuV9DcRXMxlnkmcK7+E40dOrs
         07duMs14MrdjOHa3d64RyeAoXsDbdCmJUSRyKbEd/Y2weGhStBBx/2C8k3PLgJ4ZrNFJ
         17FyCIj9bSLiPEbrVtBwCNgLKOJdZLNZFNul2q2i4KQG1uyCA+10jxnZK869qtTLioj9
         pgtbNiX6uUWYwNYsH20ST9WteKuDD0LpO8U/6g84zvuyHeDSLI0kpivzJAfLjOnYqEt3
         ckdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9PhQdqugswnS9QSDhdazoy7tBVgFlC6vizikyUvlKB4=;
        b=BV0F8PTGPqfim4bdtQf9pi2lhjn/5IdEPk/JwfhzIu/gMgnWTQTBIc+V1aLQN/qXZo
         sVl/TOcTBvGIWN+PVEgOpGslurxpp4HsHj7fcDmRvI00PYMq4I+oMpcyXWLW0uZh3DaZ
         DbmWkW5V+erBhG7kXSN2HcFzEOBB+ymcFrr5MCsg0mELH435lORqeoDOGm51Y9glF9Ee
         tQpBkF8Dy33i/MnyR0GjApW6DfdDj10TocFqHDeMQ577Y4NTXI7Or1oVtGZIug08HdkC
         TyWJQAChfH4TaqbDJ3fFXiTK7uojC11z6HrToArR4k0B4nYRxoCEIajq0ej8C5FgauWA
         h0Ig==
X-Gm-Message-State: AOAM532O/fw1POdqSP+qTdT1MDi+pbkMOtDQ6t0hetaH+SJLArBYebCd
        n5PwBDIAF9AzESJUKLt8fObnhz7ntAQ=
X-Google-Smtp-Source: ABdhPJySE6J9HFNWp9wI6gRw/5AEVUHbPEx39e3m1MX1448AQP82GAEaqgpMUzkDorMgVxdY34knBQ==
X-Received: by 2002:a17:902:e543:b0:13f:dffb:8e6 with SMTP id n3-20020a170902e54300b0013fdffb08e6mr24576568plf.27.1635289423963;
        Tue, 26 Oct 2021 16:03:43 -0700 (PDT)
Received: from lvondent-mobl4.intel.com (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id a2sm20697558pgn.20.2021.10.26.16.03.43
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 16:03:43 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v6 23/23] Bluetooth: hci_sync: Rework hci_suspend_notifier
Date:   Tue, 26 Oct 2021 16:03:24 -0700
Message-Id: <20211026230324.1533907-24-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211026230324.1533907-1-luiz.dentz@gmail.com>
References: <20211026230324.1533907-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This makes hci_suspend_notifier use the hci_*_sync which can be
executed synchronously which is allowed in the suspend_notifier and
simplifies a lot of the handling since the status of each command can
be checked inline so no other work need to be scheduled thus can be
performed without using of a state machine.

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 include/net/bluetooth/hci_core.h |   4 -
 include/net/bluetooth/hci_sync.h |   3 +
 net/bluetooth/hci_conn.c         |  10 -
 net/bluetooth/hci_core.c         | 106 +------
 net/bluetooth/hci_event.c        |  71 +++--
 net/bluetooth/hci_request.c      | 237 --------------
 net/bluetooth/hci_sync.c         | 294 +++++++++++++++++-
 net/bluetooth/mgmt.c             |  37 ---
 net/bluetooth/msft.c             | 509 ++++++++++++++++++-------------
 net/bluetooth/msft.h             |  15 +-
 10 files changed, 649 insertions(+), 637 deletions(-)

diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index 3e53c845ab0e..53a8c7d3a4bf 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -523,7 +523,6 @@ struct hci_dev {
 	bool			advertising_paused;
 
 	struct notifier_block	suspend_notifier;
-	struct work_struct	suspend_prepare;
 	enum suspended_state	suspend_state_next;
 	enum suspended_state	suspend_state;
 	bool			scanning_paused;
@@ -532,9 +531,6 @@ struct hci_dev {
 	bdaddr_t		wake_addr;
 	u8			wake_addr_type;
 
-	wait_queue_head_t	suspend_wait_q;
-	DECLARE_BITMAP(suspend_tasks, __SUSPEND_NUM_TASKS);
-
 	struct hci_conn_hash	conn_hash;
 
 	struct list_head	mgmt_pending;
diff --git a/include/net/bluetooth/hci_sync.h b/include/net/bluetooth/hci_sync.h
index 487e4981cce1..00b13e8ca800 100644
--- a/include/net/bluetooth/hci_sync.h
+++ b/include/net/bluetooth/hci_sync.h
@@ -92,3 +92,6 @@ int hci_set_powered_sync(struct hci_dev *hdev, u8 val);
 
 int hci_start_discovery_sync(struct hci_dev *hdev);
 int hci_stop_discovery_sync(struct hci_dev *hdev);
+
+int hci_suspend_sync(struct hci_dev *hdev);
+int hci_resume_sync(struct hci_dev *hdev);
diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
index dbd737b62f98..cd6e1cf7e396 100644
--- a/net/bluetooth/hci_conn.c
+++ b/net/bluetooth/hci_conn.c
@@ -900,16 +900,6 @@ void hci_le_conn_failed(struct hci_conn *conn, u8 status)
 
 	hci_conn_del(conn);
 
-	/* The suspend notifier is waiting for all devices to disconnect and an
-	 * LE connect cancel will result in an hci_le_conn_failed. Once the last
-	 * connection is deleted, we should also wake the suspend queue to
-	 * complete suspend operations.
-	 */
-	if (list_empty(&hdev->conn_hash.list) &&
-	    test_and_clear_bit(SUSPEND_DISCONNECTING, hdev->suspend_tasks)) {
-		wake_up(&hdev->suspend_wait_q);
-	}
-
 	/* Since we may have temporarily stopped the background scanning in
 	 * favor of connection establishment, we should restart it.
 	 */
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index e0c0aa779dbc..fdc0dcf8ee36 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -2374,61 +2374,6 @@ void hci_copy_identity_address(struct hci_dev *hdev, bdaddr_t *bdaddr,
 	}
 }
 
-static void hci_suspend_clear_tasks(struct hci_dev *hdev)
-{
-	int i;
-
-	for (i = 0; i < __SUSPEND_NUM_TASKS; i++)
-		clear_bit(i, hdev->suspend_tasks);
-
-	wake_up(&hdev->suspend_wait_q);
-}
-
-static int hci_suspend_wait_event(struct hci_dev *hdev)
-{
-#define WAKE_COND                                                              \
-	(find_first_bit(hdev->suspend_tasks, __SUSPEND_NUM_TASKS) ==           \
-	 __SUSPEND_NUM_TASKS)
-
-	int i;
-	int ret = wait_event_timeout(hdev->suspend_wait_q,
-				     WAKE_COND, SUSPEND_NOTIFIER_TIMEOUT);
-
-	if (ret == 0) {
-		bt_dev_err(hdev, "Timed out waiting for suspend events");
-		for (i = 0; i < __SUSPEND_NUM_TASKS; ++i) {
-			if (test_bit(i, hdev->suspend_tasks))
-				bt_dev_err(hdev, "Suspend timeout bit: %d", i);
-			clear_bit(i, hdev->suspend_tasks);
-		}
-
-		ret = -ETIMEDOUT;
-	} else {
-		ret = 0;
-	}
-
-	return ret;
-}
-
-static void hci_prepare_suspend(struct work_struct *work)
-{
-	struct hci_dev *hdev =
-		container_of(work, struct hci_dev, suspend_prepare);
-
-	hci_dev_lock(hdev);
-	hci_req_prepare_suspend(hdev, hdev->suspend_state_next);
-	hci_dev_unlock(hdev);
-}
-
-static int hci_change_suspend_state(struct hci_dev *hdev,
-				    enum suspended_state next)
-{
-	hdev->suspend_state_next = next;
-	set_bit(SUSPEND_PREPARE_NOTIFIER, hdev->suspend_tasks);
-	queue_work(hdev->req_workqueue, &hdev->suspend_prepare);
-	return hci_suspend_wait_event(hdev);
-}
-
 static void hci_clear_wake_reason(struct hci_dev *hdev)
 {
 	hci_dev_lock(hdev);
@@ -2565,7 +2510,6 @@ struct hci_dev *hci_alloc_dev_priv(int sizeof_priv)
 	INIT_WORK(&hdev->tx_work, hci_tx_work);
 	INIT_WORK(&hdev->power_on, hci_power_on);
 	INIT_WORK(&hdev->error_reset, hci_error_reset);
-	INIT_WORK(&hdev->suspend_prepare, hci_prepare_suspend);
 
 	hci_cmd_sync_init(hdev);
 
@@ -2576,7 +2520,6 @@ struct hci_dev *hci_alloc_dev_priv(int sizeof_priv)
 	skb_queue_head_init(&hdev->raw_q);
 
 	init_waitqueue_head(&hdev->req_wait_q);
-	init_waitqueue_head(&hdev->suspend_wait_q);
 
 	INIT_DELAYED_WORK(&hdev->cmd_timer, hci_cmd_timeout);
 	INIT_DELAYED_WORK(&hdev->ncmd_timer, hci_ncmd_timeout);
@@ -2729,11 +2672,8 @@ void hci_unregister_dev(struct hci_dev *hdev)
 
 	hci_cmd_sync_clear(hdev);
 
-	if (!test_bit(HCI_QUIRK_NO_SUSPEND_NOTIFIER, &hdev->quirks)) {
-		hci_suspend_clear_tasks(hdev);
+	if (!test_bit(HCI_QUIRK_NO_SUSPEND_NOTIFIER, &hdev->quirks))
 		unregister_pm_notifier(&hdev->suspend_notifier);
-		cancel_work_sync(&hdev->suspend_prepare);
-	}
 
 	msft_unregister(hdev);
 
@@ -2800,7 +2740,6 @@ EXPORT_SYMBOL(hci_release_dev);
 int hci_suspend_dev(struct hci_dev *hdev)
 {
 	int ret;
-	u8 state = BT_RUNNING;
 
 	bt_dev_dbg(hdev, "");
 
@@ -2809,40 +2748,17 @@ int hci_suspend_dev(struct hci_dev *hdev)
 	    hci_dev_test_flag(hdev, HCI_UNREGISTER))
 		return 0;
 
-	/* If powering down, wait for completion. */
-	if (mgmt_powering_down(hdev)) {
-		set_bit(SUSPEND_POWERING_DOWN, hdev->suspend_tasks);
-		ret = hci_suspend_wait_event(hdev);
-		if (ret)
-			goto done;
-	}
-
-	/* Suspend consists of two actions:
-	 *  - First, disconnect everything and make the controller not
-	 *    connectable (disabling scanning)
-	 *  - Second, program event filter/accept list and enable scan
-	 */
-	ret = hci_change_suspend_state(hdev, BT_SUSPEND_DISCONNECT);
-	if (ret)
-		goto clear;
-
-	state = BT_SUSPEND_DISCONNECT;
+	/* If powering down don't attempt to suspend */
+	if (mgmt_powering_down(hdev))
+		return 0;
 
-	/* Only configure accept list if device may wakeup. */
-	if (hdev->wakeup && hdev->wakeup(hdev)) {
-		ret = hci_change_suspend_state(hdev, BT_SUSPEND_CONFIGURE_WAKE);
-		if (!ret)
-			state = BT_SUSPEND_CONFIGURE_WAKE;
-	}
+	hci_req_sync_lock(hdev);
+	ret = hci_suspend_sync(hdev);
+	hci_req_sync_unlock(hdev);
 
-clear:
 	hci_clear_wake_reason(hdev);
-	mgmt_suspending(hdev, state);
+	mgmt_suspending(hdev, hdev->suspend_state);
 
-done:
-	/* We always allow suspend even if suspend preparation failed and
-	 * attempt to recover in resume.
-	 */
 	hci_sock_dev_event(hdev, HCI_DEV_SUSPEND);
 	return ret;
 }
@@ -2864,10 +2780,12 @@ int hci_resume_dev(struct hci_dev *hdev)
 	if (mgmt_powering_down(hdev))
 		return 0;
 
-	ret = hci_change_suspend_state(hdev, BT_RUNNING);
+	hci_req_sync_lock(hdev);
+	ret = hci_resume_sync(hdev);
+	hci_req_sync_unlock(hdev);
 
 	mgmt_resuming(hdev, hdev->wake_reason, &hdev->wake_addr,
-			      hdev->wake_addr_type);
+		      hdev->wake_addr_type);
 
 	hci_sock_dev_event(hdev, HCI_DEV_RESUME);
 	return ret;
diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 4c51f6af61be..bec81d862f65 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -2412,9 +2412,14 @@ static void hci_cs_exit_sniff_mode(struct hci_dev *hdev, __u8 status)
 static void hci_cs_disconnect(struct hci_dev *hdev, u8 status)
 {
 	struct hci_cp_disconnect *cp;
+	struct hci_conn_params *params;
 	struct hci_conn *conn;
+	bool mgmt_conn;
 
-	if (!status)
+	/* Wait for HCI_EV_DISCONN_COMPLETE if status 0x00 and not suspended
+	 * otherwise cleanup the connection immediately.
+	 */
+	if (!status && !hdev->suspended)
 		return;
 
 	cp = hci_sent_cmd_data(hdev, HCI_OP_DISCONNECT);
@@ -2424,7 +2429,10 @@ static void hci_cs_disconnect(struct hci_dev *hdev, u8 status)
 	hci_dev_lock(hdev);
 
 	conn = hci_conn_hash_lookup_handle(hdev, __le16_to_cpu(cp->handle));
-	if (conn) {
+	if (!conn)
+		goto unlock;
+
+	if (status) {
 		mgmt_disconnect_failed(hdev, &conn->dst, conn->type,
 				       conn->dst_type, status);
 
@@ -2433,14 +2441,48 @@ static void hci_cs_disconnect(struct hci_dev *hdev, u8 status)
 			hci_enable_advertising(hdev);
 		}
 
-		/* If the disconnection failed for any reason, the upper layer
-		 * does not retry to disconnect in current implementation.
-		 * Hence, we need to do some basic cleanup here and re-enable
-		 * advertising if necessary.
-		 */
-		hci_conn_del(conn);
+		goto done;
 	}
 
+	mgmt_conn = test_and_clear_bit(HCI_CONN_MGMT_CONNECTED, &conn->flags);
+
+	if (conn->type == ACL_LINK) {
+		if (test_bit(HCI_CONN_FLUSH_KEY, &conn->flags))
+			hci_remove_link_key(hdev, &conn->dst);
+	}
+
+	params = hci_conn_params_lookup(hdev, &conn->dst, conn->dst_type);
+	if (params) {
+		switch (params->auto_connect) {
+		case HCI_AUTO_CONN_LINK_LOSS:
+			if (cp->reason != HCI_ERROR_CONNECTION_TIMEOUT)
+				break;
+			fallthrough;
+
+		case HCI_AUTO_CONN_DIRECT:
+		case HCI_AUTO_CONN_ALWAYS:
+			list_del_init(&params->action);
+			list_add(&params->action, &hdev->pend_le_conns);
+			break;
+
+		default:
+			break;
+		}
+	}
+
+	mgmt_device_disconnected(hdev, &conn->dst, conn->type, conn->dst_type,
+				 cp->reason, mgmt_conn);
+
+	hci_disconn_cfm(conn, cp->reason);
+
+done:
+	/* If the disconnection failed for any reason, the upper layer
+	 * does not retry to disconnect in current implementation.
+	 * Hence, we need to do some basic cleanup here and re-enable
+	 * advertising if necessary.
+	 */
+	hci_conn_del(conn);
+unlock:
 	hci_dev_unlock(hdev);
 }
 
@@ -3045,14 +3087,6 @@ static void hci_disconn_complete_evt(struct hci_dev *hdev, struct sk_buff *skb)
 
 	hci_conn_del(conn);
 
-	/* The suspend notifier is waiting for all devices to disconnect so
-	 * clear the bit from pending tasks and inform the wait queue.
-	 */
-	if (list_empty(&hdev->conn_hash.list) &&
-	    test_and_clear_bit(SUSPEND_DISCONNECTING, hdev->suspend_tasks)) {
-		wake_up(&hdev->suspend_wait_q);
-	}
-
 unlock:
 	hci_dev_unlock(hdev);
 }
@@ -5573,8 +5607,9 @@ static struct hci_conn *check_pending_le_conn(struct hci_dev *hdev,
 	if (adv_type != LE_ADV_IND && adv_type != LE_ADV_DIRECT_IND)
 		return NULL;
 
-	/* Ignore if the device is blocked */
-	if (hci_bdaddr_list_lookup(&hdev->reject_list, addr, addr_type))
+	/* Ignore if the device is blocked or hdev is suspended */
+	if (hci_bdaddr_list_lookup(&hdev->reject_list, addr, addr_type) ||
+	    hdev->suspended)
 		return NULL;
 
 	/* Most controller will fail if we try to create new connections
diff --git a/net/bluetooth/hci_request.c b/net/bluetooth/hci_request.c
index 46fa9c3bdb3e..8aa6e1840c9a 100644
--- a/net/bluetooth/hci_request.c
+++ b/net/bluetooth/hci_request.c
@@ -492,9 +492,6 @@ void hci_req_add_le_scan_disable(struct hci_request *req, bool rpa_le_conn)
 		return;
 	}
 
-	if (hdev->suspended)
-		set_bit(SUSPEND_SCAN_DISABLE, hdev->suspend_tasks);
-
 	if (use_ext_scan(hdev)) {
 		struct hci_cp_le_set_ext_scan_enable cp;
 
@@ -868,8 +865,6 @@ void hci_req_add_le_passive_scan(struct hci_request *req)
 	if (hdev->suspended) {
 		window = hdev->le_scan_window_suspend;
 		interval = hdev->le_scan_int_suspend;
-
-		set_bit(SUSPEND_SCAN_ENABLE, hdev->suspend_tasks);
 	} else if (hci_is_le_conn_scanning(hdev)) {
 		window = hdev->le_scan_window_connect;
 		interval = hdev->le_scan_int_connect;
@@ -902,59 +897,6 @@ void hci_req_add_le_passive_scan(struct hci_request *req)
 			   addr_resolv);
 }
 
-static void hci_req_clear_event_filter(struct hci_request *req)
-{
-	struct hci_cp_set_event_filter f;
-
-	if (!hci_dev_test_flag(req->hdev, HCI_BREDR_ENABLED))
-		return;
-
-	if (hci_dev_test_flag(req->hdev, HCI_EVENT_FILTER_CONFIGURED)) {
-		memset(&f, 0, sizeof(f));
-		f.flt_type = HCI_FLT_CLEAR_ALL;
-		hci_req_add(req, HCI_OP_SET_EVENT_FLT, 1, &f);
-	}
-}
-
-static void hci_req_set_event_filter(struct hci_request *req)
-{
-	struct bdaddr_list_with_flags *b;
-	struct hci_cp_set_event_filter f;
-	struct hci_dev *hdev = req->hdev;
-	u8 scan = SCAN_DISABLED;
-	bool scanning = test_bit(HCI_PSCAN, &hdev->flags);
-
-	if (!hci_dev_test_flag(hdev, HCI_BREDR_ENABLED))
-		return;
-
-	/* Always clear event filter when starting */
-	hci_req_clear_event_filter(req);
-
-	list_for_each_entry(b, &hdev->accept_list, list) {
-		if (!hci_conn_test_flag(HCI_CONN_FLAG_REMOTE_WAKEUP,
-					b->current_flags))
-			continue;
-
-		memset(&f, 0, sizeof(f));
-		bacpy(&f.addr_conn_flt.bdaddr, &b->bdaddr);
-		f.flt_type = HCI_FLT_CONN_SETUP;
-		f.cond_type = HCI_CONN_SETUP_ALLOW_BDADDR;
-		f.addr_conn_flt.auto_accept = HCI_CONN_SETUP_AUTO_ON;
-
-		bt_dev_dbg(hdev, "Adding event filters for %pMR", &b->bdaddr);
-		hci_req_add(req, HCI_OP_SET_EVENT_FLT, sizeof(f), &f);
-		scan = SCAN_PAGE;
-	}
-
-	if (scan && !scanning) {
-		set_bit(SUSPEND_SCAN_ENABLE, hdev->suspend_tasks);
-		hci_req_add(req, HCI_OP_WRITE_SCAN_ENABLE, 1, &scan);
-	} else if (!scan && scanning) {
-		set_bit(SUSPEND_SCAN_DISABLE, hdev->suspend_tasks);
-		hci_req_add(req, HCI_OP_WRITE_SCAN_ENABLE, 1, &scan);
-	}
-}
-
 static void cancel_adv_timeout(struct hci_dev *hdev)
 {
 	if (hdev->adv_instance_timeout) {
@@ -1013,185 +955,6 @@ int hci_req_resume_adv_instances(struct hci_dev *hdev)
 	return hci_req_run(&req, NULL);
 }
 
-static void suspend_req_complete(struct hci_dev *hdev, u8 status, u16 opcode)
-{
-	bt_dev_dbg(hdev, "Request complete opcode=0x%x, status=0x%x", opcode,
-		   status);
-	if (test_bit(SUSPEND_SCAN_ENABLE, hdev->suspend_tasks) ||
-	    test_bit(SUSPEND_SCAN_DISABLE, hdev->suspend_tasks)) {
-		clear_bit(SUSPEND_SCAN_ENABLE, hdev->suspend_tasks);
-		clear_bit(SUSPEND_SCAN_DISABLE, hdev->suspend_tasks);
-		wake_up(&hdev->suspend_wait_q);
-	}
-
-	if (test_bit(SUSPEND_SET_ADV_FILTER, hdev->suspend_tasks)) {
-		clear_bit(SUSPEND_SET_ADV_FILTER, hdev->suspend_tasks);
-		wake_up(&hdev->suspend_wait_q);
-	}
-}
-
-static void hci_req_prepare_adv_monitor_suspend(struct hci_request *req,
-						bool suspending)
-{
-	struct hci_dev *hdev = req->hdev;
-
-	switch (hci_get_adv_monitor_offload_ext(hdev)) {
-	case HCI_ADV_MONITOR_EXT_MSFT:
-		if (suspending)
-			msft_suspend(hdev);
-		else
-			msft_resume(hdev);
-		break;
-	default:
-		return;
-	}
-
-	/* No need to block when enabling since it's on resume path */
-	if (hdev->suspended && suspending)
-		set_bit(SUSPEND_SET_ADV_FILTER, hdev->suspend_tasks);
-}
-
-/* Call with hci_dev_lock */
-void hci_req_prepare_suspend(struct hci_dev *hdev, enum suspended_state next)
-{
-	int old_state;
-	struct hci_conn *conn;
-	struct hci_request req;
-	u8 page_scan;
-	int disconnect_counter;
-
-	if (next == hdev->suspend_state) {
-		bt_dev_dbg(hdev, "Same state before and after: %d", next);
-		goto done;
-	}
-
-	hdev->suspend_state = next;
-	hci_req_init(&req, hdev);
-
-	if (next == BT_SUSPEND_DISCONNECT) {
-		/* Mark device as suspended */
-		hdev->suspended = true;
-
-		/* Pause discovery if not already stopped */
-		old_state = hdev->discovery.state;
-		if (old_state != DISCOVERY_STOPPED) {
-			set_bit(SUSPEND_PAUSE_DISCOVERY, hdev->suspend_tasks);
-			hci_discovery_set_state(hdev, DISCOVERY_STOPPING);
-			queue_work(hdev->req_workqueue, &hdev->discov_update);
-		}
-
-		hdev->discovery_paused = true;
-		hdev->discovery_old_state = old_state;
-
-		/* Stop directed advertising */
-		old_state = hci_dev_test_flag(hdev, HCI_ADVERTISING);
-		if (old_state) {
-			set_bit(SUSPEND_PAUSE_ADVERTISING, hdev->suspend_tasks);
-			cancel_delayed_work(&hdev->discov_off);
-			queue_delayed_work(hdev->req_workqueue,
-					   &hdev->discov_off, 0);
-		}
-
-		/* Pause other advertisements */
-		if (hdev->adv_instance_cnt)
-			__hci_req_pause_adv_instances(&req);
-
-		hdev->advertising_paused = true;
-		hdev->advertising_old_state = old_state;
-
-		/* Disable page scan if enabled */
-		if (test_bit(HCI_PSCAN, &hdev->flags)) {
-			page_scan = SCAN_DISABLED;
-			hci_req_add(&req, HCI_OP_WRITE_SCAN_ENABLE, 1,
-				    &page_scan);
-			set_bit(SUSPEND_SCAN_DISABLE, hdev->suspend_tasks);
-		}
-
-		/* Disable LE passive scan if enabled */
-		if (hci_dev_test_flag(hdev, HCI_LE_SCAN)) {
-			cancel_interleave_scan(hdev);
-			hci_req_add_le_scan_disable(&req, false);
-		}
-
-		/* Disable advertisement filters */
-		hci_req_prepare_adv_monitor_suspend(&req, true);
-
-		/* Prevent disconnects from causing scanning to be re-enabled */
-		hdev->scanning_paused = true;
-
-		/* Run commands before disconnecting */
-		hci_req_run(&req, suspend_req_complete);
-
-		disconnect_counter = 0;
-		/* Soft disconnect everything (power off) */
-		list_for_each_entry(conn, &hdev->conn_hash.list, list) {
-			hci_disconnect(conn, HCI_ERROR_REMOTE_POWER_OFF);
-			disconnect_counter++;
-		}
-
-		if (disconnect_counter > 0) {
-			bt_dev_dbg(hdev,
-				   "Had %d disconnects. Will wait on them",
-				   disconnect_counter);
-			set_bit(SUSPEND_DISCONNECTING, hdev->suspend_tasks);
-		}
-	} else if (next == BT_SUSPEND_CONFIGURE_WAKE) {
-		/* Unpause to take care of updating scanning params */
-		hdev->scanning_paused = false;
-		/* Enable event filter for paired devices */
-		hci_req_set_event_filter(&req);
-		/* Enable passive scan at lower duty cycle */
-		__hci_update_background_scan(&req);
-		/* Pause scan changes again. */
-		hdev->scanning_paused = true;
-		hci_req_run(&req, suspend_req_complete);
-	} else {
-		hdev->suspended = false;
-		hdev->scanning_paused = false;
-
-		/* Clear any event filters and restore scan state */
-		hci_req_clear_event_filter(&req);
-		__hci_req_update_scan(&req);
-
-		/* Reset passive/background scanning to normal */
-		__hci_update_background_scan(&req);
-		/* Enable all of the advertisement filters */
-		hci_req_prepare_adv_monitor_suspend(&req, false);
-
-		/* Unpause directed advertising */
-		hdev->advertising_paused = false;
-		if (hdev->advertising_old_state) {
-			set_bit(SUSPEND_UNPAUSE_ADVERTISING,
-				hdev->suspend_tasks);
-			hci_dev_set_flag(hdev, HCI_ADVERTISING);
-			queue_work(hdev->req_workqueue,
-				   &hdev->discoverable_update);
-			hdev->advertising_old_state = 0;
-		}
-
-		/* Resume other advertisements */
-		if (hdev->adv_instance_cnt)
-			__hci_req_resume_adv_instances(&req);
-
-		/* Unpause discovery */
-		hdev->discovery_paused = false;
-		if (hdev->discovery_old_state != DISCOVERY_STOPPED &&
-		    hdev->discovery_old_state != DISCOVERY_STOPPING) {
-			set_bit(SUSPEND_UNPAUSE_DISCOVERY, hdev->suspend_tasks);
-			hci_discovery_set_state(hdev, DISCOVERY_STARTING);
-			queue_work(hdev->req_workqueue, &hdev->discov_update);
-		}
-
-		hci_req_run(&req, suspend_req_complete);
-	}
-
-	hdev->suspend_state = next;
-
-done:
-	clear_bit(SUSPEND_PREPARE_NOTIFIER, hdev->suspend_tasks);
-	wake_up(&hdev->suspend_wait_q);
-}
-
 static bool adv_cur_instance_is_scannable(struct hci_dev *hdev)
 {
 	return hci_adv_instance_is_scannable(hdev, hdev->cur_adv_instance);
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index 5d71ace4965c..a9837b95a9bd 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -1410,9 +1410,6 @@ int hci_scan_disable_sync(struct hci_dev *hdev)
 		return 0;
 	}
 
-	if (hdev->suspended)
-		set_bit(SUSPEND_SCAN_DISABLE, hdev->suspend_tasks);
-
 	err = hci_le_set_scan_enable_sync(hdev, LE_SCAN_DISABLE, 0x00);
 	if (err) {
 		bt_dev_err(hdev, "Unable to disable scanning: %d", err);
@@ -1642,10 +1639,11 @@ static int hci_le_add_accept_list_sync(struct hci_dev *hdev,
 	return 0;
 }
 
-/* This function disables all advertising instances (including 0x00) */
+/* This function disables/pause all advertising instances */
 static int hci_pause_advertising_sync(struct hci_dev *hdev)
 {
 	int err;
+	int old_state;
 
 	/* If there are no instances or advertising has already been paused
 	 * there is nothing to do.
@@ -1653,6 +1651,21 @@ static int hci_pause_advertising_sync(struct hci_dev *hdev)
 	if (!hdev->adv_instance_cnt || hdev->advertising_paused)
 		return 0;
 
+	bt_dev_dbg(hdev, "Pausing directed advertising");
+
+	/* Stop directed advertising */
+	old_state = hci_dev_test_flag(hdev, HCI_ADVERTISING);
+	if (old_state) {
+		/* When discoverable timeout triggers, then just make sure
+		 * the limited discoverable flag is cleared. Even in the case
+		 * of a timeout triggered from general discoverable, it is
+		 * safe to unconditionally clear the flag.
+		 */
+		hci_dev_clear_flag(hdev, HCI_LIMITED_DISCOVERABLE);
+		hci_dev_clear_flag(hdev, HCI_DISCOVERABLE);
+		hdev->discov_timeout = 0;
+	}
+
 	bt_dev_dbg(hdev, "Pausing advertising instances");
 
 	/* Call to disable any advertisements active on the controller.
@@ -1667,11 +1680,12 @@ static int hci_pause_advertising_sync(struct hci_dev *hdev)
 		cancel_adv_timeout(hdev);
 
 	hdev->advertising_paused = true;
+	hdev->advertising_old_state = old_state;
 
 	return 0;
 }
 
-/* This function enables all user advertising instances (excluding 0x00) */
+/* This function enables all user advertising instances */
 static int hci_resume_advertising_sync(struct hci_dev *hdev)
 {
 	struct adv_info *adv, *tmp;
@@ -1681,6 +1695,14 @@ static int hci_resume_advertising_sync(struct hci_dev *hdev)
 	if (!hdev->advertising_paused)
 		return 0;
 
+	/* Resume directed advertising */
+	hdev->advertising_paused = false;
+	if (hdev->advertising_old_state) {
+		hci_dev_set_flag(hdev, HCI_ADVERTISING);
+		queue_work(hdev->req_workqueue, &hdev->discoverable_update);
+		hdev->advertising_old_state = 0;
+	}
+
 	bt_dev_dbg(hdev, "Resuming advertising instances");
 
 	if (ext_adv_capable(hdev)) {
@@ -2002,8 +2024,6 @@ int hci_passive_scan_sync(struct hci_dev *hdev)
 	if (hdev->suspended) {
 		window = hdev->le_scan_window_suspend;
 		interval = hdev->le_scan_int_suspend;
-
-		set_bit(SUSPEND_SCAN_ENABLE, hdev->suspend_tasks);
 	} else if (hci_is_le_conn_scanning(hdev)) {
 		window = hdev->le_scan_window_connect;
 		interval = hdev->le_scan_int_connect;
@@ -2937,6 +2957,13 @@ static int hci_set_event_mask_sync(struct hci_dev *hdev)
 
 	if (lmp_bredr_capable(hdev)) {
 		events[4] |= 0x01; /* Flow Specification Complete */
+
+		/* Don't set Disconnect Complete when suspended as that
+		 * would wakeup the host when disconnecting due to
+		 * suspend.
+		 */
+		if (hdev->suspended)
+			events[0] &= 0xef;
 	} else {
 		/* Use a different default for LE-only devices */
 		memset(events, 0, sizeof(events));
@@ -2949,7 +2976,12 @@ static int hci_set_event_mask_sync(struct hci_dev *hdev)
 		 * control related events.
 		 */
 		if (hdev->commands[0] & 0x20) {
-			events[0] |= 0x10; /* Disconnection Complete */
+			/* Don't set Disconnect Complete when suspended as that
+			 * would wakeup the host when disconnecting due to
+			 * suspend.
+			 */
+			if (!hdev->suspended)
+				events[0] |= 0x10; /* Disconnection Complete */
 			events[2] |= 0x04; /* Number of Completed Packets */
 			events[3] |= 0x02; /* Data Buffer Overflow */
 		}
@@ -4033,9 +4065,6 @@ int hci_dev_close_sync(struct hci_dev *hdev)
 	clear_bit(HCI_RUNNING, &hdev->flags);
 	hci_sock_dev_event(hdev, HCI_DEV_CLOSE);
 
-	if (test_and_clear_bit(SUSPEND_POWERING_DOWN, hdev->suspend_tasks))
-		wake_up(&hdev->suspend_wait_q);
-
 	/* After this point our queues are empty
 	 * and no tasks are scheduled. */
 	hdev->close(hdev);
@@ -4300,6 +4329,20 @@ static int hci_abort_conn_sync(struct hci_dev *hdev, struct hci_conn *conn,
 	return 0;
 }
 
+static int hci_disconnect_all_sync(struct hci_dev *hdev, u8 reason)
+{
+	struct hci_conn *conn, *tmp;
+	int err;
+
+	list_for_each_entry_safe(conn, tmp, &hdev->conn_hash.list, list) {
+		err = hci_abort_conn_sync(hdev, conn, reason);
+		if (err)
+			return err;
+	}
+
+	return err;
+}
+
 /* This function perform power off HCI command sequence as follows:
  *
  * Clear Advertising
@@ -4309,7 +4352,6 @@ static int hci_abort_conn_sync(struct hci_dev *hdev, struct hci_conn *conn,
  */
 static int hci_power_off_sync(struct hci_dev *hdev)
 {
-	struct hci_conn *conn;
 	int err;
 
 	/* If controller is already down there is nothing to do */
@@ -4331,10 +4373,10 @@ static int hci_power_off_sync(struct hci_dev *hdev)
 	if (err)
 		return err;
 
-	list_for_each_entry(conn, &hdev->conn_hash.list, list) {
-		/* 0x15 == Terminated due to Power Off */
-		hci_abort_conn_sync(hdev, conn, 0x15);
-	}
+	/* Terminated due to Power Off */
+	err = hci_disconnect_all_sync(hdev, HCI_ERROR_REMOTE_POWER_OFF);
+	if (err)
+		return err;
 
 	return hci_dev_close_sync(hdev);
 }
@@ -4536,3 +4578,223 @@ int hci_start_discovery_sync(struct hci_dev *hdev)
 			   timeout);
 	return 0;
 }
+
+static void hci_suspend_monitor_sync(struct hci_dev *hdev)
+{
+	switch (hci_get_adv_monitor_offload_ext(hdev)) {
+	case HCI_ADV_MONITOR_EXT_MSFT:
+		msft_suspend_sync(hdev);
+		break;
+	default:
+		return;
+	}
+}
+
+/* This function disables discovery and mark it as paused */
+static int hci_pause_discovery_sync(struct hci_dev *hdev)
+{
+	int old_state = hdev->discovery.state;
+	int err;
+
+	/* If discovery already stopped/stopping/paused there nothing to do */
+	if (old_state == DISCOVERY_STOPPED || old_state == DISCOVERY_STOPPING ||
+	    hdev->discovery_paused)
+		return 0;
+
+	hci_discovery_set_state(hdev, DISCOVERY_STOPPING);
+	err = hci_stop_discovery_sync(hdev);
+	if (err)
+		return err;
+
+	hdev->discovery_paused = true;
+	hdev->discovery_old_state = old_state;
+	hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
+
+	return 0;
+}
+
+static int hci_update_event_filter_sync(struct hci_dev *hdev)
+{
+	struct bdaddr_list_with_flags *b;
+	u8 scan = SCAN_DISABLED;
+	bool scanning = test_bit(HCI_PSCAN, &hdev->flags);
+	int err;
+
+	if (!hci_dev_test_flag(hdev, HCI_BREDR_ENABLED))
+		return 0;
+
+	/* Always clear event filter when starting */
+	hci_clear_event_filter_sync(hdev);
+
+	list_for_each_entry(b, &hdev->accept_list, list) {
+		if (!hci_conn_test_flag(HCI_CONN_FLAG_REMOTE_WAKEUP,
+					b->current_flags))
+			continue;
+
+		bt_dev_dbg(hdev, "Adding event filters for %pMR", &b->bdaddr);
+
+		err =  hci_set_event_filter_sync(hdev, HCI_FLT_CONN_SETUP,
+						 HCI_CONN_SETUP_ALLOW_BDADDR,
+						 &b->bdaddr,
+						 HCI_CONN_SETUP_AUTO_ON);
+		if (err)
+			bt_dev_dbg(hdev, "Failed to set event filter for %pMR",
+				   &b->bdaddr);
+		else
+			scan = SCAN_PAGE;
+	}
+
+	if (scan && !scanning)
+		hci_write_scan_enable_sync(hdev, scan);
+	else if (!scan && scanning)
+		hci_write_scan_enable_sync(hdev, scan);
+
+	return 0;
+}
+
+/* This function performs the HCI suspend procedures in the follow order:
+ *
+ * Pause discovery (active scanning/inquiry)
+ * Pause Directed Advertising/Advertising
+ * Disconnect all connections
+ * Set suspend_status to BT_SUSPEND_DISCONNECT if hdev cannot wakeup
+ * otherwise:
+ * Update event mask (only set events that are allowed to wake up the host)
+ * Update event filter (with devices marked with HCI_CONN_FLAG_REMOTE_WAKEUP)
+ * Update passive scanning (lower duty cycle)
+ * Set suspend_status to BT_SUSPEND_CONFIGURE_WAKE
+ */
+int hci_suspend_sync(struct hci_dev *hdev)
+{
+	int err;
+
+	/* If marked as suspended there nothing to do */
+	if (hdev->suspended)
+		return 0;
+
+	/* Mark device as suspended */
+	hdev->suspended = true;
+
+	/* Pause discovery if not already stopped */
+	hci_pause_discovery_sync(hdev);
+
+	/* Pause other advertisements */
+	hci_pause_advertising_sync(hdev);
+
+	/* Disable page scan if enabled */
+	if (test_bit(HCI_PSCAN, &hdev->flags))
+		hci_write_scan_enable_sync(hdev, SCAN_DISABLED);
+
+	/* Suspend monitor filters */
+	hci_suspend_monitor_sync(hdev);
+
+	/* Prevent disconnects from causing scanning to be re-enabled */
+	hdev->scanning_paused = true;
+
+	/* Soft disconnect everything (power off) */
+	err = hci_disconnect_all_sync(hdev, HCI_ERROR_REMOTE_POWER_OFF);
+	if (err) {
+		/* Set state to BT_RUNNING so resume doesn't notify */
+		hdev->suspend_state = BT_RUNNING;
+		hci_resume_sync(hdev);
+		return err;
+	}
+
+	/* Only configure accept list if disconnect succeeded and wake
+	 * isn't being prevented.
+	 */
+	if (!hdev->wakeup || !hdev->wakeup(hdev)) {
+		hdev->suspend_state = BT_SUSPEND_DISCONNECT;
+		return 0;
+	}
+
+	/* Unpause to take care of updating scanning params */
+	hdev->scanning_paused = false;
+
+	/* Update event mask so only the allowed event can wakeup the host */
+	hci_set_event_mask_sync(hdev);
+
+	/* Enable event filter for paired devices */
+	hci_update_event_filter_sync(hdev);
+
+	/* Update LE passive scan if enabled */
+	hci_update_passive_scan_sync(hdev);
+
+	/* Pause scan changes again. */
+	hdev->scanning_paused = true;
+
+	hdev->suspend_state = BT_SUSPEND_CONFIGURE_WAKE;
+
+	return 0;
+}
+
+/* This function resumes discovery */
+static int hci_resume_discovery_sync(struct hci_dev *hdev)
+{
+	int err;
+
+	/* If discovery not paused there nothing to do */
+	if (!hdev->discovery_paused)
+		return 0;
+
+	hdev->discovery_paused = false;
+
+	hci_discovery_set_state(hdev, DISCOVERY_STARTING);
+
+	err = hci_start_discovery_sync(hdev);
+
+	hci_discovery_set_state(hdev, err ? DISCOVERY_STOPPED :
+				DISCOVERY_FINDING);
+
+	return err;
+}
+
+static void hci_resume_monitor_sync(struct hci_dev *hdev)
+{
+	switch (hci_get_adv_monitor_offload_ext(hdev)) {
+	case HCI_ADV_MONITOR_EXT_MSFT:
+		msft_resume_sync(hdev);
+		break;
+	default:
+		return;
+	}
+}
+
+/* This function performs the HCI suspend procedures in the follow order:
+ *
+ * Restore event mask
+ * Clear event filter
+ * Update passive scanning (normal duty cycle)
+ * Resume Directed Advertising/Advertising
+ * Resume discovery (active scanning/inquiry)
+ */
+int hci_resume_sync(struct hci_dev *hdev)
+{
+	/* If not marked as suspended there nothing to do */
+	if (!hdev->suspended)
+		return 0;
+
+	hdev->suspended = false;
+	hdev->scanning_paused = false;
+
+	/* Restore event mask */
+	hci_set_event_mask_sync(hdev);
+
+	/* Clear any event filters and restore scan state */
+	hci_clear_event_filter_sync(hdev);
+	hci_update_scan_sync(hdev);
+
+	/* Reset passive scanning to normal */
+	hci_update_passive_scan_sync(hdev);
+
+	/* Resume monitor filters */
+	hci_resume_monitor_sync(hdev);
+
+	/* Resume other advertisements */
+	hci_resume_advertising_sync(hdev);
+
+	/* Resume discovery */
+	hci_resume_discovery_sync(hdev);
+
+	return 0;
+}
diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 8f38bd97330c..6f6cf9ba17e4 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -5172,13 +5172,6 @@ void mgmt_start_discovery_complete(struct hci_dev *hdev, u8 status)
 	}
 
 	hci_dev_unlock(hdev);
-
-	/* Handle suspend notifier */
-	if (test_and_clear_bit(SUSPEND_UNPAUSE_DISCOVERY,
-			       hdev->suspend_tasks)) {
-		bt_dev_dbg(hdev, "Unpaused discovery");
-		wake_up(&hdev->suspend_wait_q);
-	}
 }
 
 static bool discovery_type_is_valid(struct hci_dev *hdev, uint8_t type,
@@ -5218,13 +5211,6 @@ static void start_discovery_complete(struct hci_dev *hdev, void *data, int err)
 			  cmd->param, 1);
 	mgmt_pending_free(cmd);
 
-	/* Handle suspend notifier */
-	if (test_and_clear_bit(SUSPEND_UNPAUSE_DISCOVERY,
-			       hdev->suspend_tasks)) {
-		bt_dev_dbg(hdev, "Unpaused discovery");
-		wake_up(&hdev->suspend_wait_q);
-	}
-
 	hci_discovery_set_state(hdev, err ? DISCOVERY_STOPPED:
 				DISCOVERY_FINDING);
 }
@@ -5447,12 +5433,6 @@ void mgmt_stop_discovery_complete(struct hci_dev *hdev, u8 status)
 	}
 
 	hci_dev_unlock(hdev);
-
-	/* Handle suspend notifier */
-	if (test_and_clear_bit(SUSPEND_PAUSE_DISCOVERY, hdev->suspend_tasks)) {
-		bt_dev_dbg(hdev, "Paused discovery");
-		wake_up(&hdev->suspend_wait_q);
-	}
 }
 
 static void stop_discovery_complete(struct hci_dev *hdev, void *data, int err)
@@ -5465,12 +5445,6 @@ static void stop_discovery_complete(struct hci_dev *hdev, void *data, int err)
 			  cmd->param, 1);
 	mgmt_pending_free(cmd);
 
-	/* Handle suspend notifier */
-	if (test_and_clear_bit(SUSPEND_PAUSE_DISCOVERY, hdev->suspend_tasks)) {
-		bt_dev_dbg(hdev, "Paused discovery");
-		wake_up(&hdev->suspend_wait_q);
-	}
-
 	if (!err)
 		hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
 }
@@ -5710,17 +5684,6 @@ static void set_advertising_complete(struct hci_dev *hdev, void *data, int err)
 	if (match.sk)
 		sock_put(match.sk);
 
-	/* Handle suspend notifier */
-	if (test_and_clear_bit(SUSPEND_PAUSE_ADVERTISING,
-			       hdev->suspend_tasks)) {
-		bt_dev_dbg(hdev, "Paused advertising");
-		wake_up(&hdev->suspend_wait_q);
-	} else if (test_and_clear_bit(SUSPEND_UNPAUSE_ADVERTISING,
-				      hdev->suspend_tasks)) {
-		bt_dev_dbg(hdev, "Unpaused advertising");
-		wake_up(&hdev->suspend_wait_q);
-	}
-
 	/* If "Set Advertising" was just disabled and instance advertising was
 	 * set up earlier, then re-enable multi-instance advertising.
 	 */
diff --git a/net/bluetooth/msft.c b/net/bluetooth/msft.c
index 5205d9410ff5..1122097e1e49 100644
--- a/net/bluetooth/msft.c
+++ b/net/bluetooth/msft.c
@@ -93,7 +93,7 @@ struct msft_data {
 	struct list_head handle_map;
 	__u16 pending_add_handle;
 	__u16 pending_remove_handle;
-	__u8 reregistering;
+	__u8 resuming;
 	__u8 suspending;
 	__u8 filter_enabled;
 };
@@ -156,7 +156,6 @@ static bool read_supported_features(struct hci_dev *hdev,
 	return false;
 }
 
-/* This function requires the caller holds hdev->lock */
 static void reregister_monitor(struct hci_dev *hdev, int handle)
 {
 	struct adv_monitor *monitor;
@@ -166,8 +165,8 @@ static void reregister_monitor(struct hci_dev *hdev, int handle)
 	while (1) {
 		monitor = idr_get_next(&hdev->adv_monitors_idr, &handle);
 		if (!monitor) {
-			/* All monitors have been reregistered */
-			msft->reregistering = false;
+			/* All monitors have been resumed */
+			msft->resuming = false;
 			hci_update_passive_scan(hdev);
 			return;
 		}
@@ -185,67 +184,317 @@ static void reregister_monitor(struct hci_dev *hdev, int handle)
 	}
 }
 
-/* This function requires the caller holds hdev->lock */
-static void remove_monitor_on_suspend(struct hci_dev *hdev, int handle)
+/* is_mgmt = true matches the handle exposed to userspace via mgmt.
+ * is_mgmt = false matches the handle used by the msft controller.
+ * This function requires the caller holds hdev->lock
+ */
+static struct msft_monitor_advertisement_handle_data *msft_find_handle_data
+				(struct hci_dev *hdev, u16 handle, bool is_mgmt)
+{
+	struct msft_monitor_advertisement_handle_data *entry;
+	struct msft_data *msft = hdev->msft_data;
+
+	list_for_each_entry(entry, &msft->handle_map, list) {
+		if (is_mgmt && entry->mgmt_handle == handle)
+			return entry;
+		if (!is_mgmt && entry->msft_handle == handle)
+			return entry;
+	}
+
+	return NULL;
+}
+
+static void msft_le_monitor_advertisement_cb(struct hci_dev *hdev,
+					     u8 status, u16 opcode,
+					     struct sk_buff *skb)
+{
+	struct msft_rp_le_monitor_advertisement *rp;
+	struct adv_monitor *monitor;
+	struct msft_monitor_advertisement_handle_data *handle_data;
+	struct msft_data *msft = hdev->msft_data;
+
+	hci_dev_lock(hdev);
+
+	monitor = idr_find(&hdev->adv_monitors_idr, msft->pending_add_handle);
+	if (!monitor) {
+		bt_dev_err(hdev, "msft add advmon: monitor %u is not found!",
+			   msft->pending_add_handle);
+		status = HCI_ERROR_UNSPECIFIED;
+		goto unlock;
+	}
+
+	if (status)
+		goto unlock;
+
+	rp = (struct msft_rp_le_monitor_advertisement *)skb->data;
+	if (skb->len < sizeof(*rp)) {
+		status = HCI_ERROR_UNSPECIFIED;
+		goto unlock;
+	}
+
+	handle_data = kmalloc(sizeof(*handle_data), GFP_KERNEL);
+	if (!handle_data) {
+		status = HCI_ERROR_UNSPECIFIED;
+		goto unlock;
+	}
+
+	handle_data->mgmt_handle = monitor->handle;
+	handle_data->msft_handle = rp->handle;
+	INIT_LIST_HEAD(&handle_data->list);
+	list_add(&handle_data->list, &msft->handle_map);
+
+	monitor->state = ADV_MONITOR_STATE_OFFLOADED;
+
+unlock:
+	if (status && monitor)
+		hci_free_adv_monitor(hdev, monitor);
+
+	hci_dev_unlock(hdev);
+
+	if (!msft->resuming)
+		hci_add_adv_patterns_monitor_complete(hdev, status);
+}
+
+static void msft_le_cancel_monitor_advertisement_cb(struct hci_dev *hdev,
+						    u8 status, u16 opcode,
+						    struct sk_buff *skb)
 {
+	struct msft_cp_le_cancel_monitor_advertisement *cp;
+	struct msft_rp_le_cancel_monitor_advertisement *rp;
 	struct adv_monitor *monitor;
+	struct msft_monitor_advertisement_handle_data *handle_data;
 	struct msft_data *msft = hdev->msft_data;
 	int err;
+	bool pending;
 
-	while (1) {
-		monitor = idr_get_next(&hdev->adv_monitors_idr, &handle);
-		if (!monitor) {
-			/* All monitors have been removed */
-			msft->suspending = false;
-			hci_update_background_scan(hdev);
+	if (status)
+		goto done;
+
+	rp = (struct msft_rp_le_cancel_monitor_advertisement *)skb->data;
+	if (skb->len < sizeof(*rp)) {
+		status = HCI_ERROR_UNSPECIFIED;
+		goto done;
+	}
+
+	hci_dev_lock(hdev);
+
+	cp = hci_sent_cmd_data(hdev, hdev->msft_opcode);
+	handle_data = msft_find_handle_data(hdev, cp->handle, false);
+
+	if (handle_data) {
+		monitor = idr_find(&hdev->adv_monitors_idr,
+				   handle_data->mgmt_handle);
+
+		if (monitor && monitor->state == ADV_MONITOR_STATE_OFFLOADED)
+			monitor->state = ADV_MONITOR_STATE_REGISTERED;
+
+		/* Do not free the monitor if it is being removed due to
+		 * suspend. It will be re-monitored on resume.
+		 */
+		if (monitor && !msft->suspending)
+			hci_free_adv_monitor(hdev, monitor);
+
+		list_del(&handle_data->list);
+		kfree(handle_data);
+	}
+
+	/* If remove all monitors is required, we need to continue the process
+	 * here because the earlier it was paused when waiting for the
+	 * response from controller.
+	 */
+	if (msft->pending_remove_handle == 0) {
+		pending = hci_remove_all_adv_monitor(hdev, &err);
+		if (pending) {
+			hci_dev_unlock(hdev);
 			return;
 		}
 
-		msft->pending_remove_handle = (u16)handle;
-		err = __msft_remove_monitor(hdev, monitor, handle);
+		if (err)
+			status = HCI_ERROR_UNSPECIFIED;
+	}
 
-		/* If success, return and wait for monitor removed callback */
-		if (!err)
-			return;
+	hci_dev_unlock(hdev);
+
+done:
+	if (!msft->suspending)
+		hci_remove_adv_monitor_complete(hdev, status);
+}
+
+static int msft_remove_monitor_sync(struct hci_dev *hdev,
+				    struct adv_monitor *monitor)
+{
+	struct msft_cp_le_cancel_monitor_advertisement cp;
+	struct msft_monitor_advertisement_handle_data *handle_data;
+	struct sk_buff *skb;
+	u8 status;
+
+	handle_data = msft_find_handle_data(hdev, monitor->handle, true);
+
+	/* If no matched handle, just remove without telling controller */
+	if (!handle_data)
+		return -ENOENT;
+
+	cp.sub_opcode = MSFT_OP_LE_CANCEL_MONITOR_ADVERTISEMENT;
+	cp.handle = handle_data->msft_handle;
+
+	skb = __hci_cmd_sync(hdev, hdev->msft_opcode, sizeof(cp), &cp,
+			     HCI_CMD_TIMEOUT);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	status = skb->data[0];
+	skb_pull(skb, 1);
+
+	msft_le_cancel_monitor_advertisement_cb(hdev, status, hdev->msft_opcode,
+						skb);
+
+	return status;
+}
+
+/* This function requires the caller holds hci_req_sync_lock */
+int msft_suspend_sync(struct hci_dev *hdev)
+{
+	struct msft_data *msft = hdev->msft_data;
+	struct adv_monitor *monitor;
+	int handle = 0;
+
+	if (!msft || !msft_monitor_supported(hdev))
+		return 0;
+
+	msft->suspending = true;
+
+	while (1) {
+		monitor = idr_get_next(&hdev->adv_monitors_idr, &handle);
+		if (!monitor)
+			break;
+
+		msft_remove_monitor_sync(hdev, monitor);
 
-		/* Otherwise free the monitor and keep removing */
-		hci_free_adv_monitor(hdev, monitor);
 		handle++;
 	}
+
+	/* All monitors have been removed */
+	msft->suspending = false;
+
+	return 0;
 }
 
-/* This function requires the caller holds hdev->lock */
-void msft_suspend(struct hci_dev *hdev)
+static bool msft_monitor_rssi_valid(struct adv_monitor *monitor)
 {
-	struct msft_data *msft = hdev->msft_data;
+	struct adv_rssi_thresholds *r = &monitor->rssi;
 
-	if (!msft)
-		return;
+	if (r->high_threshold < MSFT_RSSI_THRESHOLD_VALUE_MIN ||
+	    r->high_threshold > MSFT_RSSI_THRESHOLD_VALUE_MAX ||
+	    r->low_threshold < MSFT_RSSI_THRESHOLD_VALUE_MIN ||
+	    r->low_threshold > MSFT_RSSI_THRESHOLD_VALUE_MAX)
+		return false;
 
-	if (msft_monitor_supported(hdev)) {
-		msft->suspending = true;
-		/* Quitely remove all monitors on suspend to avoid waking up
-		 * the system.
-		 */
-		remove_monitor_on_suspend(hdev, 0);
+	/* High_threshold_timeout is not supported,
+	 * once high_threshold is reached, events are immediately reported.
+	 */
+	if (r->high_threshold_timeout != 0)
+		return false;
+
+	if (r->low_threshold_timeout > MSFT_RSSI_LOW_TIMEOUT_MAX)
+		return false;
+
+	/* Sampling period from 0x00 to 0xFF are all allowed */
+	return true;
+}
+
+static bool msft_monitor_pattern_valid(struct adv_monitor *monitor)
+{
+	return msft_monitor_rssi_valid(monitor);
+	/* No additional check needed for pattern-based monitor */
+}
+
+static int msft_add_monitor_sync(struct hci_dev *hdev,
+				 struct adv_monitor *monitor)
+{
+	struct msft_cp_le_monitor_advertisement *cp;
+	struct msft_le_monitor_advertisement_pattern_data *pattern_data;
+	struct msft_le_monitor_advertisement_pattern *pattern;
+	struct adv_pattern *entry;
+	size_t total_size = sizeof(*cp) + sizeof(*pattern_data);
+	ptrdiff_t offset = 0;
+	u8 pattern_count = 0;
+	struct sk_buff *skb;
+	u8 status;
+
+	if (!msft_monitor_pattern_valid(monitor))
+		return -EINVAL;
+
+	list_for_each_entry(entry, &monitor->patterns, list) {
+		pattern_count++;
+		total_size += sizeof(*pattern) + entry->length;
 	}
+
+	cp = kmalloc(total_size, GFP_KERNEL);
+	if (!cp)
+		return -ENOMEM;
+
+	cp->sub_opcode = MSFT_OP_LE_MONITOR_ADVERTISEMENT;
+	cp->rssi_high = monitor->rssi.high_threshold;
+	cp->rssi_low = monitor->rssi.low_threshold;
+	cp->rssi_low_interval = (u8)monitor->rssi.low_threshold_timeout;
+	cp->rssi_sampling_period = monitor->rssi.sampling_period;
+
+	cp->cond_type = MSFT_MONITOR_ADVERTISEMENT_TYPE_PATTERN;
+
+	pattern_data = (void *)cp->data;
+	pattern_data->count = pattern_count;
+
+	list_for_each_entry(entry, &monitor->patterns, list) {
+		pattern = (void *)(pattern_data->data + offset);
+		/* the length also includes data_type and offset */
+		pattern->length = entry->length + 2;
+		pattern->data_type = entry->ad_type;
+		pattern->start_byte = entry->offset;
+		memcpy(pattern->pattern, entry->value, entry->length);
+		offset += sizeof(*pattern) + entry->length;
+	}
+
+	skb = __hci_cmd_sync(hdev, hdev->msft_opcode, total_size, cp,
+			     HCI_CMD_TIMEOUT);
+	kfree(cp);
+
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	status = skb->data[0];
+	skb_pull(skb, 1);
+
+	msft_le_monitor_advertisement_cb(hdev, status, hdev->msft_opcode, skb);
+
+	return status;
 }
 
-/* This function requires the caller holds hdev->lock */
-void msft_resume(struct hci_dev *hdev)
+/* This function requires the caller holds hci_req_sync_lock */
+int msft_resume_sync(struct hci_dev *hdev)
 {
 	struct msft_data *msft = hdev->msft_data;
+	struct adv_monitor *monitor;
+	int handle = 0;
 
-	if (!msft)
-		return;
+	if (!msft || !msft_monitor_supported(hdev))
+		return 0;
 
-	if (msft_monitor_supported(hdev)) {
-		msft->reregistering = true;
-		/* Monitors are removed on suspend, so we need to add all
-		 * monitors on resume.
-		 */
-		reregister_monitor(hdev, 0);
+	msft->resuming = true;
+
+	while (1) {
+		monitor = idr_get_next(&hdev->adv_monitors_idr, &handle);
+		if (!monitor)
+			break;
+
+		msft_add_monitor_sync(hdev, monitor);
+
+		handle++;
 	}
+
+	/* All monitors have been resumed */
+	msft->resuming = false;
+
+	return 0;
 }
 
 void msft_do_open(struct hci_dev *hdev)
@@ -275,7 +524,7 @@ void msft_do_open(struct hci_dev *hdev)
 	}
 
 	if (msft_monitor_supported(hdev)) {
-		msft->reregistering = true;
+		msft->resuming = true;
 		msft_set_filter_enable(hdev, true);
 		/* Monitors get removed on power off, so we need to explicitly
 		 * tell the controller to re-monitor.
@@ -381,151 +630,6 @@ __u64 msft_get_features(struct hci_dev *hdev)
 	return msft ? msft->features : 0;
 }
 
-/* is_mgmt = true matches the handle exposed to userspace via mgmt.
- * is_mgmt = false matches the handle used by the msft controller.
- * This function requires the caller holds hdev->lock
- */
-static struct msft_monitor_advertisement_handle_data *msft_find_handle_data
-				(struct hci_dev *hdev, u16 handle, bool is_mgmt)
-{
-	struct msft_monitor_advertisement_handle_data *entry;
-	struct msft_data *msft = hdev->msft_data;
-
-	list_for_each_entry(entry, &msft->handle_map, list) {
-		if (is_mgmt && entry->mgmt_handle == handle)
-			return entry;
-		if (!is_mgmt && entry->msft_handle == handle)
-			return entry;
-	}
-
-	return NULL;
-}
-
-static void msft_le_monitor_advertisement_cb(struct hci_dev *hdev,
-					     u8 status, u16 opcode,
-					     struct sk_buff *skb)
-{
-	struct msft_rp_le_monitor_advertisement *rp;
-	struct adv_monitor *monitor;
-	struct msft_monitor_advertisement_handle_data *handle_data;
-	struct msft_data *msft = hdev->msft_data;
-
-	hci_dev_lock(hdev);
-
-	monitor = idr_find(&hdev->adv_monitors_idr, msft->pending_add_handle);
-	if (!monitor) {
-		bt_dev_err(hdev, "msft add advmon: monitor %u is not found!",
-			   msft->pending_add_handle);
-		status = HCI_ERROR_UNSPECIFIED;
-		goto unlock;
-	}
-
-	if (status)
-		goto unlock;
-
-	rp = (struct msft_rp_le_monitor_advertisement *)skb->data;
-	if (skb->len < sizeof(*rp)) {
-		status = HCI_ERROR_UNSPECIFIED;
-		goto unlock;
-	}
-
-	handle_data = kmalloc(sizeof(*handle_data), GFP_KERNEL);
-	if (!handle_data) {
-		status = HCI_ERROR_UNSPECIFIED;
-		goto unlock;
-	}
-
-	handle_data->mgmt_handle = monitor->handle;
-	handle_data->msft_handle = rp->handle;
-	INIT_LIST_HEAD(&handle_data->list);
-	list_add(&handle_data->list, &msft->handle_map);
-
-	monitor->state = ADV_MONITOR_STATE_OFFLOADED;
-
-unlock:
-	if (status && monitor)
-		hci_free_adv_monitor(hdev, monitor);
-
-	/* If in restart/reregister sequence, keep registering. */
-	if (msft->reregistering)
-		reregister_monitor(hdev, msft->pending_add_handle + 1);
-
-	hci_dev_unlock(hdev);
-
-	if (!msft->reregistering)
-		hci_add_adv_patterns_monitor_complete(hdev, status);
-}
-
-static void msft_le_cancel_monitor_advertisement_cb(struct hci_dev *hdev,
-						    u8 status, u16 opcode,
-						    struct sk_buff *skb)
-{
-	struct msft_cp_le_cancel_monitor_advertisement *cp;
-	struct msft_rp_le_cancel_monitor_advertisement *rp;
-	struct adv_monitor *monitor;
-	struct msft_monitor_advertisement_handle_data *handle_data;
-	struct msft_data *msft = hdev->msft_data;
-	int err;
-	bool pending;
-
-	if (status)
-		goto done;
-
-	rp = (struct msft_rp_le_cancel_monitor_advertisement *)skb->data;
-	if (skb->len < sizeof(*rp)) {
-		status = HCI_ERROR_UNSPECIFIED;
-		goto done;
-	}
-
-	hci_dev_lock(hdev);
-
-	cp = hci_sent_cmd_data(hdev, hdev->msft_opcode);
-	handle_data = msft_find_handle_data(hdev, cp->handle, false);
-
-	if (handle_data) {
-		monitor = idr_find(&hdev->adv_monitors_idr,
-				   handle_data->mgmt_handle);
-
-		if (monitor && monitor->state == ADV_MONITOR_STATE_OFFLOADED)
-			monitor->state = ADV_MONITOR_STATE_REGISTERED;
-
-		/* Do not free the monitor if it is being removed due to
-		 * suspend. It will be re-monitored on resume.
-		 */
-		if (monitor && !msft->suspending)
-			hci_free_adv_monitor(hdev, monitor);
-
-		list_del(&handle_data->list);
-		kfree(handle_data);
-	}
-
-	/* If in suspend/remove sequence, keep removing. */
-	if (msft->suspending)
-		remove_monitor_on_suspend(hdev,
-					  msft->pending_remove_handle + 1);
-
-	/* If remove all monitors is required, we need to continue the process
-	 * here because the earlier it was paused when waiting for the
-	 * response from controller.
-	 */
-	if (msft->pending_remove_handle == 0) {
-		pending = hci_remove_all_adv_monitor(hdev, &err);
-		if (pending) {
-			hci_dev_unlock(hdev);
-			return;
-		}
-
-		if (err)
-			status = HCI_ERROR_UNSPECIFIED;
-	}
-
-	hci_dev_unlock(hdev);
-
-done:
-	if (!msft->suspending)
-		hci_remove_adv_monitor_complete(hdev, status);
-}
-
 static void msft_le_set_advertisement_filter_enable_cb(struct hci_dev *hdev,
 						       u8 status, u16 opcode,
 						       struct sk_buff *skb)
@@ -560,35 +664,6 @@ static void msft_le_set_advertisement_filter_enable_cb(struct hci_dev *hdev,
 	hci_dev_unlock(hdev);
 }
 
-static bool msft_monitor_rssi_valid(struct adv_monitor *monitor)
-{
-	struct adv_rssi_thresholds *r = &monitor->rssi;
-
-	if (r->high_threshold < MSFT_RSSI_THRESHOLD_VALUE_MIN ||
-	    r->high_threshold > MSFT_RSSI_THRESHOLD_VALUE_MAX ||
-	    r->low_threshold < MSFT_RSSI_THRESHOLD_VALUE_MIN ||
-	    r->low_threshold > MSFT_RSSI_THRESHOLD_VALUE_MAX)
-		return false;
-
-	/* High_threshold_timeout is not supported,
-	 * once high_threshold is reached, events are immediately reported.
-	 */
-	if (r->high_threshold_timeout != 0)
-		return false;
-
-	if (r->low_threshold_timeout > MSFT_RSSI_LOW_TIMEOUT_MAX)
-		return false;
-
-	/* Sampling period from 0x00 to 0xFF are all allowed */
-	return true;
-}
-
-static bool msft_monitor_pattern_valid(struct adv_monitor *monitor)
-{
-	return msft_monitor_rssi_valid(monitor);
-	/* No additional check needed for pattern-based monitor */
-}
-
 /* This function requires the caller holds hdev->lock */
 static int __msft_add_monitor_pattern(struct hci_dev *hdev,
 				      struct adv_monitor *monitor)
@@ -656,7 +731,7 @@ int msft_add_monitor_pattern(struct hci_dev *hdev, struct adv_monitor *monitor)
 	if (!msft)
 		return -EOPNOTSUPP;
 
-	if (msft->reregistering || msft->suspending)
+	if (msft->resuming || msft->suspending)
 		return -EBUSY;
 
 	return __msft_add_monitor_pattern(hdev, monitor);
@@ -700,7 +775,7 @@ int msft_remove_monitor(struct hci_dev *hdev, struct adv_monitor *monitor,
 	if (!msft)
 		return -EOPNOTSUPP;
 
-	if (msft->reregistering || msft->suspending)
+	if (msft->resuming || msft->suspending)
 		return -EBUSY;
 
 	return __msft_remove_monitor(hdev, monitor, handle);
diff --git a/net/bluetooth/msft.h b/net/bluetooth/msft.h
index 59c6e081c789..b59b63dc0ea8 100644
--- a/net/bluetooth/msft.h
+++ b/net/bluetooth/msft.h
@@ -24,8 +24,8 @@ int msft_remove_monitor(struct hci_dev *hdev, struct adv_monitor *monitor,
 			u16 handle);
 void msft_req_add_set_filter_enable(struct hci_request *req, bool enable);
 int msft_set_filter_enable(struct hci_dev *hdev, bool enable);
-void msft_suspend(struct hci_dev *hdev);
-void msft_resume(struct hci_dev *hdev);
+int msft_suspend_sync(struct hci_dev *hdev);
+int msft_resume_sync(struct hci_dev *hdev);
 bool msft_curve_validity(struct hci_dev *hdev);
 
 #else
@@ -61,8 +61,15 @@ static inline int msft_set_filter_enable(struct hci_dev *hdev, bool enable)
 	return -EOPNOTSUPP;
 }
 
-static inline void msft_suspend(struct hci_dev *hdev) {}
-static inline void msft_resume(struct hci_dev *hdev) {}
+static inline int msft_suspend_sync(struct hci_dev *hdev)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int msft_resume_sync(struct hci_dev *hdev)
+{
+	return -EOPNOTSUPP;
+}
 
 static inline bool msft_curve_validity(struct hci_dev *hdev)
 {
-- 
2.31.1

