Return-Path: <linux-bluetooth+bounces-5082-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 346ED8D8559
	for <lists+linux-bluetooth@lfdr.de>; Mon,  3 Jun 2024 16:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 585CC1C217DD
	for <lists+linux-bluetooth@lfdr.de>; Mon,  3 Jun 2024 14:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415AD1304AA;
	Mon,  3 Jun 2024 14:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="j8BbcaRf"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EA612F5A0;
	Mon,  3 Jun 2024 14:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717425871; cv=none; b=U3Qtgdfw8z0rcF1HSxZ/v5oketHFM9LrKv2J1NOI7yn+28+fOyOXXBpG+21mRuUApSM9ipowDntlhojYn8GxsXjK5lpnXpyPl2aHDO7qwCe/hf6lvKi2IWBXDFEN8OwTzFTsQ1IbtpFVfbg7aBMs30BmIrGmBW7zZeumLojGVuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717425871; c=relaxed/simple;
	bh=YCFJH9i8CYXUpt91sYS6Dq7QkAvQFkMqR1g//KHWhBk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ET/Y3fL9cnuhZgHeeo1AD5M/VXafXXXlshsnTQHz0EmtHJHNwNaOLvibjbw2vYqfL4Up1XeK9E4MyUmlF7yS+D3HmLhFbgS/NzLMBxxbaPLXv9hZ1M+LaVsEfZ3POq7ifoYoUbYs/kXhuRxcKeAVP4vaoqfpSaxByaYhmNvuVd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=j8BbcaRf; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sE8v6-008hAg-2w;
	Mon, 03 Jun 2024 16:44:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tmLRwCw5fvmkHYewvTmSzsnpuIGD6xKMMA1I4DUGgaI=; b=j8BbcaRfNS6Vdc/k6w/nI8VkuC
	0eec8EBLSp3jKXLaKdO74cuXgv6sJ35uh6E7DBtiw9rSZzl/w1o4/ScXen/Kmnti9PglxBLO7w44t
	D0aVM6F3Pf4cabos37gLovHDgt9EvxlvSWnpyPJiSO93nC+qZO9edKhdoici7c0A81TAxjZIRsJM4
	HzEchyNJVLcr8+k46Yjo6gt16rvLTfhijw0qQ3uHt96IFSwejtO645H3WWHo2GK9b4QhJvv0vIiL1
	gAEPoilLNzlVFAkeqT5OTKN/wx2Bx8jkxry4Jek3IqtZDqciwkiTyza33Hk3FG8xrtE+0teTn489b
	X9rOMx9w==;
Received: from p200300c20737c2001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:c2:737:c200:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sE8v5-002Uep-0m;
	Mon, 03 Jun 2024 16:44:20 +0200
Received: from andi by aktux with local (Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sE8v6-009DAs-0n;
	Mon, 03 Jun 2024 16:44:20 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	johan@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	andreas@kemnade.info,
	pmenzel@molgen.mpg.de,
	linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	Adam Ford <aford173@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	tomi.valkeinen@ideasonboard.com,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@gmail.com>,
	robh@kernel.org,
	hns@goldelico.com
Subject: [PATCH v3 2/4] Bluetooth: ti-st: Add GNSS subdevice for TI Wilink chips
Date: Mon,  3 Jun 2024 16:43:58 +0200
Message-Id: <20240603144400.2195564-3-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240603144400.2195564-1-andreas@kemnade.info>
References: <20240603144400.2195564-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of these chips have GNSS support. GNSS support is available through
channel 9 whilst FM is through channel 8. Add a platform subdevice for
GNSS so that a driver for that functionality can be build. To avoid having
useless GNSS devices, do it only when the devicetree node name contains
gnss.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
 drivers/bluetooth/hci_ll.c   | 81 ++++++++++++++++++++++++++++++++++++
 include/linux/ti_wilink_st.h |  8 ++++
 2 files changed, 89 insertions(+)

diff --git a/drivers/bluetooth/hci_ll.c b/drivers/bluetooth/hci_ll.c
index 4a0b5c3160c2b..09e5a4dbd2f8c 100644
--- a/drivers/bluetooth/hci_ll.c
+++ b/drivers/bluetooth/hci_ll.c
@@ -32,6 +32,7 @@
 #include <linux/signal.h>
 #include <linux/ioctl.h>
 #include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/serdev.h>
 #include <linux/skbuff.h>
 #include <linux/ti_wilink_st.h>
@@ -68,6 +69,9 @@ struct ll_device {
 	struct gpio_desc *enable_gpio;
 	struct clk *ext_clk;
 	bdaddr_t bdaddr;
+
+	void (*gnss_recv_func)(struct device *dev, struct sk_buff *skb);
+	struct platform_device *gnssdev;
 };
 
 struct ll_struct {
@@ -78,6 +82,8 @@ struct ll_struct {
 	struct sk_buff_head tx_wait_q;	/* HCILL wait queue	*/
 };
 
+static int ll_gnss_register(struct ll_device *lldev);
+static int ll_gnss_recv_frame(struct hci_dev *hdev, struct sk_buff *skb);
 /*
  * Builds and sends an HCILL command packet.
  * These are very simple packets with only 1 cmd byte
@@ -411,6 +417,13 @@ static int ll_recv_frame(struct hci_dev *hdev, struct sk_buff *skb)
 	.lsize = 0, \
 	.maxlen = 0
 
+#define LL_RECV_GNSS \
+	.type = 9, \
+	.hlen = 3, \
+	.loff = 1, \
+	.lsize = 2
+
+
 static const struct h4_recv_pkt ll_recv_pkts[] = {
 	{ H4_RECV_ACL,       .recv = hci_recv_frame },
 	{ H4_RECV_SCO,       .recv = hci_recv_frame },
@@ -419,6 +432,7 @@ static const struct h4_recv_pkt ll_recv_pkts[] = {
 	{ LL_RECV_SLEEP_ACK, .recv = ll_recv_frame  },
 	{ LL_RECV_WAKE_IND,  .recv = ll_recv_frame  },
 	{ LL_RECV_WAKE_ACK,  .recv = ll_recv_frame  },
+	{ LL_RECV_GNSS,      .recv = ll_gnss_recv_frame },
 };
 
 /* Recv data */
@@ -677,9 +691,69 @@ static int ll_setup(struct hci_uart *hu)
 		}
 	}
 
