Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1F3243D7D2
	for <lists+linux-bluetooth@lfdr.de>; Thu, 28 Oct 2021 01:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbhJ1ABd (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 27 Oct 2021 20:01:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbhJ1ABc (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 27 Oct 2021 20:01:32 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54EF8C061570
        for <linux-bluetooth@vger.kernel.org>; Wed, 27 Oct 2021 16:59:06 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id c4so4543799pgv.11
        for <linux-bluetooth@vger.kernel.org>; Wed, 27 Oct 2021 16:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=l38ss3yI/Eu2taGaFqywoCQlEW6f/raQThpSUiCvaWo=;
        b=Kn5Tiyj8tgPZjfc1cvYd+JmjSLsxYwTmNNL9E/eDAgWd26654zL1gPTIThWsZOGNZT
         rtPMrXZpYFcTtDDFMFEgfKbX/SbiLdk/MA0Z/4cCrRs9nII60VMqIk1vbxVeh2gjlBGP
         4/BsIxM6fUbxzAKJkcoP/8MW9ms2l1rNOuTKg+nQ+bhroVbzEUCdNSKveEXL7GTcXiX8
         sFxFXVtKsEiV8gs7gqthn6T+9T6HD0EKP+F4aADTo9qAqjB7Z3IEG4neUKJlCW2RNTXY
         zSd1ijHgKgbdAsEBTS1KPuxJ3qarkTtbQeTssyBNIDZkvMllbKgYN9zRDciQSfC8axat
         Y4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l38ss3yI/Eu2taGaFqywoCQlEW6f/raQThpSUiCvaWo=;
        b=VEpMfYkFfJaPG2Kn3ozgkhnNnPuWKu+J2+jB46kjPogniAn8vNtaKnwYxh35iT+SvE
         s8FUB090SqVfzEBluqDZbrEaRpI8Zmec0BEmBZxOnyiBN6BBT8SdAGxomdfHNYecFJib
         BQpNiOFfja7FyI3adLMca7hHKcrxRk26HaT4pqNT/XJr/7wyLXZe6ClQohD2MIKSyR/p
         neSXgRigFqwKi+s60qFf2LtLOT9M8/IuDQc1tj2RFWjZjf8p7vAE68p/TwZsBs/vnGay
         jN/8YQMZet+rdklgZemBQZWNzzLPhyP8qhpwtwAKu0tR6dOmqc4XiL48Wo891TqveAwP
         eEOg==
X-Gm-Message-State: AOAM530jZg5tgg24CGccsrN0xYskFArHFuLhxpIeJoYQxW4jvtBsL1sc
        Z725js+SwwUTuuHtYnpIZAeZKJ0pkuE=
X-Google-Smtp-Source: ABdhPJx7E7WsTmUDozxPVBGTE+O0rxjZst1ftyPR8FcORUZJIYYcooPyT59JpfmRsdAw4RI7u8EneA==
X-Received: by 2002:aa7:8b49:0:b0:44d:65a9:fb9d with SMTP id i9-20020aa78b49000000b0044d65a9fb9dmr738853pfd.24.1635379145167;
        Wed, 27 Oct 2021 16:59:05 -0700 (PDT)
Received: from lvondent-mobl4.intel.com (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id 142sm807908pgh.22.2021.10.27.16.59.04
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 16:59:04 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v8 05/23] Bluetooth: hci_sync: Enable advertising when LL privacy is enabled
Date:   Wed, 27 Oct 2021 16:58:42 -0700
Message-Id: <20211027235900.1882863-6-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027235900.1882863-1-luiz.dentz@gmail.com>
References: <20211027235900.1882863-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This enables advertising when LL privacy is enabled and changes the
command sequence when resolving list is updated to also account for when
advertising is enabled using the following sequence:

If there are devices to scan:

Disable Scanning -> Update Accept List ->
use_ll_privacy((Disable Advertising) -> Disable Resolving List ->
Update Resolving List -> Enable Resolving List -> (Enable Advertising)) ->
Enable Scanning

Otherwise:

Disable Scanning

Errors during the Update Accept List stage are handled gracefully by
restoring any previous state (e.g. advertising) and disabling the use of
accept list as either accept list or resolving list could not be
updated.

Tested with:

mgmt-tester -s "LL Privacy"

Test Summary
------------
LL Privacy - Add Device 1 (Add to WL)                Passed
LL Privacy - Add Device 2 (Add to RL)                Passed
LL Privacy - Add Device 3 (Enable RL)                Passed
LL Privacy - Add Device 4 (2 Devices to WL)          Passed
LL Privacy - Add Device 5 (2 Devices to RL)          Passed
LL Privacy - Add Device 6 (RL is full)               Passed
LL Privacy - Add Device 7 (WL is full)               Passed
LL Privacy - Add Device 8 (Disable Adv)              Passed
LL Privacy - Add Device 9 (Multi Adv)                Passed
LL Privacy - Add Device 10 (Multi Dev and Multi Adv) Passed
LL Privacy - Remove Device 1 (Remove from WL)        Passed
LL Privacy - Remove Device 2 (Remove from RL)        Passed
LL Privacy - Remove Device 3 (Disable RL)            Passed
LL Privacy - Remove Device 4 (Disable Adv)           Passed
LL Privacy - Remove Device 5 (Multi Adv)             Passed
LL Privacy - Start Discovery 1 (Disable RL)          Passed
LL Privacy - Start Discovery 2 (Disable RL)          Passed
Total: 18, Passed: 18 (100.0%), Failed: 0, Not Run: 0

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 include/net/bluetooth/hci_core.h |   5 +-
 include/net/bluetooth/hci_sync.h |   1 +
 net/bluetooth/hci_event.c        |   4 +-
 net/bluetooth/hci_request.c      |  26 +--
 net/bluetooth/hci_sync.c         | 268 ++++++++++++++++++++++---------
 net/bluetooth/mgmt.c             |  39 +----
 6 files changed, 213 insertions(+), 130 deletions(-)

diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index 17ddea51d161..a6b075203cbe 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -1465,8 +1465,11 @@ void hci_conn_del_sysfs(struct hci_conn *conn);
 #define scan_coded(dev) (((dev)->le_tx_def_phys & HCI_LE_SET_PHY_CODED) || \
 			 ((dev)->le_rx_def_phys & HCI_LE_SET_PHY_CODED))
 
+#define ll_privacy_capable(dev) ((dev)->le_features[0] & HCI_LE_LL_PRIVACY)
+
 /* Use LL Privacy based address resolution if supported */
-#define use_ll_privacy(dev) ((dev)->le_features[0] & HCI_LE_LL_PRIVACY)
+#define use_ll_privacy(dev) (ll_privacy_capable(dev) && \
+			     hci_dev_test_flag(dev, HCI_ENABLE_LL_PRIVACY))
 
 /* Use enhanced synchronous connection if command is supported */
 #define enhanced_sco_capable(dev) ((dev)->commands[29] & 0x08)
