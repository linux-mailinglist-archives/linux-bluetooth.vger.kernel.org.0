Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96C0743D66A
	for <lists+linux-bluetooth@lfdr.de>; Thu, 28 Oct 2021 00:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbhJ0WUe (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 27 Oct 2021 18:20:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbhJ0WUd (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 27 Oct 2021 18:20:33 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E581C061570
        for <linux-bluetooth@vger.kernel.org>; Wed, 27 Oct 2021 15:18:07 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id u6-20020a17090a3fc600b001a00250584aso6296689pjm.4
        for <linux-bluetooth@vger.kernel.org>; Wed, 27 Oct 2021 15:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FS7hlay7CZmcCjjq7eLGr5fEpt6s4Ik6bkK1UXAdBJY=;
        b=hd15xS/P54mlelT7qckO2W48fUrOXtqRZyV1yxqbEsrfZn9hF0c8gzohmDXVBMdsT0
         Z/dfnbCTX6LzraORiYLeCEkm1Q/ZBzg0bw9Q4326kJnfRNJqt0bANqMxGGvJoTKQlOj0
         0Gf1PWAXqU5WOfvH42OqjvoGabFUQNF1jNXcNccng34aq5tfJbM2RbOy7C7qq5z2X0dD
         pE8I7Q7RKV0O8JcnymhFQ/zuGozsbm7/e7XqTIUHqyT2WtTqSxdWG534xFefsByIb+hA
         bgDWVGvAn4hr0MFaAZ4d+8nSmhwXwYEHv+klpkiMj8Hy/pkBWMiUGsf6etUuG1M8IfOy
         5OaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FS7hlay7CZmcCjjq7eLGr5fEpt6s4Ik6bkK1UXAdBJY=;
        b=wB2vsKw6GJ2oliBW/yZ+Fd6+qibz0ZVXKwWAXF7Goxbp3Rq6yWt580R8nQSYzVDJBy
         rJ6Mn8xFaQKQjUM9lSesqeqFvxM4zRY4hdVBX2pi+rCLE7rzyy99UMdPDKl+OibS0WWU
         s7yooaY0jePj7vYzottqM/nqnjybv7Yq7Yn1o/HxRaA6whGNwhCrVr7A2i0AtI9GIwnu
         8JYJHNwnX7NCt7Wx29ppHzAGkLmP12HvOZRcZ7fmapJAbrV0Jcp50AoGCEw+05dhQ9aq
         ELmkHRO6WekwKgtAbsiCri1k//GSlLZ0Sy/VK8hGdcJlnEpzt537jMk9rJTxzY19LE8Y
         dzJw==
X-Gm-Message-State: AOAM531us6OwX6Hd9yMp0+icxkE+9Pt19s3kGQ04T4eTHB4EqYStx23K
        x7z13eyo5c0yhslZ7YO7PUR29VF8lz8=
X-Google-Smtp-Source: ABdhPJyAbA5v2FBY0RZkyNz7cneo/z+NO4lvq869oYyikSPQjE3nzxeb6FVqr6WnUcDjwc5bAr8ljw==
X-Received: by 2002:a17:90a:ac0c:: with SMTP id o12mr8684257pjq.37.1635373086153;
        Wed, 27 Oct 2021 15:18:06 -0700 (PDT)
Received: from localhost.localdomain (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id a25sm902760pfl.115.2021.10.27.15.18.05
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 15:18:05 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v7 01/23] Bluetooth: Add helper for serialized HCI command execution
Date:   Wed, 27 Oct 2021 15:17:40 -0700
Message-Id: <20211027221802.1851851-2-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027221802.1851851-1-luiz.dentz@gmail.com>
References: <20211027221802.1851851-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Marcel Holtmann <marcel@holtmann.org>

The usage of __hci_cmd_sync() within the hdev->setup() callback allows for
a nice and simple serialized execution of HCI commands. More importantly
it allows for result processing before issueing the next command.

With the current usage of hci_req_run() it is possible to batch up
commands and execute them, but it is impossible to react to their
results or errors.

This is an attempt to generalize the hdev->setup() handling and provide
a simple way of running multiple HCI commands from a single function
context.

There are multiple struct work that are decdicated to certain tasks
already used right now. It is add a lot of bloat to hci_dev struct and
extra handling code. So it might be possible to put all of these behind
a common HCI command infrastructure and just execute the HCI commands
from the same work context in a serialized fashion.

For example updating the white list and resolving list can be done now
without having to know the list size ahead of time. Also preparing for
suspend or resume shouldn't require a state machine anymore. There are
other tasks that should be simplified as well.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 include/net/bluetooth/hci_core.h |  11 +-
 include/net/bluetooth/hci_sync.h |  42 ++++
 net/bluetooth/Makefile           |   2 +-
 net/bluetooth/hci_core.c         |  23 +--
 net/bluetooth/hci_request.c      |  68 -------
 net/bluetooth/hci_request.h      |   4 +
 net/bluetooth/hci_sync.c         | 330 +++++++++++++++++++++++++++++++
 7 files changed, 385 insertions(+), 95 deletions(-)
 create mode 100644 include/net/bluetooth/hci_sync.h
 create mode 100644 net/bluetooth/hci_sync.c

diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index dd8840e70e25..17ddea51d161 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -30,6 +30,7 @@
 #include <linux/rculist.h>
 
 #include <net/bluetooth/hci.h>
+#include <net/bluetooth/hci_sync.h>
 #include <net/bluetooth/hci_sock.h>
 
 /* HCI priority */
@@ -475,6 +476,9 @@ struct hci_dev {
 	struct work_struct	power_on;
 	struct delayed_work	power_off;
 	struct work_struct	error_reset;
+	struct work_struct	cmd_sync_work;
+	struct list_head	cmd_sync_work_list;
+	struct mutex		cmd_sync_work_lock;
 
 	__u16			discov_timeout;
 	struct delayed_work	discov_off;
@@ -1690,10 +1694,6 @@ static inline int hci_check_conn_params(u16 min, u16 max, u16 latency,
 int hci_register_cb(struct hci_cb *hcb);
 int hci_unregister_cb(struct hci_cb *hcb);
 
-struct sk_buff *__hci_cmd_sync(struct hci_dev *hdev, u16 opcode, u32 plen,
-			       const void *param, u32 timeout);
-struct sk_buff *__hci_cmd_sync_ev(struct hci_dev *hdev, u16 opcode, u32 plen,
-				  const void *param, u8 event, u32 timeout);
 int __hci_cmd_send(struct hci_dev *hdev, u16 opcode, u32 plen,
 		   const void *param);
 
@@ -1704,9 +1704,6 @@ void hci_send_sco(struct hci_conn *conn, struct sk_buff *skb);
 
 void *hci_sent_cmd_data(struct hci_dev *hdev, __u16 opcode);
 
-struct sk_buff *hci_cmd_sync(struct hci_dev *hdev, u16 opcode, u32 plen,
-			     const void *param, u32 timeout);
-
 u32 hci_conn_get_phy(struct hci_conn *conn);
 
 /* ----- HCI Sockets ----- */
diff --git a/include/net/bluetooth/hci_sync.h b/include/net/bluetooth/hci_sync.h
new file mode 100644
index 000000000000..fcfdeb3cbd7c
--- /dev/null
+++ b/include/net/bluetooth/hci_sync.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * BlueZ - Bluetooth protocol stack for Linux
+ *
+ * Copyright (C) 2021 Intel Corporation
+ */
+
+typedef int (*hci_cmd_sync_work_func_t)(struct hci_dev *hdev, void *data);
+typedef void (*hci_cmd_sync_work_destroy_t)(struct hci_dev *hdev, void *data,
+					    int err);
+
+struct hci_cmd_sync_work_entry {
+	struct list_head list;
+	hci_cmd_sync_work_func_t func;
+	void *data;
+	hci_cmd_sync_work_destroy_t destroy;
+};
+
+/* Function with sync suffix shall not be called with hdev->lock held as they
+ * wait the command to complete and in the meantime an event could be received
+ * which could attempt to acquire hdev->lock causing a deadlock.
+ */
+struct sk_buff *__hci_cmd_sync(struct hci_dev *hdev, u16 opcode, u32 plen,
+			       const void *param, u32 timeout);
+struct sk_buff *hci_cmd_sync(struct hci_dev *hdev, u16 opcode, u32 plen,
+			     const void *param, u32 timeout);
+struct sk_buff *__hci_cmd_sync_ev(struct hci_dev *hdev, u16 opcode, u32 plen,
+				  const void *param, u8 event, u32 timeout);
+struct sk_buff *__hci_cmd_sync_sk(struct hci_dev *hdev, u16 opcode, u32 plen,
+				  const void *param, u8 event, u32 timeout,
+				  struct sock *sk);
+int __hci_cmd_sync_status(struct hci_dev *hdev, u16 opcode, u32 plen,
+			  const void *param, u32 timeout);
+int __hci_cmd_sync_status_sk(struct hci_dev *hdev, u16 opcode, u32 plen,
+			     const void *param, u8 event, u32 timeout,
+			     struct sock *sk);
+
+void hci_cmd_sync_init(struct hci_dev *hdev);
+void hci_cmd_sync_clear(struct hci_dev *hdev);
+
+int hci_cmd_sync_queue(struct hci_dev *hdev, hci_cmd_sync_work_func_t func,
+		       void *data, hci_cmd_sync_work_destroy_t destroy);
diff --git a/net/bluetooth/Makefile b/net/bluetooth/Makefile
index 291770fc9551..a52bba8500e1 100644
--- a/net/bluetooth/Makefile
+++ b/net/bluetooth/Makefile
@@ -15,7 +15,7 @@ bluetooth_6lowpan-y := 6lowpan.o
 bluetooth-y := af_bluetooth.o hci_core.o hci_conn.o hci_event.o mgmt.o \
 	hci_sock.o hci_sysfs.o l2cap_core.o l2cap_sock.o smp.o lib.o \
 	ecdh_helper.o hci_request.o mgmt_util.o mgmt_config.o hci_codec.o \
-	eir.o
+	eir.o hci_sync.o
 
 bluetooth-$(CONFIG_BT_BREDR) += sco.o
 bluetooth-$(CONFIG_BT_HS) += a2mp.o amp.o
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 98533def61a3..fdc1cce5eb5b 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -3747,6 +3747,8 @@ struct hci_dev *hci_alloc_dev_priv(int sizeof_priv)
 	INIT_WORK(&hdev->error_reset, hci_error_reset);
 	INIT_WORK(&hdev->suspend_prepare, hci_prepare_suspend);
 
+	hci_cmd_sync_init(hdev);
+
 	INIT_DELAYED_WORK(&hdev->power_off, hci_power_off);
 
 	skb_queue_head_init(&hdev->rx_q);
@@ -3905,6 +3907,8 @@ void hci_unregister_dev(struct hci_dev *hdev)
 
 	cancel_work_sync(&hdev->power_on);
 
+	hci_cmd_sync_clear(hdev);
+
 	if (!test_bit(HCI_QUIRK_NO_SUSPEND_NOTIFIER, &hdev->quirks)) {
 		hci_suspend_clear_tasks(hdev);
 		unregister_pm_notifier(&hdev->suspend_notifier);
@@ -4271,25 +4275,6 @@ void *hci_sent_cmd_data(struct hci_dev *hdev, __u16 opcode)
 	return hdev->sent_cmd->data + HCI_COMMAND_HDR_SIZE;
 }
 
-/* Send HCI command and wait for command complete event */
-struct sk_buff *hci_cmd_sync(struct hci_dev *hdev, u16 opcode, u32 plen,
-			     const void *param, u32 timeout)
-{
-	struct sk_buff *skb;
-
-	if (!test_bit(HCI_UP, &hdev->flags))
-		return ERR_PTR(-ENETDOWN);
-
-	bt_dev_dbg(hdev, "opcode 0x%4.4x plen %d", opcode, plen);
-
-	hci_req_sync_lock(hdev);
-	skb = __hci_cmd_sync(hdev, opcode, plen, param, timeout);
-	hci_req_sync_unlock(hdev);
-
-	return skb;
-}
-EXPORT_SYMBOL(hci_cmd_sync);
-
 /* Send ACL data */
 static void hci_add_acl_hdr(struct sk_buff *skb, __u16 handle, __u16 flags)
 {
diff --git a/net/bluetooth/hci_request.c b/net/bluetooth/hci_request.c
index 92611bfc0b9e..c98340bba5c7 100644
--- a/net/bluetooth/hci_request.c
+++ b/net/bluetooth/hci_request.c
@@ -32,10 +32,6 @@
 #include "msft.h"
 #include "eir.h"
 
-#define HCI_REQ_DONE	  0
-#define HCI_REQ_PEND	  1
-#define HCI_REQ_CANCELED  2
-
 void hci_req_init(struct hci_request *req, struct hci_dev *hdev)
 {
 	skb_queue_head_init(&req->cmd_q);
@@ -126,70 +122,6 @@ void hci_req_sync_cancel(struct hci_dev *hdev, int err)
 	}
 }
 
-struct sk_buff *__hci_cmd_sync_ev(struct hci_dev *hdev, u16 opcode, u32 plen,
-				  const void *param, u8 event, u32 timeout)
-{
-	struct hci_request req;
-	struct sk_buff *skb;
-	int err = 0;
-
-	bt_dev_dbg(hdev, "");
-
-	hci_req_init(&req, hdev);
-
-	hci_req_add_ev(&req, opcode, plen, param, event);
-
-	hdev->req_status = HCI_REQ_PEND;
-
-	err = hci_req_run_skb(&req, hci_req_sync_complete);
-	if (err < 0)
-		return ERR_PTR(err);
-
-	err = wait_event_interruptible_timeout(hdev->req_wait_q,
-			hdev->req_status != HCI_REQ_PEND, timeout);
-
-	if (err == -ERESTARTSYS)
-		return ERR_PTR(-EINTR);
-
-	switch (hdev->req_status) {
-	case HCI_REQ_DONE:
-		err = -bt_to_errno(hdev->req_result);
-		break;
-
-	case HCI_REQ_CANCELED:
-		err = -hdev->req_result;
-		break;
-
-	default:
-		err = -ETIMEDOUT;
-		break;
-	}
-
-	hdev->req_status = hdev->req_result = 0;
-	skb = hdev->req_skb;
-	hdev->req_skb = NULL;
-
-	bt_dev_dbg(hdev, "end: err %d", err);
-
-	if (err < 0) {
-		kfree_skb(skb);
-		return ERR_PTR(err);
-	}
-
-	if (!skb)
-		return ERR_PTR(-ENODATA);
-
-	return skb;
-}
-EXPORT_SYMBOL(__hci_cmd_sync_ev);
-
-struct sk_buff *__hci_cmd_sync(struct hci_dev *hdev, u16 opcode, u32 plen,
-			       const void *param, u32 timeout)
-{
-	return __hci_cmd_sync_ev(hdev, opcode, plen, param, 0, timeout);
-}
-EXPORT_SYMBOL(__hci_cmd_sync);
-
 /* Execute request and wait for completion. */
 int __hci_req_sync(struct hci_dev *hdev, int (*func)(struct hci_request *req,
 						     unsigned long opt),
diff --git a/net/bluetooth/hci_request.h b/net/bluetooth/hci_request.h
index f31420f58525..74c5de5970a7 100644
--- a/net/bluetooth/hci_request.h
+++ b/net/bluetooth/hci_request.h
@@ -25,6 +25,10 @@
 #define hci_req_sync_lock(hdev)   mutex_lock(&hdev->req_lock)
 #define hci_req_sync_unlock(hdev) mutex_unlock(&hdev->req_lock)
 
+#define HCI_REQ_DONE	  0
+#define HCI_REQ_PEND	  1
+#define HCI_REQ_CANCELED  2
+
 struct hci_request {
 	struct hci_dev		*hdev;
 	struct sk_buff_head	cmd_q;
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
new file mode 100644
index 000000000000..b2048287fe90
--- /dev/null
+++ b/net/bluetooth/hci_sync.c
@@ -0,0 +1,330 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * BlueZ - Bluetooth protocol stack for Linux
+ *
+ * Copyright (C) 2021 Intel Corporation
+ */
+
+#include <net/bluetooth/bluetooth.h>
+#include <net/bluetooth/hci_core.h>
+#include <net/bluetooth/mgmt.h>
+
+#include "hci_request.h"
+#include "smp.h"
+
+static void hci_cmd_sync_complete(struct hci_dev *hdev, u8 result, u16 opcode,
+				  struct sk_buff *skb)
+{
+	bt_dev_dbg(hdev, "result 0x%2.2x", result);
+
+	if (hdev->req_status != HCI_REQ_PEND)
+		return;
+
+	hdev->req_result = result;
+	hdev->req_status = HCI_REQ_DONE;
+
+	wake_up_interruptible(&hdev->req_wait_q);
+}
+
+static struct sk_buff *hci_cmd_sync_alloc(struct hci_dev *hdev, u16 opcode,
+					  u32 plen, const void *param,
+					  struct sock *sk)
+{
+	int len = HCI_COMMAND_HDR_SIZE + plen;
+	struct hci_command_hdr *hdr;
+	struct sk_buff *skb;
+
+	skb = bt_skb_alloc(len, GFP_ATOMIC);
+	if (!skb)
+		return NULL;
+
+	hdr = skb_put(skb, HCI_COMMAND_HDR_SIZE);
+	hdr->opcode = cpu_to_le16(opcode);
+	hdr->plen   = plen;
+
+	if (plen)
+		skb_put_data(skb, param, plen);
+
+	bt_dev_dbg(hdev, "skb len %d", skb->len);
+
+	hci_skb_pkt_type(skb) = HCI_COMMAND_PKT;
+	hci_skb_opcode(skb) = opcode;
+
+	return skb;
+}
+
+static void hci_cmd_sync_add(struct hci_request *req, u16 opcode, u32 plen,
+			     const void *param, u8 event, struct sock *sk)
+{
+	struct hci_dev *hdev = req->hdev;
+	struct sk_buff *skb;
+
+	bt_dev_dbg(hdev, "opcode 0x%4.4x plen %d", opcode, plen);
+
+	/* If an error occurred during request building, there is no point in
+	 * queueing the HCI command. We can simply return.
+	 */
+	if (req->err)
+		return;
+
+	skb = hci_cmd_sync_alloc(hdev, opcode, plen, param, sk);
+	if (!skb) {
+		bt_dev_err(hdev, "no memory for command (opcode 0x%4.4x)",
+			   opcode);
+		req->err = -ENOMEM;
+		return;
+	}
+
+	if (skb_queue_empty(&req->cmd_q))
+		bt_cb(skb)->hci.req_flags |= HCI_REQ_START;
+
+	bt_cb(skb)->hci.req_event = event;
+
+	skb_queue_tail(&req->cmd_q, skb);
+}
+
+static int hci_cmd_sync_run(struct hci_request *req)
+{
+	struct hci_dev *hdev = req->hdev;
+	struct sk_buff *skb;
+	unsigned long flags;
+
+	bt_dev_dbg(hdev, "length %u", skb_queue_len(&req->cmd_q));
+
+	/* If an error occurred during request building, remove all HCI
+	 * commands queued on the HCI request queue.
+	 */
+	if (req->err) {
+		skb_queue_purge(&req->cmd_q);
+		return req->err;
+	}
+
+	/* Do not allow empty requests */
+	if (skb_queue_empty(&req->cmd_q))
+		return -ENODATA;
+
+	skb = skb_peek_tail(&req->cmd_q);
+	bt_cb(skb)->hci.req_complete_skb = hci_cmd_sync_complete;
+	bt_cb(skb)->hci.req_flags |= HCI_REQ_SKB;
+
+	spin_lock_irqsave(&hdev->cmd_q.lock, flags);
+	skb_queue_splice_tail(&req->cmd_q, &hdev->cmd_q);
+	spin_unlock_irqrestore(&hdev->cmd_q.lock, flags);
+
+	queue_work(hdev->workqueue, &hdev->cmd_work);
+
+	return 0;
+}
+
+/* This function requires the caller holds hdev->req_lock. */
+struct sk_buff *__hci_cmd_sync_sk(struct hci_dev *hdev, u16 opcode, u32 plen,
+				  const void *param, u8 event, u32 timeout,
+				  struct sock *sk)
+{
+	struct hci_request req;
+	struct sk_buff *skb;
+	int err = 0;
+
+	bt_dev_dbg(hdev, "");
+
+	hci_req_init(&req, hdev);
+
+	hci_cmd_sync_add(&req, opcode, plen, param, event, sk);
+
+	hdev->req_status = HCI_REQ_PEND;
+
+	err = hci_cmd_sync_run(&req);
+	if (err < 0)
+		return ERR_PTR(err);
+
+	err = wait_event_interruptible_timeout(hdev->req_wait_q,
+					       hdev->req_status != HCI_REQ_PEND,
+					       timeout);
+
+	if (err == -ERESTARTSYS)
+		return ERR_PTR(-EINTR);
+
+	switch (hdev->req_status) {
+	case HCI_REQ_DONE:
+		err = -bt_to_errno(hdev->req_result);
+		break;
+
+	case HCI_REQ_CANCELED:
+		err = -hdev->req_result;
+		break;
+
+	default:
+		err = -ETIMEDOUT;
+		break;
+	}
+
+	hdev->req_status = 0;
+	hdev->req_result = 0;
+	skb = hdev->req_skb;
+	hdev->req_skb = NULL;
+
+	bt_dev_dbg(hdev, "end: err %d", err);
+
+	if (err < 0) {
+		kfree_skb(skb);
+		return ERR_PTR(err);
+	}
+
+	if (!skb)
+		return ERR_PTR(-ENODATA);
+
+	return skb;
+}
+EXPORT_SYMBOL(__hci_cmd_sync_sk);
+
+/* This function requires the caller holds hdev->req_lock. */
+struct sk_buff *__hci_cmd_sync(struct hci_dev *hdev, u16 opcode, u32 plen,
+			       const void *param, u32 timeout)
+{
+	return __hci_cmd_sync_sk(hdev, opcode, plen, param, 0, timeout, NULL);
+}
+EXPORT_SYMBOL(__hci_cmd_sync);
+
+/* Send HCI command and wait for command complete event */
+struct sk_buff *hci_cmd_sync(struct hci_dev *hdev, u16 opcode, u32 plen,
+			     const void *param, u32 timeout)
+{
+	struct sk_buff *skb;
+
+	if (!test_bit(HCI_UP, &hdev->flags))
+		return ERR_PTR(-ENETDOWN);
+
+	bt_dev_dbg(hdev, "opcode 0x%4.4x plen %d", opcode, plen);
+
+	hci_req_sync_lock(hdev);
+	skb = __hci_cmd_sync(hdev, opcode, plen, param, timeout);
+	hci_req_sync_unlock(hdev);
+
+	return skb;
+}
+EXPORT_SYMBOL(hci_cmd_sync);
+
+/* This function requires the caller holds hdev->req_lock. */
+struct sk_buff *__hci_cmd_sync_ev(struct hci_dev *hdev, u16 opcode, u32 plen,
+				  const void *param, u8 event, u32 timeout)
+{
+	return __hci_cmd_sync_sk(hdev, opcode, plen, param, event, timeout,
+				 NULL);
+}
+EXPORT_SYMBOL(__hci_cmd_sync_ev);
+
+/* This function requires the caller holds hdev->req_lock. */
+int __hci_cmd_sync_status_sk(struct hci_dev *hdev, u16 opcode, u32 plen,
+			     const void *param, u8 event, u32 timeout,
+			     struct sock *sk)
+{
+	struct sk_buff *skb;
+	u8 status;
+
+	skb = __hci_cmd_sync_sk(hdev, opcode, plen, param, event, timeout, sk);
+	if (IS_ERR_OR_NULL(skb)) {
+		bt_dev_err(hdev, "Opcode 0x%4x failed: %ld", opcode,
+			   PTR_ERR(skb));
+		return PTR_ERR(skb);
+	}
+
+	status = skb->data[0];
+
+	kfree_skb(skb);
+
+	return status;
+}
+EXPORT_SYMBOL(__hci_cmd_sync_status_sk);
+
+int __hci_cmd_sync_status(struct hci_dev *hdev, u16 opcode, u32 plen,
+			  const void *param, u32 timeout)
+{
+	return __hci_cmd_sync_status_sk(hdev, opcode, plen, param, 0, timeout,
+					NULL);
+}
+EXPORT_SYMBOL(__hci_cmd_sync_status);
+
+static void hci_cmd_sync_work(struct work_struct *work)
+{
+	struct hci_dev *hdev = container_of(work, struct hci_dev, cmd_sync_work);
+	struct hci_cmd_sync_work_entry *entry;
+	hci_cmd_sync_work_func_t func;
+	hci_cmd_sync_work_destroy_t destroy;
+	void *data;
+
+	bt_dev_dbg(hdev, "");
+
+	mutex_lock(&hdev->cmd_sync_work_lock);
+	entry = list_first_entry(&hdev->cmd_sync_work_list,
+				 struct hci_cmd_sync_work_entry, list);
+	if (entry) {
+		list_del(&entry->list);
+		func = entry->func;
+		data = entry->data;
+		destroy = entry->destroy;
+		kfree(entry);
+	} else {
+		func = NULL;
+		data = NULL;
+		destroy = NULL;
+	}
+	mutex_unlock(&hdev->cmd_sync_work_lock);
+
+	if (func) {
+		int err;
+
+		hci_req_sync_lock(hdev);
+
+		err = func(hdev, data);
+
+		if (destroy)
+			destroy(hdev, data, err);
+
+		hci_req_sync_unlock(hdev);
+	}
+}
+
+void hci_cmd_sync_init(struct hci_dev *hdev)
+{
+	INIT_WORK(&hdev->cmd_sync_work, hci_cmd_sync_work);
+	INIT_LIST_HEAD(&hdev->cmd_sync_work_list);
+	mutex_init(&hdev->cmd_sync_work_lock);
+}
+
+void hci_cmd_sync_clear(struct hci_dev *hdev)
+{
+	struct hci_cmd_sync_work_entry *entry, *tmp;
+
+	cancel_work_sync(&hdev->cmd_sync_work);
+
+	list_for_each_entry_safe(entry, tmp, &hdev->cmd_sync_work_list, list) {
+		if (entry->destroy)
+			entry->destroy(hdev, entry->data, -ECANCELED);
+
+		list_del(&entry->list);
+		kfree(entry);
+	}
+}
+
+int hci_cmd_sync_queue(struct hci_dev *hdev, hci_cmd_sync_work_func_t func,
+		       void *data, hci_cmd_sync_work_destroy_t destroy)
+{
+	struct hci_cmd_sync_work_entry *entry;
+
+	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
+	if (!entry)
+		return -ENOMEM;
+
+	entry->func = func;
+	entry->data = data;
+	entry->destroy = destroy;
+
+	mutex_lock(&hdev->cmd_sync_work_lock);
+	list_add_tail(&entry->list, &hdev->cmd_sync_work_list);
+	mutex_unlock(&hdev->cmd_sync_work_lock);
+
+	queue_work(hdev->req_workqueue, &hdev->cmd_sync_work);
+
+	return 0;
+}
+EXPORT_SYMBOL(hci_cmd_sync_queue);
-- 
2.31.1

