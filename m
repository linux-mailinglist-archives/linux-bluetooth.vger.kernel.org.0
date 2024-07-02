Return-Path: <linux-bluetooth+bounces-5786-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2C49247DE
	for <lists+linux-bluetooth@lfdr.de>; Tue,  2 Jul 2024 21:12:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CFB21F21AFB
	for <lists+linux-bluetooth@lfdr.de>; Tue,  2 Jul 2024 19:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00A41BE871;
	Tue,  2 Jul 2024 19:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0OgU6fr"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5E216C440
	for <linux-bluetooth@vger.kernel.org>; Tue,  2 Jul 2024 19:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719947533; cv=none; b=At1fIi95X4Ao0trZJgy5jdsyUS4Z2fDcO+eZRoLP+amiMMJQwVyCgFGPyFppUncyqU/5egsEHiJjJean2ingKZ/5ybBmLdzZ/Jraop+ApLq2JTAC7FoO7FOTB0BKf/jaYbPptZgSNIXx0dTrIM6DMEhFiHMUhNCoJWEi5fFCy3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719947533; c=relaxed/simple;
	bh=wF5U5BtUrGlhIpJN9vWGOAxzzjQDAoOgh9psKTPIEm0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ea+Rlm6FR9VndyTgYhVEH/nhxtsGsCo1rki8PxR5OwUo+wfAZjoMr77+PeXikXkccmdpWLKEyQgLRX0U6qWNxDv2tME3FHblNwVKQLY24RGySVXdaB+MYvxXXky5bw2PKyQ5neqFYpifRfHv8j6gwsnCWFGVdbff9AVsglPzCuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a0OgU6fr; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-81015861ca6so98902241.1
        for <linux-bluetooth@vger.kernel.org>; Tue, 02 Jul 2024 12:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719947529; x=1720552329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fAfBRTh5HFeX243e9Ycx2wmRUD2PH8qDqNwbezVXGOs=;
        b=a0OgU6frfhXe8f3eCOtjj1o44KzVBrevCvc0z3PVf2nr+002+pZi+Om9Jk8vO16zQo
         mhMOQ8wbAlWQJJjPHrnbMfkdcf9X5UFfZGvccN1Zh10vKP+lsTpViQFrNw77QLVPxoqv
         MrqvN6rDYXDNyw5MoIOPJLLAlif1YFy3/QAxA+Sk2//Iw6VpM/cEC6OWQp3Z3todPA3e
         xkUQSOkc//xoOTi0RreIHcP7tWRqmT1e6rO+pHIIF2Ka6L829q0JGJOu3FYFY8uNLHcO
         OwwBlIYEKHjAw6+eYjAujtyRcdKsQXxwZVAAPczl7KeaYWfmWU8Hgm+w4ALRbcXr+kB3
         oVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719947529; x=1720552329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fAfBRTh5HFeX243e9Ycx2wmRUD2PH8qDqNwbezVXGOs=;
        b=ggLW5Y0GeDdWM+w+Mll+JiYxABHixwfZTvO4vFl6eRwZxa4buyWa6UjovqxC2+/teB
         XgPPMigcQ1JTwSITABtXIMfZxliDat6xU5jPewbHei2biLBOq1bn/H5jxjs1L6VbuyF6
         h65nRLgJ9ZDqTWI4dhyFvgMEblfNbT+tT/YUWZh+MlmW3feQd7OJvug+Md2F6Mm/riE3
         H2lHChqLKRUto/Lzo65V7uQ1tU7e8cB+B6th60ELxnyIbthabDJFbdZEk5F9Vvgq/emZ
         Plzz7vtSwu++DpwzPEvc1gPE7U9B0FqxwLIhjfaqDryoYXHMvXDmvusxa4+XFQS8Khs/
         1cCA==
X-Gm-Message-State: AOJu0YzVaKYwO1vQ8zVcOBkEc2tmUkpmo2Q2Hhik5o9aqt8kS3yHubkr
	1jbkHYvS9YFpGUH2p5FM2BQ4MIgATtnfQuKV9vYyFxraEbRHqPTCH0oZVQ==
X-Google-Smtp-Source: AGHT+IH4J45MLH+l3b8W8zVLqrEdvJ/QM5wIx8XfIos49inLCzGKZbrkOqBfZ8nglEeMgG7YNfF4aw==
X-Received: by 2002:a05:6122:3982:b0:4ef:530b:9d56 with SMTP id 71dfb90a1353d-4f2a566377dmr11487542e0c.6.1719947528335;
        Tue, 02 Jul 2024 12:12:08 -0700 (PDT)
Received: from lvondent-mobl4.. (syn-107-146-107-067.res.spectrum.com. [107.146.107.67])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-4f292259618sm1383232e0c.37.2024.07.02.12.12.06
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 12:12:06 -0700 (PDT)
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH v2 5/5] Bluetooth: Remove hci_request.{c,h}
Date: Tue,  2 Jul 2024 15:11:57 -0400
Message-ID: <20240702191157.1722089-5-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702191157.1722089-1-luiz.dentz@gmail.com>
References: <20240702191157.1722089-1-luiz.dentz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This removes hci_request.{c,h} since it shall no longer be used.

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 include/net/bluetooth/bluetooth.h |   4 +
 net/bluetooth/Makefile            |   3 +-
 net/bluetooth/hci_conn.c          |   1 -
 net/bluetooth/hci_core.c          |   1 -
 net/bluetooth/hci_debugfs.c       |   1 -
 net/bluetooth/hci_event.c         |   1 -
 net/bluetooth/hci_request.c       | 903 ------------------------------
 net/bluetooth/hci_request.h       |  54 --
 net/bluetooth/mgmt.c              |   1 -
 net/bluetooth/msft.c              |   1 -
 10 files changed, 5 insertions(+), 965 deletions(-)
 delete mode 100644 net/bluetooth/hci_request.c
 delete mode 100644 net/bluetooth/hci_request.h

