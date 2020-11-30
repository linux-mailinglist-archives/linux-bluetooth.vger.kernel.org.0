Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D3A32C91C8
	for <lists+linux-bluetooth@lfdr.de>; Tue,  1 Dec 2020 00:01:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388687AbgK3W6n (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 30 Nov 2020 17:58:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388685AbgK3W6m (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 30 Nov 2020 17:58:42 -0500
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 174DAC061A4E
        for <linux-bluetooth@vger.kernel.org>; Mon, 30 Nov 2020 14:57:55 -0800 (PST)
Received: by mail-qv1-xf49.google.com with SMTP id l15so8635646qvu.8
        for <linux-bluetooth@vger.kernel.org>; Mon, 30 Nov 2020 14:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=ehE6FGDTRLut75HM1rL7X180RviZI2UEg3QWMuMbOa4=;
        b=WfqYkhf+6S2SyF/CxVP0uVMEk6hLku2sXgL0eDVdff/WknI3As1PdU9I+x7uejLF4Y
         VAT9Vhhzxr5g//QdwLQmyq2N2CFGdM4Qy7aUswS+MFL1mCejG6bDpirkEyllGntSBb31
         r9zVLoxoSKL6aFLaM2LdHHUzGy13sdA0JMfcUAWtu+JO1kg6ZoVYUhnF14woLIZlzdKY
         6Gbr8yVT+Y8Tm7m+VWCFTuBLuig2Sa079zDctCCTwV50fbeTkw+V/uYCT0CX9eFfRC/E
         AMSt0buK+PJBvHU25/2jsH9zS0KwOz/8nHO/3kj2BJ4MJneIs+9sK88kv3SwjdbWDsHP
         Q2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ehE6FGDTRLut75HM1rL7X180RviZI2UEg3QWMuMbOa4=;
        b=hNfugIkUoW/BSmmzOLiy1L+eOm8Ub/AsUu1M6Yds9uJ2Dr4w1jEYMD34vHG3c/mZ0o
         54Gfl9Fsg6//5FuQREYKdPcI6QiLjb1HbRJxhLVRdxl/owSWXg3hxGS52I+0g8hoYYIe
         711rN34iARPlNIJqqA2TmeHtpisaf7yETrYMMbXttfPyIueHI5FjF50QRH5DnSfJaCad
         WTIGk2riD3xok1pyJ+WsYHiBKXDdsj0bm1F4njtJUebTnWc8qqWw79cNX9+3j+dBaYB9
         JSoZ2bS7AOE6OuEkPoamIfX6Vrwhg8B3cTVH/H1WS92RLyxksKshOx9k7FrHuTGFGo2g
         8UFA==
X-Gm-Message-State: AOAM530vLymyQZGEWQC0krRhc8VtlV0rgcY+us/jsmRmyPmAJ7D00gXP
        rv2/va5cHWxqIjyAifWSXTQGXH+MojS+MQ6egc7T
X-Google-Smtp-Source: ABdhPJyTS/VBmVeY0JpSPPUBbV10sm5cKhnIsslAHTohps2QJUB7Zyiv7VhZMegwpn7k2oRFfhK3ZM2m6AxBlMUZsElr
Sender: "danielwinkler via sendgmr" 
        <danielwinkler@danielwinkler-linux.mtv.corp.google.com>
X-Received: from danielwinkler-linux.mtv.corp.google.com ([2620:15c:202:201:f693:9fff:fef4:4e59])
 (user=danielwinkler job=sendgmr) by 2002:ad4:5483:: with SMTP id
 q3mr98661qvy.24.1606777074288; Mon, 30 Nov 2020 14:57:54 -0800 (PST)
Date:   Mon, 30 Nov 2020 14:57:41 -0800
In-Reply-To: <20201130225744.3793244-1-danielwinkler@google.com>
Message-Id: <20201130145609.v6.2.Id8bee28ed00d158d0894b32c0cd94baa5a012605@changeid>
Mime-Version: 1.0
References: <20201130225744.3793244-1-danielwinkler@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v6 2/5] Bluetooth: Break add adv into two mgmt commands
From:   Daniel Winkler <danielwinkler@google.com>
To:     marcel@holtmann.org
Cc:     linux-bluetooth@vger.kernel.org,
        chromeos-bluetooth-upstreaming@chromium.org,
        Daniel Winkler <danielwinkler@google.com>,
        Sonny Sasaka <sonnysasaka@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch adds support for the new advertising add interface, with the
first command setting advertising parameters and the second to set
advertising data. The set parameters command allows the caller to leave
some fields "unset", with a params bitfield defining which params were
purposefully set. Unset parameters will be given defaults when calling
hci_add_adv_instance. The data passed to the param mgmt command is
allowed to be flexible, so in the future if bluetoothd passes a larger
structure with new params, the mgmt command will ignore the unknown
members at the end.

This change has been validated on both hatch (extended advertising) and
kukui (no extended advertising) chromebooks running bluetoothd that
support this new interface. I ran the following manual tests:
- Set several (3) advertisements using modified test_advertisement.py
- For each, validate correct data and parameters in btmon trace
- Verified both for software rotation and extended adv

Automatic test suite also run, testing many (25) scenarios of single and
multi-advertising for data/parameter correctness.

Reviewed-by: Sonny Sasaka <sonnysasaka@chromium.org>
Signed-off-by: Daniel Winkler <danielwinkler@google.com>
---

Changes in v6: None
Changes in v5:
- Ensure data/scan rsp length is returned for non-ext adv

Changes in v4:
- Add remaining data and scan response length to MGMT params response
- Moving optional params into 'flags' field of MGMT command

Changes in v3:
- Adding selected tx power to adv params mgmt response, removing event

Changes in v2: None

 include/net/bluetooth/hci_core.h |   2 +
 include/net/bluetooth/mgmt.h     |  34 +++
 net/bluetooth/hci_event.c        |   1 +
 net/bluetooth/mgmt.c             | 381 ++++++++++++++++++++++++++++++-
 4 files changed, 407 insertions(+), 11 deletions(-)

diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index 300b3572d479e1..48d144ae8b57d6 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -238,6 +238,8 @@ struct adv_info {
 #define HCI_MAX_ADV_INSTANCES		5
 #define HCI_DEFAULT_ADV_DURATION	2
 
+#define HCI_ADV_TX_POWER_NO_PREFERENCE 0x7F
+
 struct adv_pattern {
 	struct list_head list;
 	__u8 ad_type;
diff --git a/include/net/bluetooth/mgmt.h b/include/net/bluetooth/mgmt.h
index d8367850e8cd5f..2e18e4173e2fa5 100644
--- a/include/net/bluetooth/mgmt.h
+++ b/include/net/bluetooth/mgmt.h
@@ -574,6 +574,10 @@ struct mgmt_rp_add_advertising {
 #define MGMT_ADV_FLAG_SEC_CODED 	BIT(9)
 #define MGMT_ADV_FLAG_CAN_SET_TX_POWER	BIT(10)
 #define MGMT_ADV_FLAG_HW_OFFLOAD	BIT(11)
+#define MGMT_ADV_PARAM_DURATION		BIT(12)
+#define MGMT_ADV_PARAM_TIMEOUT		BIT(13)
+#define MGMT_ADV_PARAM_INTERVALS	BIT(14)
+#define MGMT_ADV_PARAM_TX_POWER		BIT(15)
 
 #define MGMT_ADV_FLAG_SEC_MASK	(MGMT_ADV_FLAG_SEC_1M | MGMT_ADV_FLAG_SEC_2M | \
 				 MGMT_ADV_FLAG_SEC_CODED)
@@ -782,6 +786,36 @@ struct mgmt_rp_remove_adv_monitor {
 	__le16 monitor_handle;
 } __packed;
 
+#define MGMT_OP_ADD_EXT_ADV_PARAMS		0x0054
+struct mgmt_cp_add_ext_adv_params {
+	__u8	instance;
+	__le32	flags;
+	__le16	duration;
+	__le16	timeout;
+	__le32	min_interval;
+	__le32	max_interval;
+	__s8	tx_power;
+} __packed;
+#define MGMT_ADD_EXT_ADV_PARAMS_MIN_SIZE	18
+struct mgmt_rp_add_ext_adv_params {
+	__u8	instance;
+	__s8	tx_power;
+	__u8	max_adv_data_len;
+	__u8	max_scan_rsp_len;
+} __packed;
+
+#define MGMT_OP_ADD_EXT_ADV_DATA		0x0055
+struct mgmt_cp_add_ext_adv_data {
+	__u8	instance;
+	__u8	adv_data_len;
+	__u8	scan_rsp_len;
+	__u8	data[];
+} __packed;
+#define MGMT_ADD_EXT_ADV_DATA_SIZE	3
+struct mgmt_rp_add_ext_adv_data {
+	__u8	instance;
+} __packed;
+
 #define MGMT_EV_CMD_COMPLETE		0x0001
 struct mgmt_ev_cmd_complete {
 	__le16	opcode;
diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 8281a5ce0f739b..f193e73ef47c14 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -1752,6 +1752,7 @@ static void hci_cc_set_ext_adv_param(struct hci_dev *hdev, struct sk_buff *skb)
 	}
 	/* Update adv data as tx power is known now */
 	hci_req_update_adv_data(hdev, hdev->cur_adv_instance);
+
 	hci_dev_unlock(hdev);
 }
 
diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 3dfed4efa078b6..ec6b520be368be 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -122,6 +122,8 @@ static const u16 mgmt_commands[] = {
 	MGMT_OP_READ_ADV_MONITOR_FEATURES,
 	MGMT_OP_ADD_ADV_PATTERNS_MONITOR,
 	MGMT_OP_REMOVE_ADV_MONITOR,
+	MGMT_OP_ADD_EXT_ADV_PARAMS,
+	MGMT_OP_ADD_EXT_ADV_DATA,
 };
 
 static const u16 mgmt_events[] = {
@@ -7203,6 +7205,10 @@ static u32 get_supported_adv_flags(struct hci_dev *hdev)
 	flags |= MGMT_ADV_FLAG_MANAGED_FLAGS;
 	flags |= MGMT_ADV_FLAG_APPEARANCE;
 	flags |= MGMT_ADV_FLAG_LOCAL_NAME;
+	flags |= MGMT_ADV_PARAM_DURATION;
+	flags |= MGMT_ADV_PARAM_TIMEOUT;
+	flags |= MGMT_ADV_PARAM_INTERVALS;
+	flags |= MGMT_ADV_PARAM_TX_POWER;
 
 	/* In extended adv TX_POWER returned from Set Adv Param
 	 * will be always valid.
@@ -7377,6 +7383,31 @@ static bool tlv_data_is_valid(struct hci_dev *hdev, u32 adv_flags, u8 *data,
 	return true;
 }
 
+static bool requested_adv_flags_are_valid(struct hci_dev *hdev, u32 adv_flags)
+{
+	u32 supported_flags, phy_flags;
+
+	/* The current implementation only supports a subset of the specified
+	 * flags. Also need to check mutual exclusiveness of sec flags.
+	 */
+	supported_flags = get_supported_adv_flags(hdev);
+	phy_flags = adv_flags & MGMT_ADV_FLAG_SEC_MASK;
+	if (adv_flags & ~supported_flags ||
+	    ((phy_flags && (phy_flags ^ (phy_flags & -phy_flags)))))
+		return false;
+
+	return true;
+}
+
+static bool adv_busy(struct hci_dev *hdev)
+{
+	return (pending_find(MGMT_OP_ADD_ADVERTISING, hdev) ||
+		pending_find(MGMT_OP_REMOVE_ADVERTISING, hdev) ||
+		pending_find(MGMT_OP_SET_LE, hdev) ||
+		pending_find(MGMT_OP_ADD_EXT_ADV_PARAMS, hdev) ||
+		pending_find(MGMT_OP_ADD_EXT_ADV_DATA, hdev));
+}
+
 static void add_advertising_complete(struct hci_dev *hdev, u8 status,
 				     u16 opcode)
 {
@@ -7391,6 +7422,8 @@ static void add_advertising_complete(struct hci_dev *hdev, u8 status,
 	hci_dev_lock(hdev);
 
 	cmd = pending_find(MGMT_OP_ADD_ADVERTISING, hdev);
+	if (!cmd)
+		cmd = pending_find(MGMT_OP_ADD_EXT_ADV_DATA, hdev);
 
 	list_for_each_entry_safe(adv_instance, n, &hdev->adv_instances, list) {
 		if (!adv_instance->pending)
@@ -7435,7 +7468,6 @@ static int add_advertising(struct sock *sk, struct hci_dev *hdev,
 	struct mgmt_cp_add_advertising *cp = data;
 	struct mgmt_rp_add_advertising rp;
 	u32 flags;
-	u32 supported_flags, phy_flags;
 	u8 status;
 	u16 timeout, duration;
 	unsigned int prev_instance_cnt = hdev->adv_instance_cnt;
@@ -7471,13 +7503,7 @@ static int add_advertising(struct sock *sk, struct hci_dev *hdev,
 	timeout = __le16_to_cpu(cp->timeout);
 	duration = __le16_to_cpu(cp->duration);
 
-	/* The current implementation only supports a subset of the specified
-	 * flags. Also need to check mutual exclusiveness of sec flags.
-	 */
-	supported_flags = get_supported_adv_flags(hdev);
-	phy_flags = flags & MGMT_ADV_FLAG_SEC_MASK;
-	if (flags & ~supported_flags ||
-	    ((phy_flags && (phy_flags ^ (phy_flags & -phy_flags)))))
+	if (!requested_adv_flags_are_valid(hdev, flags))
 		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_ADD_ADVERTISING,
 				       MGMT_STATUS_INVALID_PARAMS);
 
@@ -7489,9 +7515,7 @@ static int add_advertising(struct sock *sk, struct hci_dev *hdev,
 		goto unlock;
 	}
 
-	if (pending_find(MGMT_OP_ADD_ADVERTISING, hdev) ||
-	    pending_find(MGMT_OP_REMOVE_ADVERTISING, hdev) ||
-	    pending_find(MGMT_OP_SET_LE, hdev)) {
+	if (adv_busy(hdev)) {
 		err = mgmt_cmd_status(sk, hdev->id, MGMT_OP_ADD_ADVERTISING,
 				      MGMT_STATUS_BUSY);
 		goto unlock;
@@ -7582,6 +7606,337 @@ static int add_advertising(struct sock *sk, struct hci_dev *hdev,
 	return err;
 }
 
+static void add_ext_adv_params_complete(struct hci_dev *hdev, u8 status,
+					u16 opcode)
+{
+	struct mgmt_pending_cmd *cmd;
+	struct mgmt_cp_add_ext_adv_params *cp;
+	struct mgmt_rp_add_ext_adv_params rp;
+	struct adv_info *adv_instance;
+	u32 flags;
+
+	BT_DBG("%s", hdev->name);
+
+	hci_dev_lock(hdev);
+
+	cmd = pending_find(MGMT_OP_ADD_EXT_ADV_PARAMS, hdev);
+	if (!cmd)
+		goto unlock;
+
+	cp = cmd->param;
+	adv_instance = hci_find_adv_instance(hdev, cp->instance);
+	if (!adv_instance)
+		goto unlock;
+
+	rp.instance = cp->instance;
+	rp.tx_power = adv_instance->tx_power;
+
+	/* While we're at it, inform userspace of the available space for this
+	 * advertisement, given the flags that will be used.
+	 */
+	flags = __le32_to_cpu(cp->flags);
+	rp.max_adv_data_len = tlv_data_max_len(hdev, flags, true);
+	rp.max_scan_rsp_len = tlv_data_max_len(hdev, flags, false);
+
+	if (status) {
+		/* If this advertisement was previously advertising and we
+		 * failed to update it, we signal that it has been removed and
+		 * delete its structure
+		 */
+		if (!adv_instance->pending)
+			mgmt_advertising_removed(cmd->sk, hdev, cp->instance);
+
+		hci_remove_adv_instance(hdev, cp->instance);
+
+		mgmt_cmd_status(cmd->sk, cmd->index, cmd->opcode,
+				mgmt_status(status));
+
+	} else {
+		mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode,
+				  mgmt_status(status), &rp, sizeof(rp));
+	}
+
+unlock:
+	if (cmd)
+		mgmt_pending_remove(cmd);
+
+	hci_dev_unlock(hdev);
+}
+
+static int add_ext_adv_params(struct sock *sk, struct hci_dev *hdev,
+			      void *data, u16 data_len)
+{
+	struct mgmt_cp_add_ext_adv_params *cp = data;
+	struct mgmt_rp_add_ext_adv_params rp;
+	struct mgmt_pending_cmd *cmd = NULL;
+	struct adv_info *adv_instance;
+	struct hci_request req;
+	u32 flags, min_interval, max_interval;
+	u16 timeout, duration;
+	u8 status;
+	s8 tx_power;
+	int err;
+
+	BT_DBG("%s", hdev->name);
+
+	status = mgmt_le_support(hdev);
+	if (status)
+		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_ADD_EXT_ADV_PARAMS,
+				       status);
+
+	if (cp->instance < 1 || cp->instance > hdev->le_num_of_adv_sets)
+		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_ADD_EXT_ADV_PARAMS,
+				       MGMT_STATUS_INVALID_PARAMS);
+
+	/* The purpose of breaking add_advertising into two separate MGMT calls
+	 * for params and data is to allow more parameters to be added to this
+	 * structure in the future. For this reason, we verify that we have the
+	 * bare minimum structure we know of when the interface was defined. Any
+	 * extra parameters we don't know about will be ignored in this request.
+	 */
+	if (data_len < MGMT_ADD_EXT_ADV_PARAMS_MIN_SIZE)
+		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_ADD_ADVERTISING,
+				       MGMT_STATUS_INVALID_PARAMS);
+
+	flags = __le32_to_cpu(cp->flags);
+
+	if (!requested_adv_flags_are_valid(hdev, flags))
+		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_ADD_EXT_ADV_PARAMS,
+				       MGMT_STATUS_INVALID_PARAMS);
+
+	hci_dev_lock(hdev);
+
+	/* In new interface, we require that we are powered to register */
+	if (!hdev_is_powered(hdev)) {
+		err = mgmt_cmd_status(sk, hdev->id, MGMT_OP_ADD_EXT_ADV_PARAMS,
+				      MGMT_STATUS_REJECTED);
+		goto unlock;
+	}
+
+	if (adv_busy(hdev)) {
+		err = mgmt_cmd_status(sk, hdev->id, MGMT_OP_ADD_EXT_ADV_PARAMS,
+				      MGMT_STATUS_BUSY);
+		goto unlock;
+	}
+
+	/* Parse defined parameters from request, use defaults otherwise */
+	timeout = (flags & MGMT_ADV_PARAM_TIMEOUT) ?
+		  __le16_to_cpu(cp->timeout) : 0;
+
+	duration = (flags & MGMT_ADV_PARAM_DURATION) ?
+		   __le16_to_cpu(cp->duration) :
+		   hdev->def_multi_adv_rotation_duration;
+
+	min_interval = (flags & MGMT_ADV_PARAM_INTERVALS) ?
+		       __le32_to_cpu(cp->min_interval) :
+		       hdev->le_adv_min_interval;
+
+	max_interval = (flags & MGMT_ADV_PARAM_INTERVALS) ?
+		       __le32_to_cpu(cp->max_interval) :
+		       hdev->le_adv_max_interval;
+
+	tx_power = (flags & MGMT_ADV_PARAM_TX_POWER) ?
+		   cp->tx_power :
+		   HCI_ADV_TX_POWER_NO_PREFERENCE;
+
+	/* Create advertising instance with no advertising or response data */
+	err = hci_add_adv_instance(hdev, cp->instance, flags,
+				   0, NULL, 0, NULL, timeout, duration);
+
+	if (err < 0) {
+		err = mgmt_cmd_status(sk, hdev->id, MGMT_OP_ADD_EXT_ADV_PARAMS,
+				      MGMT_STATUS_FAILED);
+		goto unlock;
+	}
+
+	hdev->cur_adv_instance = cp->instance;
+	/* Submit request for advertising params if ext adv available */
+	if (ext_adv_capable(hdev)) {
+		hci_req_init(&req, hdev);
+		adv_instance = hci_find_adv_instance(hdev, cp->instance);
+
+		/* Updating parameters of an active instance will return a
+		 * Command Disallowed error, so we must first disable the
+		 * instance if it is active.
+		 */
+		if (!adv_instance->pending)
+			__hci_req_disable_ext_adv_instance(&req, cp->instance);
+
+		__hci_req_setup_ext_adv_instance(&req, cp->instance);
+
+		err = hci_req_run(&req, add_ext_adv_params_complete);
+
+		if (!err)
+			cmd = mgmt_pending_add(sk, MGMT_OP_ADD_EXT_ADV_PARAMS,
+					       hdev, data, data_len);
+		if (!cmd) {
+			err = -ENOMEM;
+			hci_remove_adv_instance(hdev, cp->instance);
+			goto unlock;
+		}
+
+	} else {
+		rp.instance = cp->instance;
+		rp.tx_power = HCI_ADV_TX_POWER_NO_PREFERENCE;
+		rp.max_adv_data_len = tlv_data_max_len(hdev, flags, true);
+		rp.max_scan_rsp_len = tlv_data_max_len(hdev, flags, false);
+		err = mgmt_cmd_complete(sk, hdev->id,
+					MGMT_OP_ADD_EXT_ADV_PARAMS,
+					MGMT_STATUS_SUCCESS, &rp, sizeof(rp));
+	}
+
+unlock:
+	hci_dev_unlock(hdev);
+
+	return err;
+}
+
+static int add_ext_adv_data(struct sock *sk, struct hci_dev *hdev, void *data,
+			    u16 data_len)
+{
+	struct mgmt_cp_add_ext_adv_data *cp = data;
+	struct mgmt_rp_add_ext_adv_data rp;
+	u8 schedule_instance = 0;
+	struct adv_info *next_instance;
+	struct adv_info *adv_instance;
+	int err = 0;
+	struct mgmt_pending_cmd *cmd;
+	struct hci_request req;
+
+	BT_DBG("%s", hdev->name);
+
+	hci_dev_lock(hdev);
+
+	adv_instance = hci_find_adv_instance(hdev, cp->instance);
+
+	if (!adv_instance) {
+		err = mgmt_cmd_status(sk, hdev->id, MGMT_OP_ADD_EXT_ADV_DATA,
+				      MGMT_STATUS_INVALID_PARAMS);
+		goto unlock;
+	}
+
+	/* In new interface, we require that we are powered to register */
+	if (!hdev_is_powered(hdev)) {
+		err = mgmt_cmd_status(sk, hdev->id, MGMT_OP_ADD_EXT_ADV_DATA,
+				      MGMT_STATUS_REJECTED);
+		goto clear_new_instance;
+	}
+
+	if (adv_busy(hdev)) {
+		err = mgmt_cmd_status(sk, hdev->id, MGMT_OP_ADD_EXT_ADV_DATA,
+				      MGMT_STATUS_BUSY);
+		goto clear_new_instance;
+	}
+
+	/* Validate new data */
+	if (!tlv_data_is_valid(hdev, adv_instance->flags, cp->data,
+			       cp->adv_data_len, true) ||
+	    !tlv_data_is_valid(hdev, adv_instance->flags, cp->data +
+			       cp->adv_data_len, cp->scan_rsp_len, false)) {
+		err = mgmt_cmd_status(sk, hdev->id, MGMT_OP_ADD_EXT_ADV_DATA,
+				      MGMT_STATUS_INVALID_PARAMS);
+		goto clear_new_instance;
+	}
+
+	/* Set the data in the advertising instance */
+	hci_set_adv_instance_data(hdev, cp->instance, cp->adv_data_len,
+				  cp->data, cp->scan_rsp_len,
+				  cp->data + cp->adv_data_len);
+
+	/* We're good to go, update advertising data, parameters, and start
+	 * advertising.
+	 */
+
+	hci_req_init(&req, hdev);
+
+	hci_req_add(&req, HCI_OP_READ_LOCAL_NAME, 0, NULL);
+
+	if (ext_adv_capable(hdev)) {
+		__hci_req_update_adv_data(&req, cp->instance);
+		__hci_req_update_scan_rsp_data(&req, cp->instance);
+		__hci_req_enable_ext_advertising(&req, cp->instance);
+
+	} else {
+		/* If using software rotation, determine next instance to use */
+
+		if (hdev->cur_adv_instance == cp->instance) {
+			/* If the currently advertised instance is being changed
+			 * then cancel the current advertising and schedule the
+			 * next instance. If there is only one instance then the
+			 * overridden advertising data will be visible right
+			 * away
+			 */
+			cancel_adv_timeout(hdev);
+
+			next_instance = hci_get_next_instance(hdev,
+							      cp->instance);
+			if (next_instance)
+				schedule_instance = next_instance->instance;
+		} else if (!hdev->adv_instance_timeout) {
+			/* Immediately advertise the new instance if no other
+			 * instance is currently being advertised.
+			 */
+			schedule_instance = cp->instance;
+		}
+
+		/* If the HCI_ADVERTISING flag is set or there is no instance to
+		 * be advertised then we have no HCI communication to make.
+		 * Simply return.
+		 */
+		if (hci_dev_test_flag(hdev, HCI_ADVERTISING) ||
+		    !schedule_instance) {
+			if (adv_instance->pending) {
+				mgmt_advertising_added(sk, hdev, cp->instance);
+				adv_instance->pending = false;
+			}
+			rp.instance = cp->instance;
+			err = mgmt_cmd_complete(sk, hdev->id,
+						MGMT_OP_ADD_EXT_ADV_DATA,
+						MGMT_STATUS_SUCCESS, &rp,
+						sizeof(rp));
+			goto unlock;
+		}
+
+		err = __hci_req_schedule_adv_instance(&req, schedule_instance,
+						      true);
+	}
+
+	cmd = mgmt_pending_add(sk, MGMT_OP_ADD_EXT_ADV_DATA, hdev, data,
+			       data_len);
+	if (!cmd) {
+		err = -ENOMEM;
+		goto clear_new_instance;
+	}
+
+	if (!err)
+		err = hci_req_run(&req, add_advertising_complete);
+
+	if (err < 0) {
+		err = mgmt_cmd_status(sk, hdev->id, MGMT_OP_ADD_EXT_ADV_DATA,
+				      MGMT_STATUS_FAILED);
+		mgmt_pending_remove(cmd);
+		goto clear_new_instance;
+	}
+
+	/* We were successful in updating data, so trigger advertising_added
+	 * event if this is an instance that wasn't previously advertising. If
+	 * a failure occurs in the requests we initiated, we will remove the
+	 * instance again in add_advertising_complete
+	 */
+	if (adv_instance->pending)
+		mgmt_advertising_added(sk, hdev, cp->instance);
+
+	goto unlock;
+
+clear_new_instance:
+	hci_remove_adv_instance(hdev, cp->instance);
+
+unlock:
+	hci_dev_unlock(hdev);
+
+	return err;
+}
+
 static void remove_advertising_complete(struct hci_dev *hdev, u8 status,
 					u16 opcode)
 {
@@ -7856,6 +8211,10 @@ static const struct hci_mgmt_handler mgmt_handlers[] = {
 	{ add_adv_patterns_monitor,MGMT_ADD_ADV_PATTERNS_MONITOR_SIZE,
 						HCI_MGMT_VAR_LEN },
 	{ remove_adv_monitor,      MGMT_REMOVE_ADV_MONITOR_SIZE },
+	{ add_ext_adv_params,      MGMT_ADD_EXT_ADV_PARAMS_MIN_SIZE,
+						HCI_MGMT_VAR_LEN },
+	{ add_ext_adv_data,        MGMT_ADD_EXT_ADV_DATA_SIZE,
+						HCI_MGMT_VAR_LEN },
 };
 
 void mgmt_index_added(struct hci_dev *hdev)
-- 
2.29.2.454.gaff20da3a2-goog

