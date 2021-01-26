Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29E87304CE2
	for <lists+linux-bluetooth@lfdr.de>; Tue, 26 Jan 2021 23:58:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728591AbhAZW6l (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 26 Jan 2021 17:58:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390864AbhAZSvY (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 26 Jan 2021 13:51:24 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 496B3C061573
        for <linux-bluetooth@vger.kernel.org>; Tue, 26 Jan 2021 10:50:44 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id e19so108241pfh.6
        for <linux-bluetooth@vger.kernel.org>; Tue, 26 Jan 2021 10:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jBMzqa3qtIcO1CCyNgFcrc3RJryGxXgpfGAP1UJ1oVM=;
        b=FUWl+V4ZCxcbvJdF70lrahIxWsTlzU+yEsD5ieX9k0pOaP4LdClgsYbe0CMfQe4Olc
         RBSV3HJ6RgyDdIrWvXjLILxm9/mQkTqa1UeHLCCFij0n6pi6erLqTP4xpfqGf4zNKkp+
         iuawNxaFtZEiUVUkjR+9r190nGmh/stbVH4rGp0J13dvynINOFSnZQ6a6xY+0RT+fp0u
         LY8F6mp4cJQs647Ux914F0/+nqPPBbJkuyhjFMFjVch8aaihxRyRbS0PAeSJPybEXt+6
         IDEhr/DUbzm0cBr6RIiCmRERxD+x7dV0b+l7YQFwEy2TSMNimwUXHy6SnD02Grd0P0NF
         TsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jBMzqa3qtIcO1CCyNgFcrc3RJryGxXgpfGAP1UJ1oVM=;
        b=T+PORwxxa5e+RkP5kIdUX0gbFTS7vAAnWMjvcwoWt2z4u0+oSITUcaycoFtpDB3tk6
         uiHsFBrjNvcA/3JDkmC8rzv6NTMiNts2p+cYhCFJLZhfH1CEd2U37tWdnrbMya8Vd5sm
         PW3K3yKUaQ+N4041i7KYDNjGnorao/wV1y1nUZG+2vecXjvb9rq9Uk63stzUlF5q/SfW
         jmHPm8U5uArnbz3GMlwlvzALGBZFephX8SyrixTJq8oeb64D3l34YHN76ORvJQbuh8Ln
         ZQRanaKnoCM8q7Gox7A+nZpKPpxpHqUEJiWr+CABhi5gtPDyMFGyXOauC2c90KEEVMWu
         +jeA==
X-Gm-Message-State: AOAM533h23565yFcyykop+H1997VR98grJ/hbreV8sLS1O1QzHAwx7pB
        37ym7wPpa+nDpKATfpmEqSZJ5jyUiIbCTg==
X-Google-Smtp-Source: ABdhPJwDYttY38IebjQuVok/P8XweZGE/v/cyS7RqkYQ+QQiOf8UOdu+ErIrvB80lbzLpfIhtITzAg==
X-Received: by 2002:a63:560a:: with SMTP id k10mr1241965pgb.132.1611687043472;
        Tue, 26 Jan 2021 10:50:43 -0800 (PST)
Received: from lvondent-mobl4.intel.com (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id 34sm9865226pgn.56.2021.01.26.10.50.42
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 10:50:42 -0800 (PST)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v3] Bluetooth: btusb: Add support for queuing during polling interval
Date:   Tue, 26 Jan 2021 10:50:42 -0800
Message-Id: <20210126185042.114037-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This makes btusb to queue ACL and events during a polling interval
by using of a delayed work, with the interval working as a time window
where frames received from different endpoints are considered to be
arrived at same time and then attempt to resolve potential conflics by
processing the events ahead of ACL packets.

It worth noting though that priorizing events over ACL data may result
in inverting the order compared to how they appeared over the air, for
instance there may be packets received before a disconnect event that
will be discarded and unencrypted packets received before encryption
change which would considered encrypted, because of these potential
changes on the order the support for queuing during the polling
interval is not enabled by default so platforms have the following
means to enable it:

At build-time:

    CONFIG_BT_HCIBTUSB_INTERVAL=y

At runtime with use of module option:

    enable_interval

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---

v2: Calculate the delayed_work interval based on the intr urb->interval which
is derived from endpoint bInterval.
v3: Drop use of a queue for events.

 drivers/bluetooth/Kconfig |  7 +++
 drivers/bluetooth/btusb.c | 98 ++++++++++++++++++++++++++++++++++-----
 2 files changed, 94 insertions(+), 11 deletions(-)

diff --git a/drivers/bluetooth/Kconfig b/drivers/bluetooth/Kconfig
index 4e73a531b377..2f20a853d946 100644
--- a/drivers/bluetooth/Kconfig
+++ b/drivers/bluetooth/Kconfig
@@ -41,6 +41,13 @@ config BT_HCIBTUSB_AUTOSUSPEND
 	  This can be overridden by passing btusb.enable_autosuspend=[y|n]
 	  on the kernel commandline.
 
+config BT_HCIBTUSB_INTERVAL
+	bool "Enable notification of USB polling interval"
+	depends on BT_HCIBTUSB
+	help
+	  Say Y here to enable notification of USB polling interval for
+	  Bluetooth USB devices by default.
+
 config BT_HCIBTUSB_BCM
 	bool "Broadcom protocol support"
 	depends on BT_HCIBTUSB
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index b14102fba601..4266c057746e 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -30,7 +30,7 @@
 static bool disable_scofix;
 static bool force_scofix;
 static bool enable_autosuspend = IS_ENABLED(CONFIG_BT_HCIBTUSB_AUTOSUSPEND);
-
+static bool enable_interval = IS_ENABLED(CONFIG_BT_HCIBTUSB_INTERVAL);
 static bool reset = true;
 
 static struct usb_driver btusb_driver;
@@ -519,8 +519,12 @@ struct btusb_data {
 
 	unsigned long flags;
 
-	struct work_struct work;
-	struct work_struct waker;
+	int intr_interval;
+	struct work_struct  work;
+	struct work_struct  waker;
+	struct delayed_work rx_work;
+
+	struct sk_buff_head acl_q;
 
 	struct usb_anchor deferred;
 	struct usb_anchor tx_anchor;
@@ -557,7 +561,7 @@ struct btusb_data {
 	int isoc_altsetting;
 	int suspend_count;
 
-	int (*recv_event)(struct hci_dev *hdev, struct sk_buff *skb);
+	int (*recv_event)(struct btusb_data *data, struct sk_buff *skb);
 	int (*recv_bulk)(struct btusb_data *data, void *buffer, int count);
 
 	int (*setup_on_usb)(struct hci_dev *hdev);
@@ -707,7 +711,7 @@ static int btusb_recv_intr(struct btusb_data *data, void *buffer, int count)
 
 		if (!hci_skb_expect(skb)) {
 			/* Complete frame */
-			data->recv_event(data->hdev, skb);
+			data->recv_event(data, skb);
 			skb = NULL;
 		}
 	}
@@ -718,6 +722,24 @@ static int btusb_recv_intr(struct btusb_data *data, void *buffer, int count)
 	return err;
 }
 
+static int btusb_rx_queue(struct btusb_data *data, struct sk_buff *skb,
+			  struct sk_buff_head *queue, unsigned int interval)
+{
+	skb_queue_tail(queue, skb);
+
+	schedule_delayed_work(&data->rx_work, interval);
+
+	return 0;
+}
+
+static int btusb_recv_acl(struct btusb_data *data, struct sk_buff *skb)
+{
+	if (!enable_interval)
+		return hci_recv_frame(data->hdev, skb);
+
+	return btusb_rx_queue(data, skb, &data->acl_q, data->intr_interval);
+}
+
 static int btusb_recv_bulk(struct btusb_data *data, void *buffer, int count)
 {
 	struct sk_buff *skb;
@@ -765,7 +787,7 @@ static int btusb_recv_bulk(struct btusb_data *data, void *buffer, int count)
 
 		if (!hci_skb_expect(skb)) {
 			/* Complete frame */
-			hci_recv_frame(data->hdev, skb);
+			btusb_recv_acl(data, skb);
 			skb = NULL;
 		}
 	}
@@ -917,6 +939,19 @@ static int btusb_submit_intr_urb(struct hci_dev *hdev, gfp_t mem_flags)
 		usb_unanchor_urb(urb);
 	}
 
+	/* The units are frames (milliseconds) for full and low speed devices,
+	 * and microframes (1/8 millisecond) for highspeed and SuperSpeed
+	 * devices.
+	 */
+	switch (urb->dev->speed) {
+	case USB_SPEED_SUPER_PLUS:
+	case USB_SPEED_SUPER:	/* units are 125us */
+		data->intr_interval = usecs_to_jiffies(urb->interval * 125);
+		break;
+	default:
+		data->intr_interval = msecs_to_jiffies(urb->interval);
+	}
+
 	usb_free_urb(urb);
 
 	return err;
@@ -1383,9 +1418,12 @@ static int btusb_close(struct hci_dev *hdev)
 
 	BT_DBG("%s", hdev->name);
 
+	cancel_delayed_work(&data->rx_work);
 	cancel_work_sync(&data->work);
 	cancel_work_sync(&data->waker);
 
+	skb_queue_purge(&data->acl_q);
+
 	clear_bit(BTUSB_ISOC_RUNNING, &data->flags);
 	clear_bit(BTUSB_BULK_RUNNING, &data->flags);
 	clear_bit(BTUSB_INTR_RUNNING, &data->flags);
@@ -1417,6 +1455,10 @@ static int btusb_flush(struct hci_dev *hdev)
 
 	BT_DBG("%s", hdev->name);
 
+	cancel_delayed_work(&data->rx_work);
+
+	skb_queue_purge(&data->acl_q);
+
 	usb_kill_anchored_urbs(&data->tx_anchor);
 	btusb_free_frags(data);
 
@@ -1769,6 +1811,24 @@ static void btusb_waker(struct work_struct *work)
 	usb_autopm_put_interface(data->intf);
 }
 
