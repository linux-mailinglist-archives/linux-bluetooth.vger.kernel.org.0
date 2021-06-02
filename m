Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35ECA399618
	for <lists+linux-bluetooth@lfdr.de>; Thu,  3 Jun 2021 00:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbhFBW4H (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 2 Jun 2021 18:56:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhFBW4F (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 2 Jun 2021 18:56:05 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A51EAC06174A
        for <linux-bluetooth@vger.kernel.org>; Wed,  2 Jun 2021 15:54:10 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id e22so3534552pgv.10
        for <linux-bluetooth@vger.kernel.org>; Wed, 02 Jun 2021 15:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/ToTqVDmOvX7XXoBAlalYgzdXNvRIhWNnB5k5J+NA+s=;
        b=iFcEq0cRfSc19LxRS0OKRUgkYYekqJ5uwel/061BzHw7lckkg3rCNTtWIEhGGY7+/H
         cKFtySorPxH37LGa0MY8Xe5vi2Uk32OQOvubE037F8+BEwSiZWJU7fhid4QOmdOAm/YP
         nr44wHt8C6KMzitT56ahZPKtygkjU1oOyNYKP9w1/rNjQ31G7yduCvNQdFg+kkZA1Mun
         OvhOmxeSz+IyvjRMyF0+PMs6U32NbUK7vK0EfewjZwqanFzlnULdCTha7zWBIGnzKqnh
         wH6gfr11a54lGugjmOobntvKZ5hSKZEOkqcL8qWN/A84K2YWKBaVbkWxg8lp9/jqu2SJ
         MFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/ToTqVDmOvX7XXoBAlalYgzdXNvRIhWNnB5k5J+NA+s=;
        b=B3U/EK7uaMN4hEayte7aV1j15mXYjj5T1icW2bOXr/qSEQXVVSuVQ2mro/3hNR6Z16
         9d62ctxbUIobE9qrsY+R2G8BTJ5s7uVaACXbn4H2BFiH2Rz/oITAjn0z9CqD3NaG2KYN
         x0DwJb6jxuqr5sRePRB0OIBNbYErGMRYxRhe6KMc/hLpWVjD8VDAImaYRTMhG10uRM3x
         m44JRyFtJ3z4BEasHNo+bdAkaVEvSjafSVw/eTl2R2y2NUtw8bV+1y+zb+0h1RbRIcp7
         Oe3kEA1U1zG5DjdFs4Z+OuXzWSKfa/Zbe6+pomlgpUD9HPnmNkevEG5tf0MbM9mBcsPr
         /xlg==
X-Gm-Message-State: AOAM5332fY1u3xSGP/QFYNkYvSajkEpZEyWYKhw7xiR65VpH+FQTGpMn
        T7XSqP+oNEAO5msBjftZOFfqdj4PdM4=
X-Google-Smtp-Source: ABdhPJzW2H2LXaVDSENTQPPJ1j9p987QzeN98BotaCX9E7cZt9bTkeSBUWCpVGH6gSZ73K5MdRGc4Q==
X-Received: by 2002:a63:f954:: with SMTP id q20mr3872511pgk.451.1622674449634;
        Wed, 02 Jun 2021 15:54:09 -0700 (PDT)
Received: from localhost.localdomain (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id s3sm678578pgs.62.2021.06.02.15.54.09
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 15:54:09 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v2 3/5] Bluetooth: hci_sync: Make use of hci_cmd_sync_queue set 1
Date:   Wed,  2 Jun 2021 15:54:02 -0700
Message-Id: <20210602225404.744891-3-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602225404.744891-1-luiz.dentz@gmail.com>
References: <20210602225404.744891-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This make use of hci_cmd_sync_queue for the following MGMT commands:

Set Device Class
Set Device ID
Add UUID
Remove UUID

tools/mgmt-tester -s "Set Device Class"

Test Summary
------------
Set Device Class - Success 1                         Passed       0.024 seconds
Set Device Class - Success 2                         Passed       0.019 seconds
Set Device Class - Invalid parameters 1              Passed       0.014 seconds
Total: 3, Passed: 3 (100.0%), Failed: 0, Not Run: 0
Overall execution time: 0.0599 seconds

tools/mgmt-tester -s "Set Device ID"

Test Summary
------------
Set Device ID - Success 1                            Passed       0.019 seconds
Set Device ID - Success 2                            Passed       0.016 seconds
Set Device ID - Disable                              Passed       0.014 seconds
Set Device ID - Power off and Power on               Passed       0.019 seconds
Set Device ID - SSP off and Power on                 Passed       0.017 seconds
Set Device ID - Invalid Parameter                    Passed       0.015 seconds
Total: 6, Passed: 6 (100.0%), Failed: 0, Not Run: 0
Overall execution time: 0.107 seconds

tools/mgmt-tester -s "Add UUID"

Test Summary
------------
Add UUID - UUID-16 1                                 Passed       0.023 seconds
Add UUID - UUID-16 multiple 1                        Passed       0.018 seconds
Add UUID - UUID-16 partial 1                         Passed       0.024 seconds
Add UUID - UUID-32 1                                 Passed       0.015 seconds
Add UUID - UUID-32 multiple 1                        Passed       0.017 seconds
Add UUID - UUID-32 partial 1                         Passed       0.020 seconds
Add UUID - UUID-128 1                                Passed       0.016 seconds
Add UUID - UUID-128 multiple 1                       Passed       0.017 seconds
Add UUID - UUID-128 partial 1                        Passed       0.018 seconds
Add UUID - UUID mix                                  Passed       0.017 seconds
Total: 10, Passed: 10 (100.0%), Failed: 0, Not Run: 0
Overall execution time: 0.198 seconds

tools/mgmt-tester -s "Remove UUID"

Test Summary
------------
Remove UUID - Success 1                              Passed       0.022 seconds
Remove UUID - All UUID - Success 2                   Passed       0.017 seconds
Remove UUID - Power Off - Success 3                  Passed       0.015 seconds
Remove UUID - Power Off and On - Success 4           Passed       0.017 seconds
Remove UUID - Not Exist - Invalid Params 1           Passed       0.015 seconds
Total: 5, Passed: 5 (100.0%), Failed: 0, Not Run: 0
Overall execution time: 0.0908 seconds

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 include/net/bluetooth/hci_core.h |   2 +
 net/bluetooth/Makefile           |   2 +-
 net/bluetooth/hci_request.c      |  72 +-----------
 net/bluetooth/hci_request.h      |   6 +
 net/bluetooth/hci_sync.c         | 171 +++++++++++++++++++++++++++
 net/bluetooth/hci_sync.h         |   9 ++
 net/bluetooth/mgmt.c             | 193 +++++++++++++++----------------
 net/bluetooth/mgmt_util.c        |  15 ++-
 net/bluetooth/mgmt_util.h        |   3 +
 9 files changed, 302 insertions(+), 171 deletions(-)
 create mode 100644 net/bluetooth/hci_sync.c
 create mode 100644 net/bluetooth/hci_sync.h

diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index 28f70dca80c9..8fec41f1034f 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -1667,6 +1667,8 @@ struct sk_buff *__hci_cmd_sync(struct hci_dev *hdev, u16 opcode, u32 plen,
 			       const void *param, u32 timeout);
 struct sk_buff *__hci_cmd_sync_ev(struct hci_dev *hdev, u16 opcode, u32 plen,
 				  const void *param, u8 event, u32 timeout);
+int __hci_cmd_sync_status(struct hci_dev *hdev, u16 opcode, u32 plen,
+			  const void *param, u32 timeout);
 int __hci_cmd_send(struct hci_dev *hdev, u16 opcode, u32 plen,
 		   const void *param);
 
diff --git a/net/bluetooth/Makefile b/net/bluetooth/Makefile
index 0276e7d5d7ad..de4e79060851 100644
--- a/net/bluetooth/Makefile
+++ b/net/bluetooth/Makefile
@@ -14,7 +14,7 @@ bluetooth_6lowpan-y := 6lowpan.o
 
 bluetooth-y := af_bluetooth.o hci_core.o hci_conn.o hci_event.o mgmt.o \
 	hci_sock.o hci_sysfs.o l2cap_core.o l2cap_sock.o smp.o lib.o \
-	ecdh_helper.o eir.o hci_request.o mgmt_util.o mgmt_config.o
+	ecdh_helper.o eir.o hci_request.o hci_sync.o mgmt_util.o mgmt_config.o
 
 bluetooth-$(CONFIG_BT_BREDR) += sco.o
 bluetooth-$(CONFIG_BT_HS) += a2mp.o amp.o
diff --git a/net/bluetooth/hci_request.c b/net/bluetooth/hci_request.c
index 7e86637a9933..8bacc8993e32 100644
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
@@ -101,8 +97,8 @@ int hci_req_run_skb(struct hci_request *req, hci_req_complete_skb_t complete)
 	return req_run(req, NULL, complete);
 }
 
-static void hci_req_sync_complete(struct hci_dev *hdev, u8 result, u16 opcode,
-				  struct sk_buff *skb)
+void hci_req_sync_complete(struct hci_dev *hdev, u8 result, u16 opcode,
+			   struct sk_buff *skb)
 {
 	bt_dev_dbg(hdev, "result 0x%2.2x", result);
 
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
index 4824be833169..3234ed99c133 100644
--- a/net/bluetooth/hci_request.h
+++ b/net/bluetooth/hci_request.h
@@ -22,6 +22,10 @@
 
 #include <asm/unaligned.h>
 
+#define HCI_REQ_DONE	  0
+#define HCI_REQ_PEND	  1
+#define HCI_REQ_CANCELED  2
+
 #define hci_req_sync_lock(hdev)   mutex_lock(&hdev->req_lock)
 #define hci_req_sync_unlock(hdev) mutex_unlock(&hdev->req_lock)
 
@@ -40,6 +44,8 @@ void hci_req_purge(struct hci_request *req);
 bool hci_req_status_pend(struct hci_dev *hdev);
 int hci_req_run(struct hci_request *req, hci_req_complete_t complete);
 int hci_req_run_skb(struct hci_request *req, hci_req_complete_skb_t complete);
+void hci_req_sync_complete(struct hci_dev *hdev, u8 result, u16 opcode,
+			   struct sk_buff *skb);
 void hci_req_add(struct hci_request *req, u16 opcode, u32 plen,
 		 const void *param);
 void hci_req_add_ev(struct hci_request *req, u16 opcode, u32 plen,
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
new file mode 100644
index 000000000000..e2ddfdf7c515
--- /dev/null
+++ b/net/bluetooth/hci_sync.c
@@ -0,0 +1,171 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * BlueZ - Bluetooth protocol stack for Linux
+ *
+ * Copyright (C) 2021 Intel Corporation
+ */
+
+#include <net/bluetooth/bluetooth.h>
+#include <net/bluetooth/hci_core.h>
+
+#include "hci_request.h"
+#include "hci_sync.h"
+#include "eir.h"
+
+struct sk_buff *__hci_cmd_sync_ev(struct hci_dev *hdev, u16 opcode, u32 plen,
+				  const void *param, u8 event, u32 timeout)
+{
+	struct hci_request req;
+	struct sk_buff *skb;
+	int err = 0;
+
+	bt_dev_dbg(hdev, "");
+
+	hci_req_init(&req, hdev);
+
+	hci_req_add_ev(&req, opcode, plen, param, event);
+
+	hdev->req_status = HCI_REQ_PEND;
+
+	err = hci_req_run_skb(&req, hci_req_sync_complete);
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
+EXPORT_SYMBOL(__hci_cmd_sync_ev);
+
+struct sk_buff *__hci_cmd_sync(struct hci_dev *hdev, u16 opcode, u32 plen,
+			       const void *param, u32 timeout)
+{
+	return __hci_cmd_sync_ev(hdev, opcode, plen, param, 0, timeout);
+}
+EXPORT_SYMBOL(__hci_cmd_sync);
+
+int __hci_cmd_sync_status(struct hci_dev *hdev, u16 opcode, u32 plen,
+			  const void *param, u32 timeout)
+{
+	struct sk_buff *skb;
+	u8 status;
+
+	skb = __hci_cmd_sync(hdev, opcode, plen, param, timeout);
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
+EXPORT_SYMBOL(__hci_cmd_sync_status);
+
+int hci_update_eir_sync(struct hci_dev *hdev)
+{
+	struct hci_cp_write_eir cp;
+
+	bt_dev_dbg(hdev, "");
+
+	if (!hdev_is_powered(hdev))
+		return 0;
+
+	if (!lmp_ext_inq_capable(hdev))
+		return 0;
+
+	if (!hci_dev_test_flag(hdev, HCI_SSP_ENABLED))
+		return 0;
+
+	if (hci_dev_test_flag(hdev, HCI_SERVICE_CACHE))
+		return 0;
+
+	memset(&cp, 0, sizeof(cp));
+
+	eir_create(hdev, cp.data);
+
+	if (memcmp(cp.data, hdev->eir, sizeof(cp.data)) == 0)
+		return 0;
+
+	memcpy(hdev->eir, cp.data, sizeof(cp.data));
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_WRITE_EIR, sizeof(cp), &cp,
+				     HCI_CMD_TIMEOUT);
+}
+
+static u8 get_service_classes(struct hci_dev *hdev)
+{
+	struct bt_uuid *uuid;
+	u8 val = 0;
+
+	list_for_each_entry(uuid, &hdev->uuids, list)
+		val |= uuid->svc_hint;
+
+	return val;
+}
+
+int hci_update_class_sync(struct hci_dev *hdev)
+{
+	u8 cod[3];
+
+	bt_dev_dbg(hdev, "");
+
+	if (!hdev_is_powered(hdev))
+		return 0;
+
+	if (!hci_dev_test_flag(hdev, HCI_BREDR_ENABLED))
+		return 0;
+
+	if (hci_dev_test_flag(hdev, HCI_SERVICE_CACHE))
+		return 0;
+
+	cod[0] = hdev->minor_class;
+	cod[1] = hdev->major_class;
+	cod[2] = get_service_classes(hdev);
+
+	if (hci_dev_test_flag(hdev, HCI_LIMITED_DISCOVERABLE))
+		cod[1] |= 0x20;
+
+	if (memcmp(cod, hdev->dev_class, 3) == 0)
+		return 0;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_WRITE_CLASS_OF_DEV,
+				     sizeof(cod), cod, HCI_CMD_TIMEOUT);
+}
diff --git a/net/bluetooth/hci_sync.h b/net/bluetooth/hci_sync.h
new file mode 100644
index 000000000000..e3437150031c
--- /dev/null
+++ b/net/bluetooth/hci_sync.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * BlueZ - Bluetooth protocol stack for Linux
+ *
+ * Copyright (C) 2021 Intel Corporation
+ */
+
+int hci_update_eir_sync(struct hci_dev *hdev);
+int hci_update_class_sync(struct hci_dev *hdev);
diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index a376e3adda55..b3ebdf4e85b0 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -34,6 +34,7 @@
 #include <net/bluetooth/mgmt.h>
 
 #include "hci_request.h"
+#include "hci_sync.h"
 #include "smp.h"
 #include "mgmt_util.h"
 #include "mgmt_config.h"
@@ -276,10 +277,39 @@ static const u8 mgmt_status_table[] = {
 	MGMT_STATUS_CONNECT_FAILED,	/* MAC Connection Failed */
 };
 
-static u8 mgmt_status(u8 hci_status)
+static u8 mgmt_errno_status(int err)
 {
-	if (hci_status < ARRAY_SIZE(mgmt_status_table))
-		return mgmt_status_table[hci_status];
+	switch (err) {
+	case 0:
+		return MGMT_STATUS_SUCCESS;
+	case -EPERM:
+		return MGMT_STATUS_REJECTED;
+	case -EINVAL:
+		return MGMT_STATUS_INVALID_PARAMS;
+	case -EOPNOTSUPP:
+		return MGMT_STATUS_NOT_SUPPORTED;
+	case -EBUSY:
+		return MGMT_STATUS_BUSY;
+	case -ETIMEDOUT:
+		return MGMT_STATUS_AUTH_FAILED;
+	case -ENOMEM:
+		return MGMT_STATUS_NO_RESOURCES;
+	case -EISCONN:
+		return MGMT_STATUS_ALREADY_CONNECTED;
+	case -ENOTCONN:
+		return MGMT_STATUS_DISCONNECTED;
+	}
+
+	return MGMT_STATUS_FAILED;
+}
+
+static u8 mgmt_status(int err)
+{
+	if (err < 0)
+		return mgmt_errno_status(err);
+
+	if (err < ARRAY_SIZE(mgmt_status_table))
+		return mgmt_status_table[err];
 
 	return MGMT_STATUS_FAILED;
 }
@@ -951,25 +981,23 @@ bool mgmt_get_connectable(struct hci_dev *hdev)
 	return hci_dev_test_flag(hdev, HCI_CONNECTABLE);
 }
 
+static int service_cache_sync(struct hci_dev *hdev, void *data)
+{
+	hci_update_eir_sync(hdev);
+	hci_update_class_sync(hdev);
+
+	return 0;
+}
+
 static void service_cache_off(struct work_struct *work)
 {
 	struct hci_dev *hdev = container_of(work, struct hci_dev,
 					    service_cache.work);
-	struct hci_request req;
 
 	if (!hci_dev_test_and_clear_flag(hdev, HCI_SERVICE_CACHE))
 		return;
 
-	hci_req_init(&req, hdev);
-
-	hci_dev_lock(hdev);
-
-	__hci_req_update_eir(&req);
-	__hci_req_update_class(&req);
-
-	hci_dev_unlock(hdev);
-
-	hci_req_run(&req, NULL);
+	hci_cmd_sync_queue(hdev, service_cache_sync, NULL, NULL);
 }
 
 static void rpa_expired(struct work_struct *work)
@@ -2075,37 +2103,33 @@ static u8 get_uuid_size(const u8 *uuid)
 	return 16;
 }
 
-static void mgmt_class_complete(struct hci_dev *hdev, u16 mgmt_op, u8 status)
+static void mgmt_class_complete(struct hci_dev *hdev, void *data, int err)
 {
-	struct mgmt_pending_cmd *cmd;
-
-	hci_dev_lock(hdev);
+	struct mgmt_pending_cmd *cmd = data;
 
-	cmd = pending_find(mgmt_op, hdev);
-	if (!cmd)
-		goto unlock;
+	bt_dev_dbg(hdev, "err %d", err);
 
 	mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode,
-			  mgmt_status(status), hdev->dev_class, 3);
+			  mgmt_status(err), hdev->dev_class, 3);
 
