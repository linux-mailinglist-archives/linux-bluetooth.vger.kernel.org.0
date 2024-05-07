Return-Path: <linux-bluetooth+bounces-4354-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D18F8BE622
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 May 2024 16:37:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 828E41C23D13
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 May 2024 14:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2015215FD1A;
	Tue,  7 May 2024 14:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HqNJqSl5"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B964814EC53
	for <linux-bluetooth@vger.kernel.org>; Tue,  7 May 2024 14:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715092606; cv=none; b=kzny0E0njxdn5uGddk2V5tg7IpDa+HnB+jpLrzd+PJpXMqhFixWj2gdMp/95gXeZWVNv072GvB1fBk6QCWzJKtS5+w6Jza6/laHbdfhdNbwDTYBnfNqDfPIH5QrZ2j6vh78w9Vzql5rO+wOL6v+TPsHj23RTBHtyDkyNRmqlOdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715092606; c=relaxed/simple;
	bh=Iiu8u/EP6J/VshaujZrGhAdjawjHgJ5FEkf+UN0fD9Y=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=n6WXVezR57YViYrbjrycQ8PraI6BOmr+6BGbA5EbqjXtn7Y5SC8TT1+wOVDQGOA1JoUvrGD/JUX9HoOiIlZmXoPP6+i1OUHnPNy8waCv5P2hjzaDaIYHIUzrPOeancD/8AKjrjevSYuAxoF8VUDUsOkrOcP6SnrJVFj7N1Gvd0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HqNJqSl5; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-de5e74939fdso2678446276.0
        for <linux-bluetooth@vger.kernel.org>; Tue, 07 May 2024 07:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715092602; x=1715697402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yowlQ7rBiB6juUAvUQQkdLeTn3fi9nwR4V1+RYP4sDU=;
        b=HqNJqSl5E1wCBj51Z1j9LglPciEaQ/wwb07lBJCcRNX8+hZvGw9dtKl9TCMxTabFbu
         cLe5HHJ9W/Qwow8dfCN9FHQZA6i/Q648phDGUcbQprJUfjHgzgogjZwasxWOqNNimUmE
         bvYa0KFZQMkndsfmdXpmcKVnXGd4tQaCIkED/AHkjil3zpFWqc/9K4iCuBST8rbQzuxx
         V9f4klbNUW2DPYN970P6bJaMHITwNRUfHWeplGtqLbND4vO4MSPWTa7XRiC2SDRNsyWL
         X8kj/hGyK9QF9Utw35TD+zuhxwvTRDNMCG+2baGV82P07gCj++gni+QhnlN4ya9IHMZM
         pVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715092602; x=1715697402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yowlQ7rBiB6juUAvUQQkdLeTn3fi9nwR4V1+RYP4sDU=;
        b=d5oKF9Zxqg7+P3LGYJoZ04EQ8HH/XLBxUzUd4Pwnl7PK0to0c2pLYT0yJCMKcWA+2d
         m8XEpCt0YgaymeiqybEH3f+N1B13LfOiDJDNXMNEZlW9EAxpQmnhAyDQE4hDRvaD9RZz
         j8IOlMOEwV3pFmMyxsrxVdMsXV2C1BytHaK5Qj0lzRhatiCjThY4zNebr2vEQO0Pa+7N
         wuzLUTVq1PJ13t+mftm9WXrRBhlgYsnHE1EQAB/VbG461sZGTX4dAp5q07czzhOm8sHS
         7jywCMNPhVCI961QqG0m2SbTP9pJijHgzIP3p4PJ+R2zpShKoA9Y3eLsQD4WQj6cdcvk
         ERnQ==
X-Gm-Message-State: AOJu0YzRQx9Hbvsc3PZ7lqwIkzG+rbSxDr+ML2hZn3lTVGWz/Yo+GBZd
	kisKDC2IwsGWZZwYs0q+l5qWnphnMuEQuQbswpLH8/mzpWPW0C9c1239wQ==
X-Google-Smtp-Source: AGHT+IEZ3yxFBx2UU5tnHs/xlrxxLvpB7o/oHoX5sG0M3P5k1vOzF2CLKgdyBEKOr/EtxOQ3e+v9YA==
X-Received: by 2002:a25:dc89:0:b0:dcb:e82c:f7d with SMTP id y131-20020a25dc89000000b00dcbe82c0f7dmr12996287ybe.41.1715092601548;
        Tue, 07 May 2024 07:36:41 -0700 (PDT)
Received: from lvondent-mobl4.. (syn-107-146-107-067.res.spectrum.com. [107.146.107.67])
        by smtp.gmail.com with ESMTPSA id 5-20020a250905000000b00de896cb3a47sm994355ybj.61.2024.05.07.07.36.40
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 07:36:40 -0700 (PDT)
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH v2] Bluetooth: HCI: Remove HCI_AMP support
Date: Tue,  7 May 2024 10:36:39 -0400
Message-ID: <20240507143639.539863-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

Since BT_HS has been remove HCI_AMP controllers no longer has any use so
remove it along with the capability of creating AMP controllers.

Since we no longer need to differentiate between AMP and Primary
controllers, as only HCI_PRIMARY is left, this also remove
hdev->dev_type altogether.

Fixes: cec9f3c5561d ("Bluetooth: Remove BT_HS")
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 drivers/bluetooth/btmrvl_main.c  |   9 --
 drivers/bluetooth/btrsi.c        |   1 -
 drivers/bluetooth/btsdio.c       |   8 --
 drivers/bluetooth/btusb.c        |   5 -
 drivers/bluetooth/hci_bcm4377.c  |   1 -
 drivers/bluetooth/hci_ldisc.c    |   6 --
 drivers/bluetooth/hci_serdev.c   |   5 -
 drivers/bluetooth/hci_uart.h     |   1 -
 drivers/bluetooth/hci_vhci.c     |  10 +-
 drivers/bluetooth/virtio_bt.c    |   2 -
 include/net/bluetooth/hci.h      | 114 -----------------------
 include/net/bluetooth/hci_core.h |  46 +---------
 include/uapi/linux/virtio_bt.h   |   1 -
 net/bluetooth/hci_conn.c         |   3 +-
 net/bluetooth/hci_core.c         | 132 ++-------------------------
 net/bluetooth/hci_event.c        | 152 -------------------------------
 net/bluetooth/hci_sock.c         |   5 +-
 net/bluetooth/hci_sync.c         | 112 +----------------------
 net/bluetooth/l2cap_core.c       |  24 +----
 net/bluetooth/mgmt.c             |  84 ++++++-----------
 20 files changed, 50 insertions(+), 671 deletions(-)

diff --git a/drivers/bluetooth/btmrvl_main.c b/drivers/bluetooth/btmrvl_main.c
index 9658b33c824a..18f34998a120 100644
--- a/drivers/bluetooth/btmrvl_main.c
+++ b/drivers/bluetooth/btmrvl_main.c
@@ -121,13 +121,6 @@ int btmrvl_process_event(struct btmrvl_private *priv, struct sk_buff *skb)
 				((event->data[2] == MODULE_BROUGHT_UP) ||
 				(event->data[2] == MODULE_ALREADY_UP)) ?
 				"Bring-up succeed" : "Bring-up failed");