diff --git a/include/net/bluetooth/bluetooth.h b/include/net/bluetooth/bluetooth.h
index b3228bd6cd6b..5d655e109b2c 100644
--- a/include/net/bluetooth/bluetooth.h
+++ b/include/net/bluetooth/bluetooth.h
@@ -441,6 +441,10 @@ typedef void (*hci_req_complete_t)(struct hci_dev *hdev, u8 status, u16 opcode);
 typedef void (*hci_req_complete_skb_t)(struct hci_dev *hdev, u8 status,
 				       u16 opcode, struct sk_buff *skb);
 
+void hci_req_cmd_complete(struct hci_dev *hdev, u16 opcode, u8 status,
+			  hci_req_complete_t *req_complete,
+			  hci_req_complete_skb_t *req_complete_skb);
+
 #define HCI_REQ_START	BIT(0)
 #define HCI_REQ_SKB	BIT(1)
 
diff --git a/net/bluetooth/Makefile b/net/bluetooth/Makefile
index 628d448d78be..5a3835b7dfcd 100644
--- a/net/bluetooth/Makefile
+++ b/net/bluetooth/Makefile
@@ -14,8 +14,7 @@ bluetooth_6lowpan-y := 6lowpan.o
 
 bluetooth-y := af_bluetooth.o hci_core.o hci_conn.o hci_event.o mgmt.o \
 	hci_sock.o hci_sysfs.o l2cap_core.o l2cap_sock.o smp.o lib.o \
-	ecdh_helper.o hci_request.o mgmt_util.o mgmt_config.o hci_codec.o \
-	eir.o hci_sync.o
+	ecdh_helper.o mgmt_util.o mgmt_config.o hci_codec.o eir.o hci_sync.o
 
 bluetooth-$(CONFIG_DEV_COREDUMP) += coredump.o
 
diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
index 080053a85b4d..8e48ccd2af30 100644
--- a/net/bluetooth/hci_conn.c
+++ b/net/bluetooth/hci_conn.c
@@ -34,7 +34,6 @@
 #include <net/bluetooth/iso.h>
 #include <net/bluetooth/mgmt.h>
 
-#include "hci_request.h"
 #include "smp.h"
 #include "eir.h"
 
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index fc0424ae551e..8a4ebd93adfc 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -40,7 +40,6 @@
 #include <net/bluetooth/l2cap.h>
 #include <net/bluetooth/mgmt.h>
 
-#include "hci_request.h"
 #include "hci_debugfs.h"
 #include "smp.h"
 #include "leds.h"
diff --git a/net/bluetooth/hci_debugfs.c b/net/bluetooth/hci_debugfs.c
index ce3ff2fa72e5..f625074d1f00 100644
--- a/net/bluetooth/hci_debugfs.c
+++ b/net/bluetooth/hci_debugfs.c
@@ -28,7 +28,6 @@
 #include <net/bluetooth/hci_core.h>
 
 #include "smp.h"
-#include "hci_request.h"
 #include "hci_debugfs.h"
 
 #define DEFINE_QUIRK_ATTRIBUTE(__name, __quirk)				      \
diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 4611a67d7dcc..dce8035ca799 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -33,7 +33,6 @@
 #include <net/bluetooth/hci_core.h>
 #include <net/bluetooth/mgmt.h>
 
-#include "hci_request.h"
 #include "hci_debugfs.h"
 #include "hci_codec.h"
 #include "smp.h"
