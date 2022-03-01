Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72CB74C947E
	for <lists+linux-bluetooth@lfdr.de>; Tue,  1 Mar 2022 20:39:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235860AbiCATkX (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 1 Mar 2022 14:40:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232698AbiCATkX (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 1 Mar 2022 14:40:23 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38F9F65494
        for <linux-bluetooth@vger.kernel.org>; Tue,  1 Mar 2022 11:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646163581; x=1677699581;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CCYRy3VV1KBpJQkNopd4dZW+DCBH0ITm6Y5KWWBQdXQ=;
  b=ACIwYq/mbF+0ksuaA9oOHNoMEnQHbfdm3TAuA74VjXbldBwl12OS7hxy
   o3Yd4W7ysMJV933/PaZqaoHTgJnSlCTBxnM8JhU25PNqEtEFCN+8wOwnV
   U92G/0o//aYMyxLQzMWvYuTjYs0DNFKI+KifVvpoOF9bRADddfWbncJaK
   cn2O0JMqYbdes5E3JukHQ8CBvVfw03VPJKJVZUk5/dd4VAf9NqErhInMT
   pRZ335gfwFl4hGdYSM5/uBi16fLqPa0WdwtAYDNlc7m9+c46Fcn4eJg9y
   416LAuwJobBWFolg68M1mcbJStRklyCSU3CGhIS0UgU/9HS7slk2xucRY
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="236730534"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; 
   d="scan'208";a="236730534"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2022 11:39:40 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; 
   d="scan'208";a="535031802"
Received: from rlucey-mobl.ger.corp.intel.com (HELO bgi1-mobl2.amr.corp.intel.com) ([10.209.91.119])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2022 11:39:40 -0800
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     luiz.von.dentz@intel.com, marcel@holtmann.org, brian.gix@intel.com,
        tedd.an@intel.com
Subject: [PATCH v4] Bluetooth: Scrub MGMT cmd pending queue for consistency
Date:   Tue,  1 Mar 2022 11:39:30 -0800
Message-Id: <20220301193930.752813-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

A number of places in the MGMT handlers we examine the command queue for
other commands (in progress but not yet complete) that will interact
with the process being performed. However, not all commands go into the
queue if one of:

1. There is no negative side effect of consecutive or redundent commands
2. The command is entirely perform "inline".

This change examines each "pending command" check, and if it is not
needed, deletes the check. Of the remaining pending command checks, we
make sure that the command is in the pending queue by using the
mgmt_pending_add/mgmt_pending_remove pair rather than the
mgmt_pending_new/mgmt_pending_free pair.

Signed-off-by: Brian Gix <brian.gix@intel.com>
---
 net/bluetooth/mgmt.c      | 99 +++++++++++++++++++++++++--------------
 net/bluetooth/mgmt_util.c | 15 ++++++
 net/bluetooth/mgmt_util.h |  2 +
 3 files changed, 80 insertions(+), 36 deletions(-)

diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 4b15b95e61e6..e5c89aa5e125 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -931,6 +931,11 @@ static u32 get_current_settings(struct hci_dev *hdev)
 	return settings;
 }
 
+static bool pending_find_cmd(struct mgmt_pending_cmd *cmd, struct hci_dev *hdev)
+{
+	return mgmt_pending_find_cmd(HCI_CHANNEL_CONTROL, cmd, hdev);
+}
+
 static struct mgmt_pending_cmd *pending_find(u16 opcode, struct hci_dev *hdev)
 {
 	return mgmt_pending_find(HCI_CHANNEL_CONTROL, opcode, hdev);
@@ -1220,7 +1225,13 @@ static int new_settings(struct hci_dev *hdev, struct sock *skip)
 static void mgmt_set_powered_complete(struct hci_dev *hdev, void *data, int err)
 {
 	struct mgmt_pending_cmd *cmd = data;
-	struct mgmt_mode *cp = cmd->param;
+	struct mgmt_mode *cp;
+
+	/* Make sure cmd still outstanding. */
+	if (!pending_find_cmd(cmd, hdev) || cmd->opcode != MGMT_OP_SET_POWERED)
+		return;
+
+	cp = cmd->param;
 
 	bt_dev_dbg(hdev, "err %d", err);
 
@@ -1244,7 +1255,7 @@ static void mgmt_set_powered_complete(struct hci_dev *hdev, void *data, int err)
 				mgmt_status(err));
 	}
 
-	mgmt_pending_free(cmd);
+	mgmt_pending_remove(cmd);
 }
 
 static int set_powered_sync(struct hci_dev *hdev, void *data)
@@ -1283,7 +1294,7 @@ static int set_powered(struct sock *sk, struct hci_dev *hdev, void *data,
 		goto failed;
 	}
 
