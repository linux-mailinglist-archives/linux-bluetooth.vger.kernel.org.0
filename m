Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9015843D7D4
	for <lists+linux-bluetooth@lfdr.de>; Thu, 28 Oct 2021 01:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbhJ1ABe (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 27 Oct 2021 20:01:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbhJ1ABd (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 27 Oct 2021 20:01:33 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3B9FC061570
        for <linux-bluetooth@vger.kernel.org>; Wed, 27 Oct 2021 16:59:07 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id x66so4205299pfx.13
        for <linux-bluetooth@vger.kernel.org>; Wed, 27 Oct 2021 16:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=EGx9lfd6NA1i/+uzUY8Vf7ebPlrRDgYMbXfEPtWyYy8=;
        b=OQtB8jFkqF5T2NV4GsHpinAJGKnHNvh/TsUyaYI8WY5CmCuUEdFOw7ka/7HSE6WnLl
         xBqL+HdQExvsp1J+iPL/gb43cmRYt+cx1OGc0ZhvvsCwRckTOxWRY9VEVvwps1ZadYvN
         ciYHzxA9GK9Zb+UpnwcOfi7DaNqA8nIdVGBg/Zc5q0htU/IevForxchByDsGoEPX6VP/
         GLMdyNt/f9J3DYSld39343FAu6Sm4MCVgDyOXHfUA9wxmIqTi3dNdIVPGtw9va6/12pQ
         k5gzMT6e1S6eQSFr87IJ08E3gFvgVbJm05oSonZMPosus/eMn9B9mB47lEV1KUCWK9uM
         NRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EGx9lfd6NA1i/+uzUY8Vf7ebPlrRDgYMbXfEPtWyYy8=;
        b=Yx7/BZCFSFHVthYDdD2wNL8wiJRU5v46F1cV35r8QDLCE9DuAjdjrdSUaztQfKziB1
         4k27qLRR7Re4azS3VNoqZTZh6o1vAEpDX3fFvjYpLSe0VXegPuwp4SydYrvQq+EUX98L
         qEQ9qy0Nhf6nhcaX6NbYc4kDPL7zselQMc5fnnDJnvI/4HHz55slGRgQxntCVm+XLu9C
         A3xapB92ZZmjJun1mylxf1xwjxPZQLVDGb3T3iRgpDgHfWOyyLXKJoCBHXwriXeuq8oA
         E/QSKhCm6LgbVLuzNCTE+EdScEEBdvgrpk0dnYt2W62TQVRg+PHEvDw6zbCsaTTxjG9B
         Ti0Q==
X-Gm-Message-State: AOAM532KIpNu+GHJi/2JSMcISx+Yo6pbaR/PwwMWIrWfmN2aN5uTa4O9
        nsTeM5i9qL6AeRm/E5AI03j77I0wD/Y=
X-Google-Smtp-Source: ABdhPJzsAmW9rDBFqNosHE1QTa/C/mK5bjaR2lFN7o7hqTI1bBgd/HgUaVsO55NwcDhGnNvTBRrdIw==
X-Received: by 2002:aa7:8881:0:b0:47d:84cd:d6f0 with SMTP id z1-20020aa78881000000b0047d84cdd6f0mr784032pfe.74.1635379146649;
        Wed, 27 Oct 2021 16:59:06 -0700 (PDT)
Received: from lvondent-mobl4.intel.com (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id 142sm807908pgh.22.2021.10.27.16.59.06
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 16:59:06 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v8 07/23] Bluetooth: hci_sync: Convert MGMT_SET_POWERED
Date:   Wed, 27 Oct 2021 16:58:44 -0700
Message-Id: <20211027235900.1882863-8-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027235900.1882863-1-luiz.dentz@gmail.com>
References: <20211027235900.1882863-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This make use of hci_cmd_sync_queue when MGMT_SET_POWERED is used so all
commands are run within hdev->cmd_sync_work instead of
hdev->power_on_work and hdev->power_off_work.

In addition to that the power on sequence now takes into account if
local IRK needs to be programmed in the resolving list.

Tested with:

tools/mgmt-tester -s "Set powered"

Test Summary
------------
Set powered on - Success                             Passed
Set powered on - Invalid parameters 1                Passed
Set powered on - Invalid parameters 2                Passed
Set powered on - Invalid parameters 3                Passed
Set powered on - Invalid index                       Passed
Set powered on - Privacy and Advertising             Passed
Set powered off - Success                            Passed
Set powered off - Class of Device                    Passed
Set powered off - Invalid parameters 1               Passed
Set powered off - Invalid parameters 2               Passed
Set powered off - Invalid parameters 3               Passed
Total: 11, Passed: 11 (100.0%), Failed: 0, Not Run: 0

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 include/net/bluetooth/hci_sync.h |   6 +
 net/bluetooth/hci_core.c         |  45 ++-
 net/bluetooth/hci_request.c      |   3 +-
 net/bluetooth/hci_sync.c         | 584 ++++++++++++++++++++++++++++++-
 net/bluetooth/mgmt.c             | 145 ++++----
 5 files changed, 685 insertions(+), 98 deletions(-)

diff --git a/include/net/bluetooth/hci_sync.h b/include/net/bluetooth/hci_sync.h
index ec727eb18e90..00203077e656 100644
--- a/include/net/bluetooth/hci_sync.h
+++ b/include/net/bluetooth/hci_sync.h
@@ -66,3 +66,9 @@ int hci_disable_advertising_sync(struct hci_dev *hdev);
 
 int hci_update_passive_scan_sync(struct hci_dev *hdev);
 int hci_update_passive_scan(struct hci_dev *hdev);
+
+int hci_dev_open_sync(struct hci_dev *hdev);
+int hci_dev_close_sync(struct hci_dev *hdev);
+
+int hci_powered_update_sync(struct hci_dev *hdev);
+int hci_set_powered_sync(struct hci_dev *hdev, u8 val);
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 8c54b1d4d41b..420ed6a02337 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -1315,14 +1315,13 @@ static void hci_dev_get_bd_addr_from_property(struct hci_dev *hdev)
 	bacpy(&hdev->public_addr, &ba);
 }
 
-static int hci_dev_do_open(struct hci_dev *hdev)
+/* TODO: Move this function into hci_sync.c */
+int hci_dev_open_sync(struct hci_dev *hdev)
 {
 	int ret = 0;
 
 	BT_DBG("%s %p", hdev->name, hdev);
 
-	hci_req_sync_lock(hdev);
-
 	if (hci_dev_test_flag(hdev, HCI_UNREGISTER)) {
 		ret = -ENODEV;
 		goto done;
@@ -1489,8 +1488,7 @@ static int hci_dev_do_open(struct hci_dev *hdev)
 		    !hci_dev_test_flag(hdev, HCI_USER_CHANNEL) &&
 		    hci_dev_test_flag(hdev, HCI_MGMT) &&
 		    hdev->dev_type == HCI_PRIMARY) {
-			ret = __hci_req_hci_power_on(hdev);
-			mgmt_power_on(hdev, ret);
+			ret = hci_powered_update_sync(hdev);
 		}
 	} else {
 		/* Init failed, cleanup */
@@ -1522,6 +1520,19 @@ static int hci_dev_do_open(struct hci_dev *hdev)
 	}
 
 done:
+	return ret;
+}
+
+static int hci_dev_do_open(struct hci_dev *hdev)
+{
+	int ret = 0;
+
+	BT_DBG("%s %p", hdev->name, hdev);
+
+	hci_req_sync_lock(hdev);
+
+	ret = hci_dev_open_sync(hdev);
+
 	hci_req_sync_unlock(hdev);
 	return ret;
 }