diff --git a/include/net/bluetooth/hci_sync.h b/include/net/bluetooth/hci_sync.h
index b0708f900d89..ec727eb18e90 100644
--- a/include/net/bluetooth/hci_sync.h
+++ b/include/net/bluetooth/hci_sync.h
@@ -65,3 +65,4 @@ int hci_remove_advertising_sync(struct hci_dev *hdev, struct sock *sk,
 int hci_disable_advertising_sync(struct hci_dev *hdev);
 
 int hci_update_passive_scan_sync(struct hci_dev *hdev);
+int hci_update_passive_scan(struct hci_dev *hdev);
diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 0cdbd1648572..ed2e65a4adb8 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -5499,9 +5499,7 @@ static void hci_le_enh_conn_complete_evt(struct hci_dev *hdev,
 			     le16_to_cpu(ev->latency),
 			     le16_to_cpu(ev->supervision_timeout));
 
-	if (use_ll_privacy(hdev) &&
-	    hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY) &&
-	    hci_dev_test_flag(hdev, HCI_LL_RPA_RESOLUTION))
+	if (hci_dev_test_flag(hdev, HCI_LL_RPA_RESOLUTION))
 		hci_req_disable_address_resolution(hdev);
 }
 
diff --git a/net/bluetooth/hci_request.c b/net/bluetooth/hci_request.c
index b1b33432c68d..cb36b2bd1109 100644
--- a/net/bluetooth/hci_request.c
+++ b/net/bluetooth/hci_request.c
@@ -511,9 +511,7 @@ void hci_req_add_le_scan_disable(struct hci_request *req, bool rpa_le_conn)
 	}
 
 	/* Disable address resolution */
