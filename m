Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63A254643D5
	for <lists+linux-bluetooth@lfdr.de>; Wed,  1 Dec 2021 01:04:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345837AbhLAAHp (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 30 Nov 2021 19:07:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345714AbhLAAGr (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 30 Nov 2021 19:06:47 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC2CCC06175A;
        Tue, 30 Nov 2021 16:03:12 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id 8so22330737pfo.4;
        Tue, 30 Nov 2021 16:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tl+fetv2D52DqRwpO2BQeH6Vxz1vqkVL6HPM19bTx18=;
        b=TlP3Ot0+xo7qCRXU4kzgeheWMKS9lotg2T3Nur005PzeCMygR1uq02CDL6A/FlkmBI
         yRkS+mTBIcTR3dm6OxvgrS52AMXhOaad8qX+onVl55FqmWCdgidCfPS5H7zrSTNEL6SX
         RZO97kD7t4PtylTbM3e1lNTlrbb4TPRS9KbHWqY29tw+Z8FjNaN0bIM1Z7P4SdCk+gnE
         l/HTM5OksrOUnW9wUzF0cYq2pvxCktRlJe6dRqRRLYGo8kM054eocVP0qGaEQe/eMbCx
         716kZZf9+2wFTfjfCsZm+JlL00y+T3vga/ic1FT2HqveW6VUsXlZ1loEM0QHXbzoFNrB
         cNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tl+fetv2D52DqRwpO2BQeH6Vxz1vqkVL6HPM19bTx18=;
        b=LgTo5OtvcqGIqS5KAMHZEWp1I00GfcI3SafXSHCHuA4WEQcZQZAkzocI0HXNzzUKA2
         1U/TCcBLaKtTwgt/Z8VxwxTivN29+DHnP73newGrzwNpPTq66dcP3zRCygcx5vcj2Lzw
         Vd3Nj1qXgHukqjN5y75bXd9i5iYHO97DcKPRxKMevvveKTkvncyqgs+2u+p4LjvYcLBA
         Y5Mx/SU8m1MG5cLkl2IpMrT2u3D1KP577QmoGWQT40iJblzdzAkPO1W3l/hx8riEssUd
         mkhguCQiioPFIuuI5ssjVQocPPcyxkozQprfySjAFwIt7uaCbL9aFmj7cs12bM0gMcmA
         lYVQ==
X-Gm-Message-State: AOAM530nNLcJp2alRMX0WJRG/DM0dwNWsfdodu6tk8KUc8zF9sKJ2PIY
        eMq9oo1Iq9IhKuvgcYJMFOcXVb9W62I=
X-Google-Smtp-Source: ABdhPJy7ykABLLf1q0F8v5jtLuJSsP55jVDYpeCasYrPzHoZW67EapAYYqkFj5YtzecY6ZxvdW/e+Q==
X-Received: by 2002:a63:4909:: with SMTP id w9mr1899761pga.567.1638316991763;
        Tue, 30 Nov 2021 16:03:11 -0800 (PST)
Received: from lvondent-mobl4.intel.com (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id j13sm21001739pfc.151.2021.11.30.16.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 16:03:11 -0800 (PST)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        dan.carpenter@oracle.com,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: [PATCH 14/15] Bluetooth: hci_event: Use of a function table to handle Command Complete
Date:   Tue, 30 Nov 2021 16:02:14 -0800
Message-Id: <20211201000215.1134831-15-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211201000215.1134831-1-luiz.dentz@gmail.com>
References: <20211201000215.1134831-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This change the use of switch statement to a function table which is
easier to extend and can include min/max length of each command.

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 net/bluetooth/hci_event.c | 1848 +++++++++++++++----------------------
 1 file changed, 752 insertions(+), 1096 deletions(-)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index c39f5ea1736a..0b69d527ca4e 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -81,14 +81,10 @@ static void *hci_le_ev_skb_pull(struct hci_dev *hdev, struct sk_buff *skb,
 	return data;
 }
 
-static void hci_cc_inquiry_cancel(struct hci_dev *hdev, struct sk_buff *skb,
-				  u8 *new_status)
+static u8 hci_cc_inquiry_cancel(struct hci_dev *hdev, void *data,
+				struct sk_buff *skb)
 {
-	struct hci_ev_status *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_INQUIRY_CANCEL, sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_ev_status *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
@@ -104,10 +100,8 @@ static void hci_cc_inquiry_cancel(struct hci_dev *hdev, struct sk_buff *skb,
 		rp->status = 0x00;
 	}
 
-	*new_status = rp->status;
-
 	if (rp->status)
-		return;
+		return rp->status;
 
 	clear_bit(HCI_INQUIRY, &hdev->flags);
 	smp_mb__after_atomic(); /* wake_up_bit advises about this barrier */
@@ -123,68 +117,62 @@ static void hci_cc_inquiry_cancel(struct hci_dev *hdev, struct sk_buff *skb,
 	hci_dev_unlock(hdev);
 
 	hci_conn_check_pending(hdev);
+
+	return rp->status;
 }
 
-static void hci_cc_periodic_inq(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_periodic_inq(struct hci_dev *hdev, void *data,
+			      struct sk_buff *skb)
 {
-	struct hci_ev_status *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_PERIODIC_INQ, sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_ev_status *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	hci_dev_set_flag(hdev, HCI_PERIODIC_INQ);
+
+	return rp->status;
 }
 
-static void hci_cc_exit_periodic_inq(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_exit_periodic_inq(struct hci_dev *hdev, void *data,
+				   struct sk_buff *skb)
 {
-	struct hci_ev_status *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_EXIT_PERIODIC_INQ, sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_ev_status *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	hci_dev_clear_flag(hdev, HCI_PERIODIC_INQ);
 
 	hci_conn_check_pending(hdev);
+
+	return rp->status;
 }
 
-static void hci_cc_remote_name_req_cancel(struct hci_dev *hdev,
-					  struct sk_buff *skb)
+static u8 hci_cc_remote_name_req_cancel(struct hci_dev *hdev, void *data,
+					struct sk_buff *skb)
 {
-	struct hci_ev_status *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_REMOTE_NAME_REQ_CANCEL,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_ev_status *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	return rp->status;
 }
 
-static void hci_cc_role_discovery(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_role_discovery(struct hci_dev *hdev, void *data,
+				struct sk_buff *skb)
 {
-	struct hci_rp_role_discovery *rp;
+	struct hci_rp_role_discovery *rp = data;
 	struct hci_conn *conn;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_ROLE_DISCOVERY, sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	hci_dev_lock(hdev);
 
@@ -193,21 +181,20 @@ static void hci_cc_role_discovery(struct hci_dev *hdev, struct sk_buff *skb)
 		conn->role = rp->role;
 
 	hci_dev_unlock(hdev);
+
+	return rp->status;
 }
 
-static void hci_cc_read_link_policy(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_read_link_policy(struct hci_dev *hdev, void *data,
+				  struct sk_buff *skb)
 {
-	struct hci_rp_read_link_policy *rp;
+	struct hci_rp_read_link_policy *rp = data;
 	struct hci_conn *conn;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_LINK_POLICY, sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	hci_dev_lock(hdev);
 
@@ -216,26 +203,25 @@ static void hci_cc_read_link_policy(struct hci_dev *hdev, struct sk_buff *skb)
 		conn->link_policy = __le16_to_cpu(rp->policy);
 
 	hci_dev_unlock(hdev);
+
+	return rp->status;
 }
 
-static void hci_cc_write_link_policy(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_write_link_policy(struct hci_dev *hdev, void *data,
+				   struct sk_buff *skb)
 {
-	struct hci_rp_write_link_policy *rp;
+	struct hci_rp_write_link_policy *rp = data;
 	struct hci_conn *conn;
 	void *sent;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_WRITE_LINK_POLICY, sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_WRITE_LINK_POLICY);
 	if (!sent)
-		return;
+		return rp->status;
 
 	hci_dev_lock(hdev);
 
@@ -244,63 +230,55 @@ static void hci_cc_write_link_policy(struct hci_dev *hdev, struct sk_buff *skb)
 		conn->link_policy = get_unaligned_le16(sent + 2);
 
 	hci_dev_unlock(hdev);
+
+	return rp->status;
 }
 
-static void hci_cc_read_def_link_policy(struct hci_dev *hdev,
-					struct sk_buff *skb)
+static u8 hci_cc_read_def_link_policy(struct hci_dev *hdev, void *data,
+				      struct sk_buff *skb)
 {
-	struct hci_rp_read_def_link_policy *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_DEF_LINK_POLICY,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_read_def_link_policy *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	hdev->link_policy = __le16_to_cpu(rp->policy);
+
+	return rp->status;
 }
 
-static void hci_cc_write_def_link_policy(struct hci_dev *hdev,
-					 struct sk_buff *skb)
+static u8 hci_cc_write_def_link_policy(struct hci_dev *hdev, void *data,
+				       struct sk_buff *skb)
 {
-	struct hci_ev_status *rp;
+	struct hci_ev_status *rp = data;
 	void *sent;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_WRITE_DEF_LINK_POLICY,
-			     sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_WRITE_DEF_LINK_POLICY);
 	if (!sent)
-		return;
+		return rp->status;
 
 	hdev->link_policy = get_unaligned_le16(sent);
+
+	return rp->status;
 }
 
-static void hci_cc_reset(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_reset(struct hci_dev *hdev, void *data, struct sk_buff *skb)
 {
-	struct hci_ev_status *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_RESET, sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_ev_status *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	clear_bit(HCI_RESET, &hdev->flags);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	/* Reset all non-persistent flags */
 	hci_dev_clear_volatile_flags(hdev);
@@ -322,66 +300,59 @@ static void hci_cc_reset(struct hci_dev *hdev, struct sk_buff *skb)
 
 	hci_bdaddr_list_clear(&hdev->le_accept_list);
 	hci_bdaddr_list_clear(&hdev->le_resolv_list);
+
+	return rp->status;
 }
 
-static void hci_cc_read_stored_link_key(struct hci_dev *hdev,
-					struct sk_buff *skb)
+static u8 hci_cc_read_stored_link_key(struct hci_dev *hdev, void *data,
+				      struct sk_buff *skb)
 {
-	struct hci_rp_read_stored_link_key *rp;
+	struct hci_rp_read_stored_link_key *rp = data;
 	struct hci_cp_read_stored_link_key *sent;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_STORED_LINK_KEY,
-			     sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_READ_STORED_LINK_KEY);
 	if (!sent)
-		return;
+		return rp->status;
 
 	if (!rp->status && sent->read_all == 0x01) {
 		hdev->stored_max_keys = le16_to_cpu(rp->max_keys);
 		hdev->stored_num_keys = le16_to_cpu(rp->num_keys);
 	}
+
+	return rp->status;
 }
 
-static void hci_cc_delete_stored_link_key(struct hci_dev *hdev,
-					  struct sk_buff *skb)
+static u8 hci_cc_delete_stored_link_key(struct hci_dev *hdev, void *data,
+					struct sk_buff *skb)
 {
-	struct hci_rp_delete_stored_link_key *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_DELETE_STORED_LINK_KEY,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_delete_stored_link_key *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	if (rp->num_keys <= hdev->stored_num_keys)
 		hdev->stored_num_keys -= le16_to_cpu(rp->num_keys);
 	else
 		hdev->stored_num_keys = 0;
+
+	return rp->status;
 }
 
-static void hci_cc_write_local_name(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_write_local_name(struct hci_dev *hdev, void *data,
+				  struct sk_buff *skb)
 {
-	struct hci_ev_status *rp;
+	struct hci_ev_status *rp = data;
 	void *sent;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_WRITE_LOCAL_NAME, sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_WRITE_LOCAL_NAME);
 	if (!sent)
-		return;
+		return rp->status;
 
 	hci_dev_lock(hdev);
 
@@ -391,40 +362,38 @@ static void hci_cc_write_local_name(struct hci_dev *hdev, struct sk_buff *skb)
 		memcpy(hdev->dev_name, sent, HCI_MAX_NAME_LENGTH);
 
 	hci_dev_unlock(hdev);
+
+	return rp->status;
 }
 
-static void hci_cc_read_local_name(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_read_local_name(struct hci_dev *hdev, void *data,
+				 struct sk_buff *skb)
 {
-	struct hci_rp_read_local_name *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_LOCAL_NAME, sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_read_local_name *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	if (hci_dev_test_flag(hdev, HCI_SETUP) ||
 	    hci_dev_test_flag(hdev, HCI_CONFIG))
 		memcpy(hdev->dev_name, rp->name, HCI_MAX_NAME_LENGTH);
+
+	return rp->status;
 }
 
-static void hci_cc_write_auth_enable(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_write_auth_enable(struct hci_dev *hdev, void *data,
+				   struct sk_buff *skb)
 {
-	struct hci_ev_status *rp;
+	struct hci_ev_status *rp = data;
 	void *sent;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_WRITE_AUTH_ENABLE, sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_WRITE_AUTH_ENABLE);
 	if (!sent)
-		return;
+		return rp->status;
 
 	hci_dev_lock(hdev);
 
@@ -441,26 +410,25 @@ static void hci_cc_write_auth_enable(struct hci_dev *hdev, struct sk_buff *skb)
 		mgmt_auth_enable_complete(hdev, rp->status);
 
 	hci_dev_unlock(hdev);
+
+	return rp->status;
 }
 
-static void hci_cc_write_encrypt_mode(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_write_encrypt_mode(struct hci_dev *hdev, void *data,
+				    struct sk_buff *skb)
 {
-	struct hci_ev_status *rp;
+	struct hci_ev_status *rp = data;
 	__u8 param;
 	void *sent;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_WRITE_ENCRYPT_MODE, sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_WRITE_ENCRYPT_MODE);
 	if (!sent)
-		return;
+		return rp->status;
 
 	param = *((__u8 *) sent);
 
@@ -468,23 +436,22 @@ static void hci_cc_write_encrypt_mode(struct hci_dev *hdev, struct sk_buff *skb)
 		set_bit(HCI_ENCRYPT, &hdev->flags);
 	else
 		clear_bit(HCI_ENCRYPT, &hdev->flags);
+
+	return rp->status;
 }
 
-static void hci_cc_write_scan_enable(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_write_scan_enable(struct hci_dev *hdev, void *data,
+				   struct sk_buff *skb)
 {
-	struct hci_ev_status *rp;
+	struct hci_ev_status *rp = data;
 	__u8 param;
 	void *sent;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_WRITE_SCAN_ENABLE, sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_WRITE_SCAN_ENABLE);
 	if (!sent)
-		return;
+		return rp->status;
 
 	param = *((__u8 *) sent);
 
@@ -507,26 +474,25 @@ static void hci_cc_write_scan_enable(struct hci_dev *hdev, struct sk_buff *skb)
 
 done:
 	hci_dev_unlock(hdev);
+
+	return rp->status;
 }
 
-static void hci_cc_set_event_filter(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_set_event_filter(struct hci_dev *hdev, void *data,
+				  struct sk_buff *skb)
 {
-	struct hci_ev_status *rp;
+	struct hci_ev_status *rp = data;
 	struct hci_cp_set_event_filter *cp;
 	void *sent;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_WRITE_SCAN_ENABLE, sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_SET_EVENT_FLT);
 	if (!sent)
-		return;
+		return rp->status;
 
 	cp = (struct hci_cp_set_event_filter *)sent;
 
@@ -534,41 +500,39 @@ static void hci_cc_set_event_filter(struct hci_dev *hdev, struct sk_buff *skb)
 		hci_dev_clear_flag(hdev, HCI_EVENT_FILTER_CONFIGURED);
 	else
 		hci_dev_set_flag(hdev, HCI_EVENT_FILTER_CONFIGURED);
+
+	return rp->status;
 }
 
-static void hci_cc_read_class_of_dev(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_read_class_of_dev(struct hci_dev *hdev, void *data,
+				   struct sk_buff *skb)
 {
-	struct hci_rp_read_class_of_dev *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_CLASS_OF_DEV, sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_read_class_of_dev *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	memcpy(hdev->dev_class, rp->dev_class, 3);
 
 	bt_dev_dbg(hdev, "class 0x%.2x%.2x%.2x", hdev->dev_class[2],
 		   hdev->dev_class[1], hdev->dev_class[0]);
+
+	return rp->status;
 }
 
-static void hci_cc_write_class_of_dev(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_write_class_of_dev(struct hci_dev *hdev, void *data,
+				    struct sk_buff *skb)
 {
-	struct hci_ev_status *rp;
+	struct hci_ev_status *rp = data;
 	void *sent;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_CLASS_OF_DEV, sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_WRITE_CLASS_OF_DEV);
 	if (!sent)
-		return;
+		return rp->status;
 
 	hci_dev_lock(hdev);
 
@@ -579,26 +543,25 @@ static void hci_cc_write_class_of_dev(struct hci_dev *hdev, struct sk_buff *skb)
 		mgmt_set_class_of_dev_complete(hdev, sent, rp->status);
 
 	hci_dev_unlock(hdev);
+
+	return rp->status;
 }
 
-static void hci_cc_read_voice_setting(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_read_voice_setting(struct hci_dev *hdev, void *data,
+				    struct sk_buff *skb)
 {
-	struct hci_rp_read_voice_setting *rp;
+	struct hci_rp_read_voice_setting *rp = data;
 	__u16 setting;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_VOICE_SETTING, sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	setting = __le16_to_cpu(rp->voice_setting);
 
 	if (hdev->voice_setting == setting)
-		return;
+		return rp->status;
 
 	hdev->voice_setting = setting;
 
@@ -606,33 +569,30 @@ static void hci_cc_read_voice_setting(struct hci_dev *hdev, struct sk_buff *skb)
 
 	if (hdev->notify)
 		hdev->notify(hdev, HCI_NOTIFY_VOICE_SETTING);
+
+	return rp->status;
 }
 
-static void hci_cc_write_voice_setting(struct hci_dev *hdev,
-				       struct sk_buff *skb)
+static u8 hci_cc_write_voice_setting(struct hci_dev *hdev, void *data,
+				     struct sk_buff *skb)
 {
-	struct hci_ev_status *rp;
+	struct hci_ev_status *rp = data;
 	__u16 setting;
 	void *sent;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_WRITE_VOICE_SETTING,
-			     sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_WRITE_VOICE_SETTING);
 	if (!sent)
-		return;
+		return rp->status;
 
 	setting = get_unaligned_le16(sent);
 
 	if (hdev->voice_setting == setting)
-		return;
+		return rp->status;
 
 	hdev->voice_setting = setting;
 
@@ -640,42 +600,38 @@ static void hci_cc_write_voice_setting(struct hci_dev *hdev,
 
 	if (hdev->notify)
 		hdev->notify(hdev, HCI_NOTIFY_VOICE_SETTING);
+
+	return rp->status;
 }
 
-static void hci_cc_read_num_supported_iac(struct hci_dev *hdev,
-					  struct sk_buff *skb)
+static u8 hci_cc_read_num_supported_iac(struct hci_dev *hdev, void *data,
+					struct sk_buff *skb)
 {
-	struct hci_rp_read_num_supported_iac *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_NUM_SUPPORTED_IAC,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_read_num_supported_iac *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	hdev->num_iac = rp->num_iac;
 
 	bt_dev_dbg(hdev, "num iac %d", hdev->num_iac);
+
+	return rp->status;
 }
 
-static void hci_cc_write_ssp_mode(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_write_ssp_mode(struct hci_dev *hdev, void *data,
+				struct sk_buff *skb)
 {
-	struct hci_ev_status *rp;
+	struct hci_ev_status *rp = data;
 	struct hci_cp_write_ssp_mode *sent;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_WRITE_SSP_MODE, sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_WRITE_SSP_MODE);
 	if (!sent)
-		return;
+		return rp->status;
 
 	hci_dev_lock(hdev);
 
@@ -694,22 +650,21 @@ static void hci_cc_write_ssp_mode(struct hci_dev *hdev, struct sk_buff *skb)
 	}
 
 	hci_dev_unlock(hdev);
+
+	return rp->status;
 }
 
-static void hci_cc_write_sc_support(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_write_sc_support(struct hci_dev *hdev, void *data,
+				  struct sk_buff *skb)
 {
-	struct hci_ev_status *rp;
+	struct hci_ev_status *rp = data;
 	struct hci_cp_write_sc_support *sent;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_WRITE_SC_SUPPORT, sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_WRITE_SC_SUPPORT);
 	if (!sent)
-		return;
+		return rp->status;
 
 	hci_dev_lock(hdev);
 
@@ -728,20 +683,19 @@ static void hci_cc_write_sc_support(struct hci_dev *hdev, struct sk_buff *skb)
 	}
 
 	hci_dev_unlock(hdev);
+
+	return rp->status;
 }
 
-static void hci_cc_read_local_version(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_read_local_version(struct hci_dev *hdev, void *data,
+				    struct sk_buff *skb)
 {
-	struct hci_rp_read_local_version *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_LOCAL_VERSION, sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_read_local_version *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	if (hci_dev_test_flag(hdev, HCI_SETUP) ||
 	    hci_dev_test_flag(hdev, HCI_CONFIG)) {
@@ -751,43 +705,37 @@ static void hci_cc_read_local_version(struct hci_dev *hdev, struct sk_buff *skb)
 		hdev->manufacturer = __le16_to_cpu(rp->manufacturer);
 		hdev->lmp_subver = __le16_to_cpu(rp->lmp_subver);
 	}
+
+	return rp->status;
 }
 
-static void hci_cc_read_local_commands(struct hci_dev *hdev,
-				       struct sk_buff *skb)
+static u8 hci_cc_read_local_commands(struct hci_dev *hdev, void *data,
+				     struct sk_buff *skb)
 {
-	struct hci_rp_read_local_commands *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_LOCAL_COMMANDS,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_read_local_commands *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	if (hci_dev_test_flag(hdev, HCI_SETUP) ||
 	    hci_dev_test_flag(hdev, HCI_CONFIG))
 		memcpy(hdev->commands, rp->commands, sizeof(hdev->commands));
+
+	return rp->status;
 }
 
-static void hci_cc_read_auth_payload_timeout(struct hci_dev *hdev,
-					     struct sk_buff *skb)
+static u8 hci_cc_read_auth_payload_timeout(struct hci_dev *hdev, void *data,
+					   struct sk_buff *skb)
 {
-	struct hci_rp_read_auth_payload_to *rp;
+	struct hci_rp_read_auth_payload_to *rp = data;
 	struct hci_conn *conn;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_AUTH_PAYLOAD_TO,
-			     sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	hci_dev_lock(hdev);
 
@@ -796,27 +744,25 @@ static void hci_cc_read_auth_payload_timeout(struct hci_dev *hdev,
 		conn->auth_payload_timeout = __le16_to_cpu(rp->timeout);
 
 	hci_dev_unlock(hdev);
+
+	return rp->status;
 }
 
-static void hci_cc_write_auth_payload_timeout(struct hci_dev *hdev,
-					      struct sk_buff *skb)
+static u8 hci_cc_write_auth_payload_timeout(struct hci_dev *hdev, void *data,
+					    struct sk_buff *skb)
 {
-	struct hci_rp_write_auth_payload_to *rp;
+	struct hci_rp_write_auth_payload_to *rp = data;
 	struct hci_conn *conn;
 	void *sent;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_WRITE_AUTH_PAYLOAD_TO, sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_WRITE_AUTH_PAYLOAD_TO);
 	if (!sent)
-		return;
+		return rp->status;
 
 	hci_dev_lock(hdev);
 
@@ -825,22 +771,19 @@ static void hci_cc_write_auth_payload_timeout(struct hci_dev *hdev,
 		conn->auth_payload_timeout = get_unaligned_le16(sent + 2);
 
 	hci_dev_unlock(hdev);
+
+	return rp->status;
 }
 
-static void hci_cc_read_local_features(struct hci_dev *hdev,
-				       struct sk_buff *skb)
+static u8 hci_cc_read_local_features(struct hci_dev *hdev, void *data,
+				     struct sk_buff *skb)
 {
-	struct hci_rp_read_local_features *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_LOCAL_FEATURES,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_read_local_features *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	memcpy(hdev->features, rp->features, 8);
 
@@ -880,60 +823,53 @@ static void hci_cc_read_local_features(struct hci_dev *hdev,
 
 	if (hdev->features[0][5] & LMP_EDR_3S_ESCO)
 		hdev->esco_type |= (ESCO_2EV5 | ESCO_3EV5);
+
+	return rp->status;
 }
 
-static void hci_cc_read_local_ext_features(struct hci_dev *hdev,
-					   struct sk_buff *skb)
+static u8 hci_cc_read_local_ext_features(struct hci_dev *hdev, void *data,
+					 struct sk_buff *skb)
 {
-	struct hci_rp_read_local_ext_features *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_LOCAL_EXT_FEATURES,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_read_local_ext_features *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	if (hdev->max_page < rp->max_page)
 		hdev->max_page = rp->max_page;
 
 	if (rp->page < HCI_MAX_PAGES)
 		memcpy(hdev->features[rp->page], rp->features, 8);
+
+	return rp->status;
 }
 
-static void hci_cc_read_flow_control_mode(struct hci_dev *hdev,
-					  struct sk_buff *skb)
+static u8 hci_cc_read_flow_control_mode(struct hci_dev *hdev, void *data,
+					struct sk_buff *skb)
 {
-	struct hci_rp_read_flow_control_mode *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_FLOW_CONTROL_MODE,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_read_flow_control_mode *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	hdev->flow_ctl_mode = rp->mode;
+
+	return rp->status;
 }
 
-static void hci_cc_read_buffer_size(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_read_buffer_size(struct hci_dev *hdev, void *data,
+				  struct sk_buff *skb)
 {
-	struct hci_rp_read_buffer_size *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_BUFFER_SIZE, sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_read_buffer_size *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	hdev->acl_mtu  = __le16_to_cpu(rp->acl_mtu);
 	hdev->sco_mtu  = rp->sco_mtu;
@@ -950,149 +886,130 @@ static void hci_cc_read_buffer_size(struct hci_dev *hdev, struct sk_buff *skb)
 
 	BT_DBG("%s acl mtu %d:%d sco mtu %d:%d", hdev->name, hdev->acl_mtu,
 	       hdev->acl_pkts, hdev->sco_mtu, hdev->sco_pkts);
+
+	return rp->status;
 }
 
-static void hci_cc_read_bd_addr(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_read_bd_addr(struct hci_dev *hdev, void *data,
+			      struct sk_buff *skb)
 {
-	struct hci_rp_read_bd_addr *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_BD_ADDR, sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_read_bd_addr *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	if (test_bit(HCI_INIT, &hdev->flags))
 		bacpy(&hdev->bdaddr, &rp->bdaddr);
 
 	if (hci_dev_test_flag(hdev, HCI_SETUP))
 		bacpy(&hdev->setup_addr, &rp->bdaddr);
+
+	return rp->status;
 }
 
-static void hci_cc_read_local_pairing_opts(struct hci_dev *hdev,
-					   struct sk_buff *skb)
+static u8 hci_cc_read_local_pairing_opts(struct hci_dev *hdev, void *data,
+					 struct sk_buff *skb)
 {
-	struct hci_rp_read_local_pairing_opts *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_LOCAL_PAIRING_OPTS,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_read_local_pairing_opts *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	if (hci_dev_test_flag(hdev, HCI_SETUP) ||
 	    hci_dev_test_flag(hdev, HCI_CONFIG)) {
 		hdev->pairing_opts = rp->pairing_opts;
 		hdev->max_enc_key_size = rp->max_key_size;
 	}
+
+	return rp->status;
 }
 
-static void hci_cc_read_page_scan_activity(struct hci_dev *hdev,
-					   struct sk_buff *skb)
+static u8 hci_cc_read_page_scan_activity(struct hci_dev *hdev, void *data,
+					 struct sk_buff *skb)
 {
-	struct hci_rp_read_page_scan_activity *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_PAGE_SCAN_ACTIVITY,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_read_page_scan_activity *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	if (test_bit(HCI_INIT, &hdev->flags)) {
 		hdev->page_scan_interval = __le16_to_cpu(rp->interval);
 		hdev->page_scan_window = __le16_to_cpu(rp->window);
 	}
+
+	return rp->status;
 }
 
-static void hci_cc_write_page_scan_activity(struct hci_dev *hdev,
-					    struct sk_buff *skb)
+static u8 hci_cc_write_page_scan_activity(struct hci_dev *hdev, void *data,
+					  struct sk_buff *skb)
 {
-	struct hci_ev_status *rp;
+	struct hci_ev_status *rp = data;
 	struct hci_cp_write_page_scan_activity *sent;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_PAGE_SCAN_ACTIVITY,
-			     sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_WRITE_PAGE_SCAN_ACTIVITY);
 	if (!sent)
-		return;
+		return rp->status;
 
 	hdev->page_scan_interval = __le16_to_cpu(sent->interval);
 	hdev->page_scan_window = __le16_to_cpu(sent->window);
+
+	return rp->status;
 }
 
-static void hci_cc_read_page_scan_type(struct hci_dev *hdev,
-					   struct sk_buff *skb)
+static u8 hci_cc_read_page_scan_type(struct hci_dev *hdev, void *data,
+				     struct sk_buff *skb)
 {
-	struct hci_rp_read_page_scan_type *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_PAGE_SCAN_TYPE,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_read_page_scan_type *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	if (test_bit(HCI_INIT, &hdev->flags))
 		hdev->page_scan_type = rp->type;
+
+	return rp->status;
 }
 
-static void hci_cc_write_page_scan_type(struct hci_dev *hdev,
-					struct sk_buff *skb)
+static u8 hci_cc_write_page_scan_type(struct hci_dev *hdev, void *data,
+				      struct sk_buff *skb)
 {
-	struct hci_ev_status *rp;
+	struct hci_ev_status *rp = data;
 	u8 *type;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_WRITE_PAGE_SCAN_TYPE,
-			     sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	type = hci_sent_cmd_data(hdev, HCI_OP_WRITE_PAGE_SCAN_TYPE);
 	if (type)
 		hdev->page_scan_type = *type;
+
+	return rp->status;
 }
 
-static void hci_cc_read_data_block_size(struct hci_dev *hdev,
-					struct sk_buff *skb)
+static u8 hci_cc_read_data_block_size(struct hci_dev *hdev, void *data,
+				      struct sk_buff *skb)
 {
-	struct hci_rp_read_data_block_size *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_DATA_BLOCK_SIZE,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_read_data_block_size *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	hdev->block_mtu = __le16_to_cpu(rp->max_acl_len);
 	hdev->block_len = __le16_to_cpu(rp->block_len);
@@ -1102,24 +1019,21 @@ static void hci_cc_read_data_block_size(struct hci_dev *hdev,
 
 	BT_DBG("%s blk mtu %d cnt %d len %d", hdev->name, hdev->block_mtu,
 	       hdev->block_cnt, hdev->block_len);
+
+	return rp->status;
 }
 
-static void hci_cc_read_clock(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_read_clock(struct hci_dev *hdev, void *data,
+			    struct sk_buff *skb)
 {
-	struct hci_rp_read_clock *rp;
+	struct hci_rp_read_clock *rp = data;
 	struct hci_cp_read_clock *cp;
 	struct hci_conn *conn;
 
-	BT_DBG("%s", hdev->name);
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_CLOCK, sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	hci_dev_lock(hdev);
 
@@ -1140,22 +1054,18 @@ static void hci_cc_read_clock(struct hci_dev *hdev, struct sk_buff *skb)
 
 unlock:
 	hci_dev_unlock(hdev);
+	return rp->status;
 }
 
-static void hci_cc_read_local_amp_info(struct hci_dev *hdev,
-				       struct sk_buff *skb)
+static u8 hci_cc_read_local_amp_info(struct hci_dev *hdev, void *data,
+				     struct sk_buff *skb)
 {
-	struct hci_rp_read_local_amp_info *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_LOCAL_AMP_INFO,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_read_local_amp_info *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	hdev->amp_status = rp->amp_status;
 	hdev->amp_total_bw = __le32_to_cpu(rp->total_bw);
@@ -1167,77 +1077,67 @@ static void hci_cc_read_local_amp_info(struct hci_dev *hdev,
 	hdev->amp_assoc_size = __le16_to_cpu(rp->max_assoc_size);
 	hdev->amp_be_flush_to = __le32_to_cpu(rp->be_flush_to);
 	hdev->amp_max_flush_to = __le32_to_cpu(rp->max_flush_to);
+
+	return rp->status;
 }
 
-static void hci_cc_read_inq_rsp_tx_power(struct hci_dev *hdev,
-					 struct sk_buff *skb)
+static u8 hci_cc_read_inq_rsp_tx_power(struct hci_dev *hdev, void *data,
+				       struct sk_buff *skb)
 {
-	struct hci_rp_read_inq_rsp_tx_power *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_INQ_RSP_TX_POWER,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_read_inq_rsp_tx_power *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	hdev->inq_tx_power = rp->tx_power;
+
+	return rp->status;
 }
 
-static void hci_cc_read_def_err_data_reporting(struct hci_dev *hdev,
-					       struct sk_buff *skb)
+static u8 hci_cc_read_def_err_data_reporting(struct hci_dev *hdev, void *data,
+					     struct sk_buff *skb)
 {
-	struct hci_rp_read_def_err_data_reporting *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_DEF_ERR_DATA_REPORTING,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_read_def_err_data_reporting *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	hdev->err_data_reporting = rp->err_data_reporting;
+
+	return rp->status;
 }
 
-static void hci_cc_write_def_err_data_reporting(struct hci_dev *hdev,
-						struct sk_buff *skb)
+static u8 hci_cc_write_def_err_data_reporting(struct hci_dev *hdev, void *data,
+					      struct sk_buff *skb)
 {
-	struct hci_ev_status *rp;
+	struct hci_ev_status *rp = data;
 	struct hci_cp_write_def_err_data_reporting *cp;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_WRITE_DEF_ERR_DATA_REPORTING,
-			     sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	cp = hci_sent_cmd_data(hdev, HCI_OP_WRITE_DEF_ERR_DATA_REPORTING);
 	if (!cp)
-		return;
+		return rp->status;
 
 	hdev->err_data_reporting = cp->err_data_reporting;
+
+	return rp->status;
 }
 
-static void hci_cc_pin_code_reply(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_pin_code_reply(struct hci_dev *hdev, void *data,
+				struct sk_buff *skb)
 {
-	struct hci_rp_pin_code_reply *rp;
+	struct hci_rp_pin_code_reply *rp = data;
 	struct hci_cp_pin_code_reply *cp;
 	struct hci_conn *conn;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_PIN_CODE_REPLY, sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	hci_dev_lock(hdev);
@@ -1258,15 +1158,13 @@ static void hci_cc_pin_code_reply(struct hci_dev *hdev, struct sk_buff *skb)
 
 unlock:
 	hci_dev_unlock(hdev);
+	return rp->status;
 }
 
-static void hci_cc_pin_code_neg_reply(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_pin_code_neg_reply(struct hci_dev *hdev, void *data,
+				    struct sk_buff *skb)
 {
-	struct hci_rp_pin_code_neg_reply *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_PIN_CODE_NEG_REPLY, sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_pin_code_neg_reply *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
@@ -1277,22 +1175,19 @@ static void hci_cc_pin_code_neg_reply(struct hci_dev *hdev, struct sk_buff *skb)
 						 rp->status);
 
 	hci_dev_unlock(hdev);
+
+	return rp->status;
 }
 
-static void hci_cc_le_read_buffer_size(struct hci_dev *hdev,
-				       struct sk_buff *skb)
+static u8 hci_cc_le_read_buffer_size(struct hci_dev *hdev, void *data,
+				     struct sk_buff *skb)
 {
-	struct hci_rp_le_read_buffer_size *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_READ_BUFFER_SIZE,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_le_read_buffer_size *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	hdev->le_mtu = __le16_to_cpu(rp->le_mtu);
 	hdev->le_pkts = rp->le_max_pkt;
@@ -1300,51 +1195,44 @@ static void hci_cc_le_read_buffer_size(struct hci_dev *hdev,
 	hdev->le_cnt = hdev->le_pkts;
 
 	BT_DBG("%s le mtu %d:%d", hdev->name, hdev->le_mtu, hdev->le_pkts);
+
+	return rp->status;
 }
 
-static void hci_cc_le_read_local_features(struct hci_dev *hdev,
-					  struct sk_buff *skb)
+static u8 hci_cc_le_read_local_features(struct hci_dev *hdev, void *data,
+					struct sk_buff *skb)
 {
-	struct hci_rp_le_read_local_features *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_READ_LOCAL_FEATURES,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_le_read_local_features *rp = data;
 
 	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	memcpy(hdev->le_features, rp->features, 8);
+
+	return rp->status;
 }
 
-static void hci_cc_le_read_adv_tx_power(struct hci_dev *hdev,
-					struct sk_buff *skb)
+static u8 hci_cc_le_read_adv_tx_power(struct hci_dev *hdev, void *data,
+				      struct sk_buff *skb)
 {
-	struct hci_rp_le_read_adv_tx_power *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_READ_ADV_TX_POWER,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_le_read_adv_tx_power *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	hdev->adv_tx_power = rp->tx_power;
+
+	return rp->status;
 }
 
-static void hci_cc_user_confirm_reply(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_user_confirm_reply(struct hci_dev *hdev, void *data,
+				    struct sk_buff *skb)
 {
-	struct hci_rp_user_confirm_reply *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_USER_CONFIRM_REPLY, sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_user_confirm_reply *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
@@ -1355,17 +1243,14 @@ static void hci_cc_user_confirm_reply(struct hci_dev *hdev, struct sk_buff *skb)
 						 rp->status);
 
 	hci_dev_unlock(hdev);
+
+	return rp->status;
 }
 
-static void hci_cc_user_confirm_neg_reply(struct hci_dev *hdev,
-					  struct sk_buff *skb)
+static u8 hci_cc_user_confirm_neg_reply(struct hci_dev *hdev, void *data,
+					struct sk_buff *skb)
 {
-	struct hci_rp_user_confirm_reply *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_USER_CONFIRM_NEG_REPLY,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_user_confirm_reply *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
@@ -1376,15 +1261,14 @@ static void hci_cc_user_confirm_neg_reply(struct hci_dev *hdev,
 						     ACL_LINK, 0, rp->status);
 
 	hci_dev_unlock(hdev);
+
+	return rp->status;
 }
 
-static void hci_cc_user_passkey_reply(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_user_passkey_reply(struct hci_dev *hdev, void *data,
+				    struct sk_buff *skb)
 {
-	struct hci_rp_user_confirm_reply *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_USER_PASSKEY_REPLY, sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_user_confirm_reply *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
@@ -1395,16 +1279,14 @@ static void hci_cc_user_passkey_reply(struct hci_dev *hdev, struct sk_buff *skb)
 						 0, rp->status);
 
 	hci_dev_unlock(hdev);
+
+	return rp->status;
 }
 
-static void hci_cc_user_passkey_neg_reply(struct hci_dev *hdev,
-					  struct sk_buff *skb)
+static u8 hci_cc_user_passkey_neg_reply(struct hci_dev *hdev, void *data,
+					struct sk_buff *skb)
 {
-	struct hci_rp_user_confirm_reply *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_USER_PASSKEY_NEG_REPLY, sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_user_confirm_reply *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
@@ -1415,49 +1297,44 @@ static void hci_cc_user_passkey_neg_reply(struct hci_dev *hdev,
 						     ACL_LINK, 0, rp->status);
 
 	hci_dev_unlock(hdev);
+
+	return rp->status;
 }
 
-static void hci_cc_read_local_oob_data(struct hci_dev *hdev,
-				       struct sk_buff *skb)
+static u8 hci_cc_read_local_oob_data(struct hci_dev *hdev, void *data,
+				     struct sk_buff *skb)
 {
-	struct hci_rp_read_local_oob_data *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_LOCAL_OOB_DATA, sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_read_local_oob_data *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	return rp->status;
 }
 
-static void hci_cc_read_local_oob_ext_data(struct hci_dev *hdev,
-					   struct sk_buff *skb)
+static u8 hci_cc_read_local_oob_ext_data(struct hci_dev *hdev, void *data,
+					 struct sk_buff *skb)
 {
-	struct hci_rp_read_local_oob_ext_data *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_LOCAL_OOB_EXT_DATA, sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_read_local_oob_ext_data *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	return rp->status;
 }
 
-static void hci_cc_le_set_random_addr(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_le_set_random_addr(struct hci_dev *hdev, void *data,
+				    struct sk_buff *skb)
 {
-	struct hci_ev_status *rp;
+	struct hci_ev_status *rp = data;
 	bdaddr_t *sent;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_SET_RANDOM_ADDR, sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_LE_SET_RANDOM_ADDR);
 	if (!sent)
-		return;
+		return rp->status;
 
 	hci_dev_lock(hdev);
 
@@ -1470,25 +1347,24 @@ static void hci_cc_le_set_random_addr(struct hci_dev *hdev, struct sk_buff *skb)
 	}
 
 	hci_dev_unlock(hdev);
+
+	return rp->status;
 }
 
-static void hci_cc_le_set_default_phy(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_le_set_default_phy(struct hci_dev *hdev, void *data,
+				    struct sk_buff *skb)
 {
-	struct hci_ev_status *rp;
+	struct hci_ev_status *rp = data;
 	struct hci_cp_le_set_default_phy *cp;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_SET_DEFAULT_PHY, sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	cp = hci_sent_cmd_data(hdev, HCI_OP_LE_SET_DEFAULT_PHY);
 	if (!cp)
-		return;
+		return rp->status;
 
 	hci_dev_lock(hdev);
 
@@ -1496,24 +1372,21 @@ static void hci_cc_le_set_default_phy(struct hci_dev *hdev, struct sk_buff *skb)
 	hdev->le_rx_def_phys = cp->rx_phys;
 
 	hci_dev_unlock(hdev);
+
+	return rp->status;
 }
 
-static void hci_cc_le_set_adv_set_random_addr(struct hci_dev *hdev,
-                                              struct sk_buff *skb)
+static u8 hci_cc_le_set_adv_set_random_addr(struct hci_dev *hdev, void *data,
+					    struct sk_buff *skb)
 {
-	struct hci_ev_status *rp;
+	struct hci_ev_status *rp = data;
 	struct hci_cp_le_set_adv_set_rand_addr *cp;
 	struct adv_info *adv;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_SET_ADV_SET_RAND_ADDR,
-			     sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	cp = hci_sent_cmd_data(hdev, HCI_OP_LE_SET_ADV_SET_RAND_ADDR);
 	/* Update only in case the adv instance since handle 0x00 shall be using
@@ -1521,7 +1394,7 @@ static void hci_cc_le_set_adv_set_random_addr(struct hci_dev *hdev,
 	 * non-extended adverting.
 	 */
 	if (!cp || !cp->handle)
-		return;
+		return rp->status;
 
 	hci_dev_lock(hdev);
 
@@ -1537,26 +1410,25 @@ static void hci_cc_le_set_adv_set_random_addr(struct hci_dev *hdev,
 	}
 
 	hci_dev_unlock(hdev);
+
+	return rp->status;
 }
 
-static void hci_cc_le_remove_adv_set(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_le_remove_adv_set(struct hci_dev *hdev, void *data,
+				   struct sk_buff *skb)
 {
-	struct hci_ev_status *rp;
+	struct hci_ev_status *rp = data;
 	u8 *instance;
 	int err;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_REMOVE_ADV_SET, sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	instance = hci_sent_cmd_data(hdev, HCI_OP_LE_REMOVE_ADV_SET);
 	if (!instance)
-		return;
+		return rp->status;
 
 	hci_dev_lock(hdev);
 
@@ -1566,25 +1438,24 @@ static void hci_cc_le_remove_adv_set(struct hci_dev *hdev, struct sk_buff *skb)
 					 *instance);
 
 	hci_dev_unlock(hdev);
+
+	return rp->status;
 }
 
-static void hci_cc_le_clear_adv_sets(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_le_clear_adv_sets(struct hci_dev *hdev, void *data,
+				   struct sk_buff *skb)
 {
-	struct hci_ev_status *rp;
+	struct hci_ev_status *rp = data;
 	struct adv_info *adv, *n;
 	int err;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_CLEAR_ADV_SETS, sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	if (!hci_sent_cmd_data(hdev, HCI_OP_LE_CLEAR_ADV_SETS))
-		return;
+		return rp->status;
 
 	hci_dev_lock(hdev);
 
@@ -1598,44 +1469,40 @@ static void hci_cc_le_clear_adv_sets(struct hci_dev *hdev, struct sk_buff *skb)
 	}
 
 	hci_dev_unlock(hdev);
+
+	return rp->status;
 }
 
-static void hci_cc_le_read_transmit_power(struct hci_dev *hdev,
-					  struct sk_buff *skb)
+static u8 hci_cc_le_read_transmit_power(struct hci_dev *hdev, void *data,
+					struct sk_buff *skb)
 {
-	struct hci_rp_le_read_transmit_power *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_READ_TRANSMIT_POWER,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_le_read_transmit_power *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	hdev->min_le_tx_power = rp->min_le_tx_power;
 	hdev->max_le_tx_power = rp->max_le_tx_power;
+
+	return rp->status;
 }
 
-static void hci_cc_le_set_adv_enable(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_le_set_adv_enable(struct hci_dev *hdev, void *data,
+				   struct sk_buff *skb)
 {
-	struct hci_ev_status *rp;
+	struct hci_ev_status *rp = data;
 	__u8 *sent;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_SET_ADV_ENABLE, sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_LE_SET_ADV_ENABLE);
 	if (!sent)
-		return;
+		return rp->status;
 
 	hci_dev_lock(hdev);
 
@@ -1657,29 +1524,26 @@ static void hci_cc_le_set_adv_enable(struct hci_dev *hdev, struct sk_buff *skb)
 	}
 
 	hci_dev_unlock(hdev);
+
+	return rp->status;
 }
 
-static void hci_cc_le_set_ext_adv_enable(struct hci_dev *hdev,
-					 struct sk_buff *skb)
+static u8 hci_cc_le_set_ext_adv_enable(struct hci_dev *hdev, void *data,
+				       struct sk_buff *skb)
 {
 	struct hci_cp_le_set_ext_adv_enable *cp;
 	struct hci_cp_ext_adv_set *set;
 	struct adv_info *adv = NULL, *n;
-	struct hci_ev_status *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_SET_EXT_ADV_ENABLE,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_ev_status *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	cp = hci_sent_cmd_data(hdev, HCI_OP_LE_SET_EXT_ADV_ENABLE);
 	if (!cp)
-		return;
+		return rp->status;
 
 	set = (void *)cp->data;
 
@@ -1726,53 +1590,48 @@ static void hci_cc_le_set_ext_adv_enable(struct hci_dev *hdev,
 
 unlock:
 	hci_dev_unlock(hdev);
+	return rp->status;
 }
 
-static void hci_cc_le_set_scan_param(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_le_set_scan_param(struct hci_dev *hdev, void *data,
+				   struct sk_buff *skb)
 {
 	struct hci_cp_le_set_scan_param *cp;
-	struct hci_ev_status *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_SET_SCAN_PARAM, sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_ev_status *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	cp = hci_sent_cmd_data(hdev, HCI_OP_LE_SET_SCAN_PARAM);
 	if (!cp)
-		return;
+		return rp->status;
 
 	hci_dev_lock(hdev);
 
 	hdev->le_scan_type = cp->type;
 
 	hci_dev_unlock(hdev);
+
+	return rp->status;
 }
 
-static void hci_cc_le_set_ext_scan_param(struct hci_dev *hdev,
-					 struct sk_buff *skb)
+static u8 hci_cc_le_set_ext_scan_param(struct hci_dev *hdev, void *data,
+				       struct sk_buff *skb)
 {
 	struct hci_cp_le_set_ext_scan_params *cp;
-	struct hci_ev_status *rp;
+	struct hci_ev_status *rp = data;
 	struct hci_cp_le_scan_phy_params *phy_param;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_SET_EXT_SCAN_PARAMS,
-			     sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	cp = hci_sent_cmd_data(hdev, HCI_OP_LE_SET_EXT_SCAN_PARAMS);
 	if (!cp)
-		return;
+		return rp->status;
 
 	phy_param = (void *)cp->data;
 
@@ -1781,6 +1640,8 @@ static void hci_cc_le_set_ext_scan_param(struct hci_dev *hdev,
 	hdev->le_scan_type = phy_param->type;
 
 	hci_dev_unlock(hdev);
+
+	return rp->status;
 }
 
 static bool has_pending_adv_report(struct hci_dev *hdev)
@@ -1866,320 +1727,273 @@ static void le_set_scan_enable_complete(struct hci_dev *hdev, u8 enable)
 	hci_dev_unlock(hdev);
 }
 
-static void hci_cc_le_set_scan_enable(struct hci_dev *hdev,
-				      struct sk_buff *skb)
+static u8 hci_cc_le_set_scan_enable(struct hci_dev *hdev, void *data,
+				    struct sk_buff *skb)
 {
 	struct hci_cp_le_set_scan_enable *cp;
-	struct hci_ev_status *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_SET_SCAN_ENABLE,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_ev_status *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	cp = hci_sent_cmd_data(hdev, HCI_OP_LE_SET_SCAN_ENABLE);
 	if (!cp)
-		return;
+		return rp->status;
 
 	le_set_scan_enable_complete(hdev, cp->enable);
+
+	return rp->status;
 }
 
-static void hci_cc_le_set_ext_scan_enable(struct hci_dev *hdev,
-				      struct sk_buff *skb)
+static u8 hci_cc_le_set_ext_scan_enable(struct hci_dev *hdev, void *data,
+					struct sk_buff *skb)
 {
 	struct hci_cp_le_set_ext_scan_enable *cp;
-	struct hci_ev_status *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_SET_EXT_SCAN_ENABLE,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_ev_status *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	cp = hci_sent_cmd_data(hdev, HCI_OP_LE_SET_EXT_SCAN_ENABLE);
 	if (!cp)
-		return;
+		return rp->status;
 
 	le_set_scan_enable_complete(hdev, cp->enable);
+
+	return rp->status;
 }
 
-static void hci_cc_le_read_num_adv_sets(struct hci_dev *hdev,
+static u8 hci_cc_le_read_num_adv_sets(struct hci_dev *hdev, void *data,
 				      struct sk_buff *skb)
 {
-	struct hci_rp_le_read_num_supported_adv_sets *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_READ_NUM_SUPPORTED_ADV_SETS,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_le_read_num_supported_adv_sets *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x No of Adv sets %u", rp->status,
 		   rp->num_of_sets);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	hdev->le_num_of_adv_sets = rp->num_of_sets;
+
+	return rp->status;
 }
 
-static void hci_cc_le_read_accept_list_size(struct hci_dev *hdev,
-					    struct sk_buff *skb)
+static u8 hci_cc_le_read_accept_list_size(struct hci_dev *hdev, void *data,
+					  struct sk_buff *skb)
 {
-	struct hci_rp_le_read_accept_list_size *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_READ_ACCEPT_LIST_SIZE,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_le_read_accept_list_size *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x size %u", rp->status, rp->size);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	hdev->le_accept_list_size = rp->size;
+
+	return rp->status;
 }
 
-static void hci_cc_le_clear_accept_list(struct hci_dev *hdev,
-					struct sk_buff *skb)
+static u8 hci_cc_le_clear_accept_list(struct hci_dev *hdev, void *data,
+				      struct sk_buff *skb)
 {
-	struct hci_ev_status *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_CLEAR_ACCEPT_LIST,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_ev_status *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	hci_bdaddr_list_clear(&hdev->le_accept_list);
+
+	return rp->status;
 }
 
-static void hci_cc_le_add_to_accept_list(struct hci_dev *hdev,
-					 struct sk_buff *skb)
+static u8 hci_cc_le_add_to_accept_list(struct hci_dev *hdev, void *data,
+				       struct sk_buff *skb)
 {
 	struct hci_cp_le_add_to_accept_list *sent;
-	struct hci_ev_status *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_ADD_TO_ACCEPT_LIST,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_ev_status *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_LE_ADD_TO_ACCEPT_LIST);
 	if (!sent)
-		return;
+		return rp->status;
 
 	hci_bdaddr_list_add(&hdev->le_accept_list, &sent->bdaddr,
 			    sent->bdaddr_type);
+
+	return rp->status;
 }
 
-static void hci_cc_le_del_from_accept_list(struct hci_dev *hdev,
-					   struct sk_buff *skb)
+static u8 hci_cc_le_del_from_accept_list(struct hci_dev *hdev, void *data,
+					 struct sk_buff *skb)
 {
 	struct hci_cp_le_del_from_accept_list *sent;
-	struct hci_ev_status *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_DEL_FROM_ACCEPT_LIST,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_ev_status *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_LE_DEL_FROM_ACCEPT_LIST);
 	if (!sent)
-		return;
+		return rp->status;
 
 	hci_bdaddr_list_del(&hdev->le_accept_list, &sent->bdaddr,
 			    sent->bdaddr_type);
+
+	return rp->status;
 }
 
-static void hci_cc_le_read_supported_states(struct hci_dev *hdev,
-					    struct sk_buff *skb)
+static u8 hci_cc_le_read_supported_states(struct hci_dev *hdev, void *data,
+					  struct sk_buff *skb)
 {
-	struct hci_rp_le_read_supported_states *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_READ_SUPPORTED_STATES,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_le_read_supported_states *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	memcpy(hdev->le_states, rp->le_states, 8);
+
+	return rp->status;
 }
 
-static void hci_cc_le_read_def_data_len(struct hci_dev *hdev,
-					struct sk_buff *skb)
+static u8 hci_cc_le_read_def_data_len(struct hci_dev *hdev, void *data,
+				      struct sk_buff *skb)
 {
-	struct hci_rp_le_read_def_data_len *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_READ_DEF_DATA_LEN,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_le_read_def_data_len *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	hdev->le_def_tx_len = le16_to_cpu(rp->tx_len);
 	hdev->le_def_tx_time = le16_to_cpu(rp->tx_time);
+
+	return rp->status;
 }
 
-static void hci_cc_le_write_def_data_len(struct hci_dev *hdev,
-					 struct sk_buff *skb)
+static u8 hci_cc_le_write_def_data_len(struct hci_dev *hdev, void *data,
+				       struct sk_buff *skb)
 {
 	struct hci_cp_le_write_def_data_len *sent;
-	struct hci_ev_status *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_WRITE_DEF_DATA_LEN,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_ev_status *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_LE_WRITE_DEF_DATA_LEN);
 	if (!sent)
-		return;
+		return rp->status;
 
 	hdev->le_def_tx_len = le16_to_cpu(sent->tx_len);
 	hdev->le_def_tx_time = le16_to_cpu(sent->tx_time);
+
+	return rp->status;
 }
 
-static void hci_cc_le_add_to_resolv_list(struct hci_dev *hdev,
-					 struct sk_buff *skb)
+static u8 hci_cc_le_add_to_resolv_list(struct hci_dev *hdev, void *data,
+				       struct sk_buff *skb)
 {
 	struct hci_cp_le_add_to_resolv_list *sent;
-	struct hci_ev_status *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_ADD_TO_RESOLV_LIST,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_ev_status *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_LE_ADD_TO_RESOLV_LIST);
 	if (!sent)
-		return;
+		return rp->status;
 
 	hci_bdaddr_list_add_with_irk(&hdev->le_resolv_list, &sent->bdaddr,
 				sent->bdaddr_type, sent->peer_irk,
 				sent->local_irk);
+
+	return rp->status;
 }
 
-static void hci_cc_le_del_from_resolv_list(struct hci_dev *hdev,
-					  struct sk_buff *skb)
+static u8 hci_cc_le_del_from_resolv_list(struct hci_dev *hdev, void *data,
+					 struct sk_buff *skb)
 {
 	struct hci_cp_le_del_from_resolv_list *sent;
-	struct hci_ev_status *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_DEL_FROM_RESOLV_LIST,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_ev_status *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_LE_DEL_FROM_RESOLV_LIST);
 	if (!sent)
-		return;
+		return rp->status;
 
 	hci_bdaddr_list_del_with_irk(&hdev->le_resolv_list, &sent->bdaddr,
 			    sent->bdaddr_type);
+
+	return rp->status;
 }
 
-static void hci_cc_le_clear_resolv_list(struct hci_dev *hdev,
-				       struct sk_buff *skb)
+static u8 hci_cc_le_clear_resolv_list(struct hci_dev *hdev, void *data,
+				      struct sk_buff *skb)
 {
-	struct hci_ev_status *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_CLEAR_RESOLV_LIST,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_ev_status *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	hci_bdaddr_list_clear(&hdev->le_resolv_list);
+
+	return rp->status;
 }
 
-static void hci_cc_le_read_resolv_list_size(struct hci_dev *hdev,
-					   struct sk_buff *skb)
+static u8 hci_cc_le_read_resolv_list_size(struct hci_dev *hdev, void *data,
+					  struct sk_buff *skb)
 {
-	struct hci_rp_le_read_resolv_list_size *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_READ_RESOLV_LIST_SIZE,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_le_read_resolv_list_size *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x size %u", rp->status, rp->size);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	hdev->le_resolv_list_size = rp->size;
+
+	return rp->status;
 }
 
-static void hci_cc_le_set_addr_resolution_enable(struct hci_dev *hdev,
-						struct sk_buff *skb)
+static u8 hci_cc_le_set_addr_resolution_enable(struct hci_dev *hdev, void *data,
+					       struct sk_buff *skb)
 {
-	struct hci_ev_status *rp;
+	struct hci_ev_status *rp = data;
 	__u8 *sent;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_SET_ADDR_RESOLV_ENABLE,
-			     sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_LE_SET_ADDR_RESOLV_ENABLE);
 	if (!sent)
-		return;
+		return rp->status;
 
 	hci_dev_lock(hdev);
 
@@ -2189,48 +2003,42 @@ static void hci_cc_le_set_addr_resolution_enable(struct hci_dev *hdev,
 		hci_dev_clear_flag(hdev, HCI_LL_RPA_RESOLUTION);
 
 	hci_dev_unlock(hdev);
+
+	return rp->status;
 }
 
-static void hci_cc_le_read_max_data_len(struct hci_dev *hdev,
-					struct sk_buff *skb)
+static u8 hci_cc_le_read_max_data_len(struct hci_dev *hdev, void *data,
+				      struct sk_buff *skb)
 {
-	struct hci_rp_le_read_max_data_len *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_READ_MAX_DATA_LEN,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_rp_le_read_max_data_len *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	hdev->le_max_tx_len = le16_to_cpu(rp->tx_len);
 	hdev->le_max_tx_time = le16_to_cpu(rp->tx_time);
 	hdev->le_max_rx_len = le16_to_cpu(rp->rx_len);
 	hdev->le_max_rx_time = le16_to_cpu(rp->rx_time);
+
+	return rp->status;
 }
 
-static void hci_cc_write_le_host_supported(struct hci_dev *hdev,
-					   struct sk_buff *skb)
+static u8 hci_cc_write_le_host_supported(struct hci_dev *hdev, void *data,
+					 struct sk_buff *skb)
 {
 	struct hci_cp_write_le_host_supported *sent;
-	struct hci_ev_status *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_WRITE_LE_HOST_SUPPORTED,
-			     sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_ev_status *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_WRITE_LE_HOST_SUPPORTED);
 	if (!sent)
-		return;
+		return rp->status;
 
 	hci_dev_lock(hdev);
 
@@ -2249,50 +2057,47 @@ static void hci_cc_write_le_host_supported(struct hci_dev *hdev,
 		hdev->features[1][0] &= ~LMP_HOST_LE_BREDR;
 
 	hci_dev_unlock(hdev);
+
+	return rp->status;
 }
 
-static void hci_cc_set_adv_param(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_set_adv_param(struct hci_dev *hdev, void *data,
+			       struct sk_buff *skb)
 {
 	struct hci_cp_le_set_adv_param *cp;
-	struct hci_ev_status *rp;
-
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_SET_ADV_PARAM, sizeof(*rp));
-	if (!rp)
-		return;
+	struct hci_ev_status *rp = data;
 
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	cp = hci_sent_cmd_data(hdev, HCI_OP_LE_SET_ADV_PARAM);
 	if (!cp)
-		return;
+		return rp->status;
 
 	hci_dev_lock(hdev);
 	hdev->adv_addr_type = cp->own_address_type;
 	hci_dev_unlock(hdev);
+
+	return rp->status;
 }
 
-static void hci_cc_set_ext_adv_param(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_set_ext_adv_param(struct hci_dev *hdev, void *data,
+				   struct sk_buff *skb)
 {
-	struct hci_rp_le_set_ext_adv_params *rp;
+	struct hci_rp_le_set_ext_adv_params *rp = data;
 	struct hci_cp_le_set_ext_adv_params *cp;
 	struct adv_info *adv_instance;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_SET_EXT_ADV_PARAMS,
-			     sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	cp = hci_sent_cmd_data(hdev, HCI_OP_LE_SET_EXT_ADV_PARAMS);
 	if (!cp)
-		return;
+		return rp->status;
 
 	hci_dev_lock(hdev);
 	hdev->adv_addr_type = cp->own_addr_type;
@@ -2308,21 +2113,20 @@ static void hci_cc_set_ext_adv_param(struct hci_dev *hdev, struct sk_buff *skb)
 	hci_req_update_adv_data(hdev, cp->handle);
 
 	hci_dev_unlock(hdev);
+
+	return rp->status;
 }
 
-static void hci_cc_read_rssi(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_read_rssi(struct hci_dev *hdev, void *data,
+			   struct sk_buff *skb)
 {
-	struct hci_rp_read_rssi *rp;
+	struct hci_rp_read_rssi *rp = data;
 	struct hci_conn *conn;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_RSSI, sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	hci_dev_lock(hdev);
 
@@ -2331,26 +2135,25 @@ static void hci_cc_read_rssi(struct hci_dev *hdev, struct sk_buff *skb)
 		conn->rssi = rp->rssi;
 
 	hci_dev_unlock(hdev);
+
+	return rp->status;
 }
 
-static void hci_cc_read_tx_power(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_read_tx_power(struct hci_dev *hdev, void *data,
+			       struct sk_buff *skb)
 {
 	struct hci_cp_read_tx_power *sent;
-	struct hci_rp_read_tx_power *rp;
+	struct hci_rp_read_tx_power *rp = data;
 	struct hci_conn *conn;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_TX_POWER, sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_READ_TX_POWER);
 	if (!sent)
-		return;
+		return rp->status;
 
 	hci_dev_lock(hdev);
 
@@ -2369,26 +2172,25 @@ static void hci_cc_read_tx_power(struct hci_dev *hdev, struct sk_buff *skb)
 
 unlock:
 	hci_dev_unlock(hdev);
+	return rp->status;
 }
 
-static void hci_cc_write_ssp_debug_mode(struct hci_dev *hdev, struct sk_buff *skb)
+static u8 hci_cc_write_ssp_debug_mode(struct hci_dev *hdev, void *data,
+				      struct sk_buff *skb)
 {
-	struct hci_ev_status *rp;
+	struct hci_ev_status *rp = data;
 	u8 *mode;
 
-	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_WRITE_SSP_DEBUG_MODE,
-			     sizeof(*rp));
-	if (!rp)
-		return;
-
 	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
-		return;
+		return rp->status;
 
 	mode = hci_sent_cmd_data(hdev, HCI_OP_WRITE_SSP_DEBUG_MODE);
 	if (mode)
 		hdev->ssp_debug_mode = *mode;
+
+	return rp->status;
 }
 
 static void hci_cs_inquiry(struct hci_dev *hdev, __u8 status)
@@ -3909,372 +3711,226 @@ static inline void handle_cmd_cnt_and_timer(struct hci_dev *hdev, u8 ncmd)
 	}
 }
 
-static void hci_cmd_complete_evt(struct hci_dev *hdev, void *data,
-				 struct sk_buff *skb, u16 *opcode, u8 *status,
-				 hci_req_complete_t *req_complete,
-				 hci_req_complete_skb_t *req_complete_skb)
-{
-	struct hci_ev_cmd_complete *ev = data;
-
-	*opcode = __le16_to_cpu(ev->opcode);
-	*status = skb->data[0];
-
-	switch (*opcode) {
-	case HCI_OP_INQUIRY_CANCEL:
-		hci_cc_inquiry_cancel(hdev, skb, status);
-		break;
-
-	case HCI_OP_PERIODIC_INQ:
-		hci_cc_periodic_inq(hdev, skb);
-		break;
-
-	case HCI_OP_EXIT_PERIODIC_INQ:
-		hci_cc_exit_periodic_inq(hdev, skb);
-		break;
-
-	case HCI_OP_REMOTE_NAME_REQ_CANCEL:
-		hci_cc_remote_name_req_cancel(hdev, skb);
-		break;
-
-	case HCI_OP_ROLE_DISCOVERY:
-		hci_cc_role_discovery(hdev, skb);
-		break;
-
-	case HCI_OP_READ_LINK_POLICY:
-		hci_cc_read_link_policy(hdev, skb);
-		break;
-
-	case HCI_OP_WRITE_LINK_POLICY:
-		hci_cc_write_link_policy(hdev, skb);
-		break;
-
-	case HCI_OP_READ_DEF_LINK_POLICY:
-		hci_cc_read_def_link_policy(hdev, skb);
-		break;
-
-	case HCI_OP_WRITE_DEF_LINK_POLICY:
-		hci_cc_write_def_link_policy(hdev, skb);
-		break;
-
-	case HCI_OP_RESET:
-		hci_cc_reset(hdev, skb);
-		break;
-
-	case HCI_OP_READ_STORED_LINK_KEY:
-		hci_cc_read_stored_link_key(hdev, skb);
-		break;
-
-	case HCI_OP_DELETE_STORED_LINK_KEY:
-		hci_cc_delete_stored_link_key(hdev, skb);
-		break;
-
-	case HCI_OP_WRITE_LOCAL_NAME:
-		hci_cc_write_local_name(hdev, skb);
-		break;
-
-	case HCI_OP_READ_LOCAL_NAME:
-		hci_cc_read_local_name(hdev, skb);
-		break;
-
-	case HCI_OP_WRITE_AUTH_ENABLE:
-		hci_cc_write_auth_enable(hdev, skb);
-		break;
-
-	case HCI_OP_WRITE_ENCRYPT_MODE:
-		hci_cc_write_encrypt_mode(hdev, skb);
-		break;
-
-	case HCI_OP_WRITE_SCAN_ENABLE:
-		hci_cc_write_scan_enable(hdev, skb);
-		break;
-
-	case HCI_OP_SET_EVENT_FLT:
-		hci_cc_set_event_filter(hdev, skb);
-		break;
-
-	case HCI_OP_READ_CLASS_OF_DEV:
-		hci_cc_read_class_of_dev(hdev, skb);
-		break;
-
-	case HCI_OP_WRITE_CLASS_OF_DEV:
-		hci_cc_write_class_of_dev(hdev, skb);
-		break;
-
-	case HCI_OP_READ_VOICE_SETTING:
-		hci_cc_read_voice_setting(hdev, skb);
-		break;
-
-	case HCI_OP_WRITE_VOICE_SETTING:
-		hci_cc_write_voice_setting(hdev, skb);
-		break;
-
-	case HCI_OP_READ_NUM_SUPPORTED_IAC:
-		hci_cc_read_num_supported_iac(hdev, skb);
-		break;
-
-	case HCI_OP_WRITE_SSP_MODE:
-		hci_cc_write_ssp_mode(hdev, skb);
-		break;
-
-	case HCI_OP_WRITE_SC_SUPPORT:
-		hci_cc_write_sc_support(hdev, skb);
-		break;
-
-	case HCI_OP_READ_AUTH_PAYLOAD_TO:
-		hci_cc_read_auth_payload_timeout(hdev, skb);
-		break;
-
-	case HCI_OP_WRITE_AUTH_PAYLOAD_TO:
-		hci_cc_write_auth_payload_timeout(hdev, skb);
-		break;
-
-	case HCI_OP_READ_LOCAL_VERSION:
-		hci_cc_read_local_version(hdev, skb);
-		break;
-
-	case HCI_OP_READ_LOCAL_COMMANDS:
-		hci_cc_read_local_commands(hdev, skb);
-		break;
-
-	case HCI_OP_READ_LOCAL_FEATURES:
-		hci_cc_read_local_features(hdev, skb);
-		break;
-
-	case HCI_OP_READ_LOCAL_EXT_FEATURES:
-		hci_cc_read_local_ext_features(hdev, skb);
-		break;
-
-	case HCI_OP_READ_BUFFER_SIZE:
-		hci_cc_read_buffer_size(hdev, skb);
-		break;
-
-	case HCI_OP_READ_BD_ADDR:
-		hci_cc_read_bd_addr(hdev, skb);
-		break;
-
-	case HCI_OP_READ_LOCAL_PAIRING_OPTS:
-		hci_cc_read_local_pairing_opts(hdev, skb);
-		break;
-
-	case HCI_OP_READ_PAGE_SCAN_ACTIVITY:
-		hci_cc_read_page_scan_activity(hdev, skb);
-		break;
-
-	case HCI_OP_WRITE_PAGE_SCAN_ACTIVITY:
-		hci_cc_write_page_scan_activity(hdev, skb);
-		break;
-
-	case HCI_OP_READ_PAGE_SCAN_TYPE:
-		hci_cc_read_page_scan_type(hdev, skb);
-		break;
-
-	case HCI_OP_WRITE_PAGE_SCAN_TYPE:
-		hci_cc_write_page_scan_type(hdev, skb);
-		break;
-
-	case HCI_OP_READ_DATA_BLOCK_SIZE:
-		hci_cc_read_data_block_size(hdev, skb);
-		break;
-
-	case HCI_OP_READ_FLOW_CONTROL_MODE:
-		hci_cc_read_flow_control_mode(hdev, skb);
-		break;
-
-	case HCI_OP_READ_LOCAL_AMP_INFO:
-		hci_cc_read_local_amp_info(hdev, skb);
-		break;
-
-	case HCI_OP_READ_CLOCK:
-		hci_cc_read_clock(hdev, skb);
-		break;
-
-	case HCI_OP_READ_INQ_RSP_TX_POWER:
-		hci_cc_read_inq_rsp_tx_power(hdev, skb);
-		break;
-
-	case HCI_OP_READ_DEF_ERR_DATA_REPORTING:
-		hci_cc_read_def_err_data_reporting(hdev, skb);
-		break;
-
-	case HCI_OP_WRITE_DEF_ERR_DATA_REPORTING:
-		hci_cc_write_def_err_data_reporting(hdev, skb);
-		break;
-
-	case HCI_OP_PIN_CODE_REPLY:
-		hci_cc_pin_code_reply(hdev, skb);
-		break;
-
-	case HCI_OP_PIN_CODE_NEG_REPLY:
-		hci_cc_pin_code_neg_reply(hdev, skb);
-		break;
-
-	case HCI_OP_READ_LOCAL_OOB_DATA:
-		hci_cc_read_local_oob_data(hdev, skb);
-		break;
-
-	case HCI_OP_READ_LOCAL_OOB_EXT_DATA:
-		hci_cc_read_local_oob_ext_data(hdev, skb);
-		break;
-
-	case HCI_OP_LE_READ_BUFFER_SIZE:
-		hci_cc_le_read_buffer_size(hdev, skb);
-		break;
-
-	case HCI_OP_LE_READ_LOCAL_FEATURES:
-		hci_cc_le_read_local_features(hdev, skb);
-		break;
-
-	case HCI_OP_LE_READ_ADV_TX_POWER:
-		hci_cc_le_read_adv_tx_power(hdev, skb);
-		break;
-
-	case HCI_OP_USER_CONFIRM_REPLY:
-		hci_cc_user_confirm_reply(hdev, skb);
-		break;
-
-	case HCI_OP_USER_CONFIRM_NEG_REPLY:
-		hci_cc_user_confirm_neg_reply(hdev, skb);
-		break;
-
-	case HCI_OP_USER_PASSKEY_REPLY:
-		hci_cc_user_passkey_reply(hdev, skb);
-		break;
-
-	case HCI_OP_USER_PASSKEY_NEG_REPLY:
-		hci_cc_user_passkey_neg_reply(hdev, skb);
-		break;
-
-	case HCI_OP_LE_SET_RANDOM_ADDR:
-		hci_cc_le_set_random_addr(hdev, skb);
-		break;
-
-	case HCI_OP_LE_SET_ADV_ENABLE:
-		hci_cc_le_set_adv_enable(hdev, skb);
-		break;
-
-	case HCI_OP_LE_SET_SCAN_PARAM:
-		hci_cc_le_set_scan_param(hdev, skb);
-		break;
-
-	case HCI_OP_LE_SET_SCAN_ENABLE:
-		hci_cc_le_set_scan_enable(hdev, skb);
-		break;
-
-	case HCI_OP_LE_READ_ACCEPT_LIST_SIZE:
-		hci_cc_le_read_accept_list_size(hdev, skb);
-		break;
-
-	case HCI_OP_LE_CLEAR_ACCEPT_LIST:
-		hci_cc_le_clear_accept_list(hdev, skb);
-		break;
-
-	case HCI_OP_LE_ADD_TO_ACCEPT_LIST:
-		hci_cc_le_add_to_accept_list(hdev, skb);
-		break;
-
-	case HCI_OP_LE_DEL_FROM_ACCEPT_LIST:
-		hci_cc_le_del_from_accept_list(hdev, skb);
-		break;
-
-	case HCI_OP_LE_READ_SUPPORTED_STATES:
-		hci_cc_le_read_supported_states(hdev, skb);
-		break;
-
-	case HCI_OP_LE_READ_DEF_DATA_LEN:
-		hci_cc_le_read_def_data_len(hdev, skb);
-		break;
-
-	case HCI_OP_LE_WRITE_DEF_DATA_LEN:
-		hci_cc_le_write_def_data_len(hdev, skb);
-		break;
-
-	case HCI_OP_LE_ADD_TO_RESOLV_LIST:
-		hci_cc_le_add_to_resolv_list(hdev, skb);
-		break;
-
-	case HCI_OP_LE_DEL_FROM_RESOLV_LIST:
-		hci_cc_le_del_from_resolv_list(hdev, skb);
-		break;
-
-	case HCI_OP_LE_CLEAR_RESOLV_LIST:
-		hci_cc_le_clear_resolv_list(hdev, skb);
-		break;
-
-	case HCI_OP_LE_READ_RESOLV_LIST_SIZE:
-		hci_cc_le_read_resolv_list_size(hdev, skb);
-		break;
-
-	case HCI_OP_LE_SET_ADDR_RESOLV_ENABLE:
-		hci_cc_le_set_addr_resolution_enable(hdev, skb);
-		break;
-
-	case HCI_OP_LE_READ_MAX_DATA_LEN:
-		hci_cc_le_read_max_data_len(hdev, skb);
-		break;
-
-	case HCI_OP_WRITE_LE_HOST_SUPPORTED:
-		hci_cc_write_le_host_supported(hdev, skb);
-		break;
-
-	case HCI_OP_LE_SET_ADV_PARAM:
-		hci_cc_set_adv_param(hdev, skb);
-		break;
-
-	case HCI_OP_READ_RSSI:
-		hci_cc_read_rssi(hdev, skb);
-		break;
-
-	case HCI_OP_READ_TX_POWER:
-		hci_cc_read_tx_power(hdev, skb);
-		break;
+#define HCI_CC_VL(_op, _func, _min, _max) \
+{ \
+	.op = _op, \
+	.func = _func, \
+	.min_len = _min, \
+	.max_len = _max, \
+}
 
-	case HCI_OP_WRITE_SSP_DEBUG_MODE:
-		hci_cc_write_ssp_debug_mode(hdev, skb);
-		break;
+#define HCI_CC(_op, _func, _len) \
+	HCI_CC_VL(_op, _func, _len, _len)
 
-	case HCI_OP_LE_SET_EXT_SCAN_PARAMS:
-		hci_cc_le_set_ext_scan_param(hdev, skb);
-		break;
+#define HCI_CC_STATUS(_op, _func) \
+	HCI_CC(_op, _func, sizeof(struct hci_ev_status))
 
-	case HCI_OP_LE_SET_EXT_SCAN_ENABLE:
-		hci_cc_le_set_ext_scan_enable(hdev, skb);
-		break;
+static const struct hci_cc {
+	u16  op;
+	u8 (*func)(struct hci_dev *hdev, void *data, struct sk_buff *skb);
+	u16  min_len;
+	u16  max_len;
+} hci_cc_table[] = {
+	HCI_CC_STATUS(HCI_OP_INQUIRY_CANCEL, hci_cc_inquiry_cancel),
+	HCI_CC_STATUS(HCI_OP_PERIODIC_INQ, hci_cc_periodic_inq),
+	HCI_CC_STATUS(HCI_OP_EXIT_PERIODIC_INQ, hci_cc_exit_periodic_inq),
+	HCI_CC_STATUS(HCI_OP_REMOTE_NAME_REQ_CANCEL,
+		      hci_cc_remote_name_req_cancel),
+	HCI_CC(HCI_OP_ROLE_DISCOVERY, hci_cc_role_discovery,
+	       sizeof(struct hci_rp_role_discovery)),
+	HCI_CC(HCI_OP_READ_LINK_POLICY, hci_cc_read_link_policy,
+	       sizeof(struct hci_rp_read_link_policy)),
+	HCI_CC(HCI_OP_WRITE_LINK_POLICY, hci_cc_write_link_policy,
+	       sizeof(struct hci_rp_write_link_policy)),
+	HCI_CC(HCI_OP_READ_DEF_LINK_POLICY, hci_cc_read_def_link_policy,
+	       sizeof(struct hci_rp_read_def_link_policy)),
+	HCI_CC_STATUS(HCI_OP_WRITE_DEF_LINK_POLICY,
+		      hci_cc_write_def_link_policy),
+	HCI_CC_STATUS(HCI_OP_RESET, hci_cc_reset),
+	HCI_CC(HCI_OP_READ_STORED_LINK_KEY, hci_cc_read_stored_link_key,
+	       sizeof(struct hci_rp_read_stored_link_key)),
+	HCI_CC(HCI_OP_DELETE_STORED_LINK_KEY, hci_cc_delete_stored_link_key,
+	       sizeof(struct hci_rp_delete_stored_link_key)),
+	HCI_CC_STATUS(HCI_OP_WRITE_LOCAL_NAME, hci_cc_write_local_name),
+	HCI_CC(HCI_OP_READ_LOCAL_NAME, hci_cc_read_local_name,
+	       sizeof(struct hci_rp_read_local_name)),
+	HCI_CC_STATUS(HCI_OP_WRITE_AUTH_ENABLE, hci_cc_write_auth_enable),
+	HCI_CC_STATUS(HCI_OP_WRITE_ENCRYPT_MODE, hci_cc_write_encrypt_mode),
+	HCI_CC_STATUS(HCI_OP_WRITE_SCAN_ENABLE, hci_cc_write_scan_enable),
+	HCI_CC_STATUS(HCI_OP_SET_EVENT_FLT, hci_cc_set_event_filter),
+	HCI_CC(HCI_OP_READ_CLASS_OF_DEV, hci_cc_read_class_of_dev,
+	       sizeof(struct hci_rp_read_class_of_dev)),
+	HCI_CC_STATUS(HCI_OP_WRITE_CLASS_OF_DEV, hci_cc_write_class_of_dev),
+	HCI_CC(HCI_OP_READ_VOICE_SETTING, hci_cc_read_voice_setting,
+	       sizeof(struct hci_rp_read_voice_setting)),
+	HCI_CC_STATUS(HCI_OP_WRITE_VOICE_SETTING, hci_cc_write_voice_setting),
+	HCI_CC(HCI_OP_READ_NUM_SUPPORTED_IAC, hci_cc_read_num_supported_iac,
+	       sizeof(struct hci_rp_read_num_supported_iac)),
+	HCI_CC_STATUS(HCI_OP_WRITE_SSP_MODE, hci_cc_write_ssp_mode),
+	HCI_CC_STATUS(HCI_OP_WRITE_SC_SUPPORT, hci_cc_write_sc_support),
+	HCI_CC(HCI_OP_READ_AUTH_PAYLOAD_TO, hci_cc_read_auth_payload_timeout,
+	       sizeof(struct hci_rp_read_auth_payload_to)),
+	HCI_CC(HCI_OP_WRITE_AUTH_PAYLOAD_TO, hci_cc_write_auth_payload_timeout,
+	       sizeof(struct hci_rp_write_auth_payload_to)),
+	HCI_CC(HCI_OP_READ_LOCAL_VERSION, hci_cc_read_local_version,
+	       sizeof(struct hci_rp_read_local_version)),
+	HCI_CC(HCI_OP_READ_LOCAL_COMMANDS, hci_cc_read_local_commands,
+	       sizeof(struct hci_rp_read_local_commands)),
+	HCI_CC(HCI_OP_READ_LOCAL_FEATURES, hci_cc_read_local_features,
+	       sizeof(struct hci_rp_read_local_features)),
+	HCI_CC(HCI_OP_READ_LOCAL_EXT_FEATURES, hci_cc_read_local_ext_features,
+	       sizeof(struct hci_rp_read_local_ext_features)),
+	HCI_CC(HCI_OP_READ_BUFFER_SIZE, hci_cc_read_buffer_size,
+	       sizeof(struct hci_rp_read_buffer_size)),
+	HCI_CC(HCI_OP_READ_BD_ADDR, hci_cc_read_bd_addr,
+	       sizeof(struct hci_rp_read_bd_addr)),
+	HCI_CC(HCI_OP_READ_LOCAL_PAIRING_OPTS, hci_cc_read_local_pairing_opts,
+	       sizeof(struct hci_rp_read_local_pairing_opts)),
+	HCI_CC(HCI_OP_READ_PAGE_SCAN_ACTIVITY, hci_cc_read_page_scan_activity,
+	       sizeof(struct hci_rp_read_page_scan_activity)),
+	HCI_CC_STATUS(HCI_OP_WRITE_PAGE_SCAN_ACTIVITY,
+		      hci_cc_write_page_scan_activity),
+	HCI_CC(HCI_OP_READ_PAGE_SCAN_TYPE, hci_cc_read_page_scan_type,
+	       sizeof(struct hci_rp_read_page_scan_type)),
+	HCI_CC_STATUS(HCI_OP_WRITE_PAGE_SCAN_TYPE, hci_cc_write_page_scan_type),
+	HCI_CC(HCI_OP_READ_DATA_BLOCK_SIZE, hci_cc_read_data_block_size,
+	       sizeof(struct hci_rp_read_data_block_size)),
+	HCI_CC(HCI_OP_READ_FLOW_CONTROL_MODE, hci_cc_read_flow_control_mode,
+	       sizeof(struct hci_rp_read_flow_control_mode)),
+	HCI_CC(HCI_OP_READ_LOCAL_AMP_INFO, hci_cc_read_local_amp_info,
+	       sizeof(struct hci_rp_read_local_amp_info)),
+	HCI_CC(HCI_OP_READ_CLOCK, hci_cc_read_clock,
+	       sizeof(struct hci_rp_read_clock)),
+	HCI_CC(HCI_OP_READ_INQ_RSP_TX_POWER, hci_cc_read_inq_rsp_tx_power,
+	       sizeof(struct hci_rp_read_inq_rsp_tx_power)),
+	HCI_CC(HCI_OP_READ_DEF_ERR_DATA_REPORTING,
+	       hci_cc_read_def_err_data_reporting,
+	       sizeof(struct hci_rp_read_def_err_data_reporting)),
+	HCI_CC_STATUS(HCI_OP_WRITE_DEF_ERR_DATA_REPORTING,
+		      hci_cc_write_def_err_data_reporting),
+	HCI_CC(HCI_OP_PIN_CODE_REPLY, hci_cc_pin_code_reply,
+	       sizeof(struct hci_rp_pin_code_reply)),
+	HCI_CC(HCI_OP_PIN_CODE_NEG_REPLY, hci_cc_pin_code_neg_reply,
+	       sizeof(struct hci_rp_pin_code_neg_reply)),
+	HCI_CC(HCI_OP_READ_LOCAL_OOB_DATA, hci_cc_read_local_oob_data,
+	       sizeof(struct hci_rp_read_local_oob_data)),
+	HCI_CC(HCI_OP_READ_LOCAL_OOB_EXT_DATA, hci_cc_read_local_oob_ext_data,
+	       sizeof(struct hci_rp_read_local_oob_ext_data)),
+	HCI_CC(HCI_OP_LE_READ_BUFFER_SIZE, hci_cc_le_read_buffer_size,
+	       sizeof(struct hci_rp_le_read_buffer_size)),
+	HCI_CC(HCI_OP_LE_READ_LOCAL_FEATURES, hci_cc_le_read_local_features,
+	       sizeof(struct hci_rp_le_read_local_features)),
+	HCI_CC(HCI_OP_LE_READ_ADV_TX_POWER, hci_cc_le_read_adv_tx_power,
+	       sizeof(struct hci_rp_le_read_adv_tx_power)),
+	HCI_CC(HCI_OP_USER_CONFIRM_REPLY, hci_cc_user_confirm_reply,
+	       sizeof(struct hci_rp_user_confirm_reply)),
+	HCI_CC(HCI_OP_USER_CONFIRM_NEG_REPLY, hci_cc_user_confirm_neg_reply,
+	       sizeof(struct hci_rp_user_confirm_reply)),
+	HCI_CC(HCI_OP_USER_PASSKEY_REPLY, hci_cc_user_passkey_reply,
+	       sizeof(struct hci_rp_user_confirm_reply)),
+	HCI_CC(HCI_OP_USER_PASSKEY_NEG_REPLY, hci_cc_user_passkey_neg_reply,
+	       sizeof(struct hci_rp_user_confirm_reply)),
+	HCI_CC_STATUS(HCI_OP_LE_SET_RANDOM_ADDR, hci_cc_le_set_random_addr),
+	HCI_CC_STATUS(HCI_OP_LE_SET_ADV_ENABLE, hci_cc_le_set_adv_enable),
+	HCI_CC_STATUS(HCI_OP_LE_SET_SCAN_PARAM, hci_cc_le_set_scan_param),
+	HCI_CC_STATUS(HCI_OP_LE_SET_SCAN_ENABLE, hci_cc_le_set_scan_enable),
+	HCI_CC(HCI_OP_LE_READ_ACCEPT_LIST_SIZE,
+	       hci_cc_le_read_accept_list_size,
+	       sizeof(struct hci_rp_le_read_accept_list_size)),
+	HCI_CC_STATUS(HCI_OP_LE_CLEAR_ACCEPT_LIST, hci_cc_le_clear_accept_list),
+	HCI_CC_STATUS(HCI_OP_LE_ADD_TO_ACCEPT_LIST,
+		      hci_cc_le_add_to_accept_list),
+	HCI_CC_STATUS(HCI_OP_LE_DEL_FROM_ACCEPT_LIST,
+		      hci_cc_le_del_from_accept_list),
+	HCI_CC(HCI_OP_LE_READ_SUPPORTED_STATES, hci_cc_le_read_supported_states,
+	       sizeof(struct hci_rp_le_read_supported_states)),
+	HCI_CC(HCI_OP_LE_READ_DEF_DATA_LEN, hci_cc_le_read_def_data_len,
+	       sizeof(struct hci_rp_le_read_def_data_len)),
+	HCI_CC_STATUS(HCI_OP_LE_WRITE_DEF_DATA_LEN,
+		      hci_cc_le_write_def_data_len),
+	HCI_CC_STATUS(HCI_OP_LE_ADD_TO_RESOLV_LIST,
+		      hci_cc_le_add_to_resolv_list),
+	HCI_CC_STATUS(HCI_OP_LE_DEL_FROM_RESOLV_LIST,
+		      hci_cc_le_del_from_resolv_list),
+	HCI_CC_STATUS(HCI_OP_LE_CLEAR_RESOLV_LIST,
+		      hci_cc_le_clear_resolv_list),
+	HCI_CC(HCI_OP_LE_READ_RESOLV_LIST_SIZE, hci_cc_le_read_resolv_list_size,
+	       sizeof(struct hci_rp_le_read_resolv_list_size)),
+	HCI_CC_STATUS(HCI_OP_LE_SET_ADDR_RESOLV_ENABLE,
+		      hci_cc_le_set_addr_resolution_enable),
+	HCI_CC(HCI_OP_LE_READ_MAX_DATA_LEN, hci_cc_le_read_max_data_len,
+	       sizeof(struct hci_rp_le_read_max_data_len)),
+	HCI_CC_STATUS(HCI_OP_WRITE_LE_HOST_SUPPORTED,
+		      hci_cc_write_le_host_supported),
+	HCI_CC_STATUS(HCI_OP_LE_SET_ADV_PARAM, hci_cc_set_adv_param),
+	HCI_CC(HCI_OP_READ_RSSI, hci_cc_read_rssi,
+	       sizeof(struct hci_rp_read_rssi)),
+	HCI_CC(HCI_OP_READ_TX_POWER, hci_cc_read_tx_power,
+	       sizeof(struct hci_rp_read_tx_power)),
+	HCI_CC_STATUS(HCI_OP_WRITE_SSP_DEBUG_MODE, hci_cc_write_ssp_debug_mode),
+	HCI_CC_STATUS(HCI_OP_LE_SET_EXT_SCAN_PARAMS,
+		      hci_cc_le_set_ext_scan_param),
+	HCI_CC_STATUS(HCI_OP_LE_SET_EXT_SCAN_ENABLE,
+		      hci_cc_le_set_ext_scan_enable),
+	HCI_CC_STATUS(HCI_OP_LE_SET_DEFAULT_PHY, hci_cc_le_set_default_phy),
+	HCI_CC(HCI_OP_LE_READ_NUM_SUPPORTED_ADV_SETS,
+	       hci_cc_le_read_num_adv_sets,
+	       sizeof(struct hci_rp_le_read_num_supported_adv_sets)),
+	HCI_CC(HCI_OP_LE_SET_EXT_ADV_PARAMS, hci_cc_set_ext_adv_param,
+	       sizeof(struct hci_rp_le_set_ext_adv_params)),
+	HCI_CC_STATUS(HCI_OP_LE_SET_EXT_ADV_ENABLE,
+		      hci_cc_le_set_ext_adv_enable),
+	HCI_CC_STATUS(HCI_OP_LE_SET_ADV_SET_RAND_ADDR,
+		      hci_cc_le_set_adv_set_random_addr),
+	HCI_CC_STATUS(HCI_OP_LE_REMOVE_ADV_SET, hci_cc_le_remove_adv_set),
+	HCI_CC_STATUS(HCI_OP_LE_CLEAR_ADV_SETS, hci_cc_le_clear_adv_sets),
+	HCI_CC(HCI_OP_LE_READ_TRANSMIT_POWER, hci_cc_le_read_transmit_power,
+	       sizeof(struct hci_rp_le_read_transmit_power))
+};
 
-	case HCI_OP_LE_SET_DEFAULT_PHY:
-		hci_cc_le_set_default_phy(hdev, skb);
-		break;
+static u8 hci_cc_func(struct hci_dev *hdev, const struct hci_cc *cc,
+		      struct sk_buff *skb)
+{
+	void *data;
 
-	case HCI_OP_LE_READ_NUM_SUPPORTED_ADV_SETS:
-		hci_cc_le_read_num_adv_sets(hdev, skb);
-		break;
+	if (skb->len < cc->min_len) {
+		bt_dev_err(hdev, "unexpected cc 0x%4.4x length: %u < %u",
+			   cc->op, skb->len, cc->min_len);
+		return HCI_ERROR_UNSPECIFIED;
+	}
 
-	case HCI_OP_LE_SET_EXT_ADV_PARAMS:
-		hci_cc_set_ext_adv_param(hdev, skb);
-		break;
+	/* Just warn if the length is over max_len size it still be possible to
+	 * partially parse the cc so leave to callback to decide if that is
+	 * acceptable.
+	 */
+	if (skb->len > cc->max_len)
+		bt_dev_warn(hdev, "unexpected cc 0x%4.4x length: %u > %u",
+			    cc->op, skb->len, cc->max_len);
 
-	case HCI_OP_LE_SET_EXT_ADV_ENABLE:
-		hci_cc_le_set_ext_adv_enable(hdev, skb);
-		break;
+	data = hci_cc_skb_pull(hdev, skb, cc->op, cc->min_len);
+	if (!data)
+		return HCI_ERROR_UNSPECIFIED;
 
-	case HCI_OP_LE_SET_ADV_SET_RAND_ADDR:
-		hci_cc_le_set_adv_set_random_addr(hdev, skb);
-		break;
+	return cc->func(hdev, data, skb);
+}
 
-	case HCI_OP_LE_REMOVE_ADV_SET:
-		hci_cc_le_remove_adv_set(hdev, skb);
-		break;
+static void hci_cmd_complete_evt(struct hci_dev *hdev, void *data,
+				 struct sk_buff *skb, u16 *opcode, u8 *status,
+				 hci_req_complete_t *req_complete,
+				 hci_req_complete_skb_t *req_complete_skb)
+{
+	struct hci_ev_cmd_complete *ev = data;
+	int i;
 
-	case HCI_OP_LE_CLEAR_ADV_SETS:
-		hci_cc_le_clear_adv_sets(hdev, skb);
-		break;
+	*opcode = __le16_to_cpu(ev->opcode);
 
-	case HCI_OP_LE_READ_TRANSMIT_POWER:
-		hci_cc_le_read_transmit_power(hdev, skb);
-		break;
+	bt_dev_dbg(hdev, "opcode 0x%4.4x", *opcode);
 
-	default:
-		BT_DBG("%s opcode 0x%4.4x", hdev->name, *opcode);
-		break;
+	for (i = 0; i < ARRAY_SIZE(hci_cc_table); i++) {
+		if (hci_cc_table[i].op == *opcode) {
+			*status = hci_cc_func(hdev, &hci_cc_table[i], skb);
+			break;
+		}
 	}
 
 	handle_cmd_cnt_and_timer(hdev, ev->ncmd);
-- 
2.33.1