@@ -1600,7 +1611,8 @@ static void hci_pend_le_actions_clear(struct hci_dev *hdev)
 	BT_DBG("All LE pending actions cleared");
 }
 
-int hci_dev_do_close(struct hci_dev *hdev)
+/* TODO: Move this function into hci_sync.c */
+int hci_dev_close_sync(struct hci_dev *hdev)
 {
 	bool auto_off;
 	int err = 0;
@@ -1611,7 +1623,6 @@ int hci_dev_do_close(struct hci_dev *hdev)
 	cancel_delayed_work(&hdev->ncmd_timer);
 
 	hci_request_cancel_all(hdev);
-	hci_req_sync_lock(hdev);
 
 	if (!hci_dev_test_flag(hdev, HCI_UNREGISTER) &&
 	    !hci_dev_test_flag(hdev, HCI_USER_CHANNEL) &&
@@ -1623,7 +1634,6 @@ int hci_dev_do_close(struct hci_dev *hdev)
 
 	if (!test_and_clear_bit(HCI_UP, &hdev->flags)) {
 		cancel_delayed_work_sync(&hdev->cmd_timer);
-		hci_req_sync_unlock(hdev);
 		return err;
 	}
 
@@ -1729,9 +1739,22 @@ int hci_dev_do_close(struct hci_dev *hdev)
 	bacpy(&hdev->random_addr, BDADDR_ANY);
 	hci_codec_list_clear(&hdev->local_codecs);
 
+	hci_dev_put(hdev);
+	return err;
+}
+
+int hci_dev_do_close(struct hci_dev *hdev)
+{
+	int err;
+
+	BT_DBG("%s %p", hdev->name, hdev);
+
+	hci_req_sync_lock(hdev);
+
+	err = hci_dev_close_sync(hdev);
+
 	hci_req_sync_unlock(hdev);
 
-	hci_dev_put(hdev);
 	return err;
 }
 
@@ -2133,9 +2156,7 @@ static void hci_power_on(struct work_struct *work)
 	    hci_dev_test_flag(hdev, HCI_MGMT) &&
 	    hci_dev_test_and_clear_flag(hdev, HCI_AUTO_OFF)) {
 		cancel_delayed_work(&hdev->power_off);
-		hci_req_sync_lock(hdev);
-		err = __hci_req_hci_power_on(hdev);
-		hci_req_sync_unlock(hdev);
+		err = hci_powered_update_sync(hdev);
 		mgmt_power_on(hdev, err);
 		return;
 	}
diff --git a/net/bluetooth/hci_request.c b/net/bluetooth/hci_request.c
index cb36b2bd1109..46fa9c3bdb3e 100644
--- a/net/bluetooth/hci_request.c
+++ b/net/bluetooth/hci_request.c
@@ -1794,7 +1794,8 @@ int __hci_req_setup_ext_adv_instance(struct hci_request *req, u8 instance)
 
 	hci_req_add(req, HCI_OP_LE_SET_EXT_ADV_PARAMS, sizeof(cp), &cp);
 
