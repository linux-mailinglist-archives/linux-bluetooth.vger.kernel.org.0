Return-Path: <linux-bluetooth+bounces-1057-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E1682B5AA
	for <lists+linux-bluetooth@lfdr.de>; Thu, 11 Jan 2024 21:02:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD5D4B24121
	for <lists+linux-bluetooth@lfdr.de>; Thu, 11 Jan 2024 20:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26EE656767;
	Thu, 11 Jan 2024 20:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kv/XAXcP"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A757537E4
	for <linux-bluetooth@vger.kernel.org>; Thu, 11 Jan 2024 20:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-20400d5b54eso3582401fac.1
        for <linux-bluetooth@vger.kernel.org>; Thu, 11 Jan 2024 12:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705003328; x=1705608128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CwVt89R5mmIjjN2sFUT7fG0rOpA/72TOnTOY1gyifC4=;
        b=Kv/XAXcPNdMQeOechHCcfGhF4aX6gkhZQqJi6UMtyjm5UxUZ+49kV9P3FkOwv7kd2e
         aGq9a/oiwpXZNNuOOAHxTnA1g+/QHUe1MbXyYwd+oFMcuwvfPCk6573D6303OA9qrt3u
         B9ubXyeoZc58nj141JQe9lE7PF9Pn5mPGimq9St8GdyGgt/TEgtjv8JuA9Z9erKKcGDI
         VYqzJgw1goIAZFsIRRtbmhazXgEpqbB21Xu6FH5LC8OC64yZBDkYRD3A3APhQUcFDxDB
         4ubHx3ONLn2BB1M9zZZ4I41pdrLqCAN/4h9dY0mcah/yLZNvQTnBubOpVKd3tiRrKOA1
         hkUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705003328; x=1705608128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CwVt89R5mmIjjN2sFUT7fG0rOpA/72TOnTOY1gyifC4=;
        b=rtKotQhDipNydR5YiPB9xFa9DIrCVrX7XYUxJIeB15DxySgKv9QPqQZ9AXqb3qMDAW
         4xKsVSF8azyJnOo0an7RafT8gBQOHcDKJA07Vfsnu+Wv4WOKtQblAiwzGk0NcAkeQanP
         bsesnxFXwfOxJibvLCeNt57R9f3fNvzaNk2auoPXUeSQ3eVqmqEiotvTTCJB4HWR08dD
         bvBcDLawN6TK6l+ccWnDRRlvhFmZEuZwi/Yqk84l1QZCMSMA94bQnC8YFBFAwDF8kW/G
         TKDyoBxR+T3IzZpqjZkJIPgL2lNIBB2oJJNtS674aT7zr8FypcvcgBoi3J4Jn0B2/N5U
         qAug==
X-Gm-Message-State: AOJu0YyEFT/UUCAzeoHfz4QCW73iaRwgCDym/k1iG3xKxerPkF43sUWn
	U2qFqEKrjqChqcYcyORxuljg7DHhsAk=
X-Google-Smtp-Source: AGHT+IF0QFuL7zzEllWVEzia5kzGqsBiOQ99kDnHoxTiWUKmHutk8js7IqINhF6T0EXWZD1AWx8cuQ==
X-Received: by 2002:a05:6870:c4a:b0:206:62e0:662e with SMTP id lf10-20020a0568700c4a00b0020662e0662emr317915oab.3.1705003327999;
        Thu, 11 Jan 2024 12:02:07 -0800 (PST)
Received: from lvondent-mobl4.. (071-047-239-151.res.spectrum.com. [71.47.239.151])
        by smtp.gmail.com with ESMTPSA id pa25-20020a0568701d1900b002069e3bcbb5sm359279oab.18.2024.01.11.12.02.06
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 12:02:07 -0800 (PST)
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH v3] Bluetooth: hci_core: Cancel request on command timeout
Date: Thu, 11 Jan 2024 15:02:05 -0500
Message-ID: <20240111200205.795964-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

If command has timed out call __hci_cmd_sync_cancel to notify the
hci_req since it will inevitably cause a timeout.

This also rework the code around __hci_cmd_sync_cancel since it was
wrongly assuming it needs to cancel timer as well, but sometimes the
timers have not been started or in fact they already had timed out in
which case they don't need to be cancel yet again.

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 include/net/bluetooth/hci_sync.h |  2 +-
 net/bluetooth/hci_core.c         | 84 ++++++++++++++++++++++----------
 net/bluetooth/hci_request.c      |  2 +-
 net/bluetooth/hci_sync.c         | 34 +++++++------
 net/bluetooth/mgmt.c             |  2 +-
 5 files changed, 78 insertions(+), 46 deletions(-)

