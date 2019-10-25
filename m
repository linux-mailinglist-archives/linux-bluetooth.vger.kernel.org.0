Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE527E5647
	for <lists+linux-bluetooth@lfdr.de>; Fri, 25 Oct 2019 23:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbfJYVz1 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 25 Oct 2019 17:55:27 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34984 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbfJYVz1 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 25 Oct 2019 17:55:27 -0400
Received: by mail-pl1-f196.google.com with SMTP id c3so1987902plo.2
        for <linux-bluetooth@vger.kernel.org>; Fri, 25 Oct 2019 14:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K331SMUfGTuS8ssrt07hRRxTGZ3R118eP6RXl//v6II=;
        b=W91zWNO0MDSC1dSM2VGEKxLvXO0mToeYff7TkuRAsvGaadnLdl7Y+QZ16oulP7Phsn
         8Gm3ofi3Mz9bM551jBJMnJKjqu55+dvZ3oc0ncqhsilhHKnU6rJfmptOwqboZAJ5Xg7e
         mF+MNIu6oVNi+YuJcPMckBLbLAl2P0oH7vzWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K331SMUfGTuS8ssrt07hRRxTGZ3R118eP6RXl//v6II=;
        b=LpRnv6pJ/KaRMMF71Kh6KPc13PSKTb9tHfbGVOPxCoyeUN2+xHsL+fAfuFD4vXoCps
         VG5aMEbUlF+azNS22YSmUAB7LdQiDyYJvpWEX9/PLni7BjFeDdbIDA55S4Nd1hHGW7Hk
         HhSw7/QKAca79G92dePiGpysa3BFE8a2zcw2KUgRixgPhhUsystUFQbT/lwD1jLW7nhC
         Mlp3r658qFOwc6kf8xPXJDlalsz/5mZz8+0jnYOJ6nXlQxBLaLN36drem1372uo3digT
         JGePX4fbtQppGCBMnV2kRS8ojr1u9GQAarakAZ6LGY59xFHoJl5IU7cUgQ98caXOTDYW
         WAwg==
X-Gm-Message-State: APjAAAVt4OrjFywhfSIBwrUriLFr1Ky68SSZ8UDmshT7+fzrZ9fAeG4T
        HbSS0/IR7f/M/Nljm+0QvD+lnA==
X-Google-Smtp-Source: APXvYqziGJoT8eB5mWgoF5H55wPj/L28gCK25N9WuVU5NVdJh4xWElDTVc5K92fYMgo4YDhheRExMQ==
X-Received: by 2002:a17:902:9689:: with SMTP id n9mr6365578plp.222.1572040526517;
        Fri, 25 Oct 2019 14:55:26 -0700 (PDT)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id y80sm3815110pfc.30.2019.10.25.14.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 14:55:26 -0700 (PDT)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     Johan Hedberg <johan.hedberg@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>
Cc:     linux-bluetooth@vger.kernel.org, dianders@chromium.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] ARM: dts: rockchip: Add brcm bluetooth module on uart0
Date:   Fri, 25 Oct 2019 14:54:28 -0700
Message-Id: <20191025215428.31607-4-abhishekpandit@chromium.org>
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
In-Reply-To: <20191025215428.31607-1-abhishekpandit@chromium.org>
References: <20191025215428.31607-1-abhishekpandit@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This enables the Broadcom uart bluetooth driver on uart0 and gives it
ownership of its gpios. In order to use this, you must enable the
following kconfig options:
  - CONFIG_BT_HCIUART_BCM
  - CONFIG_SERIAL_DEV

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

 arch/arm/boot/dts/rk3288-veyron.dtsi | 31 +++++++---------------------
 1 file changed, 7 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288-veyron.dtsi b/arch/arm/boot/dts/rk3288-veyron.dtsi
index 7525e3dd1fc1..8c9f91ba6f57 100644
--- a/arch/arm/boot/dts/rk3288-veyron.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron.dtsi
@@ -23,30 +23,6 @@
 		reg = <0x0 0x0 0x0 0x80000000>;
 	};
 
-	bt_activity: bt-activity {
-		compatible = "gpio-keys";
-		pinctrl-names = "default";
-		pinctrl-0 = <&bt_host_wake>;
-
-		/*
-		 * HACK: until we have an LPM driver, we'll use an
-		 * ugly GPIO key to allow Bluetooth to wake from S3.
-		 * This is expected to only be used by BT modules that
-		 * use UART for comms.  For BT modules that talk over
-		 * SDIO we should use a wakeup mechanism related to SDIO.
-		 *
-		 * Use KEY_RESERVED here since that will work as a wakeup but
-		 * doesn't get reported to higher levels (so doesn't confuse
-		 * Chrome).
-		 */
-		bt-wake {
-			label = "BT Wakeup";
-			gpios = <&gpio4 RK_PD7 GPIO_ACTIVE_HIGH>;
-			linux,code = <KEY_RESERVED>;
-			wakeup-source;
-		};
-
-	};
 
 	power_button: power-button {
 		compatible = "gpio-keys";
@@ -434,6 +410,13 @@
 	/* Pins don't include flow control by default; add that in */
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_xfer &uart0_cts &uart0_rts>;
+
+	bluetooth {
+		compatible = "brcm,bcm43540-bt";
+		host-wakeup-gpios	= <&gpio4 RK_PD7 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios		= <&gpio4 RK_PD5 GPIO_ACTIVE_LOW>;
+		device-wakeup-gpios	= <&gpio4 RK_PD2 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &uart1 {
-- 
2.24.0.rc0.303.g954a862665-goog