-	mgmt_pending_remove(cmd);
-
-unlock:
-	hci_dev_unlock(hdev);
+	mgmt_pending_free(cmd);
 }
 
-static void add_uuid_complete(struct hci_dev *hdev, u8 status, u16 opcode)
+static int add_uuid_sync(struct hci_dev *hdev, void *data)
 {
-	bt_dev_dbg(hdev, "status 0x%02x", status);
+	int err;
 
-	mgmt_class_complete(hdev, MGMT_OP_ADD_UUID, status);
+	err = hci_update_class_sync(hdev);
+	if (err)
+		return err;
+
+	return hci_update_eir_sync(hdev);
 }
 
 static int add_uuid(struct sock *sk, struct hci_dev *hdev, void *data, u16 len)
 {
 	struct mgmt_cp_add_uuid *cp = data;
 	struct mgmt_pending_cmd *cmd;
-	struct hci_request req;
 	struct bt_uuid *uuid;
 	int err;
 
@@ -2131,28 +2155,17 @@ static int add_uuid(struct sock *sk, struct hci_dev *hdev, void *data, u16 len)
 
 	list_add_tail(&uuid->list, &hdev->uuids);
 
-	hci_req_init(&req, hdev);
-
-	__hci_req_update_class(&req);
-	__hci_req_update_eir(&req);
-
-	err = hci_req_run(&req, add_uuid_complete);
-	if (err < 0) {
-		if (err != -ENODATA)
-			goto failed;
-
-		err = mgmt_cmd_complete(sk, hdev->id, MGMT_OP_ADD_UUID, 0,
-					hdev->dev_class, 3);
-		goto failed;
-	}
-
-	cmd = mgmt_pending_add(sk, MGMT_OP_ADD_UUID, hdev, data, len);
+	cmd = mgmt_pending_new(sk, MGMT_OP_ADD_UUID, hdev, data, len);
 	if (!cmd) {
 		err = -ENOMEM;
 		goto failed;
 	}
 
-	err = 0;
+	err = hci_cmd_sync_queue(hdev, add_uuid_sync, cmd, mgmt_class_complete);
+	if (err < 0) {
+		mgmt_pending_free(cmd);
+		goto failed;
+	}
 
 failed:
 	hci_dev_unlock(hdev);
@@ -2173,11 +2186,15 @@ static bool enable_service_cache(struct hci_dev *hdev)
 	return false;
 }
 