diff --git a/include/net/bluetooth/hci_sync.h b/include/net/bluetooth/hci_sync.h
index 6efbc2152146..e2582c242544 100644
--- a/include/net/bluetooth/hci_sync.h
+++ b/include/net/bluetooth/hci_sync.h
@@ -42,7 +42,7 @@ int __hci_cmd_sync_status_sk(struct hci_dev *hdev, u16 opcode, u32 plen,
 void hci_cmd_sync_init(struct hci_dev *hdev);
 void hci_cmd_sync_clear(struct hci_dev *hdev);
 void hci_cmd_sync_cancel(struct hci_dev *hdev, int err);
-void __hci_cmd_sync_cancel(struct hci_dev *hdev, int err);
+void hci_cmd_sync_cancel_sync(struct hci_dev *hdev, int err);
 
 int hci_cmd_sync_submit(struct hci_dev *hdev, hci_cmd_sync_work_func_t func,
 			void *data, hci_cmd_sync_work_destroy_t destroy);
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index e5cb618fa6d3..de730d210ccb 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -1523,10 +1523,11 @@ static void hci_cmd_timeout(struct work_struct *work)
 					    cmd_timer.work);
 
 	if (hdev->sent_cmd) {
-		struct hci_command_hdr *sent = (void *) hdev->sent_cmd->data;
-		u16 opcode = __le16_to_cpu(sent->opcode);
+		u16 opcode = hci_skb_opcode(hdev->sent_cmd);
 
 		bt_dev_err(hdev, "command 0x%4.4x tx timeout", opcode);
+
+		hci_cmd_sync_cancel_sync(hdev, ETIMEDOUT);
 	} else {
 		bt_dev_err(hdev, "command tx timeout");
 	}
@@ -2857,6 +2858,23 @@ int hci_unregister_suspend_notifier(struct hci_dev *hdev)
 	return ret;
 }
 
+/* Cancel ongoing command synchronously:
+ *
+ * - Cancel command timer
+ * - Reset command counter
+ * - Cancel command request
+ */
+static void hci_cancel_cmd_sync(struct hci_dev *hdev, int err)
+{
+	bt_dev_dbg(hdev, "err 0x%2.2x", err);
+
+	cancel_delayed_work_sync(&hdev->cmd_timer);
+	cancel_delayed_work_sync(&hdev->ncmd_timer);
+	atomic_set(&hdev->cmd_cnt, 1);
+
+	hci_cmd_sync_cancel_sync(hdev, -err);
+}
+
 /* Suspend HCI device */
 int hci_suspend_dev(struct hci_dev *hdev)
 {
@@ -2874,7 +2892,7 @@ int hci_suspend_dev(struct hci_dev *hdev)
 		return 0;
 
 	/* Cancel potentially blocking sync operation before suspend */
-	__hci_cmd_sync_cancel(hdev, -EHOSTDOWN);
+	hci_cancel_cmd_sync(hdev, -EHOSTDOWN);
 
 	hci_req_sync_lock(hdev);
 	ret = hci_suspend_sync(hdev);
@@ -4159,6 +4177,33 @@ static void hci_rx_work(struct work_struct *work)
 	}
 }
 
+static void hci_send_cmd_sync(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	int err;
+
+	bt_dev_dbg(hdev, "skb %p", skb);
+
+	kfree_skb(hdev->sent_cmd);
+
+	hdev->sent_cmd = skb_clone(skb, GFP_KERNEL);
+	if (!hdev->sent_cmd) {
+		skb_queue_head(&hdev->cmd_q, skb);
+		queue_work(hdev->workqueue, &hdev->cmd_work);
+		return;
+	}
+
+	err = hci_send_frame(hdev, skb);
+	if (err < 0) {
+		hci_cmd_sync_cancel_sync(hdev, err);
+		return;
+	}
+
+	if (hci_req_status_pend(hdev))
+		hci_dev_set_flag(hdev, HCI_CMD_PENDING);
+
+	atomic_dec(&hdev->cmd_cnt);
+}
+
 static void hci_cmd_work(struct work_struct *work)
 {
 	struct hci_dev *hdev = container_of(work, struct hci_dev, cmd_work);
@@ -4173,30 +4218,15 @@ static void hci_cmd_work(struct work_struct *work)
 		if (!skb)
 			return;
 
-		kfree_skb(hdev->sent_cmd);
+		hci_send_cmd_sync(hdev, skb);
 
-		hdev->sent_cmd = skb_clone(skb, GFP_KERNEL);
-		if (hdev->sent_cmd) {
-			int res;
-			if (hci_req_status_pend(hdev))
-				hci_dev_set_flag(hdev, HCI_CMD_PENDING);
-			atomic_dec(&hdev->cmd_cnt);
-
-			res = hci_send_frame(hdev, skb);
-			if (res < 0)
-				__hci_cmd_sync_cancel(hdev, -res);
-
-			rcu_read_lock();
-			if (test_bit(HCI_RESET, &hdev->flags) ||
-			    hci_dev_test_flag(hdev, HCI_CMD_DRAIN_WORKQUEUE))
-				cancel_delayed_work(&hdev->cmd_timer);
-			else
-				queue_delayed_work(hdev->workqueue, &hdev->cmd_timer,
-						   HCI_CMD_TIMEOUT);
-			rcu_read_unlock();
-		} else {
-			skb_queue_head(&hdev->cmd_q, skb);
-			queue_work(hdev->workqueue, &hdev->cmd_work);
-		}
+		rcu_read_lock();
+		if (test_bit(HCI_RESET, &hdev->flags) ||
+		    hci_dev_test_flag(hdev, HCI_CMD_DRAIN_WORKQUEUE))
+			cancel_delayed_work(&hdev->cmd_timer);
+		else
+			queue_delayed_work(hdev->workqueue, &hdev->cmd_timer,
+					   HCI_CMD_TIMEOUT);
+		rcu_read_unlock();
 	}
 }
