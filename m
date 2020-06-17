Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56AC61FCFD1
	for <lists+linux-bluetooth@lfdr.de>; Wed, 17 Jun 2020 16:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbgFQOjf (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 17 Jun 2020 10:39:35 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:39215 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727007AbgFQOj3 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 17 Jun 2020 10:39:29 -0400
Received: from localhost.localdomain (p5b3d2638.dip0.t-ipconnect.de [91.61.38.56])
        by mail.holtmann.org (Postfix) with ESMTPSA id D2670CECDA
        for <linux-bluetooth@vger.kernel.org>; Wed, 17 Jun 2020 16:49:16 +0200 (CEST)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v2 05/14] Bluetooth: Add get/set device flags mgmt op
Date:   Wed, 17 Jun 2020 16:39:11 +0200
Message-Id: <146480ca31b6e4caf5c2e4efde2485f63adc0433.1592404644.git.marcel@holtmann.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1592404644.git.marcel@holtmann.org>
References: <cover.1592404644.git.marcel@holtmann.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

Add the get device flags and set device flags mgmt ops and the device
flags changed event. Their behavior is described in detail in
mgmt-api.txt in bluez.

Sample btmon trace when a HID device is added (trimmed to 75 chars):

@ MGMT Command: Unknown (0x0050) plen 11        {0x0001} [hci0] 18:06:14.98
        90 c5 13 cd f3 cd 02 01 00 00 00                 ...........
@ MGMT Event: Unknown (0x002a) plen 15          {0x0004} [hci0] 18:06:14.98
        90 c5 13 cd f3 cd 02 01 00 00 00 01 00 00 00     ...............
@ MGMT Event: Unknown (0x002a) plen 15          {0x0003} [hci0] 18:06:14.98
        90 c5 13 cd f3 cd 02 01 00 00 00 01 00 00 00     ...............
@ MGMT Event: Unknown (0x002a) plen 15          {0x0002} [hci0] 18:06:14.98
        90 c5 13 cd f3 cd 02 01 00 00 00 01 00 00 00     ...............
@ MGMT Event: Command Compl.. (0x0001) plen 10  {0x0001} [hci0] 18:06:14.98
      Unknown (0x0050) plen 7
        Status: Success (0x00)
        90 c5 13 cd f3 cd 02                             .......
@ MGMT Command: Add Device (0x0033) plen 8      {0x0001} [hci0] 18:06:14.98
        LE Address: CD:F3:CD:13:C5:90 (Static)
        Action: Auto-connect remote device (0x02)
@ MGMT Event: Device Added (0x001a) plen 8      {0x0004} [hci0] 18:06:14.98
        LE Address: CD:F3:CD:13:C5:90 (Static)
        Action: Auto-connect remote device (0x02)
@ MGMT Event: Device Added (0x001a) plen 8      {0x0003} [hci0] 18:06:14.98
        LE Address: CD:F3:CD:13:C5:90 (Static)
        Action: Auto-connect remote device (0x02)
@ MGMT Event: Device Added (0x001a) plen 8      {0x0002} [hci0] 18:06:14.98
        LE Address: CD:F3:CD:13:C5:90 (Static)
        Action: Auto-connect remote device (0x02)
@ MGMT Event: Unknown (0x002a) plen 15          {0x0004} [hci0] 18:06:14.98
        90 c5 13 cd f3 cd 02 01 00 00 00 01 00 00 00     ...............
@ MGMT Event: Unknown (0x002a) plen 15          {0x0003} [hci0] 18:06:14.98
        90 c5 13 cd f3 cd 02 01 00 00 00 01 00 00 00     ...............
@ MGMT Event: Unknown (0x002a) plen 15          {0x0002} [hci0] 18:06:14.98
        90 c5 13 cd f3 cd 02 01 00 00 00 01 00 00 00     ...............
@ MGMT Event: Unknown (0x002a) plen 15          {0x0001} [hci0] 18:06:14.98
        90 c5 13 cd f3 cd 02 01 00 00 00 01 00 00 00     ...............

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Reviewed-by: Alain Michaud <alainm@chromium.org>
Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 include/net/bluetooth/mgmt.h |  28 ++++++++
 net/bluetooth/mgmt.c         | 128 +++++++++++++++++++++++++++++++++++
 2 files changed, 156 insertions(+)

