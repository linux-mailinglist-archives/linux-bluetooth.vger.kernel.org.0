Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 818E41F7FC3
	for <lists+linux-bluetooth@lfdr.de>; Sat, 13 Jun 2020 01:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbgFLXrB (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 12 Jun 2020 19:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726444AbgFLXqT (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 12 Jun 2020 19:46:19 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 690E5C08C5C1
        for <linux-bluetooth@vger.kernel.org>; Fri, 12 Jun 2020 16:46:17 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id r18so4843743pgk.11
        for <linux-bluetooth@vger.kernel.org>; Fri, 12 Jun 2020 16:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fs3LTv/TUXqK230ldpcjYHVzqQxCbosNIgkuoSLrp2g=;
        b=REQGm9u7WdVOUFmm9C3KFx+PyaIZoK7g/JBegThB03I3bGnUdxQmYu38qB5/zoZ77d
         EePjP4P81nEYBUZi+VLCFL+og2m8ELvXYtkivO51bsgrZVc0ABZ6XE59oRSeL0GZshgi
         W1FTLW9EnsOKBBqYkJe4JWafI948oWHCZa2oQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fs3LTv/TUXqK230ldpcjYHVzqQxCbosNIgkuoSLrp2g=;
        b=Rh38oosAhuq19CUJcEkTIvpCUEh+Tq011QpojMzeX9BTAaFACUsSiCL01zJAYfr+Xe
         JlEViuX3XoxJTC0XOK3w3JJwiHjVGmo53M0n6H77QYcblasYE8uJMy7+46eDajzpF1nt
         diUv+XFkMYXSI3STUtGEVQOCil9hmYVx6xmBQFKSm5uFf1CKzwZ8rcDSEjpFDbZCS9Ff
         AOkeKiO0erf/hQZc39ZfNCfjeh7phheLqRdrjVWPqWib1YMjmyYaWa1wVtXmkZvEPd1G
         O1gZdT4xn+fE9lUtVqU+s3p1KWXOxJOeySkAA+cEbAYZCXBRvyA2cZEArZTH8hy0JX90
         zP9w==
X-Gm-Message-State: AOAM531Il7bmZ51Mr8XIUACv4xhhGwtIbcbZops0I1PR8VfQyErS3fXp
        IsFzhKuCvZCJ8IViiGyEamyDDai77bU=
X-Google-Smtp-Source: ABdhPJwXOvtylySvAXmZBaptlJ/SPnv2e1y5X1wxUcIbUq8LVQBOdlYSuDb+HhlYUlZwu78atMrPjA==
X-Received: by 2002:a63:ee0c:: with SMTP id e12mr6584999pgi.83.1592005576457;
        Fri, 12 Jun 2020 16:46:16 -0700 (PDT)
Received: from mcchou0.mtv.corp.google.com ([2620:15c:202:201:b46:ac84:1014:9555])
        by smtp.gmail.com with ESMTPSA id b19sm6198639pjo.57.2020.06.12.16.46.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jun 2020 16:46:15 -0700 (PDT)
From:   Miao-chen Chou <mcchou@chromium.org>
To:     Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>
Cc:     Alain Michaud <alainm@chromium.org>,
        Michael Sun <michaelfsun@google.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Yoni Shavit <yshavit@chromium.org>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Miao-chen Chou <mcchou@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH v4 2/7] Bluetooth: Add handler of MGMT_OP_READ_ADV_MONITOR_FEATURES
Date:   Fri, 12 Jun 2020 16:45:51 -0700
Message-Id: <20200612164243.v4.2.I7f3372c74a6569cd3445b77a67a0b0fcfdd8a333@changeid>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200612164243.v4.1.I636f906bf8122855dfd2ba636352bbdcb50c35ed@changeid>
References: <20200612164243.v4.1.I636f906bf8122855dfd2ba636352bbdcb50c35ed@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This adds the request handler of MGMT_OP_READ_ADV_MONITOR_FEATURES
command. Since the controller-based monitoring is not yet in place, this
report only the supported features but not the enabled features.

The following test was performed.
- Issuing btmgmt advmon-features.

Signed-off-by: Miao-chen Chou <mcchou@chromium.org>
---

Changes in v4: None
Changes in v3:
- Update the opcode in the mgmt table.

Changes in v2:
- Convert the values from little-endian to CPU order.
- Fix comment style and improve readability.

 include/net/bluetooth/hci_core.h | 24 ++++++++++++++
 net/bluetooth/hci_core.c         | 10 +++++-
 net/bluetooth/mgmt.c             | 54 ++++++++++++++++++++++++++++++++
 net/bluetooth/msft.c             |  7 +++++
 net/bluetooth/msft.h             |  9 ++++++
 5 files changed, 103 insertions(+), 1 deletion(-)

diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index cdd4f1db8670e..431fe0265dcfb 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -25,6 +25,7 @@
 #ifndef __HCI_CORE_H
 #define __HCI_CORE_H
 
+#include <linux/idr.h>
 #include <linux/leds.h>
 #include <linux/rculist.h>
 
@@ -220,6 +221,24 @@ struct adv_info {
 #define HCI_MAX_ADV_INSTANCES		5
 #define HCI_DEFAULT_ADV_DURATION	2
 
+struct adv_pattern {
+	struct list_head list;
+	__u8 ad_type;
+	__u8 offset;
+	__u8 length;
+	__u8 value[HCI_MAX_AD_LENGTH];
+};
+
+struct adv_monitor {
+	struct list_head patterns;
+	bool		active;
+	__u16		handle;
+};
+
+#define HCI_MIN_ADV_MONITOR_HANDLE		1
+#define HCI_MAX_ADV_MONITOR_NUM_HANDLES	32
+#define HCI_MAX_ADV_MONITOR_NUM_PATTERNS	16
+
 #define HCI_MAX_SHORT_NAME_LENGTH	10
 
 /* Min encryption key size to match with SMP */
@@ -477,6 +496,9 @@ struct hci_dev {
 	__u16			adv_instance_timeout;
 	struct delayed_work	adv_instance_expire;
 
+	struct idr		adv_monitors_idr;
+	unsigned int		adv_monitors_cnt;
+
 	__u8			irk[16];
 	__u32			rpa_timeout;
 	struct delayed_work	rpa_expired;
@@ -1217,6 +1239,8 @@ int hci_add_adv_instance(struct hci_dev *hdev, u8 instance, u32 flags,
 int hci_remove_adv_instance(struct hci_dev *hdev, u8 instance);
 void hci_adv_instances_set_rpa_expired(struct hci_dev *hdev, bool rpa_expired);
 
+void hci_adv_monitors_clear(struct hci_dev *hdev);
+
 void hci_event_packet(struct hci_dev *hdev, struct sk_buff *skb);
 
 void hci_init_sysfs(struct hci_dev *hdev);
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 83ce665d3cbfb..bfcf00e4dfa92 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -26,7 +26,6 @@
 /* Bluetooth HCI core. */
 
 #include <linux/export.h>
-#include <linux/idr.h>
 #include <linux/rfkill.h>
 #include <linux/debugfs.h>
 #include <linux/crypto.h>
@@ -2996,6 +2995,12 @@ int hci_add_adv_instance(struct hci_dev *hdev, u8 instance, u32 flags,
 	return 0;
 }
 
+/* This function requires the caller holds hdev->lock */
+void hci_adv_monitors_clear(struct hci_dev *hdev)
+{
+	idr_destroy(&hdev->adv_monitors_idr);
+}
+
 struct bdaddr_list *hci_bdaddr_list_lookup(struct list_head *bdaddr_list,
 					 bdaddr_t *bdaddr, u8 type)
 {
@@ -3577,6 +3582,8 @@ int hci_register_dev(struct hci_dev *hdev)
 
 	queue_work(hdev->req_workqueue, &hdev->power_on);
 
+	idr_init(&hdev->adv_monitors_idr);
+
 	return id;
 
 err_wqueue:
@@ -3647,6 +3654,7 @@ void hci_unregister_dev(struct hci_dev *hdev)
 	hci_smp_irks_clear(hdev);
 	hci_remote_oob_data_clear(hdev);
 	hci_adv_instances_clear(hdev);
+	hci_adv_monitors_clear(hdev);
 	hci_bdaddr_list_clear(&hdev->le_white_list);
 	hci_bdaddr_list_clear(&hdev->le_resolv_list);
 	hci_conn_params_clear_all(hdev);
diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 9e8a3cccc6ca3..63536d6332d45 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -36,6 +36,7 @@
 #include "hci_request.h"
 #include "smp.h"
 #include "mgmt_util.h"
+#include "msft.h"
 
 #define MGMT_VERSION	1
 #define MGMT_REVISION	17
@@ -111,6 +112,7 @@ static const u16 mgmt_commands[] = {
 	MGMT_OP_READ_SECURITY_INFO,
 	MGMT_OP_READ_EXP_FEATURES_INFO,
 	MGMT_OP_SET_EXP_FEATURE,
+	MGMT_OP_READ_ADV_MONITOR_FEATURES,
 };
 
 static const u16 mgmt_events[] = {
@@ -3849,6 +3851,51 @@ static int set_exp_feature(struct sock *sk, struct hci_dev *hdev,
 			       MGMT_STATUS_NOT_SUPPORTED);
 }
 
+static int read_adv_monitor_features(struct sock *sk, struct hci_dev *hdev,
+				     void *data, u16 len)
+{
+	struct adv_monitor *monitor = NULL;
+	struct mgmt_rp_read_adv_monitor_features *rp = NULL;
+	int handle;
+	size_t rp_size = 0;
+	__u32 supported = 0;
+	__u16 num_handles = 0;
+	__u16 handles[HCI_MAX_ADV_MONITOR_NUM_HANDLES];
+
+	BT_DBG("request for %s", hdev->name);
+
+	hci_dev_lock(hdev);
+
+	if (msft_get_features(hdev) & MSFT_FEATURE_MASK_LE_ADV_MONITOR)
+		supported |= MGMT_ADV_MONITOR_FEATURE_MASK_OR_PATTERNS;
+
+	idr_for_each_entry(&hdev->adv_monitors_idr, monitor, handle) {
+		handles[num_handles++] = monitor->handle;
+	}
+
+	hci_dev_unlock(hdev);
+
+	rp_size = sizeof(*rp) + (num_handles * sizeof(u16));
+	rp = kmalloc(rp_size, GFP_KERNEL);
+	if (!rp)
+		return -ENOMEM;
+
+	/* Once controller-based monitoring is in place, the enabled_features
+	 * should reflect the use.
+	 */
+	rp->supported_features = cpu_to_le32(supported);
+	rp->enabled_features = 0;
+	rp->max_num_handles = cpu_to_le16(HCI_MAX_ADV_MONITOR_NUM_HANDLES);
+	rp->max_num_patterns = HCI_MAX_ADV_MONITOR_NUM_PATTERNS;
+	rp->num_handles = cpu_to_le16(num_handles);
+	if (num_handles)
+		memcpy(&rp->handles, &handles, (num_handles * sizeof(u16)));
+
+	return mgmt_cmd_complete(sk, hdev->id,
+				 MGMT_OP_READ_ADV_MONITOR_FEATURES,
+				 MGMT_STATUS_SUCCESS, rp, rp_size);
+}
+
 static void read_local_oob_data_complete(struct hci_dev *hdev, u8 status,
 				         u16 opcode, struct sk_buff *skb)
 {
@@ -7297,6 +7344,13 @@ static const struct hci_mgmt_handler mgmt_handlers[] = {
 	{ set_exp_feature,         MGMT_SET_EXP_FEATURE_SIZE,
 						HCI_MGMT_VAR_LEN |
 						HCI_MGMT_HDEV_OPTIONAL },
+	{ NULL }, // 0x004B
+	{ NULL }, // 0x004C
+	{ NULL }, // 0x004D
+	{ NULL }, // 0x004E
+	{ NULL }, // 0x004F
+	{ NULL }, // 0x0050
+	{ read_adv_monitor_features, MGMT_READ_ADV_MONITOR_FEATURES_SIZE },
 };
 
 void mgmt_index_added(struct hci_dev *hdev)
diff --git a/net/bluetooth/msft.c b/net/bluetooth/msft.c
index d6c4e6b5ae777..8579bfeb28364 100644
--- a/net/bluetooth/msft.c
+++ b/net/bluetooth/msft.c
@@ -139,3 +139,10 @@ void msft_vendor_evt(struct hci_dev *hdev, struct sk_buff *skb)
 
 	bt_dev_dbg(hdev, "MSFT vendor event %u", event);
 }
+
+__u64 msft_get_features(struct hci_dev *hdev)
+{
+	struct msft_data *msft = hdev->msft_data;
+
+	return  msft ? msft->features : 0;
+}
diff --git a/net/bluetooth/msft.h b/net/bluetooth/msft.h
index 5aa9130e1f8ab..e9c478e890b8b 100644
--- a/net/bluetooth/msft.h
+++ b/net/bluetooth/msft.h
@@ -3,16 +3,25 @@
  * Copyright (C) 2020 Google Corporation
  */
 
+#define MSFT_FEATURE_MASK_BREDR_RSSI_MONITOR		BIT(0)
+#define MSFT_FEATURE_MASK_LE_CONN_RSSI_MONITOR		BIT(1)
+#define MSFT_FEATURE_MASK_LE_ADV_RSSI_MONITOR		BIT(2)
+#define MSFT_FEATURE_MASK_LE_ADV_MONITOR		BIT(3)
+#define MSFT_FEATURE_MASK_CURVE_VALIDITY		BIT(4)
+#define MSFT_FEATURE_MASK_CONCURRENT_ADV_MONITOR	BIT(5)
+
 #if IS_ENABLED(CONFIG_BT_MSFTEXT)
 
 void msft_do_open(struct hci_dev *hdev);
 void msft_do_close(struct hci_dev *hdev);
 void msft_vendor_evt(struct hci_dev *hdev, struct sk_buff *skb);
+__u64 msft_get_features(struct hci_dev *hdev);
 
 #else
 
 static inline void msft_do_open(struct hci_dev *hdev) {}
 static inline void msft_do_close(struct hci_dev *hdev) {}
 static inline void msft_vendor_evt(struct hci_dev *hdev, struct sk_buff *skb) {}
+static inline __u64 msft_get_features(struct hci_dev *hdev) { return 0; }
 
 #endif
-- 
2.26.2