-	if (use_ll_privacy(hdev) &&
-	    hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY) &&
-	    hci_dev_test_flag(hdev, HCI_LL_RPA_RESOLUTION) && !rpa_le_conn) {
+	if (hci_dev_test_flag(hdev, HCI_LL_RPA_RESOLUTION) && !rpa_le_conn) {
 		__u8 enable = 0x00;
 
 		hci_req_add(req, HCI_OP_LE_SET_ADDR_RESOLV_ENABLE, 1, &enable);
@@ -532,8 +530,7 @@ static void del_from_accept_list(struct hci_request *req, bdaddr_t *bdaddr,
 		   cp.bdaddr_type);
 	hci_req_add(req, HCI_OP_LE_DEL_FROM_ACCEPT_LIST, sizeof(cp), &cp);
 
-	if (use_ll_privacy(req->hdev) &&
-	    hci_dev_test_flag(req->hdev, HCI_ENABLE_LL_PRIVACY)) {
+	if (use_ll_privacy(req->hdev)) {
 		struct smp_irk *irk;
 
 		irk = hci_find_irk_by_addr(req->hdev, bdaddr, bdaddr_type);
@@ -586,8 +583,7 @@ static int add_to_accept_list(struct hci_request *req,
 		   cp.bdaddr_type);
 	hci_req_add(req, HCI_OP_LE_ADD_TO_ACCEPT_LIST, sizeof(cp), &cp);
 
-	if (use_ll_privacy(hdev) &&
-	    hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY)) {
+	if (use_ll_privacy(hdev)) {
 		struct smp_irk *irk;
 
 		irk = hci_find_irk_by_addr(hdev, &params->addr,
@@ -626,8 +622,7 @@ static u8 update_accept_list(struct hci_request *req)
 	 */
 	bool allow_rpa = hdev->suspended;
 
-	if (use_ll_privacy(hdev) &&
-	    hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY))
+	if (use_ll_privacy(hdev))
 		allow_rpa = true;
 
 	/* Go through the current accept list programmed into the
@@ -716,9 +711,7 @@ static void hci_req_start_scan(struct hci_request *req, u8 type, u16 interval,
 		return;
 	}
 
-	if (use_ll_privacy(hdev) &&
-	    hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY) &&
-	    addr_resolv) {
+	if (use_ll_privacy(hdev) && addr_resolv) {
 		u8 enable = 0x01;
 
 		hci_req_add(req, HCI_OP_LE_SET_ADDR_RESOLV_ENABLE, 1, &enable);
@@ -1480,8 +1473,7 @@ void hci_req_disable_address_resolution(struct hci_dev *hdev)
 	struct hci_request req;
 	__u8 enable = 0x00;
 
-	if (!use_ll_privacy(hdev) &&
-	    !hci_dev_test_flag(hdev, HCI_LL_RPA_RESOLUTION))
+	if (!hci_dev_test_flag(hdev, HCI_LL_RPA_RESOLUTION))
 		return;
 
 	hci_req_init(&req, hdev);
@@ -1624,8 +1616,7 @@ int hci_get_random_address(struct hci_dev *hdev, bool require_privacy,
 		/* If Controller supports LL Privacy use own address type is
 		 * 0x03
 		 */
-		if (use_ll_privacy(hdev) &&
-		    hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY))
+		if (use_ll_privacy(hdev))
 			*own_addr_type = ADDR_LE_DEV_RANDOM_RESOLVED;
 		else
 			*own_addr_type = ADDR_LE_DEV_RANDOM;
@@ -2092,8 +2083,7 @@ int hci_update_random_address(struct hci_request *req, bool require_privacy,
 		/* If Controller supports LL Privacy use own address type is
 		 * 0x03
 		 */
-		if (use_ll_privacy(hdev) &&
-		    hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY))
+		if (use_ll_privacy(hdev))
 			*own_addr_type = ADDR_LE_DEV_RANDOM_RESOLVED;
 		else
 			*own_addr_type = ADDR_LE_DEV_RANDOM;
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index 94667efc4395..c9aba2fd0301 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -517,8 +517,7 @@ int hci_update_random_address_sync(struct hci_dev *hdev, bool require_privacy,
 		/* If Controller supports LL Privacy use own address type is
 		 * 0x03
 		 */
-		if (use_ll_privacy(hdev) &&
-		    hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY))
+		if (use_ll_privacy(hdev))
 			*own_addr_type = ADDR_LE_DEV_RANDOM_RESOLVED;
 		else
 			*own_addr_type = ADDR_LE_DEV_RANDOM;
@@ -931,6 +930,10 @@ int hci_enable_advertising_sync(struct hci_dev *hdev)
 	u32 flags;
 	u8 status;
 
+	if (ext_adv_capable(hdev))
+		return hci_enable_ext_advertising_sync(hdev,
+						       hdev->cur_adv_instance);
+
 	flags = hci_adv_instance_flags(hdev, hdev->cur_adv_instance);
 	adv_instance = hci_find_adv_instance(hdev, hdev->cur_adv_instance);
 
@@ -943,11 +946,9 @@ int hci_enable_advertising_sync(struct hci_dev *hdev)
 	if (!is_advertising_allowed(hdev, connectable))
 		return -EINVAL;
 
-	if (hci_dev_test_flag(hdev, HCI_LE_ADV)) {
-		status = hci_disable_advertising_sync(hdev);
-		if (status)
-			return status;
-	}
+	status = hci_disable_advertising_sync(hdev);
+	if (status)
+		return status;
 
 	/* Clear the HCI_LE_ADV bit temporarily so that the
 	 * hci_update_random_address knows that it's safe to go ahead
@@ -1284,6 +1285,10 @@ int hci_disable_advertising_sync(struct hci_dev *hdev)
 {
 	u8 enable = 0x00;
 
+	/* If controller is not advertising we are done. */
+	if (!hci_dev_test_flag(hdev, HCI_LE_ADV))
+		return 0;
+
 	if (ext_adv_capable(hdev))
 		return hci_disable_ext_adv_instance_sync(hdev, 0x00);
 
@@ -1322,15 +1327,18 @@ static int hci_le_set_scan_enable_sync(struct hci_dev *hdev, u8 val,
 
 static int hci_le_set_addr_resolution_enable_sync(struct hci_dev *hdev, u8 val)
 {
-	if (!use_ll_privacy(hdev) ||
-	    !hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY))
+	if (!use_ll_privacy(hdev))
+		return 0;
+
+	/* If controller is not/already resolving we are done. */
+	if (val == hci_dev_test_flag(hdev, HCI_LL_RPA_RESOLUTION))
 		return 0;
 
 	return __hci_cmd_sync_status(hdev, HCI_OP_LE_SET_ADDR_RESOLV_ENABLE,
 				     sizeof(val), &val, HCI_CMD_TIMEOUT);
 }
 
-int hci_scan_disable_sync(struct hci_dev *hdev, bool rpa_le_conn)
+int hci_scan_disable_sync(struct hci_dev *hdev)
 {
 	int err;
 
@@ -1352,13 +1360,6 @@ int hci_scan_disable_sync(struct hci_dev *hdev, bool rpa_le_conn)
 		return err;
 	}
 
-	if (rpa_le_conn) {
-		err = hci_le_set_addr_resolution_enable_sync(hdev, 0x00);
-		if (err)
-			bt_dev_err(hdev, "Unable to disable LL privacy: %d",
-				   err);
-	}
-
 	return err;
 }
 
@@ -1426,8 +1427,7 @@ static int hci_le_del_resolve_list_sync(struct hci_dev *hdev,
 	struct hci_cp_le_del_from_resolv_list cp;
 	struct bdaddr_list_with_irk *entry;
 
-	if (!use_ll_privacy(hdev) ||
-	    !hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY))
+	if (!use_ll_privacy(hdev))
 		return 0;
 
 	/* Check if the IRK has been programmed */
@@ -1456,6 +1456,11 @@ static int hci_le_del_accept_list_sync(struct hci_dev *hdev,
 	cp.bdaddr_type = bdaddr_type;
 	bacpy(&cp.bdaddr, bdaddr);
 
+	/* Ignore errors when removing from resolving list as that is likely
+	 * that the device was never added.
+	 */
+	hci_le_del_resolve_list_sync(hdev, &cp.bdaddr, cp.bdaddr_type);
+
 	err = __hci_cmd_sync_status(hdev, HCI_OP_LE_DEL_FROM_ACCEPT_LIST,
 				    sizeof(cp), &cp, HCI_CMD_TIMEOUT);
 	if (err) {
@@ -1466,7 +1471,7 @@ static int hci_le_del_accept_list_sync(struct hci_dev *hdev,
 	bt_dev_dbg(hdev, "Remove %pMR (0x%x) from allow list", &cp.bdaddr,
 		   cp.bdaddr_type);
 
-	return hci_le_del_resolve_list_sync(hdev, &cp.bdaddr, cp.bdaddr_type);
+	return 0;
 }
 
 /* Adds connection to resolve list if needed.*/
@@ -1477,8 +1482,7 @@ static int hci_le_add_resolve_list_sync(struct hci_dev *hdev,
 	struct smp_irk *irk;
 	struct bdaddr_list_with_irk *entry;
 
-	if (!use_ll_privacy(hdev) ||
-	    !hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY))
+	if (!use_ll_privacy(hdev))
 		return 0;
 
 	irk = hci_find_irk_by_addr(hdev, &params->addr, params->addr_type);
@@ -1510,7 +1514,7 @@ static int hci_le_add_resolve_list_sync(struct hci_dev *hdev,
  */
 static int hci_le_add_accept_list_sync(struct hci_dev *hdev,
 				       struct hci_conn_params *params,
-				       u8 *num_entries, bool allow_rpa)
+				       u8 *num_entries)
 {
 	struct hci_cp_le_add_to_accept_list cp;
 	int err;
@@ -1525,8 +1529,7 @@ static int hci_le_add_accept_list_sync(struct hci_dev *hdev,
 		return -ENOSPC;
 
 	/* Accept list can not be used with RPAs */
-	if (!allow_rpa &&
-	    !hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY) &&
+	if (!use_ll_privacy(hdev) &&
 	    hci_find_irk_by_addr(hdev, &params->addr, params->addr_type)) {
 		return -EINVAL;
 	}
@@ -1536,6 +1539,16 @@ static int hci_le_add_accept_list_sync(struct hci_dev *hdev,
 						   params->current_flags))
 		return 0;
 
+	/* Attempt to program the device in the resolving list first to avoid
+	 * having to rollback in case it fails since the resolving list is
+	 * dynamic it can probably be smaller than the accept list.
+	 */
+	err = hci_le_add_resolve_list_sync(hdev, params);
+	if (err) {
+		bt_dev_err(hdev, "Unable to add to resolve list: %d", err);
+		return err;
+	}
+
 	*num_entries += 1;
 	cp.bdaddr_type = params->addr_type;
 	bacpy(&cp.bdaddr, &params->addr);
@@ -1544,31 +1557,129 @@ static int hci_le_add_accept_list_sync(struct hci_dev *hdev,
 				    sizeof(cp), &cp, HCI_CMD_TIMEOUT);
 	if (err) {
 		bt_dev_err(hdev, "Unable to add to allow list: %d", err);
+		/* Rollback the device from the resolving list */
+		hci_le_del_resolve_list_sync(hdev, &cp.bdaddr, cp.bdaddr_type);
 		return err;
 	}
 
 	bt_dev_dbg(hdev, "Add %pMR (0x%x) to allow list", &cp.bdaddr,
 		   cp.bdaddr_type);
 
-	return hci_le_add_resolve_list_sync(hdev, params);
+	return 0;
+}
+
+/* This function disables all advertising instances (including 0x00) */
+static int hci_pause_advertising_sync(struct hci_dev *hdev)
+{
+	int err;
+
+	/* If there are no instances or advertising has already been paused
+	 * there is nothing to do.
+	 */
+	if (!hdev->adv_instance_cnt || hdev->advertising_paused)
+		return 0;
+
+	bt_dev_dbg(hdev, "Pausing advertising instances");
+
+	/* Call to disable any advertisements active on the controller.
+	 * This will succeed even if no advertisements are configured.
+	 */
+	err = hci_disable_advertising_sync(hdev);
+	if (err)
+		return err;
+
+	/* If we are using software rotation, pause the loop */
+	if (!ext_adv_capable(hdev))
+		cancel_adv_timeout(hdev);
+
+	hdev->advertising_paused = true;
+
+	return 0;
 }
 
+/* This function disables all user advertising instances (excluding 0x00) */
+static int hci_resume_advertising_sync(struct hci_dev *hdev)
+{
+	struct adv_info *adv, *tmp;
+	int err;
+
+	/* If advertising has not been paused there is nothing  to do. */
+	if (!hdev->advertising_paused)
+		return 0;
+
+	bt_dev_dbg(hdev, "Resuming advertising instances");
+
+	if (ext_adv_capable(hdev)) {
+		/* Call for each tracked instance to be re-enabled */
+		list_for_each_entry_safe(adv, tmp, &hdev->adv_instances, list) {
+			err = hci_enable_ext_advertising_sync(hdev,
+							      adv->instance);
+			if (!err)
+				continue;
+
+			/* If the instance cannot be resumed remove it */
+			hci_remove_ext_adv_instance_sync(hdev, adv->instance,
+							 NULL);
+		}
+	} else {
+		/* Schedule for most recent instance to be restarted and begin
+		 * the software rotation loop
+		 */
+		err = hci_schedule_adv_instance_sync(hdev,
+						     hdev->cur_adv_instance,
+						     true);
+	}
+
+	hdev->advertising_paused = false;
+
+	return err;
+}
+
+/* Device must not be scanning when updating the accept list.
+ *
+ * Update is done using the following sequence:
+ *
+ * use_ll_privacy((Disable Advertising) -> Disable Resolving List) ->
+ * Remove Devices From Accept List ->
+ * (has IRK && use_ll_privacy(Remove Devices From Resolving List))->
+ * Add Devices to Accept List ->
+ * (has IRK && use_ll_privacy(Remove Devices From Resolving List)) ->
+ * use_ll_privacy(Enable Resolving List -> (Enable Advertising)) ->
+ * Enable Scanning
+ *
+ * In case of failure advertising shall be restored to its original state and
+ * return would disable accept list since either accept or resolving list could
+ * not be programmed.
+ *
+ */
 static u8 hci_update_accept_list_sync(struct hci_dev *hdev)
 {
 	struct hci_conn_params *params;
 	struct bdaddr_list *b, *t;
 	u8 num_entries = 0;
 	bool pend_conn, pend_report;
-	/* We allow acceptlisting even with RPAs in suspend. In the worst case,
-	 * we won't be able to wake from devices that use the privacy1.2
-	 * features. Additionally, once we support privacy1.2 and IRK
-	 * offloading, we can update this to also check for those conditions.
+	int err;
+
+	/* Pause advertising if resolving list can be used as controllers are
+	 * cannot accept resolving list modifications while advertising.
 	 */
-	bool allow_rpa = hdev->suspended;
+	if (use_ll_privacy(hdev)) {
+		err = hci_pause_advertising_sync(hdev);
+		if (err) {
+			bt_dev_err(hdev, "pause advertising failed: %d", err);
+			return 0x00;
+		}
+	}
 
-	if (use_ll_privacy(hdev) &&
-	    hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY))
-		allow_rpa = true;
+	/* Disable address resolution while reprogramming accept list since
+	 * devices that do have an IRK will be programmed in the resolving list
+	 * when LL Privacy is enabled.
+	 */
+	err = hci_le_set_addr_resolution_enable_sync(hdev, 0x00);
+	if (err) {
+		bt_dev_err(hdev, "Unable to disable LL privacy: %d", err);
+		goto done;
+	}
 
 	/* Go through the current accept list programmed into the
 	 * controller one by one and check if that address is still
@@ -1593,13 +1704,6 @@ static u8 hci_update_accept_list_sync(struct hci_dev *hdev)
 			continue;
 		}
 
-		/* Accept list can not be used with RPAs */
-		if (!allow_rpa &&
-		    !hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY) &&
-		    hci_find_irk_by_addr(hdev, &b->bdaddr, b->bdaddr_type)) {
-			return 0x00;
-		}
-
 		num_entries++;
 	}
 
@@ -1614,9 +1718,9 @@ static u8 hci_update_accept_list_sync(struct hci_dev *hdev)
 	 * accept list.
 	 */
 	list_for_each_entry(params, &hdev->pend_le_conns, action) {
-		if (hci_le_add_accept_list_sync(hdev, params, &num_entries,
-						allow_rpa))
-			return 0x00;
+		err = hci_le_add_accept_list_sync(hdev, params, &num_entries);
+		if (err)
+			goto done;
 	}
 
 	/* After adding all new pending connections, walk through
@@ -1624,9 +1728,9 @@ static u8 hci_update_accept_list_sync(struct hci_dev *hdev)
 	 * accept list if there is still space. Abort if space runs out.
 	 */
 	list_for_each_entry(params, &hdev->pend_le_reports, action) {
-		if (hci_le_add_accept_list_sync(hdev, params, &num_entries,
-						allow_rpa))
-			return 0x00;
+		err = hci_le_add_accept_list_sync(hdev, params, &num_entries);
+		if (err)
+			goto done;
 	}
 
 	/* Use the allowlist unless the following conditions are all true:
@@ -1637,10 +1741,20 @@ static u8 hci_update_accept_list_sync(struct hci_dev *hdev)
 	if (!idr_is_empty(&hdev->adv_monitors_idr) && !hdev->suspended &&
 	    hci_get_adv_monitor_offload_ext(hdev) == HCI_ADV_MONITOR_EXT_NONE &&
 	    hdev->interleave_scan_state != INTERLEAVE_SCAN_ALLOWLIST)
-		return 0x00;
+		err = -EINVAL;
+
+done:
+	/* Enable address resolution when LL Privacy is enabled. */
+	err = hci_le_set_addr_resolution_enable_sync(hdev, 0x01);
+	if (err)
+		bt_dev_err(hdev, "Unable to enable LL privacy: %d", err);
+
+	/* Resume advertising if it was paused */
+	if (use_ll_privacy(hdev))
+		hci_resume_advertising_sync(hdev);
 
 	/* Select filter policy to use accept list */
-	return 0x01;
+	return err ? 0x00 : 0x01;
 }
 
 /* Returns true if an le connection is in the scanning state */
@@ -1731,8 +1845,7 @@ static int hci_le_set_scan_param_sync(struct hci_dev *hdev, u8 type,
 }
 
 static int hci_start_scan_sync(struct hci_dev *hdev, u8 type, u16 interval,
-			       u16 window, u8 own_addr_type, u8 filter_policy,
-			       bool addr_resolv)
+			       u16 window, u8 own_addr_type, u8 filter_policy)
 {
 	int err;
 
@@ -1741,12 +1854,6 @@ static int hci_start_scan_sync(struct hci_dev *hdev, u8 type, u16 interval,
 		return 0;
 	}
 
-	if (addr_resolv) {
-		err = hci_le_set_addr_resolution_enable_sync(hdev, 0x01);
-		if (err)
-			return err;
-	}
-
 	err = hci_le_set_scan_param_sync(hdev, type, interval, window,
 					 own_addr_type, filter_policy);
 	if (err)
@@ -1756,22 +1863,24 @@ static int hci_start_scan_sync(struct hci_dev *hdev, u8 type, u16 interval,
 					   LE_SCAN_FILTER_DUP_ENABLE);
 }
 
-/* Ensure to call hci_scan_disable_sync first to disable the controller based
- * address resolution to be able to reconfigure resolving list.
- */
 int hci_passive_scan_sync(struct hci_dev *hdev)
 {
 	u8 own_addr_type;
 	u8 filter_policy;
 	u16 window, interval;
-	/* Background scanning should run with address resolution */
-	bool addr_resolv = true;
+	int err;
 
 	if (hdev->scanning_paused) {
 		bt_dev_dbg(hdev, "Scanning is paused for suspend");
 		return 0;
 	}
 
+	err = hci_scan_disable_sync(hdev);
+	if (err) {
+		bt_dev_err(hdev, "disable scanning failed: %d", err);
+		return err;
+	}
+
 	/* Set require_privacy to false since no SCAN_REQ are send
 	 * during passive scanning. Not using an non-resolvable address
 	 * here is important so that peer devices using direct
@@ -1787,6 +1896,7 @@ int hci_passive_scan_sync(struct hci_dev *hdev)
 		return 0;
 
 	bt_dev_dbg(hdev, "interleave state %d", hdev->interleave_scan_state);
+
 	/* Adding or removing entries from the accept list must
 	 * happen before enabling scanning. The controller does
 	 * not allow accept list modification while scanning.
@@ -1825,12 +1935,23 @@ int hci_passive_scan_sync(struct hci_dev *hdev)
 	bt_dev_dbg(hdev, "LE passive scan with acceptlist = %d", filter_policy);
 
 	return hci_start_scan_sync(hdev, LE_SCAN_PASSIVE, interval, window,
-				   own_addr_type, filter_policy, addr_resolv);
+				   own_addr_type, filter_policy);
 }
 
 /* This function controls the passive scanning based on hdev->pend_le_conns
  * list. If there are pending LE connection we start the background scanning,
- * otherwise we stop it.
+ * otherwise we stop it in the following sequence:
+ *
+ * If there are devices to scan:
+ *
+ * Disable Scanning -> Update Accept List ->
+ * use_ll_privacy((Disable Advertising) -> Disable Resolving List ->
+ * Update Resolving List -> Enable Resolving List -> (Enable Advertising)) ->
+ * Enable Scanning
+ *
+ * Otherwise:
+ *
+ * Disable Scanning
  */
 int hci_update_passive_scan_sync(struct hci_dev *hdev)
 {
@@ -1874,7 +1995,7 @@ int hci_update_passive_scan_sync(struct hci_dev *hdev)
 
 		bt_dev_dbg(hdev, "stopping background scanning");
 
-		err = hci_scan_disable_sync(hdev, false);
+		err = hci_scan_disable_sync(hdev);
 		if (err)
 			bt_dev_err(hdev, "stop background scanning failed: %d",
 				   err);
@@ -1890,13 +2011,6 @@ int hci_update_passive_scan_sync(struct hci_dev *hdev)
 		if (hci_lookup_le_connect(hdev))
 			return 0;
 
-		err = hci_scan_disable_sync(hdev, false);
-		if (err) {
-			bt_dev_err(hdev, "stop background scanning failed: %d",
-				   err);
-			return err;
-		}
-
 		bt_dev_dbg(hdev, "start background scanning");
 
 		err = hci_passive_scan_sync(hdev);
@@ -1907,3 +2021,13 @@ int hci_update_passive_scan_sync(struct hci_dev *hdev)
 
 	return err;
 }
+
+static int update_passive_scan_sync(struct hci_dev *hdev, void *data)
+{
+	return hci_update_passive_scan_sync(hdev);
+}
+
+int hci_update_passive_scan(struct hci_dev *hdev)
+{
+	return hci_cmd_sync_queue(hdev, update_passive_scan_sync, NULL, NULL);
+}
diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index ef61b152c627..ca2273a8979d 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -839,12 +839,7 @@ static u32 get_supported_settings(struct hci_dev *hdev)
 		settings |= MGMT_SETTING_SECURE_CONN;
 		settings |= MGMT_SETTING_PRIVACY;
 		settings |= MGMT_SETTING_STATIC_ADDRESS;
-
-		/* When the experimental feature for LL Privacy support is
-		 * enabled, then advertising is no longer supported.
-		 */
-		if (!hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY))
-			settings |= MGMT_SETTING_ADVERTISING;
+		settings |= MGMT_SETTING_ADVERTISING;
 	}
 
 	if (test_bit(HCI_QUIRK_EXTERNAL_CONFIG, &hdev->quirks) ||
@@ -3846,7 +3841,7 @@ static int read_exp_features_info(struct sock *sk, struct hci_dev *hdev,
 		idx++;
 	}
 
-	if (hdev && use_ll_privacy(hdev)) {
+	if (hdev && ll_privacy_capable(hdev)) {
 		if (hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY))
 			flags = BIT(0) | BIT(1);
 		else
@@ -5621,13 +5616,6 @@ static int set_advertising(struct sock *sk, struct hci_dev *hdev, void *data,
 		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_ADVERTISING,
 				       status);
 
-	/* Enabling the experimental LL Privay support disables support for
-	 * advertising.
-	 */
-	if (hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY))
-		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_ADVERTISING,
-				       MGMT_STATUS_NOT_SUPPORTED);
-
 	if (cp->val != 0x00 && cp->val != 0x01 && cp->val != 0x02)
 		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_ADVERTISING,
 				       MGMT_STATUS_INVALID_PARAMS);
