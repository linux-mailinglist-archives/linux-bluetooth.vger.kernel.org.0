Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1506310DF02
	for <lists+linux-bluetooth@lfdr.de>; Sat, 30 Nov 2019 20:47:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727213AbfK3Trp (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 30 Nov 2019 14:47:45 -0500
Received: from vault.bonstra.fr.eu.org ([51.158.68.104]:41412 "EHLO
        vault.bonstra.fr.eu.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727027AbfK3Tro (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 30 Nov 2019 14:47:44 -0500
Received: from val.bonstra.fr.eu.org (unknown [192.168.128.2])
        by vault.bonstra.fr.eu.org (Postfix) with ESMTP id EEFAABFBCC;
        Sat, 30 Nov 2019 19:47:42 +0000 (UTC)
Received: from localhost.localdomain (vlad.gr1 [IPv6:fd7b:45cc:aa3d::3])
        by val.bonstra.fr.eu.org (Postfix) with ESMTPSA id DC31164C1B;
        Sat, 30 Nov 2019 20:47:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bonstra.fr.eu.org;
        s=dkim1; t=1575143262; x=1576352862;
        bh=KTDx3GIAk0BBY7Hm5xNIopsl0EDTIeBIgAhSNWOJzzw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=hYW2SQ4pZ4Dyiyg0ElkH2/+xQZu8QIAXI3Xriv0bqku/CSsuEL88uFdDWRFHYXDQf
         HdzidRtoroHDaHAh039kYYCo8gphb1qE7bV5benmwc7sAhzxa5D4Ekteye98sPAlUY
         qFc300TeYPbeARiu3P0CMbsmlmYU8ZVBDQNwaKeAPoFGfPBsmCfnfn81VflFRtYix3
         2ppI91mHKYXf5JiXJUMTgbeuwHndA9+DCS+OdtYGJ4OOfU/5rO4nhqWesNrlpbJNrt
         rE8xxtC3zm8eO/pYeZYrpCD4KsHyQJrjpAHH0oKVEY0ttOTvrwzQhedPrkcsCe9W6j
         6uIrl45A0MY7Q==
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
Subject: [PATCH v3 3/3] arm64: dts: allwinner: a64: Enable Bluetooth on Teres-I
Date:   Sat, 30 Nov 2019 20:47:19 +0100
Message-Id: <20191130194719.112335-4-bonstra@bonstra.fr.eu.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191130194719.112335-1-bonstra@bonstra.fr.eu.org>
References: <20191130194719.112335-1-bonstra@bonstra.fr.eu.org>
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
 .../boot/dts/allwinner/sun50i-a64-teres-i.dts      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
index 1069e7012c9c..b28e6d7cb227 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
@@ -325,6 +325,20 @@
 	status = "okay";
 };
 
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
+	status = "okay";
+
+	bluetooth {
+		compatible = "realtek,rtl8723bs-bt";
+		powerdown-gpios = <&r_pio 0 4 GPIO_ACTIVE_LOW>; /* PL4 */
+		host-wake-gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /* PL5 */
+		device-wake-gpios = <&r_pio 0 6 GPIO_ACTIVE_HIGH>; /* PL6 */
+		firmware-name = "rtl8723bs_config-teres_a64_i.bin";
+	};
+};
+
 &usbphy {
 	usb1_vbus-supply = <&reg_usb1_vbus>;
 	status = "okay";
-- 
2.24.0