-	cmd = mgmt_pending_new(sk, MGMT_OP_SET_POWERED, hdev, data, len);
+	cmd = mgmt_pending_add(sk, MGMT_OP_SET_POWERED, hdev, data, len);
 	if (!cmd) {
 		err = -ENOMEM;
 		goto failed;
@@ -1292,6 +1303,9 @@ static int set_powered(struct sock *sk, struct hci_dev *hdev, void *data,
 	err = hci_cmd_sync_queue(hdev, set_powered_sync, cmd,
 				 mgmt_set_powered_complete);
 
+	if (err < 0)
+		mgmt_pending_remove(cmd);
+
 failed:
 	hci_dev_unlock(hdev);
 	return err;
@@ -1385,6 +1399,9 @@ static void mgmt_set_discoverable_complete(struct hci_dev *hdev, void *data,
 
 	bt_dev_dbg(hdev, "err %d", err);
 
+	if (!pending_find_cmd(cmd, hdev) || cmd->opcode != MGMT_OP_SET_DISCOVERABLE)
+		return;
+
 	hci_dev_lock(hdev);
 
 	if (err) {
@@ -1404,7 +1421,7 @@ static void mgmt_set_discoverable_complete(struct hci_dev *hdev, void *data,
 	new_settings(hdev, cmd->sk);
 
 done:
-	mgmt_pending_free(cmd);
+	mgmt_pending_remove(cmd);
 	hci_dev_unlock(hdev);
 }
 
@@ -1513,7 +1530,7 @@ static int set_discoverable(struct sock *sk, struct hci_dev *hdev, void *data,
 		goto failed;
 	}
 
-	cmd = mgmt_pending_new(sk, MGMT_OP_SET_DISCOVERABLE, hdev, data, len);
+	cmd = mgmt_pending_add(sk, MGMT_OP_SET_DISCOVERABLE, hdev, data, len);
 	if (!cmd) {
 		err = -ENOMEM;
 		goto failed;
@@ -1540,6 +1557,9 @@ static int set_discoverable(struct sock *sk, struct hci_dev *hdev, void *data,
 	err = hci_cmd_sync_queue(hdev, set_discoverable_sync, cmd,
 				 mgmt_set_discoverable_complete);
 
+	if (err < 0)
+		mgmt_pending_remove(cmd);
+
 failed:
 	hci_dev_unlock(hdev);
 	return err;
@@ -1552,6 +1572,9 @@ static void mgmt_set_connectable_complete(struct hci_dev *hdev, void *data,
 
 	bt_dev_dbg(hdev, "err %d", err);
 
+	if (!pending_find_cmd(cmd, hdev) || cmd->opcode != MGMT_OP_SET_CONNECTABLE)
+		return;
+
 	hci_dev_lock(hdev);
 
 	if (err) {
@@ -1564,7 +1587,9 @@ static void mgmt_set_connectable_complete(struct hci_dev *hdev, void *data,
 	new_settings(hdev, cmd->sk);
 
 done:
-	mgmt_pending_free(cmd);
+	if (cmd)
+		mgmt_pending_remove(cmd);
+
 	hci_dev_unlock(hdev);
 }
 
@@ -1636,7 +1661,7 @@ static int set_connectable(struct sock *sk, struct hci_dev *hdev, void *data,
 		goto failed;
 	}
 
-	cmd = mgmt_pending_new(sk, MGMT_OP_SET_CONNECTABLE, hdev, data, len);
+	cmd = mgmt_pending_add(sk, MGMT_OP_SET_CONNECTABLE, hdev, data, len);
 	if (!cmd) {
 		err = -ENOMEM;
 		goto failed;
@@ -1656,6 +1681,9 @@ static int set_connectable(struct sock *sk, struct hci_dev *hdev, void *data,
 	err = hci_cmd_sync_queue(hdev, set_connectable_sync, cmd,
 				 mgmt_set_connectable_complete);
 
+	if (err < 0)
+		mgmt_pending_remove(cmd);
+
 failed:
 	hci_dev_unlock(hdev);
 	return err;
@@ -1776,6 +1804,9 @@ static void set_ssp_complete(struct hci_dev *hdev, void *data, int err)
 	u8 enable = cp->val;
 	bool changed;
 
+	if (!pending_find_cmd(cmd, hdev) || cmd->opcode != MGMT_OP_SET_SSP)
+		return;
+
 	if (err) {
 		u8 mgmt_err = mgmt_status(err);
 
@@ -3325,6 +3356,9 @@ static void set_name_complete(struct hci_dev *hdev, void *data, int err)
 
 	bt_dev_dbg(hdev, "err %d", err);
 
+	if (!pending_find_cmd(cmd, hdev) || cmd->opcode != MGMT_OP_SET_LOCAL_NAME)
+		return;
+
 	if (status) {
 		mgmt_cmd_status(cmd->sk, hdev->id, MGMT_OP_SET_LOCAL_NAME,
 				status);
@@ -3497,6 +3531,9 @@ static void set_default_phy_complete(struct hci_dev *hdev, void *data, int err)
 	struct sk_buff *skb = cmd->skb;
 	u8 status = mgmt_status(err);
 
+	if (!pending_find_cmd(cmd, hdev) || cmd->opcode != MGMT_OP_SET_PHY_CONFIGURATION)
+		return;
+
 	if (!status) {
 		if (!skb)
 			status = MGMT_STATUS_FAILED;
@@ -3763,13 +3800,6 @@ static int set_wideband_speech(struct sock *sk, struct hci_dev *hdev,
 
 	hci_dev_lock(hdev);
 
-	if (pending_find(MGMT_OP_SET_WIDEBAND_SPEECH, hdev)) {
-		err = mgmt_cmd_status(sk, hdev->id,
-				      MGMT_OP_SET_WIDEBAND_SPEECH,
-				      MGMT_STATUS_BUSY);
-		goto unlock;
-	}
-
 	if (hdev_is_powered(hdev) &&
 	    !!cp->val != hci_dev_test_flag(hdev,
 					   HCI_WIDEBAND_SPEECH_ENABLED)) {
@@ -5040,12 +5070,6 @@ static int read_local_oob_data(struct sock *sk, struct hci_dev *hdev,
 		goto unlock;
 	}
 
-	if (pending_find(MGMT_OP_READ_LOCAL_OOB_DATA, hdev)) {
-		err = mgmt_cmd_status(sk, hdev->id, MGMT_OP_READ_LOCAL_OOB_DATA,
-				      MGMT_STATUS_BUSY);
-		goto unlock;
-	}
-
 	cmd = mgmt_pending_new(sk, MGMT_OP_READ_LOCAL_OOB_DATA, hdev, NULL, 0);
 	if (!cmd)
 		err = -ENOMEM;
@@ -5265,11 +5289,14 @@ static void start_discovery_complete(struct hci_dev *hdev, void *data, int err)
 {
 	struct mgmt_pending_cmd *cmd = data;
 
+	if (!pending_find_cmd(cmd, hdev))
+		return;
+
 	bt_dev_dbg(hdev, "err %d", err);
 
 	mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode, mgmt_status(err),
 			  cmd->param, 1);
-	mgmt_pending_free(cmd);
+	mgmt_pending_remove(cmd);
 
 	hci_discovery_set_state(hdev, err ? DISCOVERY_STOPPED:
 				DISCOVERY_FINDING);
@@ -5331,7 +5358,7 @@ static int start_discovery_internal(struct sock *sk, struct hci_dev *hdev,
 	else
 		hdev->discovery.limited = false;
 
-	cmd = mgmt_pending_new(sk, op, hdev, data, len);
+	cmd = mgmt_pending_add(sk, op, hdev, data, len);
 	if (!cmd) {
 		err = -ENOMEM;
 		goto failed;
@@ -5340,7 +5367,7 @@ static int start_discovery_internal(struct sock *sk, struct hci_dev *hdev,
 	err = hci_cmd_sync_queue(hdev, start_discovery_sync, cmd,
 				 start_discovery_complete);
 	if (err < 0) {
-		mgmt_pending_free(cmd);
+		mgmt_pending_remove(cmd);
 		goto failed;
 	}
 
@@ -5434,7 +5461,7 @@ static int start_service_discovery(struct sock *sk, struct hci_dev *hdev,
 		goto failed;
 	}
 
-	cmd = mgmt_pending_new(sk, MGMT_OP_START_SERVICE_DISCOVERY,
+	cmd = mgmt_pending_add(sk, MGMT_OP_START_SERVICE_DISCOVERY,
 			       hdev, data, len);
 	if (!cmd) {
 		err = -ENOMEM;
@@ -5467,7 +5494,7 @@ static int start_service_discovery(struct sock *sk, struct hci_dev *hdev,
 	err = hci_cmd_sync_queue(hdev, start_discovery_sync, cmd,
 				 start_discovery_complete);
 	if (err < 0) {
-		mgmt_pending_free(cmd);
+		mgmt_pending_remove(cmd);
 		goto failed;
 	}
 
@@ -5499,11 +5526,14 @@ static void stop_discovery_complete(struct hci_dev *hdev, void *data, int err)
 {
 	struct mgmt_pending_cmd *cmd = data;
 
+	if (!pending_find_cmd(cmd, hdev))
+		return;
+
 	bt_dev_dbg(hdev, "err %d", err);
 
 	mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode, mgmt_status(err),
 			  cmd->param, 1);
-	mgmt_pending_free(cmd);
+	mgmt_pending_remove(cmd);
 
 	if (!err)
 		hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
@@ -5539,7 +5569,7 @@ static int stop_discovery(struct sock *sk, struct hci_dev *hdev, void *data,
 		goto unlock;
 	}
 
-	cmd = mgmt_pending_new(sk, MGMT_OP_STOP_DISCOVERY, hdev, data, len);
+	cmd = mgmt_pending_add(sk, MGMT_OP_STOP_DISCOVERY, hdev, data, len);
 	if (!cmd) {
 		err = -ENOMEM;
 		goto unlock;
@@ -5548,7 +5578,7 @@ static int stop_discovery(struct sock *sk, struct hci_dev *hdev, void *data,
 	err = hci_cmd_sync_queue(hdev, stop_discovery_sync, cmd,
 				 stop_discovery_complete);
 	if (err < 0) {
-		mgmt_pending_free(cmd);
+		mgmt_pending_remove(cmd);
 		goto unlock;
 	}
 
@@ -7478,6 +7508,9 @@ static void read_local_oob_ext_data_complete(struct hci_dev *hdev, void *data,
 	u8 status = mgmt_status(err);
 	u16 eir_len;
 
+	if (!pending_find_cmd(cmd, hdev))
+		return;
+
 	if (!status) {
 		if (!skb)
 			status = MGMT_STATUS_FAILED;
@@ -7973,11 +8006,7 @@ static bool requested_adv_flags_are_valid(struct hci_dev *hdev, u32 adv_flags)
 
 static bool adv_busy(struct hci_dev *hdev)
 {
-	return (pending_find(MGMT_OP_ADD_ADVERTISING, hdev) ||
-		pending_find(MGMT_OP_REMOVE_ADVERTISING, hdev) ||
-		pending_find(MGMT_OP_SET_LE, hdev) ||
-		pending_find(MGMT_OP_ADD_EXT_ADV_PARAMS, hdev) ||
-		pending_find(MGMT_OP_ADD_EXT_ADV_DATA, hdev));
+	return pending_find(MGMT_OP_SET_LE, hdev);
 }
 
 static void add_adv_complete(struct hci_dev *hdev, struct sock *sk, u8 instance,
@@ -8567,9 +8596,7 @@ static int remove_advertising(struct sock *sk, struct hci_dev *hdev,
 		goto unlock;
 	}
 
-	if (pending_find(MGMT_OP_ADD_ADVERTISING, hdev) ||
-	    pending_find(MGMT_OP_REMOVE_ADVERTISING, hdev) ||
-	    pending_find(MGMT_OP_SET_LE, hdev)) {
+	if (pending_find(MGMT_OP_SET_LE, hdev)) {
 		err = mgmt_cmd_status(sk, hdev->id, MGMT_OP_REMOVE_ADVERTISING,
 				      MGMT_STATUS_BUSY);
 		goto unlock;
diff --git a/net/bluetooth/mgmt_util.c b/net/bluetooth/mgmt_util.c
index edee60bbc7b4..c29c34b9aba9 100644
--- a/net/bluetooth/mgmt_util.c
+++ b/net/bluetooth/mgmt_util.c
@@ -228,6 +228,21 @@ struct mgmt_pending_cmd *mgmt_pending_find(unsigned short channel, u16 opcode,
 	return NULL;
 }
 
+bool mgmt_pending_find_cmd(unsigned short channel,
+			struct mgmt_pending_cmd *this_cmd, struct hci_dev *hdev)
+{
+	struct mgmt_pending_cmd *cmd;
+
+	list_for_each_entry(cmd, &hdev->mgmt_pending, list) {
+		if (hci_sock_get_channel(cmd->sk) != channel)
+			continue;
+		if (cmd == this_cmd)
+			return true;
+	}
+
+	return false;
+}
+
 struct mgmt_pending_cmd *mgmt_pending_find_data(unsigned short channel,
 						u16 opcode,
 						struct hci_dev *hdev,
diff --git a/net/bluetooth/mgmt_util.h b/net/bluetooth/mgmt_util.h
index 98e40395a383..f61e5b612fc4 100644
--- a/net/bluetooth/mgmt_util.h
+++ b/net/bluetooth/mgmt_util.h
@@ -44,6 +44,8 @@ int mgmt_cmd_complete(struct sock *sk, u16 index, u16 cmd, u8 status,
 
 struct mgmt_pending_cmd *mgmt_pending_find(unsigned short channel, u16 opcode,
 					   struct hci_dev *hdev);
+bool mgmt_pending_find_cmd(unsigned short channel, struct mgmt_pending_cmd *cmd,
+					   struct hci_dev *hdev);
 struct mgmt_pending_cmd *mgmt_pending_find_data(unsigned short channel,
 						u16 opcode,
 						struct hci_dev *hdev,
-- 
2.35.1

