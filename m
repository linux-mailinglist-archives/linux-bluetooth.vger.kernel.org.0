Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 352C243BD87
	for <lists+linux-bluetooth@lfdr.de>; Wed, 27 Oct 2021 01:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240160AbhJZXFz (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 26 Oct 2021 19:05:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240155AbhJZXFy (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 26 Oct 2021 19:05:54 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 770C7C061745
        for <linux-bluetooth@vger.kernel.org>; Tue, 26 Oct 2021 16:03:30 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id v193so891251pfc.4
        for <linux-bluetooth@vger.kernel.org>; Tue, 26 Oct 2021 16:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JaTDUn/s4BFWvSR8M6HpGY/qmfJO7xFmSg5hoHkn9lg=;
        b=Wy6VB1L0wSLdF//wx9of1yA6uH9BIb3I5J+wPZdTxg3g6SFPOHpV+m/hc/bt3XGgBP
         5wuahp5duVYJrrTZCLC03RkqJqVsu180hmx2zYUUs6YpsvVPIuRdNjL7/9TBt8OedqJA
         OYF8JmbumPeEKCZtanaxW0pBvNBBuLiUMXdbAQWLRxqGUsw1WdYYQQWNnqo7NnWqxeyN
         /5qjF368eg7bCHMs+DxnKy/w/n3FZcvdc1Tpcjkzppd+vDrsEtuKY9YyQx2i27DtUwdA
         cQHQN7jEN1v9PwCeISSQqEcuPJYqY31/aJ2jiI6NWDvWNuidV0X95eDzN6XFSZJ7i1ip
         WUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JaTDUn/s4BFWvSR8M6HpGY/qmfJO7xFmSg5hoHkn9lg=;
        b=ff2b0fepee4QMFU2UwKPzw5gBE5+ESj8tDYOb4O1/G07LwQUUNTsN83LYFCbcJjpdj
         lb4hEodS4nfYRAVFAEzSwpWwOaP4ElGOCjFTbFfw70+KHqDRJ1zYlqMHIvMBH/OTa/iw
         WOjbKYvXGtSlDBLWzBFSTWue/8fwh2G1Cv3f8OENOgDxqw77yEo0Vzm0H3RXnYlUwIpG
         PDDRXun1sRpy9TMUKQ6i/GV5gSteKL3URdMI0SMB4OE3dgAKy5bJVQRgKgo2OxP2+bmk
         QrDvK7t501s7IYFjGA/0lDMEs7otT0Gw1rSpWraFZ7F/iPnYenYbFwJSuoyvFalSGhG2
         Iysg==
X-Gm-Message-State: AOAM5301aPcELK7aEtdCYgCU7mgDlvyAjapDvnYMO4KlMReRopURvs9r
        cCTq2Ht5x2Wh+tPtaSu4bc5SoBA0E4g=
X-Google-Smtp-Source: ABdhPJzDxdPl3Hx5u0PCLoEqnTPvCIyYZ8VNZbZH7STB4fuAvXcm5RcPpVxAbh3QEY2LuCJ1R9wjGQ==
X-Received: by 2002:a63:8ac7:: with SMTP id y190mr13171067pgd.55.1635289409089;
        Tue, 26 Oct 2021 16:03:29 -0700 (PDT)
Received: from lvondent-mobl4.intel.com (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id a2sm20697558pgn.20.2021.10.26.16.03.28
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 16:03:28 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v6 04/23] Bluetooth: hci_sync: Make use of hci_cmd_sync_queue set 3
Date:   Tue, 26 Oct 2021 16:03:05 -0700
Message-Id: <20211026230324.1533907-5-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211026230324.1533907-1-luiz.dentz@gmail.com>
References: <20211026230324.1533907-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This make use of hci_cmd_sync_queue for the following MGMT commands:

    Add Device
    Remove Device

Tested with:

mgmt-tester -s "Add Device"

Test Summary
------------
Add Device - Invalid Params 1                        Passed
Add Device - Invalid Params 2                        Passed
Add Device - Invalid Params 3                        Passed
Add Device - Invalid Params 4                        Passed
Add Device - Success 1                               Passed
Add Device - Success 2                               Passed
Add Device - Success 3                               Passed
Add Device - Success 4                               Passed
Add Device - Success 5                               Passed
Add Device - Success 6 - Add to whitelist            Passed
Add Device - Success 7 - Add to resolv list          Passed
Add Device - Success 8 - Enable resolv list          Passed
Total: 12, Passed: 12 (100.0%), Failed: 0, Not Run: 0
Overall execution time: 0.209 seconds

mgmt-tester -s "Remove Device"

Test Summary
------------
Remove Device - Invalid Params 1                     Passed
Remove Device - Invalid Params 2                     Passed
Remove Device - Invalid Params 3                     Passed
Remove Device - Success 1                            Passed
Remove Device - Success 2                            Passed
Remove Device - Success 3                            Passed
Remove Device - Success 4                            Passed
Remove Device - Success 5                            Passed
Remove Device - Success 6 - All Devices              Passed
Remove Device - Success 7 - Remove from whitelist    Passed
Remove Device - Success 8 - Remove from resolv list  Passed
Total: 11, Passed: 11 (100.0%), Failed: 0, Not Run: 0
Overall execution time: 4.26 seconds

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 include/net/bluetooth/hci_sync.h |   2 +
 net/bluetooth/hci_sync.c         | 617 +++++++++++++++++++++++++++++++
 net/bluetooth/mgmt.c             |  19 +-
 3 files changed, 634 insertions(+), 4 deletions(-)

diff --git a/include/net/bluetooth/hci_sync.h b/include/net/bluetooth/hci_sync.h
index 143829cd1b29..b0708f900d89 100644
--- a/include/net/bluetooth/hci_sync.h
+++ b/include/net/bluetooth/hci_sync.h
@@ -63,3 +63,5 @@ int hci_enable_advertising_sync(struct hci_dev *hdev);
 int hci_remove_advertising_sync(struct hci_dev *hdev, struct sock *sk,
 				u8 instance, bool force);
 int hci_disable_advertising_sync(struct hci_dev *hdev);
+
+int hci_update_passive_scan_sync(struct hci_dev *hdev);
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index 6ccd9de87cd6..94667efc4395 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -1290,3 +1290,620 @@ int hci_disable_advertising_sync(struct hci_dev *hdev)
 	return __hci_cmd_sync_status(hdev, HCI_OP_LE_SET_ADV_ENABLE,
 				     sizeof(enable), &enable, HCI_CMD_TIMEOUT);
 }
+
+static int hci_le_set_ext_scan_enable_sync(struct hci_dev *hdev, u8 val,
+					   u8 filter_dup)
+{
+	struct hci_cp_le_set_ext_scan_enable cp;
+
+	memset(&cp, 0, sizeof(cp));
+	cp.enable = val;
+	cp.filter_dup = filter_dup;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_LE_SET_EXT_SCAN_ENABLE,
+				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+}
+
+static int hci_le_set_scan_enable_sync(struct hci_dev *hdev, u8 val,
+				       u8 filter_dup)
+{
+	struct hci_cp_le_set_scan_enable cp;
+
+	if (use_ext_scan(hdev))
+		return hci_le_set_ext_scan_enable_sync(hdev, val, filter_dup);
+
+	memset(&cp, 0, sizeof(cp));
+	cp.enable = val;
+	cp.filter_dup = filter_dup;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_LE_SET_SCAN_ENABLE,
+				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+}
+
+static int hci_le_set_addr_resolution_enable_sync(struct hci_dev *hdev, u8 val)
+{
+	if (!use_ll_privacy(hdev) ||
+	    !hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY))
+		return 0;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_LE_SET_ADDR_RESOLV_ENABLE,
+				     sizeof(val), &val, HCI_CMD_TIMEOUT);
+}
+
+int hci_scan_disable_sync(struct hci_dev *hdev, bool rpa_le_conn)
+{
+	int err;
+
+	/* If controller is not scanning we are done. */
+	if (!hci_dev_test_flag(hdev, HCI_LE_SCAN))
+		return 0;
+
+	if (hdev->scanning_paused) {
+		bt_dev_dbg(hdev, "Scanning is paused for suspend");
+		return 0;
+	}
+
+	if (hdev->suspended)
+		set_bit(SUSPEND_SCAN_DISABLE, hdev->suspend_tasks);
+
+	err = hci_le_set_scan_enable_sync(hdev, LE_SCAN_DISABLE, 0x00);
+	if (err) {
+		bt_dev_err(hdev, "Unable to disable scanning: %d", err);
+		return err;
+	}
+
+	if (rpa_le_conn) {
+		err = hci_le_set_addr_resolution_enable_sync(hdev, 0x00);
+		if (err)
+			bt_dev_err(hdev, "Unable to disable LL privacy: %d",
+				   err);
+	}
+
+	return err;
+}
+
+static bool scan_use_rpa(struct hci_dev *hdev)
+{
+	return hci_dev_test_flag(hdev, HCI_PRIVACY);
+}
+
+static void hci_start_interleave_scan(struct hci_dev *hdev)
+{
+	hdev->interleave_scan_state = INTERLEAVE_SCAN_NO_FILTER;
+	queue_delayed_work(hdev->req_workqueue,
+			   &hdev->interleave_scan, 0);
+}
+
+static bool is_interleave_scanning(struct hci_dev *hdev)
+{
+	return hdev->interleave_scan_state != INTERLEAVE_SCAN_NONE;
+}
+
+static void cancel_interleave_scan(struct hci_dev *hdev)
+{
+	bt_dev_dbg(hdev, "cancelling interleave scan");
+
+	cancel_delayed_work_sync(&hdev->interleave_scan);
+
+	hdev->interleave_scan_state = INTERLEAVE_SCAN_NONE;
+}
+
+/* Return true if interleave_scan wasn't started until exiting this function,
+ * otherwise, return false
+ */
+static bool hci_update_interleaved_scan_sync(struct hci_dev *hdev)
+{
+	/* Do interleaved scan only if all of the following are true:
+	 * - There is at least one ADV monitor
+	 * - At least one pending LE connection or one device to be scanned for
+	 * - Monitor offloading is not supported
+	 * If so, we should alternate between allowlist scan and one without
+	 * any filters to save power.
+	 */
+	bool use_interleaving = hci_is_adv_monitoring(hdev) &&
+				!(list_empty(&hdev->pend_le_conns) &&
+				  list_empty(&hdev->pend_le_reports)) &&
+				hci_get_adv_monitor_offload_ext(hdev) ==
+				    HCI_ADV_MONITOR_EXT_NONE;
+	bool is_interleaving = is_interleave_scanning(hdev);
+
+	if (use_interleaving && !is_interleaving) {
+		hci_start_interleave_scan(hdev);
+		bt_dev_dbg(hdev, "starting interleave scan");
+		return true;
+	}
+
+	if (!use_interleaving && is_interleaving)
+		cancel_interleave_scan(hdev);
+
+	return false;
+}
+
+/* Removes connection to resolve list if needed.*/
+static int hci_le_del_resolve_list_sync(struct hci_dev *hdev,
+					bdaddr_t *bdaddr, u8 bdaddr_type)
+{
+	struct hci_cp_le_del_from_resolv_list cp;
+	struct bdaddr_list_with_irk *entry;
+
+	if (!use_ll_privacy(hdev) ||
+	    !hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY))
+		return 0;
+
+	/* Check if the IRK has been programmed */
+	entry = hci_bdaddr_list_lookup_with_irk(&hdev->le_resolv_list, bdaddr,
+						bdaddr_type);
+	if (!entry)
+		return 0;
+
+	cp.bdaddr_type = bdaddr_type;
+	bacpy(&cp.bdaddr, bdaddr);
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_LE_DEL_FROM_RESOLV_LIST,
+				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+}
+
+static int hci_le_del_accept_list_sync(struct hci_dev *hdev,
+				       bdaddr_t *bdaddr, u8 bdaddr_type)
+{
+	struct hci_cp_le_del_from_accept_list cp;
+	int err;
+
+	/* Check if device is on accept list before removing it */
+	if (!hci_bdaddr_list_lookup(&hdev->le_accept_list, bdaddr, bdaddr_type))
+		return 0;
+
+	cp.bdaddr_type = bdaddr_type;
+	bacpy(&cp.bdaddr, bdaddr);
+
+	err = __hci_cmd_sync_status(hdev, HCI_OP_LE_DEL_FROM_ACCEPT_LIST,
+				    sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+	if (err) {
+		bt_dev_err(hdev, "Unable to remove from allow list: %d", err);
+		return err;
+	}
+
+	bt_dev_dbg(hdev, "Remove %pMR (0x%x) from allow list", &cp.bdaddr,
+		   cp.bdaddr_type);
+
+	return hci_le_del_resolve_list_sync(hdev, &cp.bdaddr, cp.bdaddr_type);
+}
+
+/* Adds connection to resolve list if needed.*/
+static int hci_le_add_resolve_list_sync(struct hci_dev *hdev,
+					struct hci_conn_params *params)
+{
+	struct hci_cp_le_add_to_resolv_list cp;
+	struct smp_irk *irk;
+	struct bdaddr_list_with_irk *entry;
+
+	if (!use_ll_privacy(hdev) ||
+	    !hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY))
+		return 0;
+
+	irk = hci_find_irk_by_addr(hdev, &params->addr, params->addr_type);
+	if (!irk)
+		return 0;
+
+	/* Check if the IK has _not_ been programmed yet. */
+	entry = hci_bdaddr_list_lookup_with_irk(&hdev->le_resolv_list,
+						&params->addr,
+						params->addr_type);
+	if (entry)
+		return 0;
+
+	cp.bdaddr_type = params->addr_type;
+	bacpy(&cp.bdaddr, &params->addr);
+	memcpy(cp.peer_irk, irk->val, 16);
+
+	if (hci_dev_test_flag(hdev, HCI_PRIVACY))
+		memcpy(cp.local_irk, hdev->irk, 16);
+	else
+		memset(cp.local_irk, 0, 16);
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_LE_ADD_TO_RESOLV_LIST,
+				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+}
+
+/* Adds connection to allow list if needed, if the device uses RPA (has IRK)
+ * this attempts to program the device in the resolving list as well.
+ */
+static int hci_le_add_accept_list_sync(struct hci_dev *hdev,
+				       struct hci_conn_params *params,
+				       u8 *num_entries, bool allow_rpa)
+{
+	struct hci_cp_le_add_to_accept_list cp;
+	int err;
+
+	/* Already in accept list */
+	if (hci_bdaddr_list_lookup(&hdev->le_accept_list, &params->addr,
+				   params->addr_type))
+		return 0;
+
+	/* Select filter policy to accept all advertising */
+	if (*num_entries >= hdev->le_accept_list_size)
+		return -ENOSPC;
+
+	/* Accept list can not be used with RPAs */
+	if (!allow_rpa &&
+	    !hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY) &&
+	    hci_find_irk_by_addr(hdev, &params->addr, params->addr_type)) {
+		return -EINVAL;
+	}
+
+	/* During suspend, only wakeable devices can be in acceptlist */
+	if (hdev->suspended && !hci_conn_test_flag(HCI_CONN_FLAG_REMOTE_WAKEUP,
+						   params->current_flags))
+		return 0;
+
+	*num_entries += 1;
+	cp.bdaddr_type = params->addr_type;
+	bacpy(&cp.bdaddr, &params->addr);
+
+	err = __hci_cmd_sync_status(hdev, HCI_OP_LE_ADD_TO_ACCEPT_LIST,
+				    sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+	if (err) {
+		bt_dev_err(hdev, "Unable to add to allow list: %d", err);
+		return err;
+	}
+
+	bt_dev_dbg(hdev, "Add %pMR (0x%x) to allow list", &cp.bdaddr,
+		   cp.bdaddr_type);
+
+	return hci_le_add_resolve_list_sync(hdev, params);
+}
+
+static u8 hci_update_accept_list_sync(struct hci_dev *hdev)
+{
+	struct hci_conn_params *params;
+	struct bdaddr_list *b, *t;
+	u8 num_entries = 0;
+	bool pend_conn, pend_report;
+	/* We allow acceptlisting even with RPAs in suspend. In the worst case,
+	 * we won't be able to wake from devices that use the privacy1.2
+	 * features. Additionally, once we support privacy1.2 and IRK
+	 * offloading, we can update this to also check for those conditions.
+	 */
+	bool allow_rpa = hdev->suspended;
+
+	if (use_ll_privacy(hdev) &&
+	    hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY))
+		allow_rpa = true;
+
+	/* Go through the current accept list programmed into the
+	 * controller one by one and check if that address is still
+	 * in the list of pending connections or list of devices to
+	 * report. If not present in either list, then remove it from
+	 * the controller.
+	 */
+	list_for_each_entry_safe(b, t, &hdev->le_accept_list, list) {
+		pend_conn = hci_pend_le_action_lookup(&hdev->pend_le_conns,
+						      &b->bdaddr,
+						      b->bdaddr_type);
+		pend_report = hci_pend_le_action_lookup(&hdev->pend_le_reports,
+							&b->bdaddr,
+							b->bdaddr_type);
+
+		/* If the device is not likely to connect or report,
+		 * remove it from the acceptlist.
+		 */
+		if (!pend_conn && !pend_report) {
+			hci_le_del_accept_list_sync(hdev, &b->bdaddr,
+						    b->bdaddr_type);
+			continue;
+		}
+
+		/* Accept list can not be used with RPAs */
+		if (!allow_rpa &&
+		    !hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY) &&
+		    hci_find_irk_by_addr(hdev, &b->bdaddr, b->bdaddr_type)) {
+			return 0x00;
+		}
+
+		num_entries++;
+	}
+
+	/* Since all no longer valid accept list entries have been
+	 * removed, walk through the list of pending connections
+	 * and ensure that any new device gets programmed into
+	 * the controller.
+	 *
+	 * If the list of the devices is larger than the list of
+	 * available accept list entries in the controller, then
+	 * just abort and return filer policy value to not use the
+	 * accept list.
+	 */
+	list_for_each_entry(params, &hdev->pend_le_conns, action) {
+		if (hci_le_add_accept_list_sync(hdev, params, &num_entries,
+						allow_rpa))
+			return 0x00;
+	}
+
+	/* After adding all new pending connections, walk through
+	 * the list of pending reports and also add these to the
+	 * accept list if there is still space. Abort if space runs out.
+	 */
+	list_for_each_entry(params, &hdev->pend_le_reports, action) {
+		if (hci_le_add_accept_list_sync(hdev, params, &num_entries,
+						allow_rpa))
+			return 0x00;
+	}
+
+	/* Use the allowlist unless the following conditions are all true:
+	 * - We are not currently suspending
+	 * - There are 1 or more ADV monitors registered and it's not offloaded
+	 * - Interleaved scanning is not currently using the allowlist
+	 */
+	if (!idr_is_empty(&hdev->adv_monitors_idr) && !hdev->suspended &&
+	    hci_get_adv_monitor_offload_ext(hdev) == HCI_ADV_MONITOR_EXT_NONE &&
+	    hdev->interleave_scan_state != INTERLEAVE_SCAN_ALLOWLIST)
+		return 0x00;
+
+	/* Select filter policy to use accept list */
+	return 0x01;
+}
+
+/* Returns true if an le connection is in the scanning state */
+static inline bool hci_is_le_conn_scanning(struct hci_dev *hdev)
+{
+	struct hci_conn_hash *h = &hdev->conn_hash;
+	struct hci_conn  *c;
+
+	rcu_read_lock();
+
+	list_for_each_entry_rcu(c, &h->list, list) {
+		if (c->type == LE_LINK && c->state == BT_CONNECT &&
+		    test_bit(HCI_CONN_SCANNING, &c->flags)) {
+			rcu_read_unlock();
+			return true;
+		}
+	}
+
+	rcu_read_unlock();
+
+	return false;
+}
+
+static int hci_le_set_ext_scan_param_sync(struct hci_dev *hdev, u8 type,
+					  u16 interval, u16 window,
+					  u8 own_addr_type, u8 filter_policy)
+{
+	struct hci_cp_le_set_ext_scan_params *cp;
+	struct hci_cp_le_scan_phy_params *phy;
+	u8 data[sizeof(*cp) + sizeof(*phy) * 2];
+	u8 num_phy = 0;
+
+	cp = (void *)data;
+	phy = (void *)cp->data;
+
+	memset(data, 0, sizeof(data));
+
+	cp->own_addr_type = own_addr_type;
+	cp->filter_policy = filter_policy;
+
+	if (scan_1m(hdev) || scan_2m(hdev)) {
+		cp->scanning_phys |= LE_SCAN_PHY_1M;
+
+		phy->type = type;
+		phy->interval = cpu_to_le16(interval);
+		phy->window = cpu_to_le16(window);
+
+		num_phy++;
+		phy++;
+	}
+
+	if (scan_coded(hdev)) {
+		cp->scanning_phys |= LE_SCAN_PHY_CODED;
+
+		phy->type = type;
+		phy->interval = cpu_to_le16(interval);
+		phy->window = cpu_to_le16(window);
+
+		num_phy++;
+		phy++;
+	}
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_LE_SET_EXT_SCAN_PARAMS,
+				     sizeof(*cp) + sizeof(*phy) * num_phy,
+				     data, HCI_CMD_TIMEOUT);
+}
+
+static int hci_le_set_scan_param_sync(struct hci_dev *hdev, u8 type,
+				      u16 interval, u16 window,
+				      u8 own_addr_type, u8 filter_policy)
+{
+	struct hci_cp_le_set_scan_param cp;
+
+	if (use_ext_scan(hdev))
+		return hci_le_set_ext_scan_param_sync(hdev, type, interval,
+						      window, own_addr_type,
+						      filter_policy);
+
+	memset(&cp, 0, sizeof(cp));
+	cp.type = type;
+	cp.interval = cpu_to_le16(interval);
+	cp.window = cpu_to_le16(window);
+	cp.own_address_type = own_addr_type;
+	cp.filter_policy = filter_policy;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_LE_SET_SCAN_PARAM,
+				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+}
+
+static int hci_start_scan_sync(struct hci_dev *hdev, u8 type, u16 interval,
+			       u16 window, u8 own_addr_type, u8 filter_policy,
+			       bool addr_resolv)
+{
+	int err;
+
+	if (hdev->scanning_paused) {
+		bt_dev_dbg(hdev, "Scanning is paused for suspend");
+		return 0;
+	}
+
+	if (addr_resolv) {
+		err = hci_le_set_addr_resolution_enable_sync(hdev, 0x01);
+		if (err)
+			return err;
+	}
+
+	err = hci_le_set_scan_param_sync(hdev, type, interval, window,
+					 own_addr_type, filter_policy);
+	if (err)
+		return err;
+
+	return hci_le_set_scan_enable_sync(hdev, LE_SCAN_ENABLE,
+					   LE_SCAN_FILTER_DUP_ENABLE);
+}
+
+/* Ensure to call hci_scan_disable_sync first to disable the controller based
+ * address resolution to be able to reconfigure resolving list.
+ */
+int hci_passive_scan_sync(struct hci_dev *hdev)
+{
+	u8 own_addr_type;
+	u8 filter_policy;
+	u16 window, interval;
+	/* Background scanning should run with address resolution */
+	bool addr_resolv = true;
+
+	if (hdev->scanning_paused) {
+		bt_dev_dbg(hdev, "Scanning is paused for suspend");
+		return 0;
+	}
+
+	/* Set require_privacy to false since no SCAN_REQ are send
+	 * during passive scanning. Not using an non-resolvable address
+	 * here is important so that peer devices using direct
+	 * advertising with our address will be correctly reported
+	 * by the controller.
+	 */
+	if (hci_update_random_address_sync(hdev, false, scan_use_rpa(hdev),
+					   &own_addr_type))
+		return 0;
+
+	if (hdev->enable_advmon_interleave_scan &&
+	    hci_update_interleaved_scan_sync(hdev))
+		return 0;
+
+	bt_dev_dbg(hdev, "interleave state %d", hdev->interleave_scan_state);
+	/* Adding or removing entries from the accept list must
+	 * happen before enabling scanning. The controller does
+	 * not allow accept list modification while scanning.
+	 */
+	filter_policy = hci_update_accept_list_sync(hdev);
+
+	/* When the controller is using random resolvable addresses and
+	 * with that having LE privacy enabled, then controllers with
+	 * Extended Scanner Filter Policies support can now enable support
+	 * for handling directed advertising.
+	 *
+	 * So instead of using filter polices 0x00 (no acceptlist)
+	 * and 0x01 (acceptlist enabled) use the new filter policies
+	 * 0x02 (no acceptlist) and 0x03 (acceptlist enabled).
+	 */
+	if (hci_dev_test_flag(hdev, HCI_PRIVACY) &&
+	    (hdev->le_features[0] & HCI_LE_EXT_SCAN_POLICY))
+		filter_policy |= 0x02;
+
+	if (hdev->suspended) {
+		window = hdev->le_scan_window_suspend;
+		interval = hdev->le_scan_int_suspend;
+
+		set_bit(SUSPEND_SCAN_ENABLE, hdev->suspend_tasks);
+	} else if (hci_is_le_conn_scanning(hdev)) {
+		window = hdev->le_scan_window_connect;
+		interval = hdev->le_scan_int_connect;
+	} else if (hci_is_adv_monitoring(hdev)) {
+		window = hdev->le_scan_window_adv_monitor;
+		interval = hdev->le_scan_int_adv_monitor;
+	} else {
+		window = hdev->le_scan_window;
+		interval = hdev->le_scan_interval;
+	}
+
+	bt_dev_dbg(hdev, "LE passive scan with acceptlist = %d", filter_policy);
+
+	return hci_start_scan_sync(hdev, LE_SCAN_PASSIVE, interval, window,
+				   own_addr_type, filter_policy, addr_resolv);
+}
+
+/* This function controls the passive scanning based on hdev->pend_le_conns
+ * list. If there are pending LE connection we start the background scanning,
+ * otherwise we stop it.
+ */
+int hci_update_passive_scan_sync(struct hci_dev *hdev)
+{
+	int err;
+
+	if (!test_bit(HCI_UP, &hdev->flags) ||
+	    test_bit(HCI_INIT, &hdev->flags) ||
+	    hci_dev_test_flag(hdev, HCI_SETUP) ||
+	    hci_dev_test_flag(hdev, HCI_CONFIG) ||
+	    hci_dev_test_flag(hdev, HCI_AUTO_OFF) ||
+	    hci_dev_test_flag(hdev, HCI_UNREGISTER))
+		return 0;
+
+	/* No point in doing scanning if LE support hasn't been enabled */
+	if (!hci_dev_test_flag(hdev, HCI_LE_ENABLED))
+		return 0;
+
+	/* If discovery is active don't interfere with it */
+	if (hdev->discovery.state != DISCOVERY_STOPPED)
+		return 0;
+
+	/* Reset RSSI and UUID filters when starting background scanning
+	 * since these filters are meant for service discovery only.
+	 *
+	 * The Start Discovery and Start Service Discovery operations
+	 * ensure to set proper values for RSSI threshold and UUID
+	 * filter list. So it is safe to just reset them here.
+	 */
+	hci_discovery_filter_clear(hdev);
+
+	bt_dev_dbg(hdev, "ADV monitoring is %s",
+		   hci_is_adv_monitoring(hdev) ? "on" : "off");
+
+	if (list_empty(&hdev->pend_le_conns) &&
+	    list_empty(&hdev->pend_le_reports) &&
+	    !hci_is_adv_monitoring(hdev)) {
+		/* If there is no pending LE connections or devices
+		 * to be scanned for or no ADV monitors, we should stop the
+		 * background scanning.
+		 */
+
+		bt_dev_dbg(hdev, "stopping background scanning");
+
+		err = hci_scan_disable_sync(hdev, false);
+		if (err)
+			bt_dev_err(hdev, "stop background scanning failed: %d",
+				   err);
+	} else {
+		/* If there is at least one pending LE connection, we should
+		 * keep the background scan running.
+		 */
+
+		/* If controller is connecting, we should not start scanning
+		 * since some controllers are not able to scan and connect at
+		 * the same time.
+		 */
+		if (hci_lookup_le_connect(hdev))
+			return 0;
+
+		err = hci_scan_disable_sync(hdev, false);
+		if (err) {
+			bt_dev_err(hdev, "stop background scanning failed: %d",
+				   err);
+			return err;
+		}
+
+		bt_dev_dbg(hdev, "start background scanning");
+
+		err = hci_passive_scan_sync(hdev);
+		if (err)
+			bt_dev_err(hdev, "start background scanning failed: %d",
+				   err);
+	}
+
+	return err;
+}
diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 6e481ca86303..ef61b152c627 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -6927,6 +6927,11 @@ static void device_added(struct sock *sk, struct hci_dev *hdev,
 	mgmt_event(MGMT_EV_DEVICE_ADDED, hdev, &ev, sizeof(ev), sk);
 }
 
