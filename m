Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 062CF4643C0
	for <lists+linux-bluetooth@lfdr.de>; Wed,  1 Dec 2021 01:03:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345587AbhLAAG3 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 30 Nov 2021 19:06:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345521AbhLAAGW (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 30 Nov 2021 19:06:22 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 456A3C061748;
        Tue, 30 Nov 2021 16:03:02 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id x7so16606819pjn.0;
        Tue, 30 Nov 2021 16:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uPOJ6g8lTG95Y+Z46Oq6oJf/fMR/nONJgH+NY07iJEw=;
        b=p086EjjY3pw7yRrQhCzjcjzv1D6gkp8lkrqHuHItO7rgYUoE2+VbnxPMAcflgwUq99
         OoJBm4MFp90VheLIj1wvFWLLSRtOSex2tO483DqP6lmUEUGByOwkZH1gRpCKytye/jAj
         wRgJJKbVS9b4KhNwz1HGQPAX+D0jhN4B+0O0+EAitV8ZD6o0DZKb5l9ktyPxEBp3JCCr
         s4Zmd0ibmuo404yFKH3DhmHcSfxKR0MuT/CpBzr9Xgtp/aRCOmCCxOTHlJaRutvh7q3u
         98JjhULRcDWLmJpAHpv+U14ddfLFytZjzIRtlnpBFjrsaokQ4gHTikT3x5KY5lx+8Sq4
         cqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uPOJ6g8lTG95Y+Z46Oq6oJf/fMR/nONJgH+NY07iJEw=;
        b=PeepoxRUkJ7Pnc7aS+cvHMldphvHss5N3XL1XqgTh0kUySjcSo7kOnPHIpxcOuf9bz
         MgCyURV3601i3nQ7wBcJsPh9FoSGTEjCDUUrqafVx10WnKeW4bzLcwBib3t9cq60xTE/
         NmgD9VoRY7ry3Q2vRZovMZnRuyAOAXJs8IFXHSRktBKC239uS/K7Gtmc6U1xsQkGMnMF
         WswkK3piRQ3mEPkmbRwvBPMY2HTcQVis11v/Qq22E9/fsiTomM3d06FUROisBLaTvku8
         29P1ry7AF1wPYlBtT9MxtpVmjx2cGtL/5HqwZixUzR+FIRlxAFohnWO08ORqdp6E063h
         Ms1w==
X-Gm-Message-State: AOAM532j2mOAolxeVagXcvgWZ4RW/2tUBrVURNgkQwD6SXWi6/SLA4V3
        VYxvreSYt80IjyeX15JxCvo=
X-Google-Smtp-Source: ABdhPJwHuJGFUHmvEv7hE9pgvDh/1Le8Y4iIaPb8be7nY0xCKZq7ZATWX3WvGFbRnXiCztZBfTBI6g==
X-Received: by 2002:a17:90a:e613:: with SMTP id j19mr2961054pjy.182.1638316981501;
        Tue, 30 Nov 2021 16:03:01 -0800 (PST)
Received: from lvondent-mobl4.intel.com (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id j13sm21001739pfc.151.2021.11.30.16.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 16:03:01 -0800 (PST)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        dan.carpenter@oracle.com,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: [PATCH 03/15] Bluetooth: HCI: Use skb_pull_data to parse Command Complete event
Date:   Tue, 30 Nov 2021 16:02:03 -0800
Message-Id: <20211201000215.1134831-4-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211201000215.1134831-1-luiz.dentz@gmail.com>
References: <20211201000215.1134831-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This uses skb_pull_data to check the Command Complete events received
have the minimum required length.

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 net/bluetooth/hci_event.c | 904 ++++++++++++++++++++++++++++----------
 1 file changed, 663 insertions(+), 241 deletions(-)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 0266eab8a18c..09d7d997c4b1 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -57,12 +57,28 @@ static void *hci_ev_skb_pull(struct hci_dev *hdev, struct sk_buff *skb,
 	return data;
 }
 
+static void *hci_cc_skb_pull(struct hci_dev *hdev, struct sk_buff *skb,
+			     u16 op, size_t len)
+{
+	void *data;
+
+	data = skb_pull_data(skb, len);
+	if (!data)
+		bt_dev_err(hdev, "Malformed Command Complete: 0x%4.4x", op);
+
+	return data;
+}
+
 static void hci_cc_inquiry_cancel(struct hci_dev *hdev, struct sk_buff *skb,
 				  u8 *new_status)
 {
-	__u8 status = *((__u8 *) skb->data);
+	struct hci_ev_status *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_INQUIRY_CANCEL, sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	/* It is possible that we receive Inquiry Complete event right
 	 * before we receive Inquiry Cancel Command Complete event, in
@@ -71,14 +87,14 @@ static void hci_cc_inquiry_cancel(struct hci_dev *hdev, struct sk_buff *skb,
 	 * we actually achieve what Inquiry Cancel wants to achieve,
 	 * which is to end the last Inquiry session.
 	 */
-	if (status == 0x0c && !test_bit(HCI_INQUIRY, &hdev->flags)) {
+	if (rp->status == 0x0c && !test_bit(HCI_INQUIRY, &hdev->flags)) {
 		bt_dev_warn(hdev, "Ignoring error of Inquiry Cancel command");
-		status = 0x00;
+		rp->status = 0x00;
 	}
 
-	*new_status = status;
+	*new_status = rp->status;
 
-	if (status)
+	if (rp->status)
 		return;
 
 	clear_bit(HCI_INQUIRY, &hdev->flags);
@@ -99,11 +115,15 @@ static void hci_cc_inquiry_cancel(struct hci_dev *hdev, struct sk_buff *skb,
 
 static void hci_cc_periodic_inq(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	__u8 status = *((__u8 *) skb->data);
+	struct hci_ev_status *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_PERIODIC_INQ, sizeof(*rp));
+	if (!rp)
+		return;
 
-	if (status)
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
 		return;
 
 	hci_dev_set_flag(hdev, HCI_PERIODIC_INQ);
@@ -111,11 +131,15 @@ static void hci_cc_periodic_inq(struct hci_dev *hdev, struct sk_buff *skb)
 
 static void hci_cc_exit_periodic_inq(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	__u8 status = *((__u8 *) skb->data);
+	struct hci_ev_status *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_EXIT_PERIODIC_INQ, sizeof(*rp));
+	if (!rp)
+		return;
 
-	if (status)
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
 		return;
 
 	hci_dev_clear_flag(hdev, HCI_PERIODIC_INQ);
@@ -126,15 +150,26 @@ static void hci_cc_exit_periodic_inq(struct hci_dev *hdev, struct sk_buff *skb)
 static void hci_cc_remote_name_req_cancel(struct hci_dev *hdev,
 					  struct sk_buff *skb)
 {
-	BT_DBG("%s", hdev->name);
+	struct hci_ev_status *rp;
+
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_REMOTE_NAME_REQ_CANCEL,
+			     sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 }
 
 static void hci_cc_role_discovery(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	struct hci_rp_role_discovery *rp = (void *) skb->data;
+	struct hci_rp_role_discovery *rp;
 	struct hci_conn *conn;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_ROLE_DISCOVERY, sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
@@ -150,10 +185,14 @@ static void hci_cc_role_discovery(struct hci_dev *hdev, struct sk_buff *skb)
 
 static void hci_cc_read_link_policy(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	struct hci_rp_read_link_policy *rp = (void *) skb->data;
+	struct hci_rp_read_link_policy *rp;
 	struct hci_conn *conn;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_LINK_POLICY, sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
@@ -169,11 +208,15 @@ static void hci_cc_read_link_policy(struct hci_dev *hdev, struct sk_buff *skb)
 
 static void hci_cc_write_link_policy(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	struct hci_rp_write_link_policy *rp = (void *) skb->data;
+	struct hci_rp_write_link_policy *rp;
 	struct hci_conn *conn;
 	void *sent;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_WRITE_LINK_POLICY, sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
@@ -194,9 +237,14 @@ static void hci_cc_write_link_policy(struct hci_dev *hdev, struct sk_buff *skb)
 static void hci_cc_read_def_link_policy(struct hci_dev *hdev,
 					struct sk_buff *skb)
 {
-	struct hci_rp_read_def_link_policy *rp = (void *) skb->data;
+	struct hci_rp_read_def_link_policy *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_DEF_LINK_POLICY,
+			     sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
@@ -207,12 +255,17 @@ static void hci_cc_read_def_link_policy(struct hci_dev *hdev,
 static void hci_cc_write_def_link_policy(struct hci_dev *hdev,
 					 struct sk_buff *skb)
 {
-	__u8 status = *((__u8 *) skb->data);
+	struct hci_ev_status *rp;
 	void *sent;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_WRITE_DEF_LINK_POLICY,
+			     sizeof(*rp));
+	if (!rp)
+		return;
 
-	if (status)
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
 		return;
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_WRITE_DEF_LINK_POLICY);
@@ -224,13 +277,17 @@ static void hci_cc_write_def_link_policy(struct hci_dev *hdev,
 
 static void hci_cc_reset(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	__u8 status = *((__u8 *) skb->data);
+	struct hci_ev_status *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_RESET, sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	clear_bit(HCI_RESET, &hdev->flags);
 
-	if (status)
+	if (rp->status)
 		return;
 
 	/* Reset all non-persistent flags */
@@ -258,10 +315,15 @@ static void hci_cc_reset(struct hci_dev *hdev, struct sk_buff *skb)
 static void hci_cc_read_stored_link_key(struct hci_dev *hdev,
 					struct sk_buff *skb)
 {
-	struct hci_rp_read_stored_link_key *rp = (void *)skb->data;
+	struct hci_rp_read_stored_link_key *rp;
 	struct hci_cp_read_stored_link_key *sent;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_STORED_LINK_KEY,
+			     sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_READ_STORED_LINK_KEY);
 	if (!sent)
@@ -276,9 +338,14 @@ static void hci_cc_read_stored_link_key(struct hci_dev *hdev,
 static void hci_cc_delete_stored_link_key(struct hci_dev *hdev,
 					  struct sk_buff *skb)
 {
-	struct hci_rp_delete_stored_link_key *rp = (void *)skb->data;
+	struct hci_rp_delete_stored_link_key *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_DELETE_STORED_LINK_KEY,
+			     sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
@@ -291,10 +358,14 @@ static void hci_cc_delete_stored_link_key(struct hci_dev *hdev,
 
 static void hci_cc_write_local_name(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	__u8 status = *((__u8 *) skb->data);
+	struct hci_ev_status *rp;
 	void *sent;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_WRITE_LOCAL_NAME, sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_WRITE_LOCAL_NAME);
 	if (!sent)
@@ -303,8 +374,8 @@ static void hci_cc_write_local_name(struct hci_dev *hdev, struct sk_buff *skb)
 	hci_dev_lock(hdev);
 
 	if (hci_dev_test_flag(hdev, HCI_MGMT))
-		mgmt_set_local_name_complete(hdev, sent, status);
-	else if (!status)
+		mgmt_set_local_name_complete(hdev, sent, rp->status);
+	else if (!rp->status)
 		memcpy(hdev->dev_name, sent, HCI_MAX_NAME_LENGTH);
 
 	hci_dev_unlock(hdev);
@@ -312,9 +383,13 @@ static void hci_cc_write_local_name(struct hci_dev *hdev, struct sk_buff *skb)
 
 static void hci_cc_read_local_name(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	struct hci_rp_read_local_name *rp = (void *) skb->data;
+	struct hci_rp_read_local_name *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_LOCAL_NAME, sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
@@ -326,10 +401,14 @@ static void hci_cc_read_local_name(struct hci_dev *hdev, struct sk_buff *skb)
 
 static void hci_cc_write_auth_enable(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	__u8 status = *((__u8 *) skb->data);
+	struct hci_ev_status *rp;
 	void *sent;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_WRITE_AUTH_ENABLE, sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_WRITE_AUTH_ENABLE);
 	if (!sent)
@@ -337,7 +416,7 @@ static void hci_cc_write_auth_enable(struct hci_dev *hdev, struct sk_buff *skb)
 
 	hci_dev_lock(hdev);
 
-	if (!status) {
+	if (!rp->status) {
 		__u8 param = *((__u8 *) sent);
 
 		if (param == AUTH_ENABLED)
@@ -347,20 +426,24 @@ static void hci_cc_write_auth_enable(struct hci_dev *hdev, struct sk_buff *skb)
 	}
 
 	if (hci_dev_test_flag(hdev, HCI_MGMT))
-		mgmt_auth_enable_complete(hdev, status);
+		mgmt_auth_enable_complete(hdev, rp->status);
 
 	hci_dev_unlock(hdev);
 }
 
 static void hci_cc_write_encrypt_mode(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	__u8 status = *((__u8 *) skb->data);
+	struct hci_ev_status *rp;
 	__u8 param;
 	void *sent;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_WRITE_ENCRYPT_MODE, sizeof(*rp));
+	if (!rp)
+		return;
 
-	if (status)
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
 		return;
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_WRITE_ENCRYPT_MODE);
@@ -377,11 +460,15 @@ static void hci_cc_write_encrypt_mode(struct hci_dev *hdev, struct sk_buff *skb)
 
 static void hci_cc_write_scan_enable(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	__u8 status = *((__u8 *) skb->data);
+	struct hci_ev_status *rp;
 	__u8 param;
 	void *sent;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_WRITE_SCAN_ENABLE, sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_WRITE_SCAN_ENABLE);
 	if (!sent)
@@ -391,7 +478,7 @@ static void hci_cc_write_scan_enable(struct hci_dev *hdev, struct sk_buff *skb)
 
 	hci_dev_lock(hdev);
 
-	if (status) {
+	if (rp->status) {
 		hdev->discov_timeout = 0;
 		goto done;
 	}
@@ -412,13 +499,17 @@ static void hci_cc_write_scan_enable(struct hci_dev *hdev, struct sk_buff *skb)
 
 static void hci_cc_set_event_filter(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	__u8 status = *((__u8 *)skb->data);
+	struct hci_ev_status *rp;
 	struct hci_cp_set_event_filter *cp;
 	void *sent;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_WRITE_SCAN_ENABLE, sizeof(*rp));
+	if (!rp)
+		return;
 
-	if (status)
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
 		return;
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_SET_EVENT_FLT);
@@ -435,25 +526,33 @@ static void hci_cc_set_event_filter(struct hci_dev *hdev, struct sk_buff *skb)
 
 static void hci_cc_read_class_of_dev(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	struct hci_rp_read_class_of_dev *rp = (void *) skb->data;
+	struct hci_rp_read_class_of_dev *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_CLASS_OF_DEV, sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
 
 	memcpy(hdev->dev_class, rp->dev_class, 3);
 
-	BT_DBG("%s class 0x%.2x%.2x%.2x", hdev->name,
-	       hdev->dev_class[2], hdev->dev_class[1], hdev->dev_class[0]);
+	bt_dev_dbg(hdev, "class 0x%.2x%.2x%.2x", hdev->dev_class[2],
+		   hdev->dev_class[1], hdev->dev_class[0]);
 }
 
 static void hci_cc_write_class_of_dev(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	__u8 status = *((__u8 *) skb->data);
+	struct hci_ev_status *rp;
 	void *sent;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_CLASS_OF_DEV, sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_WRITE_CLASS_OF_DEV);
 	if (!sent)
@@ -461,21 +560,25 @@ static void hci_cc_write_class_of_dev(struct hci_dev *hdev, struct sk_buff *skb)
 
 	hci_dev_lock(hdev);
 
-	if (status == 0)
+	if (!rp->status)
 		memcpy(hdev->dev_class, sent, 3);
 
 	if (hci_dev_test_flag(hdev, HCI_MGMT))
-		mgmt_set_class_of_dev_complete(hdev, sent, status);
+		mgmt_set_class_of_dev_complete(hdev, sent, rp->status);
 
 	hci_dev_unlock(hdev);
 }
 
 static void hci_cc_read_voice_setting(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	struct hci_rp_read_voice_setting *rp = (void *) skb->data;
+	struct hci_rp_read_voice_setting *rp;
 	__u16 setting;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_VOICE_SETTING, sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
@@ -487,7 +590,7 @@ static void hci_cc_read_voice_setting(struct hci_dev *hdev, struct sk_buff *skb)
 
 	hdev->voice_setting = setting;
 
-	BT_DBG("%s voice setting 0x%4.4x", hdev->name, setting);
+	bt_dev_dbg(hdev, "voice setting 0x%4.4x", setting);
 
 	if (hdev->notify)
 		hdev->notify(hdev, HCI_NOTIFY_VOICE_SETTING);
@@ -496,13 +599,18 @@ static void hci_cc_read_voice_setting(struct hci_dev *hdev, struct sk_buff *skb)
 static void hci_cc_write_voice_setting(struct hci_dev *hdev,
 				       struct sk_buff *skb)
 {
-	__u8 status = *((__u8 *) skb->data);
+	struct hci_ev_status *rp;
 	__u16 setting;
 	void *sent;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_WRITE_VOICE_SETTING,
+			     sizeof(*rp));
+	if (!rp)
+		return;
 
-	if (status)
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
 		return;
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_WRITE_VOICE_SETTING);
@@ -516,7 +624,7 @@ static void hci_cc_write_voice_setting(struct hci_dev *hdev,
 
 	hdev->voice_setting = setting;
 
-	BT_DBG("%s voice setting 0x%4.4x", hdev->name, setting);
+	bt_dev_dbg(hdev, "voice setting 0x%4.4x", setting);
 
 	if (hdev->notify)
 		hdev->notify(hdev, HCI_NOTIFY_VOICE_SETTING);
@@ -525,24 +633,33 @@ static void hci_cc_write_voice_setting(struct hci_dev *hdev,
 static void hci_cc_read_num_supported_iac(struct hci_dev *hdev,
 					  struct sk_buff *skb)
 {
-	struct hci_rp_read_num_supported_iac *rp = (void *) skb->data;
+	struct hci_rp_read_num_supported_iac *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_NUM_SUPPORTED_IAC,
+			     sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
 
 	hdev->num_iac = rp->num_iac;
 
-	BT_DBG("%s num iac %d", hdev->name, hdev->num_iac);
+	bt_dev_dbg(hdev, "num iac %d", hdev->num_iac);
 }
 
 static void hci_cc_write_ssp_mode(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	__u8 status = *((__u8 *) skb->data);
+	struct hci_ev_status *rp;
 	struct hci_cp_write_ssp_mode *sent;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_WRITE_SSP_MODE, sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_WRITE_SSP_MODE);
 	if (!sent)
@@ -550,14 +667,14 @@ static void hci_cc_write_ssp_mode(struct hci_dev *hdev, struct sk_buff *skb)
 
 	hci_dev_lock(hdev);
 
-	if (!status) {
+	if (!rp->status) {
 		if (sent->mode)
 			hdev->features[1][0] |= LMP_HOST_SSP;
 		else
 			hdev->features[1][0] &= ~LMP_HOST_SSP;
 	}
 
-	if (!status) {
+	if (!rp->status) {
 		if (sent->mode)
 			hci_dev_set_flag(hdev, HCI_SSP_ENABLED);
 		else
@@ -569,10 +686,14 @@ static void hci_cc_write_ssp_mode(struct hci_dev *hdev, struct sk_buff *skb)
 
 static void hci_cc_write_sc_support(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	u8 status = *((u8 *) skb->data);
+	struct hci_ev_status *rp;
 	struct hci_cp_write_sc_support *sent;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_WRITE_SC_SUPPORT, sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_WRITE_SC_SUPPORT);
 	if (!sent)
@@ -580,14 +701,14 @@ static void hci_cc_write_sc_support(struct hci_dev *hdev, struct sk_buff *skb)
 
 	hci_dev_lock(hdev);
 
-	if (!status) {
+	if (!rp->status) {
 		if (sent->support)
 			hdev->features[1][0] |= LMP_HOST_SC;
 		else
 			hdev->features[1][0] &= ~LMP_HOST_SC;
 	}
 
-	if (!hci_dev_test_flag(hdev, HCI_MGMT) && !status) {
+	if (!hci_dev_test_flag(hdev, HCI_MGMT) && !rp->status) {
 		if (sent->support)
 			hci_dev_set_flag(hdev, HCI_SC_ENABLED);
 		else
@@ -599,9 +720,13 @@ static void hci_cc_write_sc_support(struct hci_dev *hdev, struct sk_buff *skb)
 
 static void hci_cc_read_local_version(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	struct hci_rp_read_local_version *rp = (void *) skb->data;
+	struct hci_rp_read_local_version *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_LOCAL_VERSION, sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
@@ -619,9 +744,14 @@ static void hci_cc_read_local_version(struct hci_dev *hdev, struct sk_buff *skb)
 static void hci_cc_read_local_commands(struct hci_dev *hdev,
 				       struct sk_buff *skb)
 {
-	struct hci_rp_read_local_commands *rp = (void *) skb->data;
+	struct hci_rp_read_local_commands *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_LOCAL_COMMANDS,
+			     sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
@@ -634,10 +764,15 @@ static void hci_cc_read_local_commands(struct hci_dev *hdev,
 static void hci_cc_read_auth_payload_timeout(struct hci_dev *hdev,
 					     struct sk_buff *skb)
 {
-	struct hci_rp_read_auth_payload_to *rp = (void *)skb->data;
+	struct hci_rp_read_auth_payload_to *rp;
 	struct hci_conn *conn;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_AUTH_PAYLOAD_TO,
+			     sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
@@ -654,11 +789,15 @@ static void hci_cc_read_auth_payload_timeout(struct hci_dev *hdev,
 static void hci_cc_write_auth_payload_timeout(struct hci_dev *hdev,
 					      struct sk_buff *skb)
 {
-	struct hci_rp_write_auth_payload_to *rp = (void *)skb->data;
+	struct hci_rp_write_auth_payload_to *rp;
 	struct hci_conn *conn;
 	void *sent;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_WRITE_AUTH_PAYLOAD_TO, sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
@@ -679,9 +818,14 @@ static void hci_cc_write_auth_payload_timeout(struct hci_dev *hdev,
 static void hci_cc_read_local_features(struct hci_dev *hdev,
 				       struct sk_buff *skb)
 {
-	struct hci_rp_read_local_features *rp = (void *) skb->data;
+	struct hci_rp_read_local_features *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_LOCAL_FEATURES,
+			     sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
@@ -729,9 +873,14 @@ static void hci_cc_read_local_features(struct hci_dev *hdev,
 static void hci_cc_read_local_ext_features(struct hci_dev *hdev,
 					   struct sk_buff *skb)
 {
-	struct hci_rp_read_local_ext_features *rp = (void *) skb->data;
+	struct hci_rp_read_local_ext_features *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_LOCAL_EXT_FEATURES,
+			     sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
@@ -746,9 +895,14 @@ static void hci_cc_read_local_ext_features(struct hci_dev *hdev,
 static void hci_cc_read_flow_control_mode(struct hci_dev *hdev,
 					  struct sk_buff *skb)
 {
-	struct hci_rp_read_flow_control_mode *rp = (void *) skb->data;
+	struct hci_rp_read_flow_control_mode *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_FLOW_CONTROL_MODE,
+			     sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
@@ -758,9 +912,13 @@ static void hci_cc_read_flow_control_mode(struct hci_dev *hdev,
 
 static void hci_cc_read_buffer_size(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	struct hci_rp_read_buffer_size *rp = (void *) skb->data;
+	struct hci_rp_read_buffer_size *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_BUFFER_SIZE, sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
@@ -784,9 +942,13 @@ static void hci_cc_read_buffer_size(struct hci_dev *hdev, struct sk_buff *skb)
 
 static void hci_cc_read_bd_addr(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	struct hci_rp_read_bd_addr *rp = (void *) skb->data;
+	struct hci_rp_read_bd_addr *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_BD_ADDR, sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
@@ -801,9 +963,14 @@ static void hci_cc_read_bd_addr(struct hci_dev *hdev, struct sk_buff *skb)
 static void hci_cc_read_local_pairing_opts(struct hci_dev *hdev,
 					   struct sk_buff *skb)
 {
-	struct hci_rp_read_local_pairing_opts *rp = (void *) skb->data;
+	struct hci_rp_read_local_pairing_opts *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_LOCAL_PAIRING_OPTS,
+			     sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
@@ -818,9 +985,14 @@ static void hci_cc_read_local_pairing_opts(struct hci_dev *hdev,
 static void hci_cc_read_page_scan_activity(struct hci_dev *hdev,
 					   struct sk_buff *skb)
 {
-	struct hci_rp_read_page_scan_activity *rp = (void *) skb->data;
+	struct hci_rp_read_page_scan_activity *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_PAGE_SCAN_ACTIVITY,
+			     sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
@@ -834,12 +1006,17 @@ static void hci_cc_read_page_scan_activity(struct hci_dev *hdev,
 static void hci_cc_write_page_scan_activity(struct hci_dev *hdev,
 					    struct sk_buff *skb)
 {
-	u8 status = *((u8 *) skb->data);
+	struct hci_ev_status *rp;
 	struct hci_cp_write_page_scan_activity *sent;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_PAGE_SCAN_ACTIVITY,
+			     sizeof(*rp));
+	if (!rp)
+		return;
 
-	if (status)
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
 		return;
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_WRITE_PAGE_SCAN_ACTIVITY);
@@ -853,9 +1030,14 @@ static void hci_cc_write_page_scan_activity(struct hci_dev *hdev,
 static void hci_cc_read_page_scan_type(struct hci_dev *hdev,
 					   struct sk_buff *skb)
 {
-	struct hci_rp_read_page_scan_type *rp = (void *) skb->data;
+	struct hci_rp_read_page_scan_type *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_PAGE_SCAN_TYPE,
+			     sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
@@ -867,12 +1049,17 @@ static void hci_cc_read_page_scan_type(struct hci_dev *hdev,
 static void hci_cc_write_page_scan_type(struct hci_dev *hdev,
 					struct sk_buff *skb)
 {
-	u8 status = *((u8 *) skb->data);
+	struct hci_ev_status *rp;
 	u8 *type;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_WRITE_PAGE_SCAN_TYPE,
+			     sizeof(*rp));
+	if (!rp)
+		return;
 
-	if (status)
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
 		return;
 
 	type = hci_sent_cmd_data(hdev, HCI_OP_WRITE_PAGE_SCAN_TYPE);
@@ -883,9 +1070,14 @@ static void hci_cc_write_page_scan_type(struct hci_dev *hdev,
 static void hci_cc_read_data_block_size(struct hci_dev *hdev,
 					struct sk_buff *skb)
 {
-	struct hci_rp_read_data_block_size *rp = (void *) skb->data;
+	struct hci_rp_read_data_block_size *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_DATA_BLOCK_SIZE,
+			     sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
@@ -902,15 +1094,18 @@ static void hci_cc_read_data_block_size(struct hci_dev *hdev,
 
 static void hci_cc_read_clock(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	struct hci_rp_read_clock *rp = (void *) skb->data;
+	struct hci_rp_read_clock *rp;
 	struct hci_cp_read_clock *cp;
 	struct hci_conn *conn;
 
 	BT_DBG("%s", hdev->name);
 
-	if (skb->len < sizeof(*rp))
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_CLOCK, sizeof(*rp));
+	if (!rp)
 		return;
 
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
 	if (rp->status)
 		return;
 
@@ -938,9 +1133,14 @@ static void hci_cc_read_clock(struct hci_dev *hdev, struct sk_buff *skb)
 static void hci_cc_read_local_amp_info(struct hci_dev *hdev,
 				       struct sk_buff *skb)
 {
-	struct hci_rp_read_local_amp_info *rp = (void *) skb->data;
+	struct hci_rp_read_local_amp_info *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_LOCAL_AMP_INFO,
+			     sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
@@ -960,9 +1160,14 @@ static void hci_cc_read_local_amp_info(struct hci_dev *hdev,
 static void hci_cc_read_inq_rsp_tx_power(struct hci_dev *hdev,
 					 struct sk_buff *skb)
 {
-	struct hci_rp_read_inq_rsp_tx_power *rp = (void *) skb->data;
+	struct hci_rp_read_inq_rsp_tx_power *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_INQ_RSP_TX_POWER,
+			     sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
@@ -973,9 +1178,14 @@ static void hci_cc_read_inq_rsp_tx_power(struct hci_dev *hdev,
 static void hci_cc_read_def_err_data_reporting(struct hci_dev *hdev,
 					       struct sk_buff *skb)
 {
-	struct hci_rp_read_def_err_data_reporting *rp = (void *)skb->data;
+	struct hci_rp_read_def_err_data_reporting *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_DEF_ERR_DATA_REPORTING,
+			     sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
@@ -986,12 +1196,17 @@ static void hci_cc_read_def_err_data_reporting(struct hci_dev *hdev,
 static void hci_cc_write_def_err_data_reporting(struct hci_dev *hdev,
 						struct sk_buff *skb)
 {
-	__u8 status = *((__u8 *)skb->data);
+	struct hci_ev_status *rp;
 	struct hci_cp_write_def_err_data_reporting *cp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_WRITE_DEF_ERR_DATA_REPORTING,
+			     sizeof(*rp));
+	if (!rp)
+		return;
 
-	if (status)
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
 		return;
 
 	cp = hci_sent_cmd_data(hdev, HCI_OP_WRITE_DEF_ERR_DATA_REPORTING);
@@ -1003,11 +1218,15 @@ static void hci_cc_write_def_err_data_reporting(struct hci_dev *hdev,
 
 static void hci_cc_pin_code_reply(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	struct hci_rp_pin_code_reply *rp = (void *) skb->data;
+	struct hci_rp_pin_code_reply *rp;
 	struct hci_cp_pin_code_reply *cp;
 	struct hci_conn *conn;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_PIN_CODE_REPLY, sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	hci_dev_lock(hdev);
 
@@ -1031,9 +1250,13 @@ static void hci_cc_pin_code_reply(struct hci_dev *hdev, struct sk_buff *skb)
 
 static void hci_cc_pin_code_neg_reply(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	struct hci_rp_pin_code_neg_reply *rp = (void *) skb->data;
+	struct hci_rp_pin_code_neg_reply *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_PIN_CODE_NEG_REPLY, sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	hci_dev_lock(hdev);
 
@@ -1047,9 +1270,14 @@ static void hci_cc_pin_code_neg_reply(struct hci_dev *hdev, struct sk_buff *skb)
 static void hci_cc_le_read_buffer_size(struct hci_dev *hdev,
 				       struct sk_buff *skb)
 {
-	struct hci_rp_le_read_buffer_size *rp = (void *) skb->data;
+	struct hci_rp_le_read_buffer_size *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_READ_BUFFER_SIZE,
+			     sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
@@ -1065,7 +1293,12 @@ static void hci_cc_le_read_buffer_size(struct hci_dev *hdev,
 static void hci_cc_le_read_local_features(struct hci_dev *hdev,
 					  struct sk_buff *skb)
 {
-	struct hci_rp_le_read_local_features *rp = (void *) skb->data;
+	struct hci_rp_le_read_local_features *rp;
+
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_READ_LOCAL_FEATURES,
+			     sizeof(*rp));
+	if (!rp)
+		return;
 
 	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
 
@@ -1078,9 +1311,14 @@ static void hci_cc_le_read_local_features(struct hci_dev *hdev,
 static void hci_cc_le_read_adv_tx_power(struct hci_dev *hdev,
 					struct sk_buff *skb)
 {
-	struct hci_rp_le_read_adv_tx_power *rp = (void *) skb->data;
+	struct hci_rp_le_read_adv_tx_power *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_READ_ADV_TX_POWER,
+			     sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
@@ -1090,9 +1328,13 @@ static void hci_cc_le_read_adv_tx_power(struct hci_dev *hdev,
 
 static void hci_cc_user_confirm_reply(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	struct hci_rp_user_confirm_reply *rp = (void *) skb->data;
+	struct hci_rp_user_confirm_reply *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_USER_CONFIRM_REPLY, sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	hci_dev_lock(hdev);
 
@@ -1106,9 +1348,14 @@ static void hci_cc_user_confirm_reply(struct hci_dev *hdev, struct sk_buff *skb)
 static void hci_cc_user_confirm_neg_reply(struct hci_dev *hdev,
 					  struct sk_buff *skb)
 {
-	struct hci_rp_user_confirm_reply *rp = (void *) skb->data;
+	struct hci_rp_user_confirm_reply *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_USER_CONFIRM_NEG_REPLY,
+			     sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	hci_dev_lock(hdev);
 
@@ -1121,9 +1368,13 @@ static void hci_cc_user_confirm_neg_reply(struct hci_dev *hdev,
 
 static void hci_cc_user_passkey_reply(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	struct hci_rp_user_confirm_reply *rp = (void *) skb->data;
+	struct hci_rp_user_confirm_reply *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_USER_PASSKEY_REPLY, sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	hci_dev_lock(hdev);
 
@@ -1137,9 +1388,13 @@ static void hci_cc_user_passkey_reply(struct hci_dev *hdev, struct sk_buff *skb)
 static void hci_cc_user_passkey_neg_reply(struct hci_dev *hdev,
 					  struct sk_buff *skb)
 {
-	struct hci_rp_user_confirm_reply *rp = (void *) skb->data;
+	struct hci_rp_user_confirm_reply *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_USER_PASSKEY_NEG_REPLY, sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	hci_dev_lock(hdev);
 
@@ -1153,27 +1408,39 @@ static void hci_cc_user_passkey_neg_reply(struct hci_dev *hdev,
 static void hci_cc_read_local_oob_data(struct hci_dev *hdev,
 				       struct sk_buff *skb)
 {
-	struct hci_rp_read_local_oob_data *rp = (void *) skb->data;
+	struct hci_rp_read_local_oob_data *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_LOCAL_OOB_DATA, sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 }
 
 static void hci_cc_read_local_oob_ext_data(struct hci_dev *hdev,
 					   struct sk_buff *skb)
 {
-	struct hci_rp_read_local_oob_ext_data *rp = (void *) skb->data;
+	struct hci_rp_read_local_oob_ext_data *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_LOCAL_OOB_EXT_DATA, sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 }
 
 static void hci_cc_le_set_random_addr(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	__u8 status = *((__u8 *) skb->data);
+	struct hci_ev_status *rp;
 	bdaddr_t *sent;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_SET_RANDOM_ADDR, sizeof(*rp));
+	if (!rp)
+		return;
 
-	if (status)
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
 		return;
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_LE_SET_RANDOM_ADDR);
@@ -1195,12 +1462,16 @@ static void hci_cc_le_set_random_addr(struct hci_dev *hdev, struct sk_buff *skb)
 
 static void hci_cc_le_set_default_phy(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	__u8 status = *((__u8 *) skb->data);
+	struct hci_ev_status *rp;
 	struct hci_cp_le_set_default_phy *cp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_SET_DEFAULT_PHY, sizeof(*rp));
+	if (!rp)
+		return;
 
-	if (status)
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
 		return;
 
 	cp = hci_sent_cmd_data(hdev, HCI_OP_LE_SET_DEFAULT_PHY);
@@ -1218,11 +1489,18 @@ static void hci_cc_le_set_default_phy(struct hci_dev *hdev, struct sk_buff *skb)
 static void hci_cc_le_set_adv_set_random_addr(struct hci_dev *hdev,
                                               struct sk_buff *skb)
 {
-	__u8 status = *((__u8 *) skb->data);
+	struct hci_ev_status *rp;
 	struct hci_cp_le_set_adv_set_rand_addr *cp;
 	struct adv_info *adv;
 
-	if (status)
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_SET_ADV_SET_RAND_ADDR,
+			     sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
 		return;
 
 	cp = hci_sent_cmd_data(hdev, HCI_OP_LE_SET_ADV_SET_RAND_ADDR);
@@ -1251,11 +1529,17 @@ static void hci_cc_le_set_adv_set_random_addr(struct hci_dev *hdev,
 
 static void hci_cc_le_remove_adv_set(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	__u8 status = *((__u8 *)skb->data);
+	struct hci_ev_status *rp;
 	u8 *instance;
 	int err;
 
-	if (status)
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_REMOVE_ADV_SET, sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
 		return;
 
 	instance = hci_sent_cmd_data(hdev, HCI_OP_LE_REMOVE_ADV_SET);
@@ -1274,11 +1558,17 @@ static void hci_cc_le_remove_adv_set(struct hci_dev *hdev, struct sk_buff *skb)
 
 static void hci_cc_le_clear_adv_sets(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	__u8 status = *((__u8 *)skb->data);
+	struct hci_ev_status *rp;
 	struct adv_info *adv, *n;
 	int err;
 
-	if (status)
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_CLEAR_ADV_SETS, sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
 		return;
 
 	if (!hci_sent_cmd_data(hdev, HCI_OP_LE_CLEAR_ADV_SETS))
@@ -1301,9 +1591,14 @@ static void hci_cc_le_clear_adv_sets(struct hci_dev *hdev, struct sk_buff *skb)
 static void hci_cc_le_read_transmit_power(struct hci_dev *hdev,
 					  struct sk_buff *skb)
 {
-	struct hci_rp_le_read_transmit_power *rp = (void *)skb->data;
+	struct hci_rp_le_read_transmit_power *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_READ_TRANSMIT_POWER,
+			     sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
@@ -1314,11 +1609,16 @@ static void hci_cc_le_read_transmit_power(struct hci_dev *hdev,
 
 static void hci_cc_le_set_adv_enable(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	__u8 *sent, status = *((__u8 *) skb->data);
+	struct hci_ev_status *rp;
+	__u8 *sent;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_SET_ADV_ENABLE, sizeof(*rp));
+	if (!rp)
+		return;
 
-	if (status)
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
 		return;
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_LE_SET_ADV_ENABLE);
@@ -1352,12 +1652,17 @@ static void hci_cc_le_set_ext_adv_enable(struct hci_dev *hdev,
 {
 	struct hci_cp_le_set_ext_adv_enable *cp;
 	struct hci_cp_ext_adv_set *set;
-	__u8 status = *((__u8 *) skb->data);
 	struct adv_info *adv = NULL, *n;
+	struct hci_ev_status *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_SET_EXT_ADV_ENABLE,
+			     sizeof(*rp));
+	if (!rp)
+		return;
 
-	if (status)
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
 		return;
 
 	cp = hci_sent_cmd_data(hdev, HCI_OP_LE_SET_EXT_ADV_ENABLE);
@@ -1414,11 +1719,15 @@ static void hci_cc_le_set_ext_adv_enable(struct hci_dev *hdev,
 static void hci_cc_le_set_scan_param(struct hci_dev *hdev, struct sk_buff *skb)
 {
 	struct hci_cp_le_set_scan_param *cp;
-	__u8 status = *((__u8 *) skb->data);
+	struct hci_ev_status *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_SET_SCAN_PARAM, sizeof(*rp));
+	if (!rp)
+		return;
 
-	if (status)
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
 		return;
 
 	cp = hci_sent_cmd_data(hdev, HCI_OP_LE_SET_SCAN_PARAM);
@@ -1436,12 +1745,17 @@ static void hci_cc_le_set_ext_scan_param(struct hci_dev *hdev,
 					 struct sk_buff *skb)
 {
 	struct hci_cp_le_set_ext_scan_params *cp;
-	__u8 status = *((__u8 *) skb->data);
+	struct hci_ev_status *rp;
 	struct hci_cp_le_scan_phy_params *phy_param;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_SET_EXT_SCAN_PARAMS,
+			     sizeof(*rp));
+	if (!rp)
+		return;
 
-	if (status)
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
 		return;
 
 	cp = hci_sent_cmd_data(hdev, HCI_OP_LE_SET_EXT_SCAN_PARAMS);
@@ -1544,11 +1858,16 @@ static void hci_cc_le_set_scan_enable(struct hci_dev *hdev,
 				      struct sk_buff *skb)
 {
 	struct hci_cp_le_set_scan_enable *cp;
-	__u8 status = *((__u8 *) skb->data);
+	struct hci_ev_status *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_SET_SCAN_ENABLE,
+			     sizeof(*rp));
+	if (!rp)
+		return;
 
-	if (status)
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
 		return;
 
 	cp = hci_sent_cmd_data(hdev, HCI_OP_LE_SET_SCAN_ENABLE);
@@ -1562,11 +1881,16 @@ static void hci_cc_le_set_ext_scan_enable(struct hci_dev *hdev,
 				      struct sk_buff *skb)
 {
 	struct hci_cp_le_set_ext_scan_enable *cp;
-	__u8 status = *((__u8 *) skb->data);
+	struct hci_ev_status *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_SET_EXT_SCAN_ENABLE,
+			     sizeof(*rp));
+	if (!rp)
+		return;
 
-	if (status)
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
 		return;
 
 	cp = hci_sent_cmd_data(hdev, HCI_OP_LE_SET_EXT_SCAN_ENABLE);
@@ -1579,10 +1903,15 @@ static void hci_cc_le_set_ext_scan_enable(struct hci_dev *hdev,
 static void hci_cc_le_read_num_adv_sets(struct hci_dev *hdev,
 				      struct sk_buff *skb)
 {
-	struct hci_rp_le_read_num_supported_adv_sets *rp = (void *) skb->data;
+	struct hci_rp_le_read_num_supported_adv_sets *rp;
+
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_READ_NUM_SUPPORTED_ADV_SETS,
+			     sizeof(*rp));
+	if (!rp)
+		return;
 
-	BT_DBG("%s status 0x%2.2x No of Adv sets %u", hdev->name, rp->status,
-	       rp->num_of_sets);
+	bt_dev_dbg(hdev, "status 0x%2.2x No of Adv sets %u", rp->status,
+		   rp->num_of_sets);
 
 	if (rp->status)
 		return;
@@ -1593,9 +1922,14 @@ static void hci_cc_le_read_num_adv_sets(struct hci_dev *hdev,
 static void hci_cc_le_read_accept_list_size(struct hci_dev *hdev,
 					    struct sk_buff *skb)
 {
-	struct hci_rp_le_read_accept_list_size *rp = (void *)skb->data;
+	struct hci_rp_le_read_accept_list_size *rp;
 
-	BT_DBG("%s status 0x%2.2x size %u", hdev->name, rp->status, rp->size);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_READ_ACCEPT_LIST_SIZE,
+			     sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x size %u", rp->status, rp->size);
 
 	if (rp->status)
 		return;
@@ -1606,11 +1940,16 @@ static void hci_cc_le_read_accept_list_size(struct hci_dev *hdev,
 static void hci_cc_le_clear_accept_list(struct hci_dev *hdev,
 					struct sk_buff *skb)
 {
-	__u8 status = *((__u8 *) skb->data);
+	struct hci_ev_status *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_CLEAR_ACCEPT_LIST,
+			     sizeof(*rp));
+	if (!rp)
+		return;
 
-	if (status)
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
 		return;
 
 	hci_bdaddr_list_clear(&hdev->le_accept_list);
@@ -1620,11 +1959,16 @@ static void hci_cc_le_add_to_accept_list(struct hci_dev *hdev,
 					 struct sk_buff *skb)
 {
 	struct hci_cp_le_add_to_accept_list *sent;
-	__u8 status = *((__u8 *) skb->data);
+	struct hci_ev_status *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_ADD_TO_ACCEPT_LIST,
+			     sizeof(*rp));
+	if (!rp)
+		return;
 
-	if (status)
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
 		return;
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_LE_ADD_TO_ACCEPT_LIST);
@@ -1639,11 +1983,16 @@ static void hci_cc_le_del_from_accept_list(struct hci_dev *hdev,
 					   struct sk_buff *skb)
 {
 	struct hci_cp_le_del_from_accept_list *sent;
-	__u8 status = *((__u8 *) skb->data);
+	struct hci_ev_status *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_DEL_FROM_ACCEPT_LIST,
+			     sizeof(*rp));
+	if (!rp)
+		return;
 
-	if (status)
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
 		return;
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_LE_DEL_FROM_ACCEPT_LIST);
@@ -1657,9 +2006,14 @@ static void hci_cc_le_del_from_accept_list(struct hci_dev *hdev,
 static void hci_cc_le_read_supported_states(struct hci_dev *hdev,
 					    struct sk_buff *skb)
 {
-	struct hci_rp_le_read_supported_states *rp = (void *) skb->data;
+	struct hci_rp_le_read_supported_states *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_READ_SUPPORTED_STATES,
+			     sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
@@ -1670,9 +2024,14 @@ static void hci_cc_le_read_supported_states(struct hci_dev *hdev,
 static void hci_cc_le_read_def_data_len(struct hci_dev *hdev,
 					struct sk_buff *skb)
 {
-	struct hci_rp_le_read_def_data_len *rp = (void *) skb->data;
+	struct hci_rp_le_read_def_data_len *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_READ_DEF_DATA_LEN,
+			     sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
@@ -1685,11 +2044,16 @@ static void hci_cc_le_write_def_data_len(struct hci_dev *hdev,
 					 struct sk_buff *skb)
 {
 	struct hci_cp_le_write_def_data_len *sent;
-	__u8 status = *((__u8 *) skb->data);
+	struct hci_ev_status *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_WRITE_DEF_DATA_LEN,
+			     sizeof(*rp));
+	if (!rp)
+		return;
 
-	if (status)
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
 		return;
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_LE_WRITE_DEF_DATA_LEN);
@@ -1704,11 +2068,16 @@ static void hci_cc_le_add_to_resolv_list(struct hci_dev *hdev,
 					 struct sk_buff *skb)
 {
 	struct hci_cp_le_add_to_resolv_list *sent;
-	__u8 status = *((__u8 *) skb->data);
+	struct hci_ev_status *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_ADD_TO_RESOLV_LIST,
+			     sizeof(*rp));
+	if (!rp)
+		return;
 
-	if (status)
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
 		return;
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_LE_ADD_TO_RESOLV_LIST);
@@ -1724,11 +2093,16 @@ static void hci_cc_le_del_from_resolv_list(struct hci_dev *hdev,
 					  struct sk_buff *skb)
 {
 	struct hci_cp_le_del_from_resolv_list *sent;
-	__u8 status = *((__u8 *) skb->data);
+	struct hci_ev_status *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_DEL_FROM_RESOLV_LIST,
+			     sizeof(*rp));
+	if (!rp)
+		return;
 
-	if (status)
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
 		return;
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_LE_DEL_FROM_RESOLV_LIST);
@@ -1742,11 +2116,16 @@ static void hci_cc_le_del_from_resolv_list(struct hci_dev *hdev,
 static void hci_cc_le_clear_resolv_list(struct hci_dev *hdev,
 				       struct sk_buff *skb)
 {
-	__u8 status = *((__u8 *) skb->data);
+	struct hci_ev_status *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_CLEAR_RESOLV_LIST,
+			     sizeof(*rp));
+	if (!rp)
+		return;
 
-	if (status)
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
 		return;
 
 	hci_bdaddr_list_clear(&hdev->le_resolv_list);
@@ -1755,9 +2134,14 @@ static void hci_cc_le_clear_resolv_list(struct hci_dev *hdev,
 static void hci_cc_le_read_resolv_list_size(struct hci_dev *hdev,
 					   struct sk_buff *skb)
 {
-	struct hci_rp_le_read_resolv_list_size *rp = (void *) skb->data;
+	struct hci_rp_le_read_resolv_list_size *rp;
 
-	BT_DBG("%s status 0x%2.2x size %u", hdev->name, rp->status, rp->size);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_READ_RESOLV_LIST_SIZE,
+			     sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x size %u", rp->status, rp->size);
 
 	if (rp->status)
 		return;
@@ -1768,11 +2152,17 @@ static void hci_cc_le_read_resolv_list_size(struct hci_dev *hdev,
 static void hci_cc_le_set_addr_resolution_enable(struct hci_dev *hdev,
 						struct sk_buff *skb)
 {
-	__u8 *sent, status = *((__u8 *) skb->data);
+	struct hci_ev_status *rp;
+	__u8 *sent;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_SET_ADDR_RESOLV_ENABLE,
+			     sizeof(*rp));
+	if (!rp)
+		return;
 
-	if (status)
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
 		return;
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_LE_SET_ADDR_RESOLV_ENABLE);
@@ -1792,9 +2182,14 @@ static void hci_cc_le_set_addr_resolution_enable(struct hci_dev *hdev,
 static void hci_cc_le_read_max_data_len(struct hci_dev *hdev,
 					struct sk_buff *skb)
 {
-	struct hci_rp_le_read_max_data_len *rp = (void *) skb->data;
+	struct hci_rp_le_read_max_data_len *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_READ_MAX_DATA_LEN,
+			     sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
@@ -1809,11 +2204,16 @@ static void hci_cc_write_le_host_supported(struct hci_dev *hdev,
 					   struct sk_buff *skb)
 {
 	struct hci_cp_write_le_host_supported *sent;
-	__u8 status = *((__u8 *) skb->data);
+	struct hci_ev_status *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_WRITE_LE_HOST_SUPPORTED,
+			     sizeof(*rp));
+	if (!rp)
+		return;
 
-	if (status)
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
 		return;
 
 	sent = hci_sent_cmd_data(hdev, HCI_OP_WRITE_LE_HOST_SUPPORTED);
@@ -1842,11 +2242,15 @@ static void hci_cc_write_le_host_supported(struct hci_dev *hdev,
 static void hci_cc_set_adv_param(struct hci_dev *hdev, struct sk_buff *skb)
 {
 	struct hci_cp_le_set_adv_param *cp;
-	u8 status = *((u8 *) skb->data);
+	struct hci_ev_status *rp;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_SET_ADV_PARAM, sizeof(*rp));
+	if (!rp)
+		return;
 
-	if (status)
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
 		return;
 
 	cp = hci_sent_cmd_data(hdev, HCI_OP_LE_SET_ADV_PARAM);
@@ -1860,11 +2264,16 @@ static void hci_cc_set_adv_param(struct hci_dev *hdev, struct sk_buff *skb)
 
 static void hci_cc_set_ext_adv_param(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	struct hci_rp_le_set_ext_adv_params *rp = (void *) skb->data;
+	struct hci_rp_le_set_ext_adv_params *rp;
 	struct hci_cp_le_set_ext_adv_params *cp;
 	struct adv_info *adv_instance;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_LE_SET_EXT_ADV_PARAMS,
+			     sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
@@ -1891,10 +2300,14 @@ static void hci_cc_set_ext_adv_param(struct hci_dev *hdev, struct sk_buff *skb)
 
 static void hci_cc_read_rssi(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	struct hci_rp_read_rssi *rp = (void *) skb->data;
+	struct hci_rp_read_rssi *rp;
 	struct hci_conn *conn;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_RSSI, sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
@@ -1911,10 +2324,14 @@ static void hci_cc_read_rssi(struct hci_dev *hdev, struct sk_buff *skb)
 static void hci_cc_read_tx_power(struct hci_dev *hdev, struct sk_buff *skb)
 {
 	struct hci_cp_read_tx_power *sent;
-	struct hci_rp_read_tx_power *rp = (void *) skb->data;
+	struct hci_rp_read_tx_power *rp;
 	struct hci_conn *conn;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_READ_TX_POWER, sizeof(*rp));
+	if (!rp)
+		return;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
 
 	if (rp->status)
 		return;
@@ -1944,12 +2361,17 @@ static void hci_cc_read_tx_power(struct hci_dev *hdev, struct sk_buff *skb)
 
 static void hci_cc_write_ssp_debug_mode(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	u8 status = *((u8 *) skb->data);
+	struct hci_ev_status *rp;
 	u8 *mode;
 
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
+	rp = hci_cc_skb_pull(hdev, skb, HCI_OP_WRITE_SSP_DEBUG_MODE,
+			     sizeof(*rp));
+	if (!rp)
+		return;
 
-	if (status)
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
 		return;
 
 	mode = hci_sent_cmd_data(hdev, HCI_OP_WRITE_SSP_DEBUG_MODE);
@@ -3505,12 +3927,14 @@ static void hci_cmd_complete_evt(struct hci_dev *hdev, struct sk_buff *skb,
 				 hci_req_complete_t *req_complete,
 				 hci_req_complete_skb_t *req_complete_skb)
 {
-	struct hci_ev_cmd_complete *ev = (void *) skb->data;
+	struct hci_ev_cmd_complete *ev;
 
-	*opcode = __le16_to_cpu(ev->opcode);
-	*status = skb->data[sizeof(*ev)];
+	ev = hci_ev_skb_pull(hdev, skb, HCI_EV_CMD_COMPLETE, sizeof(*ev));
+	if (!ev)
+		return;
 
-	skb_pull(skb, sizeof(*ev));
+	*opcode = __le16_to_cpu(ev->opcode);
+	*status = skb->data[0];
 
 	switch (*opcode) {
 	case HCI_OP_INQUIRY_CANCEL:
@@ -6466,13 +6890,9 @@ static bool hci_get_cmd_complete(struct hci_dev *hdev, u16 opcode,
 	if (!skb)
 		return false;
 
-	if (skb->len < sizeof(*hdr)) {
-		bt_dev_err(hdev, "too short HCI event");
+	hdr = hci_ev_skb_pull(hdev, skb, event, sizeof(*hdr));
+	if (!hdr)
 		return false;
-	}
-
-	hdr = (void *) skb->data;
-	skb_pull(skb, HCI_EVENT_HDR_SIZE);
 
 	if (event) {
 		if (hdr->evt != event)
@@ -6492,13 +6912,9 @@ static bool hci_get_cmd_complete(struct hci_dev *hdev, u16 opcode,
 		return false;
 	}
 
-	if (skb->len < sizeof(*ev)) {
-		bt_dev_err(hdev, "too short cmd_complete event");
+	ev = hci_cc_skb_pull(hdev, skb, opcode, sizeof(*ev));
+	if (!ev)
 		return false;
-	}
-
-	ev = (void *) skb->data;
-	skb_pull(skb, sizeof(*ev));
 
 	if (opcode != __le16_to_cpu(ev->opcode)) {
 		BT_DBG("opcode doesn't match (0x%2.2x != 0x%2.2x)", opcode,
@@ -6584,9 +7000,15 @@ void hci_event_packet(struct hci_dev *hdev, struct sk_buff *skb)
 	hci_req_complete_t req_complete = NULL;
 	hci_req_complete_skb_t req_complete_skb = NULL;
 	struct sk_buff *orig_skb = NULL;
-	u8 status = 0, event = hdr->evt, req_evt = 0;
+	u8 status = 0, event, req_evt = 0;
 	u16 opcode = HCI_OP_NOP;
 
+	if (skb->len < sizeof(*hdr)) {
+		bt_dev_err(hdev, "Malformed HCI Event");
+		goto done;
+	}
+
+	event = hdr->evt;
 	if (!event) {
 		bt_dev_warn(hdev, "Received unexpected HCI Event 00000000");
 		goto done;
-- 
2.33.1

