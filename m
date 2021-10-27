Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABB2743D7DA
	for <lists+linux-bluetooth@lfdr.de>; Thu, 28 Oct 2021 01:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbhJ1ABi (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 27 Oct 2021 20:01:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbhJ1ABi (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 27 Oct 2021 20:01:38 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D484C061570
        for <linux-bluetooth@vger.kernel.org>; Wed, 27 Oct 2021 16:59:12 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 83so4566246pgc.8
        for <linux-bluetooth@vger.kernel.org>; Wed, 27 Oct 2021 16:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=N5D/HQgG7DuQ1D8jGz8QdjvwrD/AAGmRkPeg1zrEIYs=;
        b=lM5BLl7KXLBpkvFKegL26bSRPEeXL00/Pvl3yNxs9s6yyVUxOzIgkPZ0B9P3MwA78H
         tIUs7OPa3/nCKkxvpA7RkJCSlb4iRYt1zETe72u7KWD22gUd6C0Xr81tt9YjoHyISilZ
         oYXaa7RlWCSj0+JVXX4hkq5SPyId3AEpG2MFYsC8S62jY3tZGuAr1lOKog7vWemor2aP
         4dniSko23tZEqD6pgQkGUsIT8/Ol1KLah8gliEtp9IYTjwvuNl+yqApaRrsJft1KsScR
         gAJFo98ungVjypvC92++zdi5bts9SILg5lFZ+6l6naqqkBP47jUKj32uWrnT0VXo4tP8
         YpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N5D/HQgG7DuQ1D8jGz8QdjvwrD/AAGmRkPeg1zrEIYs=;
        b=WJUpDvFlNGczY8qlLtxzdUvjLe7XNtaZBRGJtV5oLxCVLUcHbXmZ2fc3MMvXh8vDXO
         mBJrmNylDrlmE19LCxPrM9pA1vLQ6gNQHP9gTiAL74Si6DPPaNEawz9O/wkr9PC85jb/
         eYivlDPM1b9J+GaWRDxs0RMfg8LO4+6XWUJ3AKKL4E1Wfl8z90SXXxXh3WU4Y4ysiCZJ
         eU3cAGdHYXPVMcFg6D+shuR8UFpQqJi5Z+826XOGwnW/kOAAj680GoB1YTQ/Bn+8FbDp
         x0n0HrtK5CwS+teHcK1iS+bfwlcNkFDaKLJ+z1zHnkOiS27VGO/slQreDNoFJ/stPpZ/
         +wsg==
X-Gm-Message-State: AOAM533HzD1A8s54v0LYl5VV2ZsDg0RpZvnAsszetTfcRuPcNR3l6v5j
        D/8ItbNogcN0/IKSsz7QhzvJfx/77yE=
X-Google-Smtp-Source: ABdhPJzCWYnA81eg2vBSQ6l/nH1ZjEvwfAyNr2O5Zt9GtcQomP+9yt89qo+fZqNQMTo8g9XxpHfeAg==
X-Received: by 2002:a63:2d46:: with SMTP id t67mr659949pgt.15.1635379151295;
        Wed, 27 Oct 2021 16:59:11 -0700 (PDT)
Received: from lvondent-mobl4.intel.com (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id 142sm807908pgh.22.2021.10.27.16.59.10
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 16:59:10 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v8 13/23] Bluetooth: hci_sync: Convert MGMT_OP_GET_CLOCK_INFO
Date:   Wed, 27 Oct 2021 16:58:50 -0700
Message-Id: <20211027235900.1882863-14-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027235900.1882863-1-luiz.dentz@gmail.com>
References: <20211027235900.1882863-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Brian Gix <brian.gix@intel.com>

Synchronous version of MGMT_OP_GET_CLOCK_INFO.

Signed-off-by: Brian Gix <brian.gix@intel.com>
---
 include/net/bluetooth/hci_sync.h |   1 +
 net/bluetooth/hci_sync.c         |   6 ++
 net/bluetooth/mgmt.c             | 121 +++++++++++++------------------
 3 files changed, 58 insertions(+), 70 deletions(-)

diff --git a/include/net/bluetooth/hci_sync.h b/include/net/bluetooth/hci_sync.h
index 4b27a89cc57e..cf54f8f14edb 100644
--- a/include/net/bluetooth/hci_sync.h
+++ b/include/net/bluetooth/hci_sync.h
@@ -70,6 +70,7 @@ int hci_update_passive_scan(struct hci_dev *hdev);
 int hci_read_rssi_sync(struct hci_dev *hdev, __le16 handle);
 int hci_read_tx_power_sync(struct hci_dev *hdev, __le16 handle, u8 type);
 int hci_write_sc_support_sync(struct hci_dev *hdev, u8 val);
+int hci_read_clock_sync(struct hci_dev *hdev, struct hci_cp_read_clock *cp);
 
 int hci_write_fast_connectable_sync(struct hci_dev *hdev, bool enable);
 int hci_update_scan_sync(struct hci_dev *hdev);
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index dc27d6652188..37595b393ac1 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -1318,6 +1318,12 @@ int hci_read_rssi_sync(struct hci_dev *hdev, __le16 handle)
 					sizeof(cp), &cp, HCI_CMD_TIMEOUT);
 }
 