diff --git a/net/bluetooth/hci_request.c b/net/bluetooth/hci_request.c
deleted file mode 100644
index efea25eb56ce..000000000000
--- a/net/bluetooth/hci_request.c
+++ /dev/null
@@ -1,903 +0,0 @@
-/*
-   BlueZ - Bluetooth protocol stack for Linux
-
-   Copyright (C) 2014 Intel Corporation
-
-   This program is free software; you can redistribute it and/or modify
-   it under the terms of the GNU General Public License version 2 as
-   published by the Free Software Foundation;
-
-   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
-   OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT OF THIRD PARTY RIGHTS.
-   IN NO EVENT SHALL THE COPYRIGHT HOLDER(S) AND AUTHOR(S) BE LIABLE FOR ANY
-   CLAIM, OR ANY SPECIAL INDIRECT OR CONSEQUENTIAL DAMAGES, OR ANY DAMAGES
-   WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
-   ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
-   OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
-
-   ALL LIABILITY, INCLUDING LIABILITY FOR INFRINGEMENT OF ANY PATENTS,
-   COPYRIGHTS, TRADEMARKS OR OTHER RIGHTS, RELATING TO USE OF THIS
-   SOFTWARE IS DISCLAIMED.
-*/
-
-#include <linux/sched/signal.h>
-
-#include <net/bluetooth/bluetooth.h>
-#include <net/bluetooth/hci_core.h>
-#include <net/bluetooth/mgmt.h>
-
-#include "smp.h"
-#include "hci_request.h"
-#include "msft.h"
-#include "eir.h"
-
-void hci_req_init(struct hci_request *req, struct hci_dev *hdev)
-{
-	skb_queue_head_init(&req->cmd_q);
-	req->hdev = hdev;
-	req->err = 0;
-}
-
-void hci_req_purge(struct hci_request *req)
-{
-	skb_queue_purge(&req->cmd_q);
-}
-
-bool hci_req_status_pend(struct hci_dev *hdev)
-{
-	return hdev->req_status == HCI_REQ_PEND;
-}
-
-static int req_run(struct hci_request *req, hci_req_complete_t complete,
-		   hci_req_complete_skb_t complete_skb)
-{
-	struct hci_dev *hdev = req->hdev;
-	struct sk_buff *skb;
-	unsigned long flags;
-
-	bt_dev_dbg(hdev, "length %u", skb_queue_len(&req->cmd_q));
-
-	/* If an error occurred during request building, remove all HCI
-	 * commands queued on the HCI request queue.
-	 */
-	if (req->err) {
-		skb_queue_purge(&req->cmd_q);
-		return req->err;
-	}
-
-	/* Do not allow empty requests */
-	if (skb_queue_empty(&req->cmd_q))
-		return -ENODATA;
-
-	skb = skb_peek_tail(&req->cmd_q);
-	if (complete) {
-		bt_cb(skb)->hci.req_complete = complete;
-	} else if (complete_skb) {
-		bt_cb(skb)->hci.req_complete_skb = complete_skb;
-		bt_cb(skb)->hci.req_flags |= HCI_REQ_SKB;
-	}
-
-	spin_lock_irqsave(&hdev->cmd_q.lock, flags);
-	skb_queue_splice_tail(&req->cmd_q, &hdev->cmd_q);
-	spin_unlock_irqrestore(&hdev->cmd_q.lock, flags);
-
-	queue_work(hdev->workqueue, &hdev->cmd_work);
-
-	return 0;
-}
-
-int hci_req_run(struct hci_request *req, hci_req_complete_t complete)
-{
-	return req_run(req, complete, NULL);
-}
-
-int hci_req_run_skb(struct hci_request *req, hci_req_complete_skb_t complete)
-{
-	return req_run(req, NULL, complete);
-}
-
-void hci_req_sync_complete(struct hci_dev *hdev, u8 result, u16 opcode,
-			   struct sk_buff *skb)
-{
-	bt_dev_dbg(hdev, "result 0x%2.2x", result);
-
-	if (hdev->req_status == HCI_REQ_PEND) {
-		hdev->req_result = result;
-		hdev->req_status = HCI_REQ_DONE;
-		if (skb) {
-			kfree_skb(hdev->req_skb);
-			hdev->req_skb = skb_get(skb);
-		}
-		wake_up_interruptible(&hdev->req_wait_q);
-	}
-}
-
-/* Execute request and wait for completion. */
-int __hci_req_sync(struct hci_dev *hdev, int (*func)(struct hci_request *req,
-						     unsigned long opt),
-		   unsigned long opt, u32 timeout, u8 *hci_status)
-{
-	struct hci_request req;
-	int err = 0;
-
-	bt_dev_dbg(hdev, "start");
-
-	hci_req_init(&req, hdev);
-
-	hdev->req_status = HCI_REQ_PEND;
-
-	err = func(&req, opt);
-	if (err) {
-		if (hci_status)
-			*hci_status = HCI_ERROR_UNSPECIFIED;
-		return err;
-	}
-
-	err = hci_req_run_skb(&req, hci_req_sync_complete);
-	if (err < 0) {
-		hdev->req_status = 0;
-
-		/* ENODATA means the HCI request command queue is empty.
-		 * This can happen when a request with conditionals doesn't
-		 * trigger any commands to be sent. This is normal behavior
-		 * and should not trigger an error return.
-		 */
-		if (err == -ENODATA) {
-			if (hci_status)
-				*hci_status = 0;
-			return 0;
-		}
-
-		if (hci_status)
-			*hci_status = HCI_ERROR_UNSPECIFIED;
-
-		return err;
-	}
-
-	err = wait_event_interruptible_timeout(hdev->req_wait_q,
-			hdev->req_status != HCI_REQ_PEND, timeout);
-
-	if (err == -ERESTARTSYS)
-		return -EINTR;
-
-	switch (hdev->req_status) {
-	case HCI_REQ_DONE:
-		err = -bt_to_errno(hdev->req_result);
-		if (hci_status)
-			*hci_status = hdev->req_result;
-		break;
-
-	case HCI_REQ_CANCELED:
-		err = -hdev->req_result;
-		if (hci_status)
-			*hci_status = HCI_ERROR_UNSPECIFIED;
-		break;
-
-	default:
-		err = -ETIMEDOUT;
-		if (hci_status)
-			*hci_status = HCI_ERROR_UNSPECIFIED;
-		break;
-	}
-
-	kfree_skb(hdev->req_skb);
-	hdev->req_skb = NULL;
-	hdev->req_status = hdev->req_result = 0;
-
-	bt_dev_dbg(hdev, "end: err %d", err);
-
-	return err;
-}
-
-int hci_req_sync(struct hci_dev *hdev, int (*req)(struct hci_request *req,
-						  unsigned long opt),
-		 unsigned long opt, u32 timeout, u8 *hci_status)
-{
-	int ret;
-
-	/* Serialize all requests */
-	hci_req_sync_lock(hdev);
-	/* check the state after obtaing the lock to protect the HCI_UP
-	 * against any races from hci_dev_do_close when the controller
-	 * gets removed.
-	 */
-	if (test_bit(HCI_UP, &hdev->flags))
-		ret = __hci_req_sync(hdev, req, opt, timeout, hci_status);
-	else
-		ret = -ENETDOWN;
-	hci_req_sync_unlock(hdev);
-
-	return ret;
-}
-
-struct sk_buff *hci_prepare_cmd(struct hci_dev *hdev, u16 opcode, u32 plen,
-				const void *param)
-{
-	int len = HCI_COMMAND_HDR_SIZE + plen;
-	struct hci_command_hdr *hdr;
-	struct sk_buff *skb;
-
-	skb = bt_skb_alloc(len, GFP_ATOMIC);
-	if (!skb)
-		return NULL;
-
-	hdr = skb_put(skb, HCI_COMMAND_HDR_SIZE);
-	hdr->opcode = cpu_to_le16(opcode);
-	hdr->plen   = plen;
-
-	if (plen)
-		skb_put_data(skb, param, plen);
-
-	bt_dev_dbg(hdev, "skb len %d", skb->len);
-
-	hci_skb_pkt_type(skb) = HCI_COMMAND_PKT;
-	hci_skb_opcode(skb) = opcode;
-
-	return skb;
-}
-
-/* Queue a command to an asynchronous HCI request */
-void hci_req_add_ev(struct hci_request *req, u16 opcode, u32 plen,
-		    const void *param, u8 event)
-{
-	struct hci_dev *hdev = req->hdev;
-	struct sk_buff *skb;
-
-	bt_dev_dbg(hdev, "opcode 0x%4.4x plen %d", opcode, plen);
-
-	/* If an error occurred during request building, there is no point in
-	 * queueing the HCI command. We can simply return.
-	 */
-	if (req->err)
-		return;
-
-	skb = hci_prepare_cmd(hdev, opcode, plen, param);
-	if (!skb) {
-		bt_dev_err(hdev, "no memory for command (opcode 0x%4.4x)",
-			   opcode);
-		req->err = -ENOMEM;
-		return;
-	}
-
-	if (skb_queue_empty(&req->cmd_q))
-		bt_cb(skb)->hci.req_flags |= HCI_REQ_START;
-
-	hci_skb_event(skb) = event;
-
-	skb_queue_tail(&req->cmd_q, skb);
-}
-
-void hci_req_add(struct hci_request *req, u16 opcode, u32 plen,
-		 const void *param)
-{
-	bt_dev_dbg(req->hdev, "HCI_REQ-0x%4.4x", opcode);
-	hci_req_add_ev(req, opcode, plen, param, 0);
-}
-
-static void start_interleave_scan(struct hci_dev *hdev)
-{
-	hdev->interleave_scan_state = INTERLEAVE_SCAN_NO_FILTER;
-	queue_delayed_work(hdev->req_workqueue,
-			   &hdev->interleave_scan, 0);
-}
-
-static bool is_interleave_scanning(struct hci_dev *hdev)
-{
-	return hdev->interleave_scan_state != INTERLEAVE_SCAN_NONE;
-}
-
-static void cancel_interleave_scan(struct hci_dev *hdev)
-{
-	bt_dev_dbg(hdev, "cancelling interleave scan");
-
-	cancel_delayed_work_sync(&hdev->interleave_scan);
-
-	hdev->interleave_scan_state = INTERLEAVE_SCAN_NONE;
-}
-
-/* Return true if interleave_scan wasn't started until exiting this function,
- * otherwise, return false
- */
-static bool __hci_update_interleaved_scan(struct hci_dev *hdev)
-{
-	/* Do interleaved scan only if all of the following are true:
-	 * - There is at least one ADV monitor
-	 * - At least one pending LE connection or one device to be scanned for
-	 * - Monitor offloading is not supported
-	 * If so, we should alternate between allowlist scan and one without
-	 * any filters to save power.
-	 */
-	bool use_interleaving = hci_is_adv_monitoring(hdev) &&
-				!(list_empty(&hdev->pend_le_conns) &&
-				  list_empty(&hdev->pend_le_reports)) &&
-				hci_get_adv_monitor_offload_ext(hdev) ==
-				    HCI_ADV_MONITOR_EXT_NONE;
-	bool is_interleaving = is_interleave_scanning(hdev);
-
-	if (use_interleaving && !is_interleaving) {
-		start_interleave_scan(hdev);
-		bt_dev_dbg(hdev, "starting interleave scan");
-		return true;
-	}
-
-	if (!use_interleaving && is_interleaving)
-		cancel_interleave_scan(hdev);
-
-	return false;
-}
-
-void hci_req_add_le_scan_disable(struct hci_request *req, bool rpa_le_conn)
-{
-	struct hci_dev *hdev = req->hdev;
-
-	if (hdev->scanning_paused) {
-		bt_dev_dbg(hdev, "Scanning is paused for suspend");
-		return;
-	}
-
-	if (use_ext_scan(hdev)) {
-		struct hci_cp_le_set_ext_scan_enable cp;
-
-		memset(&cp, 0, sizeof(cp));
-		cp.enable = LE_SCAN_DISABLE;
-		hci_req_add(req, HCI_OP_LE_SET_EXT_SCAN_ENABLE, sizeof(cp),
-			    &cp);
-	} else {
-		struct hci_cp_le_set_scan_enable cp;
-
-		memset(&cp, 0, sizeof(cp));
-		cp.enable = LE_SCAN_DISABLE;
-		hci_req_add(req, HCI_OP_LE_SET_SCAN_ENABLE, sizeof(cp), &cp);
-	}
-
-	/* Disable address resolution */
-	if (hci_dev_test_flag(hdev, HCI_LL_RPA_RESOLUTION) && !rpa_le_conn) {
-		__u8 enable = 0x00;
-
-		hci_req_add(req, HCI_OP_LE_SET_ADDR_RESOLV_ENABLE, 1, &enable);
-	}
-}
-
-static void del_from_accept_list(struct hci_request *req, bdaddr_t *bdaddr,
-				 u8 bdaddr_type)
-{
-	struct hci_cp_le_del_from_accept_list cp;
-
-	cp.bdaddr_type = bdaddr_type;
-	bacpy(&cp.bdaddr, bdaddr);
-
-	bt_dev_dbg(req->hdev, "Remove %pMR (0x%x) from accept list", &cp.bdaddr,
-		   cp.bdaddr_type);
-	hci_req_add(req, HCI_OP_LE_DEL_FROM_ACCEPT_LIST, sizeof(cp), &cp);
-
-	if (use_ll_privacy(req->hdev)) {
-		struct smp_irk *irk;
-
-		irk = hci_find_irk_by_addr(req->hdev, bdaddr, bdaddr_type);
-		if (irk) {
-			struct hci_cp_le_del_from_resolv_list cp;
-
-			cp.bdaddr_type = bdaddr_type;
-			bacpy(&cp.bdaddr, bdaddr);
-
-			hci_req_add(req, HCI_OP_LE_DEL_FROM_RESOLV_LIST,
-				    sizeof(cp), &cp);
-		}
-	}
-}
-
-/* Adds connection to accept list if needed. On error, returns -1. */
-static int add_to_accept_list(struct hci_request *req,
-			      struct hci_conn_params *params, u8 *num_entries,
-			      bool allow_rpa)
-{
-	struct hci_cp_le_add_to_accept_list cp;
-	struct hci_dev *hdev = req->hdev;
-
-	/* Already in accept list */
-	if (hci_bdaddr_list_lookup(&hdev->le_accept_list, &params->addr,
-				   params->addr_type))
-		return 0;
-
-	/* Select filter policy to accept all advertising */
-	if (*num_entries >= hdev->le_accept_list_size)
-		return -1;
-
-	/* Accept list can not be used with RPAs */
-	if (!allow_rpa &&
-	    !hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY) &&
-	    hci_find_irk_by_addr(hdev, &params->addr, params->addr_type)) {
-		return -1;
-	}
-
-	/* During suspend, only wakeable devices can be in accept list */
-	if (hdev->suspended &&
-	    !(params->flags & HCI_CONN_FLAG_REMOTE_WAKEUP))
-		return 0;
-
-	*num_entries += 1;
-	cp.bdaddr_type = params->addr_type;
-	bacpy(&cp.bdaddr, &params->addr);
-
-	bt_dev_dbg(hdev, "Add %pMR (0x%x) to accept list", &cp.bdaddr,
-		   cp.bdaddr_type);
-	hci_req_add(req, HCI_OP_LE_ADD_TO_ACCEPT_LIST, sizeof(cp), &cp);
-
-	if (use_ll_privacy(hdev)) {
-		struct smp_irk *irk;
-
-		irk = hci_find_irk_by_addr(hdev, &params->addr,
-					   params->addr_type);
-		if (irk) {
-			struct hci_cp_le_add_to_resolv_list cp;
-
-			cp.bdaddr_type = params->addr_type;
-			bacpy(&cp.bdaddr, &params->addr);
-			memcpy(cp.peer_irk, irk->val, 16);
-
-			if (hci_dev_test_flag(hdev, HCI_PRIVACY))
-				memcpy(cp.local_irk, hdev->irk, 16);
-			else
-				memset(cp.local_irk, 0, 16);
-
-			hci_req_add(req, HCI_OP_LE_ADD_TO_RESOLV_LIST,
-				    sizeof(cp), &cp);
-		}
-	}
-
-	return 0;
-}
-
-static u8 update_accept_list(struct hci_request *req)
-{
-	struct hci_dev *hdev = req->hdev;
-	struct hci_conn_params *params;
-	struct bdaddr_list *b;
-	u8 num_entries = 0;
-	bool pend_conn, pend_report;
-	/* We allow usage of accept list even with RPAs in suspend. In the worst
-	 * case, we won't be able to wake from devices that use the privacy1.2
-	 * features. Additionally, once we support privacy1.2 and IRK
-	 * offloading, we can update this to also check for those conditions.
-	 */
-	bool allow_rpa = hdev->suspended;
-
-	if (use_ll_privacy(hdev))
-		allow_rpa = true;
-
-	/* Go through the current accept list programmed into the
-	 * controller one by one and check if that address is still
-	 * in the list of pending connections or list of devices to
-	 * report. If not present in either list, then queue the
-	 * command to remove it from the controller.
-	 */
-	list_for_each_entry(b, &hdev->le_accept_list, list) {
-		pend_conn = hci_pend_le_action_lookup(&hdev->pend_le_conns,
-						      &b->bdaddr,
-						      b->bdaddr_type);
-		pend_report = hci_pend_le_action_lookup(&hdev->pend_le_reports,
-							&b->bdaddr,
-							b->bdaddr_type);
-
-		/* If the device is not likely to connect or report,
-		 * remove it from the accept list.
-		 */
-		if (!pend_conn && !pend_report) {
-			del_from_accept_list(req, &b->bdaddr, b->bdaddr_type);
-			continue;
-		}
-
-		/* Accept list can not be used with RPAs */
-		if (!allow_rpa &&
-		    !hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY) &&
-		    hci_find_irk_by_addr(hdev, &b->bdaddr, b->bdaddr_type)) {
-			return 0x00;
-		}
-
-		num_entries++;
-	}
-
-	/* Since all no longer valid accept list entries have been
-	 * removed, walk through the list of pending connections
-	 * and ensure that any new device gets programmed into
-	 * the controller.
-	 *
-	 * If the list of the devices is larger than the list of
-	 * available accept list entries in the controller, then
-	 * just abort and return filer policy value to not use the
-	 * accept list.
-	 */
-	list_for_each_entry(params, &hdev->pend_le_conns, action) {
-		if (add_to_accept_list(req, params, &num_entries, allow_rpa))
-			return 0x00;
-	}
-
-	/* After adding all new pending connections, walk through
-	 * the list of pending reports and also add these to the
-	 * accept list if there is still space. Abort if space runs out.
-	 */
-	list_for_each_entry(params, &hdev->pend_le_reports, action) {
-		if (add_to_accept_list(req, params, &num_entries, allow_rpa))
-			return 0x00;
-	}
-
-	/* Use the allowlist unless the following conditions are all true:
-	 * - We are not currently suspending
-	 * - There are 1 or more ADV monitors registered and it's not offloaded
-	 * - Interleaved scanning is not currently using the allowlist
-	 */
-	if (!idr_is_empty(&hdev->adv_monitors_idr) && !hdev->suspended &&
-	    hci_get_adv_monitor_offload_ext(hdev) == HCI_ADV_MONITOR_EXT_NONE &&
-	    hdev->interleave_scan_state != INTERLEAVE_SCAN_ALLOWLIST)
-		return 0x00;
-
-	/* Select filter policy to use accept list */
-	return 0x01;
-}
-
-static bool scan_use_rpa(struct hci_dev *hdev)
-{
-	return hci_dev_test_flag(hdev, HCI_PRIVACY);
-}
-
-static void hci_req_start_scan(struct hci_request *req, u8 type, u16 interval,
-			       u16 window, u8 own_addr_type, u8 filter_policy,
-			       bool filter_dup, bool addr_resolv)
-{
-	struct hci_dev *hdev = req->hdev;
-
-	if (hdev->scanning_paused) {
-		bt_dev_dbg(hdev, "Scanning is paused for suspend");
-		return;
-	}
-
-	if (use_ll_privacy(hdev) && addr_resolv) {
-		u8 enable = 0x01;
-
-		hci_req_add(req, HCI_OP_LE_SET_ADDR_RESOLV_ENABLE, 1, &enable);
-	}
-
-	/* Use ext scanning if set ext scan param and ext scan enable is
-	 * supported
-	 */
-	if (use_ext_scan(hdev)) {
-		struct hci_cp_le_set_ext_scan_params *ext_param_cp;
-		struct hci_cp_le_set_ext_scan_enable ext_enable_cp;
-		struct hci_cp_le_scan_phy_params *phy_params;
-		u8 data[sizeof(*ext_param_cp) + sizeof(*phy_params) * 2];
-		u32 plen;
-
-		ext_param_cp = (void *)data;
-		phy_params = (void *)ext_param_cp->data;
-
-		memset(ext_param_cp, 0, sizeof(*ext_param_cp));
-		ext_param_cp->own_addr_type = own_addr_type;
-		ext_param_cp->filter_policy = filter_policy;
-
-		plen = sizeof(*ext_param_cp);
-
-		if (scan_1m(hdev) || scan_2m(hdev)) {
-			ext_param_cp->scanning_phys |= LE_SCAN_PHY_1M;
-
-			memset(phy_params, 0, sizeof(*phy_params));
-			phy_params->type = type;
-			phy_params->interval = cpu_to_le16(interval);
-			phy_params->window = cpu_to_le16(window);
-
-			plen += sizeof(*phy_params);
-			phy_params++;
-		}
-
-		if (scan_coded(hdev)) {
-			ext_param_cp->scanning_phys |= LE_SCAN_PHY_CODED;
-
-			memset(phy_params, 0, sizeof(*phy_params));
-			phy_params->type = type;
-			phy_params->interval = cpu_to_le16(interval);
-			phy_params->window = cpu_to_le16(window);
-
-			plen += sizeof(*phy_params);
-			phy_params++;
-		}
-
-		hci_req_add(req, HCI_OP_LE_SET_EXT_SCAN_PARAMS,
-			    plen, ext_param_cp);
-
-		memset(&ext_enable_cp, 0, sizeof(ext_enable_cp));
-		ext_enable_cp.enable = LE_SCAN_ENABLE;
-		ext_enable_cp.filter_dup = filter_dup;
-
-		hci_req_add(req, HCI_OP_LE_SET_EXT_SCAN_ENABLE,
-			    sizeof(ext_enable_cp), &ext_enable_cp);
-	} else {
-		struct hci_cp_le_set_scan_param param_cp;
-		struct hci_cp_le_set_scan_enable enable_cp;
-
-		memset(&param_cp, 0, sizeof(param_cp));
-		param_cp.type = type;
-		param_cp.interval = cpu_to_le16(interval);
-		param_cp.window = cpu_to_le16(window);
-		param_cp.own_address_type = own_addr_type;
-		param_cp.filter_policy = filter_policy;
-		hci_req_add(req, HCI_OP_LE_SET_SCAN_PARAM, sizeof(param_cp),
-			    &param_cp);
-
-		memset(&enable_cp, 0, sizeof(enable_cp));
-		enable_cp.enable = LE_SCAN_ENABLE;
-		enable_cp.filter_dup = filter_dup;
-		hci_req_add(req, HCI_OP_LE_SET_SCAN_ENABLE, sizeof(enable_cp),
-			    &enable_cp);
-	}
-}
-
-static void set_random_addr(struct hci_request *req, bdaddr_t *rpa);
-static int hci_update_random_address(struct hci_request *req,
-				     bool require_privacy, bool use_rpa,
-				     u8 *own_addr_type)
-{
-	struct hci_dev *hdev = req->hdev;
-	int err;
-
-	/* If privacy is enabled use a resolvable private address. If
-	 * current RPA has expired or there is something else than
-	 * the current RPA in use, then generate a new one.
-	 */
-	if (use_rpa) {
-		/* If Controller supports LL Privacy use own address type is
-		 * 0x03
-		 */
-		if (use_ll_privacy(hdev))
-			*own_addr_type = ADDR_LE_DEV_RANDOM_RESOLVED;
-		else
-			*own_addr_type = ADDR_LE_DEV_RANDOM;
-
-		if (rpa_valid(hdev))
-			return 0;
-
-		err = smp_generate_rpa(hdev, hdev->irk, &hdev->rpa);
-		if (err < 0) {
-			bt_dev_err(hdev, "failed to generate new RPA");
-			return err;
-		}
-
-		set_random_addr(req, &hdev->rpa);
-
-		return 0;
-	}
-
-	/* In case of required privacy without resolvable private address,
-	 * use an non-resolvable private address. This is useful for active
-	 * scanning and non-connectable advertising.
-	 */
-	if (require_privacy) {
-		bdaddr_t nrpa;
-
-		while (true) {
-			/* The non-resolvable private address is generated
-			 * from random six bytes with the two most significant
-			 * bits cleared.
-			 */
-			get_random_bytes(&nrpa, 6);
-			nrpa.b[5] &= 0x3f;
-
-			/* The non-resolvable private address shall not be
-			 * equal to the public address.
-			 */
-			if (bacmp(&hdev->bdaddr, &nrpa))
-				break;
-		}
-
-		*own_addr_type = ADDR_LE_DEV_RANDOM;
-		set_random_addr(req, &nrpa);
-		return 0;
-	}
-
-	/* If forcing static address is in use or there is no public
-	 * address use the static address as random address (but skip
-	 * the HCI command if the current random address is already the
-	 * static one.
-	 *
-	 * In case BR/EDR has been disabled on a dual-mode controller
-	 * and a static address has been configured, then use that
-	 * address instead of the public BR/EDR address.
-	 */
-	if (hci_dev_test_flag(hdev, HCI_FORCE_STATIC_ADDR) ||
-	    !bacmp(&hdev->bdaddr, BDADDR_ANY) ||
-	    (!hci_dev_test_flag(hdev, HCI_BREDR_ENABLED) &&
-	     bacmp(&hdev->static_addr, BDADDR_ANY))) {
-		*own_addr_type = ADDR_LE_DEV_RANDOM;
-		if (bacmp(&hdev->static_addr, &hdev->random_addr))
-			hci_req_add(req, HCI_OP_LE_SET_RANDOM_ADDR, 6,
-				    &hdev->static_addr);
-		return 0;
-	}
-
-	/* Neither privacy nor static address is being used so use a
-	 * public address.
-	 */
-	*own_addr_type = ADDR_LE_DEV_PUBLIC;
-
-	return 0;
-}
-
-/* Ensure to call hci_req_add_le_scan_disable() first to disable the
- * controller based address resolution to be able to reconfigure
- * resolving list.
- */
-void hci_req_add_le_passive_scan(struct hci_request *req)
-{
-	struct hci_dev *hdev = req->hdev;
-	u8 own_addr_type;
-	u8 filter_policy;
-	u16 window, interval;
-	/* Default is to enable duplicates filter */
-	u8 filter_dup = LE_SCAN_FILTER_DUP_ENABLE;
-	/* Background scanning should run with address resolution */
-	bool addr_resolv = true;
-
-	if (hdev->scanning_paused) {
-		bt_dev_dbg(hdev, "Scanning is paused for suspend");
-		return;
-	}
-
-	/* Set require_privacy to false since no SCAN_REQ are send
-	 * during passive scanning. Not using an non-resolvable address
-	 * here is important so that peer devices using direct
-	 * advertising with our address will be correctly reported
-	 * by the controller.
-	 */
-	if (hci_update_random_address(req, false, scan_use_rpa(hdev),
-				      &own_addr_type))
-		return;
-
-	if (hdev->enable_advmon_interleave_scan &&
-	    __hci_update_interleaved_scan(hdev))
-		return;
-
-	bt_dev_dbg(hdev, "interleave state %d", hdev->interleave_scan_state);
-	/* Adding or removing entries from the accept list must
-	 * happen before enabling scanning. The controller does
-	 * not allow accept list modification while scanning.
-	 */
-	filter_policy = update_accept_list(req);
-
-	/* When the controller is using random resolvable addresses and
-	 * with that having LE privacy enabled, then controllers with
-	 * Extended Scanner Filter Policies support can now enable support
-	 * for handling directed advertising.
-	 *
-	 * So instead of using filter polices 0x00 (no accept list)
-	 * and 0x01 (accept list enabled) use the new filter policies
-	 * 0x02 (no accept list) and 0x03 (accept list enabled).
-	 */
-	if (hci_dev_test_flag(hdev, HCI_PRIVACY) &&
-	    (hdev->le_features[0] & HCI_LE_EXT_SCAN_POLICY))
-		filter_policy |= 0x02;
-
-	if (hdev->suspended) {
-		window = hdev->le_scan_window_suspend;
-		interval = hdev->le_scan_int_suspend;
-	} else if (hci_is_le_conn_scanning(hdev)) {
-		window = hdev->le_scan_window_connect;
-		interval = hdev->le_scan_int_connect;
-	} else if (hci_is_adv_monitoring(hdev)) {
-		window = hdev->le_scan_window_adv_monitor;
-		interval = hdev->le_scan_int_adv_monitor;
-
-		/* Disable duplicates filter when scanning for advertisement
-		 * monitor for the following reasons.
-		 *
-		 * For HW pattern filtering (ex. MSFT), Realtek and Qualcomm
-		 * controllers ignore RSSI_Sampling_Period when the duplicates
-		 * filter is enabled.
-		 *
-		 * For SW pattern filtering, when we're not doing interleaved
-		 * scanning, it is necessary to disable duplicates filter,
-		 * otherwise hosts can only receive one advertisement and it's
-		 * impossible to know if a peer is still in range.
-		 */
-		filter_dup = LE_SCAN_FILTER_DUP_DISABLE;
-	} else {
-		window = hdev->le_scan_window;
-		interval = hdev->le_scan_interval;
-	}
-
-	bt_dev_dbg(hdev, "LE passive scan with accept list = %d",
-		   filter_policy);
-	hci_req_start_scan(req, LE_SCAN_PASSIVE, interval, window,
-			   own_addr_type, filter_policy, filter_dup,
-			   addr_resolv);
-}
-
-static int hci_req_add_le_interleaved_scan(struct hci_request *req,
-					   unsigned long opt)
-{
-	struct hci_dev *hdev = req->hdev;
-	int ret = 0;
-
-	hci_dev_lock(hdev);
-
-	if (hci_dev_test_flag(hdev, HCI_LE_SCAN))
-		hci_req_add_le_scan_disable(req, false);
-	hci_req_add_le_passive_scan(req);
-
-	switch (hdev->interleave_scan_state) {
-	case INTERLEAVE_SCAN_ALLOWLIST:
-		bt_dev_dbg(hdev, "next state: allowlist");
-		hdev->interleave_scan_state = INTERLEAVE_SCAN_NO_FILTER;
-		break;
-	case INTERLEAVE_SCAN_NO_FILTER:
-		bt_dev_dbg(hdev, "next state: no filter");
-		hdev->interleave_scan_state = INTERLEAVE_SCAN_ALLOWLIST;
-		break;
-	case INTERLEAVE_SCAN_NONE:
-		BT_ERR("unexpected error");
-		ret = -1;
-	}
-
-	hci_dev_unlock(hdev);
-
-	return ret;
-}
-
-static void interleave_scan_work(struct work_struct *work)
-{
-	struct hci_dev *hdev = container_of(work, struct hci_dev,
-					    interleave_scan.work);
-	u8 status;
-	unsigned long timeout;
-
-	if (hdev->interleave_scan_state == INTERLEAVE_SCAN_ALLOWLIST) {
-		timeout = msecs_to_jiffies(hdev->advmon_allowlist_duration);
-	} else if (hdev->interleave_scan_state == INTERLEAVE_SCAN_NO_FILTER) {
-		timeout = msecs_to_jiffies(hdev->advmon_no_filter_duration);
-	} else {
-		bt_dev_err(hdev, "unexpected error");
-		return;
-	}
-
-	hci_req_sync(hdev, hci_req_add_le_interleaved_scan, 0,
-		     HCI_CMD_TIMEOUT, &status);
-
-	/* Don't continue interleaving if it was canceled */
-	if (is_interleave_scanning(hdev))
-		queue_delayed_work(hdev->req_workqueue,
-				   &hdev->interleave_scan, timeout);
-}
-
-static void set_random_addr(struct hci_request *req, bdaddr_t *rpa)
-{
-	struct hci_dev *hdev = req->hdev;
-
-	/* If we're advertising or initiating an LE connection we can't
-	 * go ahead and change the random address at this time. This is
-	 * because the eventual initiator address used for the
-	 * subsequently created connection will be undefined (some
-	 * controllers use the new address and others the one we had
-	 * when the operation started).
-	 *
-	 * In this kind of scenario skip the update and let the random
-	 * address be updated at the next cycle.
-	 */
-	if (hci_dev_test_flag(hdev, HCI_LE_ADV) ||
-	    hci_lookup_le_connect(hdev)) {
-		bt_dev_dbg(hdev, "Deferring random address update");
-		hci_dev_set_flag(hdev, HCI_RPA_EXPIRED);
-		return;
-	}
-
-	hci_req_add(req, HCI_OP_LE_SET_RANDOM_ADDR, 6, rpa);
-}
-
-void hci_request_setup(struct hci_dev *hdev)
-{
-	INIT_DELAYED_WORK(&hdev->interleave_scan, interleave_scan_work);
-}
-
-void hci_request_cancel_all(struct hci_dev *hdev)
-{
-	hci_cmd_sync_cancel_sync(hdev, ENODEV);
-
-	cancel_interleave_scan(hdev);
-}
diff --git a/net/bluetooth/hci_request.h b/net/bluetooth/hci_request.h
deleted file mode 100644
index b730da4a8b47..000000000000
--- a/net/bluetooth/hci_request.h
+++ /dev/null
@@ -1,54 +0,0 @@
-/*
-   BlueZ - Bluetooth protocol stack for Linux
-   Copyright (C) 2014 Intel Corporation
-
-   This program is free software; you can redistribute it and/or modify
-   it under the terms of the GNU General Public License version 2 as
-   published by the Free Software Foundation;
-
-   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
-   OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT OF THIRD PARTY RIGHTS.
-   IN NO EVENT SHALL THE COPYRIGHT HOLDER(S) AND AUTHOR(S) BE LIABLE FOR ANY
-   CLAIM, OR ANY SPECIAL INDIRECT OR CONSEQUENTIAL DAMAGES, OR ANY DAMAGES
-   WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
-   ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
-   OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
-
-   ALL LIABILITY, INCLUDING LIABILITY FOR INFRINGEMENT OF ANY PATENTS,
-   COPYRIGHTS, TRADEMARKS OR OTHER RIGHTS, RELATING TO USE OF THIS
-   SOFTWARE IS DISCLAIMED.
-*/
-
-#include <asm/unaligned.h>
-
-void hci_req_init(struct hci_request *req, struct hci_dev *hdev);
-void hci_req_purge(struct hci_request *req);
-bool hci_req_status_pend(struct hci_dev *hdev);
-int hci_req_run(struct hci_request *req, hci_req_complete_t complete);
-int hci_req_run_skb(struct hci_request *req, hci_req_complete_skb_t complete);
-void hci_req_sync_complete(struct hci_dev *hdev, u8 result, u16 opcode,
-			   struct sk_buff *skb);
-void hci_req_add(struct hci_request *req, u16 opcode, u32 plen,
-		 const void *param);
-void hci_req_add_ev(struct hci_request *req, u16 opcode, u32 plen,
-		    const void *param, u8 event);
-void hci_req_cmd_complete(struct hci_dev *hdev, u16 opcode, u8 status,
-			  hci_req_complete_t *req_complete,
-			  hci_req_complete_skb_t *req_complete_skb);
-
-int hci_req_sync(struct hci_dev *hdev, int (*req)(struct hci_request *req,
-						  unsigned long opt),
-		 unsigned long opt, u32 timeout, u8 *hci_status);
-int __hci_req_sync(struct hci_dev *hdev, int (*func)(struct hci_request *req,
-						     unsigned long opt),
-		   unsigned long opt, u32 timeout, u8 *hci_status);
-
-struct sk_buff *hci_prepare_cmd(struct hci_dev *hdev, u16 opcode, u32 plen,
-				const void *param);
-
-void hci_req_add_le_scan_disable(struct hci_request *req, bool rpa_le_conn);
-void hci_req_add_le_passive_scan(struct hci_request *req);
-
-void hci_request_setup(struct hci_dev *hdev);
-void hci_request_cancel_all(struct hci_dev *hdev);
diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 3ab1558ff391..40d4887c7f79 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -33,7 +33,6 @@
 #include <net/bluetooth/l2cap.h>
 #include <net/bluetooth/mgmt.h>
 
-#include "hci_request.h"
 #include "smp.h"
 #include "mgmt_util.h"
 #include "mgmt_config.h"
diff --git a/net/bluetooth/msft.c b/net/bluetooth/msft.c
index d039683d3bdd..5a8ccc491b14 100644
--- a/net/bluetooth/msft.c
+++ b/net/bluetooth/msft.c
@@ -7,7 +7,6 @@
 #include <net/bluetooth/hci_core.h>
 #include <net/bluetooth/mgmt.h>
 
-#include "hci_request.h"
 #include "mgmt_util.h"
 #include "msft.h"
 
-- 
2.45.2