+static int add_device_sync(struct hci_dev *hdev, void *data)
+{
+	return hci_update_passive_scan_sync(hdev);
+}
+
 static int add_device(struct sock *sk, struct hci_dev *hdev,
 		      void *data, u16 len)
 {
@@ -7009,7 +7014,9 @@ static int add_device(struct sock *sk, struct hci_dev *hdev,
 			current_flags = params->current_flags;
 	}
 
-	hci_update_background_scan(hdev);
+	err = hci_cmd_sync_queue(hdev, add_device_sync, NULL, NULL);
+	if (err < 0)
+		goto unlock;
 
 added:
 	device_added(sk, hdev, &cp->addr.bdaddr, cp->addr.type, cp->action);
@@ -7036,6 +7043,11 @@ static void device_removed(struct sock *sk, struct hci_dev *hdev,
 	mgmt_event(MGMT_EV_DEVICE_REMOVED, hdev, &ev, sizeof(ev), sk);
 }
 
+static int remove_device_sync(struct hci_dev *hdev, void *data)
+{
+	return hci_update_passive_scan_sync(hdev);
+}
+
 static int remove_device(struct sock *sk, struct hci_dev *hdev,
 			 void *data, u16 len)
 {
@@ -7115,7 +7127,6 @@ static int remove_device(struct sock *sk, struct hci_dev *hdev,
 		list_del(&params->action);
 		list_del(&params->list);
 		kfree(params);
-		hci_update_background_scan(hdev);
 
 		device_removed(sk, hdev, &cp->addr.bdaddr, cp->addr.type);
 	} else {
@@ -7152,10 +7163,10 @@ static int remove_device(struct sock *sk, struct hci_dev *hdev,
 		}
 
 		bt_dev_dbg(hdev, "All LE connection parameters were removed");
-
-		hci_update_background_scan(hdev);
 	}
 
+	hci_cmd_sync_queue(hdev, remove_device_sync, NULL, NULL);
+
 complete:
 	err = mgmt_cmd_complete(sk, hdev->id, MGMT_OP_REMOVE_DEVICE,
 				MGMT_STATUS_SUCCESS, &cp->addr,
-- 
2.31.1