+int hci_read_clock_sync(struct hci_dev *hdev, struct hci_cp_read_clock *cp)
+{
+	return __hci_cmd_sync_status(hdev, HCI_OP_READ_CLOCK,
+					sizeof(*cp), cp, HCI_CMD_TIMEOUT);
+}
+
 int hci_read_tx_power_sync(struct hci_dev *hdev, __le16 handle, u8 type)
 {
 	struct hci_cp_read_tx_power cp;
diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 656e34617029..7ee0a4beab08 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -927,13 +927,6 @@ static struct mgmt_pending_cmd *pending_find(u16 opcode, struct hci_dev *hdev)
 	return mgmt_pending_find(HCI_CHANNEL_CONTROL, opcode, hdev);
 }
 
-static struct mgmt_pending_cmd *pending_find_data(u16 opcode,
-						  struct hci_dev *hdev,
-						  const void *data)
-{
-	return mgmt_pending_find_data(HCI_CHANNEL_CONTROL, opcode, hdev, data);
-}
-
 u8 mgmt_get_adv_discov_flags(struct hci_dev *hdev)
 {
 	struct mgmt_pending_cmd *cmd;
@@ -6702,82 +6695,76 @@ static int get_conn_info(struct sock *sk, struct hci_dev *hdev, void *data,
 	return err;
 }
 
-static int clock_info_cmd_complete(struct mgmt_pending_cmd *cmd, u8 status)
+static void get_clock_info_complete(struct hci_dev *hdev, void *data, int err)
 {
-	struct hci_conn *conn = cmd->user_data;
+	struct mgmt_pending_cmd *cmd = data;
+	struct mgmt_cp_get_clock_info *cp = cmd->param;
 	struct mgmt_rp_get_clock_info rp;
-	struct hci_dev *hdev;
-	int err;
+	struct hci_conn *conn = cmd->user_data;
+	u8 status = mgmt_status(err);
+
+	bt_dev_dbg(hdev, "err %d", err);
 
 	memset(&rp, 0, sizeof(rp));
-	memcpy(&rp.addr, cmd->param, sizeof(rp.addr));
+	bacpy(&rp.addr.bdaddr, &cp->addr.bdaddr);
+	rp.addr.type = cp->addr.type;
 
-	if (status)
+	if (err)
 		goto complete;
 
-	hdev = hci_dev_get(cmd->index);
-	if (hdev) {
-		rp.local_clock = cpu_to_le32(hdev->clock);
-		hci_dev_put(hdev);
-	}
+	rp.local_clock = cpu_to_le32(hdev->clock);
 
 	if (conn) {
 		rp.piconet_clock = cpu_to_le32(conn->clock);
 		rp.accuracy = cpu_to_le16(conn->clock_accuracy);
-	}
-
-complete:
-	err = mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode, status, &rp,
-				sizeof(rp));
-
-	if (conn) {
 		hci_conn_drop(conn);
 		hci_conn_put(conn);
 	}
 
-	return err;
+complete:
+	mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode, status, &rp,
+			  sizeof(rp));
+
+	mgmt_pending_free(cmd);
 }
 
