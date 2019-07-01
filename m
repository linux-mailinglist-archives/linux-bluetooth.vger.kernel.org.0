Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 008C332DE7
	for <lists+linux-bluetooth@lfdr.de>; Mon,  3 Jun 2019 12:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727412AbfFCKst (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 3 Jun 2019 06:48:49 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:42921 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727190AbfFCKst (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 3 Jun 2019 06:48:49 -0400
Received: by mail-ed1-f66.google.com with SMTP id z25so238557edq.9
        for <linux-bluetooth@vger.kernel.org>; Mon, 03 Jun 2019 03:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6HrdzLpThnp4XMqVvFHU1y9LanmyXQ0RXfMKTA3VGb0=;
        b=hSQxxfupcksBMBFs/Bjmjts/dewpWV+GgQm6c/3S5YNRypejgArCUrIh47/IrOoNbd
         jp91AwQO1UoK/KdmDy6X5e3xhpoLt1m5GiyBomca5N/ctix5BgByeRePXhqGHhqdM0gN
         NRnsMLK3kSHIXtALQNnkeYWgUg5zHewzMSJITJsxvb1lFME7xdRDQgmaEdEMXO1oHTim
         p7YZ+4bQm7ISAYss3GVLaSzVZKQUID0UcWFw4NspFeZ5XjsjKa9H1xzV+CmnRRAeoex8
         ylMeqaBZafyYHhalBmEdE7LiCyLSgDhYEZwjnlbblLczjVteFxL3N7KmGoccq1Jz18KK
         ASig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6HrdzLpThnp4XMqVvFHU1y9LanmyXQ0RXfMKTA3VGb0=;
        b=hD4r0RwiMraNwIByQfh+paZVCi7lC9oVP3ocnXMPcrmGCLu41sSEJ6+UhaJytA82r4
         2s1sfTL+f0g6ZDi0v9VQG0YEGBkY0AMdZupBSO1io9JPwD8e4aAcSppuyVuJxEpirDnA
         RPtolzGjk9AQ30r155RJ77NScpzQwxJK+hgEdM2G8IA4FjAuTXcmhtHaYTdPxzZVzx7O
         3lRCyv7YQihjSxHU+V3BI4P18OtdT8vB77thM6N85F67aERMHl2YxYPhbsVOKuT4jnZ2
         4rI96lb9FwPTkn8py15s97LWK8VyWd51P6YKDBTHwUYhKDIrWjuuM7EG3rg6ckdnQuhJ
         oJ6w==
X-Gm-Message-State: APjAAAUGLQdLjtgwFQTH3B/3hMZc0/kwN81gKcwWpI2BsyZFU/9udU2n
        ITcx8Y2Vpfux3ML6rddBwYNlUYWPJCY=
X-Google-Smtp-Source: APXvYqzGSiWWwQJZuN4/LJRpCuR9dRV9s9rr9X+t1H3Pii8f8v7hNX8kTgFtaPBKojNwLtkmIcSCKQ==
X-Received: by 2002:a50:a7a5:: with SMTP id i34mr27769584edc.294.1559558926376;
        Mon, 03 Jun 2019 03:48:46 -0700 (PDT)
Received: from localhost.localdomain ([192.198.151.62])
        by smtp.gmail.com with ESMTPSA id d90sm3926207edd.96.2019.06.03.03.48.45
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 03 Jun 2019 03:48:45 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [RFC 1/2] Bluetooth: Use controller sets when available
Date:   Mon,  3 Jun 2019 13:48:42 +0300
Message-Id: <20190603104843.26848-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This makes use of controller sets when using Extended Advertising
feature thus offloading the scheduling to the controller.

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 net/bluetooth/hci_conn.c    |  2 +-
 net/bluetooth/hci_core.c    |  3 ++-
 net/bluetooth/hci_request.c | 40 ++++++++++++++++++++++++++++++-------
 net/bluetooth/hci_request.h |  2 +-
 4 files changed, 37 insertions(+), 10 deletions(-)

diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
index bd4978ce8c45..1d2fa24d752f 100644
--- a/net/bluetooth/hci_conn.c
+++ b/net/bluetooth/hci_conn.c
@@ -912,7 +912,7 @@ static void hci_req_directed_advertising(struct hci_request *req,
 				    sizeof(cp), &cp);
 		}
 
-		__hci_req_enable_ext_advertising(req);
+		__hci_req_enable_ext_advertising(req, 0x00);
 	} else {
 		struct hci_cp_le_set_adv_param cp;
 
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index d6b2540ba7f8..9547354a9773 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -2829,7 +2829,7 @@ int hci_add_adv_instance(struct hci_dev *hdev, u8 instance, u32 flags,
 		memset(adv_instance->scan_rsp_data, 0,
 		       sizeof(adv_instance->scan_rsp_data));
 	} else {
-		if (hdev->adv_instance_cnt >= HCI_MAX_ADV_INSTANCES ||
+		if (hdev->adv_instance_cnt >= hdev->le_num_of_adv_sets ||
 		    instance < 1 || instance > HCI_MAX_ADV_INSTANCES)
 			return -EOVERFLOW;
 
@@ -3197,6 +3197,7 @@ struct hci_dev *hci_alloc_dev(void)
 	hdev->le_min_key_size = SMP_MIN_ENC_KEY_SIZE;
 	hdev->le_tx_def_phys = HCI_LE_SET_PHY_1M;
 	hdev->le_rx_def_phys = HCI_LE_SET_PHY_1M;
+	hdev->le_num_of_adv_sets = HCI_MAX_ADV_INSTANCES;
 
 	hdev->rpa_timeout = HCI_DEFAULT_RPA_TIMEOUT;
 	hdev->discov_interleaved_timeout = DISCOV_INTERLEAVED_TIMEOUT;
diff --git a/net/bluetooth/hci_request.c b/net/bluetooth/hci_request.c
index ca73d36cc149..5970d77f9911 100644
--- a/net/bluetooth/hci_request.c
+++ b/net/bluetooth/hci_request.c
@@ -1596,7 +1596,7 @@ int __hci_req_setup_ext_adv_instance(struct hci_request *req, u8 instance)
 	cp.own_addr_type = own_addr_type;
 	cp.channel_map = hdev->le_adv_channel_map;
 	cp.tx_power = 127;
-	cp.handle = 0;
+	cp.handle = instance;
 
 	if (flags & MGMT_ADV_FLAG_SEC_2M) {
 		cp.primary_phy = HCI_ADV_PHY_1M;
@@ -1638,11 +1638,21 @@ int __hci_req_setup_ext_adv_instance(struct hci_request *req, u8 instance)
 	return 0;
 }
 
-void __hci_req_enable_ext_advertising(struct hci_request *req)
+int __hci_req_enable_ext_advertising(struct hci_request *req, u8 instance)
 {
+	struct hci_dev *hdev = req->hdev;
 	struct hci_cp_le_set_ext_adv_enable *cp;
 	struct hci_cp_ext_adv_set *adv_set;
 	u8 data[sizeof(*cp) + sizeof(*adv_set) * 1];
+	struct adv_info *adv_instance;
+
+	if (instance > 0) {
+		adv_instance = hci_find_adv_instance(hdev, instance);
+		if (!adv_instance)
+			return -EINVAL;
+	} else {
+		adv_instance = NULL;
+	}
 
 	cp = (void *) data;
 	adv_set = (void *) cp->data;
@@ -1654,11 +1664,23 @@ void __hci_req_enable_ext_advertising(struct hci_request *req)
 
 	memset(adv_set, 0, sizeof(*adv_set));
 
-	adv_set->handle = 0;
+	adv_set->handle = instance;
+
+	/* Set duration per instance since controller is responsible for
+	 * scheduling it.
+	 */
+	if (adv_instance && adv_instance->duration) {
+		u16 duration = adv_instance->duration * MSEC_PER_SEC;
+
+		/* Time = N * 10 ms */
+		adv_set->duration = cpu_to_le16(duration / 10);
+	}
 
 	hci_req_add(req, HCI_OP_LE_SET_EXT_ADV_ENABLE,
 		    sizeof(*cp) + sizeof(*adv_set) * cp->num_of_sets,
 		    data);
+
+	return 0;
 }
 
 int __hci_req_start_ext_adv(struct hci_request *req, u8 instance)
@@ -1674,7 +1696,7 @@ int __hci_req_start_ext_adv(struct hci_request *req, u8 instance)
 		return err;
 
 	__hci_req_update_scan_rsp_data(req, instance);
-	__hci_req_enable_ext_advertising(req);
+	__hci_req_enable_ext_advertising(req, instance);
 
 	return 0;
 }
@@ -1718,10 +1740,13 @@ int __hci_req_schedule_adv_instance(struct hci_request *req, u8 instance,
 		adv_instance->remaining_time =
 				adv_instance->remaining_time - timeout;
 
-	hdev->adv_instance_timeout = timeout;
-	queue_delayed_work(hdev->req_workqueue,
+	/* Only use work for scheduling instaces with legacy advertising */
+	if (!ext_adv_capable(hdev)) {
+		hdev->adv_instance_timeout = timeout;
+		queue_delayed_work(hdev->req_workqueue,
 			   &hdev->adv_instance_expire,
 			   msecs_to_jiffies(timeout * 1000));
+	}
 
 	/* If we're just re-scheduling the same instance again then do not
 	 * execute any HCI commands. This happens when a single instance is
@@ -2739,7 +2764,8 @@ static int powered_update_hci(struct hci_request *req, unsigned long opt)
 				if (!ext_adv_capable(hdev))
 					__hci_req_enable_advertising(req);
 				else if (!err)
-					__hci_req_enable_ext_advertising(req);
+					__hci_req_enable_ext_advertising(req,
+									 0x00);
 			}
 		} else if (!list_empty(&hdev->adv_instances)) {
 			struct adv_info *adv_instance;
diff --git a/net/bluetooth/hci_request.h b/net/bluetooth/hci_request.h
index 692cc8b13368..ea4191c76fb3 100644
--- a/net/bluetooth/hci_request.h
+++ b/net/bluetooth/hci_request.h
@@ -82,7 +82,7 @@ void hci_req_clear_adv_instance(struct hci_dev *hdev, struct sock *sk,
 
 int __hci_req_setup_ext_adv_instance(struct hci_request *req, u8 instance);
 int __hci_req_start_ext_adv(struct hci_request *req, u8 instance);
-void __hci_req_enable_ext_advertising(struct hci_request *req);
+int __hci_req_enable_ext_advertising(struct hci_request *req, u8 instance);
 void __hci_req_clear_ext_adv_sets(struct hci_request *req);
 int hci_get_random_address(struct hci_dev *hdev, bool require_privacy,
 			   bool use_rpa, struct adv_info *adv_instance,
-- 
2.21.0

