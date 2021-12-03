Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4BD46726E
	for <lists+linux-bluetooth@lfdr.de>; Fri,  3 Dec 2021 08:16:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378800AbhLCHTr (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 3 Dec 2021 02:19:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378786AbhLCHTr (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 3 Dec 2021 02:19:47 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D24E3C06174A
        for <linux-bluetooth@vger.kernel.org>; Thu,  2 Dec 2021 23:16:23 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id d9-20020a251d09000000b005c208092922so4754813ybd.20
        for <linux-bluetooth@vger.kernel.org>; Thu, 02 Dec 2021 23:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=gdDFsMaRLluRJdvMlC+gWmkX7QB0BeSvd5wQfHYqfjI=;
        b=IcEYnQS+oNlHWGeV/a8nOwS6RwGKZJiu9VMSeC+fP8jjmPto6jUhuzhBjxWBqb/gS2
         G6VJHQ0kUU/jw31YyX9AA7GX4GB2ENx4nt5r7KpSIF1eD40MHTvl5eGIjMvEDdZlEBIg
         /wM1oxKpuaHKtr7qNrkfrRzDaJ+vDP+gbtvoK8gVeZjpoz22VrNHsyT2yT0X2bYa4UeW
         3lJOZQWwyeWenaqhT8yTSANC4vrx1ii2fS3bms3tHIcK56f/icqqS2S7FdJA/lOA3a6T
         0kzdMaIPuweKQHthGlGtqejq46ucLWy97YOvaAdQdXQFK/R1Jvw82sTAtd6FoP9wPqwP
         mnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=gdDFsMaRLluRJdvMlC+gWmkX7QB0BeSvd5wQfHYqfjI=;
        b=yaYy8YibCrdiNRrc6kf9i2I02RQ9FULjcTuAiZk5Q60BZ+vaYzsADeb/EA4K3iSYO0
         7VA7kY0sgQm1AHKlvJLM7LMdrJX16Y+1T+54pq4GeCDvsnr9ZyJf+0oUXw5xov96nSlC
         /67JYJBEdxudDV0g2cdKSPYsqcncF8YW24k30B4NxXx2pAkxzHb+Dt21oqFC+Nw/9wMp
         cTvEz2QvYx0OaKFftlEBrf4P1l/+N9cdx4kB19Ag15GXdsyToXIr6XBW+toXq9B3m/QU
         6h9OhFbAiYAdrcq3erGjcZj9VN6tTtV8ak04s+hkbJ9NVSLh4axo8pqhVZRf4NSRH6Lw
         geFA==
X-Gm-Message-State: AOAM530Hrr2sGd8A47d2c25OlW7UZdTs75qZbct6W0TYjy6E0C99JCVV
        +f/q5F9pDAKON4idK8ar0Jk4lMu6kSsyYQ==
X-Google-Smtp-Source: ABdhPJw4Tzam/iXRr7TSaTLgJ6FlzkX4R2lFdGTQjGcjfLBpe8I58hWrCjquix7eM4jCo3RnLB1Ykn+3yXiK/Q==
X-Received: from mmandlik.mtv.corp.google.com ([2620:15c:202:201:adf:ab3:651b:12a])
 (user=mmandlik job=sendgmr) by 2002:a25:42cb:: with SMTP id
 p194mr21070317yba.134.1638515783037; Thu, 02 Dec 2021 23:16:23 -0800 (PST)
Date:   Thu,  2 Dec 2021 23:16:17 -0800
Message-Id: <20211202231123.v7.1.Ic0a40b84dee3825302890aaea690e73165c71820@changeid>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.0.384.gca35af8252-goog
Subject: [PATCH v7 1/2] bluetooth: Handle MSFT Monitor Device Event
From:   Manish Mandlik <mmandlik@google.com>
To:     marcel@holtmann.org, luiz.dentz@gmail.com
Cc:     linux-bluetooth@vger.kernel.org,
        chromeos-bluetooth-upstreaming@chromium.org,
        Manish Mandlik <mmandlik@google.com>,
        Miao-chen Chou <mcchou@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Whenever the controller starts/stops monitoring a bt device, it sends
MSFT Monitor Device event. Add handler to read this vendor event.

Test performed:
- Verified by logs that the MSFT Monitor Device event is received from
  the controller whenever it starts/stops monitoring a device.

Signed-off-by: Manish Mandlik <mmandlik@google.com>
Reviewed-by: Miao-chen Chou <mcchou@google.com>

---

Hello Bt-Maintainers,

As mentioned in the bluez patch series [1], we need to capture the 'MSFT
Monitor Device' event from the controller and pass on the necessary
information to the bluetoothd.

This is required to further optimize the power consumption by avoiding
handling of RSSI thresholds and timeouts in the user space and let the
controller do the RSSI tracking.

This patch series adds support to read the MSFT vendor event
HCI_VS_MSFT_LE_Monitor_Device_Event and introduces new MGMT events
MGMT_EV_ADV_MONITOR_DEVICE_FOUND and MGMT_EV_ADV_MONITOR_DEVICE_LOST to
indicate that the controller has started/stopped tracking a particular
device.

Please let me know what you think about this or if you have any further
questions.

[1] https://patchwork.kernel.org/project/bluetooth/list/?series=583423

Thanks,
Manish.

(no changes since v6)

Changes in v6:
- Fix compiler warning bt_dev_err() missing argument.

Changes in v5:
- Split v4 into two patches.
- Buffer controller Device Found event and maintain the device tracking
  state in the kernel.

Changes in v4:
- Add Advertisement Monitor Device Found event and update addr type.

Changes in v3:
- Discard changes to the Device Found event and notify bluetoothd only
  when the controller stops monitoring the device via new Device Lost
  event.

Changes in v2:
- Instead of creating a new 'Device Tracking' event, add a flag 'Device
  Tracked' in the existing 'Device Found' event and add a new 'Device
  Lost' event to indicate that the controller has stopped tracking that
  device.

 include/net/bluetooth/hci_core.h |  11 +++
 net/bluetooth/hci_core.c         |   1 +
 net/bluetooth/msft.c             | 127 ++++++++++++++++++++++++++++++-
 3 files changed, 138 insertions(+), 1 deletion(-)

diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index 7bae8376fd6f..5ccd19dec77c 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -258,6 +258,15 @@ struct adv_info {
 
 #define HCI_ADV_TX_POWER_NO_PREFERENCE 0x7F
 
+struct monitored_device {
+	struct list_head list;
+
+	bdaddr_t bdaddr;
+	__u8     addr_type;
+	__u16    handle;
+	bool     notified;
+};
+
 struct adv_pattern {
 	struct list_head list;
 	__u8 ad_type;
@@ -589,6 +598,8 @@ struct hci_dev {
 
 	struct delayed_work	interleave_scan;
 
+	struct list_head	monitored_devices;
+
 #if IS_ENABLED(CONFIG_BT_LEDS)
 	struct led_trigger	*power_led;
 #endif
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index fdc0dcf8ee36..d4bcd511530a 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -2503,6 +2503,7 @@ struct hci_dev *hci_alloc_dev_priv(int sizeof_priv)
 	INIT_LIST_HEAD(&hdev->conn_hash.list);
 	INIT_LIST_HEAD(&hdev->adv_instances);
 	INIT_LIST_HEAD(&hdev->blocked_keys);
+	INIT_LIST_HEAD(&hdev->monitored_devices);
 
 	INIT_LIST_HEAD(&hdev->local_codecs);
 	INIT_WORK(&hdev->rx_work, hci_rx_work);
diff --git a/net/bluetooth/msft.c b/net/bluetooth/msft.c
index 1122097e1e49..aadabe78baf6 100644
--- a/net/bluetooth/msft.c
+++ b/net/bluetooth/msft.c
@@ -80,6 +80,14 @@ struct msft_rp_le_set_advertisement_filter_enable {
 	__u8 sub_opcode;
 } __packed;
 
+#define MSFT_EV_LE_MONITOR_DEVICE	0x02
+struct msft_ev_le_monitor_device {
+	__u8     addr_type;
+	bdaddr_t bdaddr;
+	__u8     monitor_handle;
+	__u8     monitor_state;
+} __packed;
+
 struct msft_monitor_advertisement_handle_data {
 	__u8  msft_handle;
 	__u16 mgmt_handle;
@@ -266,6 +274,7 @@ static void msft_le_cancel_monitor_advertisement_cb(struct hci_dev *hdev,
 	struct msft_data *msft = hdev->msft_data;
 	int err;
 	bool pending;
+	struct monitored_device *dev, *tmp;
 
 	if (status)
 		goto done;
@@ -296,6 +305,15 @@ static void msft_le_cancel_monitor_advertisement_cb(struct hci_dev *hdev,
 
 		list_del(&handle_data->list);
 		kfree(handle_data);
+
+		/* Clear any monitored devices by this Adv Monitor */
+		list_for_each_entry_safe(dev, tmp, &hdev->monitored_devices,
+					 list) {
+			if (dev->handle == handle_data->mgmt_handle) {
+				list_del(&dev->list);
+				kfree(dev);
+			}
+		}
 	}
 
 	/* If remove all monitors is required, we need to continue the process
@@ -538,6 +556,7 @@ void msft_do_close(struct hci_dev *hdev)
 	struct msft_data *msft = hdev->msft_data;
 	struct msft_monitor_advertisement_handle_data *handle_data, *tmp;
 	struct adv_monitor *monitor;
+	struct monitored_device *dev, *tmp_dev;
 
 	if (!msft)
 		return;
@@ -557,6 +576,16 @@ void msft_do_close(struct hci_dev *hdev)
 		list_del(&handle_data->list);
 		kfree(handle_data);
 	}
+
+	hci_dev_lock(hdev);
+
+	/* Clear any devices that are being monitored */
+	list_for_each_entry_safe(dev, tmp_dev, &hdev->monitored_devices, list) {
+		list_del(&dev->list);
+		kfree(dev);
+	}
+
+	hci_dev_unlock(hdev);
 }
 
 void msft_register(struct hci_dev *hdev)
@@ -590,6 +619,90 @@ void msft_unregister(struct hci_dev *hdev)
 	kfree(msft);
 }
 
+/* This function requires the caller holds hdev->lock */
+static void msft_device_found(struct hci_dev *hdev, bdaddr_t *bdaddr,
+			      __u8 addr_type, __u16 mgmt_handle)
+{
+	struct monitored_device *dev;
+
+	dev = kmalloc(sizeof(*dev), GFP_KERNEL);
+	if (!dev) {
+		bt_dev_err(hdev, "MSFT vendor event %u: no memory",
+			   MSFT_EV_LE_MONITOR_DEVICE);
+		return;
+	}
+
+	bacpy(&dev->bdaddr, bdaddr);
+	dev->addr_type = addr_type;
+	dev->handle = mgmt_handle;
+	dev->notified = false;
+
+	INIT_LIST_HEAD(&dev->list);
+	list_add(&dev->list, &hdev->monitored_devices);
+}
+
+/* This function requires the caller holds hdev->lock */
+static void msft_device_lost(struct hci_dev *hdev, bdaddr_t *bdaddr,
+			     __u8 addr_type, __u16 mgmt_handle)
+{
+	struct monitored_device *dev, *tmp;
+
+	list_for_each_entry_safe(dev, tmp, &hdev->monitored_devices, list) {
+		if (dev->handle == mgmt_handle) {
+			list_del(&dev->list);
+			kfree(dev);
+
+			break;
+		}
+	}
+}
+
+/* This function requires the caller holds hdev->lock */
+static void msft_monitor_device_evt(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	struct msft_ev_le_monitor_device *ev = (void *)skb->data;
+	struct msft_monitor_advertisement_handle_data *handle_data;
+	u8 addr_type;
+
+	if (skb->len < sizeof(*ev)) {
+		bt_dev_err(hdev,
+			   "MSFT vendor event %u: insufficient data (len: %u)",
+			   MSFT_EV_LE_MONITOR_DEVICE, skb->len);
+		return;
+	}
+	skb_pull(skb, sizeof(*ev));
+
+	bt_dev_dbg(hdev,
+		   "MSFT vendor event %u: handle 0x%04x state %d addr %pMR",
+		   MSFT_EV_LE_MONITOR_DEVICE, ev->monitor_handle,
+		   ev->monitor_state, &ev->bdaddr);
+
+	handle_data = msft_find_handle_data(hdev, ev->monitor_handle, false);
+
+	switch (ev->addr_type) {
+	case ADDR_LE_DEV_PUBLIC:
+		addr_type = BDADDR_LE_PUBLIC;
+		break;
+
+	case ADDR_LE_DEV_RANDOM:
+		addr_type = BDADDR_LE_RANDOM;
+		break;
+
+	default:
+		bt_dev_err(hdev,
+			   "MSFT vendor event %u: unknown addr type 0x%02x",
+			   MSFT_EV_LE_MONITOR_DEVICE, ev->addr_type);
+		return;
+	}
+
+	if (ev->monitor_state)
+		msft_device_found(hdev, &ev->bdaddr, addr_type,
+				  handle_data->mgmt_handle);
+	else
+		msft_device_lost(hdev, &ev->bdaddr, addr_type,
+				 handle_data->mgmt_handle);
+}
+
 void msft_vendor_evt(struct hci_dev *hdev, struct sk_buff *skb)
 {
 	struct msft_data *msft = hdev->msft_data;
@@ -617,10 +730,22 @@ void msft_vendor_evt(struct hci_dev *hdev, struct sk_buff *skb)
 	if (skb->len < 1)
 		return;
 
+	hci_dev_lock(hdev);
+
 	event = *skb->data;
 	skb_pull(skb, 1);
 
-	bt_dev_dbg(hdev, "MSFT vendor event %u", event);
+	switch (event) {
+	case MSFT_EV_LE_MONITOR_DEVICE:
+		msft_monitor_device_evt(hdev, skb);
+		break;
+
+	default:
+		bt_dev_dbg(hdev, "MSFT vendor event %u", event);
+		break;
+	}
+
+	hci_dev_unlock(hdev);
 }
 
 __u64 msft_get_features(struct hci_dev *hdev)
-- 
2.34.0.384.gca35af8252-goog