-
-			if (event->length > 3 && event->data[3])
-				priv->btmrvl_dev.dev_type = HCI_AMP;
-			else
-				priv->btmrvl_dev.dev_type = HCI_PRIMARY;
-
-			BT_DBG("dev_type: %d", priv->btmrvl_dev.dev_type);
 		} else if (priv->btmrvl_dev.sendcmdflag &&
 				event->data[1] == MODULE_SHUTDOWN_REQ) {
 			BT_DBG("EVENT:%s", (event->data[2]) ?
@@ -686,8 +679,6 @@ int btmrvl_register_hdev(struct btmrvl_private *priv)
 	hdev->wakeup = btmrvl_wakeup;
 	SET_HCIDEV_DEV(hdev, &card->func->dev);
 
-	hdev->dev_type = priv->btmrvl_dev.dev_type;
-
 	ret = hci_register_dev(hdev);
 	if (ret < 0) {
 		BT_ERR("Can not register HCI device");
diff --git a/drivers/bluetooth/btrsi.c b/drivers/bluetooth/btrsi.c
index 634cf8f5ed2d..0c91d7635ac3 100644
--- a/drivers/bluetooth/btrsi.c
+++ b/drivers/bluetooth/btrsi.c
@@ -134,7 +134,6 @@ static int rsi_hci_attach(void *priv, struct rsi_proto_ops *ops)
 		hdev->bus = HCI_USB;
 
 	hci_set_drvdata(hdev, h_adapter);
-	hdev->dev_type = HCI_PRIMARY;
 	hdev->open = rsi_hci_open;
 	hdev->close = rsi_hci_close;
 	hdev->flush = rsi_hci_flush;
diff --git a/drivers/bluetooth/btsdio.c b/drivers/bluetooth/btsdio.c
index f19d31ee37ea..fdcfe9c50313 100644
--- a/drivers/bluetooth/btsdio.c
+++ b/drivers/bluetooth/btsdio.c
@@ -32,9 +32,6 @@ static const struct sdio_device_id btsdio_table[] = {
 	/* Generic Bluetooth Type-B SDIO device */
 	{ SDIO_DEVICE_CLASS(SDIO_CLASS_BT_B) },
 
-	/* Generic Bluetooth AMP controller */
-	{ SDIO_DEVICE_CLASS(SDIO_CLASS_BT_AMP) },
-
 	{ }	/* Terminating entry */
 };
 
@@ -319,11 +316,6 @@ static int btsdio_probe(struct sdio_func *func,
 	hdev->bus = HCI_SDIO;
 	hci_set_drvdata(hdev, data);
 
-	if (id->class == SDIO_CLASS_BT_AMP)
-		hdev->dev_type = HCI_AMP;
-	else
-		hdev->dev_type = HCI_PRIMARY;
-
 	data->hdev = hdev;
 
 	SET_HCIDEV_DEV(hdev, &func->dev);
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 90d1f1697357..e384ef6ff050 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -4359,11 +4359,6 @@ static int btusb_probe(struct usb_interface *intf,
 	hdev->bus = HCI_USB;
 	hci_set_drvdata(hdev, data);
 
-	if (id->driver_info & BTUSB_AMP)
-		hdev->dev_type = HCI_AMP;
-	else
-		hdev->dev_type = HCI_PRIMARY;
-
 	data->hdev = hdev;
 
 	SET_HCIDEV_DEV(hdev, &intf->dev);
diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4377.c
index 9a7243d5db71..0c2f15235b4c 100644
--- a/drivers/bluetooth/hci_bcm4377.c
+++ b/drivers/bluetooth/hci_bcm4377.c
@@ -2361,7 +2361,6 @@ static int bcm4377_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	bcm4377->hdev = hdev;
 
 	hdev->bus = HCI_PCI;
-	hdev->dev_type = HCI_PRIMARY;
 	hdev->open = bcm4377_hci_open;
 	hdev->close = bcm4377_hci_close;
 	hdev->send = bcm4377_hci_send_frame;
diff --git a/drivers/bluetooth/hci_ldisc.c b/drivers/bluetooth/hci_ldisc.c
index a26367e9fb19..17a2f158a0df 100644
--- a/drivers/bluetooth/hci_ldisc.c
+++ b/drivers/bluetooth/hci_ldisc.c
@@ -667,11 +667,6 @@ static int hci_uart_register_dev(struct hci_uart *hu)
 	if (!test_bit(HCI_UART_RESET_ON_INIT, &hu->hdev_flags))
 		set_bit(HCI_QUIRK_RESET_ON_CLOSE, &hdev->quirks);
 
-	if (test_bit(HCI_UART_CREATE_AMP, &hu->hdev_flags))
-		hdev->dev_type = HCI_AMP;
-	else
-		hdev->dev_type = HCI_PRIMARY;
-
 	/* Only call open() for the protocol after hdev is fully initialized as
 	 * open() (or a timer/workqueue it starts) may attempt to reference it.
 	 */
@@ -722,7 +717,6 @@ static int hci_uart_set_flags(struct hci_uart *hu, unsigned long flags)
 {
 	unsigned long valid_flags = BIT(HCI_UART_RAW_DEVICE) |
 				    BIT(HCI_UART_RESET_ON_INIT) |
-				    BIT(HCI_UART_CREATE_AMP) |
 				    BIT(HCI_UART_INIT_PENDING) |
 				    BIT(HCI_UART_EXT_CONFIG) |
 				    BIT(HCI_UART_VND_DETECT);
diff --git a/drivers/bluetooth/hci_serdev.c b/drivers/bluetooth/hci_serdev.c
index 85c0d9b68f5f..89a22e9b3253 100644
--- a/drivers/bluetooth/hci_serdev.c
+++ b/drivers/bluetooth/hci_serdev.c
@@ -366,11 +366,6 @@ int hci_uart_register_device_priv(struct hci_uart *hu,
 	if (test_bit(HCI_UART_EXT_CONFIG, &hu->hdev_flags))
 		set_bit(HCI_QUIRK_EXTERNAL_CONFIG, &hdev->quirks);
 
-	if (test_bit(HCI_UART_CREATE_AMP, &hu->hdev_flags))
-		hdev->dev_type = HCI_AMP;
-	else
-		hdev->dev_type = HCI_PRIMARY;
-
 	if (test_bit(HCI_UART_INIT_PENDING, &hu->hdev_flags))
 		return 0;
 
diff --git a/drivers/bluetooth/hci_uart.h b/drivers/bluetooth/hci_uart.h
index 68c8c7e95d64..00bf7ae82c5b 100644
--- a/drivers/bluetooth/hci_uart.h
+++ b/drivers/bluetooth/hci_uart.h
@@ -37,7 +37,6 @@
 
 #define HCI_UART_RAW_DEVICE	0
 #define HCI_UART_RESET_ON_INIT	1
-#define HCI_UART_CREATE_AMP	2
 #define HCI_UART_INIT_PENDING	3
 #define HCI_UART_EXT_CONFIG	4
 #define HCI_UART_VND_DETECT	5
diff --git a/drivers/bluetooth/hci_vhci.c b/drivers/bluetooth/hci_vhci.c
index 572d68d52965..28750a40f0ed 100644
--- a/drivers/bluetooth/hci_vhci.c
+++ b/drivers/bluetooth/hci_vhci.c
@@ -384,17 +384,10 @@ static int __vhci_create_device(struct vhci_data *data, __u8 opcode)
 {
 	struct hci_dev *hdev;
 	struct sk_buff *skb;
-	__u8 dev_type;
 
 	if (data->hdev)
 		return -EBADFD;
 
-	/* bits 0-1 are dev_type (Primary or AMP) */
-	dev_type = opcode & 0x03;
-
-	if (dev_type != HCI_PRIMARY && dev_type != HCI_AMP)
-		return -EINVAL;
-
 	/* bits 2-5 are reserved (must be zero) */
 	if (opcode & 0x3c)
 		return -EINVAL;
@@ -412,7 +405,6 @@ static int __vhci_create_device(struct vhci_data *data, __u8 opcode)
 	data->hdev = hdev;
 
 	hdev->bus = HCI_VIRTUAL;
-	hdev->dev_type = dev_type;
 	hci_set_drvdata(hdev, data);
 
 	hdev->open  = vhci_open_dev;
@@ -634,7 +626,7 @@ static void vhci_open_timeout(struct work_struct *work)
 	struct vhci_data *data = container_of(work, struct vhci_data,
 					      open_timeout.work);
 
-	vhci_create_device(data, amp ? HCI_AMP : HCI_PRIMARY);
+	vhci_create_device(data, 0x00);
 }
 
 static int vhci_open(struct inode *inode, struct file *file)
diff --git a/drivers/bluetooth/virtio_bt.c b/drivers/bluetooth/virtio_bt.c
index 2ac70b560c46..18208e152a36 100644
--- a/drivers/bluetooth/virtio_bt.c
+++ b/drivers/bluetooth/virtio_bt.c
@@ -274,7 +274,6 @@ static int virtbt_probe(struct virtio_device *vdev)
 
 	switch (type) {
 	case VIRTIO_BT_CONFIG_TYPE_PRIMARY:
-	case VIRTIO_BT_CONFIG_TYPE_AMP:
 		break;
 	default:
 		return -EINVAL;
@@ -303,7 +302,6 @@ static int virtbt_probe(struct virtio_device *vdev)
 	vbt->hdev = hdev;
 
 	hdev->bus = HCI_VIRTIO;
-	hdev->dev_type = type;
 	hci_set_drvdata(hdev, vbt);
 
 	hdev->open  = virtbt_open;
diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
index de530262d824..fe932ca3bc8c 100644
--- a/include/net/bluetooth/hci.h
+++ b/include/net/bluetooth/hci.h
@@ -33,9 +33,6 @@
 #define HCI_MAX_FRAME_SIZE	(HCI_MAX_ACL_SIZE + 4)
 
 #define HCI_LINK_KEY_SIZE	16
-#define HCI_AMP_LINK_KEY_SIZE	(2 * HCI_LINK_KEY_SIZE)
-
-#define HCI_MAX_AMP_ASSOC_SIZE	672
 
 #define HCI_MAX_CPB_DATA_SIZE	252
 
@@ -71,26 +68,6 @@
 #define HCI_SMD		9
 #define HCI_VIRTIO	10
 
-/* HCI controller types */
-#define HCI_PRIMARY	0x00
-#define HCI_AMP		0x01
-
-/* First BR/EDR Controller shall have ID = 0 */
-#define AMP_ID_BREDR	0x00
-
-/* AMP controller types */
-#define AMP_TYPE_BREDR	0x00
-#define AMP_TYPE_80211	0x01
-
-/* AMP controller status */
-#define AMP_STATUS_POWERED_DOWN			0x00
-#define AMP_STATUS_BLUETOOTH_ONLY		0x01
-#define AMP_STATUS_NO_CAPACITY			0x02
-#define AMP_STATUS_LOW_CAPACITY			0x03
-#define AMP_STATUS_MEDIUM_CAPACITY		0x04
-#define AMP_STATUS_HIGH_CAPACITY		0x05
-#define AMP_STATUS_FULL_CAPACITY		0x06
-
 /* HCI device quirks */
 enum {
 	/* When this quirk is set, the HCI Reset command is send when
@@ -527,7 +504,6 @@ enum {
 #define ESCO_LINK	0x02
 /* Low Energy links do not have defined link type. Use invented one */
 #define LE_LINK		0x80
-#define AMP_LINK	0x81
 #define ISO_LINK	0x82
 #define INVALID_LINK	0xff
 
@@ -943,56 +919,6 @@ struct hci_cp_io_capability_neg_reply {
 	__u8     reason;
 } __packed;
 
-#define HCI_OP_CREATE_PHY_LINK		0x0435
-struct hci_cp_create_phy_link {
-	__u8     phy_handle;
-	__u8     key_len;
-	__u8     key_type;
-	__u8     key[HCI_AMP_LINK_KEY_SIZE];
-} __packed;
-
-#define HCI_OP_ACCEPT_PHY_LINK		0x0436
-struct hci_cp_accept_phy_link {
-	__u8     phy_handle;
-	__u8     key_len;
-	__u8     key_type;
-	__u8     key[HCI_AMP_LINK_KEY_SIZE];
-} __packed;
-
-#define HCI_OP_DISCONN_PHY_LINK		0x0437
-struct hci_cp_disconn_phy_link {
-	__u8     phy_handle;
-	__u8     reason;
-} __packed;
-
-struct ext_flow_spec {
-	__u8       id;
-	__u8       stype;
-	__le16     msdu;
-	__le32     sdu_itime;
-	__le32     acc_lat;
-	__le32     flush_to;
-} __packed;
-
-#define HCI_OP_CREATE_LOGICAL_LINK	0x0438
-#define HCI_OP_ACCEPT_LOGICAL_LINK	0x0439
-struct hci_cp_create_accept_logical_link {
-	__u8                  phy_handle;
-	struct ext_flow_spec  tx_flow_spec;
-	struct ext_flow_spec  rx_flow_spec;
-} __packed;
-
-#define HCI_OP_DISCONN_LOGICAL_LINK	0x043a
-struct hci_cp_disconn_logical_link {
-	__le16   log_handle;
-} __packed;
-
-#define HCI_OP_LOGICAL_LINK_CANCEL	0x043b
-struct hci_cp_logical_link_cancel {
-	__u8     phy_handle;
-	__u8     flow_spec_id;
-} __packed;
-
 #define HCI_OP_ENHANCED_SETUP_SYNC_CONN		0x043d
 struct hci_coding_format {
 	__u8	id;
@@ -1614,46 +1540,6 @@ struct hci_rp_read_enc_key_size {
 	__u8     key_size;
 } __packed;
 
-#define HCI_OP_READ_LOCAL_AMP_INFO	0x1409
-struct hci_rp_read_local_amp_info {
-	__u8     status;
-	__u8     amp_status;
-	__le32   total_bw;
-	__le32   max_bw;
-	__le32   min_latency;
-	__le32   max_pdu;
-	__u8     amp_type;
-	__le16   pal_cap;
-	__le16   max_assoc_size;
-	__le32   max_flush_to;
-	__le32   be_flush_to;
-} __packed;
-
-#define HCI_OP_READ_LOCAL_AMP_ASSOC	0x140a
-struct hci_cp_read_local_amp_assoc {
-	__u8     phy_handle;
-	__le16   len_so_far;
-	__le16   max_len;
-} __packed;
-struct hci_rp_read_local_amp_assoc {
-	__u8     status;
-	__u8     phy_handle;
-	__le16   rem_len;
-	__u8     frag[];
-} __packed;
-
-#define HCI_OP_WRITE_REMOTE_AMP_ASSOC	0x140b
-struct hci_cp_write_remote_amp_assoc {
-	__u8     phy_handle;
-	__le16   len_so_far;
-	__le16   rem_len;
-	__u8     frag[];
-} __packed;
-struct hci_rp_write_remote_amp_assoc {
-	__u8     status;
-	__u8     phy_handle;
-} __packed;
-
 #define HCI_OP_GET_MWS_TRANSPORT_CONFIG	0x140c
 
 #define HCI_OP_ENABLE_DUT_MODE		0x1803
diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index 1f72962e44ca..68eeecf5229c 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -126,7 +126,6 @@ enum suspended_state {
 struct hci_conn_hash {
 	struct list_head list;
 	unsigned int     acl_num;
-	unsigned int     amp_num;
 	unsigned int     sco_num;
 	unsigned int     iso_num;
 	unsigned int     le_num;
@@ -347,14 +346,6 @@ struct adv_monitor {
 /* Default authenticated payload timeout 30s */
 #define DEFAULT_AUTH_PAYLOAD_TIMEOUT   0x0bb8
 
-struct amp_assoc {
-	__u16	len;
-	__u16	offset;
-	__u16	rem_len;
-	__u16	len_so_far;
-	__u8	data[HCI_MAX_AMP_ASSOC_SIZE];
-};
-
 #define HCI_MAX_PAGES	3
 
 struct hci_dev {
@@ -367,7 +358,6 @@ struct hci_dev {
 	unsigned long	flags;
 	__u16		id;
 	__u8		bus;
-	__u8		dev_type;
 	bdaddr_t	bdaddr;
 	bdaddr_t	setup_addr;
 	bdaddr_t	public_addr;
@@ -473,21 +463,6 @@ struct hci_dev {
 	__u16		sniff_min_interval;
 	__u16		sniff_max_interval;
 
-	__u8		amp_status;
-	__u32		amp_total_bw;
-	__u32		amp_max_bw;
-	__u32		amp_min_latency;
-	__u32		amp_max_pdu;
-	__u8		amp_type;
-	__u16		amp_pal_cap;
-	__u16		amp_assoc_size;
-	__u32		amp_max_flush_to;
-	__u32		amp_be_flush_to;
-
-	struct amp_assoc	loc_assoc;
-
-	__u8		flow_ctl_mode;
-
 	unsigned int	auto_accept_delay;
 
 	unsigned long	quirks;
@@ -507,11 +482,6 @@ struct hci_dev {
 	unsigned int	le_pkts;
 	unsigned int	iso_pkts;
 
-	__u16		block_len;
-	__u16		block_mtu;
-	__u16		num_blocks;
-	__u16		block_cnt;
-
 	unsigned long	acl_last_tx;
 	unsigned long	sco_last_tx;
 	unsigned long	le_last_tx;
@@ -786,7 +756,6 @@ struct hci_conn {
 	void		*l2cap_data;
 	void		*sco_data;
 	void		*iso_data;
-	struct amp_mgr	*amp_mgr;
 
 	struct list_head link_list;
 	struct hci_conn	*parent;
@@ -813,7 +782,6 @@ struct hci_chan {
 	struct sk_buff_head data_q;
 	unsigned int	sent;
 	__u8		state;
-	bool		amp;
 };
 
 struct hci_conn_params {
@@ -1022,9 +990,6 @@ static inline void hci_conn_hash_add(struct hci_dev *hdev, struct hci_conn *c)
 	case ACL_LINK:
 		h->acl_num++;
 		break;
-	case AMP_LINK:
-		h->amp_num++;
-		break;
 	case LE_LINK:
 		h->le_num++;
 		if (c->role == HCI_ROLE_SLAVE)
@@ -1051,9 +1016,6 @@ static inline void hci_conn_hash_del(struct hci_dev *hdev, struct hci_conn *c)
 	case ACL_LINK:
 		h->acl_num--;
 		break;
-	case AMP_LINK:
-		h->amp_num--;
-		break;
 	case LE_LINK:
 		h->le_num--;
 		if (c->role == HCI_ROLE_SLAVE)
@@ -1075,8 +1037,6 @@ static inline unsigned int hci_conn_num(struct hci_dev *hdev, __u8 type)
 	switch (type) {
 	case ACL_LINK:
 		return h->acl_num;
-	case AMP_LINK:
-		return h->amp_num;
 	case LE_LINK:
 		return h->le_num;
 	case SCO_LINK:
@@ -1093,7 +1053,7 @@ static inline unsigned int hci_conn_count(struct hci_dev *hdev)
 {
 	struct hci_conn_hash *c = &hdev->conn_hash;
 
-	return c->acl_num + c->amp_num + c->sco_num + c->le_num + c->iso_num;
+	return c->acl_num + c->sco_num + c->le_num + c->iso_num;
 }
 
 static inline bool hci_conn_valid(struct hci_dev *hdev, struct hci_conn *conn)
@@ -1622,10 +1582,6 @@ static inline void hci_conn_drop(struct hci_conn *conn)
 			}
 			break;
 
-		case AMP_LINK:
-			timeo = conn->disc_timeout;
-			break;
-
 		default:
 			timeo = 0;
 			break;
diff --git a/include/uapi/linux/virtio_bt.h b/include/uapi/linux/virtio_bt.h
index af798f4c9680..3cc7d633456b 100644
--- a/include/uapi/linux/virtio_bt.h
+++ b/include/uapi/linux/virtio_bt.h
@@ -13,7 +13,6 @@
 
 enum virtio_bt_config_type {
 	VIRTIO_BT_CONFIG_TYPE_PRIMARY	= 0,
-	VIRTIO_BT_CONFIG_TYPE_AMP	= 1,
 };
 
 enum virtio_bt_config_vendor {
diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
index 171a667bc991..94e8a0c6b590 100644
--- a/net/bluetooth/hci_conn.c
+++ b/net/bluetooth/hci_conn.c
@@ -1171,8 +1171,7 @@ struct hci_dev *hci_get_route(bdaddr_t *dst, bdaddr_t *src, uint8_t src_type)
 
 	list_for_each_entry(d, &hci_dev_list, list) {
 		if (!test_bit(HCI_UP, &d->flags) ||
-		    hci_dev_test_flag(d, HCI_USER_CHANNEL) ||
-		    d->dev_type != HCI_PRIMARY)
+		    hci_dev_test_flag(d, HCI_USER_CHANNEL))
 			continue;
 
 		/* Simple routing:
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 0efd59760ace..adfd53a9fcd4 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -402,11 +402,6 @@ int hci_inquiry(void __user *arg)
 		goto done;
 	}
 
-	if (hdev->dev_type != HCI_PRIMARY) {
-		err = -EOPNOTSUPP;
-		goto done;
-	}
-
 	if (!hci_dev_test_flag(hdev, HCI_BREDR_ENABLED)) {
 		err = -EOPNOTSUPP;
 		goto done;
@@ -759,11 +754,6 @@ int hci_dev_cmd(unsigned int cmd, void __user *arg)
 		goto done;
 	}
 
-	if (hdev->dev_type != HCI_PRIMARY) {
-		err = -EOPNOTSUPP;
-		goto done;
-	}
-
 	if (!hci_dev_test_flag(hdev, HCI_BREDR_ENABLED)) {
 		err = -EOPNOTSUPP;
 		goto done;
@@ -917,7 +907,7 @@ int hci_get_dev_info(void __user *arg)
 
 	strscpy(di.name, hdev->name, sizeof(di.name));
 	di.bdaddr   = hdev->bdaddr;
-	di.type     = (hdev->bus & 0x0f) | ((hdev->dev_type & 0x03) << 4);
+	di.type     = (hdev->bus & 0x0f);
 	di.flags    = flags;
 	di.pkt_type = hdev->pkt_type;
 	if (lmp_bredr_capable(hdev)) {
@@ -1033,8 +1023,7 @@ static void hci_power_on(struct work_struct *work)
 	 */
 	if (hci_dev_test_flag(hdev, HCI_RFKILLED) ||
 	    hci_dev_test_flag(hdev, HCI_UNCONFIGURED) ||
-	    (hdev->dev_type == HCI_PRIMARY &&
-	     !bacmp(&hdev->bdaddr, BDADDR_ANY) &&
+	    (!bacmp(&hdev->bdaddr, BDADDR_ANY) &&
 	     !bacmp(&hdev->static_addr, BDADDR_ANY))) {
 		hci_dev_clear_flag(hdev, HCI_AUTO_OFF);
 		hci_dev_do_close(hdev);
@@ -2642,21 +2631,7 @@ int hci_register_dev(struct hci_dev *hdev)
 	if (!hdev->open || !hdev->close || !hdev->send)
 		return -EINVAL;
 
-	/* Do not allow HCI_AMP devices to register at index 0,
-	 * so the index can be used as the AMP controller ID.
-	 */
-	switch (hdev->dev_type) {
-	case HCI_PRIMARY:
-		id = ida_alloc_max(&hci_index_ida, HCI_MAX_ID - 1, GFP_KERNEL);
-		break;
-	case HCI_AMP:
-		id = ida_alloc_range(&hci_index_ida, 1, HCI_MAX_ID - 1,
-				     GFP_KERNEL);
-		break;
-	default:
-		return -EINVAL;
-	}
-
+	id = ida_alloc_max(&hci_index_ida, HCI_MAX_ID - 1, GFP_KERNEL);
 	if (id < 0)
 		return id;
 
@@ -2708,12 +2683,10 @@ int hci_register_dev(struct hci_dev *hdev)
 	hci_dev_set_flag(hdev, HCI_SETUP);
 	hci_dev_set_flag(hdev, HCI_AUTO_OFF);
 
-	if (hdev->dev_type == HCI_PRIMARY) {
-		/* Assume BR/EDR support until proven otherwise (such as
-		 * through reading supported features during init.
-		 */
-		hci_dev_set_flag(hdev, HCI_BREDR_ENABLED);
-	}
+	/* Assume BR/EDR support until proven otherwise (such as
+	 * through reading supported features during init.
+	 */
+	hci_dev_set_flag(hdev, HCI_BREDR_ENABLED);
 
 	write_lock(&hci_dev_list_lock);
 	list_add(&hdev->list, &hci_dev_list);
@@ -3256,17 +3229,7 @@ static void hci_queue_acl(struct hci_chan *chan, struct sk_buff_head *queue,
 
 	hci_skb_pkt_type(skb) = HCI_ACLDATA_PKT;
 
-	switch (hdev->dev_type) {
-	case HCI_PRIMARY:
-		hci_add_acl_hdr(skb, conn->handle, flags);
-		break;
-	case HCI_AMP:
-		hci_add_acl_hdr(skb, chan->handle, flags);
-		break;
-	default:
-		bt_dev_err(hdev, "unknown dev_type %d", hdev->dev_type);
-		return;
-	}
+	hci_add_acl_hdr(skb, conn->handle, flags);
 
 	list = skb_shinfo(skb)->frag_list;
 	if (!list) {
@@ -3426,9 +3389,6 @@ static inline void hci_quote_sent(struct hci_conn *conn, int num, int *quote)
 	case ACL_LINK:
 		cnt = hdev->acl_cnt;
 		break;
-	case AMP_LINK:
-		cnt = hdev->block_cnt;
-		break;
 	case SCO_LINK:
 	case ESCO_LINK:
 		cnt = hdev->sco_cnt;
@@ -3626,12 +3586,6 @@ static void hci_prio_recalculate(struct hci_dev *hdev, __u8 type)
 
 }
 
-static inline int __get_blocks(struct hci_dev *hdev, struct sk_buff *skb)
-{
-	/* Calculate count of blocks used by this packet */
-	return DIV_ROUND_UP(skb->len - HCI_ACL_HDR_SIZE, hdev->block_len);
-}
-
 static void __check_timeout(struct hci_dev *hdev, unsigned int cnt, u8 type)
 {
 	unsigned long last_tx;
@@ -3745,81 +3699,15 @@ static void hci_sched_acl_pkt(struct hci_dev *hdev)
 		hci_prio_recalculate(hdev, ACL_LINK);
 }
 
-static void hci_sched_acl_blk(struct hci_dev *hdev)
-{
-	unsigned int cnt = hdev->block_cnt;
-	struct hci_chan *chan;
-	struct sk_buff *skb;
-	int quote;
-	u8 type;
-
-	BT_DBG("%s", hdev->name);
-
-	if (hdev->dev_type == HCI_AMP)
-		type = AMP_LINK;
-	else
-		type = ACL_LINK;
-
-	__check_timeout(hdev, cnt, type);
-
-	while (hdev->block_cnt > 0 &&
-	       (chan = hci_chan_sent(hdev, type, &quote))) {
-		u32 priority = (skb_peek(&chan->data_q))->priority;
-		while (quote > 0 && (skb = skb_peek(&chan->data_q))) {
-			int blocks;
-
-			BT_DBG("chan %p skb %p len %d priority %u", chan, skb,
-			       skb->len, skb->priority);
-
-			/* Stop if priority has changed */
-			if (skb->priority < priority)
-				break;
-
-			skb = skb_dequeue(&chan->data_q);
-
-			blocks = __get_blocks(hdev, skb);
-			if (blocks > hdev->block_cnt)
-				return;
-
-			hci_conn_enter_active_mode(chan->conn,
-						   bt_cb(skb)->force_active);
-
-			hci_send_conn_frame(hdev, chan->conn, skb);
-			hdev->acl_last_tx = jiffies;
-
-			hdev->block_cnt -= blocks;
-			quote -= blocks;
-
-			chan->sent += blocks;
-			chan->conn->sent += blocks;
-		}
-	}
-
-	if (cnt != hdev->block_cnt)
-		hci_prio_recalculate(hdev, type);
-}
-
 static void hci_sched_acl(struct hci_dev *hdev)
 {
 	BT_DBG("%s", hdev->name);
 
 	/* No ACL link over BR/EDR controller */
-	if (!hci_conn_num(hdev, ACL_LINK) && hdev->dev_type == HCI_PRIMARY)
+	if (!hci_conn_num(hdev, ACL_LINK))
 		return;
 
-	/* No AMP link over AMP controller */
-	if (!hci_conn_num(hdev, AMP_LINK) && hdev->dev_type == HCI_AMP)
-		return;
-
-	switch (hdev->flow_ctl_mode) {
-	case HCI_FLOW_CTL_MODE_PACKET_BASED:
-		hci_sched_acl_pkt(hdev);
-		break;
-
-	case HCI_FLOW_CTL_MODE_BLOCK_BASED:
-		hci_sched_acl_blk(hdev);
-		break;
-	}
+	hci_sched_acl_pkt(hdev);
 }
 
 static void hci_sched_le(struct hci_dev *hdev)
diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 1edbe4de1ad6..3b16be1eef78 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -913,21 +913,6 @@ static u8 hci_cc_read_local_ext_features(struct hci_dev *hdev, void *data,
 	return rp->status;
 }
 
-static u8 hci_cc_read_flow_control_mode(struct hci_dev *hdev, void *data,
-					struct sk_buff *skb)
-{
-	struct hci_rp_read_flow_control_mode *rp = data;
-
-	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
-
-	if (rp->status)
-		return rp->status;
-
-	hdev->flow_ctl_mode = rp->mode;
-
-	return rp->status;
-}
-
 static u8 hci_cc_read_buffer_size(struct hci_dev *hdev, void *data,
 				  struct sk_buff *skb)
 {
@@ -1071,28 +1056,6 @@ static u8 hci_cc_write_page_scan_type(struct hci_dev *hdev, void *data,
 	return rp->status;
 }
 
-static u8 hci_cc_read_data_block_size(struct hci_dev *hdev, void *data,
-				      struct sk_buff *skb)
-{
-	struct hci_rp_read_data_block_size *rp = data;
-
-	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
-
-	if (rp->status)
-		return rp->status;
-
-	hdev->block_mtu = __le16_to_cpu(rp->max_acl_len);
-	hdev->block_len = __le16_to_cpu(rp->block_len);
-	hdev->num_blocks = __le16_to_cpu(rp->num_blocks);
-
-	hdev->block_cnt = hdev->num_blocks;
-
-	BT_DBG("%s blk mtu %d cnt %d len %d", hdev->name, hdev->block_mtu,
-	       hdev->block_cnt, hdev->block_len);
-
-	return rp->status;
-}
-
 static u8 hci_cc_read_clock(struct hci_dev *hdev, void *data,
 			    struct sk_buff *skb)
 {
@@ -1127,30 +1090,6 @@ static u8 hci_cc_read_clock(struct hci_dev *hdev, void *data,
 	return rp->status;
 }
 
-static u8 hci_cc_read_local_amp_info(struct hci_dev *hdev, void *data,
-				     struct sk_buff *skb)
-{
-	struct hci_rp_read_local_amp_info *rp = data;
-
-	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
-
-	if (rp->status)
-		return rp->status;
-
-	hdev->amp_status = rp->amp_status;
-	hdev->amp_total_bw = __le32_to_cpu(rp->total_bw);
-	hdev->amp_max_bw = __le32_to_cpu(rp->max_bw);
-	hdev->amp_min_latency = __le32_to_cpu(rp->min_latency);
-	hdev->amp_max_pdu = __le32_to_cpu(rp->max_pdu);
-	hdev->amp_type = rp->amp_type;
-	hdev->amp_pal_cap = __le16_to_cpu(rp->pal_cap);
-	hdev->amp_assoc_size = __le16_to_cpu(rp->max_assoc_size);
-	hdev->amp_be_flush_to = __le32_to_cpu(rp->be_flush_to);
-	hdev->amp_max_flush_to = __le32_to_cpu(rp->max_flush_to);
-
-	return rp->status;
-}
-
 static u8 hci_cc_read_inq_rsp_tx_power(struct hci_dev *hdev, void *data,
 				       struct sk_buff *skb)
 {
@@ -4120,12 +4059,6 @@ static const struct hci_cc {
 	HCI_CC(HCI_OP_READ_PAGE_SCAN_TYPE, hci_cc_read_page_scan_type,
 	       sizeof(struct hci_rp_read_page_scan_type)),
 	HCI_CC_STATUS(HCI_OP_WRITE_PAGE_SCAN_TYPE, hci_cc_write_page_scan_type),
-	HCI_CC(HCI_OP_READ_DATA_BLOCK_SIZE, hci_cc_read_data_block_size,
-	       sizeof(struct hci_rp_read_data_block_size)),
-	HCI_CC(HCI_OP_READ_FLOW_CONTROL_MODE, hci_cc_read_flow_control_mode,
-	       sizeof(struct hci_rp_read_flow_control_mode)),
-	HCI_CC(HCI_OP_READ_LOCAL_AMP_INFO, hci_cc_read_local_amp_info,
-	       sizeof(struct hci_rp_read_local_amp_info)),
 	HCI_CC(HCI_OP_READ_CLOCK, hci_cc_read_clock,
 	       sizeof(struct hci_rp_read_clock)),
 	HCI_CC(HCI_OP_READ_ENC_KEY_SIZE, hci_cc_read_enc_key_size,
@@ -4461,11 +4394,6 @@ static void hci_num_comp_pkts_evt(struct hci_dev *hdev, void *data,
 			     flex_array_size(ev, handles, ev->num)))
 		return;
 
-	if (hdev->flow_ctl_mode != HCI_FLOW_CTL_MODE_PACKET_BASED) {
-		bt_dev_err(hdev, "wrong event for mode %d", hdev->flow_ctl_mode);
-		return;
-	}
-
 	bt_dev_dbg(hdev, "num %d", ev->num);
 
 	for (i = 0; i < ev->num; i++) {
@@ -4537,83 +4465,6 @@ static void hci_num_comp_pkts_evt(struct hci_dev *hdev, void *data,
 	queue_work(hdev->workqueue, &hdev->tx_work);
 }
 
-static struct hci_conn *__hci_conn_lookup_handle(struct hci_dev *hdev,
-						 __u16 handle)
-{
-	struct hci_chan *chan;
-
-	switch (hdev->dev_type) {
-	case HCI_PRIMARY:
-		return hci_conn_hash_lookup_handle(hdev, handle);
-	case HCI_AMP:
-		chan = hci_chan_lookup_handle(hdev, handle);
-		if (chan)
-			return chan->conn;
-		break;
-	default:
-		bt_dev_err(hdev, "unknown dev_type %d", hdev->dev_type);
-		break;
-	}
-
-	return NULL;
-}
-
-static void hci_num_comp_blocks_evt(struct hci_dev *hdev, void *data,
-				    struct sk_buff *skb)
-{
-	struct hci_ev_num_comp_blocks *ev = data;
-	int i;
-
-	if (!hci_ev_skb_pull(hdev, skb, HCI_EV_NUM_COMP_BLOCKS,
-			     flex_array_size(ev, handles, ev->num_hndl)))
-		return;
-
-	if (hdev->flow_ctl_mode != HCI_FLOW_CTL_MODE_BLOCK_BASED) {
-		bt_dev_err(hdev, "wrong event for mode %d",
-			   hdev->flow_ctl_mode);
-		return;
-	}
-
-	bt_dev_dbg(hdev, "num_blocks %d num_hndl %d", ev->num_blocks,
-		   ev->num_hndl);
-
-	for (i = 0; i < ev->num_hndl; i++) {
-		struct hci_comp_blocks_info *info = &ev->handles[i];
-		struct hci_conn *conn = NULL;
-		__u16  handle, block_count, pkt_count;
-		unsigned int i;
-
-		handle = __le16_to_cpu(info->handle);
-		block_count = __le16_to_cpu(info->blocks);
-		pkt_count = __le16_to_cpu(info->pkts);
-
-		conn = __hci_conn_lookup_handle(hdev, handle);
-		if (!conn)
-			continue;
-
-		conn->sent -= block_count;
-
-		for (i = 0; i < pkt_count; ++i)
-			hci_conn_tx_dequeue(conn);
-
-		switch (conn->type) {
-		case ACL_LINK:
-		case AMP_LINK:
-			hdev->block_cnt += block_count;
-			if (hdev->block_cnt > hdev->num_blocks)
-				hdev->block_cnt = hdev->num_blocks;
-			break;
-
-		default:
-			bt_dev_err(hdev, "unknown type %d conn %p",
-				   conn->type, conn);
-			break;
-		}
-	}
-
-	queue_work(hdev->workqueue, &hdev->tx_work);
-}
-
 static void hci_mode_change_evt(struct hci_dev *hdev, void *data,
 				struct sk_buff *skb)
 {
@@ -7529,9 +7380,6 @@ static const struct hci_ev {
 	/* [0x3e = HCI_EV_LE_META] */
 	HCI_EV_REQ_VL(HCI_EV_LE_META, hci_le_meta_evt,
 		      sizeof(struct hci_ev_le_meta), HCI_MAX_EVENT_SIZE),
-	/* [0x48 = HCI_EV_NUM_COMP_BLOCKS] */
-	HCI_EV(HCI_EV_NUM_COMP_BLOCKS, hci_num_comp_blocks_evt,
-	       sizeof(struct hci_ev_num_comp_blocks)),
 	/* [0xff = HCI_EV_VENDOR] */
 	HCI_EV_VL(HCI_EV_VENDOR, msft_vendor_evt, 0, HCI_MAX_EVENT_SIZE),
 };
diff --git a/net/bluetooth/hci_sock.c b/net/bluetooth/hci_sock.c
index 703b84bd48d5..69c2ba1e843e 100644
--- a/net/bluetooth/hci_sock.c
+++ b/net/bluetooth/hci_sock.c
@@ -485,7 +485,7 @@ static struct sk_buff *create_monitor_event(struct hci_dev *hdev, int event)
 			return NULL;
 
 		ni = skb_put(skb, HCI_MON_NEW_INDEX_SIZE);
-		ni->type = hdev->dev_type;
+		ni->type = 0x00; /* Old hdev->dev_type */
 		ni->bus = hdev->bus;
 		bacpy(&ni->bdaddr, &hdev->bdaddr);
 		memcpy_and_pad(ni->name, sizeof(ni->name), hdev->name,
@@ -1007,9 +1007,6 @@ static int hci_sock_bound_ioctl(struct sock *sk, unsigned int cmd,
 	if (hci_dev_test_flag(hdev, HCI_UNCONFIGURED))
 		return -EOPNOTSUPP;
 
-	if (hdev->dev_type != HCI_PRIMARY)
-		return -EOPNOTSUPP;
-
 	switch (cmd) {
 	case HCISETRAW:
 		if (!capable(CAP_NET_ADMIN))
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index 813c11d61bca..891cae8a30da 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -3511,10 +3511,6 @@ static int hci_unconf_init_sync(struct hci_dev *hdev)
 /* Read Local Supported Features. */
 static int hci_read_local_features_sync(struct hci_dev *hdev)
 {
-	 /* Not all AMP controllers support this command */
-	if (hdev->dev_type == HCI_AMP && !(hdev->commands[14] & 0x20))
-		return 0;
-
 	return __hci_cmd_sync_status(hdev, HCI_OP_READ_LOCAL_FEATURES,
 				     0, NULL, HCI_CMD_TIMEOUT);
 }
@@ -3549,51 +3545,6 @@ static int hci_read_local_cmds_sync(struct hci_dev *hdev)
 	return 0;
 }
 
-/* Read Local AMP Info */
-static int hci_read_local_amp_info_sync(struct hci_dev *hdev)
-{
-	return __hci_cmd_sync_status(hdev, HCI_OP_READ_LOCAL_AMP_INFO,
-				     0, NULL, HCI_CMD_TIMEOUT);
-}
-
-/* Read Data Blk size */
-static int hci_read_data_block_size_sync(struct hci_dev *hdev)
-{
-	return __hci_cmd_sync_status(hdev, HCI_OP_READ_DATA_BLOCK_SIZE,
-				     0, NULL, HCI_CMD_TIMEOUT);
-}
-
-/* Read Flow Control Mode */
-static int hci_read_flow_control_mode_sync(struct hci_dev *hdev)
-{
-	return __hci_cmd_sync_status(hdev, HCI_OP_READ_FLOW_CONTROL_MODE,
-				     0, NULL, HCI_CMD_TIMEOUT);
-}
-
-/* Read Location Data */
-static int hci_read_location_data_sync(struct hci_dev *hdev)
-{
-	return __hci_cmd_sync_status(hdev, HCI_OP_READ_LOCATION_DATA,
-				     0, NULL, HCI_CMD_TIMEOUT);
-}
-
-/* AMP Controller init stage 1 command sequence */
-static const struct hci_init_stage amp_init1[] = {
-	/* HCI_OP_READ_LOCAL_VERSION */
-	HCI_INIT(hci_read_local_version_sync),
-	/* HCI_OP_READ_LOCAL_COMMANDS */
-	HCI_INIT(hci_read_local_cmds_sync),
-	/* HCI_OP_READ_LOCAL_AMP_INFO */
-	HCI_INIT(hci_read_local_amp_info_sync),
-	/* HCI_OP_READ_DATA_BLOCK_SIZE */
-	HCI_INIT(hci_read_data_block_size_sync),
-	/* HCI_OP_READ_FLOW_CONTROL_MODE */
-	HCI_INIT(hci_read_flow_control_mode_sync),
-	/* HCI_OP_READ_LOCATION_DATA */
-	HCI_INIT(hci_read_location_data_sync),
-	{}
-};
-
 static int hci_init1_sync(struct hci_dev *hdev)
 {
 	int err;
@@ -3607,28 +3558,9 @@ static int hci_init1_sync(struct hci_dev *hdev)
 			return err;
 	}
 
-	switch (hdev->dev_type) {
-	case HCI_PRIMARY:
-		hdev->flow_ctl_mode = HCI_FLOW_CTL_MODE_PACKET_BASED;
-		return hci_init_stage_sync(hdev, br_init1);
-	case HCI_AMP:
-		hdev->flow_ctl_mode = HCI_FLOW_CTL_MODE_BLOCK_BASED;
-		return hci_init_stage_sync(hdev, amp_init1);
-	default:
-		bt_dev_err(hdev, "Unknown device type %d", hdev->dev_type);
-		break;
-	}
-
-	return 0;
+	return hci_init_stage_sync(hdev, br_init1);
 }
 
-/* AMP Controller init stage 2 command sequence */
-static const struct hci_init_stage amp_init2[] = {
-	/* HCI_OP_READ_LOCAL_FEATURES */
-	HCI_INIT(hci_read_local_features_sync),
-	{}
-};
-
 /* Read Buffer Size (ACL mtu, max pkt, etc.) */
 static int hci_read_buffer_size_sync(struct hci_dev *hdev)
 {
@@ -3886,9 +3818,6 @@ static int hci_init2_sync(struct hci_dev *hdev)
 
 	bt_dev_dbg(hdev, "");
 
-	if (hdev->dev_type == HCI_AMP)
-		return hci_init_stage_sync(hdev, amp_init2);
-
 	err = hci_init_stage_sync(hdev, hci_init2);
 	if (err)
 		return err;
@@ -4716,13 +4645,6 @@ static int hci_init_sync(struct hci_dev *hdev)
 	if (err < 0)
 		return err;
 
-	/* HCI_PRIMARY covers both single-mode LE, BR/EDR and dual-mode
-	 * BR/EDR/LE type controllers. AMP controllers only need the
-	 * first two stages of init.
-	 */
-	if (hdev->dev_type != HCI_PRIMARY)
-		return 0;
-
 	err = hci_init3_sync(hdev);
 	if (err < 0)
 		return err;
@@ -4951,12 +4873,8 @@ int hci_dev_open_sync(struct hci_dev *hdev)
 		 * In case of user channel usage, it is not important
 		 * if a public address or static random address is
 		 * available.
-		 *
-		 * This check is only valid for BR/EDR controllers
-		 * since AMP controllers do not have an address.
 		 */
 		if (!hci_dev_test_flag(hdev, HCI_USER_CHANNEL) &&
-		    hdev->dev_type == HCI_PRIMARY &&
 		    !bacmp(&hdev->bdaddr, BDADDR_ANY) &&
 		    !bacmp(&hdev->static_addr, BDADDR_ANY)) {
 			ret = -EADDRNOTAVAIL;
@@ -4991,8 +4909,7 @@ int hci_dev_open_sync(struct hci_dev *hdev)
 		    !hci_dev_test_flag(hdev, HCI_CONFIG) &&
 		    !hci_dev_test_flag(hdev, HCI_UNCONFIGURED) &&
 		    !hci_dev_test_flag(hdev, HCI_USER_CHANNEL) &&
-		    hci_dev_test_flag(hdev, HCI_MGMT) &&
-		    hdev->dev_type == HCI_PRIMARY) {
+		    hci_dev_test_flag(hdev, HCI_MGMT)) {
 			ret = hci_powered_update_sync(hdev);
 			mgmt_power_on(hdev, ret);
 		}
@@ -5137,8 +5054,7 @@ int hci_dev_close_sync(struct hci_dev *hdev)
 
 	auto_off = hci_dev_test_and_clear_flag(hdev, HCI_AUTO_OFF);
 
-	if (!auto_off && hdev->dev_type == HCI_PRIMARY &&
-	    !hci_dev_test_flag(hdev, HCI_USER_CHANNEL) &&
+	if (!auto_off && !hci_dev_test_flag(hdev, HCI_USER_CHANNEL) &&
 	    hci_dev_test_flag(hdev, HCI_MGMT))
 		__mgmt_power_off(hdev);
 
@@ -5200,9 +5116,6 @@ int hci_dev_close_sync(struct hci_dev *hdev)
 	hdev->flags &= BIT(HCI_RAW);
 	hci_dev_clear_volatile_flags(hdev);
 
-	/* Controller radio is available but is currently powered down */
-	hdev->amp_status = AMP_STATUS_POWERED_DOWN;
-
 	memset(hdev->eir, 0, sizeof(hdev->eir));
 	memset(hdev->dev_class, 0, sizeof(hdev->dev_class));
 	bacpy(&hdev->random_addr, BDADDR_ANY);
@@ -5239,8 +5152,7 @@ static int hci_power_on_sync(struct hci_dev *hdev)
 	 */
 	if (hci_dev_test_flag(hdev, HCI_RFKILLED) ||
 	    hci_dev_test_flag(hdev, HCI_UNCONFIGURED) ||
-	    (hdev->dev_type == HCI_PRIMARY &&
-	     !bacmp(&hdev->bdaddr, BDADDR_ANY) &&
+	    (!bacmp(&hdev->bdaddr, BDADDR_ANY) &&
 	     !bacmp(&hdev->static_addr, BDADDR_ANY))) {
 		hci_dev_clear_flag(hdev, HCI_AUTO_OFF);
 		hci_dev_close_sync(hdev);
@@ -5342,27 +5254,11 @@ int hci_stop_discovery_sync(struct hci_dev *hdev)
 	return 0;
 }
 
-static int hci_disconnect_phy_link_sync(struct hci_dev *hdev, u16 handle,
-					u8 reason)
-{
-	struct hci_cp_disconn_phy_link cp;
-
-	memset(&cp, 0, sizeof(cp));
-	cp.phy_handle = HCI_PHY_HANDLE(handle);
-	cp.reason = reason;
-
-	return __hci_cmd_sync_status(hdev, HCI_OP_DISCONN_PHY_LINK,
-				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
-}
-
 static int hci_disconnect_sync(struct hci_dev *hdev, struct hci_conn *conn,
 			       u8 reason)
 {
 	struct hci_cp_disconnect cp;
 
-	if (conn->type == AMP_LINK)
-		return hci_disconnect_phy_link_sync(hdev, conn->handle, reason);
-
 	if (test_bit(HCI_CONN_BIG_CREATED, &conn->flags)) {
 		/* This is a BIS connection, hci_conn_del will
 		 * do the necessary cleanup.
diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index 43bd61cee00c..911dfcc790d5 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -3940,9 +3940,8 @@ static inline int l2cap_command_rej(struct l2cap_conn *conn,
 	return 0;
 }
 
-static void l2cap_connect(struct l2cap_conn *conn,
-					struct l2cap_cmd_hdr *cmd,
-					u8 *data, u8 rsp_code, u8 amp_id)
+static void l2cap_connect(struct l2cap_conn *conn, struct l2cap_cmd_hdr *cmd,
+			  u8 *data, u8 rsp_code)
 {
 	struct l2cap_conn_req *req = (struct l2cap_conn_req *) data;
 	struct l2cap_conn_rsp rsp;
@@ -4021,17 +4020,8 @@ static void l2cap_connect(struct l2cap_conn *conn,
 				status = L2CAP_CS_AUTHOR_PEND;
 				chan->ops->defer(chan);
 			} else {
-				/* Force pending result for AMP controllers.
-				 * The connection will succeed after the
-				 * physical link is up.
-				 */
-				if (amp_id == AMP_ID_BREDR) {
-					l2cap_state_change(chan, BT_CONFIG);
-					result = L2CAP_CR_SUCCESS;
-				} else {
-					l2cap_state_change(chan, BT_CONNECT2);
-					result = L2CAP_CR_PEND;
-				}
+				l2cap_state_change(chan, BT_CONNECT2);
+				result = L2CAP_CR_PEND;
 				status = L2CAP_CS_NO_INFO;
 			}
 		} else {
@@ -4096,7 +4086,7 @@ static int l2cap_connect_req(struct l2cap_conn *conn,
 		mgmt_device_connected(hdev, hcon, NULL, 0);
 	hci_dev_unlock(hdev);
 
-	l2cap_connect(conn, cmd, data, L2CAP_CONN_RSP, 0);
+	l2cap_connect(conn, cmd, data, L2CAP_CONN_RSP);
 	return 0;
 }
 
@@ -7501,10 +7491,6 @@ void l2cap_recv_acldata(struct hci_conn *hcon, struct sk_buff *skb, u16 flags)
 	struct l2cap_conn *conn = hcon->l2cap_data;
 	int len;
 
-	/* For AMP controller do not create l2cap conn */
-	if (!conn && hcon->hdev->dev_type != HCI_PRIMARY)
-		goto drop;
-
 	if (!conn)
 		conn = l2cap_conn_add(hcon);
 
diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index f406eaa0ff88..64e66d911c74 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -443,8 +443,7 @@ static int read_index_list(struct sock *sk, struct hci_dev *hdev, void *data,
 
 	count = 0;
 	list_for_each_entry(d, &hci_dev_list, list) {
-		if (d->dev_type == HCI_PRIMARY &&
-		    !hci_dev_test_flag(d, HCI_UNCONFIGURED))
+		if (!hci_dev_test_flag(d, HCI_UNCONFIGURED))
 			count++;
 	}
 
@@ -468,8 +467,7 @@ static int read_index_list(struct sock *sk, struct hci_dev *hdev, void *data,
 		if (test_bit(HCI_QUIRK_RAW_DEVICE, &d->quirks))
 			continue;
 
-		if (d->dev_type == HCI_PRIMARY &&
-		    !hci_dev_test_flag(d, HCI_UNCONFIGURED)) {
+		if (!hci_dev_test_flag(d, HCI_UNCONFIGURED)) {
 			rp->index[count++] = cpu_to_le16(d->id);
 			bt_dev_dbg(hdev, "Added hci%u", d->id);
 		}
@@ -503,8 +501,7 @@ static int read_unconf_index_list(struct sock *sk, struct hci_dev *hdev,
 
 	count = 0;
 	list_for_each_entry(d, &hci_dev_list, list) {
-		if (d->dev_type == HCI_PRIMARY &&
-		    hci_dev_test_flag(d, HCI_UNCONFIGURED))
+		if (hci_dev_test_flag(d, HCI_UNCONFIGURED))
 			count++;
 	}
 
@@ -528,8 +525,7 @@ static int read_unconf_index_list(struct sock *sk, struct hci_dev *hdev,
 		if (test_bit(HCI_QUIRK_RAW_DEVICE, &d->quirks))
 			continue;
 
-		if (d->dev_type == HCI_PRIMARY &&
-		    hci_dev_test_flag(d, HCI_UNCONFIGURED)) {
+		if (hci_dev_test_flag(d, HCI_UNCONFIGURED)) {
 			rp->index[count++] = cpu_to_le16(d->id);
 			bt_dev_dbg(hdev, "Added hci%u", d->id);
 		}
@@ -561,10 +557,8 @@ static int read_ext_index_list(struct sock *sk, struct hci_dev *hdev,
 	read_lock(&hci_dev_list_lock);
 
 	count = 0;
-	list_for_each_entry(d, &hci_dev_list, list) {
-		if (d->dev_type == HCI_PRIMARY || d->dev_type == HCI_AMP)
-			count++;
-	}
+	list_for_each_entry(d, &hci_dev_list, list)
+		count++;
 
 	rp = kmalloc(struct_size(rp, entry, count), GFP_ATOMIC);
 	if (!rp) {
@@ -585,16 +579,10 @@ static int read_ext_index_list(struct sock *sk, struct hci_dev *hdev,
 		if (test_bit(HCI_QUIRK_RAW_DEVICE, &d->quirks))
 			continue;
 
-		if (d->dev_type == HCI_PRIMARY) {
-			if (hci_dev_test_flag(d, HCI_UNCONFIGURED))
-				rp->entry[count].type = 0x01;
-			else
-				rp->entry[count].type = 0x00;
-		} else if (d->dev_type == HCI_AMP) {
-			rp->entry[count].type = 0x02;
-		} else {
-			continue;
-		}
+		if (hci_dev_test_flag(d, HCI_UNCONFIGURED))
+			rp->entry[count].type = 0x01;
+		else
+			rp->entry[count].type = 0x00;
 
 		rp->entry[count].bus = d->bus;
 		rp->entry[count++].index = cpu_to_le16(d->id);
@@ -9392,23 +9380,14 @@ void mgmt_index_added(struct hci_dev *hdev)
 	if (test_bit(HCI_QUIRK_RAW_DEVICE, &hdev->quirks))
 		return;
 
-	switch (hdev->dev_type) {
-	case HCI_PRIMARY:
-		if (hci_dev_test_flag(hdev, HCI_UNCONFIGURED)) {
-			mgmt_index_event(MGMT_EV_UNCONF_INDEX_ADDED, hdev,
-					 NULL, 0, HCI_MGMT_UNCONF_INDEX_EVENTS);
-			ev.type = 0x01;
-		} else {
-			mgmt_index_event(MGMT_EV_INDEX_ADDED, hdev, NULL, 0,
-					 HCI_MGMT_INDEX_EVENTS);
-			ev.type = 0x00;
-		}
-		break;
-	case HCI_AMP:
-		ev.type = 0x02;
-		break;
-	default:
-		return;
+	if (hci_dev_test_flag(hdev, HCI_UNCONFIGURED)) {
+		mgmt_index_event(MGMT_EV_UNCONF_INDEX_ADDED, hdev, NULL, 0,
+				 HCI_MGMT_UNCONF_INDEX_EVENTS);
+		ev.type = 0x01;
+	} else {
+		mgmt_index_event(MGMT_EV_INDEX_ADDED, hdev, NULL, 0,
+				 HCI_MGMT_INDEX_EVENTS);
+		ev.type = 0x00;
 	}
 
 	ev.bus = hdev->bus;
@@ -9425,25 +9404,16 @@ void mgmt_index_removed(struct hci_dev *hdev)
 	if (test_bit(HCI_QUIRK_RAW_DEVICE, &hdev->quirks))
 		return;
 
-	switch (hdev->dev_type) {
-	case HCI_PRIMARY:
-		mgmt_pending_foreach(0, hdev, cmd_complete_rsp, &status);
+	mgmt_pending_foreach(0, hdev, cmd_complete_rsp, &status);
 
-		if (hci_dev_test_flag(hdev, HCI_UNCONFIGURED)) {
-			mgmt_index_event(MGMT_EV_UNCONF_INDEX_REMOVED, hdev,
-					 NULL, 0, HCI_MGMT_UNCONF_INDEX_EVENTS);
-			ev.type = 0x01;
-		} else {
-			mgmt_index_event(MGMT_EV_INDEX_REMOVED, hdev, NULL, 0,
-					 HCI_MGMT_INDEX_EVENTS);
-			ev.type = 0x00;
-		}
-		break;
-	case HCI_AMP:
-		ev.type = 0x02;
-		break;
-	default:
-		return;
+	if (hci_dev_test_flag(hdev, HCI_UNCONFIGURED)) {
+		mgmt_index_event(MGMT_EV_UNCONF_INDEX_REMOVED, hdev, NULL, 0,
+				 HCI_MGMT_UNCONF_INDEX_EVENTS);
+		ev.type = 0x01;
+	} else {
+		mgmt_index_event(MGMT_EV_INDEX_REMOVED, hdev, NULL, 0,
+				 HCI_MGMT_INDEX_EVENTS);
+		ev.type = 0x00;
 	}
 
 	ev.bus = hdev->bus;
-- 
2.44.0


