Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A49B0EA689
	for <lists+linux-bluetooth@lfdr.de>; Wed, 30 Oct 2019 23:44:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727498AbfJ3Wo0 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 30 Oct 2019 18:44:26 -0400
Received: from vault.bonstra.fr.eu.org ([51.158.68.104]:39642 "EHLO
        vault.bonstra.fr.eu.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727374AbfJ3WoZ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 30 Oct 2019 18:44:25 -0400
Received: from val.bonstra.fr.eu.org (unknown [192.168.128.2])
        by vault.bonstra.fr.eu.org (Postfix) with ESMTP id 4D3D0BFCD6;
        Wed, 30 Oct 2019 22:44:24 +0000 (UTC)
Received: from bonstra.fr.eu.org (vlad.gr1 [IPv6:fd7b:45cc:aa3d::3])
        by val.bonstra.fr.eu.org (Postfix) with ESMTPSA id 3C7686091C;
        Wed, 30 Oct 2019 23:44:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bonstra.fr.eu.org;
        s=dkim1; t=1572475463; x=1573685063;
        bh=6EDSNQedtRZL4eeWvV9fUI1oEg+HhKJohcv1rUdfRnc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Aa+B7y6qYHWygXQ74g0KCi0ANWplzesPds0Xb7qTxVDRIIE3d/ZHNCbdVoikgm5VS
         mGVMP+RXiXJ4jjtZXjQRSvfApH5UUg0kABj/iNGG6OSQJIlAx+XbCmZH4byly/qvtZ
         hLXYx2ZF0TZ2k968Y6eQ3ogUqIEF4pEelcnR0LynEq5LdvvH8+gQPlfmi2465HQZCX
         kk0pBAsQDXp3lp1hCtDbze1piSUL0XppdRA6cw4/5h3+ZZW46CeXj2voOICnkzo2k3
         5FIq9aM28gMf4UA+hOdge1JSZVJ8C0vnHwagQuQPzrgPfQrOnkfQ9yaTceOvB6Z5c2
         nwCwmXbFOKmZw==
From:   Hugo Grostabussiat <bonstra@bonstra.fr.eu.org>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     Hugo Grostabussiat <bonstra@bonstra.fr.eu.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-bluetooth@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: allwinner: a64: Enable Bluetooth on Teres-I
Date:   Wed, 30 Oct 2019 23:43:33 +0100
Message-Id: <20191030224333.70241-4-bonstra@bonstra.fr.eu.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030224333.70241-1-bonstra@bonstra.fr.eu.org>
References: <20191030224333.70241-1-bonstra@bonstra.fr.eu.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The UART1 on the Teres-A64-I is connected to a rtl8723bs combo
WLAN/Bluetooth controller, with three GPIOs used for device reset,
host wake up and device wake up.

Currently, the host wake up feature is not supported by the HCI H5
driver.

Signed-off-by: Hugo Grostabussiat <bonstra@bonstra.fr.eu.org>
---
 .../arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
index 1069e7012c9c..038e4f0e07df 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
@@ -325,6 +325,19 @@
 	status = "okay";
 };
 
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
+	status = "okay";
+
+	bluetooth {
+		compatible = "realtek,rtl8723bs-bt";
+		enable-gpio = <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 */
+		device-wake-gpio = <&r_pio 0 6 GPIO_ACTIVE_HIGH>; /* PL6 */
+		config-name = "teres_a64_i";
+	};
+};
+
 &usbphy {
 	usb1_vbus-supply = <&reg_usb1_vbus>;
 	status = "okay";
-- 
2.23.0