@@ -7723,13 +7711,6 @@ static int read_adv_features(struct sock *sk, struct hci_dev *hdev,
 		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_READ_ADV_FEATURES,
 				       MGMT_STATUS_REJECTED);
 
-	/* Enabling the experimental LL Privay support disables support for
-	 * advertising.
-	 */
-	if (hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY))
-		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_READ_ADV_FEATURES,
-				       MGMT_STATUS_NOT_SUPPORTED);
-
 	hci_dev_lock(hdev);
 
 	rp_len = sizeof(*rp) + hdev->adv_instance_cnt;
@@ -7969,13 +7950,6 @@ static int add_advertising(struct sock *sk, struct hci_dev *hdev,
 		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_ADD_ADVERTISING,
 				       status);
 
-	/* Enabling the experimental LL Privay support disables support for
-	 * advertising.
-	 */
-	if (hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY))
-		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_ADD_ADVERTISING,
-				       MGMT_STATUS_NOT_SUPPORTED);
-
 	if (cp->instance < 1 || cp->instance > hdev->le_num_of_adv_sets)
 		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_ADD_ADVERTISING,
 				       MGMT_STATUS_INVALID_PARAMS);
@@ -8471,13 +8445,6 @@ static int remove_advertising(struct sock *sk, struct hci_dev *hdev,
 
 	bt_dev_dbg(hdev, "sock %p", sk);
 
-	/* Enabling the experimental LL Privay support disables support for
-	 * advertising.
-	 */
-	if (hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY))
-		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_REMOVE_ADVERTISING,
-				       MGMT_STATUS_NOT_SUPPORTED);
-
 	hci_dev_lock(hdev);
 
 	if (cp->instance && !hci_find_adv_instance(hdev, cp->instance)) {
@@ -8788,7 +8755,7 @@ void mgmt_power_on(struct hci_dev *hdev, int err)
 
 	if (!err) {
 		restart_le_actions(hdev);
-		hci_update_background_scan(hdev);
+		hci_update_passive_scan(hdev);
 	}
 
 	mgmt_pending_foreach(MGMT_OP_SET_POWERED, hdev, settings_rsp, &match);
-- 
2.31.1