-	if (own_addr_type == ADDR_LE_DEV_RANDOM &&
+	if ((own_addr_type == ADDR_LE_DEV_RANDOM ||
+	     own_addr_type == ADDR_LE_DEV_RANDOM_RESOLVED) &&
 	    bacmp(&random_addr, BDADDR_ANY)) {
 		struct hci_cp_le_set_adv_set_rand_addr cp;
 
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index 6d53a876de85..ee5de1f8d133 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -739,6 +739,17 @@ int hci_setup_ext_adv_instance_sync(struct hci_dev *hdev, u8 instance)
 			cp.evt_properties = cpu_to_le16(LE_LEGACY_NONCONN_IND);
 	}
 
+	/* If Own_Address_Type equals 0x02 or 0x03, the Peer_Address parameter
+	 * contains the peer’s Identity Address and the Peer_Address_Type
+	 * parameter contains the peer’s Identity Type (i.e., 0x00 or 0x01).
+	 * These parameters are used to locate the corresponding local IRK in
+	 * the resolving list; this IRK is used to generate their own address
+	 * used in the advertisement.
+	 */
+	if (own_addr_type == ADDR_LE_DEV_RANDOM_RESOLVED)
+		hci_copy_identity_address(hdev, &cp.peer_addr,
+					  &cp.peer_addr_type);
+
 	cp.own_addr_type = own_addr_type;
 	cp.channel_map = hdev->le_adv_channel_map;
 	cp.handle = instance;
@@ -1105,8 +1116,7 @@ int hci_schedule_adv_instance_sync(struct hci_dev *hdev, u8 instance,
 	struct adv_info *adv = NULL;
 	u16 timeout;
 
-	if (hci_dev_test_flag(hdev, HCI_ADVERTISING) ||
-	    list_empty(&hdev->adv_instances))
+	if (hci_dev_test_flag(hdev, HCI_ADVERTISING) && !ext_adv_capable(hdev))
 		return -EPERM;
 
 	if (hdev->adv_instance_timeout)
@@ -1474,7 +1484,9 @@ static int hci_le_del_accept_list_sync(struct hci_dev *hdev,
 	return 0;
 }
 
-/* Adds connection to resolve list if needed.*/
+/* Adds connection to resolve list if needed.
+ * Setting params to NULL programs local hdev->irk
+ */
 static int hci_le_add_resolve_list_sync(struct hci_dev *hdev,
 					struct hci_conn_params *params)
 {
@@ -1485,6 +1497,18 @@ static int hci_le_add_resolve_list_sync(struct hci_dev *hdev,
 	if (!use_ll_privacy(hdev))
 		return 0;
 
+	/* Attempt to program local identity address, type and irk if params is
+	 * NULL.
+	 */
+	if (!params) {
+		if (!hci_dev_test_flag(hdev, HCI_PRIVACY))
+			return 0;
+
+		hci_copy_identity_address(hdev, &cp.bdaddr, &cp.bdaddr_type);
+		memcpy(cp.peer_irk, hdev->irk, 16);
+		goto done;
+	}
+
 	irk = hci_find_irk_by_addr(hdev, &params->addr, params->addr_type);
 	if (!irk)
 		return 0;
@@ -1500,6 +1524,7 @@ static int hci_le_add_resolve_list_sync(struct hci_dev *hdev,
 	bacpy(&cp.bdaddr, &params->addr);
 	memcpy(cp.peer_irk, irk->val, 16);
 
+done:
 	if (hci_dev_test_flag(hdev, HCI_PRIVACY))
 		memcpy(cp.local_irk, hdev->irk, 16);
 	else
@@ -2040,3 +2065,556 @@ int hci_update_passive_scan(struct hci_dev *hdev)
 
 	return hci_cmd_sync_queue(hdev, update_passive_scan_sync, NULL, NULL);
 }
+
+static int hci_write_sc_support_sync(struct hci_dev *hdev, u8 val)
+{
+	if (!bredr_sc_enabled(hdev) || lmp_host_sc_capable(hdev))
+		return 0;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_WRITE_SC_SUPPORT,
+				    sizeof(val), &val, HCI_CMD_TIMEOUT);
+}
+
+static int hci_write_ssp_mode_sync(struct hci_dev *hdev, u8 mode)
+{
+	int err;
+
+	if (!hci_dev_test_flag(hdev, HCI_SSP_ENABLED) ||
+	    lmp_host_ssp_capable(hdev))
+		return 0;
+
+	err = __hci_cmd_sync_status(hdev, HCI_OP_WRITE_SSP_MODE,
+				    sizeof(mode), &mode, HCI_CMD_TIMEOUT);
+	if (err)
+		return err;
+
+	return hci_write_sc_support_sync(hdev, 0x01);
+}
+
+static int hci_write_le_host_supported_sync(struct hci_dev *hdev, u8 le,
+					    u8 simul)
+{
+	struct hci_cp_write_le_host_supported cp;
+
+	if (!hci_dev_test_flag(hdev, HCI_LE_ENABLED) ||
+	    !lmp_bredr_capable(hdev))
+		return 0;
+
+	/* Check first if we already have the right host state
+	 * (host features set)
+	 */
+	if (le == lmp_host_le_capable(hdev) &&
+	    simul == lmp_host_le_br_capable(hdev))
+		return 0;
+
+	memset(&cp, 0, sizeof(cp));
+
+	cp.le = le;
+	cp.simul = simul;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_WRITE_LE_HOST_SUPPORTED,
+				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+}
+
+static int hci_powered_update_adv_sync(struct hci_dev *hdev)
+{
+	struct adv_info *adv, *tmp;
+	int err;
+
+	if (!hci_dev_test_flag(hdev, HCI_LE_ENABLED))
+		return 0;
+
+	/* If RPA Resolution has not been enable yet it means the
+	 * resolving list is empty and we should attempt to program the
+	 * local IRK in order to support using own_addr_type
+	 * ADDR_LE_DEV_RANDOM_RESOLVED (0x03).
+	 */
+	if (!hci_dev_test_flag(hdev, HCI_LL_RPA_RESOLUTION)) {
+		hci_le_add_resolve_list_sync(hdev, NULL);
+		hci_le_set_addr_resolution_enable_sync(hdev, 0x01);
+	}
+
+	/* Make sure the controller has a good default for
+	 * advertising data. This also applies to the case
+	 * where BR/EDR was toggled during the AUTO_OFF phase.
+	 */
+	if (hci_dev_test_flag(hdev, HCI_ADVERTISING) ||
+	    list_empty(&hdev->adv_instances)) {
+		if (ext_adv_capable(hdev)) {
+			err = hci_setup_ext_adv_instance_sync(hdev, 0x00);
+			if (!err)
+				hci_update_scan_rsp_data_sync(hdev, 0x00);
+		} else {
+			err = hci_update_adv_data_sync(hdev, 0x00);
+			if (!err)
+				hci_update_scan_rsp_data_sync(hdev, 0x00);
+		}
+
+		if (hci_dev_test_flag(hdev, HCI_ADVERTISING))
+			hci_enable_advertising_sync(hdev);
+	}
+
+	/* Call for each tracked instance to be scheduled */
+	list_for_each_entry_safe(adv, tmp, &hdev->adv_instances, list)
+		hci_schedule_adv_instance_sync(hdev, adv->instance, true);
+
+	return 0;
+}
+
+static int hci_write_auth_enable_sync(struct hci_dev *hdev)
+{
+	u8 link_sec;
+
+	link_sec = hci_dev_test_flag(hdev, HCI_LINK_SECURITY);
+	if (link_sec == test_bit(HCI_AUTH, &hdev->flags))
+		return 0;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_WRITE_AUTH_ENABLE,
+				     sizeof(link_sec), &link_sec,
+				     HCI_CMD_TIMEOUT);
+}
+
+static int hci_write_fast_connectable_sync(struct hci_dev *hdev, bool enable)
+{
+	struct hci_cp_write_page_scan_activity cp;
+	u8 type;
+	int err = 0;
+
+	if (!hci_dev_test_flag(hdev, HCI_BREDR_ENABLED))
+		return 0;
+
+	if (hdev->hci_ver < BLUETOOTH_VER_1_2)
+		return 0;
+
+	memset(&cp, 0, sizeof(cp));
+
+	if (enable) {
+		type = PAGE_SCAN_TYPE_INTERLACED;
+
+		/* 160 msec page scan interval */
+		cp.interval = cpu_to_le16(0x0100);
+	} else {
+		type = hdev->def_page_scan_type;
+		cp.interval = cpu_to_le16(hdev->def_page_scan_int);
+	}
+
+	cp.window = cpu_to_le16(hdev->def_page_scan_window);
+
+	if (__cpu_to_le16(hdev->page_scan_interval) != cp.interval ||
+	    __cpu_to_le16(hdev->page_scan_window) != cp.window) {
+		err = __hci_cmd_sync_status(hdev,
+					    HCI_OP_WRITE_PAGE_SCAN_ACTIVITY,
+					    sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+		if (err)
+			return err;
+	}
+
+	if (hdev->page_scan_type != type)
+		err = __hci_cmd_sync_status(hdev,
+					    HCI_OP_WRITE_PAGE_SCAN_TYPE,
+					    sizeof(type), &type,
+					    HCI_CMD_TIMEOUT);
+
+	return err;
+}
+
+static bool disconnected_accept_list_entries(struct hci_dev *hdev)
+{
+	struct bdaddr_list *b;
+
+	list_for_each_entry(b, &hdev->accept_list, list) {
+		struct hci_conn *conn;
+
+		conn = hci_conn_hash_lookup_ba(hdev, ACL_LINK, &b->bdaddr);
+		if (!conn)
+			return true;
+
+		if (conn->state != BT_CONNECTED && conn->state != BT_CONFIG)
+			return true;
+	}
+
+	return false;
+}
+
+static int hci_write_scan_enable_sync(struct hci_dev *hdev, u8 val)
+{
+	return __hci_cmd_sync_status(hdev, HCI_OP_WRITE_SCAN_ENABLE,
+					    sizeof(val), &val,
+					    HCI_CMD_TIMEOUT);
+}
+
+static int hci_update_scan_sync(struct hci_dev *hdev)
+{
+	u8 scan;
+
+	if (!hci_dev_test_flag(hdev, HCI_BREDR_ENABLED))
+		return 0;
+
+	if (!hdev_is_powered(hdev))
+		return 0;
+
+	if (mgmt_powering_down(hdev))
+		return 0;
+
+	if (hdev->scanning_paused)
+		return 0;
+
+	if (hci_dev_test_flag(hdev, HCI_CONNECTABLE) ||
+	    disconnected_accept_list_entries(hdev))
+		scan = SCAN_PAGE;
+	else
+		scan = SCAN_DISABLED;
+
+	if (hci_dev_test_flag(hdev, HCI_DISCOVERABLE))
+		scan |= SCAN_INQUIRY;
+
+	if (test_bit(HCI_PSCAN, &hdev->flags) == !!(scan & SCAN_PAGE) &&
+	    test_bit(HCI_ISCAN, &hdev->flags) == !!(scan & SCAN_INQUIRY))
+		return 0;
+
+	return hci_write_scan_enable_sync(hdev, scan);
+}
+
+static int hci_update_name_sync(struct hci_dev *hdev)
+{
+	struct hci_cp_write_local_name cp;
+
+	memset(&cp, 0, sizeof(cp));
+
+	memcpy(cp.name, hdev->dev_name, sizeof(cp.name));
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_WRITE_LOCAL_NAME,
+					    sizeof(cp), &cp,
+					    HCI_CMD_TIMEOUT);
+}
+
+/* This function perform powered update HCI command sequence after the HCI init
+ * sequence which end up resetting all states, the sequence is as follows:
+ *
+ * HCI_SSP_ENABLED(Enable SSP)
+ * HCI_LE_ENABLED(Enable LE)
+ * HCI_LE_ENABLED(use_ll_privacy(Add local IRK to Resolving List) ->
+ * Update adv data)
+ * Enable Authentication
+ * lmp_bredr_capable(Set Fast Connectable -> Set Scan Type -> Set Class ->
+ * Set Name -> Set EIR)
+ */
+int hci_powered_update_sync(struct hci_dev *hdev)
+{
+	int err;
+
+	/* Register the available SMP channels (BR/EDR and LE) only when
+	 * successfully powering on the controller. This late
+	 * registration is required so that LE SMP can clearly decide if
+	 * the public address or static address is used.
+	 */
+	smp_register(hdev);
+
+	err = hci_write_ssp_mode_sync(hdev, 0x01);
+	if (err)
+		return err;
+
+	err = hci_write_le_host_supported_sync(hdev, 0x01, 0x00);
+	if (err)
+		return err;
+
+	err = hci_powered_update_adv_sync(hdev);
+	if (err)
+		return err;
+
+	err = hci_write_auth_enable_sync(hdev);
+	if (err)
+		return err;
+
+	if (lmp_bredr_capable(hdev)) {
+		if (hci_dev_test_flag(hdev, HCI_FAST_CONNECTABLE))
+			hci_write_fast_connectable_sync(hdev, true);
+		else
+			hci_write_fast_connectable_sync(hdev, false);
+		hci_update_scan_sync(hdev);
+		hci_update_class_sync(hdev);
+		hci_update_name_sync(hdev);
+		hci_update_eir_sync(hdev);
+	}
+
+	return 0;
+}
+
+/* This function perform power on HCI command sequence as follows:
+ *
+ * If controller is already up (HCI_UP) performs hci_powered_update_sync
+ * sequence otherwise run hci_dev_open_sync which will follow with
+ * hci_powered_update_sync after the init sequence is completed.
+ */
+static int hci_power_on_sync(struct hci_dev *hdev)
+{
+	int err;
+
+	if (test_bit(HCI_UP, &hdev->flags) &&
+	    hci_dev_test_flag(hdev, HCI_MGMT) &&
+	    hci_dev_test_and_clear_flag(hdev, HCI_AUTO_OFF)) {
+		cancel_delayed_work(&hdev->power_off);
+		return hci_powered_update_sync(hdev);
+	}
+
+	err = hci_dev_open_sync(hdev);
+	if (err < 0)
+		return err;
+
+	/* During the HCI setup phase, a few error conditions are
+	 * ignored and they need to be checked now. If they are still
+	 * valid, it is important to return the device back off.
+	 */
+	if (hci_dev_test_flag(hdev, HCI_RFKILLED) ||
+	    hci_dev_test_flag(hdev, HCI_UNCONFIGURED) ||
+	    (hdev->dev_type == HCI_PRIMARY &&
+	     !bacmp(&hdev->bdaddr, BDADDR_ANY) &&
+	     !bacmp(&hdev->static_addr, BDADDR_ANY))) {
+		hci_dev_clear_flag(hdev, HCI_AUTO_OFF);
+		hci_dev_close_sync(hdev);
+	} else if (hci_dev_test_flag(hdev, HCI_AUTO_OFF)) {
+		queue_delayed_work(hdev->req_workqueue, &hdev->power_off,
+				   HCI_AUTO_OFF_TIMEOUT);
+	}
+
+	if (hci_dev_test_and_clear_flag(hdev, HCI_SETUP)) {
+		/* For unconfigured devices, set the HCI_RAW flag
+		 * so that userspace can easily identify them.
+		 */
+		if (hci_dev_test_flag(hdev, HCI_UNCONFIGURED))
+			set_bit(HCI_RAW, &hdev->flags);
+
+		/* For fully configured devices, this will send
+		 * the Index Added event. For unconfigured devices,
+		 * it will send Unconfigued Index Added event.
+		 *
+		 * Devices with HCI_QUIRK_RAW_DEVICE are ignored
+		 * and no event will be send.
+		 */
+		mgmt_index_added(hdev);
+	} else if (hci_dev_test_and_clear_flag(hdev, HCI_CONFIG)) {
+		/* When the controller is now configured, then it
+		 * is important to clear the HCI_RAW flag.
+		 */
+		if (!hci_dev_test_flag(hdev, HCI_UNCONFIGURED))
+			clear_bit(HCI_RAW, &hdev->flags);
+
+		/* Powering on the controller with HCI_CONFIG set only
+		 * happens with the transition from unconfigured to
+		 * configured. This will send the Index Added event.
+		 */
+		mgmt_index_added(hdev);
+	}
+
+	return 0;
+}
+
+static int hci_remote_name_cancel_sync(struct hci_dev *hdev, bdaddr_t *addr)
+{
+	struct hci_cp_remote_name_req_cancel cp;
+
+	memset(&cp, 0, sizeof(cp));
+	bacpy(&cp.bdaddr, addr);
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_REMOTE_NAME_REQ_CANCEL,
+				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+}
+
+static int hci_stop_discovery_sync(struct hci_dev *hdev)
+{
+	struct discovery_state *d = &hdev->discovery;
+	struct inquiry_entry *e;
+	int err;
+
+	bt_dev_dbg(hdev, "state %u", hdev->discovery.state);
+
+	if (d->state == DISCOVERY_FINDING || d->state == DISCOVERY_STOPPING) {
+		if (test_bit(HCI_INQUIRY, &hdev->flags)) {
+			err = __hci_cmd_sync_status(hdev, HCI_OP_INQUIRY_CANCEL,
+						    0, NULL, HCI_CMD_TIMEOUT);
+			if (err)
+				return err;
+		}
+
+		if (hci_dev_test_flag(hdev, HCI_LE_SCAN)) {
+			cancel_delayed_work(&hdev->le_scan_disable);
+			cancel_delayed_work(&hdev->le_scan_restart);
+
+			err = hci_scan_disable_sync(hdev);
+			if (err)
+				return err;
+		}
+
+	} else {
+		err = hci_scan_disable_sync(hdev);
+		if (err)
+			return err;
+	}
+
+	/* No further actions needed for LE-only discovery */
+	if (d->type == DISCOV_TYPE_LE)
+		return 0;
+
+	if (d->state == DISCOVERY_RESOLVING || d->state == DISCOVERY_STOPPING) {
+		e = hci_inquiry_cache_lookup_resolve(hdev, BDADDR_ANY,
+						     NAME_PENDING);
+		if (!e)
+			return 0;
+
+		return hci_remote_name_cancel_sync(hdev, &e->data.bdaddr);
+	}
+
+	return 0;
+}
+
+static int hci_disconnect_phy_link_sync(struct hci_dev *hdev, u16 handle,
+					u8 reason)
+{
+	struct hci_cp_disconn_phy_link cp;
+
+	memset(&cp, 0, sizeof(cp));
+	cp.phy_handle = HCI_PHY_HANDLE(handle);
+	cp.reason = reason;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_DISCONN_PHY_LINK,
+				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+}
+
+static int hci_disconnect_sync(struct hci_dev *hdev, struct hci_conn *conn,
+			       u8 reason)
+{
+	struct hci_cp_disconnect cp;
+
+	if (conn->type == AMP_LINK)
+		return hci_disconnect_phy_link_sync(hdev, conn->handle, reason);
+
+	memset(&cp, 0, sizeof(cp));
+	cp.handle = cpu_to_le16(conn->handle);
+	cp.reason = reason;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_DISCONNECT,
+				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+}
+
+static int hci_le_connect_cancel_sync(struct hci_dev *hdev,
+				      struct hci_conn *conn)
+{
+	if (test_bit(HCI_CONN_SCANNING, &conn->flags))
+		return 0;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_LE_CREATE_CONN_CANCEL,
+				     6, &conn->dst, HCI_CMD_TIMEOUT);
+}
+
+static int hci_connect_cancel_sync(struct hci_dev *hdev, struct hci_conn *conn)
+{
+	if (conn->type == LE_LINK)
+		return hci_le_connect_cancel_sync(hdev, conn);
+
+	if (hdev->hci_ver < BLUETOOTH_VER_1_2)
+		return 0;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_CREATE_CONN_CANCEL,
+				     6, &conn->dst, HCI_CMD_TIMEOUT);
+}
+
+static int hci_reject_sco_sync(struct hci_dev *hdev, struct hci_conn *conn,
+			       u8 reason)
+{
+	struct hci_cp_reject_sync_conn_req cp;
+
+	memset(&cp, 0, sizeof(cp));
+	bacpy(&cp.bdaddr, &conn->dst);
+	cp.reason = reason;
+
+	/* SCO rejection has its own limited set of
+	 * allowed error values (0x0D-0x0F).
+	 */
+	if (reason < 0x0d || reason > 0x0f)
+		cp.reason = HCI_ERROR_REJ_LIMITED_RESOURCES;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_REJECT_SYNC_CONN_REQ,
+				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+}
+
+static int hci_reject_conn_sync(struct hci_dev *hdev, struct hci_conn *conn,
+				u8 reason)
+{
+	struct hci_cp_reject_conn_req cp;
+
+	if (conn->type == SCO_LINK || conn->type == ESCO_LINK)
+		return hci_reject_sco_sync(hdev, conn, reason);
+
+	memset(&cp, 0, sizeof(cp));
+	bacpy(&cp.bdaddr, &conn->dst);
+	cp.reason = reason;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_REJECT_CONN_REQ,
+				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+}
+
+static int hci_abort_conn_sync(struct hci_dev *hdev, struct hci_conn *conn,
+			       u8 reason)
+{
+	switch (conn->state) {
+	case BT_CONNECTED:
+	case BT_CONFIG:
+		return hci_disconnect_sync(hdev, conn, reason);
+	case BT_CONNECT:
+		return hci_connect_cancel_sync(hdev, conn);
+	case BT_CONNECT2:
+		return hci_reject_conn_sync(hdev, conn, reason);
+	default:
+		conn->state = BT_CLOSED;
+		break;
+	}
+
+	return 0;
+}
+
+/* This function perform power off HCI command sequence as follows:
+ *
+ * Clear Advertising
+ * Stop Discovery
+ * Disconnect all connections
+ * hci_dev_close_sync
+ */
+static int hci_power_off_sync(struct hci_dev *hdev)
+{
+	struct hci_conn *conn;
+	int err;
+
+	/* If controller is already down there is nothing to do */
+	if (!test_bit(HCI_UP, &hdev->flags))
+		return 0;
+
+	if (test_bit(HCI_ISCAN, &hdev->flags) ||
+	    test_bit(HCI_PSCAN, &hdev->flags)) {
+		err = hci_write_scan_enable_sync(hdev, 0x00);
+		if (err)
+			return err;
+	}
+
+	err = hci_clear_adv_sync(hdev, NULL, false);
+	if (err)
+		return err;
+
+	err = hci_stop_discovery_sync(hdev);
+	if (err)
+		return err;
+
+	list_for_each_entry(conn, &hdev->conn_hash.list, list) {
+		/* 0x15 == Terminated due to Power Off */
+		hci_abort_conn_sync(hdev, conn, 0x15);
+	}
+
+	return hci_dev_close_sync(hdev);
+}
+
+int hci_set_powered_sync(struct hci_dev *hdev, u8 val)
+{
+	if (val)
+		return hci_power_on_sync(hdev);
+
+	return hci_power_off_sync(hdev);
+}
diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index d09a757a5851..9490663ee3fb 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -1155,16 +1155,6 @@ static int send_settings_rsp(struct sock *sk, u16 opcode, struct hci_dev *hdev)
 				 sizeof(settings));
 }
 