-static void remove_uuid_complete(struct hci_dev *hdev, u8 status, u16 opcode)
+static int remove_uuid_sync(struct hci_dev *hdev, void *data)
 {
-	bt_dev_dbg(hdev, "status 0x%02x", status);
+	int err;
 
-	mgmt_class_complete(hdev, MGMT_OP_REMOVE_UUID, status);
+	err = hci_update_class_sync(hdev);
+	if (err)
+		return err;
+
+	return hci_update_eir_sync(hdev);
 }
 
 static int remove_uuid(struct sock *sk, struct hci_dev *hdev, void *data,
@@ -2187,7 +2204,6 @@ static int remove_uuid(struct sock *sk, struct hci_dev *hdev, void *data,
 	struct mgmt_pending_cmd *cmd;
 	struct bt_uuid *match, *tmp;
 	u8 bt_uuid_any[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
-	struct hci_request req;
 	int err, found;
 
 	bt_dev_dbg(hdev, "sock %p", sk);
@@ -2231,39 +2247,35 @@ static int remove_uuid(struct sock *sk, struct hci_dev *hdev, void *data,
 	}
 
 update_class:
-	hci_req_init(&req, hdev);
-
-	__hci_req_update_class(&req);
-	__hci_req_update_eir(&req);
-
-	err = hci_req_run(&req, remove_uuid_complete);
-	if (err < 0) {
-		if (err != -ENODATA)
-			goto unlock;
-
-		err = mgmt_cmd_complete(sk, hdev->id, MGMT_OP_REMOVE_UUID, 0,
-					hdev->dev_class, 3);
-		goto unlock;
-	}
-
-	cmd = mgmt_pending_add(sk, MGMT_OP_REMOVE_UUID, hdev, data, len);
+	cmd = mgmt_pending_new(sk, MGMT_OP_REMOVE_UUID, hdev, data, len);
 	if (!cmd) {
 		err = -ENOMEM;
 		goto unlock;
 	}
 
-	err = 0;
+	err = hci_cmd_sync_queue(hdev, remove_uuid_sync, cmd,
+				 mgmt_class_complete);
+	if (err < 0)
+		mgmt_pending_free(cmd);
 
 unlock:
 	hci_dev_unlock(hdev);
 	return err;
 }
 
-static void set_class_complete(struct hci_dev *hdev, u8 status, u16 opcode)
+static int set_class_sync(struct hci_dev *hdev, void *data)
 {
-	bt_dev_dbg(hdev, "status 0x%02x", status);
+	int err = 0;
+
+	if (hci_dev_test_and_clear_flag(hdev, HCI_SERVICE_CACHE)) {
+		cancel_delayed_work_sync(&hdev->service_cache);
+		err = hci_update_eir_sync(hdev);
+	}
+
+	if (err)
+		return err;
 
-	mgmt_class_complete(hdev, MGMT_OP_SET_DEV_CLASS, status);
+	return hci_update_class_sync(hdev);
 }
 
 static int set_dev_class(struct sock *sk, struct hci_dev *hdev, void *data,
@@ -2271,7 +2283,6 @@ static int set_dev_class(struct sock *sk, struct hci_dev *hdev, void *data,
 {
 	struct mgmt_cp_set_dev_class *cp = data;
 	struct mgmt_pending_cmd *cmd;
-	struct hci_request req;
 	int err;
 
 	bt_dev_dbg(hdev, "sock %p", sk);
@@ -2303,34 +2314,16 @@ static int set_dev_class(struct sock *sk, struct hci_dev *hdev, void *data,
 		goto unlock;
 	}
 
-	hci_req_init(&req, hdev);
-
-	if (hci_dev_test_and_clear_flag(hdev, HCI_SERVICE_CACHE)) {
-		hci_dev_unlock(hdev);
-		cancel_delayed_work_sync(&hdev->service_cache);
-		hci_dev_lock(hdev);
-		__hci_req_update_eir(&req);
-	}
-
-	__hci_req_update_class(&req);
-
-	err = hci_req_run(&req, set_class_complete);
-	if (err < 0) {
-		if (err != -ENODATA)
-			goto unlock;
-
-		err = mgmt_cmd_complete(sk, hdev->id, MGMT_OP_SET_DEV_CLASS, 0,
-					hdev->dev_class, 3);
-		goto unlock;
-	}
-
-	cmd = mgmt_pending_add(sk, MGMT_OP_SET_DEV_CLASS, hdev, data, len);
+	cmd = mgmt_pending_new(sk, MGMT_OP_SET_DEV_CLASS, hdev, data, len);
 	if (!cmd) {
 		err = -ENOMEM;
 		goto unlock;
 	}
 
-	err = 0;
+	err = hci_cmd_sync_queue(hdev, set_class_sync, cmd,
+				 mgmt_class_complete);
+	if (err < 0)
+		mgmt_pending_free(cmd);
 
 unlock:
 	hci_dev_unlock(hdev);
@@ -5266,11 +5259,15 @@ static int unblock_device(struct sock *sk, struct hci_dev *hdev, void *data,
 	return err;
 }
 
+static int set_device_id_sync(struct hci_dev *hdev, void *data)
+{
+	return hci_update_eir_sync(hdev);
+}
+
 static int set_device_id(struct sock *sk, struct hci_dev *hdev, void *data,
 			 u16 len)
 {
 	struct mgmt_cp_set_device_id *cp = data;
-	struct hci_request req;
 	int err;
 	__u16 source;
 
@@ -5292,9 +5289,7 @@ static int set_device_id(struct sock *sk, struct hci_dev *hdev, void *data,
 	err = mgmt_cmd_complete(sk, hdev->id, MGMT_OP_SET_DEVICE_ID, 0,
 				NULL, 0);
 
-	hci_req_init(&req, hdev);
-	__hci_req_update_eir(&req);
-	hci_req_run(&req, NULL);
+	hci_cmd_sync_queue(hdev, set_device_id_sync, NULL, NULL);
 
 	hci_dev_unlock(hdev);
 
diff --git a/net/bluetooth/mgmt_util.c b/net/bluetooth/mgmt_util.c
index 0d0a6d77b9e8..83875f2a0604 100644
--- a/net/bluetooth/mgmt_util.c
+++ b/net/bluetooth/mgmt_util.c
@@ -227,7 +227,7 @@ void mgmt_pending_foreach(u16 opcode, struct hci_dev *hdev,
 	}
 }
 
-struct mgmt_pending_cmd *mgmt_pending_add(struct sock *sk, u16 opcode,
+struct mgmt_pending_cmd *mgmt_pending_new(struct sock *sk, u16 opcode,
 					  struct hci_dev *hdev,
 					  void *data, u16 len)
 {
@@ -251,6 +251,19 @@ struct mgmt_pending_cmd *mgmt_pending_add(struct sock *sk, u16 opcode,
 	cmd->sk = sk;
 	sock_hold(sk);
 
+	return cmd;
+}
+
+struct mgmt_pending_cmd *mgmt_pending_add(struct sock *sk, u16 opcode,
+					  struct hci_dev *hdev,
+					  void *data, u16 len)
+{
+	struct mgmt_pending_cmd *cmd;
+
+	cmd = mgmt_pending_new(sk, opcode, hdev, data, len);
+	if (!cmd)
+		return NULL;
+
 	list_add(&cmd->list, &hdev->mgmt_pending);
 
 	return cmd;
diff --git a/net/bluetooth/mgmt_util.h b/net/bluetooth/mgmt_util.h
index 6559f189213c..9dc24ba0d51a 100644
--- a/net/bluetooth/mgmt_util.h
+++ b/net/bluetooth/mgmt_util.h
@@ -49,5 +49,8 @@ void mgmt_pending_foreach(u16 opcode, struct hci_dev *hdev,
 struct mgmt_pending_cmd *mgmt_pending_add(struct sock *sk, u16 opcode,
 					  struct hci_dev *hdev,
 					  void *data, u16 len);
+struct mgmt_pending_cmd *mgmt_pending_new(struct sock *sk, u16 opcode,
+					  struct hci_dev *hdev,
+					  void *data, u16 len);
 void mgmt_pending_free(struct mgmt_pending_cmd *cmd);
 void mgmt_pending_remove(struct mgmt_pending_cmd *cmd);
-- 
2.31.1