+static void btusb_rx_dequeue(struct btusb_data *data,
+			     struct sk_buff_head *queue)
+{
+	struct sk_buff *skb;
+
+	while ((skb = skb_dequeue(queue)))
+		hci_recv_frame(data->hdev, skb);
+}
+
+static void btusb_rx_work(struct work_struct *work)
+{
+	struct btusb_data *data = container_of(work, struct btusb_data,
+					       rx_work.work);
+
+	/* Dequeue ACL data received during the interval */
+	btusb_rx_dequeue(data, &data->acl_q);
+}
+
 static int btusb_setup_bcm92035(struct hci_dev *hdev)
 {
 	struct sk_buff *skb;
@@ -2304,10 +2364,8 @@ static void btusb_intel_secure_send_result(struct btusb_data *data,
 		wake_up_bit(&data->flags, BTUSB_DOWNLOADING);
 }
 
-static int btusb_recv_event_intel(struct hci_dev *hdev, struct sk_buff *skb)
+static int btusb_recv_event_intel(struct btusb_data *data, struct sk_buff *skb)
 {
-	struct btusb_data *data = hci_get_drvdata(hdev);
-
 	if (test_bit(BTUSB_BOOTLOADER, &data->flags)) {
 		struct hci_event_hdr *hdr = (void *)skb->data;
 
@@ -2336,7 +2394,7 @@ static int btusb_recv_event_intel(struct hci_dev *hdev, struct sk_buff *skb)
 		}
 	}
 
-	return hci_recv_frame(hdev, skb);
+	return hci_recv_frame(data->hdev, skb);
 }
 
 static int btusb_send_frame_intel(struct hci_dev *hdev, struct sk_buff *skb)