diff --git a/include/net/bluetooth/mgmt.h b/include/net/bluetooth/mgmt.h
index e515288f328f..8e47b0c5fe52 100644
--- a/include/net/bluetooth/mgmt.h
+++ b/include/net/bluetooth/mgmt.h
@@ -720,6 +720,27 @@ struct mgmt_rp_set_exp_feature {
 #define MGMT_OP_SET_DEF_RUNTIME_CONFIG	0x004e
 #define MGMT_SET_DEF_RUNTIME_CONFIG_SIZE	0
 
+#define MGMT_OP_GET_DEVICE_FLAGS	0x004F
+#define MGMT_GET_DEVICE_FLAGS_SIZE	7
+struct mgmt_cp_get_device_flags {
+	struct mgmt_addr_info addr;
+} __packed;
+struct mgmt_rp_get_device_flags {
+	struct mgmt_addr_info addr;
+	__le32 supported_flags;
+	__le32 current_flags;
+} __packed;
+
+#define MGMT_OP_SET_DEVICE_FLAGS	0x0050
+#define MGMT_SET_DEVICE_FLAGS_SIZE	11
+struct mgmt_cp_set_device_flags {
+	struct mgmt_addr_info addr;
+	__le32 current_flags;
+} __packed;
+struct mgmt_rp_set_device_flags {
+	struct mgmt_addr_info addr;
+} __packed;
+
 #define MGMT_EV_CMD_COMPLETE		0x0001
 struct mgmt_ev_cmd_complete {
 	__le16	opcode;
@@ -951,3 +972,10 @@ struct mgmt_ev_exp_feature_changed {
 	__u8	uuid[16];
 	__le32	flags;
 } __packed;
+
+#define MGMT_EV_DEVICE_FLAGS_CHANGED		0x002a
+struct mgmt_ev_device_flags_changed {
+	struct mgmt_addr_info addr;
+	__le32 supported_flags;
+	__le32 current_flags;
+} __packed;
diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index d0d0fa832c8a..e409ff48e8e6 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -116,6 +116,8 @@ static const u16 mgmt_commands[] = {
 	MGMT_OP_SET_DEF_SYSTEM_CONFIG,
 	MGMT_OP_READ_DEF_RUNTIME_CONFIG,
 	MGMT_OP_SET_DEF_RUNTIME_CONFIG,
+	MGMT_OP_GET_DEVICE_FLAGS,
+	MGMT_OP_SET_DEVICE_FLAGS,
 };
 
 static const u16 mgmt_events[] = {
@@ -156,6 +158,7 @@ static const u16 mgmt_events[] = {
 	MGMT_EV_EXT_INFO_CHANGED,
 	MGMT_EV_PHY_CONFIGURATION_CHANGED,
 	MGMT_EV_EXP_FEATURE_CHANGED,
+	MGMT_EV_DEVICE_FLAGS_CHANGED,
 };
 
 static const u16 mgmt_untrusted_commands[] = {
@@ -3856,6 +3859,120 @@ static int set_exp_feature(struct sock *sk, struct hci_dev *hdev,
 			       MGMT_STATUS_NOT_SUPPORTED);
 }
 
+#define SUPPORTED_DEVICE_FLAGS() ((1U << HCI_CONN_FLAG_MAX) - 1)
+
+static int get_device_flags(struct sock *sk, struct hci_dev *hdev, void *data,
+			    u16 data_len)
+{
+	struct mgmt_cp_get_device_flags *cp = data;
+	struct mgmt_rp_get_device_flags rp;
+	struct bdaddr_list_with_flags *br_params;
+	struct hci_conn_params *params;
+	u32 supported_flags = SUPPORTED_DEVICE_FLAGS();
+	u32 current_flags = 0;
+	u8 status = MGMT_STATUS_INVALID_PARAMS;
+
+	bt_dev_dbg(hdev, "Get device flags %pMR (type 0x%x)\n",
+		   &cp->addr.bdaddr, cp->addr.type);
+
+	if (cp->addr.type == BDADDR_BREDR) {
+		br_params = hci_bdaddr_list_lookup_with_flags(&hdev->whitelist,
+							      &cp->addr.bdaddr,
+							      cp->addr.type);
+		if (!br_params)
+			goto done;
+
+		current_flags = br_params->current_flags;
+	} else {
+		params = hci_conn_params_lookup(hdev, &cp->addr.bdaddr,
+						le_addr_type(cp->addr.type));
+
+		if (!params)
+			goto done;
+
+		current_flags = params->current_flags;
+	}
+
+	bacpy(&rp.addr.bdaddr, &cp->addr.bdaddr);
+	rp.addr.type = cp->addr.type;
+	rp.supported_flags = cpu_to_le32(supported_flags);
+	rp.current_flags = cpu_to_le32(current_flags);
+
+	status = MGMT_STATUS_SUCCESS;
+
+done:
+	return mgmt_cmd_complete(sk, hdev->id, MGMT_OP_GET_DEVICE_FLAGS, status,
+				&rp, sizeof(rp));
+}
+
+static void device_flags_changed(struct sock *sk, struct hci_dev *hdev,
+				 bdaddr_t *bdaddr, u8 bdaddr_type,
+				 u32 supported_flags, u32 current_flags)
+{
+	struct mgmt_ev_device_flags_changed ev;
+
+	bacpy(&ev.addr.bdaddr, bdaddr);
+	ev.addr.type = bdaddr_type;
+	ev.supported_flags = cpu_to_le32(supported_flags);
+	ev.current_flags = cpu_to_le32(current_flags);
+
+	mgmt_event(MGMT_EV_DEVICE_FLAGS_CHANGED, hdev, &ev, sizeof(ev), sk);
+}
+
+static int set_device_flags(struct sock *sk, struct hci_dev *hdev, void *data,
+			    u16 len)
+{
+	struct mgmt_cp_set_device_flags *cp = data;
+	struct bdaddr_list_with_flags *br_params;
+	struct hci_conn_params *params;
+	u8 status = MGMT_STATUS_INVALID_PARAMS;
+	u32 supported_flags = SUPPORTED_DEVICE_FLAGS();
+	u32 current_flags = __le32_to_cpu(cp->current_flags);
+
+	bt_dev_dbg(hdev, "Set device flags %pMR (type 0x%x) = 0x%x",
+		   &cp->addr.bdaddr, cp->addr.type,
+		   __le32_to_cpu(current_flags));
+
+	if ((supported_flags | current_flags) != supported_flags) {
+		bt_dev_warn(hdev, "Bad flag given (0x%x) vs supported (0x%0x)",
+			    current_flags, supported_flags);
+		goto done;
+	}
+
+	if (cp->addr.type == BDADDR_BREDR) {
+		br_params = hci_bdaddr_list_lookup_with_flags(&hdev->whitelist,
+							      &cp->addr.bdaddr,
+							      cp->addr.type);
+
+		if (br_params) {
+			br_params->current_flags = current_flags;
+			status = MGMT_STATUS_SUCCESS;
+		} else {
+			bt_dev_warn(hdev, "No such BR/EDR device %pMR (0x%x)",
+				    &cp->addr.bdaddr, cp->addr.type);
+		}
+	} else {
+		params = hci_conn_params_lookup(hdev, &cp->addr.bdaddr,
+						le_addr_type(cp->addr.type));
+		if (params) {
+			params->current_flags = current_flags;
+			status = MGMT_STATUS_SUCCESS;
+		} else {
+			bt_dev_warn(hdev, "No such LE device %pMR (0x%x)",
+				    &cp->addr.bdaddr,
+				    le_addr_type(cp->addr.type));
+		}
+	}
+
+done:
+	if (status == MGMT_STATUS_SUCCESS)
+		device_flags_changed(sk, hdev, &cp->addr.bdaddr, cp->addr.type,
+				     supported_flags, current_flags);
+
+	return mgmt_cmd_complete(sk, hdev->id, MGMT_OP_SET_DEVICE_FLAGS, status,
+				 &cp->addr, sizeof(cp->addr));
+}
+
 static void read_local_oob_data_complete(struct hci_dev *hdev, u8 status,
 				         u16 opcode, struct sk_buff *skb)
 {
@@ -5973,7 +6090,9 @@ static int add_device(struct sock *sk, struct hci_dev *hdev,
 {
 	struct mgmt_cp_add_device *cp = data;
 	u8 auto_conn, addr_type;
+	struct hci_conn_params *params;
 	int err;
+	u32 current_flags = 0;
 
 	bt_dev_dbg(hdev, "sock %p", sk);
 
@@ -6041,12 +6160,19 @@ static int add_device(struct sock *sk, struct hci_dev *hdev,
 					MGMT_STATUS_FAILED, &cp->addr,
 					sizeof(cp->addr));
 		goto unlock;
+	} else {
+		params = hci_conn_params_lookup(hdev, &cp->addr.bdaddr,
+						addr_type);
+		if (params)
+			current_flags = params->current_flags;
 	}
 
 	hci_update_background_scan(hdev);
 
 added:
 	device_added(sk, hdev, &cp->addr.bdaddr, cp->addr.type, cp->action);
+	device_flags_changed(NULL, hdev, &cp->addr.bdaddr, cp->addr.type,
+			     SUPPORTED_DEVICE_FLAGS(), current_flags);
 
 	err = mgmt_cmd_complete(sk, hdev->id, MGMT_OP_ADD_DEVICE,
 				MGMT_STATUS_SUCCESS, &cp->addr,
@@ -7313,6 +7439,8 @@ static const struct hci_mgmt_handler mgmt_handlers[] = {
 						HCI_MGMT_UNTRUSTED },
 	{ set_def_runtime_config,  MGMT_SET_DEF_RUNTIME_CONFIG_SIZE,
 						HCI_MGMT_VAR_LEN },
+	{ get_device_flags,        MGMT_GET_DEVICE_FLAGS_SIZE },
+	{ set_device_flags,        MGMT_SET_DEVICE_FLAGS_SIZE },
 };
 
 void mgmt_index_added(struct hci_dev *hdev)
-- 
2.26.2

