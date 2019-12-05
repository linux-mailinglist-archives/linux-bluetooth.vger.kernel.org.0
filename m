Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF890113D0D
	for <lists+linux-bluetooth@lfdr.de>; Thu,  5 Dec 2019 09:32:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbfLEIcM (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 5 Dec 2019 03:32:12 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:46961 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbfLEIcM (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 5 Dec 2019 03:32:12 -0500
Received: by mail-pj1-f66.google.com with SMTP id z21so985330pjq.13
        for <linux-bluetooth@vger.kernel.org>; Thu, 05 Dec 2019 00:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=RCUQYZ8LU6Xug7OAijpj5/1Ha6cRpmEP24cfYYuJVNc=;
        b=M8Ox8RKyrJIdeNZS6xfYAipkWAUPPqP561GMloKZN/npx1YDYk2fSVviTemY5H/KP2
         TWCiFP6DNP6PkJ0qFsvDhbXt01/HzHBgBYnERzvFnpcxyNMaLq8eg7eFkGwwBhfcScxJ
         vv9fuHFZYJhpP6jsY/1JEVJjCmz2dRFeMcAh7y5rXNZ2PZWbDjIq6svY2MLTKbgXGHGQ
         qWithQ9d7ekbkL07kh4/EMTfBZuF2ymUr8qYQywbJk3jNxh7SN2lAN1xuEJKIb/8V8sv
         jnX5dL97zjOlNXv+Uj/VxtPqirkN9mjEi5yy0w+a7JBRW6WThkM9b4AiS33FrjPA20ob
         iM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=RCUQYZ8LU6Xug7OAijpj5/1Ha6cRpmEP24cfYYuJVNc=;
        b=mFf93kz7pHb+eUjtaLoHz0jy5YYXxFpHnuTdcNVN/eGQXDzz4KhXKDHkTOQLsMyM5e
         elG3+J+Vmn1qJr/8AKOYTckmKXViWaE3DyIPVA8FSbKHtA8X2yIctiuXGAJhDlDWmi1f
         6r3YlOJamd2TKDbwpCu7XrNHv9xtidlYGiZ615Vd1a0SH2g8Z1S6+us0XaXDLZ1k/HvT
         XmeDWXjsTb8VaQDhwlB0Px7wfKx0x00kV+AkgJYH7rtd2dZgfY5qiED5n3ePzvXFJmmJ
         frfsyptSzjlG+Q0AtEYG9npqW0f9Cpz9KX+24hs9VAeLRXTZ1bIV2a94LX22mnnKKQeR
         e/rg==
X-Gm-Message-State: APjAAAUs1s8N3nTK9z9lZhrVqd9MmVl7vpGbMeOPFWv6Uow1HHFwle74
        AOMgDX2LzN5t0eUWLl9REBnDCdnQpI1ewQ==
X-Google-Smtp-Source: APXvYqzwxd31XGehyyJ6r+zkbsZ5wd73LKTpMhqlxPNQ5quXLIoLpJ970ZWUezCOpUhpzhsJf7U+mw==
X-Received: by 2002:a17:90a:3243:: with SMTP id k61mr7586572pjb.55.1575534731253;
        Thu, 05 Dec 2019 00:32:11 -0800 (PST)
Received: from nsathish-Latitude-7480.iind.intel.com (jfdmzpr05-ext.jf.intel.com. [134.134.139.74])
        by smtp.gmail.com with ESMTPSA id r14sm11017821pfh.10.2019.12.05.00.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 00:32:10 -0800 (PST)
From:   Sathish Narsimman <nsathish41@gmail.com>
X-Google-Original-From: Sathish Narsimman <sathish.narasimman@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Sathish Narasimman <sathish.narasimman@intel.com>,
        Chethan T N <chethan.tumkur.narayan@intel.com>,
        Hsin-Yu Chao <hychao@chromium.org>,
        Amit K Bag <amit.k.bag@intel.com>
Subject: [PATCH v6 2/2] bluetooth:btusb: handle msbc audio over USB Endpoints
Date:   Thu,  5 Dec 2019 14:02:29 +0530
Message-Id: <20191205083229.29890-1-sathish.narasimman@intel.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Sathish Narasimman <sathish.narasimman@intel.com>

For msbc encoded audio stream over usb transport, btusb driver
to be set to alternate settings 6 as per BT core spec 5.0. The
type of air mode is used to differenting which alt setting to be
used.
The changes are made considering some discussion over the similar
patch submitted earlier from Kuba Pawlak(link below)
https://www.spinics.net/lists/linux-bluetooth/msg64577.html

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Sathish Narasimman <sathish.narasimman@intel.com>
Signed-off-by: Chethan T N <chethan.tumkur.narayan@intel.com>
Signed-off-by: Hsin-Yu Chao <hychao@chromium.org>
Signed-off-by: Amit K Bag <amit.k.bag@intel.com>
---
 drivers/bluetooth/btusb.c | 157 +++++++++++++++++++++++++++++---------
 1 file changed, 121 insertions(+), 36 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index d9cd0677d41c..5563569f4473 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -483,6 +483,8 @@ struct btusb_data {
 	__u8 cmdreq;
 
 	unsigned int sco_num;
+	unsigned int air_mode;
+	bool usb_alt6_packet_flow;
 	int isoc_altsetting;
 	int suspend_count;
 
@@ -974,6 +976,42 @@ static void btusb_isoc_complete(struct urb *urb)
 	}
 }
 
+static inline void __fill_isoc_descriptor_msbc(struct urb *urb, int len,
+					       int mtu, struct btusb_data *data)
+{
+	int i, offset = 0;
+	unsigned int interval;
+
+	/* For msbc ALT 6 setting the host will send the packet at continuous
+	 * flow. As per core spec 5, vol 4, part B, table 2.1. For ALT setting
+	 * 6 the HCI PACKET INTERVAL should be 7.5ms for every usb packets.
+	 * To maintain the rate we send 63bytes of usb packets alternatively for
+	 * 7ms and 8ms to maintain the rate as 7.5ms.
+	 */
+	if (data->usb_alt6_packet_flow) {
+		interval = 7;
+		data->usb_alt6_packet_flow = false;
+	} else {
+		interval = 6;
+		data->usb_alt6_packet_flow = true;
+	}
+
+	BT_DBG("interval:%d len %d mtu %d", interval, len, mtu);
+
+	for (i = 0; i < interval; i++) {
+		urb->iso_frame_desc[i].offset = offset;
+		urb->iso_frame_desc[i].length = offset;
+	}
+
+	if (len && i < BTUSB_MAX_ISOC_FRAMES) {
+		urb->iso_frame_desc[i].offset = offset;
+		urb->iso_frame_desc[i].length = len;
+		i++;
+	}
+
+	urb->number_of_packets = i;
+}
+
 static inline void __fill_isoc_descriptor(struct urb *urb, int len, int mtu)
 {
 	int i, offset = 0;
@@ -1377,9 +1415,13 @@ static struct urb *alloc_isoc_urb(struct hci_dev *hdev, struct sk_buff *skb)
 
 	urb->transfer_flags  = URB_ISO_ASAP;
 
-	__fill_isoc_descriptor(urb, skb->len,
+	if (data->isoc_altsetting == 6)
+		__fill_isoc_descriptor_msbc(urb, skb->len,
+			       le16_to_cpu(data->isoc_tx_ep->wMaxPacketSize),
+			       data);
+	else
+		__fill_isoc_descriptor(urb, skb->len,
 			       le16_to_cpu(data->isoc_tx_ep->wMaxPacketSize));
-
 	skb->dev = (void *)hdev;
 
 	return urb;
@@ -1475,6 +1517,7 @@ static void btusb_notify(struct hci_dev *hdev, unsigned int evt)
 
 	if (hci_conn_num(hdev, SCO_LINK) != data->sco_num) {
 		data->sco_num = hci_conn_num(hdev, SCO_LINK);
+		data->air_mode = evt;
 		schedule_work(&data->work);
 	}
 }
@@ -1522,11 +1565,70 @@ static inline int __set_isoc_interface(struct hci_dev *hdev, int altsetting)
 	return 0;
 }
 
+static int bt_switch_alt_setting(struct hci_dev *hdev, int new_alts)
+{
+	struct btusb_data *data = hci_get_drvdata(hdev);
+	int err;
+
+	if (data->isoc_altsetting != new_alts) {
+		unsigned long flags;
+
+		clear_bit(BTUSB_ISOC_RUNNING, &data->flags);
+		usb_kill_anchored_urbs(&data->isoc_anchor);
+
+		/* When isochronous alternate setting needs to be
+		 * changed, because SCO connection has been added
+		 * or removed, a packet fragment may be left in the
+		 * reassembling state. This could lead to wrongly
+		 * assembled fragments.
+		 *
+		 * Clear outstanding fragment when selecting a new
+		 * alternate setting.
+		 */
+		spin_lock_irqsave(&data->rxlock, flags);
+		kfree_skb(data->sco_skb);
+		data->sco_skb = NULL;
+		spin_unlock_irqrestore(&data->rxlock, flags);
+
+		err = __set_isoc_interface(hdev, new_alts);
+		if (err < 0)
+			return err;
+	}
+	if (!test_and_set_bit(BTUSB_ISOC_RUNNING, &data->flags)) {
+		if (btusb_submit_isoc_urb(hdev, GFP_KERNEL) < 0)
+			clear_bit(BTUSB_ISOC_RUNNING, &data->flags);
+		else
+			btusb_submit_isoc_urb(hdev, GFP_KERNEL);
+	}
+
+	return 0;
+}
+
+static struct usb_host_interface *btusb_find_altsetting(struct btusb_data *data, int alt)
+{
+	struct usb_interface *intf = data->isoc;
+	int i;
+
+	BT_DBG("Looking for Alt no :%d", alt);
+
+	if (intf == NULL) {
+		BT_ERR("INterface NULL");
+		return NULL;
+	}
+
+	for (i = 0; i < intf->num_altsetting; i++) {
+		if (intf->altsetting[i].desc.bAlternateSetting == alt)
+			return &intf->altsetting[i];
+	}
+
+	return NULL;
+}
+
 static void btusb_work(struct work_struct *work)
 {
 	struct btusb_data *data = container_of(work, struct btusb_data, work);
 	struct hci_dev *hdev = data->hdev;
-	int new_alts;
+	int new_alts = 0;
 	int err;
 
 	if (data->sco_num > 0) {
@@ -1541,44 +1643,27 @@ static void btusb_work(struct work_struct *work)
 			set_bit(BTUSB_DID_ISO_RESUME, &data->flags);
 		}
 
-		if (hdev->voice_setting & 0x0020) {
-			static const int alts[3] = { 2, 4, 5 };
-
-			new_alts = alts[data->sco_num - 1];
-		} else {
-			new_alts = data->sco_num;
-		}
-
-		if (data->isoc_altsetting != new_alts) {
-			unsigned long flags;
+		if (data->air_mode == HCI_NOTIFY_ENABLE_SCO_CVSD) {
+			if (hdev->voice_setting & 0x0020) {
+				static const int alts[3] = { 2, 4, 5 };
 
-			clear_bit(BTUSB_ISOC_RUNNING, &data->flags);
-			usb_kill_anchored_urbs(&data->isoc_anchor);
-
-			/* When isochronous alternate setting needs to be
-			 * changed, because SCO connection has been added
-			 * or removed, a packet fragment may be left in the
-			 * reassembling state. This could lead to wrongly
-			 * assembled fragments.
-			 *
-			 * Clear outstanding fragment when selecting a new
-			 * alternate setting.
-			 */
-			spin_lock_irqsave(&data->rxlock, flags);
-			kfree_skb(data->sco_skb);
-			data->sco_skb = NULL;
-			spin_unlock_irqrestore(&data->rxlock, flags);
+				new_alts = alts[data->sco_num - 1];
+			} else {
+				new_alts = data->sco_num;
+			}
+		} else if (data->air_mode == HCI_NOTIFY_ENABLE_SCO_TRANSP) {
 
-			if (__set_isoc_interface(hdev, new_alts) < 0)
-				return;
-		}
+			data->usb_alt6_packet_flow = true;
 
-		if (!test_and_set_bit(BTUSB_ISOC_RUNNING, &data->flags)) {
-			if (btusb_submit_isoc_urb(hdev, GFP_KERNEL) < 0)
-				clear_bit(BTUSB_ISOC_RUNNING, &data->flags);
+			/* Check if Alt 6 is supported for Transparent audio*/
+			if (btusb_find_altsetting(data, 6))
+				new_alts = 6;
 			else
-				btusb_submit_isoc_urb(hdev, GFP_KERNEL);
+				BT_ERR("%s Device does not support ALT setting 6", hdev->name);
 		}
+
+		if (bt_switch_alt_setting(hdev, new_alts) < 0)
+			BT_ERR("%s Set USB Alt: %d failed!", hdev->name, new_alts);
 	} else {
 		clear_bit(BTUSB_ISOC_RUNNING, &data->flags);
 		usb_kill_anchored_urbs(&data->isoc_anchor);
-- 
2.17.1