-static void get_clock_info_complete(struct hci_dev *hdev, u8 status, u16 opcode)
+static int get_clock_info_sync(struct hci_dev *hdev, void *data)
 {
-	struct hci_cp_read_clock *hci_cp;
-	struct mgmt_pending_cmd *cmd;
-	struct hci_conn *conn;
-
-	bt_dev_dbg(hdev, "status %u", status);
+	struct mgmt_pending_cmd *cmd = data;
+	struct mgmt_cp_get_clock_info *cp = cmd->param;
+	struct hci_cp_read_clock hci_cp;
+	struct hci_conn *conn = cmd->user_data;
+	int err;
 
-	hci_dev_lock(hdev);
+	memset(&hci_cp, 0, sizeof(hci_cp));
+	err = hci_read_clock_sync(hdev, &hci_cp);
 
-	hci_cp = hci_sent_cmd_data(hdev, HCI_OP_READ_CLOCK);
-	if (!hci_cp)
-		goto unlock;
+	if (conn) {
+		/* Make sure connection still exists */
+		conn = hci_conn_hash_lookup_ba(hdev, ACL_LINK,
+					       &cp->addr.bdaddr);
 
-	if (hci_cp->which) {
-		u16 handle = __le16_to_cpu(hci_cp->handle);
-		conn = hci_conn_hash_lookup_handle(hdev, handle);
-	} else {
-		conn = NULL;
+		if (conn && conn == cmd->user_data &&
+		    conn->state == BT_CONNECTED) {
+			hci_cp.handle = cpu_to_le16(conn->handle);
+			hci_cp.which = 0x01; /* Piconet clock */
+			err = hci_read_clock_sync(hdev, &hci_cp);
+		} else if (cmd->user_data) {
+			hci_conn_drop(cmd->user_data);
+			hci_conn_put(cmd->user_data);
+			cmd->user_data = NULL;
+		}
 	}
 
-	cmd = pending_find_data(MGMT_OP_GET_CLOCK_INFO, hdev, conn);
-	if (!cmd)
-		goto unlock;
-
-	cmd->cmd_complete(cmd, mgmt_status(status));
-	mgmt_pending_remove(cmd);
-
-unlock:
-	hci_dev_unlock(hdev);
+	return err;
 }
 
 static int get_clock_info(struct sock *sk, struct hci_dev *hdev, void *data,
-			 u16 len)
+								u16 len)
 {
 	struct mgmt_cp_get_clock_info *cp = data;
 	struct mgmt_rp_get_clock_info rp;
-	struct hci_cp_read_clock hci_cp;
 	struct mgmt_pending_cmd *cmd;
-	struct hci_request req;
 	struct hci_conn *conn;
 	int err;
 
@@ -6815,31 +6802,25 @@ static int get_clock_info(struct sock *sk, struct hci_dev *hdev, void *data,
 		conn = NULL;
 	}
 
-	cmd = mgmt_pending_add(sk, MGMT_OP_GET_CLOCK_INFO, hdev, data, len);
-	if (!cmd) {
+	cmd = mgmt_pending_new(sk, MGMT_OP_GET_CLOCK_INFO, hdev, data, len);
+	if (!cmd)
 		err = -ENOMEM;
-		goto unlock;
-	}
-
-	cmd->cmd_complete = clock_info_cmd_complete;
+	else
+		err = hci_cmd_sync_queue(hdev, get_clock_info_sync, cmd,
+					 get_clock_info_complete);
 
-	hci_req_init(&req, hdev);
+	if (err < 0) {
+		err = mgmt_cmd_complete(sk, hdev->id, MGMT_OP_GET_CLOCK_INFO,
+					MGMT_STATUS_FAILED, &rp, sizeof(rp));
 
-	memset(&hci_cp, 0, sizeof(hci_cp));
-	hci_req_add(&req, HCI_OP_READ_CLOCK, sizeof(hci_cp), &hci_cp);
+		if (cmd)
+			mgmt_pending_free(cmd);
 
-	if (conn) {
+	} else if (conn) {
 		hci_conn_hold(conn);
 		cmd->user_data = hci_conn_get(conn);
-
-		hci_cp.handle = cpu_to_le16(conn->handle);
-		hci_cp.which = 0x01; /* Piconet clock */
-		hci_req_add(&req, HCI_OP_READ_CLOCK, sizeof(hci_cp), &hci_cp);
 	}
 
-	err = hci_req_run(&req, get_clock_info_complete);
-	if (err < 0)
-		mgmt_pending_remove(cmd);
 
 unlock:
 	hci_dev_unlock(hdev);
-- 
2.31.1