diff --git a/net/bluetooth/hci_request.c b/net/bluetooth/hci_request.c
index 6e023b0104b0..00e02138003e 100644
--- a/net/bluetooth/hci_request.c
+++ b/net/bluetooth/hci_request.c
@@ -895,7 +895,7 @@ void hci_request_setup(struct hci_dev *hdev)
 
 void hci_request_cancel_all(struct hci_dev *hdev)
 {
-	__hci_cmd_sync_cancel(hdev, ENODEV);
+	hci_cmd_sync_cancel_sync(hdev, ENODEV);
 
 	cancel_interleave_scan(hdev);
 }
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index b146562a65fc..1122296ce3fa 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -584,22 +584,6 @@ void hci_cmd_sync_clear(struct hci_dev *hdev)
 	mutex_unlock(&hdev->cmd_sync_work_lock);
 }
 
-void __hci_cmd_sync_cancel(struct hci_dev *hdev, int err)
-{
-	bt_dev_dbg(hdev, "err 0x%2.2x", err);
-
-	if (hdev->req_status == HCI_REQ_PEND) {
-		hdev->req_result = err;
-		hdev->req_status = HCI_REQ_CANCELED;
-
-		cancel_delayed_work_sync(&hdev->cmd_timer);
-		cancel_delayed_work_sync(&hdev->ncmd_timer);
-		atomic_set(&hdev->cmd_cnt, 1);
-
-		wake_up_interruptible(&hdev->req_wait_q);
-	}
-}
-
 void hci_cmd_sync_cancel(struct hci_dev *hdev, int err)
 {
 	bt_dev_dbg(hdev, "err 0x%2.2x", err);
@@ -613,6 +597,24 @@ void hci_cmd_sync_cancel(struct hci_dev *hdev, int err)
 }
 EXPORT_SYMBOL(hci_cmd_sync_cancel);
 
+/* Cancel ongoing command request synchronously:
+ *
+ * - Set result and mark status to HCI_REQ_CANCELED
+ * - Wakeup command sync thread
+ */
+void hci_cmd_sync_cancel_sync(struct hci_dev *hdev, int err)
+{
+	bt_dev_dbg(hdev, "err 0x%2.2x", err);
+
+	if (hdev->req_status == HCI_REQ_PEND) {
+		hdev->req_result = err;
+		hdev->req_status = HCI_REQ_CANCELED;
+
+		wake_up_interruptible(&hdev->req_wait_q);
+	}
+}
+EXPORT_SYMBOL(hci_cmd_sync_cancel_sync);
+
 /* Submit HCI command to be run in as cmd_sync_work:
  *
  * - hdev must _not_ be unregistered
diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index cabc54664017..173986f3405f 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -1415,7 +1415,7 @@ static int set_powered(struct sock *sk, struct hci_dev *hdev, void *data,
 
 	/* Cancel potentially blocking sync operation before power off */
 	if (cp->val == 0x00) {
-		__hci_cmd_sync_cancel(hdev, -EHOSTDOWN);
+		hci_cmd_sync_cancel_sync(hdev, -EHOSTDOWN);
 		err = hci_cmd_sync_queue(hdev, set_powered_sync, cmd,
 					 mgmt_set_powered_complete);
 	} else {
-- 
2.43.0


