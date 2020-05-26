Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29C211C6A9F
	for <lists+linux-bluetooth@lfdr.de>; Wed,  6 May 2020 09:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728456AbgEFH6D (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 6 May 2020 03:58:03 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:43448 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728364AbgEFH6B (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 6 May 2020 03:58:01 -0400
Received: from localhost.localdomain (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id DCAF4CED03
        for <linux-bluetooth@vger.kernel.org>; Wed,  6 May 2020 10:07:39 +0200 (CEST)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v3 2/7] Bluetooth: Replace BT_DBG with bt_dev_dbg for management support
Date:   Wed,  6 May 2020 09:57:47 +0200
Message-Id: <15b523289abcb258505f094dc2c26f317bd9caa5.1588751831.git.marcel@holtmann.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <4470adb873fbc0f5874038e1d99a63df3a7b59b8.1588751831.git.marcel@holtmann.org>
References: <cover.1588751831.git.marcel@holtmann.org> <4470adb873fbc0f5874038e1d99a63df3a7b59b8.1588751831.git.marcel@holtmann.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The majority of management interaction are based on a controller index
and have a hci_dev associated with it. So use bt_dev_dbg to have a clean
way of indentifying the controller the debug message belongs to.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 net/bluetooth/mgmt.c | 221 +++++++++++++++++++++----------------------
 1 file changed, 110 insertions(+), 111 deletions(-)

diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 33b5640ea060..78cf72b64014 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -294,7 +294,7 @@ static int read_version(struct sock *sk, struct hci_dev *hdev, void *data,
 {
 	struct mgmt_rp_read_version rp;
 
-	BT_DBG("sock %p", sk);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	mgmt_fill_version_info(&rp);
 
@@ -310,7 +310,7 @@ static int read_commands(struct sock *sk, struct hci_dev *hdev, void *data,
 	size_t rp_size;
 	int i, err;
 
-	BT_DBG("sock %p", sk);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	if (hci_sock_test_flag(sk, HCI_SOCK_TRUSTED)) {
 		num_commands = ARRAY_SIZE(mgmt_commands);
@@ -363,7 +363,7 @@ static int read_index_list(struct sock *sk, struct hci_dev *hdev, void *data,
 	u16 count;
 	int err;
 
-	BT_DBG("sock %p", sk);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	read_lock(&hci_dev_list_lock);
 
@@ -397,7 +397,7 @@ static int read_index_list(struct sock *sk, struct hci_dev *hdev, void *data,
 		if (d->dev_type == HCI_PRIMARY &&
 		    !hci_dev_test_flag(d, HCI_UNCONFIGURED)) {
 			rp->index[count++] = cpu_to_le16(d->id);
-			BT_DBG("Added hci%u", d->id);
+			bt_dev_dbg(hdev, "Added hci%u", d->id);
 		}
 	}
 
@@ -423,7 +423,7 @@ static int read_unconf_index_list(struct sock *sk, struct hci_dev *hdev,
 	u16 count;
 	int err;
 
-	BT_DBG("sock %p", sk);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	read_lock(&hci_dev_list_lock);
 
@@ -457,7 +457,7 @@ static int read_unconf_index_list(struct sock *sk, struct hci_dev *hdev,
 		if (d->dev_type == HCI_PRIMARY &&
 		    hci_dev_test_flag(d, HCI_UNCONFIGURED)) {
 			rp->index[count++] = cpu_to_le16(d->id);
-			BT_DBG("Added hci%u", d->id);
+			bt_dev_dbg(hdev, "Added hci%u", d->id);
 		}
 	}
 
@@ -482,7 +482,7 @@ static int read_ext_index_list(struct sock *sk, struct hci_dev *hdev,
 	u16 count;
 	int err;
 
-	BT_DBG("sock %p", sk);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	read_lock(&hci_dev_list_lock);
 
@@ -524,7 +524,7 @@ static int read_ext_index_list(struct sock *sk, struct hci_dev *hdev,
 
 		rp->entry[count].bus = d->bus;
 		rp->entry[count++].index = cpu_to_le16(d->id);
-		BT_DBG("Added hci%u", d->id);
+		bt_dev_dbg(hdev, "Added hci%u", d->id);
 	}
 
 	rp->num_controllers = cpu_to_le16(count);
@@ -600,7 +600,7 @@ static int read_config_info(struct sock *sk, struct hci_dev *hdev,
 	struct mgmt_rp_read_config_info rp;
 	u32 options = 0;
 
-	BT_DBG("sock %p %s", sk, hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	hci_dev_lock(hdev);
 
@@ -940,7 +940,7 @@ static void rpa_expired(struct work_struct *work)
 					    rpa_expired.work);
 	struct hci_request req;
 
-	BT_DBG("");
+	bt_dev_dbg(hdev, "");
 
 	hci_dev_set_flag(hdev, HCI_RPA_EXPIRED);
 
@@ -980,7 +980,7 @@ static int read_controller_info(struct sock *sk, struct hci_dev *hdev,
 {
 	struct mgmt_rp_read_info rp;
 
-	BT_DBG("sock %p %s", sk, hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	hci_dev_lock(hdev);
 
@@ -1036,7 +1036,7 @@ static int read_ext_controller_info(struct sock *sk, struct hci_dev *hdev,
 	struct mgmt_rp_read_ext_info *rp = (void *)buf;
 	u16 eir_len;
 
-	BT_DBG("sock %p %s", sk, hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	memset(&buf, 0, sizeof(buf));
 
@@ -1095,7 +1095,7 @@ static int send_settings_rsp(struct sock *sk, u16 opcode, struct hci_dev *hdev)
 
 static void clean_up_hci_complete(struct hci_dev *hdev, u8 status, u16 opcode)
 {
-	BT_DBG("%s status 0x%02x", hdev->name, status);
+	bt_dev_dbg(hdev, "status 0x%02x", status);
 
 	if (hci_conn_count(hdev) == 0) {
 		cancel_delayed_work(&hdev->power_off);
@@ -1171,7 +1171,7 @@ static int set_powered(struct sock *sk, struct hci_dev *hdev, void *data,
 	struct mgmt_pending_cmd *cmd;
 	int err;
 
-	BT_DBG("request for %s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	if (cp->val != 0x00 && cp->val != 0x01)
 		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_POWERED,
@@ -1312,7 +1312,7 @@ void mgmt_set_discoverable_complete(struct hci_dev *hdev, u8 status)
 {
 	struct mgmt_pending_cmd *cmd;
 
-	BT_DBG("status 0x%02x", status);
+	bt_dev_dbg(hdev, "status 0x%02x", status);
 
 	hci_dev_lock(hdev);
 
@@ -1351,7 +1351,7 @@ static int set_discoverable(struct sock *sk, struct hci_dev *hdev, void *data,
 	u16 timeout;
 	int err;
 
-	BT_DBG("request for %s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	if (!hci_dev_test_flag(hdev, HCI_LE_ENABLED) &&
 	    !hci_dev_test_flag(hdev, HCI_BREDR_ENABLED))
@@ -1477,7 +1477,7 @@ void mgmt_set_connectable_complete(struct hci_dev *hdev, u8 status)
 {
 	struct mgmt_pending_cmd *cmd;
 
-	BT_DBG("status 0x%02x", status);
+	bt_dev_dbg(hdev, "status 0x%02x", status);
 
 	hci_dev_lock(hdev);
 
@@ -1537,7 +1537,7 @@ static int set_connectable(struct sock *sk, struct hci_dev *hdev, void *data,
 	struct mgmt_pending_cmd *cmd;
 	int err;
 
-	BT_DBG("request for %s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	if (!hci_dev_test_flag(hdev, HCI_LE_ENABLED) &&
 	    !hci_dev_test_flag(hdev, HCI_BREDR_ENABLED))
@@ -1594,7 +1594,7 @@ static int set_bondable(struct sock *sk, struct hci_dev *hdev, void *data,
 	bool changed;
 	int err;
 
-	BT_DBG("request for %s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	if (cp->val != 0x00 && cp->val != 0x01)
 		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_BONDABLE,
@@ -1638,7 +1638,7 @@ static int set_link_security(struct sock *sk, struct hci_dev *hdev, void *data,
 	u8 val, status;
 	int err;
 
-	BT_DBG("request for %s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	status = mgmt_bredr_support(hdev);
 	if (status)
@@ -1706,7 +1706,7 @@ static int set_ssp(struct sock *sk, struct hci_dev *hdev, void *data, u16 len)
 	u8 status;
 	int err;
 
-	BT_DBG("request for %s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	status = mgmt_bredr_support(hdev);
 	if (status)
@@ -1787,7 +1787,7 @@ static int set_hs(struct sock *sk, struct hci_dev *hdev, void *data, u16 len)
 	u8 status;
 	int err;
 
-	BT_DBG("request for %s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	status = mgmt_bredr_support(hdev);
 	if (status)
@@ -1893,7 +1893,7 @@ static int set_le(struct sock *sk, struct hci_dev *hdev, void *data, u16 len)
 	int err;
 	u8 val, enabled;
 
-	BT_DBG("request for %s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	if (!lmp_le_capable(hdev))
 		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_LE,
@@ -2054,7 +2054,7 @@ static void mgmt_class_complete(struct hci_dev *hdev, u16 mgmt_op, u8 status)
 
 static void add_uuid_complete(struct hci_dev *hdev, u8 status, u16 opcode)
 {
-	BT_DBG("status 0x%02x", status);
+	bt_dev_dbg(hdev, "status 0x%02x", status);
 
 	mgmt_class_complete(hdev, MGMT_OP_ADD_UUID, status);
 }
@@ -2067,7 +2067,7 @@ static int add_uuid(struct sock *sk, struct hci_dev *hdev, void *data, u16 len)
 	struct bt_uuid *uuid;
 	int err;
 
-	BT_DBG("request for %s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	hci_dev_lock(hdev);
 
@@ -2133,7 +2133,7 @@ static bool enable_service_cache(struct hci_dev *hdev)
 
 static void remove_uuid_complete(struct hci_dev *hdev, u8 status, u16 opcode)
 {
-	BT_DBG("status 0x%02x", status);
+	bt_dev_dbg(hdev, "status 0x%02x", status);
 
 	mgmt_class_complete(hdev, MGMT_OP_REMOVE_UUID, status);
 }
@@ -2148,7 +2148,7 @@ static int remove_uuid(struct sock *sk, struct hci_dev *hdev, void *data,
 	struct hci_request req;
 	int err, found;
 
-	BT_DBG("request for %s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	hci_dev_lock(hdev);
 
@@ -2219,7 +2219,7 @@ static int remove_uuid(struct sock *sk, struct hci_dev *hdev, void *data,
 
 static void set_class_complete(struct hci_dev *hdev, u8 status, u16 opcode)
 {
-	BT_DBG("status 0x%02x", status);
+	bt_dev_dbg(hdev, "status 0x%02x", status);
 
 	mgmt_class_complete(hdev, MGMT_OP_SET_DEV_CLASS, status);
 }
@@ -2232,7 +2232,7 @@ static int set_dev_class(struct sock *sk, struct hci_dev *hdev, void *data,
 	struct hci_request req;
 	int err;
 
-	BT_DBG("request for %s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	if (!lmp_bredr_capable(hdev))
 		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_DEV_CLASS,
@@ -2305,7 +2305,7 @@ static int load_link_keys(struct sock *sk, struct hci_dev *hdev, void *data,
 	bool changed;
 	int i;
 
-	BT_DBG("request for %s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	if (!lmp_bredr_capable(hdev))
 		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_LOAD_LINK_KEYS,
@@ -2331,8 +2331,8 @@ static int load_link_keys(struct sock *sk, struct hci_dev *hdev, void *data,
 		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_LOAD_LINK_KEYS,
 				       MGMT_STATUS_INVALID_PARAMS);
 
-	BT_DBG("%s debug_keys %u key_count %u", hdev->name, cp->debug_keys,
-	       key_count);
+	bt_dev_dbg(hdev, "debug_keys %u key_count %u", cp->debug_keys,
+		   key_count);
 
 	for (i = 0; i < key_count; i++) {
 		struct mgmt_link_key_info *key = &cp->keys[i];
@@ -2533,7 +2533,7 @@ static int disconnect(struct sock *sk, struct hci_dev *hdev, void *data,
 	struct hci_conn *conn;
 	int err;
 
-	BT_DBG("");
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	memset(&rp, 0, sizeof(rp));
 	bacpy(&rp.addr.bdaddr, &cp->addr.bdaddr);
@@ -2617,7 +2617,7 @@ static int get_connections(struct sock *sk, struct hci_dev *hdev, void *data,
 	int err;
 	u16 i;
 
-	BT_DBG("");
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	hci_dev_lock(hdev);
 
@@ -2693,7 +2693,7 @@ static int pin_code_reply(struct sock *sk, struct hci_dev *hdev, void *data,
 	struct mgmt_pending_cmd *cmd;
 	int err;
 
-	BT_DBG("");
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	hci_dev_lock(hdev);
 
@@ -2751,7 +2751,7 @@ static int set_io_capability(struct sock *sk, struct hci_dev *hdev, void *data,
 {
 	struct mgmt_cp_set_io_capability *cp = data;
 
-	BT_DBG("");
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	if (cp->io_capability > SMP_IO_KEYBOARD_DISPLAY)
 		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_IO_CAPABILITY,
@@ -2761,8 +2761,7 @@ static int set_io_capability(struct sock *sk, struct hci_dev *hdev, void *data,
 
 	hdev->io_capability = cp->io_capability;
 
-	BT_DBG("%s IO capability set to 0x%02x", hdev->name,
-	       hdev->io_capability);
+	bt_dev_dbg(hdev, "IO capability set to 0x%02x", hdev->io_capability);
 
 	hci_dev_unlock(hdev);
 
@@ -2874,7 +2873,7 @@ static int pair_device(struct sock *sk, struct hci_dev *hdev, void *data,
 	struct hci_conn *conn;
 	int err;
 
-	BT_DBG("");
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	memset(&rp, 0, sizeof(rp));
 	bacpy(&rp.addr.bdaddr, &cp->addr.bdaddr);
@@ -3003,7 +3002,7 @@ static int cancel_pair_device(struct sock *sk, struct hci_dev *hdev, void *data,
 	struct hci_conn *conn;
 	int err;
 
-	BT_DBG("");
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	hci_dev_lock(hdev);
 
@@ -3114,7 +3113,7 @@ static int pin_code_neg_reply(struct sock *sk, struct hci_dev *hdev,
 {
 	struct mgmt_cp_pin_code_neg_reply *cp = data;
 
-	BT_DBG("");
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	return user_pairing_resp(sk, hdev, &cp->addr,
 				MGMT_OP_PIN_CODE_NEG_REPLY,
@@ -3126,7 +3125,7 @@ static int user_confirm_reply(struct sock *sk, struct hci_dev *hdev, void *data,
 {
 	struct mgmt_cp_user_confirm_reply *cp = data;
 
-	BT_DBG("");
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	if (len != sizeof(*cp))
 		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_USER_CONFIRM_REPLY,
@@ -3142,7 +3141,7 @@ static int user_confirm_neg_reply(struct sock *sk, struct hci_dev *hdev,
 {
 	struct mgmt_cp_user_confirm_neg_reply *cp = data;
 
-	BT_DBG("");
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	return user_pairing_resp(sk, hdev, &cp->addr,
 				 MGMT_OP_USER_CONFIRM_NEG_REPLY,
@@ -3154,7 +3153,7 @@ static int user_passkey_reply(struct sock *sk, struct hci_dev *hdev, void *data,
 {
 	struct mgmt_cp_user_passkey_reply *cp = data;
 
-	BT_DBG("");
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	return user_pairing_resp(sk, hdev, &cp->addr,
 				 MGMT_OP_USER_PASSKEY_REPLY,
@@ -3166,7 +3165,7 @@ static int user_passkey_neg_reply(struct sock *sk, struct hci_dev *hdev,
 {
 	struct mgmt_cp_user_passkey_neg_reply *cp = data;
 
-	BT_DBG("");
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	return user_pairing_resp(sk, hdev, &cp->addr,
 				 MGMT_OP_USER_PASSKEY_NEG_REPLY,
@@ -3207,7 +3206,7 @@ static void set_name_complete(struct hci_dev *hdev, u8 status, u16 opcode)
 	struct mgmt_cp_set_local_name *cp;
 	struct mgmt_pending_cmd *cmd;
 
-	BT_DBG("status 0x%02x", status);
+	bt_dev_dbg(hdev, "status 0x%02x", status);
 
 	hci_dev_lock(hdev);
 
@@ -3242,7 +3241,7 @@ static int set_local_name(struct sock *sk, struct hci_dev *hdev, void *data,
 	struct hci_request req;
 	int err;
 
-	BT_DBG("");
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	hci_dev_lock(hdev);
 
@@ -3311,7 +3310,7 @@ static int set_appearance(struct sock *sk, struct hci_dev *hdev, void *data,
 	u16 appearance;
 	int err;
 
-	BT_DBG("");
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	if (!lmp_le_capable(hdev))
 		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_APPEARANCE,
@@ -3343,7 +3342,7 @@ static int get_phy_configuration(struct sock *sk, struct hci_dev *hdev,
 {
 	struct mgmt_rp_get_phy_confguration rp;
 
-	BT_DBG("sock %p %s", sk, hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	hci_dev_lock(hdev);
 
@@ -3376,7 +3375,7 @@ static void set_default_phy_complete(struct hci_dev *hdev, u8 status,
 {
 	struct mgmt_pending_cmd *cmd;
 
-	BT_DBG("status 0x%02x", status);
+	bt_dev_dbg(hdev, "status 0x%02x", status);
 
 	hci_dev_lock(hdev);
 
@@ -3414,7 +3413,7 @@ static int set_phy_configuration(struct sock *sk, struct hci_dev *hdev,
 	bool changed = false;
 	int err;
 
-	BT_DBG("sock %p %s", sk, hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	configurable_phys = get_configurable_phys(hdev);
 	supported_phys = get_supported_phys(hdev);
@@ -3567,7 +3566,7 @@ static int set_blocked_keys(struct sock *sk, struct hci_dev *hdev, void *data,
 	u16 key_count, expected_len;
 	int i;
 
-	BT_DBG("request for %s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	key_count = __le16_to_cpu(keys->key_count);
 	if (key_count > max_key_count) {
@@ -3613,7 +3612,7 @@ static int set_wideband_speech(struct sock *sk, struct hci_dev *hdev,
 	int err;
 	bool changed = false;
 
-	BT_DBG("request for %s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	if (!test_bit(HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED, &hdev->quirks))
 		return mgmt_cmd_status(sk, hdev->id,
@@ -3718,7 +3717,7 @@ static void read_local_oob_data_complete(struct hci_dev *hdev, u8 status,
 	size_t rp_size = sizeof(mgmt_rp);
 	struct mgmt_pending_cmd *cmd;
 
-	BT_DBG("%s status %u", hdev->name, status);
+	bt_dev_dbg(hdev, "status %u", status);
 
 	cmd = pending_find(MGMT_OP_READ_LOCAL_OOB_DATA, hdev);
 	if (!cmd)
@@ -3777,7 +3776,7 @@ static int read_local_oob_data(struct sock *sk, struct hci_dev *hdev,
 	struct hci_request req;
 	int err;
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	hci_dev_lock(hdev);
 
@@ -3827,7 +3826,7 @@ static int add_remote_oob_data(struct sock *sk, struct hci_dev *hdev,
 	struct mgmt_addr_info *addr = data;
 	int err;
 
-	BT_DBG("%s ", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	if (!bdaddr_type_is_valid(addr->type))
 		return mgmt_cmd_complete(sk, hdev->id,
@@ -3936,7 +3935,7 @@ static int remove_remote_oob_data(struct sock *sk, struct hci_dev *hdev,
 	u8 status;
 	int err;
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	if (cp->addr.type != BDADDR_BREDR)
 		return mgmt_cmd_complete(sk, hdev->id,
@@ -3970,7 +3969,7 @@ void mgmt_start_discovery_complete(struct hci_dev *hdev, u8 status)
 {
 	struct mgmt_pending_cmd *cmd;
 
-	BT_DBG("status %d", status);
+	bt_dev_dbg(hdev, "status %d", status);
 
 	hci_dev_lock(hdev);
 
@@ -4031,7 +4030,7 @@ static int start_discovery_internal(struct sock *sk, struct hci_dev *hdev,
 	u8 status;
 	int err;
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	hci_dev_lock(hdev);
 
@@ -4123,7 +4122,7 @@ static int start_service_discovery(struct sock *sk, struct hci_dev *hdev,
 	u8 status;
 	int err;
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	hci_dev_lock(hdev);
 
@@ -4218,7 +4217,7 @@ void mgmt_stop_discovery_complete(struct hci_dev *hdev, u8 status)
 {
 	struct mgmt_pending_cmd *cmd;
 
-	BT_DBG("status %d", status);
+	bt_dev_dbg(hdev, "status %d", status);
 
 	hci_dev_lock(hdev);
 
@@ -4244,7 +4243,7 @@ static int stop_discovery(struct sock *sk, struct hci_dev *hdev, void *data,
 	struct mgmt_pending_cmd *cmd;
 	int err;
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	hci_dev_lock(hdev);
 
@@ -4286,7 +4285,7 @@ static int confirm_name(struct sock *sk, struct hci_dev *hdev, void *data,
 	struct inquiry_entry *e;
 	int err;
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	hci_dev_lock(hdev);
 
@@ -4328,7 +4327,7 @@ static int block_device(struct sock *sk, struct hci_dev *hdev, void *data,
 	u8 status;
 	int err;
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	if (!bdaddr_type_is_valid(cp->addr.type))
 		return mgmt_cmd_complete(sk, hdev->id, MGMT_OP_BLOCK_DEVICE,
@@ -4364,7 +4363,7 @@ static int unblock_device(struct sock *sk, struct hci_dev *hdev, void *data,
 	u8 status;
 	int err;
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	if (!bdaddr_type_is_valid(cp->addr.type))
 		return mgmt_cmd_complete(sk, hdev->id, MGMT_OP_UNBLOCK_DEVICE,
@@ -4401,7 +4400,7 @@ static int set_device_id(struct sock *sk, struct hci_dev *hdev, void *data,
 	int err;
 	__u16 source;
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	source = __le16_to_cpu(cp->source);
 
@@ -4431,7 +4430,7 @@ static int set_device_id(struct sock *sk, struct hci_dev *hdev, void *data,
 static void enable_advertising_instance(struct hci_dev *hdev, u8 status,
 					u16 opcode)
 {
-	BT_DBG("status %d", status);
+	bt_dev_dbg(hdev, "status %d", status);
 }
 
 static void set_advertising_complete(struct hci_dev *hdev, u8 status,
@@ -4517,7 +4516,7 @@ static int set_advertising(struct sock *sk, struct hci_dev *hdev, void *data,
 	u8 val, status;
 	int err;
 
-	BT_DBG("request for %s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	status = mgmt_le_support(hdev);
 	if (status)
@@ -4626,7 +4625,7 @@ static int set_static_address(struct sock *sk, struct hci_dev *hdev,
 	struct mgmt_cp_set_static_address *cp = data;
 	int err;
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	if (!lmp_le_capable(hdev))
 		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_STATIC_ADDRESS,
@@ -4671,7 +4670,7 @@ static int set_scan_params(struct sock *sk, struct hci_dev *hdev,
 	__u16 interval, window;
 	int err;
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	if (!lmp_le_capable(hdev))
 		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_SCAN_PARAMS,
@@ -4726,7 +4725,7 @@ static void fast_connectable_complete(struct hci_dev *hdev, u8 status,
 {
 	struct mgmt_pending_cmd *cmd;
 
-	BT_DBG("status 0x%02x", status);
+	bt_dev_dbg(hdev, "status 0x%02x", status);
 
 	hci_dev_lock(hdev);
 
@@ -4763,7 +4762,7 @@ static int set_fast_connectable(struct sock *sk, struct hci_dev *hdev,
 	struct hci_request req;
 	int err;
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	if (!hci_dev_test_flag(hdev, HCI_BREDR_ENABLED) ||
 	    hdev->hci_ver < BLUETOOTH_VER_1_2)
@@ -4824,7 +4823,7 @@ static void set_bredr_complete(struct hci_dev *hdev, u8 status, u16 opcode)
 {
 	struct mgmt_pending_cmd *cmd;
 
-	BT_DBG("status 0x%02x", status);
+	bt_dev_dbg(hdev, "status 0x%02x", status);
 
 	hci_dev_lock(hdev);
 
@@ -4859,7 +4858,7 @@ static int set_bredr(struct sock *sk, struct hci_dev *hdev, void *data, u16 len)
 	struct hci_request req;
 	int err;
 
-	BT_DBG("request for %s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	if (!lmp_bredr_capable(hdev) || !lmp_le_capable(hdev))
 		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_BREDR,
@@ -4969,7 +4968,7 @@ static void sc_enable_complete(struct hci_dev *hdev, u8 status, u16 opcode)
 	struct mgmt_pending_cmd *cmd;
 	struct mgmt_mode *cp;
 
-	BT_DBG("%s status %u", hdev->name, status);
+	bt_dev_dbg(hdev, "status %u", status);
 
 	hci_dev_lock(hdev);
 
@@ -5018,7 +5017,7 @@ static int set_secure_conn(struct sock *sk, struct hci_dev *hdev,
 	u8 val;
 	int err;
 
-	BT_DBG("request for %s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	if (!lmp_sc_capable(hdev) &&
 	    !hci_dev_test_flag(hdev, HCI_LE_ENABLED))
@@ -5104,7 +5103,7 @@ static int set_debug_keys(struct sock *sk, struct hci_dev *hdev,
 	bool changed, use_changed;
 	int err;
 
-	BT_DBG("request for %s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	if (cp->val != 0x00 && cp->val != 0x01 && cp->val != 0x02)
 		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_DEBUG_KEYS,
@@ -5151,7 +5150,7 @@ static int set_privacy(struct sock *sk, struct hci_dev *hdev, void *cp_data,
 	bool changed;
 	int err;
 
-	BT_DBG("request for %s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	if (!lmp_le_capable(hdev))
 		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_PRIVACY,
@@ -5226,7 +5225,7 @@ static int load_irks(struct sock *sk, struct hci_dev *hdev, void *cp_data,
 	u16 irk_count, expected_len;
 	int i, err;
 
-	BT_DBG("request for %s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	if (!lmp_le_capable(hdev))
 		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_LOAD_IRKS,
@@ -5248,7 +5247,7 @@ static int load_irks(struct sock *sk, struct hci_dev *hdev, void *cp_data,
 				       MGMT_STATUS_INVALID_PARAMS);
 	}
 
-	BT_DBG("%s irk_count %u", hdev->name, irk_count);
+	bt_dev_dbg(hdev, "irk_count %u", irk_count);
 
 	for (i = 0; i < irk_count; i++) {
 		struct mgmt_irk_info *key = &cp->irks[i];
@@ -5316,7 +5315,7 @@ static int load_long_term_keys(struct sock *sk, struct hci_dev *hdev,
 	u16 key_count, expected_len;
 	int i, err;
 
-	BT_DBG("request for %s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	if (!lmp_le_capable(hdev))
 		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_LOAD_LONG_TERM_KEYS,
@@ -5338,7 +5337,7 @@ static int load_long_term_keys(struct sock *sk, struct hci_dev *hdev,
 				       MGMT_STATUS_INVALID_PARAMS);
 	}
 
-	BT_DBG("%s key_count %u", hdev->name, key_count);
+	bt_dev_dbg(hdev, "key_count %u", key_count);
 
 	for (i = 0; i < key_count; i++) {
 		struct mgmt_ltk_info *key = &cp->keys[i];
@@ -5439,7 +5438,7 @@ static void conn_info_refresh_complete(struct hci_dev *hdev, u8 hci_status,
 	u16 handle;
 	u8 status;
 
-	BT_DBG("status 0x%02x", hci_status);
+	bt_dev_dbg(hdev, "status 0x%02x", hci_status);
 
 	hci_dev_lock(hdev);
 
@@ -5493,7 +5492,7 @@ static int get_conn_info(struct sock *sk, struct hci_dev *hdev, void *data,
 	unsigned long conn_info_age;
 	int err = 0;
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	memset(&rp, 0, sizeof(rp));
 	bacpy(&rp.addr.bdaddr, &cp->addr.bdaddr);
@@ -5647,7 +5646,7 @@ static void get_clock_info_complete(struct hci_dev *hdev, u8 status, u16 opcode)
 	struct mgmt_pending_cmd *cmd;
 	struct hci_conn *conn;
 
-	BT_DBG("%s status %u", hdev->name, status);
+	bt_dev_dbg(hdev, "status %u", status);
 
 	hci_dev_lock(hdev);
 
@@ -5684,7 +5683,7 @@ static int get_clock_info(struct sock *sk, struct hci_dev *hdev, void *data,
 	struct hci_conn *conn;
 	int err;
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	memset(&rp, 0, sizeof(rp));
 	bacpy(&rp.addr.bdaddr, &cp->addr.bdaddr);
@@ -5805,8 +5804,8 @@ static int hci_conn_params_set(struct hci_dev *hdev, bdaddr_t *addr,
 
 	params->auto_connect = auto_connect;
 
-	BT_DBG("addr %pMR (type %u) auto_connect %u", addr, addr_type,
-	       auto_connect);
+	bt_dev_dbg(hdev, "addr %pMR (type %u) auto_connect %u",
+		   addr, addr_type, auto_connect);
 
 	return 0;
 }
@@ -5830,7 +5829,7 @@ static int add_device(struct sock *sk, struct hci_dev *hdev,
 	u8 auto_conn, addr_type;
 	int err;
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	if (!bdaddr_type_is_valid(cp->addr.type) ||
 	    !bacmp(&cp->addr.bdaddr, BDADDR_ANY))
@@ -5928,7 +5927,7 @@ static int remove_device(struct sock *sk, struct hci_dev *hdev,
 	struct mgmt_cp_remove_device *cp = data;
 	int err;
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	hci_dev_lock(hdev);
 
@@ -6037,7 +6036,7 @@ static int remove_device(struct sock *sk, struct hci_dev *hdev,
 			kfree(p);
 		}
 
-		BT_DBG("All LE connection parameters were removed");
+		bt_dev_dbg(hdev, "All LE connection parameters were removed");
 
 		hci_update_background_scan(hdev);
 	}
@@ -6080,7 +6079,7 @@ static int load_conn_param(struct sock *sk, struct hci_dev *hdev, void *data,
 				       MGMT_STATUS_INVALID_PARAMS);
 	}
 
-	BT_DBG("%s param_count %u", hdev->name, param_count);
+	bt_dev_dbg(hdev, "param_count %u", param_count);
 
 	hci_dev_lock(hdev);
 
@@ -6092,8 +6091,8 @@ static int load_conn_param(struct sock *sk, struct hci_dev *hdev, void *data,
 		u16 min, max, latency, timeout;
 		u8 addr_type;
 
-		BT_DBG("Adding %pMR (type %u)", &param->addr.bdaddr,
-		       param->addr.type);
+		bt_dev_dbg(hdev, "Adding %pMR (type %u)", &param->addr.bdaddr,
+			   param->addr.type);
 
 		if (param->addr.type == BDADDR_LE_PUBLIC) {
 			addr_type = ADDR_LE_DEV_PUBLIC;
@@ -6109,8 +6108,8 @@ static int load_conn_param(struct sock *sk, struct hci_dev *hdev, void *data,
 		latency = le16_to_cpu(param->latency);
 		timeout = le16_to_cpu(param->timeout);
 
-		BT_DBG("min 0x%04x max 0x%04x latency 0x%04x timeout 0x%04x",
-		       min, max, latency, timeout);
+		bt_dev_dbg(hdev, "min 0x%04x max 0x%04x latency 0x%04x timeout 0x%04x",
+			   min, max, latency, timeout);
 
 		if (hci_check_conn_params(min, max, latency, timeout) < 0) {
 			bt_dev_err(hdev, "ignoring invalid connection parameters");
@@ -6143,7 +6142,7 @@ static int set_external_config(struct sock *sk, struct hci_dev *hdev,
 	bool changed;
 	int err;
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	if (hdev_is_powered(hdev))
 		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_EXTERNAL_CONFIG,
@@ -6199,7 +6198,7 @@ static int set_public_address(struct sock *sk, struct hci_dev *hdev,
 	bool changed;
 	int err;
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	if (hdev_is_powered(hdev))
 		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_PUBLIC_ADDRESS,
@@ -6254,7 +6253,7 @@ static void read_local_oob_ext_data_complete(struct hci_dev *hdev, u8 status,
 	u16 eir_len;
 	int err;
 
-	BT_DBG("%s status %u", hdev->name, status);
+	bt_dev_dbg(hdev, "status %u", status);
 
 	cmd = pending_find(MGMT_OP_READ_LOCAL_OOB_EXT_DATA, hdev);
 	if (!cmd)
@@ -6393,7 +6392,7 @@ static int read_local_oob_ext_data(struct sock *sk, struct hci_dev *hdev,
 	u8 status, flags, role, addr[7], hash[16], rand[16];
 	int err;
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	if (hdev_is_powered(hdev)) {
 		switch (cp->type) {
@@ -6580,7 +6579,7 @@ static int read_adv_features(struct sock *sk, struct hci_dev *hdev,
 	u32 supported_flags;
 	u8 *instance;
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	if (!lmp_le_capable(hdev))
 		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_READ_ADV_FEATURES,
@@ -6723,7 +6722,7 @@ static void add_advertising_complete(struct hci_dev *hdev, u8 status,
 	struct adv_info *adv_instance, *n;
 	u8 instance;
 
-	BT_DBG("status %d", status);
+	bt_dev_dbg(hdev, "status %d", status);
 
 	hci_dev_lock(hdev);
 
@@ -6782,7 +6781,7 @@ static int add_advertising(struct sock *sk, struct hci_dev *hdev,
 	struct mgmt_pending_cmd *cmd;
 	struct hci_request req;
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	status = mgmt_le_support(hdev);
 	if (status)
@@ -6919,7 +6918,7 @@ static void remove_advertising_complete(struct hci_dev *hdev, u8 status,
 	struct mgmt_cp_remove_advertising *cp;
 	struct mgmt_rp_remove_advertising rp;
 
-	BT_DBG("status %d", status);
+	bt_dev_dbg(hdev, "status %d", status);
 
 	hci_dev_lock(hdev);
 
@@ -6951,7 +6950,7 @@ static int remove_advertising(struct sock *sk, struct hci_dev *hdev,
 	struct hci_request req;
 	int err;
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	hci_dev_lock(hdev);
 
@@ -7023,7 +7022,7 @@ static int get_adv_size_info(struct sock *sk, struct hci_dev *hdev,
 	u32 flags, supported_flags;
 	int err;
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "sock %p", sk);
 
 	if (!lmp_le_capable(hdev))
 		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_GET_ADV_SIZE_INFO,
@@ -7251,7 +7250,7 @@ void mgmt_power_on(struct hci_dev *hdev, int err)
 {
 	struct cmd_lookup match = { NULL, hdev };
 
-	BT_DBG("err %d", err);
+	bt_dev_dbg(hdev, "err %d", err);
 
 	hci_dev_lock(hdev);
 
@@ -7670,7 +7669,7 @@ int mgmt_user_confirm_request(struct hci_dev *hdev, bdaddr_t *bdaddr,
 {
 	struct mgmt_ev_user_confirm_request ev;
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "bdaddr %pMR", bdaddr);
 
 	bacpy(&ev.addr.bdaddr, bdaddr);
 	ev.addr.type = link_to_bdaddr(link_type, addr_type);
@@ -7686,7 +7685,7 @@ int mgmt_user_passkey_request(struct hci_dev *hdev, bdaddr_t *bdaddr,
 {
 	struct mgmt_ev_user_passkey_request ev;
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "bdaddr %pMR", bdaddr);
 
 	bacpy(&ev.addr.bdaddr, bdaddr);
 	ev.addr.type = link_to_bdaddr(link_type, addr_type);
@@ -7747,7 +7746,7 @@ int mgmt_user_passkey_notify(struct hci_dev *hdev, bdaddr_t *bdaddr,
 {
 	struct mgmt_ev_passkey_notify ev;
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "bdaddr %pMR", bdaddr);
 
 	bacpy(&ev.addr.bdaddr, bdaddr);
 	ev.addr.type = link_to_bdaddr(link_type, addr_type);
@@ -8166,7 +8165,7 @@ void mgmt_discovering(struct hci_dev *hdev, u8 discovering)
 {
 	struct mgmt_ev_discovering ev;
 
-	BT_DBG("%s discovering %u", hdev->name, discovering);
+	bt_dev_dbg(hdev, "discovering %u", discovering);
 
 	memset(&ev, 0, sizeof(ev));
 	ev.type = hdev->discovery.type;
-- 
2.26.2

