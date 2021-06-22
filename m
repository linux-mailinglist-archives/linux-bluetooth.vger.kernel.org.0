Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F41B53AFA65
	for <lists+linux-bluetooth@lfdr.de>; Tue, 22 Jun 2021 03:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbhFVBDu (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 21 Jun 2021 21:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbhFVBDt (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 21 Jun 2021 21:03:49 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F4DAC061574
        for <linux-bluetooth@vger.kernel.org>; Mon, 21 Jun 2021 18:01:35 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id e33so15700381pgm.3
        for <linux-bluetooth@vger.kernel.org>; Mon, 21 Jun 2021 18:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=RAzrurrLz4zNYxAle8fIDGmaCi5sMC5MxucAAd4LeHo=;
        b=L6zlISz/Md023NY/Y/M0ztpxzIoNRiWp4xtVMmjH9KIcXaLL/dj9A9sEWKHCrViCgU
         N628TFlUvxKmRaPvQSSlNqEOSbu2rst1oHneOtBXnL4BjamiXrJ2ONpZm7uC4iBs6ffG
         M3wla+ChDUXWzvE08WC3lgWyLSBtFWL45uVM2vjr3OYHttnkKa/o6/CcicZ2emQsI6bL
         nrI5J9j6X+dcsYxpCjE9sjzpYGKYX3s/OMBcEnBjDZ9df+hdi3KkNKjUbZe1GZrwFOk0
         MFBwJuKR0LJllwSAr8HDB1kFI34NNeBTh/zf1HM/7svoeP69AMv32OT433JRCjYrUBc9
         vnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RAzrurrLz4zNYxAle8fIDGmaCi5sMC5MxucAAd4LeHo=;
        b=gw0t0Q1goUGdu85/cMxHcY2aPI18IhrKhGQrVhxg1gpVSLgx7NkdPqFb1mtpK4VleO
         dfnIv2ifYob5CqewHOeBTAV4zMWtekjvDLbDqCKLENRPK6CFoMsLd73wncMIA70LJgZg
         MjskoPsY9TQ1SVp1rKynHPNsnBV2w12PxbsMPE2yJ7CIGO9Y9OZUq8aKQl71nSwo3pWa
         xXzmLuuHkQBqxEt2IqwT6YeGx6CBxB4op2OAoRBybHBnaBp2faIWxzc5t06uhBgse0fM
         AWKLVK6SUgIyTCaWModm3x3T4S4xaSg0GsqATVqaVdBkJLAdu7zR03lv6foJcpnTq60M
         vYqw==
X-Gm-Message-State: AOAM533a99Q7zdziOtcKOb6jhqtbBspZOQvBbpUAG8DJWn4sdPyXtDEq
        LSjrJxbuXUo98CymOQVYsNEnGs+nl4Q=
X-Google-Smtp-Source: ABdhPJxEqWeZqpnvWRKKU8Nco2XH9bFb8Xb1tASI2nccDIUai5M8PSCDaWQUNZ+2gSRBJtoORBbaOQ==
X-Received: by 2002:aa7:8186:0:b029:2f7:f70a:b7be with SMTP id g6-20020aa781860000b02902f7f70ab7bemr966418pfi.64.1624323694142;
        Mon, 21 Jun 2021 18:01:34 -0700 (PDT)
Received: from han1-mobl3.hsd1.or.comcast.net ([2601:1c0:6a01:d830::512a])
        by smtp.gmail.com with ESMTPSA id f28sm17970120pgb.12.2021.06.21.18.01.33
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 18:01:33 -0700 (PDT)
From:   Tedd Ho-Jeong An <hj.tedd.an@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [BlueZ PATCH 3/5] emulator/btdev: Add support multiple instance of extended advertising
Date:   Mon, 21 Jun 2021 18:01:29 -0700
Message-Id: <20210622010131.427059-3-hj.tedd.an@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210622010131.427059-1-hj.tedd.an@gmail.com>
References: <20210622010131.427059-1-hj.tedd.an@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Tedd Ho-Jeong An <tedd.an@intel.com>

This patch adds support multiple instance of extended advertising.
---
 emulator/btdev.c | 417 ++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 321 insertions(+), 96 deletions(-)

diff --git a/emulator/btdev.c b/emulator/btdev.c
index eba9f57f9..dc9603b79 100644
--- a/emulator/btdev.c
+++ b/emulator/btdev.c
@@ -52,6 +52,7 @@ struct hook {
 };
 
 #define MAX_HOOK_ENTRIES 16
+#define MAX_EXT_ADV_SETS 3
 
 struct btdev_conn {
 	uint16_t handle;
@@ -72,6 +73,21 @@ struct btdev_rl {
 	uint8_t local_irk[16];
 };
 
+struct le_ext_adv {
+	uint8_t handle;
+	uint8_t enable;
+	uint8_t type;			/* evt_properties */
+	uint8_t own_addr_type;		/* own_addr_type */
+	uint8_t direct_addr_type;	/* peer_addr_type */
+	uint8_t direct_addr[6];		/* peer_addr */
+	uint8_t filter_policy;		/* filter_policy */
+	uint8_t random_addr[6];
+	uint8_t adv_data[252];
+	uint8_t adv_data_len;
+	uint8_t scan_data[252];
+	uint8_t scan_data_len;
+};
+
 struct btdev {
 	enum btdev_type type;
 
@@ -185,6 +201,8 @@ struct btdev {
 
 	uint16_t le_ext_adv_type;
 
+	struct queue *le_ext_adv;
+
 	btdev_debug_func_t debug_callback;
 	btdev_destroy_func_t debug_destroy;
 	void *debug_data;
@@ -1010,8 +1028,9 @@ static struct btdev_conn *conn_link(struct btdev *dev, struct btdev *remote,
 	conn2->link = conn1;
 
 	util_debug(dev->debug_callback, dev->debug_data,
-				"conn1 %p handle 0x%04x conn2 %p handle 0x%04x",
-				conn1, conn1->handle, conn2, conn2->handle);
+				"conn1 %p handle 0x%04x", conn1, conn1->handle);
+	util_debug(dev->debug_callback, dev->debug_data,
+				"conn2 %p handle 0x%04x", conn2, conn2->handle);
 
 	return conn1;
 }
@@ -3083,18 +3102,6 @@ static const uint8_t *scan_addr(const struct btdev *btdev)
 	return btdev->bdaddr;
 }
 
-static bool ext_adv_match(struct btdev *scan, struct btdev *adv)
-{
-	/* Match everything if this is not directed advertising */
-	if (!(adv->le_ext_adv_type & 0x04))
-		return true;
-
-	if (scan->le_scan_own_addr_type != adv->le_adv_direct_addr_type)
-		return false;
-
-	return !memcmp(scan_addr(scan), adv->le_adv_direct_addr, 6);
-}
-
 static const uint8_t *adv_addr(const struct btdev *btdev)
 {
 	if (btdev->le_adv_own_addr == 0x01)
@@ -4192,13 +4199,103 @@ static int cmd_set_default_phy(struct btdev *dev, const void *data,
 	return 0;
 }
 
+static const uint8_t *ext_adv_addr(const struct btdev *btdev,
+						struct le_ext_adv *ext_adv)
+{
+	if (ext_adv->own_addr_type == 0x01)
+		return ext_adv->random_addr;
+
+	return btdev->bdaddr;
+}
+
+static bool ext_adv_match_addr(const struct btdev *btdev,
+						struct le_ext_adv *ext_adv)
+{
+	/* Match everything if this is not directed advertising */
+	if (!(ext_adv->type & 0x04))
+		return true;
+
+	if (btdev->le_scan_own_addr_type != ext_adv->direct_addr_type)
+		return false;
+
+	return !memcmp(scan_addr(btdev), ext_adv->direct_addr, 6);
+}
+
+static bool match_ext_adv_handle(const void *data, const void *match_data)
+{
+	const struct le_ext_adv *ext_adv = data;
+	uint8_t handle = PTR_TO_UINT(match_data);
+
+	return ext_adv->handle == handle;
+}
+
+static void ext_adv_disable(void *data, void *user_data)
+{
+	struct le_ext_adv *ext_adv = data;
+	uint8_t handle = PTR_TO_UINT(user_data);
+
+	if (handle && ext_adv->handle != handle)
+		return;
+
+	ext_adv->enable = 0x00;
+}
+
+static bool ext_adv_is_connectable(struct le_ext_adv *ext_adv)
+{
+	if (!ext_adv->enable)
+		return false;
+
+	return ext_adv->type & 0x01;
+}
+
+static struct le_ext_adv *le_ext_adv_new(struct btdev *btdev, uint8_t handle)
+{
+	struct le_ext_adv *ext_adv;
+
+	ext_adv = new0(struct le_ext_adv, 1);
+	ext_adv->handle = handle;
+
+	/* Add to queue */
+	if (!queue_push_tail(btdev->le_ext_adv, ext_adv)) {
+		free(ext_adv);
+		return NULL;
+	}
+
+	return ext_adv;
+}
+
+static void le_ext_adv_free(void *data)
+{
+	struct le_ext_adv *ext_adv = data;
+
+	free(ext_adv);
+}
+
 static int cmd_set_adv_rand_addr(struct btdev *dev, const void *data,
 							uint8_t len)
 {
 	const struct bt_hci_cmd_le_set_adv_set_rand_addr *cmd = data;
+	struct le_ext_adv *ext_adv;
 	uint8_t status = BT_HCI_ERR_SUCCESS;
 
-	memcpy(dev->random_addr, cmd->bdaddr, 6);
+	/* Check if Ext Adv is already existed */
+	ext_adv = queue_find(dev->le_ext_adv, match_ext_adv_handle,
+						UINT_TO_PTR(cmd->handle));
+	if (!ext_adv) {
+		status = BT_HCI_ERR_UNKNOWN_ADVERTISING_ID;
+		cmd_complete(dev, BT_HCI_CMD_LE_SET_ADV_SET_RAND_ADDR, &status,
+						sizeof(status));
+		return 0;
+	}
+
+	if (ext_adv_is_connectable(ext_adv)) {
+		status = BT_HCI_ERR_COMMAND_DISALLOWED;
+		cmd_complete(dev, BT_HCI_CMD_LE_SET_ADV_SET_RAND_ADDR, &status,
+						sizeof(status));
+		return 0;
+	}
+
+	memcpy(ext_adv->random_addr, cmd->bdaddr, 6);
 	cmd_complete(dev, BT_HCI_CMD_LE_SET_ADV_SET_RAND_ADDR, &status,
 						sizeof(status));
 
@@ -4210,20 +4307,43 @@ static int cmd_set_ext_adv_params(struct btdev *dev, const void *data,
 {
 	const struct bt_hci_cmd_le_set_ext_adv_params *cmd = data;
 	struct bt_hci_rsp_le_set_ext_adv_params rsp;
+	struct le_ext_adv *ext_adv;
 	uint8_t status;
 
-	if (dev->le_adv_enable) {
+	/* Check if Ext Adv is already existed */
+	ext_adv = queue_find(dev->le_ext_adv, match_ext_adv_handle,
+						UINT_TO_PTR(cmd->handle));
+	if (!ext_adv) {
+		/* No more than maximum number */
+		if (queue_length(dev->le_ext_adv) >= MAX_EXT_ADV_SETS) {
+			status = BT_HCI_ERR_MEM_CAPACITY_EXCEEDED;
+			cmd_complete(dev, BT_HCI_CMD_LE_SET_EXT_ADV_PARAMS,
+						&status, sizeof(status));
+			return 0;
+		}
+
+		/* Create new set */
+		ext_adv = le_ext_adv_new(dev, cmd->handle);
+		if (!ext_adv) {
+			status = BT_HCI_ERR_MEM_CAPACITY_EXCEEDED;
+			cmd_complete(dev, BT_HCI_CMD_LE_SET_EXT_ADV_PARAMS,
+						&status, sizeof(status));
+			return 0;
+		}
+	}
+
+	if (ext_adv->enable) {
 		status = BT_HCI_ERR_COMMAND_DISALLOWED;
 		cmd_complete(dev, BT_HCI_CMD_LE_SET_EXT_ADV_PARAMS, &status,
 							sizeof(status));
 		return 0;
 	}
 
-	dev->le_ext_adv_type = le16_to_cpu(cmd->evt_properties);
-	dev->le_adv_own_addr = cmd->own_addr_type;
-	dev->le_adv_direct_addr_type = cmd->peer_addr_type;
-	memcpy(dev->le_adv_direct_addr, cmd->peer_addr, 6);
-	dev->le_adv_filter_policy = cmd->filter_policy;
+	ext_adv->type = le16_to_cpu(cmd->evt_properties);
+	ext_adv->own_addr_type = cmd->own_addr_type;
+	ext_adv->direct_addr_type = cmd->peer_addr_type;
+	memcpy(ext_adv->direct_addr, cmd->peer_addr, 6);
+	ext_adv->filter_policy = cmd->filter_policy;
 
 	rsp.status = BT_HCI_ERR_SUCCESS;
 	rsp.tx_power = 0;
@@ -4236,10 +4356,20 @@ static int cmd_set_ext_adv_data(struct btdev *dev, const void *data,
 							uint8_t len)
 {
 	const struct bt_hci_cmd_le_set_ext_adv_data *cmd = data;
+	struct le_ext_adv *ext_adv;
 	uint8_t status = BT_HCI_ERR_SUCCESS;
 
-	dev->le_adv_data_len = cmd->data_len;
-	memcpy(dev->le_adv_data, cmd->data, 31);
+	ext_adv = queue_find(dev->le_ext_adv, match_ext_adv_handle,
+						UINT_TO_PTR(cmd->handle));
+	if (!ext_adv) {
+		status = BT_HCI_ERR_UNKNOWN_ADVERTISING_ID;
+		cmd_complete(dev, BT_HCI_CMD_LE_SET_EXT_ADV_DATA, &status,
+						sizeof(status));
+		return 0;
+	}
+
+	ext_adv->adv_data_len = cmd->data_len;
+	memcpy(ext_adv->adv_data, cmd->data, cmd->data_len);
 	cmd_complete(dev, BT_HCI_CMD_LE_SET_EXT_ADV_DATA, &status,
 						sizeof(status));
 
@@ -4250,10 +4380,20 @@ static int cmd_set_ext_scan_rsp_data(struct btdev *dev, const void *data,
 							uint8_t len)
 {
 	const struct bt_hci_cmd_le_set_ext_scan_rsp_data *cmd = data;
+	struct le_ext_adv *ext_adv;
 	uint8_t status = BT_HCI_ERR_SUCCESS;
 
-	dev->le_scan_data_len = cmd->data_len;
-	memcpy(dev->le_scan_data, cmd->data, 31);
+	ext_adv = queue_find(dev->le_ext_adv, match_ext_adv_handle,
+						UINT_TO_PTR(cmd->handle));
+	if (!ext_adv) {
+		status = BT_HCI_ERR_UNKNOWN_ADVERTISING_ID;
+		cmd_complete(dev, BT_HCI_CMD_LE_SET_EXT_ADV_DATA, &status,
+						sizeof(status));
+		return 0;
+	}
+
+	ext_adv->scan_data_len = cmd->data_len;
+	memcpy(ext_adv->scan_data, cmd->data, cmd->data_len);
 	cmd_complete(dev, BT_HCI_CMD_LE_SET_EXT_SCAN_RSP_DATA, &status,
 						sizeof(status));
 
@@ -4261,6 +4401,7 @@ static int cmd_set_ext_scan_rsp_data(struct btdev *dev, const void *data,
 }
 
 static void send_ext_adv(struct btdev *btdev, const struct btdev *remote,
+					struct le_ext_adv *ext_adv,
 					uint16_t type, bool is_scan_rsp)
 {
 	struct __packed {
@@ -4274,8 +4415,8 @@ static void send_ext_adv(struct btdev *btdev, const struct btdev *remote,
 	memset(&meta_event.lear, 0, sizeof(meta_event.lear));
 	meta_event.num_reports = 1;
 	meta_event.lear.event_type = cpu_to_le16(type);
-	meta_event.lear.addr_type = remote->le_adv_own_addr;
-	memcpy(meta_event.lear.addr, adv_addr(remote), 6);
+	meta_event.lear.addr_type = ext_adv->own_addr_type;
+	memcpy(meta_event.lear.addr, ext_adv_addr(remote, ext_adv), 6);
 	meta_event.lear.rssi = 127;
 	meta_event.lear.tx_power = 127;
 	/* Right now we dont care about phy in adv report */
@@ -4284,12 +4425,12 @@ static void send_ext_adv(struct btdev *btdev, const struct btdev *remote,
 
 	/* Scan or advertising response */
 	if (is_scan_rsp) {
-		meta_event.lear.data_len = remote->le_scan_data_len;
-		memcpy(meta_event.lear.data, remote->le_scan_data,
+		meta_event.lear.data_len = ext_adv->scan_data_len;
+		memcpy(meta_event.lear.data, ext_adv->scan_data,
 						meta_event.lear.data_len);
 	} else {
-		meta_event.lear.data_len = remote->le_adv_data_len;
-		memcpy(meta_event.lear.data, remote->le_adv_data,
+		meta_event.lear.data_len = ext_adv->adv_data_len;
+		memcpy(meta_event.lear.data, ext_adv->adv_data,
 						meta_event.lear.data_len);
 	}
 
@@ -4297,12 +4438,13 @@ static void send_ext_adv(struct btdev *btdev, const struct btdev *remote,
 					1 + 24 + meta_event.lear.data_len);
 }
 
-static void le_set_ext_adv_enable_complete(struct btdev *btdev)
+static void le_set_ext_adv_enable_complete(struct btdev *btdev,
+						struct le_ext_adv *ext_adv)
 {
 	uint16_t report_type;
 	int i;
 
-	report_type = get_ext_adv_type(btdev->le_ext_adv_type);
+	report_type = get_ext_adv_type(ext_adv->type);
 
 	for (i = 0; i < MAX_BTDEV_ENTRIES; i++) {
 		if (!btdev_list[i] || btdev_list[i] == btdev)
@@ -4311,26 +4453,27 @@ static void le_set_ext_adv_enable_complete(struct btdev *btdev)
 		if (!btdev_list[i]->le_scan_enable)
 			continue;
 
-		if (!ext_adv_match(btdev_list[i], btdev))
+		if (!ext_adv_match_addr(btdev_list[i], ext_adv))
 			continue;
 
-		send_ext_adv(btdev_list[i], btdev, report_type, false);
+		send_ext_adv(btdev_list[i], btdev, ext_adv, report_type, false);
 
 		if (btdev_list[i]->le_scan_type != 0x01)
 			continue;
 
 		/* if scannable bit is set the send scan response */
-		if (btdev->le_ext_adv_type & 0x02) {
-			if (btdev->le_ext_adv_type == 0x13)
+		if (ext_adv->type & 0x02) {
+			if (ext_adv->type == 0x13)
 				report_type = 0x1b;
-			else if (btdev->le_ext_adv_type == 0x12)
+			else if (ext_adv->type == 0x12)
 				report_type = 0x1a;
-			else if (!(btdev->le_ext_adv_type & 0x10))
+			else if (!(ext_adv->type & 0x10))
 				report_type &= 0x08;
 			else
 				continue;
 
-			send_ext_adv(btdev_list[i], btdev, report_type, true);
+			send_ext_adv(btdev_list[i], btdev, ext_adv,
+							report_type, true);
 		}
 	}
 }
@@ -4339,31 +4482,62 @@ static int cmd_set_ext_adv_enable(struct btdev *dev, const void *data,
 							uint8_t len)
 {
 	const struct bt_hci_cmd_le_set_ext_adv_enable *cmd = data;
-	uint8_t status;
+	uint8_t status = BT_HCI_ERR_SUCCESS;
+	int i;
 
-	if (dev->le_adv_enable == cmd->enable)
-		status = BT_HCI_ERR_COMMAND_DISALLOWED;
-	else {
+	/* Num of set is zero */
+	if (!cmd->num_of_sets) {
+		if (cmd->enable) {
+			status = BT_HCI_ERR_INVALID_PARAMETERS;
+			goto exit_complete;
+		}
+
+		/* Disable all advertising sets */
+		queue_foreach(dev->le_ext_adv, ext_adv_disable, NULL);
+		goto exit_complete;
+	}
+
+	/* Process each sets */
+	for (i = 0; i < cmd->num_of_sets; i++) {
 		const struct bt_hci_cmd_ext_adv_set *eas;
+		struct le_ext_adv *ext_adv;
 
-		if (cmd->num_of_sets) {
-			eas = data + sizeof(*cmd);
-			if (eas->duration || cmd->num_of_sets > 1)
-				status = BT_HCI_ERR_INVALID_PARAMETERS;
-			else
-				status = BT_HCI_ERR_SUCCESS;
-		} else
-			status = BT_HCI_ERR_SUCCESS;
+		eas = data + sizeof(*cmd) + (sizeof(*eas) * i);
+
+		ext_adv = queue_find(dev->le_ext_adv, match_ext_adv_handle,
+						UINT_TO_PTR(eas->handle));
+		if (!ext_adv) {
+			status = BT_HCI_ERR_UNKNOWN_ADVERTISING_ID;
+			goto exit_complete;
+		}
+
+		if (ext_adv->enable == cmd->enable) {
+			status = BT_HCI_ERR_COMMAND_DISALLOWED;
+			goto exit_complete;
+		}
 
-		if (status == BT_HCI_ERR_SUCCESS)
-			dev->le_adv_enable = cmd->enable;
+		ext_adv->enable = cmd->enable;
 	}
 
+exit_complete:
 	cmd_complete(dev, BT_HCI_CMD_LE_SET_EXT_ADV_ENABLE, &status,
 							sizeof(status));
 
-	if (status == BT_HCI_ERR_SUCCESS && dev->le_adv_enable)
-		le_set_ext_adv_enable_complete(dev);
+	if (status == BT_HCI_ERR_SUCCESS && cmd->enable) {
+		/* Go through each sets and send adv event to peer device */
+		for (i = 0; i < cmd->num_of_sets; i++) {
+			const struct bt_hci_cmd_ext_adv_set *eas;
+			struct le_ext_adv *ext_adv;
+
+			eas = data + sizeof(*cmd) + (sizeof(*eas) * i);
+
+			ext_adv = queue_find(dev->le_ext_adv,
+						match_ext_adv_handle,
+						UINT_TO_PTR(eas->handle));
+			if (ext_adv)
+				le_set_ext_adv_enable_complete(dev, ext_adv);
+		}
+	}
 
 	return 0;
 }
@@ -4383,8 +4557,7 @@ static int cmd_read_num_adv_sets(struct btdev *dev, const void *data,
 	memset(&rsp, 0, sizeof(rsp));
 
 	rsp.status = BT_HCI_ERR_SUCCESS;
-	/* Support one set as of now */
-	rsp.num_of_sets = 1;
+	rsp.num_of_sets = MAX_EXT_ADV_SETS;
 	cmd_complete(dev, BT_HCI_CMD_LE_READ_NUM_SUPPORTED_ADV_SETS, &rsp,
 							sizeof(rsp));
 
@@ -4394,8 +4567,29 @@ static int cmd_read_num_adv_sets(struct btdev *dev, const void *data,
 static int cmd_remove_adv_set(struct btdev *dev, const void *data,
 							uint8_t len)
 {
+	const struct bt_hci_cmd_le_remove_adv_set *cmd = data;
+	struct le_ext_adv *ext_adv;
 	uint8_t status = BT_HCI_ERR_SUCCESS;
 
+	ext_adv = queue_find(dev->le_ext_adv, match_ext_adv_handle,
+						UINT_TO_PTR(cmd->handle));
+	if (!ext_adv) {
+		status = BT_HCI_ERR_UNKNOWN_ADVERTISING_ID;
+		cmd_complete(dev, BT_HCI_CMD_LE_SET_EXT_ADV_DATA, &status,
+						sizeof(status));
+		return 0;
+	}
+
+	if (ext_adv->enable) {
+		status = BT_HCI_ERR_COMMAND_DISALLOWED;
+		cmd_complete(dev, BT_HCI_CMD_LE_REMOVE_ADV_SET, &status,
+						sizeof(status));
+		return 0;
+	}
+
+	queue_remove(dev->le_ext_adv, ext_adv);
+	free(ext_adv);
+
 	cmd_complete(dev, BT_HCI_CMD_LE_REMOVE_ADV_SET, &status,
 							sizeof(status));
 
@@ -4405,8 +4599,23 @@ static int cmd_remove_adv_set(struct btdev *dev, const void *data,
 static int cmd_clear_adv_sets(struct btdev *dev, const void *data,
 							uint8_t len)
 {
+	const struct queue_entry *entry;
 	uint8_t status = BT_HCI_ERR_SUCCESS;
 
+	for (entry = queue_get_entries(dev->le_ext_adv); entry;
+							entry = entry->next) {
+		struct le_ext_adv *ext_adv = entry->data;
+
+		if (ext_adv->enable) {
+			status = BT_HCI_ERR_COMMAND_DISALLOWED;
+			cmd_complete(dev, BT_HCI_CMD_LE_CLEAR_ADV_SETS, &status,
+							sizeof(status));
+			return 0;
+		}
+	}
+
+	queue_remove_all(dev->le_ext_adv, NULL, NULL, le_ext_adv_free);
+
 	cmd_complete(dev, BT_HCI_CMD_LE_CLEAR_ADV_SETS, &status,
 							sizeof(status));
 
@@ -4513,68 +4722,72 @@ static int cmd_set_ext_scan_enable(struct btdev *dev, const void *data,
 	return 0;
 }
 
-static int cmd_set_ext_scan_enable_complete(struct btdev *dev, const void *data,
-							uint8_t len)
+static void scan_ext_adv(struct btdev *dev, struct btdev *remote)
 {
-	const struct bt_hci_cmd_le_set_ext_scan_enable *cmd = data;
-	int i;
-
-	if (!dev->le_scan_enable || !cmd->enable)
-		return 0;
+	const struct queue_entry *entry;
 
-	for (i = 0; i < MAX_BTDEV_ENTRIES; i++) {
+	for (entry = queue_get_entries(remote->le_ext_adv); entry;
+							entry = entry->next) {
+		struct le_ext_adv *ext_adv = entry->data;
 		uint16_t report_type;
 
-		if (!btdev_list[i] || btdev_list[i] == dev)
+		if (!ext_adv->enable)
 			continue;
 
-		if (!btdev_list[i]->le_adv_enable)
+		if (!ext_adv_match_addr(dev, ext_adv))
 			continue;
 
-		if (!ext_adv_match(dev, btdev_list[i]))
-			continue;
-
-		report_type = get_ext_adv_type(btdev_list[i]->le_ext_adv_type);
-		send_ext_adv(dev, btdev_list[i], report_type, false);
+		report_type = get_ext_adv_type(ext_adv->type);
+		send_ext_adv(dev, remote, ext_adv, report_type, false);
 
 		if (dev->le_scan_type != 0x01)
 			continue;
 
 		/* if scannable bit is set the send scan response */
-		if (btdev_list[i]->le_ext_adv_type & 0x02) {
-			if (btdev_list[i]->le_ext_adv_type == 0x13)
+		if (ext_adv->type & 0x02) {
+			if (ext_adv->type == 0x13)
 				report_type = 0x1b;
-			else if (btdev_list[i]->le_ext_adv_type == 0x12)
+			else if (ext_adv->type == 0x12)
 				report_type = 0x1a;
-			else if (!(btdev_list[i]->le_ext_adv_type & 0x10))
+			else if (!(ext_adv->type & 0x10))
 				report_type &= 0x08;
 			else
 				continue;
 
-			send_ext_adv(dev, btdev_list[i], report_type, true);
+			send_ext_adv(dev, remote, ext_adv, report_type, true);
 		}
 	}
-
-	return 0;
 }
 
-static int cmd_ext_create_conn(struct btdev *dev, const void *data, uint8_t len)
+static int cmd_set_ext_scan_enable_complete(struct btdev *dev, const void *data,
+							uint8_t len)
 {
-	cmd_status(dev, BT_HCI_ERR_SUCCESS, BT_HCI_CMD_LE_EXT_CREATE_CONN);
+	const struct bt_hci_cmd_le_set_ext_scan_enable *cmd = data;
+	int i;
+
+	if (!dev->le_scan_enable || !cmd->enable)
+		return 0;
+
+	for (i = 0; i < MAX_BTDEV_ENTRIES; i++) {
+		if (!btdev_list[i] || btdev_list[i] == dev)
+			continue;
+
+		scan_ext_adv(dev, btdev_list[i]);
+	}
 
 	return 0;
 }
 
-static bool ext_adv_connectable(struct btdev *btdev)
+static int cmd_ext_create_conn(struct btdev *dev, const void *data, uint8_t len)
 {
-	if (!btdev->le_adv_enable)
-		return false;
+	cmd_status(dev, BT_HCI_ERR_SUCCESS, BT_HCI_CMD_LE_EXT_CREATE_CONN);
 
-	return btdev->le_ext_adv_type & 0x01;
+	return 0;
 }
 
 static void le_ext_conn_complete(struct btdev *btdev,
 			const struct bt_hci_cmd_le_ext_create_conn *cmd,
+			struct le_ext_adv *ext_adv,
 			uint8_t status)
 {
 	struct bt_hci_evt_le_enhanced_conn_complete ev;
@@ -4589,10 +4802,10 @@ static void le_ext_conn_complete(struct btdev *btdev,
 		if (!conn)
 			return;
 
-		if (!btdev->le_ext_adv_type) {
-			btdev->le_adv_enable = 0;
-			conn->link->dev->le_adv_enable = 0;
-		}
+		/* Disable EXT ADV */
+		queue_foreach(btdev->le_ext_adv, ext_adv_disable, NULL);
+		queue_foreach(conn->link->dev->le_ext_adv, ext_adv_disable,
+									NULL);
 
 		ev.status = status;
 		ev.peer_addr_type = btdev->le_scan_own_addr_type;
@@ -4625,19 +4838,30 @@ static int cmd_ext_create_conn_complete(struct btdev *dev, const void *data,
 							uint8_t len)
 {
 	const struct bt_hci_cmd_le_ext_create_conn *cmd = data;
+	const struct queue_entry *entry;
 	struct btdev *remote;
 
 	dev->le_scan_own_addr_type = cmd->own_addr_type;
 
 	remote = find_btdev_by_bdaddr_type(cmd->peer_addr, cmd->peer_addr_type);
-	if (remote && ext_adv_connectable(remote) &&
-			ext_adv_match(dev, remote) &&
-			remote->le_adv_own_addr == cmd->peer_addr_type)
-		le_ext_conn_complete(dev, cmd, 0);
-	else
-		le_ext_conn_complete(dev, cmd,
+	if (!remote) {
+		le_ext_conn_complete(dev, cmd, NULL,
 					BT_HCI_ERR_CONN_FAILED_TO_ESTABLISH);
+		return 0;
+	}
 
+	for (entry = queue_get_entries(remote->le_ext_adv); entry;
+							entry = entry->next) {
+		struct le_ext_adv *ext_adv = entry->data;
+
+		if (ext_adv_is_connectable(ext_adv) &&
+			ext_adv_match_addr(dev, ext_adv) &&
+			ext_adv->own_addr_type == cmd->peer_addr_type) {
+			le_ext_conn_complete(dev, cmd, ext_adv, 0);
+			return 0;
+		}
+
+	}
 	return 0;
 }
 
@@ -5748,6 +5972,7 @@ struct btdev *btdev_create(enum btdev_type type, uint16_t id)
 	get_bdaddr(id, index, btdev->bdaddr);
 
 	btdev->conns = queue_new();
+	btdev->le_ext_adv = queue_new();
 
 	return btdev;
 }
-- 
2.26.3

