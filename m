Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF57A3939F0
	for <lists+linux-bluetooth@lfdr.de>; Fri, 28 May 2021 02:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235849AbhE1ADU (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 27 May 2021 20:03:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235802AbhE1ADT (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 27 May 2021 20:03:19 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E28EAC061763
        for <linux-bluetooth@vger.kernel.org>; Thu, 27 May 2021 17:01:44 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id y202so1882259pfc.6
        for <linux-bluetooth@vger.kernel.org>; Thu, 27 May 2021 17:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=guGmiOyD2V647WPB6gdKhsBbkbiQ80glA07RfyvnIQ4=;
        b=CAt/KfajgrTR7XZ8OTcJqIPyT2BlCAI/OM4J6ojahSIWzH+SgiHlZnM1SOTCwPXU5e
         TuJH9XARGfOvw9O4GxJcbV2OFk52wxKMvf8CcNz+RzFY5+ozeSJZxGkrhwB3vPukMhi7
         fQxQbIBNiOlp9wOtXIqWfypKcbsVLboDJRExj2DA5jehRvt/uUPPUmOXejXt9KBPEqUy
         jUSuO1XXMSYBmr48bIXp5dzGQV3c6qgju91Bu6iga0HMNrso5cnBz5IF1A4w56Dtpgyk
         /xI/45PoVplnAbPGvZqSbbUBwgvD2S34mnGU31P83EddoK8U6S8K4JXSAG91dJqb5OuW
         Qp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=guGmiOyD2V647WPB6gdKhsBbkbiQ80glA07RfyvnIQ4=;
        b=OiQB8dLS2ZfvTDebndCaOpbWYzdF52MKn/rDEOWXgqH1Z2FxIP5brC4P5t5WcP8M1n
         A1dpIpBXys8zyOw8KJw5f8zwAc7750evsiDYIiKkWTZSB8MPW3mI1KVc16nBenimG0d6
         Bai76rQ6q84SoBRdWi95CzSpQFvMWsv3jmD3lQzVsrjjCkqlTol9BEXHi7ltcRRCM/ti
         4XJb82bGiK7uvkHtLHojbh0IQQyvJeqeyykeIJTsWRgTAvPIadXhS+VRiTVC5KEwSsTj
         237p0Zi+RI6Sy55nlSbyj4wY1rN4b7+KzsLyHPV/AtljWuZac8eINKLeRabkN6SlOcQQ
         vgYg==
X-Gm-Message-State: AOAM532tgIMXI+K+9UEnXRKHahAUeZmTJnqmvVdJJxJKyEvZO3bialDR
        50mTErFRgpiS2PTQEoWfrny6THkjqno=
X-Google-Smtp-Source: ABdhPJyLJwGU90YRpBTLwZX2RBIrEkVoTBwAoxbyfuauWt8QE/j8QS/hsmiZUhe4PkjLHqQ3hw5CGA==
X-Received: by 2002:a63:770b:: with SMTP id s11mr6313127pgc.5.1622160103854;
        Thu, 27 May 2021 17:01:43 -0700 (PDT)
Received: from localhost.localdomain (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id o134sm2790270pfd.58.2021.05.27.17.01.43
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 17:01:43 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [RFC 5/5] Bluetooth: hci_sync: Make use of hci_cmd_sync_queue set 3
Date:   Thu, 27 May 2021 17:01:36 -0700
Message-Id: <20210528000136.52352-5-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210528000136.52352-1-luiz.dentz@gmail.com>
References: <20210528000136.52352-1-luiz.dentz@gmail.com>
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
Add Device - Invalid Params 1                        Passed       0.017 seconds
Add Device - Invalid Params 2                        Passed       0.013 seconds
Add Device - Invalid Params 3                        Passed       0.013 seconds
Add Device - Invalid Params 4                        Passed       0.013 seconds
Add Device - Success 1                               Passed       0.014 seconds
Add Device - Success 2                               Passed       0.014 seconds
Add Device - Success 3                               Passed       0.014 seconds
Add Device - Success 4                               Passed       0.017 seconds
Add Device - Success 5                               Passed       0.017 seconds
Total: 9, Passed: 9 (100.0%), Failed: 0, Not Run: 0
Overall execution time: 0.14 seconds

mgmt-tester -s "Remove Device"

Test Summary
------------
Remove Device - Invalid Params 1                     Passed       0.153 seconds
Remove Device - Invalid Params 2                     Passed       0.014 seconds
Remove Device - Invalid Params 3                     Passed       0.013 seconds
Remove Device - Success 1                            Passed       0.016 seconds
Remove Device - Success 2                            Passed       0.017 seconds
Remove Device - Success 3                            Passed       1.022 seconds
Remove Device - Success 4                            Passed       1.021 seconds
Remove Device - Success 5                            Passed       1.022 seconds
Total: 8, Passed: 8 (100.0%), Failed: 0, Not Run: 0
Overall execution time: 3.29 seconds

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 net/bluetooth/hci_sync.c | 606 ++++++++++++++++++++++++++++++++++++++-
 net/bluetooth/hci_sync.h |   2 +
 net/bluetooth/mgmt.c     |  19 +-
 3 files changed, 622 insertions(+), 5 deletions(-)

diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index 671f71413847..69ce640be465 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -85,7 +85,10 @@ u8 __hci_cmd_sync_status(struct hci_dev *hdev, u16 opcode, u32 plen,
 	uint8_t status;
 
 	skb = __hci_cmd_sync(hdev, opcode, plen, param, timeout);
-	if (IS_ERR(skb)) {
+	if (IS_ERR_OR_NULL(skb)) {
+		bt_dev_err(hdev, "Opcode 0x%4x failed: %ld", opcode,
+			   PTR_ERR(skb));
+
 		switch (PTR_ERR(skb)) {
 		case -ETIMEDOUT:
 			return HCI_ERROR_CONNECTION_TIMEOUT;
@@ -912,3 +915,604 @@ int hci_disable_advertising_sync(struct hci_dev *hdev)
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
+	struct smp_irk *irk;
+
+	if (!use_ll_privacy(hdev) ||
+	    !hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY))
+		return 0;
+
+	irk = hci_find_irk_by_addr(hdev, bdaddr, bdaddr_type);
+	if (!irk)
+		return 0;
+
+	cp.bdaddr_type = bdaddr_type;
+	bacpy(&cp.bdaddr, bdaddr);
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_LE_DEL_FROM_RESOLV_LIST,
+				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+}
+
+static int hci_le_del_allow_list_sync(struct hci_dev *hdev,
+				      bdaddr_t *bdaddr, u8 bdaddr_type)
+{
+	struct hci_cp_le_del_from_white_list cp;
+	int err;
+
+	cp.bdaddr_type = bdaddr_type;
+	bacpy(&cp.bdaddr, bdaddr);
+
+	err = __hci_cmd_sync_status(hdev, HCI_OP_LE_DEL_FROM_WHITE_LIST,
+				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+	if (err) {
+		bt_dev_err(hdev, "Unable to remove from allow list: %d", err);
+		return err;
+	}
+
+	bt_dev_dbg(hdev, "Remove %pMR (0x%x) from allow list", &cp.bdaddr,
+		   cp.bdaddr_type);
+
+	return hci_le_del_resolve_list_sync(hdev, bdaddr, bdaddr_type);
+}
+
+/* Adds connection to resolve list if needed.*/
+static int hci_le_add_resolve_list_sync(struct hci_dev *hdev,
+					struct hci_conn_params *params)
+{
+	struct hci_cp_le_add_to_resolv_list cp;
+	struct smp_irk *irk;
+
+	if (!use_ll_privacy(hdev) ||
+	    !hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY))
+		return 0;
+
+	irk = hci_find_irk_by_addr(hdev, &params->addr, params->addr_type);
+	if (!irk)
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
+/* Adds connection to allow list if needed.*/
+static int hci_le_add_allow_list_sync(struct hci_dev *hdev,
+				      struct hci_conn_params *params,
+				      u8 *num_entries, bool allow_rpa)
+{
+	struct hci_cp_le_add_to_white_list cp;
+	int err;
+
+	/* Already in white list */
+	if (hci_bdaddr_list_lookup(&hdev->le_white_list, &params->addr,
+				   params->addr_type))
+		return 0;
+
+	/* Select filter policy to accept all advertising */
+	if (*num_entries >= hdev->le_white_list_size)
+		return -ENOSPC;
+
+	/* White list can not be used with RPAs */
+	if (!allow_rpa &&
+	    !hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY) &&
+	    hci_find_irk_by_addr(hdev, &params->addr, params->addr_type)) {
+		return -EINVAL;
+	}
+
+	/* During suspend, only wakeable devices can be in whitelist */
+	if (hdev->suspended && !hci_conn_test_flag(HCI_CONN_FLAG_REMOTE_WAKEUP,
+						   params->current_flags))
+		return 0;
+
+	*num_entries += 1;
+	cp.bdaddr_type = params->addr_type;
+	bacpy(&cp.bdaddr, &params->addr);
+
+	err = __hci_cmd_sync_status(hdev, HCI_OP_LE_ADD_TO_WHITE_LIST,
+				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
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
+static u8 hci_update_white_list_sync(struct hci_dev *hdev)
+{
+	struct hci_conn_params *params;
+	struct bdaddr_list *b;
+	u8 num_entries = 0;
+	bool pend_conn, pend_report;
+	/* We allow whitelisting even with RPAs in suspend. In the worst case,
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
+	/* Go through the current white list programmed into the
+	 * controller one by one and check if that address is still
+	 * in the list of pending connections or list of devices to
+	 * report. If not present in either list, then queue the
+	 * command to remove it from the controller.
+	 */
+	list_for_each_entry(b, &hdev->le_white_list, list) {
+		pend_conn = hci_pend_le_action_lookup(&hdev->pend_le_conns,
+						      &b->bdaddr,
+						      b->bdaddr_type);
+		pend_report = hci_pend_le_action_lookup(&hdev->pend_le_reports,
+							&b->bdaddr,
+							b->bdaddr_type);
+
+		/* If the device is not likely to connect or report,
+		 * remove it from the whitelist.
+		 */
+		if (!pend_conn && !pend_report) {
+			hci_le_del_allow_list_sync(hdev, &b->bdaddr,
+						   b->bdaddr_type);
+			continue;
+		}
+
+		/* White list can not be used with RPAs */
+		if (!allow_rpa &&
+		    !hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY) &&
+		    hci_find_irk_by_addr(hdev, &b->bdaddr, b->bdaddr_type)) {
+			return 0x00;
+		}
+
+		num_entries++;
+	}
+
+	/* Since all no longer valid white list entries have been
+	 * removed, walk through the list of pending connections
+	 * and ensure that any new device gets programmed into
+	 * the controller.
+	 *
+	 * If the list of the devices is larger than the list of
+	 * available white list entries in the controller, then
+	 * just abort and return filer policy value to not use the
+	 * white list.
+	 */
+	list_for_each_entry(params, &hdev->pend_le_conns, action) {
+		if (hci_le_add_allow_list_sync(hdev, params, &num_entries,
+					       allow_rpa))
+			return 0x00;
+	}
+
+	/* After adding all new pending connections, walk through
+	 * the list of pending reports and also add these to the
+	 * white list if there is still space. Abort if space runs out.
+	 */
+	list_for_each_entry(params, &hdev->pend_le_reports, action) {
+		if (hci_le_add_allow_list_sync(hdev, params, &num_entries,
+					       allow_rpa))
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
+	/* Select filter policy to use white list */
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
+				       u16 interval, u16 window,
+				       u8 own_addr_type, u8 filter_policy)
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
+	/* Adding or removing entries from the white list must
+	 * happen before enabling scanning. The controller does
+	 * not allow white list modification while scanning.
+	 */
+	filter_policy = hci_update_white_list_sync(hdev);
+
+	/* When the controller is using random resolvable addresses and
+	 * with that having LE privacy enabled, then controllers with
+	 * Extended Scanner Filter Policies support can now enable support
+	 * for handling directed advertising.
+	 *
+	 * So instead of using filter polices 0x00 (no whitelist)
+	 * and 0x01 (whitelist enabled) use the new filter policies
+	 * 0x02 (no whitelist) and 0x03 (whitelist enabled).
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
+	bt_dev_dbg(hdev, "LE passive scan with whitelist = %d", filter_policy);
+
+	return hci_start_scan_sync(hdev, LE_SCAN_PASSIVE, interval, window,
+				   own_addr_type, filter_policy, addr_resolv);
+}
+
+/* This function controls the background scanning based on hdev->pend_le_conns
+ * list. If there are pending LE connection we start the background scanning,
+ * otherwise we stop it.
+ */
+int hci_update_background_scan_sync(struct hci_dev *hdev)
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
diff --git a/net/bluetooth/hci_sync.h b/net/bluetooth/hci_sync.h
index 5e4392a93607..5ef02b1cb8c1 100644
--- a/net/bluetooth/hci_sync.h
+++ b/net/bluetooth/hci_sync.h
@@ -29,3 +29,5 @@ int hci_remove_ext_adv_instance_sync(struct hci_dev *hdev, u8 instance);
 void hci_clear_adv_instance_sync(struct hci_dev *hdev, struct sock *sk,
 				 u8 instance, bool force);
 int hci_disable_advertising_sync(struct hci_dev *hdev);
+
+int hci_update_background_scan_sync(struct hci_dev *hdev);
diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 55f5bd96f2a9..26ff1375d69b 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -6698,6 +6698,11 @@ static void device_added(struct sock *sk, struct hci_dev *hdev,
 	mgmt_event(MGMT_EV_DEVICE_ADDED, hdev, &ev, sizeof(ev), sk);
 }
 
+static int add_device_sync(struct hci_dev *hdev, void *data)
+{
+	return hci_update_background_scan_sync(hdev);
+}
+
 static int add_device(struct sock *sk, struct hci_dev *hdev,
 		      void *data, u16 len)
 {
@@ -6780,7 +6785,9 @@ static int add_device(struct sock *sk, struct hci_dev *hdev,
 			current_flags = params->current_flags;
 	}
 
-	hci_update_background_scan(hdev);
+	err = hci_cmd_sync_queue(hdev, add_device_sync, NULL, NULL);
+	if (err < 0)
+		goto unlock;
 
 added:
 	device_added(sk, hdev, &cp->addr.bdaddr, cp->addr.type, cp->action);
@@ -6807,6 +6814,11 @@ static void device_removed(struct sock *sk, struct hci_dev *hdev,
 	mgmt_event(MGMT_EV_DEVICE_REMOVED, hdev, &ev, sizeof(ev), sk);
 }
 
+static int remove_device_sync(struct hci_dev *hdev, void *data)
+{
+	return hci_update_background_scan_sync(hdev);
+}
+
 static int remove_device(struct sock *sk, struct hci_dev *hdev,
 			 void *data, u16 len)
 {
@@ -6886,7 +6898,6 @@ static int remove_device(struct sock *sk, struct hci_dev *hdev,
 		list_del(&params->action);
 		list_del(&params->list);
 		kfree(params);
-		hci_update_background_scan(hdev);
 
 		device_removed(sk, hdev, &cp->addr.bdaddr, cp->addr.type);
 	} else {
@@ -6923,10 +6934,10 @@ static int remove_device(struct sock *sk, struct hci_dev *hdev,
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

