Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24D6662094E
	for <lists+linux-bluetooth@lfdr.de>; Tue,  8 Nov 2022 07:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233354AbiKHGGK (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 8 Nov 2022 01:06:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233222AbiKHGGJ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 8 Nov 2022 01:06:09 -0500
Received: from gw.atmark-techno.com (gw.atmark-techno.com [13.115.124.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4DF63F07B
        for <linux-bluetooth@vger.kernel.org>; Mon,  7 Nov 2022 22:06:06 -0800 (PST)
Received: from gw.atmark-techno.com (localhost [127.0.0.1])
        by gw.atmark-techno.com (Postfix) with ESMTP id 926EB60142
        for <linux-bluetooth@vger.kernel.org>; Tue,  8 Nov 2022 14:56:06 +0900 (JST)
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
        by gw.atmark-techno.com (Postfix) with ESMTPS id 64ACF60146
        for <linux-bluetooth@vger.kernel.org>; Tue,  8 Nov 2022 14:56:04 +0900 (JST)
Received: by mail-pl1-f200.google.com with SMTP id z15-20020a170903018f00b0018862d520fbso8825921plg.11
        for <linux-bluetooth@vger.kernel.org>; Mon, 07 Nov 2022 21:56:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=757yoDhLQoswhPSAxDBASMvHCABau1Li9dh0moZLC3E=;
        b=MgzG42OBEReUJSpJbkF9j6wnLbAfxoZSc6oRcLdKqr0Bpo7nLaRYE8qFlzXJ6q8AIH
         niWHRfjZbc9h+tlfsec65eIeklwxukfwg/I+EcMoUCM2jMZ0SEH3pJM8H7GCUqktU08o
         VLC+wXqd+1+gLJFTQK4behUBWA5iUppCJMnervmK4+dEiC30FkUnhe4wU1GDqEdfGfYo
         GiSjmRWo7BX9Rt4g5oI0F486TOYIR9pma4ypPtnGcFR+KGWoqusFDvaFpNLlOwTs3ZBe
         Bs8Ib5DItB+K0xRHnUj7hl1JRRLiM8Jp3+MITVWJPm0qaGdNe9EtDU8WfbSOp/UuqFNp
         +aew==
X-Gm-Message-State: ACrzQf1ZCDwX/l/tPiGtV4bJ7lHkXWSw8Zb+iLzQ8VTsCGkfb/dNSQ+V
        JevKRb3F+dTP5ude2hduOOGY/z19jmX48riIg7MxqZPn8qTtbPSD/oNlO4I+aBUvelnFS5cAbDc
        G0afB1vAAdPI29oqOP+b+ZElR1XY9GZYh
X-Received: by 2002:a17:90a:974b:b0:213:9bec:ae4e with SMTP id i11-20020a17090a974b00b002139becae4emr54696314pjw.200.1667886963450;
        Mon, 07 Nov 2022 21:56:03 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6Ej7xAYS13CrilvxqHh45cmxbHS136/9OIxkPX14RdA4xZx9ZMGzAQKiHNN+jhcNtN8vFgmg==
X-Received: by 2002:a17:90a:974b:b0:213:9bec:ae4e with SMTP id i11-20020a17090a974b00b002139becae4emr54696286pjw.200.1667886963226;
        Mon, 07 Nov 2022 21:56:03 -0800 (PST)
Received: from pc-zest.atmarktech (178.101.200.35.bc.googleusercontent.com. [35.200.101.178])
        by smtp.gmail.com with ESMTPSA id f14-20020a170902ce8e00b00180033438a0sm5978640plg.106.2022.11.07.21.56.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Nov 2022 21:56:02 -0800 (PST)
Received: from martinet by pc-zest.atmarktech with local (Exim 4.96)
        (envelope-from <martinet@pc-zest>)
        id 1osHab-0098L1-2q;
        Tue, 08 Nov 2022 14:56:01 +0900
From:   Dominique Martinet <dominique.martinet@atmark-techno.com>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Johan Hedberg <johan.hedberg@gmail.com>
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        "David S . Miller" <davem@davemloft.net>, mizo@atmark-techno.com,
        Dominique Martinet <dominique.martinet@atmark-techno.com>
Subject: [RFC PATCH 2/2] bluetooth/hci_h4: add serdev support
Date:   Tue,  8 Nov 2022 14:55:31 +0900
Message-Id: <20221108055531.2176793-3-dominique.martinet@atmark-techno.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221108055531.2176793-1-dominique.martinet@atmark-techno.com>
References: <20221108055531.2176793-1-dominique.martinet@atmark-techno.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

adding serdev support to hci_h4 allows users to define h4 bluetooth
controllers in dts files

This allows users of bluetooth modules with an uart h4 interface to use
dt bindings instead of manually running btattach

Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
---
 drivers/bluetooth/Kconfig  |  1 +
 drivers/bluetooth/hci_h4.c | 65 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/drivers/bluetooth/Kconfig b/drivers/bluetooth/Kconfig
index e30707405455..69edc76a8611 100644
--- a/drivers/bluetooth/Kconfig
+++ b/drivers/bluetooth/Kconfig
@@ -113,6 +113,7 @@ config BT_HCIUART_SERDEV
 config BT_HCIUART_H4
 	bool "UART (H4) protocol support"
 	depends on BT_HCIUART
+	depends on BT_HCIUART_SERDEV
 	help
 	  UART (H4) is serial protocol for communication between Bluetooth
 	  device and host. This protocol is required for most Bluetooth devices
diff --git a/drivers/bluetooth/hci_h4.c b/drivers/bluetooth/hci_h4.c
index 1d0cdf023243..b214c8a4d450 100644
--- a/drivers/bluetooth/hci_h4.c
+++ b/drivers/bluetooth/hci_h4.c
@@ -18,6 +18,8 @@
 #include <linux/ptrace.h>
 #include <linux/poll.h>
 
+#include <linux/of.h>
+#include <linux/serdev.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
 #include <linux/errno.h>
@@ -32,6 +34,10 @@
 
 #include "hci_uart.h"
 
+struct h4_device {
+	struct hci_uart hu;
+};
+
 struct h4_struct {
 	struct sk_buff *rx_skb;
 	struct sk_buff_head txq;
@@ -130,6 +136,63 @@ static struct sk_buff *h4_dequeue(struct hci_uart *hu)
 	return skb_dequeue(&h4->txq);
 }
 
+static const struct hci_uart_proto h4p;
+
+static int h4_probe(struct serdev_device *serdev)
+{
+	struct h4_device *h4dev;
+	struct hci_uart *hu;
+	int ret;
+	u32 speed;
+
+	h4dev = devm_kzalloc(&serdev->dev, sizeof(*h4dev), GFP_KERNEL);
+	if (!h4dev)
+		return -ENOMEM;
+
+	hu = &h4dev->hu;
+
+	hu->serdev = serdev;
+	ret = device_property_read_u32(&serdev->dev, "max-speed", &speed);
+	if (!ret) {
+		/* h4 does not have any baudrate handling:
+		 * user oper speed from the start
+		 */
+		hu->init_speed = speed;
+		hu->oper_speed = speed;
+	}
+
+	serdev_device_set_drvdata(serdev, h4dev);
+	dev_info(&serdev->dev, "h4 device registered.\n");
+
+	return hci_uart_register_device(hu, &h4p);
+}
+
+static void h4_remove(struct serdev_device *serdev)
+{
+	struct h4_device *h4dev = serdev_device_get_drvdata(serdev);
+
+	dev_info(&serdev->dev, "h4 device unregistered.\n");
+
+	hci_uart_unregister_device(&h4dev->hu);
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id h4_bluetooth_of_match[] = {
+	{ .compatible = "nxp,aw-xm458-bt" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, h4_bluetooth_of_match);
+#endif
+
+static struct serdev_device_driver h4_serdev_driver = {
+	.probe = h4_probe,
+	.remove = h4_remove,
+	.driver = {
+		.name = "hci_uart_h4",
+		.of_match_table = of_match_ptr(h4_bluetooth_of_match),
+	},
+};
+
 static const struct hci_uart_proto h4p = {
 	.id		= HCI_UART_H4,
 	.name		= "H4",
@@ -143,11 +206,13 @@ static const struct hci_uart_proto h4p = {
 
 int __init h4_init(void)
 {
+	serdev_device_driver_register(&h4_serdev_driver);
 	return hci_uart_register_proto(&h4p);
 }
 
 int __exit h4_deinit(void)
 {
+	serdev_device_driver_unregister(&h4_serdev_driver);
 	return hci_uart_unregister_proto(&h4p);
 }
 
-- 
2.35.1