+	if (strstr(of_node_full_name(serdev->dev.of_node), "gnss"))
+		ll_gnss_register(lldev);
+
+	return 0;
+}
+
+struct hci_dev *st_get_hci(struct device *dev)
+{
+	struct ll_device *lldev = dev_get_drvdata(dev);
+
+	return lldev->hu.hdev;
+}
+EXPORT_SYMBOL(st_get_hci);
+
+void st_set_gnss_recv_func(struct device *dev,
+			   void (*recv_frame)(struct device *, struct sk_buff *))
+{
+	struct ll_device *lldev = dev_get_drvdata(dev);
+
+	lldev->gnss_recv_func = recv_frame;
+}
+EXPORT_SYMBOL(st_set_gnss_recv_func);
+
+static int ll_gnss_recv_frame(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	struct hci_uart *hu = hci_get_drvdata(hdev);
+	struct ll_device *lldev = container_of(hu, struct ll_device, hu);
+
+	if (!lldev->gnssdev)
+		return 0;
+
+	if (lldev->gnss_recv_func) {
+		lldev->gnss_recv_func(&lldev->gnssdev->dev, skb);
+		return 0;
+	}
+	kfree_skb(skb);
+
 	return 0;
 }
 
+static int ll_gnss_register(struct ll_device *lldev)
+{
+	struct platform_device *pdev;
+	int ret;
+
+	pdev = platform_device_alloc("ti-ai2-gnss", PLATFORM_DEVID_AUTO);
+	if (!pdev)
+		return -ENOMEM;
+
+	pdev->dev.parent = &lldev->serdev->dev;
+	lldev->gnssdev = pdev;
+	ret = platform_device_add(pdev);
+	if (ret)
+		goto err;
+
+	return 0;
+
+err:
+	lldev->gnssdev = NULL;
+	platform_device_put(pdev);
+	return ret;
+}
+
 static const struct hci_uart_proto llp;
 
 static int hci_ti_probe(struct serdev_device *serdev)
@@ -757,12 +831,19 @@ static int hci_ti_probe(struct serdev_device *serdev)
 	}
 
 	return hci_uart_register_device(hu, &llp);
+
+
+	return 0;
 }
 
+
 static void hci_ti_remove(struct serdev_device *serdev)
 {
 	struct ll_device *lldev = serdev_device_get_drvdata(serdev);
 
+	if (lldev->gnssdev)
+		platform_device_unregister(lldev->gnssdev);
+
 	hci_uart_unregister_device(&lldev->hu);
 }
 
diff --git a/include/linux/ti_wilink_st.h b/include/linux/ti_wilink_st.h
index 10642d4844f0c..eccc2db004069 100644
--- a/include/linux/ti_wilink_st.h
+++ b/include/linux/ti_wilink_st.h
@@ -381,6 +381,14 @@ unsigned long st_ll_getstate(struct st_data_s *);
 unsigned long st_ll_sleep_state(struct st_data_s *, unsigned char);
 void st_ll_wakeup(struct st_data_s *);
 
+/**
+ * various funcs used to interact between FM, GPS and BT
+ */
+struct hci_dev *st_get_hci(struct device *dev);
+void st_set_gnss_recv_func(struct device *dev,
+			   void (*recv_frame)(struct device *, struct sk_buff *));
+
+
 /*
  * header information used by st_core.c for FM and GPS
  * packet parsing, the bluetooth headers are already available
-- 
2.39.2


