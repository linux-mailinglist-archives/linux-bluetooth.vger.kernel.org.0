Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB5D643D7E4
	for <lists+linux-bluetooth@lfdr.de>; Thu, 28 Oct 2021 01:59:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbhJ1ABt (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 27 Oct 2021 20:01:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229863AbhJ1ABq (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 27 Oct 2021 20:01:46 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C90DAC061745
        for <linux-bluetooth@vger.kernel.org>; Wed, 27 Oct 2021 16:59:20 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id z11so3148763plg.8
        for <linux-bluetooth@vger.kernel.org>; Wed, 27 Oct 2021 16:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wfJYj8dbLNbz+1U5cNMnafx7IFy+vqU5eYwiwy/DZFw=;
        b=MthMHqCRSx4HxZLOsZgL+a9L7j3ydHboXUhsVNQDtkCdfynoofBeNbBQmX6MA13AFn
         d6nUjjpMvAxL9zqBjexeSjschX2S54rux//stq6PaOhDRf7J9mOahPG+UC7QRG0ubihP
         7E/o19CqmcJGFPeliB6MFc01YaNW3aVdtCkmKe59BAeK1ilz/MUvDExd5ZechnbHJxvA
         Nrq0ua1H/Mg1fsyiOdufpn1Eo35RkRje39/TFFrxqD9NiCpBnQ9wVFdBt7jPWleOm8U4
         GfKT/d1RT0wGXwZXeSKJCDLiGJrygmci6s8tcwRpCJCDMSZlsI1fF9jcrt9vcQNpOlWz
         aQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wfJYj8dbLNbz+1U5cNMnafx7IFy+vqU5eYwiwy/DZFw=;
        b=DgdM+eqlP96hP81yOmy8GzhH8xnthDP0MSjR34IqsjfBOqZRjNLmNCjZMSz+OZQUcn
         XlAifuUT7jrIty4gQrOO61+qFraWhUupwlv55i7R0e3K8mIjiWoPq5wjXWDQWcEfV5Uj
         1KR5rhloUfxtVe/Wlm6O7kr97hJoPRjr3J+PoRwPuXc3HcyLNZKb8LOU9TpztI3eUVO7
         tUdi9aTT9PRi5j3rcubOB81aiM6kAUsAMQ0DmJdunw0OoNCvd3n1nwX3cjgE5llas9Vc
         7UXnzXFyhBis2rWa0tQt/txIHzi6NRCOAXfWmqY28DavvR/hsOOKlTuQBFB3bfSkk4La
         ZGjQ==
X-Gm-Message-State: AOAM532O4Zd1ojizK8wXNcNcLLthI2hdWi830OCMaRNYCwff/uwg8/0b
        hat1xfw+mhN3FgGMyEd41vBEiEyjHlg=
X-Google-Smtp-Source: ABdhPJyeD7fSprp93KLxGuW9S0Hx/L4Jk4gTRyZza/Qr2hTqimk+r5GdrXlV4paH48Yg2X7nh7h00w==
X-Received: by 2002:a17:90b:1106:: with SMTP id gi6mr9304713pjb.115.1635379158403;
        Wed, 27 Oct 2021 16:59:18 -0700 (PDT)
Received: from lvondent-mobl4.intel.com (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id 142sm807908pgh.22.2021.10.27.16.59.17
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 16:59:17 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v8 22/23] Bluetooth: hci_sync: Rework init stages
Date:   Wed, 27 Oct 2021 16:58:59 -0700
Message-Id: <20211027235900.1882863-23-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027235900.1882863-1-luiz.dentz@gmail.com>
References: <20211027235900.1882863-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This moves the init stages to use the hci_sync infra and in addition
to that have the stages as function tables so it is easier to change
the command sequence.

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 include/net/bluetooth/hci_sync.h |    1 +
 net/bluetooth/hci_core.c         | 1203 +----------------
 net/bluetooth/hci_sync.c         | 2053 +++++++++++++++++++++++++++---
 3 files changed, 1854 insertions(+), 1403 deletions(-)

diff --git a/include/net/bluetooth/hci_sync.h b/include/net/bluetooth/hci_sync.h
index db96546d40c8..487e4981cce1 100644
--- a/include/net/bluetooth/hci_sync.h
+++ b/include/net/bluetooth/hci_sync.h
@@ -83,6 +83,7 @@ int hci_remove_ext_adv_instance_sync(struct hci_dev *hdev, u8 instance,
 struct sk_buff *hci_read_local_oob_data_sync(struct hci_dev *hdev, bool ext,
 					     struct sock *sk);
 
+int hci_reset_sync(struct hci_dev *hdev);
 int hci_dev_open_sync(struct hci_dev *hdev);
 int hci_dev_close_sync(struct hci_dev *hdev);
 
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 420ed6a02337..e0c0aa779dbc 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -62,824 +62,6 @@ DEFINE_MUTEX(hci_cb_list_lock);
 /* HCI ID Numbering */
 static DEFINE_IDA(hci_index_ida);
 
-static int hci_reset_req(struct hci_request *req, unsigned long opt)
-{
-	BT_DBG("%s %ld", req->hdev->name, opt);
-
-	/* Reset device */
-	set_bit(HCI_RESET, &req->hdev->flags);
-	hci_req_add(req, HCI_OP_RESET, 0, NULL);
-	return 0;
-}
-
-static void bredr_init(struct hci_request *req)
-{
-	req->hdev->flow_ctl_mode = HCI_FLOW_CTL_MODE_PACKET_BASED;
-
-	/* Read Local Supported Features */
-	hci_req_add(req, HCI_OP_READ_LOCAL_FEATURES, 0, NULL);
-
-	/* Read Local Version */
-	hci_req_add(req, HCI_OP_READ_LOCAL_VERSION, 0, NULL);
-
-	/* Read BD Address */
-	hci_req_add(req, HCI_OP_READ_BD_ADDR, 0, NULL);
-}
-
-static void amp_init1(struct hci_request *req)
-{
-	req->hdev->flow_ctl_mode = HCI_FLOW_CTL_MODE_BLOCK_BASED;
-
-	/* Read Local Version */
-	hci_req_add(req, HCI_OP_READ_LOCAL_VERSION, 0, NULL);
-
-	/* Read Local Supported Commands */
-	hci_req_add(req, HCI_OP_READ_LOCAL_COMMANDS, 0, NULL);
-
-	/* Read Local AMP Info */
-	hci_req_add(req, HCI_OP_READ_LOCAL_AMP_INFO, 0, NULL);
-
-	/* Read Data Blk size */
-	hci_req_add(req, HCI_OP_READ_DATA_BLOCK_SIZE, 0, NULL);
-
-	/* Read Flow Control Mode */
-	hci_req_add(req, HCI_OP_READ_FLOW_CONTROL_MODE, 0, NULL);
-
-	/* Read Location Data */
-	hci_req_add(req, HCI_OP_READ_LOCATION_DATA, 0, NULL);
-}
-
-static int amp_init2(struct hci_request *req)
-{
-	/* Read Local Supported Features. Not all AMP controllers
-	 * support this so it's placed conditionally in the second
-	 * stage init.
-	 */
-	if (req->hdev->commands[14] & 0x20)
-		hci_req_add(req, HCI_OP_READ_LOCAL_FEATURES, 0, NULL);
-
-	return 0;
-}
-
-static int hci_init1_req(struct hci_request *req, unsigned long opt)
-{
-	struct hci_dev *hdev = req->hdev;
-
-	BT_DBG("%s %ld", hdev->name, opt);
-
-	/* Reset */
-	if (!test_bit(HCI_QUIRK_RESET_ON_CLOSE, &hdev->quirks))
-		hci_reset_req(req, 0);
-
-	switch (hdev->dev_type) {
-	case HCI_PRIMARY:
-		bredr_init(req);
-		break;
-	case HCI_AMP:
-		amp_init1(req);
-		break;
-	default:
-		bt_dev_err(hdev, "Unknown device type %d", hdev->dev_type);
-		break;
-	}
-
-	return 0;
-}
-
-static void bredr_setup(struct hci_request *req)
-{
-	__le16 param;
-	__u8 flt_type;
-
-	/* Read Buffer Size (ACL mtu, max pkt, etc.) */
-	hci_req_add(req, HCI_OP_READ_BUFFER_SIZE, 0, NULL);
-
-	/* Read Class of Device */
-	hci_req_add(req, HCI_OP_READ_CLASS_OF_DEV, 0, NULL);
-
-	/* Read Local Name */
-	hci_req_add(req, HCI_OP_READ_LOCAL_NAME, 0, NULL);
-
-	/* Read Voice Setting */
-	hci_req_add(req, HCI_OP_READ_VOICE_SETTING, 0, NULL);
-
-	/* Read Number of Supported IAC */
-	hci_req_add(req, HCI_OP_READ_NUM_SUPPORTED_IAC, 0, NULL);
-
-	/* Read Current IAC LAP */
-	hci_req_add(req, HCI_OP_READ_CURRENT_IAC_LAP, 0, NULL);
-
-	/* Clear Event Filters */
-	flt_type = HCI_FLT_CLEAR_ALL;
-	hci_req_add(req, HCI_OP_SET_EVENT_FLT, 1, &flt_type);
-
-	/* Connection accept timeout ~20 secs */
-	param = cpu_to_le16(0x7d00);
-	hci_req_add(req, HCI_OP_WRITE_CA_TIMEOUT, 2, &param);
-}
-
-static void le_setup(struct hci_request *req)
-{
-	struct hci_dev *hdev = req->hdev;
-
-	/* Read LE Buffer Size */
-	hci_req_add(req, HCI_OP_LE_READ_BUFFER_SIZE, 0, NULL);
-
-	/* Read LE Local Supported Features */
-	hci_req_add(req, HCI_OP_LE_READ_LOCAL_FEATURES, 0, NULL);
-
-	/* Read LE Supported States */
-	hci_req_add(req, HCI_OP_LE_READ_SUPPORTED_STATES, 0, NULL);
-
-	/* LE-only controllers have LE implicitly enabled */
-	if (!lmp_bredr_capable(hdev))
-		hci_dev_set_flag(hdev, HCI_LE_ENABLED);
-}
-
-static void hci_setup_event_mask(struct hci_request *req)
-{
-	struct hci_dev *hdev = req->hdev;
-
-	/* The second byte is 0xff instead of 0x9f (two reserved bits
-	 * disabled) since a Broadcom 1.2 dongle doesn't respond to the
-	 * command otherwise.
-	 */
-	u8 events[8] = { 0xff, 0xff, 0xfb, 0xff, 0x00, 0x00, 0x00, 0x00 };
-
-	/* CSR 1.1 dongles does not accept any bitfield so don't try to set
-	 * any event mask for pre 1.2 devices.
-	 */
-	if (hdev->hci_ver < BLUETOOTH_VER_1_2)
-		return;
-
-	if (lmp_bredr_capable(hdev)) {
-		events[4] |= 0x01; /* Flow Specification Complete */
-	} else {
-		/* Use a different default for LE-only devices */
-		memset(events, 0, sizeof(events));
-		events[1] |= 0x20; /* Command Complete */
-		events[1] |= 0x40; /* Command Status */
-		events[1] |= 0x80; /* Hardware Error */
-
-		/* If the controller supports the Disconnect command, enable
-		 * the corresponding event. In addition enable packet flow
-		 * control related events.
-		 */
-		if (hdev->commands[0] & 0x20) {
-			events[0] |= 0x10; /* Disconnection Complete */
-			events[2] |= 0x04; /* Number of Completed Packets */
-			events[3] |= 0x02; /* Data Buffer Overflow */
-		}
-
-		/* If the controller supports the Read Remote Version
-		 * Information command, enable the corresponding event.
-		 */
-		if (hdev->commands[2] & 0x80)
-			events[1] |= 0x08; /* Read Remote Version Information
-					    * Complete
-					    */
-
-		if (hdev->le_features[0] & HCI_LE_ENCRYPTION) {
-			events[0] |= 0x80; /* Encryption Change */
-			events[5] |= 0x80; /* Encryption Key Refresh Complete */
-		}
-	}
-
-	if (lmp_inq_rssi_capable(hdev) ||
-	    test_bit(HCI_QUIRK_FIXUP_INQUIRY_MODE, &hdev->quirks))
-		events[4] |= 0x02; /* Inquiry Result with RSSI */
-
-	if (lmp_ext_feat_capable(hdev))
-		events[4] |= 0x04; /* Read Remote Extended Features Complete */
-
-	if (lmp_esco_capable(hdev)) {
-		events[5] |= 0x08; /* Synchronous Connection Complete */
-		events[5] |= 0x10; /* Synchronous Connection Changed */
-	}
-
-	if (lmp_sniffsubr_capable(hdev))
-		events[5] |= 0x20; /* Sniff Subrating */
-
-	if (lmp_pause_enc_capable(hdev))
-		events[5] |= 0x80; /* Encryption Key Refresh Complete */
-
-	if (lmp_ext_inq_capable(hdev))
-		events[5] |= 0x40; /* Extended Inquiry Result */
-
-	if (lmp_no_flush_capable(hdev))
-		events[7] |= 0x01; /* Enhanced Flush Complete */
-
-	if (lmp_lsto_capable(hdev))
-		events[6] |= 0x80; /* Link Supervision Timeout Changed */
-
-	if (lmp_ssp_capable(hdev)) {
-		events[6] |= 0x01;	/* IO Capability Request */
-		events[6] |= 0x02;	/* IO Capability Response */
-		events[6] |= 0x04;	/* User Confirmation Request */
-		events[6] |= 0x08;	/* User Passkey Request */
-		events[6] |= 0x10;	/* Remote OOB Data Request */
-		events[6] |= 0x20;	/* Simple Pairing Complete */
-		events[7] |= 0x04;	/* User Passkey Notification */
-		events[7] |= 0x08;	/* Keypress Notification */
-		events[7] |= 0x10;	/* Remote Host Supported
-					 * Features Notification
-					 */
-	}
-
-	if (lmp_le_capable(hdev))
-		events[7] |= 0x20;	/* LE Meta-Event */
-
-	hci_req_add(req, HCI_OP_SET_EVENT_MASK, sizeof(events), events);
-}
-
-static int hci_init2_req(struct hci_request *req, unsigned long opt)
-{
-	struct hci_dev *hdev = req->hdev;
-
-	if (hdev->dev_type == HCI_AMP)
-		return amp_init2(req);
-
-	if (lmp_bredr_capable(hdev))
-		bredr_setup(req);
-	else
-		hci_dev_clear_flag(hdev, HCI_BREDR_ENABLED);
-
-	if (lmp_le_capable(hdev))
-		le_setup(req);
-
-	/* All Bluetooth 1.2 and later controllers should support the
-	 * HCI command for reading the local supported commands.
-	 *
-	 * Unfortunately some controllers indicate Bluetooth 1.2 support,
-	 * but do not have support for this command. If that is the case,
-	 * the driver can quirk the behavior and skip reading the local
-	 * supported commands.
-	 */
-	if (hdev->hci_ver > BLUETOOTH_VER_1_1 &&
-	    !test_bit(HCI_QUIRK_BROKEN_LOCAL_COMMANDS, &hdev->quirks))
-		hci_req_add(req, HCI_OP_READ_LOCAL_COMMANDS, 0, NULL);
-
-	if (lmp_ssp_capable(hdev)) {
-		/* When SSP is available, then the host features page
-		 * should also be available as well. However some
-		 * controllers list the max_page as 0 as long as SSP
-		 * has not been enabled. To achieve proper debugging
-		 * output, force the minimum max_page to 1 at least.
-		 */
-		hdev->max_page = 0x01;
-
-		if (hci_dev_test_flag(hdev, HCI_SSP_ENABLED)) {
-			u8 mode = 0x01;
-
-			hci_req_add(req, HCI_OP_WRITE_SSP_MODE,
-				    sizeof(mode), &mode);
-		} else {
-			struct hci_cp_write_eir cp;
-
-			memset(hdev->eir, 0, sizeof(hdev->eir));
-			memset(&cp, 0, sizeof(cp));
-
-			hci_req_add(req, HCI_OP_WRITE_EIR, sizeof(cp), &cp);
-		}
-	}
-
-	if (lmp_inq_rssi_capable(hdev) ||
-	    test_bit(HCI_QUIRK_FIXUP_INQUIRY_MODE, &hdev->quirks)) {
-		u8 mode;
-
-		/* If Extended Inquiry Result events are supported, then
-		 * they are clearly preferred over Inquiry Result with RSSI
-		 * events.
-		 */
-		mode = lmp_ext_inq_capable(hdev) ? 0x02 : 0x01;
-
-		hci_req_add(req, HCI_OP_WRITE_INQUIRY_MODE, 1, &mode);
-	}
-
-	if (lmp_inq_tx_pwr_capable(hdev))
-		hci_req_add(req, HCI_OP_READ_INQ_RSP_TX_POWER, 0, NULL);
-
-	if (lmp_ext_feat_capable(hdev)) {
-		struct hci_cp_read_local_ext_features cp;
-
-		cp.page = 0x01;
-		hci_req_add(req, HCI_OP_READ_LOCAL_EXT_FEATURES,
-			    sizeof(cp), &cp);
-	}
-
-	if (hci_dev_test_flag(hdev, HCI_LINK_SECURITY)) {
-		u8 enable = 1;
-		hci_req_add(req, HCI_OP_WRITE_AUTH_ENABLE, sizeof(enable),
-			    &enable);
-	}
-
-	return 0;
-}
-
-static void hci_setup_link_policy(struct hci_request *req)
-{
-	struct hci_dev *hdev = req->hdev;
-	struct hci_cp_write_def_link_policy cp;
-	u16 link_policy = 0;
-
-	if (lmp_rswitch_capable(hdev))
-		link_policy |= HCI_LP_RSWITCH;
-	if (lmp_hold_capable(hdev))
-		link_policy |= HCI_LP_HOLD;
-	if (lmp_sniff_capable(hdev))
-		link_policy |= HCI_LP_SNIFF;
-	if (lmp_park_capable(hdev))
-		link_policy |= HCI_LP_PARK;
-
-	cp.policy = cpu_to_le16(link_policy);
-	hci_req_add(req, HCI_OP_WRITE_DEF_LINK_POLICY, sizeof(cp), &cp);
-}
-
-static void hci_set_le_support(struct hci_request *req)
-{
-	struct hci_dev *hdev = req->hdev;
-	struct hci_cp_write_le_host_supported cp;
-
-	/* LE-only devices do not support explicit enablement */
-	if (!lmp_bredr_capable(hdev))
-		return;
-
-	memset(&cp, 0, sizeof(cp));
-
-	if (hci_dev_test_flag(hdev, HCI_LE_ENABLED)) {
-		cp.le = 0x01;
-		cp.simul = 0x00;
-	}
-
-	if (cp.le != lmp_host_le_capable(hdev))
-		hci_req_add(req, HCI_OP_WRITE_LE_HOST_SUPPORTED, sizeof(cp),
-			    &cp);
-}
-
-static void hci_set_event_mask_page_2(struct hci_request *req)
-{
-	struct hci_dev *hdev = req->hdev;
-	u8 events[8] = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
-	bool changed = false;
-
-	/* If Connectionless Peripheral Broadcast central role is supported
-	 * enable all necessary events for it.
-	 */
-	if (lmp_cpb_central_capable(hdev)) {
-		events[1] |= 0x40;	/* Triggered Clock Capture */
-		events[1] |= 0x80;	/* Synchronization Train Complete */
-		events[2] |= 0x10;	/* Peripheral Page Response Timeout */
-		events[2] |= 0x20;	/* CPB Channel Map Change */
-		changed = true;
-	}
-
-	/* If Connectionless Peripheral Broadcast peripheral role is supported
-	 * enable all necessary events for it.
-	 */
-	if (lmp_cpb_peripheral_capable(hdev)) {
-		events[2] |= 0x01;	/* Synchronization Train Received */
-		events[2] |= 0x02;	/* CPB Receive */
-		events[2] |= 0x04;	/* CPB Timeout */
-		events[2] |= 0x08;	/* Truncated Page Complete */
-		changed = true;
-	}
-
-	/* Enable Authenticated Payload Timeout Expired event if supported */
-	if (lmp_ping_capable(hdev) || hdev->le_features[0] & HCI_LE_PING) {
-		events[2] |= 0x80;
-		changed = true;
-	}
-
-	/* Some Broadcom based controllers indicate support for Set Event
-	 * Mask Page 2 command, but then actually do not support it. Since
-	 * the default value is all bits set to zero, the command is only
-	 * required if the event mask has to be changed. In case no change
-	 * to the event mask is needed, skip this command.
-	 */
-	if (changed)
-		hci_req_add(req, HCI_OP_SET_EVENT_MASK_PAGE_2,
-			    sizeof(events), events);
-}
-
-static int hci_init3_req(struct hci_request *req, unsigned long opt)
-{
-	struct hci_dev *hdev = req->hdev;
-	u8 p;
-
-	hci_setup_event_mask(req);
-
-	if (hdev->commands[6] & 0x20 &&
-	    !test_bit(HCI_QUIRK_BROKEN_STORED_LINK_KEY, &hdev->quirks)) {
-		struct hci_cp_read_stored_link_key cp;
-
-		bacpy(&cp.bdaddr, BDADDR_ANY);
-		cp.read_all = 0x01;
-		hci_req_add(req, HCI_OP_READ_STORED_LINK_KEY, sizeof(cp), &cp);
-	}
-
-	if (hdev->commands[5] & 0x10)
-		hci_setup_link_policy(req);
-
-	if (hdev->commands[8] & 0x01)
-		hci_req_add(req, HCI_OP_READ_PAGE_SCAN_ACTIVITY, 0, NULL);
-
-	if (hdev->commands[18] & 0x04 &&
-	    !test_bit(HCI_QUIRK_BROKEN_ERR_DATA_REPORTING, &hdev->quirks))
-		hci_req_add(req, HCI_OP_READ_DEF_ERR_DATA_REPORTING, 0, NULL);
-
-	/* Some older Broadcom based Bluetooth 1.2 controllers do not
-	 * support the Read Page Scan Type command. Check support for
-	 * this command in the bit mask of supported commands.
-	 */
-	if (hdev->commands[13] & 0x01)
-		hci_req_add(req, HCI_OP_READ_PAGE_SCAN_TYPE, 0, NULL);
-
-	if (lmp_le_capable(hdev)) {
-		u8 events[8];
-
-		memset(events, 0, sizeof(events));
-
-		if (hdev->le_features[0] & HCI_LE_ENCRYPTION)
-			events[0] |= 0x10;	/* LE Long Term Key Request */
-
-		/* If controller supports the Connection Parameters Request
-		 * Link Layer Procedure, enable the corresponding event.
-		 */
-		if (hdev->le_features[0] & HCI_LE_CONN_PARAM_REQ_PROC)
-			events[0] |= 0x20;	/* LE Remote Connection
-						 * Parameter Request
-						 */
-
-		/* If the controller supports the Data Length Extension
-		 * feature, enable the corresponding event.
-		 */
-		if (hdev->le_features[0] & HCI_LE_DATA_LEN_EXT)
-			events[0] |= 0x40;	/* LE Data Length Change */
-
-		/* If the controller supports LL Privacy feature, enable
-		 * the corresponding event.
-		 */
-		if (hdev->le_features[0] & HCI_LE_LL_PRIVACY)
-			events[1] |= 0x02;	/* LE Enhanced Connection
-						 * Complete
-						 */
-
-		/* If the controller supports Extended Scanner Filter
-		 * Policies, enable the corresponding event.
-		 */
-		if (hdev->le_features[0] & HCI_LE_EXT_SCAN_POLICY)
-			events[1] |= 0x04;	/* LE Direct Advertising
-						 * Report
-						 */
-
-		/* If the controller supports Channel Selection Algorithm #2
-		 * feature, enable the corresponding event.
-		 */
-		if (hdev->le_features[1] & HCI_LE_CHAN_SEL_ALG2)
-			events[2] |= 0x08;	/* LE Channel Selection
-						 * Algorithm
-						 */
-
-		/* If the controller supports the LE Set Scan Enable command,
-		 * enable the corresponding advertising report event.
-		 */
-		if (hdev->commands[26] & 0x08)
-			events[0] |= 0x02;	/* LE Advertising Report */
-
-		/* If the controller supports the LE Create Connection
-		 * command, enable the corresponding event.
-		 */
-		if (hdev->commands[26] & 0x10)
-			events[0] |= 0x01;	/* LE Connection Complete */
-
-		/* If the controller supports the LE Connection Update
-		 * command, enable the corresponding event.
-		 */
-		if (hdev->commands[27] & 0x04)
-			events[0] |= 0x04;	/* LE Connection Update
-						 * Complete
-						 */
-
-		/* If the controller supports the LE Read Remote Used Features
-		 * command, enable the corresponding event.
-		 */
-		if (hdev->commands[27] & 0x20)
-			events[0] |= 0x08;	/* LE Read Remote Used
-						 * Features Complete
-						 */
-
-		/* If the controller supports the LE Read Local P-256
-		 * Public Key command, enable the corresponding event.
-		 */
-		if (hdev->commands[34] & 0x02)
-			events[0] |= 0x80;	/* LE Read Local P-256
-						 * Public Key Complete
-						 */
-
-		/* If the controller supports the LE Generate DHKey
-		 * command, enable the corresponding event.
-		 */
-		if (hdev->commands[34] & 0x04)
-			events[1] |= 0x01;	/* LE Generate DHKey Complete */
-
-		/* If the controller supports the LE Set Default PHY or
-		 * LE Set PHY commands, enable the corresponding event.
-		 */
-		if (hdev->commands[35] & (0x20 | 0x40))
-			events[1] |= 0x08;        /* LE PHY Update Complete */
-
-		/* If the controller supports LE Set Extended Scan Parameters
-		 * and LE Set Extended Scan Enable commands, enable the
-		 * corresponding event.
-		 */
-		if (use_ext_scan(hdev))
-			events[1] |= 0x10;	/* LE Extended Advertising
-						 * Report
-						 */
-
-		/* If the controller supports the LE Extended Advertising
-		 * command, enable the corresponding event.
-		 */
-		if (ext_adv_capable(hdev))
-			events[2] |= 0x02;	/* LE Advertising Set
-						 * Terminated
-						 */
-
-		hci_req_add(req, HCI_OP_LE_SET_EVENT_MASK, sizeof(events),
-			    events);
-
-		/* Read LE Advertising Channel TX Power */
-		if ((hdev->commands[25] & 0x40) && !ext_adv_capable(hdev)) {
-			/* HCI TS spec forbids mixing of legacy and extended
-			 * advertising commands wherein READ_ADV_TX_POWER is
-			 * also included. So do not call it if extended adv
-			 * is supported otherwise controller will return
-			 * COMMAND_DISALLOWED for extended commands.
-			 */
-			hci_req_add(req, HCI_OP_LE_READ_ADV_TX_POWER, 0, NULL);
-		}
-
-		if (hdev->commands[38] & 0x80) {
-			/* Read LE Min/Max Tx Power*/
-			hci_req_add(req, HCI_OP_LE_READ_TRANSMIT_POWER,
-				    0, NULL);
-		}
-
-		if (hdev->commands[26] & 0x40) {
-			/* Read LE Accept List Size */
-			hci_req_add(req, HCI_OP_LE_READ_ACCEPT_LIST_SIZE,
-				    0, NULL);
-		}
-
-		if (hdev->commands[26] & 0x80) {
-			/* Clear LE Accept List */
-			hci_req_add(req, HCI_OP_LE_CLEAR_ACCEPT_LIST, 0, NULL);
-		}
-
-		if (hdev->commands[34] & 0x40) {
-			/* Read LE Resolving List Size */
-			hci_req_add(req, HCI_OP_LE_READ_RESOLV_LIST_SIZE,
-				    0, NULL);
-		}
-
-		if (hdev->commands[34] & 0x20) {
-			/* Clear LE Resolving List */
-			hci_req_add(req, HCI_OP_LE_CLEAR_RESOLV_LIST, 0, NULL);
-		}
-
-		if (hdev->commands[35] & 0x04) {
-			__le16 rpa_timeout = cpu_to_le16(hdev->rpa_timeout);
-
-			/* Set RPA timeout */
-			hci_req_add(req, HCI_OP_LE_SET_RPA_TIMEOUT, 2,
-				    &rpa_timeout);
-		}
-
-		if (hdev->le_features[0] & HCI_LE_DATA_LEN_EXT) {
-			/* Read LE Maximum Data Length */
-			hci_req_add(req, HCI_OP_LE_READ_MAX_DATA_LEN, 0, NULL);
-
-			/* Read LE Suggested Default Data Length */
-			hci_req_add(req, HCI_OP_LE_READ_DEF_DATA_LEN, 0, NULL);
-		}
-
-		if (ext_adv_capable(hdev)) {
-			/* Read LE Number of Supported Advertising Sets */
-			hci_req_add(req, HCI_OP_LE_READ_NUM_SUPPORTED_ADV_SETS,
-				    0, NULL);
-		}
-
-		hci_set_le_support(req);
-	}
-
-	/* Read features beyond page 1 if available */
-	for (p = 2; p < HCI_MAX_PAGES && p <= hdev->max_page; p++) {
-		struct hci_cp_read_local_ext_features cp;
-
-		cp.page = p;
-		hci_req_add(req, HCI_OP_READ_LOCAL_EXT_FEATURES,
-			    sizeof(cp), &cp);
-	}
-
-	return 0;
-}
-
-static int hci_init4_req(struct hci_request *req, unsigned long opt)
-{
-	struct hci_dev *hdev = req->hdev;
-
-	/* Some Broadcom based Bluetooth controllers do not support the
-	 * Delete Stored Link Key command. They are clearly indicating its
-	 * absence in the bit mask of supported commands.
-	 *
-	 * Check the supported commands and only if the command is marked
-	 * as supported send it. If not supported assume that the controller
-	 * does not have actual support for stored link keys which makes this
-	 * command redundant anyway.
-	 *
-	 * Some controllers indicate that they support handling deleting
-	 * stored link keys, but they don't. The quirk lets a driver
-	 * just disable this command.
-	 */
-	if (hdev->commands[6] & 0x80 &&
-	    !test_bit(HCI_QUIRK_BROKEN_STORED_LINK_KEY, &hdev->quirks)) {
-		struct hci_cp_delete_stored_link_key cp;
-
-		bacpy(&cp.bdaddr, BDADDR_ANY);
-		cp.delete_all = 0x01;
-		hci_req_add(req, HCI_OP_DELETE_STORED_LINK_KEY,
-			    sizeof(cp), &cp);
-	}
-
-	/* Set event mask page 2 if the HCI command for it is supported */
-	if (hdev->commands[22] & 0x04)
-		hci_set_event_mask_page_2(req);
-
-	/* Read local pairing options if the HCI command is supported */
-	if (hdev->commands[41] & 0x08)
-		hci_req_add(req, HCI_OP_READ_LOCAL_PAIRING_OPTS, 0, NULL);
-
-	/* Get MWS transport configuration if the HCI command is supported */
-	if (hdev->commands[30] & 0x08)
-		hci_req_add(req, HCI_OP_GET_MWS_TRANSPORT_CONFIG, 0, NULL);
-
-	/* Check for Synchronization Train support */
-	if (lmp_sync_train_capable(hdev))
-		hci_req_add(req, HCI_OP_READ_SYNC_TRAIN_PARAMS, 0, NULL);
-
-	/* Enable Secure Connections if supported and configured */
-	if (hci_dev_test_flag(hdev, HCI_SSP_ENABLED) &&
-	    bredr_sc_enabled(hdev)) {
-		u8 support = 0x01;
-
-		hci_req_add(req, HCI_OP_WRITE_SC_SUPPORT,
-			    sizeof(support), &support);
-	}
-
-	/* Set erroneous data reporting if supported to the wideband speech
-	 * setting value
-	 */
-	if (hdev->commands[18] & 0x08 &&
-	    !test_bit(HCI_QUIRK_BROKEN_ERR_DATA_REPORTING, &hdev->quirks)) {
-		bool enabled = hci_dev_test_flag(hdev,
-						 HCI_WIDEBAND_SPEECH_ENABLED);
-
-		if (enabled !=
-		    (hdev->err_data_reporting == ERR_DATA_REPORTING_ENABLED)) {
-			struct hci_cp_write_def_err_data_reporting cp;
-
-			cp.err_data_reporting = enabled ?
-						ERR_DATA_REPORTING_ENABLED :
-						ERR_DATA_REPORTING_DISABLED;
-
-			hci_req_add(req, HCI_OP_WRITE_DEF_ERR_DATA_REPORTING,
-				    sizeof(cp), &cp);
-		}
-	}
-
-	/* Set Suggested Default Data Length to maximum if supported */
-	if (hdev->le_features[0] & HCI_LE_DATA_LEN_EXT) {
-		struct hci_cp_le_write_def_data_len cp;
-
-		cp.tx_len = cpu_to_le16(hdev->le_max_tx_len);
-		cp.tx_time = cpu_to_le16(hdev->le_max_tx_time);
-		hci_req_add(req, HCI_OP_LE_WRITE_DEF_DATA_LEN, sizeof(cp), &cp);
-	}
-
-	/* Set Default PHY parameters if command is supported */
-	if (hdev->commands[35] & 0x20) {
-		struct hci_cp_le_set_default_phy cp;
-
-		cp.all_phys = 0x00;
-		cp.tx_phys = hdev->le_tx_def_phys;
-		cp.rx_phys = hdev->le_rx_def_phys;
-
-		hci_req_add(req, HCI_OP_LE_SET_DEFAULT_PHY, sizeof(cp), &cp);
-	}
-
-	return 0;
-}
-
-static int __hci_init(struct hci_dev *hdev)
-{
-	int err;
-
-	err = __hci_req_sync(hdev, hci_init1_req, 0, HCI_INIT_TIMEOUT, NULL);
-	if (err < 0)
-		return err;
-
-	if (hci_dev_test_flag(hdev, HCI_SETUP))
-		hci_debugfs_create_basic(hdev);
-
-	err = __hci_req_sync(hdev, hci_init2_req, 0, HCI_INIT_TIMEOUT, NULL);
-	if (err < 0)
-		return err;
-
-	/* HCI_PRIMARY covers both single-mode LE, BR/EDR and dual-mode
-	 * BR/EDR/LE type controllers. AMP controllers only need the
-	 * first two stages of init.
-	 */
-	if (hdev->dev_type != HCI_PRIMARY)
-		return 0;
-
-	err = __hci_req_sync(hdev, hci_init3_req, 0, HCI_INIT_TIMEOUT, NULL);
-	if (err < 0)
-		return err;
-
-	err = __hci_req_sync(hdev, hci_init4_req, 0, HCI_INIT_TIMEOUT, NULL);
-	if (err < 0)
-		return err;
-
-	/* Read local codec list if the HCI command is supported */
-	if (hdev->commands[45] & 0x04)
-		hci_read_supported_codecs_v2(hdev);
-	else if (hdev->commands[29] & 0x20)
-		hci_read_supported_codecs(hdev);
-
-	/* This function is only called when the controller is actually in
-	 * configured state. When the controller is marked as unconfigured,
-	 * this initialization procedure is not run.
-	 *
-	 * It means that it is possible that a controller runs through its
-	 * setup phase and then discovers missing settings. If that is the
-	 * case, then this function will not be called. It then will only
-	 * be called during the config phase.
-	 *
-	 * So only when in setup phase or config phase, create the debugfs
-	 * entries and register the SMP channels.
-	 */
-	if (!hci_dev_test_flag(hdev, HCI_SETUP) &&
-	    !hci_dev_test_flag(hdev, HCI_CONFIG))
-		return 0;
-
-	hci_debugfs_create_common(hdev);
-
-	if (lmp_bredr_capable(hdev))
-		hci_debugfs_create_bredr(hdev);
-
-	if (lmp_le_capable(hdev))
-		hci_debugfs_create_le(hdev);
-
-	return 0;
-}
-
-static int hci_init0_req(struct hci_request *req, unsigned long opt)
-{
-	struct hci_dev *hdev = req->hdev;
-
-	BT_DBG("%s %ld", hdev->name, opt);
-
-	/* Reset */
-	if (!test_bit(HCI_QUIRK_RESET_ON_CLOSE, &hdev->quirks))
-		hci_reset_req(req, 0);
-
-	/* Read Local Version */
-	hci_req_add(req, HCI_OP_READ_LOCAL_VERSION, 0, NULL);
-
-	/* Read BD Address */
-	if (hdev->set_bdaddr)
-		hci_req_add(req, HCI_OP_READ_BD_ADDR, 0, NULL);
-
-	return 0;
-}
-
-static int __hci_unconf_init(struct hci_dev *hdev)
-{
-	int err;
-
-	if (test_bit(HCI_QUIRK_RAW_DEVICE, &hdev->quirks))
-		return 0;
-
-	err = __hci_req_sync(hdev, hci_init0_req, 0, HCI_INIT_TIMEOUT, NULL);
-	if (err < 0)
-		return err;
-
-	if (hci_dev_test_flag(hdev, HCI_SETUP))
-		hci_debugfs_create_basic(hdev);
-
-	return 0;
-}
-
 static int hci_scan_req(struct hci_request *req, unsigned long opt)
 {
 	__u8 scan = opt;
@@ -1289,240 +471,6 @@ int hci_inquiry(void __user *arg)
 	return err;
 }
 
-/**
- * hci_dev_get_bd_addr_from_property - Get the Bluetooth Device Address
- *				       (BD_ADDR) for a HCI device from
- *				       a firmware node property.
- * @hdev:	The HCI device
- *
- * Search the firmware node for 'local-bd-address'.
- *
- * All-zero BD addresses are rejected, because those could be properties
- * that exist in the firmware tables, but were not updated by the firmware. For
- * example, the DTS could define 'local-bd-address', with zero BD addresses.
- */
-static void hci_dev_get_bd_addr_from_property(struct hci_dev *hdev)
-{
-	struct fwnode_handle *fwnode = dev_fwnode(hdev->dev.parent);
-	bdaddr_t ba;
-	int ret;
-
-	ret = fwnode_property_read_u8_array(fwnode, "local-bd-address",
-					    (u8 *)&ba, sizeof(ba));
-	if (ret < 0 || !bacmp(&ba, BDADDR_ANY))
-		return;
-
-	bacpy(&hdev->public_addr, &ba);
-}
-
-/* TODO: Move this function into hci_sync.c */
-int hci_dev_open_sync(struct hci_dev *hdev)
-{
-	int ret = 0;
-
-	BT_DBG("%s %p", hdev->name, hdev);
-
-	if (hci_dev_test_flag(hdev, HCI_UNREGISTER)) {
-		ret = -ENODEV;
-		goto done;
-	}
-
-	if (!hci_dev_test_flag(hdev, HCI_SETUP) &&
-	    !hci_dev_test_flag(hdev, HCI_CONFIG)) {
-		/* Check for rfkill but allow the HCI setup stage to
-		 * proceed (which in itself doesn't cause any RF activity).
-		 */
-		if (hci_dev_test_flag(hdev, HCI_RFKILLED)) {
-			ret = -ERFKILL;
-			goto done;
-		}
-
-		/* Check for valid public address or a configured static
-		 * random address, but let the HCI setup proceed to
-		 * be able to determine if there is a public address
-		 * or not.
-		 *
-		 * In case of user channel usage, it is not important
-		 * if a public address or static random address is
-		 * available.
-		 *
-		 * This check is only valid for BR/EDR controllers
-		 * since AMP controllers do not have an address.
-		 */
-		if (!hci_dev_test_flag(hdev, HCI_USER_CHANNEL) &&
-		    hdev->dev_type == HCI_PRIMARY &&
-		    !bacmp(&hdev->bdaddr, BDADDR_ANY) &&
-		    !bacmp(&hdev->static_addr, BDADDR_ANY)) {
-			ret = -EADDRNOTAVAIL;
-			goto done;
-		}
-	}
-
-	if (test_bit(HCI_UP, &hdev->flags)) {
-		ret = -EALREADY;
-		goto done;
-	}
-
-	if (hdev->open(hdev)) {
-		ret = -EIO;
-		goto done;
-	}
-
-	set_bit(HCI_RUNNING, &hdev->flags);
-	hci_sock_dev_event(hdev, HCI_DEV_OPEN);
-
-	atomic_set(&hdev->cmd_cnt, 1);
-	set_bit(HCI_INIT, &hdev->flags);
-
-	if (hci_dev_test_flag(hdev, HCI_SETUP) ||
-	    test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
-		bool invalid_bdaddr;
-
-		hci_sock_dev_event(hdev, HCI_DEV_SETUP);
-
-		if (hdev->setup)
-			ret = hdev->setup(hdev);
-
-		/* The transport driver can set the quirk to mark the
-		 * BD_ADDR invalid before creating the HCI device or in
-		 * its setup callback.
-		 */
-		invalid_bdaddr = test_bit(HCI_QUIRK_INVALID_BDADDR,
-					  &hdev->quirks);
-
-		if (ret)
-			goto setup_failed;
-
-		if (test_bit(HCI_QUIRK_USE_BDADDR_PROPERTY, &hdev->quirks)) {
-			if (!bacmp(&hdev->public_addr, BDADDR_ANY))
-				hci_dev_get_bd_addr_from_property(hdev);
-
-			if (bacmp(&hdev->public_addr, BDADDR_ANY) &&
-			    hdev->set_bdaddr) {
-				ret = hdev->set_bdaddr(hdev,
-						       &hdev->public_addr);
-
-				/* If setting of the BD_ADDR from the device
-				 * property succeeds, then treat the address
-				 * as valid even if the invalid BD_ADDR
-				 * quirk indicates otherwise.
-				 */
-				if (!ret)
-					invalid_bdaddr = false;
-			}
-		}
-
-setup_failed:
-		/* The transport driver can set these quirks before
-		 * creating the HCI device or in its setup callback.
-		 *
-		 * For the invalid BD_ADDR quirk it is possible that
-		 * it becomes a valid address if the bootloader does
-		 * provide it (see above).
-		 *
-		 * In case any of them is set, the controller has to
-		 * start up as unconfigured.
-		 */
-		if (test_bit(HCI_QUIRK_EXTERNAL_CONFIG, &hdev->quirks) ||
-		    invalid_bdaddr)
-			hci_dev_set_flag(hdev, HCI_UNCONFIGURED);
-
-		/* For an unconfigured controller it is required to
-		 * read at least the version information provided by
-		 * the Read Local Version Information command.
-		 *
-		 * If the set_bdaddr driver callback is provided, then
-		 * also the original Bluetooth public device address
-		 * will be read using the Read BD Address command.
-		 */
-		if (hci_dev_test_flag(hdev, HCI_UNCONFIGURED))
-			ret = __hci_unconf_init(hdev);
-	}
-
-	if (hci_dev_test_flag(hdev, HCI_CONFIG)) {
-		/* If public address change is configured, ensure that
-		 * the address gets programmed. If the driver does not
-		 * support changing the public address, fail the power
-		 * on procedure.
-		 */
-		if (bacmp(&hdev->public_addr, BDADDR_ANY) &&
-		    hdev->set_bdaddr)
-			ret = hdev->set_bdaddr(hdev, &hdev->public_addr);
-		else
-			ret = -EADDRNOTAVAIL;
-	}
-
-	if (!ret) {
-		if (!hci_dev_test_flag(hdev, HCI_UNCONFIGURED) &&
-		    !hci_dev_test_flag(hdev, HCI_USER_CHANNEL)) {
-			ret = __hci_init(hdev);
-			if (!ret && hdev->post_init)
-				ret = hdev->post_init(hdev);
-		}
-	}
-
-	/* If the HCI Reset command is clearing all diagnostic settings,
-	 * then they need to be reprogrammed after the init procedure
-	 * completed.
-	 */
-	if (test_bit(HCI_QUIRK_NON_PERSISTENT_DIAG, &hdev->quirks) &&
-	    !hci_dev_test_flag(hdev, HCI_USER_CHANNEL) &&
-	    hci_dev_test_flag(hdev, HCI_VENDOR_DIAG) && hdev->set_diag)
-		ret = hdev->set_diag(hdev, true);
-
-	msft_do_open(hdev);
-	aosp_do_open(hdev);
-
-	clear_bit(HCI_INIT, &hdev->flags);
-
-	if (!ret) {
-		hci_dev_hold(hdev);
-		hci_dev_set_flag(hdev, HCI_RPA_EXPIRED);
-		hci_adv_instances_set_rpa_expired(hdev, true);
-		set_bit(HCI_UP, &hdev->flags);
-		hci_sock_dev_event(hdev, HCI_DEV_UP);
-		hci_leds_update_powered(hdev, true);
-		if (!hci_dev_test_flag(hdev, HCI_SETUP) &&
-		    !hci_dev_test_flag(hdev, HCI_CONFIG) &&
-		    !hci_dev_test_flag(hdev, HCI_UNCONFIGURED) &&
-		    !hci_dev_test_flag(hdev, HCI_USER_CHANNEL) &&
-		    hci_dev_test_flag(hdev, HCI_MGMT) &&
-		    hdev->dev_type == HCI_PRIMARY) {
-			ret = hci_powered_update_sync(hdev);
-		}
-	} else {
-		/* Init failed, cleanup */
-		flush_work(&hdev->tx_work);
-
-		/* Since hci_rx_work() is possible to awake new cmd_work
-		 * it should be flushed first to avoid unexpected call of
-		 * hci_cmd_work()
-		 */
-		flush_work(&hdev->rx_work);
-		flush_work(&hdev->cmd_work);
-
-		skb_queue_purge(&hdev->cmd_q);
-		skb_queue_purge(&hdev->rx_q);
-
-		if (hdev->flush)
-			hdev->flush(hdev);
-
-		if (hdev->sent_cmd) {
-			kfree_skb(hdev->sent_cmd);
-			hdev->sent_cmd = NULL;
-		}
-
-		clear_bit(HCI_RUNNING, &hdev->flags);
-		hci_sock_dev_event(hdev, HCI_DEV_CLOSE);
-
-		hdev->close(hdev);
-		hdev->flags &= BIT(HCI_RAW);
-	}
-
-done:
-	return ret;
-}
-
 static int hci_dev_do_open(struct hci_dev *hdev)
 {
 	int ret = 0;
@@ -1594,155 +542,6 @@ int hci_dev_open(__u16 dev)
 	return err;
 }
 
-/* This function requires the caller holds hdev->lock */
-static void hci_pend_le_actions_clear(struct hci_dev *hdev)
-{
-	struct hci_conn_params *p;
-
-	list_for_each_entry(p, &hdev->le_conn_params, list) {
-		if (p->conn) {
-			hci_conn_drop(p->conn);
-			hci_conn_put(p->conn);
-			p->conn = NULL;
-		}
-		list_del_init(&p->action);
-	}
-
-	BT_DBG("All LE pending actions cleared");
-}
-
-/* TODO: Move this function into hci_sync.c */
-int hci_dev_close_sync(struct hci_dev *hdev)
-{
-	bool auto_off;
-	int err = 0;
-
-	BT_DBG("%s %p", hdev->name, hdev);
-
-	cancel_delayed_work(&hdev->power_off);
-	cancel_delayed_work(&hdev->ncmd_timer);
-
-	hci_request_cancel_all(hdev);
-
-	if (!hci_dev_test_flag(hdev, HCI_UNREGISTER) &&
-	    !hci_dev_test_flag(hdev, HCI_USER_CHANNEL) &&
-	    test_bit(HCI_UP, &hdev->flags)) {
-		/* Execute vendor specific shutdown routine */
-		if (hdev->shutdown)
-			err = hdev->shutdown(hdev);
-	}
-
-	if (!test_and_clear_bit(HCI_UP, &hdev->flags)) {
-		cancel_delayed_work_sync(&hdev->cmd_timer);
-		return err;
-	}
-
-	hci_leds_update_powered(hdev, false);
-
-	/* Flush RX and TX works */
-	flush_work(&hdev->tx_work);
-	flush_work(&hdev->rx_work);
-
-	if (hdev->discov_timeout > 0) {
-		hdev->discov_timeout = 0;
-		hci_dev_clear_flag(hdev, HCI_DISCOVERABLE);
-		hci_dev_clear_flag(hdev, HCI_LIMITED_DISCOVERABLE);
-	}
-
-	if (hci_dev_test_and_clear_flag(hdev, HCI_SERVICE_CACHE))
-		cancel_delayed_work(&hdev->service_cache);
-
-	if (hci_dev_test_flag(hdev, HCI_MGMT)) {
-		struct adv_info *adv_instance;
-
-		cancel_delayed_work_sync(&hdev->rpa_expired);
-
-		list_for_each_entry(adv_instance, &hdev->adv_instances, list)
-			cancel_delayed_work_sync(&adv_instance->rpa_expired_cb);
-	}
-
-	/* Avoid potential lockdep warnings from the *_flush() calls by
-	 * ensuring the workqueue is empty up front.
-	 */
-	drain_workqueue(hdev->workqueue);
-
-	hci_dev_lock(hdev);
-
-	hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
-
-	auto_off = hci_dev_test_and_clear_flag(hdev, HCI_AUTO_OFF);
-
-	if (!auto_off && hdev->dev_type == HCI_PRIMARY &&
-	    !hci_dev_test_flag(hdev, HCI_USER_CHANNEL) &&
-	    hci_dev_test_flag(hdev, HCI_MGMT))
-		__mgmt_power_off(hdev);
-
-	hci_inquiry_cache_flush(hdev);
-	hci_pend_le_actions_clear(hdev);
-	hci_conn_hash_flush(hdev);
-	hci_dev_unlock(hdev);
-
-	smp_unregister(hdev);
-
-	hci_sock_dev_event(hdev, HCI_DEV_DOWN);
-
-	aosp_do_close(hdev);
-	msft_do_close(hdev);
-
-	if (hdev->flush)
-		hdev->flush(hdev);
-
-	/* Reset device */
-	skb_queue_purge(&hdev->cmd_q);
-	atomic_set(&hdev->cmd_cnt, 1);
-	if (test_bit(HCI_QUIRK_RESET_ON_CLOSE, &hdev->quirks) &&
-	    !auto_off && !hci_dev_test_flag(hdev, HCI_UNCONFIGURED)) {
-		set_bit(HCI_INIT, &hdev->flags);
-		__hci_req_sync(hdev, hci_reset_req, 0, HCI_CMD_TIMEOUT, NULL);
-		clear_bit(HCI_INIT, &hdev->flags);
-	}
-
-	/* flush cmd  work */
-	flush_work(&hdev->cmd_work);
-
-	/* Drop queues */
-	skb_queue_purge(&hdev->rx_q);
-	skb_queue_purge(&hdev->cmd_q);
-	skb_queue_purge(&hdev->raw_q);
-
-	/* Drop last sent command */
-	if (hdev->sent_cmd) {
-		cancel_delayed_work_sync(&hdev->cmd_timer);
-		kfree_skb(hdev->sent_cmd);
-		hdev->sent_cmd = NULL;
-	}
-
-	clear_bit(HCI_RUNNING, &hdev->flags);
-	hci_sock_dev_event(hdev, HCI_DEV_CLOSE);
-
-	if (test_and_clear_bit(SUSPEND_POWERING_DOWN, hdev->suspend_tasks))
-		wake_up(&hdev->suspend_wait_q);
-
-	/* After this point our queues are empty
-	 * and no tasks are scheduled. */
-	hdev->close(hdev);
-
-	/* Clear flags */
-	hdev->flags &= BIT(HCI_RAW);
-	hci_dev_clear_volatile_flags(hdev);
-
-	/* Controller radio is available but is currently powered down */
-	hdev->amp_status = AMP_STATUS_POWERED_DOWN;
-
-	memset(hdev->eir, 0, sizeof(hdev->eir));
-	memset(hdev->dev_class, 0, sizeof(hdev->dev_class));
-	bacpy(&hdev->random_addr, BDADDR_ANY);
-	hci_codec_list_clear(&hdev->local_codecs);
-
-	hci_dev_put(hdev);
-	return err;
-}
-
 int hci_dev_do_close(struct hci_dev *hdev)
 {
 	int err;
@@ -1810,7 +609,7 @@ static int hci_dev_do_reset(struct hci_dev *hdev)
 	atomic_set(&hdev->cmd_cnt, 1);
 	hdev->acl_cnt = 0; hdev->sco_cnt = 0; hdev->le_cnt = 0;
 
-	ret = __hci_req_sync(hdev, hci_reset_req, 0, HCI_INIT_TIMEOUT, NULL);
+	ret = hci_reset_sync(hdev);
 
 	hci_req_sync_unlock(hdev);
 	return ret;
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index 8b63b4e5c96a..4e0a7719b58d 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -5,13 +5,19 @@
  * Copyright (C) 2021 Intel Corporation
  */
 
+#include <linux/property.h>
+
 #include <net/bluetooth/bluetooth.h>
 #include <net/bluetooth/hci_core.h>
 #include <net/bluetooth/mgmt.h>
 
 #include "hci_request.h"
+#include "hci_debugfs.h"
 #include "smp.h"
 #include "eir.h"
+#include "msft.h"
+#include "aosp.h"
+#include "leds.h"
 
 static void hci_cmd_sync_complete(struct hci_dev *hdev, u8 result, u16 opcode,
 				  struct sk_buff *skb)
@@ -144,7 +150,7 @@ struct sk_buff *__hci_cmd_sync_sk(struct hci_dev *hdev, u16 opcode, u32 plen,
 	struct sk_buff *skb;
 	int err = 0;
 
-	bt_dev_dbg(hdev, "");
+	bt_dev_dbg(hdev, "Opcode 0x%4x", opcode);
 
 	hci_req_init(&req, hdev);
 
@@ -2411,285 +2417,1931 @@ int hci_powered_update_sync(struct hci_dev *hdev)
 	return 0;
 }
 
-/* This function perform power on HCI command sequence as follows:
+/**
+ * hci_dev_get_bd_addr_from_property - Get the Bluetooth Device Address
+ *				       (BD_ADDR) for a HCI device from
+ *				       a firmware node property.
+ * @hdev:	The HCI device
  *
- * If controller is already up (HCI_UP) performs hci_powered_update_sync
- * sequence otherwise run hci_dev_open_sync which will follow with
- * hci_powered_update_sync after the init sequence is completed.
+ * Search the firmware node for 'local-bd-address'.
+ *
+ * All-zero BD addresses are rejected, because those could be properties
+ * that exist in the firmware tables, but were not updated by the firmware. For
+ * example, the DTS could define 'local-bd-address', with zero BD addresses.
  */
-static int hci_power_on_sync(struct hci_dev *hdev)
+static void hci_dev_get_bd_addr_from_property(struct hci_dev *hdev)
 {
-	int err;
+	struct fwnode_handle *fwnode = dev_fwnode(hdev->dev.parent);
+	bdaddr_t ba;
+	int ret;
 
-	if (test_bit(HCI_UP, &hdev->flags) &&
-	    hci_dev_test_flag(hdev, HCI_MGMT) &&
-	    hci_dev_test_and_clear_flag(hdev, HCI_AUTO_OFF)) {
-		cancel_delayed_work(&hdev->power_off);
-		return hci_powered_update_sync(hdev);
-	}
+	ret = fwnode_property_read_u8_array(fwnode, "local-bd-address",
+					    (u8 *)&ba, sizeof(ba));
+	if (ret < 0 || !bacmp(&ba, BDADDR_ANY))
+		return;
 
-	err = hci_dev_open_sync(hdev);
-	if (err < 0)
-		return err;
+	bacpy(&hdev->public_addr, &ba);
+}
 
-	/* During the HCI setup phase, a few error conditions are
-	 * ignored and they need to be checked now. If they are still
-	 * valid, it is important to return the device back off.
-	 */
-	if (hci_dev_test_flag(hdev, HCI_RFKILLED) ||
-	    hci_dev_test_flag(hdev, HCI_UNCONFIGURED) ||
-	    (hdev->dev_type == HCI_PRIMARY &&
-	     !bacmp(&hdev->bdaddr, BDADDR_ANY) &&
-	     !bacmp(&hdev->static_addr, BDADDR_ANY))) {
-		hci_dev_clear_flag(hdev, HCI_AUTO_OFF);
-		hci_dev_close_sync(hdev);
-	} else if (hci_dev_test_flag(hdev, HCI_AUTO_OFF)) {
-		queue_delayed_work(hdev->req_workqueue, &hdev->power_off,
-				   HCI_AUTO_OFF_TIMEOUT);
-	}
+struct hci_init_stage {
+	int (*func)(struct hci_dev *hdev);
+};
 
-	if (hci_dev_test_and_clear_flag(hdev, HCI_SETUP)) {
-		/* For unconfigured devices, set the HCI_RAW flag
-		 * so that userspace can easily identify them.
-		 */
-		if (hci_dev_test_flag(hdev, HCI_UNCONFIGURED))
-			set_bit(HCI_RAW, &hdev->flags);
+/* Run init stage NULL terminated function table */
+static int hci_init_stage_sync(struct hci_dev *hdev,
+			       const struct hci_init_stage *stage)
+{
+	size_t i;
 
-		/* For fully configured devices, this will send
-		 * the Index Added event. For unconfigured devices,
-		 * it will send Unconfigued Index Added event.
-		 *
-		 * Devices with HCI_QUIRK_RAW_DEVICE are ignored
-		 * and no event will be send.
-		 */
-		mgmt_index_added(hdev);
-	} else if (hci_dev_test_and_clear_flag(hdev, HCI_CONFIG)) {
-		/* When the controller is now configured, then it
-		 * is important to clear the HCI_RAW flag.
-		 */
-		if (!hci_dev_test_flag(hdev, HCI_UNCONFIGURED))
-			clear_bit(HCI_RAW, &hdev->flags);
+	for (i = 0; stage[i].func; i++) {
+		int err;
 
-		/* Powering on the controller with HCI_CONFIG set only
-		 * happens with the transition from unconfigured to
-		 * configured. This will send the Index Added event.
-		 */
-		mgmt_index_added(hdev);
+		err = stage[i].func(hdev);
+		if (err)
+			return err;
 	}
 
 	return 0;
 }
 
-static int hci_remote_name_cancel_sync(struct hci_dev *hdev, bdaddr_t *addr)
+/* Read Local Version */
+static int hci_read_local_version_sync(struct hci_dev *hdev)
 {
-	struct hci_cp_remote_name_req_cancel cp;
+	return __hci_cmd_sync_status(hdev, HCI_OP_READ_LOCAL_VERSION,
+				     0, NULL, HCI_CMD_TIMEOUT);
+}
 
-	memset(&cp, 0, sizeof(cp));
-	bacpy(&cp.bdaddr, addr);
+/* Read BD Address */
+static int hci_read_bd_addr_sync(struct hci_dev *hdev)
+{
+	return __hci_cmd_sync_status(hdev, HCI_OP_READ_BD_ADDR,
+				     0, NULL, HCI_CMD_TIMEOUT);
+}
 
-	return __hci_cmd_sync_status(hdev, HCI_OP_REMOTE_NAME_REQ_CANCEL,
-				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+#define HCI_INIT(_func) \
+{ \
+	.func = _func, \
 }
 
-int hci_stop_discovery_sync(struct hci_dev *hdev)
+static const struct hci_init_stage hci_init0[] = {
+	/* HCI_OP_READ_LOCAL_VERSION */
+	HCI_INIT(hci_read_local_version_sync),
+	/* HCI_OP_READ_BD_ADDR */
+	HCI_INIT(hci_read_bd_addr_sync),
+	{}
+};
+
+int hci_reset_sync(struct hci_dev *hdev)
 {
-	struct discovery_state *d = &hdev->discovery;
-	struct inquiry_entry *e;
 	int err;
 
-	bt_dev_dbg(hdev, "state %u", hdev->discovery.state);
+	set_bit(HCI_RESET, &hdev->flags);
 
-	if (d->state == DISCOVERY_FINDING || d->state == DISCOVERY_STOPPING) {
-		if (test_bit(HCI_INQUIRY, &hdev->flags)) {
-			err = __hci_cmd_sync_status(hdev, HCI_OP_INQUIRY_CANCEL,
-						    0, NULL, HCI_CMD_TIMEOUT);
-			if (err)
-				return err;
-		}
+	err = __hci_cmd_sync_status(hdev, HCI_OP_RESET, 0, NULL,
+				    HCI_CMD_TIMEOUT);
+	if (err)
+		return err;
 
-		if (hci_dev_test_flag(hdev, HCI_LE_SCAN)) {
-			cancel_delayed_work(&hdev->le_scan_disable);
-			cancel_delayed_work(&hdev->le_scan_restart);
+	return 0;
+}
 
-			err = hci_scan_disable_sync(hdev);
-			if (err)
-				return err;
-		}
+static int hci_init0_sync(struct hci_dev *hdev)
+{
+	int err;
 
-	} else {
-		err = hci_scan_disable_sync(hdev);
+	bt_dev_dbg(hdev, "");
+
+	/* Reset */
+	if (!test_bit(HCI_QUIRK_RESET_ON_CLOSE, &hdev->quirks)) {
+		err = hci_reset_sync(hdev);
 		if (err)
 			return err;
 	}
 
-	/* Resume advertising if it was paused */
-	if (use_ll_privacy(hdev))
-		hci_resume_advertising_sync(hdev);
+	return hci_init_stage_sync(hdev, hci_init0);
+}
 
-	/* No further actions needed for LE-only discovery */
-	if (d->type == DISCOV_TYPE_LE)
+static int hci_unconf_init_sync(struct hci_dev *hdev)
+{
+	int err;
+
+	if (test_bit(HCI_QUIRK_RAW_DEVICE, &hdev->quirks))
 		return 0;
 
-	if (d->state == DISCOVERY_RESOLVING || d->state == DISCOVERY_STOPPING) {
-		e = hci_inquiry_cache_lookup_resolve(hdev, BDADDR_ANY,
-						     NAME_PENDING);
-		if (!e)
-			return 0;
+	err = hci_init0_sync(hdev);
+	if (err < 0)
+		return err;
 
-		return hci_remote_name_cancel_sync(hdev, &e->data.bdaddr);
-	}
+	if (hci_dev_test_flag(hdev, HCI_SETUP))
+		hci_debugfs_create_basic(hdev);
 
 	return 0;
 }
 
-static int hci_disconnect_phy_link_sync(struct hci_dev *hdev, u16 handle,
-					u8 reason)
+/* Read Local Supported Features. */
+static int hci_read_local_features_sync(struct hci_dev *hdev)
 {
-	struct hci_cp_disconn_phy_link cp;
-
-	memset(&cp, 0, sizeof(cp));
-	cp.phy_handle = HCI_PHY_HANDLE(handle);
-	cp.reason = reason;
+	 /* Not all AMP controllers support this command */
+	if (hdev->dev_type == HCI_AMP && !(hdev->commands[14] & 0x20))
+		return 0;
 
-	return __hci_cmd_sync_status(hdev, HCI_OP_DISCONN_PHY_LINK,
-				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+	return __hci_cmd_sync_status(hdev, HCI_OP_READ_LOCAL_FEATURES,
+				     0, NULL, HCI_CMD_TIMEOUT);
 }
 
-static int hci_disconnect_sync(struct hci_dev *hdev, struct hci_conn *conn,
-			       u8 reason)
+/* BR Controller init stage 1 command sequence */
+static const struct hci_init_stage br_init1[] = {
+	/* HCI_OP_READ_LOCAL_FEATURES */
+	HCI_INIT(hci_read_local_features_sync),
+	/* HCI_OP_READ_LOCAL_VERSION */
+	HCI_INIT(hci_read_local_version_sync),
+	/* HCI_OP_READ_BD_ADDR */
+	HCI_INIT(hci_read_bd_addr_sync),
+	{}
+};
+
+/* Read Local Commands */
+static int hci_read_local_cmds_sync(struct hci_dev *hdev)
 {
-	struct hci_cp_disconnect cp;
-
-	if (conn->type == AMP_LINK)
-		return hci_disconnect_phy_link_sync(hdev, conn->handle, reason);
-
-	memset(&cp, 0, sizeof(cp));
-	cp.handle = cpu_to_le16(conn->handle);
-	cp.reason = reason;
+	/* All Bluetooth 1.2 and later controllers should support the
+	 * HCI command for reading the local supported commands.
+	 *
+	 * Unfortunately some controllers indicate Bluetooth 1.2 support,
+	 * but do not have support for this command. If that is the case,
+	 * the driver can quirk the behavior and skip reading the local
+	 * supported commands.
+	 */
+	if (hdev->hci_ver > BLUETOOTH_VER_1_1 &&
+	    !test_bit(HCI_QUIRK_BROKEN_LOCAL_COMMANDS, &hdev->quirks))
+		return __hci_cmd_sync_status(hdev, HCI_OP_READ_LOCAL_COMMANDS,
+					     0, NULL, HCI_CMD_TIMEOUT);
 
-	return __hci_cmd_sync_status(hdev, HCI_OP_DISCONNECT,
-				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+	return 0;
 }
 
-static int hci_le_connect_cancel_sync(struct hci_dev *hdev,
-				      struct hci_conn *conn)
+/* Read Local AMP Info */
+static int hci_read_local_amp_info_sync(struct hci_dev *hdev)
 {
-	if (test_bit(HCI_CONN_SCANNING, &conn->flags))
-		return 0;
-
-	return __hci_cmd_sync_status(hdev, HCI_OP_LE_CREATE_CONN_CANCEL,
-				     6, &conn->dst, HCI_CMD_TIMEOUT);
+	return __hci_cmd_sync_status(hdev, HCI_OP_READ_LOCAL_AMP_INFO,
+				     0, NULL, HCI_CMD_TIMEOUT);
 }
 
-static int hci_connect_cancel_sync(struct hci_dev *hdev, struct hci_conn *conn)
+/* Read Data Blk size */
+static int hci_read_data_block_size_sync(struct hci_dev *hdev)
 {
-	if (conn->type == LE_LINK)
-		return hci_le_connect_cancel_sync(hdev, conn);
+	return __hci_cmd_sync_status(hdev, HCI_OP_READ_DATA_BLOCK_SIZE,
+				     0, NULL, HCI_CMD_TIMEOUT);
+}
 
-	if (hdev->hci_ver < BLUETOOTH_VER_1_2)
-		return 0;
+/* Read Flow Control Mode */
+static int hci_read_flow_control_mode_sync(struct hci_dev *hdev)
+{
+	return __hci_cmd_sync_status(hdev, HCI_OP_READ_FLOW_CONTROL_MODE,
+				     0, NULL, HCI_CMD_TIMEOUT);
+}
 
-	return __hci_cmd_sync_status(hdev, HCI_OP_CREATE_CONN_CANCEL,
-				     6, &conn->dst, HCI_CMD_TIMEOUT);
+/* Read Location Data */
+static int hci_read_location_data_sync(struct hci_dev *hdev)
+{
+	return __hci_cmd_sync_status(hdev, HCI_OP_READ_LOCATION_DATA,
+				     0, NULL, HCI_CMD_TIMEOUT);
 }
 
-static int hci_reject_sco_sync(struct hci_dev *hdev, struct hci_conn *conn,
-			       u8 reason)
+/* AMP Controller init stage 1 command sequence */
+static const struct hci_init_stage amp_init1[] = {
+	/* HCI_OP_READ_LOCAL_VERSION */
+	HCI_INIT(hci_read_local_version_sync),
+	/* HCI_OP_READ_LOCAL_COMMANDS */
+	HCI_INIT(hci_read_local_cmds_sync),
+	/* HCI_OP_READ_LOCAL_AMP_INFO */
+	HCI_INIT(hci_read_local_amp_info_sync),
+	/* HCI_OP_READ_DATA_BLOCK_SIZE */
+	HCI_INIT(hci_read_data_block_size_sync),
+	/* HCI_OP_READ_FLOW_CONTROL_MODE */
+	HCI_INIT(hci_read_flow_control_mode_sync),
+	/* HCI_OP_READ_LOCATION_DATA */
+	HCI_INIT(hci_read_location_data_sync),
+};
+
+static int hci_init1_sync(struct hci_dev *hdev)
 {
-	struct hci_cp_reject_sync_conn_req cp;
+	int err;
 
-	memset(&cp, 0, sizeof(cp));
-	bacpy(&cp.bdaddr, &conn->dst);
-	cp.reason = reason;
+	bt_dev_dbg(hdev, "");
 
-	/* SCO rejection has its own limited set of
-	 * allowed error values (0x0D-0x0F).
-	 */
-	if (reason < 0x0d || reason > 0x0f)
-		cp.reason = HCI_ERROR_REJ_LIMITED_RESOURCES;
+	/* Reset */
+	if (!test_bit(HCI_QUIRK_RESET_ON_CLOSE, &hdev->quirks)) {
+		err = hci_reset_sync(hdev);
+		if (err)
+			return err;
+	}
 
-	return __hci_cmd_sync_status(hdev, HCI_OP_REJECT_SYNC_CONN_REQ,
-				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+	switch (hdev->dev_type) {
+	case HCI_PRIMARY:
+		hdev->flow_ctl_mode = HCI_FLOW_CTL_MODE_PACKET_BASED;
+		return hci_init_stage_sync(hdev, br_init1);
+	case HCI_AMP:
+		hdev->flow_ctl_mode = HCI_FLOW_CTL_MODE_BLOCK_BASED;
+		return hci_init_stage_sync(hdev, amp_init1);
+	default:
+		bt_dev_err(hdev, "Unknown device type %d", hdev->dev_type);
+		break;
+	}
+
+	return 0;
 }
 
-static int hci_reject_conn_sync(struct hci_dev *hdev, struct hci_conn *conn,
-				u8 reason)
+/* AMP Controller init stage 2 command sequence */
+static const struct hci_init_stage amp_init2[] = {
+	/* HCI_OP_READ_LOCAL_FEATURES */
+	HCI_INIT(hci_read_local_features_sync),
+};
+
+/* Read Buffer Size (ACL mtu, max pkt, etc.) */
+static int hci_read_buffer_size_sync(struct hci_dev *hdev)
 {
-	struct hci_cp_reject_conn_req cp;
+	return __hci_cmd_sync_status(hdev, HCI_OP_READ_BUFFER_SIZE,
+				     0, NULL, HCI_CMD_TIMEOUT);
+}
 
-	if (conn->type == SCO_LINK || conn->type == ESCO_LINK)
-		return hci_reject_sco_sync(hdev, conn, reason);
+/* Read Class of Device */
+static int hci_read_dev_class_sync(struct hci_dev *hdev)
+{
+	return __hci_cmd_sync_status(hdev, HCI_OP_READ_CLASS_OF_DEV,
+				     0, NULL, HCI_CMD_TIMEOUT);
+}
 
-	memset(&cp, 0, sizeof(cp));
-	bacpy(&cp.bdaddr, &conn->dst);
-	cp.reason = reason;
+/* Read Local Name */
+static int hci_read_local_name_sync(struct hci_dev *hdev)
+{
+	return __hci_cmd_sync_status(hdev, HCI_OP_READ_LOCAL_NAME,
+				     0, NULL, HCI_CMD_TIMEOUT);
+}
 
-	return __hci_cmd_sync_status(hdev, HCI_OP_REJECT_CONN_REQ,
-				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+/* Read Voice Setting */
+static int hci_read_voice_setting_sync(struct hci_dev *hdev)
+{
+	return __hci_cmd_sync_status(hdev, HCI_OP_READ_VOICE_SETTING,
+				     0, NULL, HCI_CMD_TIMEOUT);
 }
 
-static int hci_abort_conn_sync(struct hci_dev *hdev, struct hci_conn *conn,
-			       u8 reason)
+/* Read Number of Supported IAC */
+static int hci_read_num_supported_iac_sync(struct hci_dev *hdev)
 {
-	switch (conn->state) {
-	case BT_CONNECTED:
-	case BT_CONFIG:
-		return hci_disconnect_sync(hdev, conn, reason);
-	case BT_CONNECT:
-		return hci_connect_cancel_sync(hdev, conn);
-	case BT_CONNECT2:
-		return hci_reject_conn_sync(hdev, conn, reason);
-	default:
-		conn->state = BT_CLOSED;
-		break;
-	}
+	return __hci_cmd_sync_status(hdev, HCI_OP_READ_NUM_SUPPORTED_IAC,
+				     0, NULL, HCI_CMD_TIMEOUT);
+}
 
-	return 0;
+/* Read Current IAC LAP */
+static int hci_read_current_iac_lap_sync(struct hci_dev *hdev)
+{
+	return __hci_cmd_sync_status(hdev, HCI_OP_READ_CURRENT_IAC_LAP,
+				     0, NULL, HCI_CMD_TIMEOUT);
 }
 
-/* This function perform power off HCI command sequence as follows:
- *
- * Clear Advertising
- * Stop Discovery
- * Disconnect all connections
- * hci_dev_close_sync
- */
-static int hci_power_off_sync(struct hci_dev *hdev)
+static int hci_set_event_filter_sync(struct hci_dev *hdev, u8 flt_type,
+				     u8 cond_type, bdaddr_t *bdaddr,
+				     u8 auto_accept)
 {
-	struct hci_conn *conn;
-	int err;
+	struct hci_cp_set_event_filter cp;
 
-	/* If controller is already down there is nothing to do */
-	if (!test_bit(HCI_UP, &hdev->flags))
+	if (!hci_dev_test_flag(hdev, HCI_BREDR_ENABLED))
 		return 0;
 
-	if (test_bit(HCI_ISCAN, &hdev->flags) ||
-	    test_bit(HCI_PSCAN, &hdev->flags)) {
-		err = hci_write_scan_enable_sync(hdev, 0x00);
-		if (err)
-			return err;
-	}
-
-	err = hci_clear_adv_sync(hdev, NULL, false);
-	if (err)
-		return err;
-
-	err = hci_stop_discovery_sync(hdev);
-	if (err)
-		return err;
+	memset(&cp, 0, sizeof(cp));
+	cp.flt_type = flt_type;
 
-	list_for_each_entry(conn, &hdev->conn_hash.list, list) {
-		/* 0x15 == Terminated due to Power Off */
-		hci_abort_conn_sync(hdev, conn, 0x15);
+	if (flt_type != HCI_FLT_CLEAR_ALL) {
+		cp.cond_type = cond_type;
+		bacpy(&cp.addr_conn_flt.bdaddr, bdaddr);
+		cp.addr_conn_flt.auto_accept = auto_accept;
 	}
 
-	return hci_dev_close_sync(hdev);
+	return __hci_cmd_sync_status(hdev, HCI_OP_SET_EVENT_FLT,
+				     flt_type == HCI_FLT_CLEAR_ALL ?
+				     sizeof(cp.flt_type) : sizeof(cp), &cp,
+				     HCI_CMD_TIMEOUT);
 }
 
-int hci_set_powered_sync(struct hci_dev *hdev, u8 val)
+static int hci_clear_event_filter_sync(struct hci_dev *hdev)
 {
-	if (val)
-		return hci_power_on_sync(hdev);
+	if (!hci_dev_test_flag(hdev, HCI_EVENT_FILTER_CONFIGURED))
+		return 0;
+
+	return hci_set_event_filter_sync(hdev, HCI_FLT_CLEAR_ALL, 0x00,
+					 BDADDR_ANY, 0x00);
+}
+
+/* Connection accept timeout ~20 secs */
+static int hci_write_ca_timeout_sync(struct hci_dev *hdev)
+{
+	__le16 param = cpu_to_le16(0x7d00);
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_WRITE_CA_TIMEOUT,
+				     sizeof(param), &param, HCI_CMD_TIMEOUT);
+}
+
+/* BR Controller init stage 2 command sequence */
+static const struct hci_init_stage br_init2[] = {
+	/* HCI_OP_READ_BUFFER_SIZE */
+	HCI_INIT(hci_read_buffer_size_sync),
+	/* HCI_OP_READ_CLASS_OF_DEV */
+	HCI_INIT(hci_read_dev_class_sync),
+	/* HCI_OP_READ_LOCAL_NAME */
+	HCI_INIT(hci_read_local_name_sync),
+	/* HCI_OP_READ_VOICE_SETTING */
+	HCI_INIT(hci_read_voice_setting_sync),
+	/* HCI_OP_READ_NUM_SUPPORTED_IAC */
+	HCI_INIT(hci_read_num_supported_iac_sync),
+	/* HCI_OP_READ_CURRENT_IAC_LAP */
+	HCI_INIT(hci_read_current_iac_lap_sync),
+	/* HCI_OP_SET_EVENT_FLT */
+	HCI_INIT(hci_clear_event_filter_sync),
+	/* HCI_OP_WRITE_CA_TIMEOUT */
+	HCI_INIT(hci_write_ca_timeout_sync),
+	{}
+};
+
+static int hci_write_ssp_mode_1_sync(struct hci_dev *hdev)
+{
+	u8 mode = 0x01;
+
+	if (!lmp_ssp_capable(hdev) || !hci_dev_test_flag(hdev, HCI_SSP_ENABLED))
+		return 0;
+
+	/* When SSP is available, then the host features page
+	 * should also be available as well. However some
+	 * controllers list the max_page as 0 as long as SSP
+	 * has not been enabled. To achieve proper debugging
+	 * output, force the minimum max_page to 1 at least.
+	 */
+	hdev->max_page = 0x01;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_WRITE_SSP_MODE,
+				     sizeof(mode), &mode, HCI_CMD_TIMEOUT);
+}
+
+static int hci_write_eir_sync(struct hci_dev *hdev)
+{
+	struct hci_cp_write_eir cp;
+
+	if (!lmp_ssp_capable(hdev) || hci_dev_test_flag(hdev, HCI_SSP_ENABLED))
+		return 0;
+
+	memset(hdev->eir, 0, sizeof(hdev->eir));
+	memset(&cp, 0, sizeof(cp));
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_WRITE_EIR, sizeof(cp), &cp,
+				     HCI_CMD_TIMEOUT);
+}
+
+static int hci_write_inquiry_mode_sync(struct hci_dev *hdev)
+{
+	u8 mode;
+
+	if (!lmp_inq_rssi_capable(hdev) &&
+	    !test_bit(HCI_QUIRK_FIXUP_INQUIRY_MODE, &hdev->quirks))
+		return 0;
+
+	/* If Extended Inquiry Result events are supported, then
+	 * they are clearly preferred over Inquiry Result with RSSI
+	 * events.
+	 */
+	mode = lmp_ext_inq_capable(hdev) ? 0x02 : 0x01;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_WRITE_INQUIRY_MODE,
+				     sizeof(mode), &mode, HCI_CMD_TIMEOUT);
+}
+
+static int hci_read_inq_rsp_tx_power_sync(struct hci_dev *hdev)
+{
+	if (!lmp_inq_tx_pwr_capable(hdev))
+		return 0;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_READ_INQ_RSP_TX_POWER,
+				     0, NULL, HCI_CMD_TIMEOUT);
+}
+
+static int hci_read_local_ext_features_sync(struct hci_dev *hdev, u8 page)
+{
+	struct hci_cp_read_local_ext_features cp;
+
+	if (!lmp_ext_feat_capable(hdev))
+		return 0;
+
+	memset(&cp, 0, sizeof(cp));
+	cp.page = page;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_READ_LOCAL_EXT_FEATURES,
+				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+}
+
+static int hci_read_local_ext_features_1_sync(struct hci_dev *hdev)
+{
+	return hci_read_local_ext_features_sync(hdev, 0x01);
+}
+
+/* HCI Controller init stage 2 command sequence */
+static const struct hci_init_stage hci_init2[] = {
+	/* HCI_OP_READ_LOCAL_COMMANDS */
+	HCI_INIT(hci_read_local_cmds_sync),
+	/* HCI_OP_WRITE_SSP_MODE */
+	HCI_INIT(hci_write_ssp_mode_1_sync),
+	/* HCI_OP_WRITE_EIR */
+	HCI_INIT(hci_write_eir_sync),
+	/* HCI_OP_WRITE_INQUIRY_MODE */
+	HCI_INIT(hci_write_inquiry_mode_sync),
+	/* HCI_OP_READ_INQ_RSP_TX_POWER */
+	HCI_INIT(hci_read_inq_rsp_tx_power_sync),
+	/* HCI_OP_READ_LOCAL_EXT_FEATURES */
+	HCI_INIT(hci_read_local_ext_features_1_sync),
+	/* HCI_OP_WRITE_AUTH_ENABLE */
+	HCI_INIT(hci_write_auth_enable_sync),
+	{}
+};
+
+/* Read LE Buffer Size */
+static int hci_le_read_buffer_size_sync(struct hci_dev *hdev)
+{
+	return __hci_cmd_sync_status(hdev, HCI_OP_LE_READ_BUFFER_SIZE,
+				     0, NULL, HCI_CMD_TIMEOUT);
+}
+
+/* Read LE Local Supported Features */
+static int hci_le_read_local_features_sync(struct hci_dev *hdev)
+{
+	return __hci_cmd_sync_status(hdev, HCI_OP_LE_READ_LOCAL_FEATURES,
+				     0, NULL, HCI_CMD_TIMEOUT);
+}
+
+/* Read LE Supported States */
+static int hci_le_read_supported_states_sync(struct hci_dev *hdev)
+{
+	return __hci_cmd_sync_status(hdev, HCI_OP_LE_READ_SUPPORTED_STATES,
+				     0, NULL, HCI_CMD_TIMEOUT);
+}
+
+/* LE Controller init stage 2 command sequence */
+static const struct hci_init_stage le_init2[] = {
+	/* HCI_OP_LE_READ_BUFFER_SIZE */
+	HCI_INIT(hci_le_read_buffer_size_sync),
+	/* HCI_OP_LE_READ_LOCAL_FEATURES */
+	HCI_INIT(hci_le_read_local_features_sync),
+	/* HCI_OP_LE_READ_SUPPORTED_STATES */
+	HCI_INIT(hci_le_read_supported_states_sync),
+	{}
+};
+
+static int hci_init2_sync(struct hci_dev *hdev)
+{
+	int err;
+
+	bt_dev_dbg(hdev, "");
+
+	if (hdev->dev_type == HCI_AMP)
+		return hci_init_stage_sync(hdev, amp_init2);
+
+	if (lmp_bredr_capable(hdev)) {
+		err = hci_init_stage_sync(hdev, br_init2);
+		if (err)
+			return err;
+	} else {
+		hci_dev_clear_flag(hdev, HCI_BREDR_ENABLED);
+	}
+
+	if (lmp_le_capable(hdev)) {
+		err = hci_init_stage_sync(hdev, le_init2);
+		if (err)
+			return err;
+		/* LE-only controllers have LE implicitly enabled */
+		if (!lmp_bredr_capable(hdev))
+			hci_dev_set_flag(hdev, HCI_LE_ENABLED);
+	}
+
+	return hci_init_stage_sync(hdev, hci_init2);
+}
+
+static int hci_set_event_mask_sync(struct hci_dev *hdev)
+{
+	/* The second byte is 0xff instead of 0x9f (two reserved bits
+	 * disabled) since a Broadcom 1.2 dongle doesn't respond to the
+	 * command otherwise.
+	 */
+	u8 events[8] = { 0xff, 0xff, 0xfb, 0xff, 0x00, 0x00, 0x00, 0x00 };
+
+	/* CSR 1.1 dongles does not accept any bitfield so don't try to set
+	 * any event mask for pre 1.2 devices.
+	 */
+	if (hdev->hci_ver < BLUETOOTH_VER_1_2)
+		return 0;
+
+	if (lmp_bredr_capable(hdev)) {
+		events[4] |= 0x01; /* Flow Specification Complete */
+	} else {
+		/* Use a different default for LE-only devices */
+		memset(events, 0, sizeof(events));
+		events[1] |= 0x20; /* Command Complete */
+		events[1] |= 0x40; /* Command Status */
+		events[1] |= 0x80; /* Hardware Error */
+
+		/* If the controller supports the Disconnect command, enable
+		 * the corresponding event. In addition enable packet flow
+		 * control related events.
+		 */
+		if (hdev->commands[0] & 0x20) {
+			events[0] |= 0x10; /* Disconnection Complete */
+			events[2] |= 0x04; /* Number of Completed Packets */
+			events[3] |= 0x02; /* Data Buffer Overflow */
+		}
+
+		/* If the controller supports the Read Remote Version
+		 * Information command, enable the corresponding event.
+		 */
+		if (hdev->commands[2] & 0x80)
+			events[1] |= 0x08; /* Read Remote Version Information
+					    * Complete
+					    */
+
+		if (hdev->le_features[0] & HCI_LE_ENCRYPTION) {
+			events[0] |= 0x80; /* Encryption Change */
+			events[5] |= 0x80; /* Encryption Key Refresh Complete */
+		}
+	}
+
+	if (lmp_inq_rssi_capable(hdev) ||
+	    test_bit(HCI_QUIRK_FIXUP_INQUIRY_MODE, &hdev->quirks))
+		events[4] |= 0x02; /* Inquiry Result with RSSI */
+
+	if (lmp_ext_feat_capable(hdev))
+		events[4] |= 0x04; /* Read Remote Extended Features Complete */
+
+	if (lmp_esco_capable(hdev)) {
+		events[5] |= 0x08; /* Synchronous Connection Complete */
+		events[5] |= 0x10; /* Synchronous Connection Changed */
+	}
+
+	if (lmp_sniffsubr_capable(hdev))
+		events[5] |= 0x20; /* Sniff Subrating */
+
+	if (lmp_pause_enc_capable(hdev))
+		events[5] |= 0x80; /* Encryption Key Refresh Complete */
+
+	if (lmp_ext_inq_capable(hdev))
+		events[5] |= 0x40; /* Extended Inquiry Result */
+
+	if (lmp_no_flush_capable(hdev))
+		events[7] |= 0x01; /* Enhanced Flush Complete */
+
+	if (lmp_lsto_capable(hdev))
+		events[6] |= 0x80; /* Link Supervision Timeout Changed */
+
+	if (lmp_ssp_capable(hdev)) {
+		events[6] |= 0x01;	/* IO Capability Request */
+		events[6] |= 0x02;	/* IO Capability Response */
+		events[6] |= 0x04;	/* User Confirmation Request */
+		events[6] |= 0x08;	/* User Passkey Request */
+		events[6] |= 0x10;	/* Remote OOB Data Request */
+		events[6] |= 0x20;	/* Simple Pairing Complete */
+		events[7] |= 0x04;	/* User Passkey Notification */
+		events[7] |= 0x08;	/* Keypress Notification */
+		events[7] |= 0x10;	/* Remote Host Supported
+					 * Features Notification
+					 */
+	}
+
+	if (lmp_le_capable(hdev))
+		events[7] |= 0x20;	/* LE Meta-Event */
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_SET_EVENT_MASK,
+				     sizeof(events), events, HCI_CMD_TIMEOUT);
+}
+
+static int hci_read_stored_link_key_sync(struct hci_dev *hdev)
+{
+	struct hci_cp_read_stored_link_key cp;
+
+	if (!(hdev->commands[6] & 0x20) ||
+	    test_bit(HCI_QUIRK_BROKEN_STORED_LINK_KEY, &hdev->quirks))
+		return 0;
+
+	memset(&cp, 0, sizeof(cp));
+	bacpy(&cp.bdaddr, BDADDR_ANY);
+	cp.read_all = 0x01;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_READ_STORED_LINK_KEY,
+				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+}
+
+static int hci_setup_link_policy_sync(struct hci_dev *hdev)
+{
+	struct hci_cp_write_def_link_policy cp;
+	u16 link_policy = 0;
+
+	if (!(hdev->commands[5] & 0x10))
+		return 0;
+
+	memset(&cp, 0, sizeof(cp));
+
+	if (lmp_rswitch_capable(hdev))
+		link_policy |= HCI_LP_RSWITCH;
+	if (lmp_hold_capable(hdev))
+		link_policy |= HCI_LP_HOLD;
+	if (lmp_sniff_capable(hdev))
+		link_policy |= HCI_LP_SNIFF;
+	if (lmp_park_capable(hdev))
+		link_policy |= HCI_LP_PARK;
+
+	cp.policy = cpu_to_le16(link_policy);
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_WRITE_DEF_LINK_POLICY,
+				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+}
+
+static int hci_read_page_scan_activity_sync(struct hci_dev *hdev)
+{
+	if (!(hdev->commands[8] & 0x01))
+		return 0;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_READ_PAGE_SCAN_ACTIVITY,
+				     0, NULL, HCI_CMD_TIMEOUT);
+}
+
+static int hci_read_def_err_data_reporting_sync(struct hci_dev *hdev)
+{
+	if (!(hdev->commands[18] & 0x04) ||
+	    test_bit(HCI_QUIRK_BROKEN_ERR_DATA_REPORTING, &hdev->quirks))
+		return 0;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_READ_DEF_ERR_DATA_REPORTING,
+				     0, NULL, HCI_CMD_TIMEOUT);
+}
+
+static int hci_read_page_scan_type_sync(struct hci_dev *hdev)
+{
+	/* Some older Broadcom based Bluetooth 1.2 controllers do not
+	 * support the Read Page Scan Type command. Check support for
+	 * this command in the bit mask of supported commands.
+	 */
+	if (!(hdev->commands[13] & 0x01))
+		return 0;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_READ_PAGE_SCAN_TYPE,
+				     0, NULL, HCI_CMD_TIMEOUT);
+}
+
+/* Read features beyond page 1 if available */
+static int hci_read_local_ext_features_all_sync(struct hci_dev *hdev)
+{
+	u8 page;
+	int err;
+
+	if (!lmp_ext_feat_capable(hdev))
+		return 0;
+
+	for (page = 2; page < HCI_MAX_PAGES && page <= hdev->max_page;
+	     page++) {
+		err = hci_read_local_ext_features_sync(hdev, page);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+/* HCI Controller init stage 3 command sequence */
+static const struct hci_init_stage hci_init3[] = {
+	/* HCI_OP_SET_EVENT_MASK */
+	HCI_INIT(hci_set_event_mask_sync),
+	/* HCI_OP_READ_STORED_LINK_KEY */
+	HCI_INIT(hci_read_stored_link_key_sync),
+	/* HCI_OP_WRITE_DEF_LINK_POLICY */
+	HCI_INIT(hci_setup_link_policy_sync),
+	/* HCI_OP_READ_PAGE_SCAN_ACTIVITY */
+	HCI_INIT(hci_read_page_scan_activity_sync),
+	/* HCI_OP_READ_DEF_ERR_DATA_REPORTING */
+	HCI_INIT(hci_read_def_err_data_reporting_sync),
+	/* HCI_OP_READ_PAGE_SCAN_TYPE */
+	HCI_INIT(hci_read_page_scan_type_sync),
+	/* HCI_OP_READ_LOCAL_EXT_FEATURES */
+	HCI_INIT(hci_read_local_ext_features_all_sync),
+	{}
+};
+
+static int hci_le_set_event_mask_sync(struct hci_dev *hdev)
+{
+	u8 events[8];
+
+	if (!lmp_le_capable(hdev))
+		return 0;
+
+	memset(events, 0, sizeof(events));
+
+	if (hdev->le_features[0] & HCI_LE_ENCRYPTION)
+		events[0] |= 0x10;	/* LE Long Term Key Request */
+
+	/* If controller supports the Connection Parameters Request
+	 * Link Layer Procedure, enable the corresponding event.
+	 */
+	if (hdev->le_features[0] & HCI_LE_CONN_PARAM_REQ_PROC)
+		/* LE Remote Connection Parameter Request */
+		events[0] |= 0x20;
+
+	/* If the controller supports the Data Length Extension
+	 * feature, enable the corresponding event.
+	 */
+	if (hdev->le_features[0] & HCI_LE_DATA_LEN_EXT)
+		events[0] |= 0x40;	/* LE Data Length Change */
+
+	/* If the controller supports LL Privacy feature, enable
+	 * the corresponding event.
+	 */
+	if (hdev->le_features[0] & HCI_LE_LL_PRIVACY)
+		events[1] |= 0x02;	/* LE Enhanced Connection Complete */
+
+	/* If the controller supports Extended Scanner Filter
+	 * Policies, enable the corresponding event.
+	 */
+	if (hdev->le_features[0] & HCI_LE_EXT_SCAN_POLICY)
+		events[1] |= 0x04;	/* LE Direct Advertising Report */
+
+	/* If the controller supports Channel Selection Algorithm #2
+	 * feature, enable the corresponding event.
+	 */
+	if (hdev->le_features[1] & HCI_LE_CHAN_SEL_ALG2)
+		events[2] |= 0x08;	/* LE Channel Selection Algorithm */
+
+	/* If the controller supports the LE Set Scan Enable command,
+	 * enable the corresponding advertising report event.
+	 */
+	if (hdev->commands[26] & 0x08)
+		events[0] |= 0x02;	/* LE Advertising Report */
+
+	/* If the controller supports the LE Create Connection
+	 * command, enable the corresponding event.
+	 */
+	if (hdev->commands[26] & 0x10)
+		events[0] |= 0x01;	/* LE Connection Complete */
+
+	/* If the controller supports the LE Connection Update
+	 * command, enable the corresponding event.
+	 */
+	if (hdev->commands[27] & 0x04)
+		events[0] |= 0x04;	/* LE Connection Update Complete */
+
+	/* If the controller supports the LE Read Remote Used Features
+	 * command, enable the corresponding event.
+	 */
+	if (hdev->commands[27] & 0x20)
+		/* LE Read Remote Used Features Complete */
+		events[0] |= 0x08;
+
+	/* If the controller supports the LE Read Local P-256
+	 * Public Key command, enable the corresponding event.
+	 */
+	if (hdev->commands[34] & 0x02)
+		/* LE Read Local P-256 Public Key Complete */
+		events[0] |= 0x80;
+
+	/* If the controller supports the LE Generate DHKey
+	 * command, enable the corresponding event.
+	 */
+	if (hdev->commands[34] & 0x04)
+		events[1] |= 0x01;	/* LE Generate DHKey Complete */
+
+	/* If the controller supports the LE Set Default PHY or
+	 * LE Set PHY commands, enable the corresponding event.
+	 */
+	if (hdev->commands[35] & (0x20 | 0x40))
+		events[1] |= 0x08;        /* LE PHY Update Complete */
+
+	/* If the controller supports LE Set Extended Scan Parameters
+	 * and LE Set Extended Scan Enable commands, enable the
+	 * corresponding event.
+	 */
+	if (use_ext_scan(hdev))
+		events[1] |= 0x10;	/* LE Extended Advertising Report */
+
+	/* If the controller supports the LE Extended Advertising
+	 * command, enable the corresponding event.
+	 */
+	if (ext_adv_capable(hdev))
+		events[2] |= 0x02;	/* LE Advertising Set Terminated */
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_LE_SET_EVENT_MASK,
+				     sizeof(events), events, HCI_CMD_TIMEOUT);
+}
+
+/* Read LE Advertising Channel TX Power */
+static int hci_le_read_adv_tx_power_sync(struct hci_dev *hdev)
+{
+	if ((hdev->commands[25] & 0x40) && !ext_adv_capable(hdev)) {
+		/* HCI TS spec forbids mixing of legacy and extended
+		 * advertising commands wherein READ_ADV_TX_POWER is
+		 * also included. So do not call it if extended adv
+		 * is supported otherwise controller will return
+		 * COMMAND_DISALLOWED for extended commands.
+		 */
+		return __hci_cmd_sync_status(hdev,
+					       HCI_OP_LE_READ_ADV_TX_POWER,
+					       0, NULL, HCI_CMD_TIMEOUT);
+	}
+
+	return 0;
+}
+
+/* Read LE Min/Max Tx Power*/
+static int hci_le_read_tx_power_sync(struct hci_dev *hdev)
+{
+	if (!(hdev->commands[38] & 0x80))
+		return 0;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_LE_READ_TRANSMIT_POWER,
+				     0, NULL, HCI_CMD_TIMEOUT);
+}
+
+/* Read LE Accept List Size */
+static int hci_le_read_accept_list_size_sync(struct hci_dev *hdev)
+{
+	if (!(hdev->commands[26] & 0x40))
+		return 0;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_LE_READ_ACCEPT_LIST_SIZE,
+				     0, NULL, HCI_CMD_TIMEOUT);
+}
+
+/* Clear LE Accept List */
+static int hci_le_clear_accept_list_sync(struct hci_dev *hdev)
+{
+	if (!(hdev->commands[26] & 0x80))
+		return 0;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_LE_CLEAR_ACCEPT_LIST, 0, NULL,
+				     HCI_CMD_TIMEOUT);
+}
+
+/* Read LE Resolving List Size */
+static int hci_le_read_resolv_list_size_sync(struct hci_dev *hdev)
+{
+	if (!(hdev->commands[34] & 0x40))
+		return 0;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_LE_READ_RESOLV_LIST_SIZE,
+				     0, NULL, HCI_CMD_TIMEOUT);
+}
+
+/* Clear LE Resolving List */
+static int hci_le_clear_resolv_list_sync(struct hci_dev *hdev)
+{
+	if (!(hdev->commands[34] & 0x20))
+		return 0;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_LE_CLEAR_RESOLV_LIST, 0, NULL,
+				     HCI_CMD_TIMEOUT);
+}
+
+/* Set RPA timeout */
+static int hci_le_set_rpa_timeout_sync(struct hci_dev *hdev)
+{
+	__le16 timeout = cpu_to_le16(hdev->rpa_timeout);
+
+	if (!(hdev->commands[35] & 0x04))
+		return 0;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_LE_SET_RPA_TIMEOUT,
+				     sizeof(timeout), &timeout,
+				     HCI_CMD_TIMEOUT);
+}
+
+/* Read LE Maximum Data Length */
+static int hci_le_read_max_data_len_sync(struct hci_dev *hdev)
+{
+	if (!(hdev->le_features[0] & HCI_LE_DATA_LEN_EXT))
+		return 0;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_LE_READ_MAX_DATA_LEN, 0, NULL,
+				     HCI_CMD_TIMEOUT);
+}
+
+/* Read LE Suggested Default Data Length */
+static int hci_le_read_def_data_len_sync(struct hci_dev *hdev)
+{
+	if (!(hdev->le_features[0] & HCI_LE_DATA_LEN_EXT))
+		return 0;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_LE_READ_DEF_DATA_LEN, 0, NULL,
+				     HCI_CMD_TIMEOUT);
+}
+
+/* Read LE Number of Supported Advertising Sets */
+static int hci_le_read_num_support_adv_sets_sync(struct hci_dev *hdev)
+{
+	if (!ext_adv_capable(hdev))
+		return 0;
+
+	return __hci_cmd_sync_status(hdev,
+				     HCI_OP_LE_READ_NUM_SUPPORTED_ADV_SETS,
+				     0, NULL, HCI_CMD_TIMEOUT);
+}
+
+/* Write LE Host Supported */
+static int hci_set_le_support_sync(struct hci_dev *hdev)
+{
+	struct hci_cp_write_le_host_supported cp;
+
+	/* LE-only devices do not support explicit enablement */
+	if (!lmp_bredr_capable(hdev))
+		return 0;
+
+	memset(&cp, 0, sizeof(cp));
+
+	if (hci_dev_test_flag(hdev, HCI_LE_ENABLED)) {
+		cp.le = 0x01;
+		cp.simul = 0x00;
+	}
+
+	if (cp.le == lmp_host_le_capable(hdev))
+		return 0;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_WRITE_LE_HOST_SUPPORTED,
+				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+}
+
+/* LE Controller init stage 3 command sequence */
+static const struct hci_init_stage le_init3[] = {
+	/* HCI_OP_LE_SET_EVENT_MASK */
+	HCI_INIT(hci_le_set_event_mask_sync),
+	/* HCI_OP_LE_READ_ADV_TX_POWER */
+	HCI_INIT(hci_le_read_adv_tx_power_sync),
+	/* HCI_OP_LE_READ_TRANSMIT_POWER */
+	HCI_INIT(hci_le_read_tx_power_sync),
+	/* HCI_OP_LE_READ_ACCEPT_LIST_SIZE */
+	HCI_INIT(hci_le_read_accept_list_size_sync),
+	/* HCI_OP_LE_CLEAR_ACCEPT_LIST */
+	HCI_INIT(hci_le_clear_accept_list_sync),
+	/* HCI_OP_LE_READ_RESOLV_LIST_SIZE */
+	HCI_INIT(hci_le_read_resolv_list_size_sync),
+	/* HCI_OP_LE_CLEAR_RESOLV_LIST */
+	HCI_INIT(hci_le_clear_resolv_list_sync),
+	/* HCI_OP_LE_SET_RPA_TIMEOUT */
+	HCI_INIT(hci_le_set_rpa_timeout_sync),
+	/* HCI_OP_LE_READ_MAX_DATA_LEN */
+	HCI_INIT(hci_le_read_max_data_len_sync),
+	/* HCI_OP_LE_READ_DEF_DATA_LEN */
+	HCI_INIT(hci_le_read_def_data_len_sync),
+	/* HCI_OP_LE_READ_NUM_SUPPORTED_ADV_SETS */
+	HCI_INIT(hci_le_read_num_support_adv_sets_sync),
+	/* HCI_OP_WRITE_LE_HOST_SUPPORTED */
+	HCI_INIT(hci_set_le_support_sync),
+	{}
+};
+
+static int hci_init3_sync(struct hci_dev *hdev)
+{
+	int err;
+
+	bt_dev_dbg(hdev, "");
+
+	err = hci_init_stage_sync(hdev, hci_init3);
+	if (err)
+		return err;
+
+	if (lmp_le_capable(hdev))
+		return hci_init_stage_sync(hdev, le_init3);
+
+	return 0;
+}
+
+static int hci_delete_stored_link_key_sync(struct hci_dev *hdev)
+{
+	struct hci_cp_delete_stored_link_key cp;
+
+	/* Some Broadcom based Bluetooth controllers do not support the
+	 * Delete Stored Link Key command. They are clearly indicating its
+	 * absence in the bit mask of supported commands.
+	 *
+	 * Check the supported commands and only if the command is marked
+	 * as supported send it. If not supported assume that the controller
+	 * does not have actual support for stored link keys which makes this
+	 * command redundant anyway.
+	 *
+	 * Some controllers indicate that they support handling deleting
+	 * stored link keys, but they don't. The quirk lets a driver
+	 * just disable this command.
+	 */
+	if (!(hdev->commands[6] & 0x80) ||
+	    test_bit(HCI_QUIRK_BROKEN_STORED_LINK_KEY, &hdev->quirks))
+		return 0;
+
+	memset(&cp, 0, sizeof(cp));
+	bacpy(&cp.bdaddr, BDADDR_ANY);
+	cp.delete_all = 0x01;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_DELETE_STORED_LINK_KEY,
+				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+}
+
+static int hci_set_event_mask_page_2_sync(struct hci_dev *hdev)
+{
+	u8 events[8] = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
+	bool changed = false;
+
+	/* Set event mask page 2 if the HCI command for it is supported */
+	if (!(hdev->commands[22] & 0x04))
+		return 0;
+
+	/* If Connectionless Peripheral Broadcast central role is supported
+	 * enable all necessary events for it.
+	 */
+	if (lmp_cpb_central_capable(hdev)) {
+		events[1] |= 0x40;	/* Triggered Clock Capture */
+		events[1] |= 0x80;	/* Synchronization Train Complete */
+		events[2] |= 0x10;	/* Peripheral Page Response Timeout */
+		events[2] |= 0x20;	/* CPB Channel Map Change */
+		changed = true;
+	}
+
+	/* If Connectionless Peripheral Broadcast peripheral role is supported
+	 * enable all necessary events for it.
+	 */
+	if (lmp_cpb_peripheral_capable(hdev)) {
+		events[2] |= 0x01;	/* Synchronization Train Received */
+		events[2] |= 0x02;	/* CPB Receive */
+		events[2] |= 0x04;	/* CPB Timeout */
+		events[2] |= 0x08;	/* Truncated Page Complete */
+		changed = true;
+	}
+
+	/* Enable Authenticated Payload Timeout Expired event if supported */
+	if (lmp_ping_capable(hdev) || hdev->le_features[0] & HCI_LE_PING) {
+		events[2] |= 0x80;
+		changed = true;
+	}
+
+	/* Some Broadcom based controllers indicate support for Set Event
+	 * Mask Page 2 command, but then actually do not support it. Since
+	 * the default value is all bits set to zero, the command is only
+	 * required if the event mask has to be changed. In case no change
+	 * to the event mask is needed, skip this command.
+	 */
+	if (!changed)
+		return 0;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_SET_EVENT_MASK_PAGE_2,
+				     sizeof(events), events, HCI_CMD_TIMEOUT);
+}
+
+/* Read local codec list if the HCI command is supported */
+static int hci_read_local_codecs_sync(struct hci_dev *hdev)
+{
+	if (!(hdev->commands[29] & 0x20))
+		return 0;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_READ_LOCAL_CODECS, 0, NULL,
+				     HCI_CMD_TIMEOUT);
+}
+
+/* Read local pairing options if the HCI command is supported */
+static int hci_read_local_pairing_opts_sync(struct hci_dev *hdev)
+{
+	if (!(hdev->commands[41] & 0x08))
+		return 0;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_READ_LOCAL_PAIRING_OPTS,
+				     0, NULL, HCI_CMD_TIMEOUT);
+}
+
+/* Get MWS transport configuration if the HCI command is supported */
+static int hci_get_mws_transport_config_sync(struct hci_dev *hdev)
+{
+	if (!(hdev->commands[30] & 0x08))
+		return 0;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_GET_MWS_TRANSPORT_CONFIG,
+				     0, NULL, HCI_CMD_TIMEOUT);
+}
+
+/* Check for Synchronization Train support */
+static int hci_read_sync_train_params_sync(struct hci_dev *hdev)
+{
+	if (!lmp_sync_train_capable(hdev))
+		return 0;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_READ_SYNC_TRAIN_PARAMS,
+				     0, NULL, HCI_CMD_TIMEOUT);
+}
+
+/* Enable Secure Connections if supported and configured */
+static int hci_write_sc_support_1_sync(struct hci_dev *hdev)
+{
+	u8 support = 0x01;
+
+	if (!hci_dev_test_flag(hdev, HCI_SSP_ENABLED) ||
+	    !bredr_sc_enabled(hdev))
+		return 0;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_WRITE_SC_SUPPORT,
+				     sizeof(support), &support,
+				     HCI_CMD_TIMEOUT);
+}
+
+/* Set erroneous data reporting if supported to the wideband speech
+ * setting value
+ */
+static int hci_set_err_data_report_sync(struct hci_dev *hdev)
+{
+	struct hci_cp_write_def_err_data_reporting cp;
+	bool enabled = hci_dev_test_flag(hdev, HCI_WIDEBAND_SPEECH_ENABLED);
+
+	if (!(hdev->commands[18] & 0x08) ||
+	    test_bit(HCI_QUIRK_BROKEN_ERR_DATA_REPORTING, &hdev->quirks))
+		return 0;
+
+	if (enabled == hdev->err_data_reporting)
+		return 0;
+
+	memset(&cp, 0, sizeof(cp));
+	cp.err_data_reporting = enabled ? ERR_DATA_REPORTING_ENABLED :
+				ERR_DATA_REPORTING_DISABLED;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_WRITE_DEF_ERR_DATA_REPORTING,
+				    sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+}
+
+static const struct hci_init_stage hci_init4[] = {
+	 /* HCI_OP_DELETE_STORED_LINK_KEY */
+	HCI_INIT(hci_delete_stored_link_key_sync),
+	/* HCI_OP_SET_EVENT_MASK_PAGE_2 */
+	HCI_INIT(hci_set_event_mask_page_2_sync),
+	/* HCI_OP_READ_LOCAL_CODECS */
+	HCI_INIT(hci_read_local_codecs_sync),
+	 /* HCI_OP_READ_LOCAL_PAIRING_OPTS */
+	HCI_INIT(hci_read_local_pairing_opts_sync),
+	 /* HCI_OP_GET_MWS_TRANSPORT_CONFIG */
+	HCI_INIT(hci_get_mws_transport_config_sync),
+	 /* HCI_OP_READ_SYNC_TRAIN_PARAMS */
+	HCI_INIT(hci_read_sync_train_params_sync),
+	/* HCI_OP_WRITE_SC_SUPPORT */
+	HCI_INIT(hci_write_sc_support_1_sync),
+	/* HCI_OP_WRITE_DEF_ERR_DATA_REPORTING */
+	HCI_INIT(hci_set_err_data_report_sync),
+	{}
+};
+
+/* Set Suggested Default Data Length to maximum if supported */
+static int hci_le_set_write_def_data_len_sync(struct hci_dev *hdev)
+{
+	struct hci_cp_le_write_def_data_len cp;
+
+	if (!(hdev->le_features[0] & HCI_LE_DATA_LEN_EXT))
+		return 0;
+
+	memset(&cp, 0, sizeof(cp));
+	cp.tx_len = cpu_to_le16(hdev->le_max_tx_len);
+	cp.tx_time = cpu_to_le16(hdev->le_max_tx_time);
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_LE_WRITE_DEF_DATA_LEN,
+				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+}
+
+/* Set Default PHY parameters if command is supported */
+static int hci_le_set_default_phy_sync(struct hci_dev *hdev)
+{
+	struct hci_cp_le_set_default_phy cp;
+
+	if (!(hdev->commands[35] & 0x20))
+		return 0;
+
+	memset(&cp, 0, sizeof(cp));
+	cp.all_phys = 0x00;
+	cp.tx_phys = hdev->le_tx_def_phys;
+	cp.rx_phys = hdev->le_rx_def_phys;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_LE_SET_DEFAULT_PHY,
+				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+}
+
+static const struct hci_init_stage le_init4[] = {
+	/* HCI_OP_LE_WRITE_DEF_DATA_LEN */
+	HCI_INIT(hci_le_set_write_def_data_len_sync),
+	/* HCI_OP_LE_SET_DEFAULT_PHY */
+	HCI_INIT(hci_le_set_default_phy_sync),
+	{}
+};
+
+static int hci_init4_sync(struct hci_dev *hdev)
+{
+	int err;
+
+	bt_dev_dbg(hdev, "");
+
+	err = hci_init_stage_sync(hdev, hci_init4);
+	if (err)
+		return err;
+
+	if (lmp_le_capable(hdev))
+		return hci_init_stage_sync(hdev, le_init4);
+
+	return 0;
+}
+
+static int hci_init_sync(struct hci_dev *hdev)
+{
+	int err;
+
+	err = hci_init1_sync(hdev);
+	if (err < 0)
+		return err;
+
+	if (hci_dev_test_flag(hdev, HCI_SETUP))
+		hci_debugfs_create_basic(hdev);
+
+	err = hci_init2_sync(hdev);
+	if (err < 0)
+		return err;
+
+	/* HCI_PRIMARY covers both single-mode LE, BR/EDR and dual-mode
+	 * BR/EDR/LE type controllers. AMP controllers only need the
+	 * first two stages of init.
+	 */
+	if (hdev->dev_type != HCI_PRIMARY)
+		return 0;
+
+	err = hci_init3_sync(hdev);
+	if (err < 0)
+		return err;
+
+	err = hci_init4_sync(hdev);
+	if (err < 0)
+		return err;
+
+	/* This function is only called when the controller is actually in
+	 * configured state. When the controller is marked as unconfigured,
+	 * this initialization procedure is not run.
+	 *
+	 * It means that it is possible that a controller runs through its
+	 * setup phase and then discovers missing settings. If that is the
+	 * case, then this function will not be called. It then will only
+	 * be called during the config phase.
+	 *
+	 * So only when in setup phase or config phase, create the debugfs
+	 * entries and register the SMP channels.
+	 */
+	if (!hci_dev_test_flag(hdev, HCI_SETUP) &&
+	    !hci_dev_test_flag(hdev, HCI_CONFIG))
+		return 0;
+
+	hci_debugfs_create_common(hdev);
+
+	if (lmp_bredr_capable(hdev))
+		hci_debugfs_create_bredr(hdev);
+
+	if (lmp_le_capable(hdev))
+		hci_debugfs_create_le(hdev);
+
+	return 0;
+}
+
+int hci_dev_open_sync(struct hci_dev *hdev)
+{
+	int ret = 0;
+
+	bt_dev_dbg(hdev, "");
+
+	if (hci_dev_test_flag(hdev, HCI_UNREGISTER)) {
+		ret = -ENODEV;
+		goto done;
+	}
+
+	if (!hci_dev_test_flag(hdev, HCI_SETUP) &&
+	    !hci_dev_test_flag(hdev, HCI_CONFIG)) {
+		/* Check for rfkill but allow the HCI setup stage to
+		 * proceed (which in itself doesn't cause any RF activity).
+		 */
+		if (hci_dev_test_flag(hdev, HCI_RFKILLED)) {
+			ret = -ERFKILL;
+			goto done;
+		}
+
+		/* Check for valid public address or a configured static
+		 * random address, but let the HCI setup proceed to
+		 * be able to determine if there is a public address
+		 * or not.
+		 *
+		 * In case of user channel usage, it is not important
+		 * if a public address or static random address is
+		 * available.
+		 *
+		 * This check is only valid for BR/EDR controllers
+		 * since AMP controllers do not have an address.
+		 */
+		if (!hci_dev_test_flag(hdev, HCI_USER_CHANNEL) &&
+		    hdev->dev_type == HCI_PRIMARY &&
+		    !bacmp(&hdev->bdaddr, BDADDR_ANY) &&
+		    !bacmp(&hdev->static_addr, BDADDR_ANY)) {
+			ret = -EADDRNOTAVAIL;
+			goto done;
+		}
+	}
+
+	if (test_bit(HCI_UP, &hdev->flags)) {
+		ret = -EALREADY;
+		goto done;
+	}
+
+	if (hdev->open(hdev)) {
+		ret = -EIO;
+		goto done;
+	}
+
+	set_bit(HCI_RUNNING, &hdev->flags);
+	hci_sock_dev_event(hdev, HCI_DEV_OPEN);
+
+	atomic_set(&hdev->cmd_cnt, 1);
+	set_bit(HCI_INIT, &hdev->flags);
+
+	if (hci_dev_test_flag(hdev, HCI_SETUP) ||
+	    test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
+		bool invalid_bdaddr;
+
+		hci_sock_dev_event(hdev, HCI_DEV_SETUP);
+
+		if (hdev->setup)
+			ret = hdev->setup(hdev);
+
+		/* The transport driver can set the quirk to mark the
+		 * BD_ADDR invalid before creating the HCI device or in
+		 * its setup callback.
+		 */
+		invalid_bdaddr = test_bit(HCI_QUIRK_INVALID_BDADDR,
+					  &hdev->quirks);
+
+		if (ret)
+			goto setup_failed;
+
+		if (test_bit(HCI_QUIRK_USE_BDADDR_PROPERTY, &hdev->quirks)) {
+			if (!bacmp(&hdev->public_addr, BDADDR_ANY))
+				hci_dev_get_bd_addr_from_property(hdev);
+
+			if (bacmp(&hdev->public_addr, BDADDR_ANY) &&
+			    hdev->set_bdaddr) {
+				ret = hdev->set_bdaddr(hdev,
+						       &hdev->public_addr);
+
+				/* If setting of the BD_ADDR from the device
+				 * property succeeds, then treat the address
+				 * as valid even if the invalid BD_ADDR
+				 * quirk indicates otherwise.
+				 */
+				if (!ret)
+					invalid_bdaddr = false;
+			}
+		}
+
+setup_failed:
+		/* The transport driver can set these quirks before
+		 * creating the HCI device or in its setup callback.
+		 *
+		 * For the invalid BD_ADDR quirk it is possible that
+		 * it becomes a valid address if the bootloader does
+		 * provide it (see above).
+		 *
+		 * In case any of them is set, the controller has to
+		 * start up as unconfigured.
+		 */
+		if (test_bit(HCI_QUIRK_EXTERNAL_CONFIG, &hdev->quirks) ||
+		    invalid_bdaddr)
+			hci_dev_set_flag(hdev, HCI_UNCONFIGURED);
+
+		/* For an unconfigured controller it is required to
+		 * read at least the version information provided by
+		 * the Read Local Version Information command.
+		 *
+		 * If the set_bdaddr driver callback is provided, then
+		 * also the original Bluetooth public device address
+		 * will be read using the Read BD Address command.
+		 */
+		if (hci_dev_test_flag(hdev, HCI_UNCONFIGURED))
+			ret = hci_unconf_init_sync(hdev);
+	}
+
+	if (hci_dev_test_flag(hdev, HCI_CONFIG)) {
+		/* If public address change is configured, ensure that
+		 * the address gets programmed. If the driver does not
+		 * support changing the public address, fail the power
+		 * on procedure.
+		 */
+		if (bacmp(&hdev->public_addr, BDADDR_ANY) &&
+		    hdev->set_bdaddr)
+			ret = hdev->set_bdaddr(hdev, &hdev->public_addr);
+		else
+			ret = -EADDRNOTAVAIL;
+	}
+
+	if (!ret) {
+		if (!hci_dev_test_flag(hdev, HCI_UNCONFIGURED) &&
+		    !hci_dev_test_flag(hdev, HCI_USER_CHANNEL)) {
+			ret = hci_init_sync(hdev);
+			if (!ret && hdev->post_init)
+				ret = hdev->post_init(hdev);
+		}
+	}
+
+	/* If the HCI Reset command is clearing all diagnostic settings,
+	 * then they need to be reprogrammed after the init procedure
+	 * completed.
+	 */
+	if (test_bit(HCI_QUIRK_NON_PERSISTENT_DIAG, &hdev->quirks) &&
+	    !hci_dev_test_flag(hdev, HCI_USER_CHANNEL) &&
+	    hci_dev_test_flag(hdev, HCI_VENDOR_DIAG) && hdev->set_diag)
+		ret = hdev->set_diag(hdev, true);
+
+	msft_do_open(hdev);
+	aosp_do_open(hdev);
+
+	clear_bit(HCI_INIT, &hdev->flags);
+
+	if (!ret) {
+		hci_dev_hold(hdev);
+		hci_dev_set_flag(hdev, HCI_RPA_EXPIRED);
+		hci_adv_instances_set_rpa_expired(hdev, true);
+		set_bit(HCI_UP, &hdev->flags);
+		hci_sock_dev_event(hdev, HCI_DEV_UP);
+		hci_leds_update_powered(hdev, true);
+		if (!hci_dev_test_flag(hdev, HCI_SETUP) &&
+		    !hci_dev_test_flag(hdev, HCI_CONFIG) &&
+		    !hci_dev_test_flag(hdev, HCI_UNCONFIGURED) &&
+		    !hci_dev_test_flag(hdev, HCI_USER_CHANNEL) &&
+		    hci_dev_test_flag(hdev, HCI_MGMT) &&
+		    hdev->dev_type == HCI_PRIMARY) {
+			ret = hci_powered_update_sync(hdev);
+		}
+	} else {
+		/* Init failed, cleanup */
+		flush_work(&hdev->tx_work);
+
+		/* Since hci_rx_work() is possible to awake new cmd_work
+		 * it should be flushed first to avoid unexpected call of
+		 * hci_cmd_work()
+		 */
+		flush_work(&hdev->rx_work);
+		flush_work(&hdev->cmd_work);
+
+		skb_queue_purge(&hdev->cmd_q);
+		skb_queue_purge(&hdev->rx_q);
+
+		if (hdev->flush)
+			hdev->flush(hdev);
+
+		if (hdev->sent_cmd) {
+			kfree_skb(hdev->sent_cmd);
+			hdev->sent_cmd = NULL;
+		}
+
+		clear_bit(HCI_RUNNING, &hdev->flags);
+		hci_sock_dev_event(hdev, HCI_DEV_CLOSE);
+
+		hdev->close(hdev);
+		hdev->flags &= BIT(HCI_RAW);
+	}
+
+done:
+	return ret;
+}
+
+/* This function requires the caller holds hdev->lock */
+static void hci_pend_le_actions_clear(struct hci_dev *hdev)
+{
+	struct hci_conn_params *p;
+
+	list_for_each_entry(p, &hdev->le_conn_params, list) {
+		if (p->conn) {
+			hci_conn_drop(p->conn);
+			hci_conn_put(p->conn);
+			p->conn = NULL;
+		}
+		list_del_init(&p->action);
+	}
+
+	BT_DBG("All LE pending actions cleared");
+}
+
+int hci_dev_close_sync(struct hci_dev *hdev)
+{
+	bool auto_off;
+	int err = 0;
+
+	bt_dev_dbg(hdev, "");
+
+	cancel_delayed_work(&hdev->power_off);
+	cancel_delayed_work(&hdev->ncmd_timer);
+
+	hci_request_cancel_all(hdev);
+
+	if (!hci_dev_test_flag(hdev, HCI_UNREGISTER) &&
+	    !hci_dev_test_flag(hdev, HCI_USER_CHANNEL) &&
+	    test_bit(HCI_UP, &hdev->flags)) {
+		/* Execute vendor specific shutdown routine */
+		if (hdev->shutdown)
+			err = hdev->shutdown(hdev);
+	}
+
+	if (!test_and_clear_bit(HCI_UP, &hdev->flags)) {
+		cancel_delayed_work_sync(&hdev->cmd_timer);
+		return err;
+	}
+
+	hci_leds_update_powered(hdev, false);
+
+	/* Flush RX and TX works */
+	flush_work(&hdev->tx_work);
+	flush_work(&hdev->rx_work);
+
+	if (hdev->discov_timeout > 0) {
+		hdev->discov_timeout = 0;
+		hci_dev_clear_flag(hdev, HCI_DISCOVERABLE);
+		hci_dev_clear_flag(hdev, HCI_LIMITED_DISCOVERABLE);
+	}
+
+	if (hci_dev_test_and_clear_flag(hdev, HCI_SERVICE_CACHE))
+		cancel_delayed_work(&hdev->service_cache);
+
+	if (hci_dev_test_flag(hdev, HCI_MGMT)) {
+		struct adv_info *adv_instance;
+
+		cancel_delayed_work_sync(&hdev->rpa_expired);
+
+		list_for_each_entry(adv_instance, &hdev->adv_instances, list)
+			cancel_delayed_work_sync(&adv_instance->rpa_expired_cb);
+	}
+
+	/* Avoid potential lockdep warnings from the *_flush() calls by
+	 * ensuring the workqueue is empty up front.
+	 */
+	drain_workqueue(hdev->workqueue);
+
+	hci_dev_lock(hdev);
+
+	hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
+
+	auto_off = hci_dev_test_and_clear_flag(hdev, HCI_AUTO_OFF);
+
+	if (!auto_off && hdev->dev_type == HCI_PRIMARY &&
+	    !hci_dev_test_flag(hdev, HCI_USER_CHANNEL) &&
+	    hci_dev_test_flag(hdev, HCI_MGMT))
+		__mgmt_power_off(hdev);
+
+	hci_inquiry_cache_flush(hdev);
+	hci_pend_le_actions_clear(hdev);
+	hci_conn_hash_flush(hdev);
+	hci_dev_unlock(hdev);
+
+	smp_unregister(hdev);
+
+	hci_sock_dev_event(hdev, HCI_DEV_DOWN);
+
+	aosp_do_close(hdev);
+	msft_do_close(hdev);
+
+	if (hdev->flush)
+		hdev->flush(hdev);
+
+	/* Reset device */
+	skb_queue_purge(&hdev->cmd_q);
+	atomic_set(&hdev->cmd_cnt, 1);
+	if (test_bit(HCI_QUIRK_RESET_ON_CLOSE, &hdev->quirks) &&
+	    !auto_off && !hci_dev_test_flag(hdev, HCI_UNCONFIGURED)) {
+		set_bit(HCI_INIT, &hdev->flags);
+		hci_reset_sync(hdev);
+		clear_bit(HCI_INIT, &hdev->flags);
+	}
+
+	/* flush cmd  work */
+	flush_work(&hdev->cmd_work);
+
+	/* Drop queues */
+	skb_queue_purge(&hdev->rx_q);
+	skb_queue_purge(&hdev->cmd_q);
+	skb_queue_purge(&hdev->raw_q);
+
+	/* Drop last sent command */
+	if (hdev->sent_cmd) {
+		cancel_delayed_work_sync(&hdev->cmd_timer);
+		kfree_skb(hdev->sent_cmd);
+		hdev->sent_cmd = NULL;
+	}
+
+	clear_bit(HCI_RUNNING, &hdev->flags);
+	hci_sock_dev_event(hdev, HCI_DEV_CLOSE);
+
+	if (test_and_clear_bit(SUSPEND_POWERING_DOWN, hdev->suspend_tasks))
+		wake_up(&hdev->suspend_wait_q);
+
+	/* After this point our queues are empty and no tasks are scheduled. */
+	hdev->close(hdev);
+
+	/* Clear flags */
+	hdev->flags &= BIT(HCI_RAW);
+	hci_dev_clear_volatile_flags(hdev);
+
+	/* Controller radio is available but is currently powered down */
+	hdev->amp_status = AMP_STATUS_POWERED_DOWN;
+
+	memset(hdev->eir, 0, sizeof(hdev->eir));
+	memset(hdev->dev_class, 0, sizeof(hdev->dev_class));
+	bacpy(&hdev->random_addr, BDADDR_ANY);
+
+	hci_dev_put(hdev);
+	return err;
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
+int hci_stop_discovery_sync(struct hci_dev *hdev)
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
+	/* Resume advertising if it was paused */
+	if (use_ll_privacy(hdev))
+		hci_resume_advertising_sync(hdev);
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
+	/* Wait for HCI_EV_DISCONN_COMPLETE not HCI_EV_CMD_STATUS when not
+	 * suspending.
+	 */
+	if (!hdev->suspended)
+		return __hci_cmd_sync_status_sk(hdev, HCI_OP_DISCONNECT,
+						sizeof(cp), &cp,
+						HCI_EV_DISCONN_COMPLETE,
+						HCI_CMD_TIMEOUT, NULL);
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_DISCONNECT, sizeof(cp), &cp,
+				     HCI_CMD_TIMEOUT);
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
 
 	return hci_power_off_sync(hdev);
 }
@@ -2881,6 +4533,5 @@ int hci_start_discovery_sync(struct hci_dev *hdev)
 
 	queue_delayed_work(hdev->req_workqueue, &hdev->le_scan_disable,
 			   timeout);
-
 	return 0;
 }
-- 
2.31.1