@@ -4279,6 +4337,17 @@ static int btusb_shutdown_qca(struct hci_dev *hdev)
 	return 0;
 }
 
+static int btusb_recv_evt(struct btusb_data *data, struct sk_buff *skb)
+{
+	if (!enable_interval)
+		return hci_recv_frame(data->hdev, skb);
+
+	/* Trigger dequeue immediatelly if an event is received */
+	schedule_delayed_work(&data->rx_work, 0);
+
+	return hci_recv_frame(data->hdev, skb);
+}
+
 static int btusb_probe(struct usb_interface *intf,
 		       const struct usb_device_id *id)
 {
@@ -4362,6 +4431,10 @@ static int btusb_probe(struct usb_interface *intf,
 
 	INIT_WORK(&data->work, btusb_work);
 	INIT_WORK(&data->waker, btusb_waker);
+	INIT_DELAYED_WORK(&data->rx_work, btusb_rx_work);
+
+	skb_queue_head_init(&data->acl_q);
+
 	init_usb_anchor(&data->deferred);
 	init_usb_anchor(&data->tx_anchor);
 	spin_lock_init(&data->txlock);
@@ -4378,7 +4451,7 @@ static int btusb_probe(struct usb_interface *intf,
 		data->recv_bulk = btusb_recv_bulk_intel;
 		set_bit(BTUSB_BOOTLOADER, &data->flags);
 	} else {
-		data->recv_event = hci_recv_frame;
+		data->recv_event = btusb_recv_evt;
 		data->recv_bulk = btusb_recv_bulk;
 	}
 
@@ -4867,6 +4940,9 @@ MODULE_PARM_DESC(force_scofix, "Force fixup of wrong SCO buffers size");
 module_param(enable_autosuspend, bool, 0644);
 MODULE_PARM_DESC(enable_autosuspend, "Enable USB autosuspend by default");
 
+module_param(enable_interval, bool, 0644);
+MODULE_PARM_DESC(enable_interval, "Enable USB polling interval by default");
+
 module_param(reset, bool, 0644);
 MODULE_PARM_DESC(reset, "Send HCI reset command on initialization");
 
-- 
2.26.2

