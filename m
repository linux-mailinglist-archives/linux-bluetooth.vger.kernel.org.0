Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64CBE561AD1
	for <lists+linux-bluetooth@lfdr.de>; Thu, 30 Jun 2022 14:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235169AbiF3MzM (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 30 Jun 2022 08:55:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234926AbiF3MzG (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 30 Jun 2022 08:55:06 -0400
Received: from smtp2.infineon.com (smtp2.infineon.com [IPv6:2a00:18f0:1e00:4::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1888F42A33;
        Thu, 30 Jun 2022 05:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1656593704; x=1688129704;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oeAdeUrBFEmz6BwW5n6DuRf2vm8YcCn1LKO9eai7Zzo=;
  b=ckb1D2WTU70OlMrUCQcFZ8IRdwXD0B+fbxi6TPtCJTdD2Qr0EHIK6pPs
   CUsbi2QBDUgH0wgPwSKnmTfM4koiNuD93hAFP1E/7e+qfptePT7UImY8Y
   N9l7nFVFMtcOWd03ZXYLGu+fw2Qx2ALTmy6KKY1cpAM6qq5I02b78isMJ
   w=;
X-SBRS: None
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="186456821"
X-IronPort-AV: E=Sophos;i="5.92,234,1650924000"; 
   d="scan'208";a="186456821"
Received: from unknown (HELO mucxv001.muc.infineon.com) ([172.23.11.16])
  by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2022 14:55:02 +0200
Received: from MUCSE812.infineon.com (MUCSE812.infineon.com [172.23.29.38])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mucxv001.muc.infineon.com (Postfix) with ESMTPS;
        Thu, 30 Jun 2022 14:55:02 +0200 (CEST)
Received: from MUCSE807.infineon.com (172.23.29.33) by MUCSE812.infineon.com
 (172.23.29.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Thu, 30 Jun
 2022 14:55:02 +0200
Received: from ISCNPF0RJXQS.infineon.com (172.23.8.247) by
 MUCSE807.infineon.com (172.23.29.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Thu, 30 Jun 2022 14:55:00 +0200
From:   Hakan Jansson <hakan.jansson@infineon.com>
CC:     Hakan Jansson <hakan.jansson@infineon.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        "Luiz Augusto von Dentz" <luiz.dentz@gmail.com>,
        <linux-bluetooth@vger.kernel.org>
Subject: [PATCH v2 5/5] Bluetooth: hci_bcm: Increase host baudrate for CYW55572 in autobaud mode
Date:   Thu, 30 Jun 2022 14:53:45 +0200
Message-ID: <c0ac87d9f7072de6ad8ea7c9d306eacfbb4ef2c9.1656583541.git.hakan.jansson@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656583541.git.hakan.jansson@infineon.com>
References: <cover.1656583541.git.hakan.jansson@infineon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.23.8.247]
X-ClientProxiedBy: MUCSE810.infineon.com (172.23.29.36) To
 MUCSE807.infineon.com (172.23.29.33)
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Add device specific data for max baudrate in autobaud mode. This allows the
host to use a baudrate higher than "init speed" when loading FW in autobaud
mode.

The device specific max baudrate in autobaud mode for CYW55572 is set to
921600 bps. Devices without device specific max baudrate in autobaud mode
will use init speed as before. If no device specific init speed has been
specified, it will default to the bcm_proto default 115200 bps.

The increased baud rate improves FW load time. The exact load time will
depend on the specific system and FW being used. As a rough indication,
the FW load time dropped from ~9s @ 115.2kbps to ~1.7s @ 921.6kbps in one
test.

Signed-off-by: Hakan Jansson <hakan.jansson@infineon.com>
---
V1 -> V2:
  - Add actual baud rates and example FW load time in commit message

 drivers/bluetooth/hci_bcm.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index 0ae627c293c5..d7e0b75db8a6 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -53,10 +53,12 @@
  * struct bcm_device_data - device specific data
  * @no_early_set_baudrate: Disallow set baudrate before driver setup()
  * @drive_rts_on_open: drive RTS signal on ->open() when platform requires it
+ * @max_autobaud_speed: max baudrate supported by device in autobaud mode
  */
 struct bcm_device_data {
 	bool	no_early_set_baudrate;
 	bool	drive_rts_on_open;
+	u32	max_autobaud_speed;
 };
 
 /**
@@ -100,6 +102,7 @@ struct bcm_device_data {
  * @drive_rts_on_open: drive RTS signal on ->open() when platform requires it
  * @pcm_int_params: keep the initial PCM configuration
  * @use_autobaud_mode: start Bluetooth device in autobaud mode
+ * @max_autobaud_speed: max baudrate supported by device in autobaud mode
  */
 struct bcm_device {
 	/* Must be the first member, hci_serdev.c expects this. */
@@ -139,6 +142,7 @@ struct bcm_device {
 	bool			drive_rts_on_open;
 	bool			use_autobaud_mode;
 	u8			pcm_int_params[5];
+	u32			max_autobaud_speed;
 };
 
 /* generic bcm uart resources */
@@ -479,7 +483,10 @@ static int bcm_open(struct hci_uart *hu)
 		else if (bcm->dev->drive_rts_on_open)
 			hci_uart_set_flow_control(hu, true);
 
-		hu->init_speed = bcm->dev->init_speed;
+		if (bcm->dev->use_autobaud_mode && bcm->dev->max_autobaud_speed)
+			hu->init_speed = min(bcm->dev->oper_speed, bcm->dev->max_autobaud_speed);
+		else
+			hu->init_speed = bcm->dev->init_speed;
 
 		/* If oper_speed is set, ldisc/serdev will set the baudrate
 		 * before calling setup()
@@ -585,8 +592,8 @@ static int bcm_setup(struct hci_uart *hu)
 		return 0;
 
 	/* Init speed if any */
-	if (hu->init_speed)
-		speed = hu->init_speed;
+	if (bcm->dev && bcm->dev->init_speed)
+		speed = bcm->dev->init_speed;
 	else if (hu->proto->init_speed)
 		speed = hu->proto->init_speed;
 	else
@@ -1519,6 +1526,7 @@ static int bcm_serdev_probe(struct serdev_device *serdev)
 
 	data = device_get_match_data(bcmdev->dev);
 	if (data) {
+		bcmdev->max_autobaud_speed = data->max_autobaud_speed;
 		bcmdev->no_early_set_baudrate = data->no_early_set_baudrate;
 		bcmdev->drive_rts_on_open = data->drive_rts_on_open;
 	}
@@ -1542,6 +1550,10 @@ static struct bcm_device_data bcm43438_device_data = {
 	.drive_rts_on_open = true,
 };
 
+static struct bcm_device_data cyw55572_device_data = {
+	.max_autobaud_speed = 921600,
+};
+
 static const struct of_device_id bcm_bluetooth_of_match[] = {
 	{ .compatible = "brcm,bcm20702a1" },
 	{ .compatible = "brcm,bcm4329-bt" },
@@ -1554,7 +1566,7 @@ static const struct of_device_id bcm_bluetooth_of_match[] = {
 	{ .compatible = "brcm,bcm4349-bt", .data = &bcm43438_device_data },
 	{ .compatible = "brcm,bcm43540-bt", .data = &bcm4354_device_data },
 	{ .compatible = "brcm,bcm4335a0" },
-	{ .compatible = "infineon,cyw55572-bt" },
+	{ .compatible = "infineon,cyw55572-bt", .data = &cyw55572_device_data },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, bcm_bluetooth_of_match);
-- 
2.25.1