-static void clean_up_hci_complete(struct hci_dev *hdev, u8 status, u16 opcode)
-{
-	bt_dev_dbg(hdev, "status 0x%02x", status);
-
-	if (hci_conn_count(hdev) == 0) {
-		cancel_delayed_work(&hdev->power_off);
-		queue_work(hdev->req_workqueue, &hdev->power_off.work);
-	}
-}
-
 void mgmt_advertising_added(struct sock *sk, struct hci_dev *hdev, u8 instance)
 {
 	struct mgmt_ev_advertising_added ev;
@@ -1192,38 +1182,77 @@ static void cancel_adv_timeout(struct hci_dev *hdev)
 	}
 }
 
-static int clean_up_hci_state(struct hci_dev *hdev)
+/* This function requires the caller holds hdev->lock */
+static void restart_le_actions(struct hci_dev *hdev)
 {
-	struct hci_request req;
-	struct hci_conn *conn;
-	bool discov_stopped;
-	int err;
+	struct hci_conn_params *p;
 
-	hci_req_init(&req, hdev);
+	list_for_each_entry(p, &hdev->le_conn_params, list) {
+		/* Needed for AUTO_OFF case where might not "really"
+		 * have been powered off.
+		 */
+		list_del_init(&p->action);
 
-	if (test_bit(HCI_ISCAN, &hdev->flags) ||
-	    test_bit(HCI_PSCAN, &hdev->flags)) {
-		u8 scan = 0x00;
-		hci_req_add(&req, HCI_OP_WRITE_SCAN_ENABLE, 1, &scan);
+		switch (p->auto_connect) {
+		case HCI_AUTO_CONN_DIRECT:
+		case HCI_AUTO_CONN_ALWAYS:
+			list_add(&p->action, &hdev->pend_le_conns);
+			break;
+		case HCI_AUTO_CONN_REPORT:
+			list_add(&p->action, &hdev->pend_le_reports);
+			break;
+		default:
+			break;
+		}
 	}
+}
 
-	hci_req_clear_adv_instance(hdev, NULL, NULL, 0x00, false);
+static int new_settings(struct hci_dev *hdev, struct sock *skip)
+{
+	__le32 ev = cpu_to_le32(get_current_settings(hdev));
 
-	if (hci_dev_test_flag(hdev, HCI_LE_ADV))
-		__hci_req_disable_advertising(&req);
+	return mgmt_limited_event(MGMT_EV_NEW_SETTINGS, hdev, &ev,
+				  sizeof(ev), HCI_MGMT_SETTING_EVENTS, skip);
+}
+
+static void mgmt_set_powered_complete(struct hci_dev *hdev, void *data, int err)
+{
+	struct mgmt_pending_cmd *cmd = data;
+	struct mgmt_mode *cp = cmd->param;
+
+	bt_dev_dbg(hdev, "err %d", err);
 
-	discov_stopped = hci_req_stop_discovery(&req);
+	if (!err) {
+		if (cp->val) {
+			hci_dev_lock(hdev);
+			restart_le_actions(hdev);
+			hci_update_passive_scan(hdev);
+			hci_dev_unlock(hdev);
+		}
+
+		send_settings_rsp(cmd->sk, cmd->opcode, hdev);
 
-	list_for_each_entry(conn, &hdev->conn_hash.list, list) {
-		/* 0x15 == Terminated due to Power Off */
-		__hci_abort_conn(&req, conn, 0x15);
+		/* Only call new_setting for power on as power off is deferred
+		 * to hdev->power_off work which does call hci_dev_do_close.
+		 */
+		if (cp->val)
+			new_settings(hdev, cmd->sk);
+	} else {
+		mgmt_cmd_status(cmd->sk, hdev->id, MGMT_OP_SET_POWERED,
+				mgmt_status(err));
 	}
 
-	err = hci_req_run(&req, clean_up_hci_complete);
-	if (!err && discov_stopped)
-		hci_discovery_set_state(hdev, DISCOVERY_STOPPING);
+	mgmt_pending_free(cmd);
+}
 
-	return err;
+static int set_powered_sync(struct hci_dev *hdev, void *data)
+{
+	struct mgmt_pending_cmd *cmd = data;
+	struct mgmt_mode *cp = cmd->param;
+
+	BT_DBG("%s", hdev->name);
+
+	return hci_set_powered_sync(hdev, cp->val);
 }
 
 static int set_powered(struct sock *sk, struct hci_dev *hdev, void *data,
@@ -1252,43 +1281,20 @@ static int set_powered(struct sock *sk, struct hci_dev *hdev, void *data,
 		goto failed;
 	}
 
-	cmd = mgmt_pending_add(sk, MGMT_OP_SET_POWERED, hdev, data, len);
+	cmd = mgmt_pending_new(sk, MGMT_OP_SET_POWERED, hdev, data, len);
 	if (!cmd) {
 		err = -ENOMEM;
 		goto failed;
 	}
 
-	if (cp->val) {
-		queue_work(hdev->req_workqueue, &hdev->power_on);
-		err = 0;
-	} else {
-		/* Disconnect connections, stop scans, etc */
-		err = clean_up_hci_state(hdev);
-		if (!err)
-			queue_delayed_work(hdev->req_workqueue, &hdev->power_off,
-					   HCI_POWER_OFF_TIMEOUT);
-
-		/* ENODATA means there were no HCI commands queued */
-		if (err == -ENODATA) {
-			cancel_delayed_work(&hdev->power_off);
-			queue_work(hdev->req_workqueue, &hdev->power_off.work);
-			err = 0;
-		}
-	}
+	err = hci_cmd_sync_queue(hdev, set_powered_sync, cmd,
+				 mgmt_set_powered_complete);
 
 failed:
 	hci_dev_unlock(hdev);
 	return err;
 }
 
-static int new_settings(struct hci_dev *hdev, struct sock *skip)
-{
-	__le32 ev = cpu_to_le32(get_current_settings(hdev));
-
-	return mgmt_limited_event(MGMT_EV_NEW_SETTINGS, hdev, &ev,
-				  sizeof(ev), HCI_MGMT_SETTING_EVENTS, skip);
-}
-
 int mgmt_new_settings(struct hci_dev *hdev)
 {
 	return new_settings(hdev, NULL);
@@ -8720,31 +8726,6 @@ void mgmt_index_removed(struct hci_dev *hdev)
 			 HCI_MGMT_EXT_INDEX_EVENTS);
 }
 
-/* This function requires the caller holds hdev->lock */
-static void restart_le_actions(struct hci_dev *hdev)
-{
-	struct hci_conn_params *p;
-
-	list_for_each_entry(p, &hdev->le_conn_params, list) {
-		/* Needed for AUTO_OFF case where might not "really"
-		 * have been powered off.
-		 */
-		list_del_init(&p->action);
-
-		switch (p->auto_connect) {
-		case HCI_AUTO_CONN_DIRECT:
-		case HCI_AUTO_CONN_ALWAYS:
-			list_add(&p->action, &hdev->pend_le_conns);
-			break;
-		case HCI_AUTO_CONN_REPORT:
-			list_add(&p->action, &hdev->pend_le_reports);
-			break;
-		default:
-			break;
-		}
-	}
-}
-
 void mgmt_power_on(struct hci_dev *hdev, int err)
 {
 	struct cmd_lookup match = { NULL, hdev };
-- 
2.31.1

