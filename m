Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04479613F3E
	for <lists+linux-bluetooth@lfdr.de>; Mon, 31 Oct 2022 21:48:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbiJaUsV (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 31 Oct 2022 16:48:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbiJaUsT (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 31 Oct 2022 16:48:19 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A386A13F14;
        Mon, 31 Oct 2022 13:48:17 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 6A3D485516;
        Mon, 31 Oct 2022 21:48:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1667249295;
        bh=pq9DqKce60sVUC1K+Yc/28v+Bml4q8FIg6z4f8sn9ic=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oljSgmRl+hyCeLzuOB0L0Z0csV+M6TM/KE4fTHVGSmXNGUJIS4nhs8M9wr+eJ3f/Q
         vyI8c8Y67gcqm55JTou5avN/6e1Nlra2233hgdc1pYWmwedNLHZmD+WXin72oUfsFZ
         A++u6y1n83/0UFmmBKDaubmNIYYlaS3dzfz3p0Kc5qfGgb3L5zbFNsrDxVvjP7+siQ
         RBjsp+eA0AMhzGqpDQ0e+sCbE7c07wGaK2+2Bp6rP01SvSQgUeJVOFxJ0j+bEfq7JV
         N3IqWyD43dZ6cIOk+045wt9ifGINm7YFpdpvY4n6cpw9eJxRu5mlnu2LI2Usfro8mS
         9huiZm1mwGpHw==
From:   Marek Vasut <marex@denx.de>
To:     linux-bluetooth@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Hakan Jansson <hakan.jansson@infineon.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 2/2] Bluetooth: hci_bcm: Add CYW4373A0 support
Date:   Mon, 31 Oct 2022 21:48:04 +0100
Message-Id: <20221031204804.195267-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221031204804.195267-1-marex@denx.de>
References: <20221031204804.195267-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

CYW4373A0 is a Wi-Fi + Bluetooth combo device from Cypress.
This chip is present e.g. on muRata 2AE module.

This chip has additional quirk where the HCI command 0xfc45, used on
older chips to switch UART clock from 24 MHz to 48 MHz, to support
baudrates over 3 Mbdps, is no longer recognized by this newer chip.
This newer chip can configure the 4 Mbdps baudrate without the need
to issue HCI command 0xfc45, so add flag to indicate this and do not
issue the command on this chip to avoid failure to set 4 Mbdps baud
rate.

It is not clear whether there is a way to determine which chip does
and which chip does not support the HCI command 0xfc45, other than
trial and error.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Hakan Jansson <hakan.jansson@infineon.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Cc: Marcel Holtmann <marcel@holtmann.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
To: linux-bluetooth@vger.kernel.org
---
 drivers/bluetooth/hci_bcm.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index d7e0b75db8a60..29da04815763f 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -53,11 +53,13 @@
  * struct bcm_device_data - device specific data
  * @no_early_set_baudrate: Disallow set baudrate before driver setup()
  * @drive_rts_on_open: drive RTS signal on ->open() when platform requires it
+ * @no_uart_clock_set: UART clock set command for >3Mbps mode is unavailable
  * @max_autobaud_speed: max baudrate supported by device in autobaud mode
  */
 struct bcm_device_data {
 	bool	no_early_set_baudrate;
 	bool	drive_rts_on_open;
+	bool	no_uart_clock_set;
 	u32	max_autobaud_speed;
 };
 
@@ -100,6 +102,7 @@ struct bcm_device_data {
  * @is_suspended: whether flow control is currently disabled
  * @no_early_set_baudrate: don't set_baudrate before setup()
  * @drive_rts_on_open: drive RTS signal on ->open() when platform requires it
+ * @no_uart_clock_set: UART clock set command for >3Mbps mode is unavailable
  * @pcm_int_params: keep the initial PCM configuration
  * @use_autobaud_mode: start Bluetooth device in autobaud mode
  * @max_autobaud_speed: max baudrate supported by device in autobaud mode
@@ -140,6 +143,7 @@ struct bcm_device {
 #endif
 	bool			no_early_set_baudrate;
 	bool			drive_rts_on_open;
+	bool			no_uart_clock_set;
 	bool			use_autobaud_mode;
 	u8			pcm_int_params[5];
 	u32			max_autobaud_speed;
@@ -172,10 +176,11 @@ static inline void host_set_baudrate(struct hci_uart *hu, unsigned int speed)
 static int bcm_set_baudrate(struct hci_uart *hu, unsigned int speed)
 {
 	struct hci_dev *hdev = hu->hdev;
+	struct bcm_data *bcm = hu->priv;
 	struct sk_buff *skb;
 	struct bcm_update_uart_baud_rate param;
 
-	if (speed > 3000000) {
+	if (speed > 3000000 && !bcm->dev->no_uart_clock_set) {
 		struct bcm_write_uart_clock_setting clock;
 
 		clock.type = BCM_UART_CLOCK_48MHZ;
@@ -1529,6 +1534,7 @@ static int bcm_serdev_probe(struct serdev_device *serdev)
 		bcmdev->max_autobaud_speed = data->max_autobaud_speed;
 		bcmdev->no_early_set_baudrate = data->no_early_set_baudrate;
 		bcmdev->drive_rts_on_open = data->drive_rts_on_open;
+		bcmdev->no_uart_clock_set = data->no_uart_clock_set;
 	}
 
 	return hci_uart_register_device(&bcmdev->serdev_hu, &bcm_proto);
@@ -1550,6 +1556,10 @@ static struct bcm_device_data bcm43438_device_data = {
 	.drive_rts_on_open = true,
 };
 
+static struct bcm_device_data bcm4373a0_device_data = {
+	.no_uart_clock_set = true,
+};
+
 static struct bcm_device_data cyw55572_device_data = {
 	.max_autobaud_speed = 921600,
 };
@@ -1566,6 +1576,7 @@ static const struct of_device_id bcm_bluetooth_of_match[] = {
 	{ .compatible = "brcm,bcm4349-bt", .data = &bcm43438_device_data },
 	{ .compatible = "brcm,bcm43540-bt", .data = &bcm4354_device_data },
 	{ .compatible = "brcm,bcm4335a0" },
+	{ .compatible = "cypress,cyw4373a0-bt", .data = &bcm4373a0_device_data },
 	{ .compatible = "infineon,cyw55572-bt", .data = &cyw55572_device_data },
 	{ },
 };
-- 
2.35.1

