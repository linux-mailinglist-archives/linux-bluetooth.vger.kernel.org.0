Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF9846C98D0
	for <lists+linux-bluetooth@lfdr.de>; Mon, 27 Mar 2023 01:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231979AbjCZXij (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 26 Mar 2023 19:38:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231717AbjCZXiW (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 26 Mar 2023 19:38:22 -0400
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2E9259E5
        for <linux-bluetooth@vger.kernel.org>; Sun, 26 Mar 2023 16:38:20 -0700 (PDT)
Received: by mail-oo1-xc29.google.com with SMTP id v14-20020a4ae6ce000000b0053b91ae6552so1079259oot.8
        for <linux-bluetooth@vger.kernel.org>; Sun, 26 Mar 2023 16:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1679873900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOYoXNhDxV9KBWMQ/yrHmx0omzhnX0saDndzajAssSo=;
        b=Jx8g1FahvAgWj0s4SjnHbHJ5VXxWsidBMCMCDDRv7MnqDrKoxIwFIGQ7FmWaLvI3rS
         N+Obso/VAq/qnUmxO85G9PYdCLmH/BLapIUIUnq5EGdzlbIef+XwZ5iDalmI0vpC9mki
         SkDiR+F38QjBI+Ni4dG25qL1JXFOK3+OfXXGmC8ArCGKUrXf7jOU5lMK5HlkULLSIFNE
         gjNsHlaAiIe/vLV5i4q8KMJ2T6bk4k5ub1lFqMP2e/NPjWFDSWCBvgtqsOrZcuFTP0fM
         j5k2ns338T7mohj204OzxGsu623ZRSkHhfy9iT99S4xFhRUgCusw99PjHJeIExXv6MAK
         hNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679873900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOYoXNhDxV9KBWMQ/yrHmx0omzhnX0saDndzajAssSo=;
        b=kM0E4lnBzZ2lJau1WUlf32G8PT0XKW3u3SdbPLqQbbmdRjfCZcK/dtOLI5qi9x7D3M
         GLRecK9hTlr2z0j2fedK5fZJ2Hs2oHVqmOVPoKBF66d5v9XPnV3pxiJ2Tb2CVvEMoLlt
         WA37KTaoEeiKQHzodz3uAXtcs8q+5Vcu+nx1chmRU5s/lNyiA9Mq8Tm2YUCXw12pNvkP
         cnWo04y+BFmUVG0am6L7ayPtjIXsCl3pYwDv7EWmBERMkxDhWjtgKOSZIVnp0zpqOC4P
         JolmxmejgQ90VbHt8jc/JCi7rLZSGFbSLl36YNM4ZoURWPaoPlY+0TUU3R7Jbd9XJGVS
         t5iw==
X-Gm-Message-State: AO0yUKWQ7vCyo2IRPCJ3QAhYrJc8CL8p0YrIDzsQw2sHwW5PziL2nubY
        mKeFhyXZhQOz+cNSk/kd8cD3nQ==
X-Google-Smtp-Source: AK7set8CEFURxAGBWTFm/sFlXJrqCOCtWNlhaQN+tN+9K24M2OPU8Vuy99/AVu9gavTy8v+bi+nBJg==
X-Received: by 2002:a4a:4111:0:b0:517:4020:60b6 with SMTP id x17-20020a4a4111000000b00517402060b6mr4949987ooa.8.1679873900279;
        Sun, 26 Mar 2023 16:38:20 -0700 (PDT)
Received: from localhost ([2600:1700:eb1:c450::35])
        by smtp.gmail.com with ESMTPSA id u63-20020a4a5742000000b0051aa196ac82sm10921355ooa.14.2023.03.26.16.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 16:38:19 -0700 (PDT)
From:   Steev Klimaszewski <steev@kali.org>
To:     Steev Klimaszewski <steev@kali.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Sven Peter <sven@svenpeter.dev>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        Mark Pearson <markpearson@lenovo.com>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH v8 4/4] arm64: dts: qcom: sc8280xp-x13s: Add bluetooth
Date:   Sun, 26 Mar 2023 18:38:12 -0500
Message-Id: <20230326233812.28058-5-steev@kali.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326233812.28058-1-steev@kali.org>
References: <20230326233812.28058-1-steev@kali.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The Lenovo Thinkpad X13s has a WCN6855 Bluetooth controller on uart2,
add this.

Signed-off-by: Steev Klimaszewski <steev@kali.org>
---
Changes since v7:
 * Drop regulator now in a different patchset from Johan
 * Fix alphabetization

Changes since v6:
 * Remove allowed-modes as they aren't needed
 * Remove regulator-allow-set-load
 * Set regulator-always-on because the wifi chip also uses the regulator
 * cts pin uses bias-bus-hold
 * Alphabetize uart2 pins

Changes since v5:
 * Update patch subject
 * Specify initial mode (via guess) for vreg_s1c
 * Drop uart17 definition
 * Rename bt_en to bt_default because configuring more than one pin
 * Correct (maybe) bias configurations
 * Correct cts gpio
 * Split rts-tx into two nodes
 * Drop incorrect link in the commit message

Changes since v4:
 * Address Konrad's review comments.

Changes since v3:
 * Add vreg_s1c
 * Add regulators and not dead code
 * Fix commit message changelog

Changes since v2:
 * Remove dead code and add TODO comment
 * Make dtbs_check happy with the pin definitions

 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index da79b5465a1b..129c5f9a2a61 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -24,6 +24,7 @@ / {
 	aliases {
 		i2c4 = &i2c4;
 		i2c21 = &i2c21;
+		serial1 = &uart2;
 	};
 
 	wcd938x: audio-codec {
@@ -1102,6 +1103,32 @@ &txmacro {
 	status = "okay";
 };
 
+&uart2 {
+	pinctrl-0 = <&uart2_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn6855-bt";
+
+		vddio-supply = <&vreg_s10b>;
+		vddbtcxmx-supply = <&vreg_s12b>;
+		vddrfacmn-supply = <&vreg_s12b>;
+		vddrfa0p8-supply = <&vreg_s12b>;
+		vddrfa1p2-supply = <&vreg_s11b>;
+		vddrfa1p7-supply = <&vreg_s1c>;
+
+		max-speed = <3200000>;
+
+		enable-gpios = <&tlmm 133 GPIO_ACTIVE_HIGH>;
+		swctrl-gpios = <&tlmm 132 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&bt_default>;
+		pinctrl-names = "default";
+	};
+};
+
 &usb_0 {
 	status = "okay";
 };
@@ -1222,6 +1249,21 @@ hastings_reg_en: hastings-reg-en-state {
 &tlmm {
 	gpio-reserved-ranges = <70 2>, <74 6>, <83 4>, <125 2>, <128 2>, <154 7>;
 
+	bt_default: bt-default-state {
+		hstp-bt-en-pins {
+			pins = "gpio133";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		hstp-sw-ctrl-pins {
+			pins = "gpio132";
+			function = "gpio";
+			bias-pull-down;
+		};
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio25";
 		function = "gpio";
@@ -1389,6 +1431,34 @@ reset-n-pins {
 		};
 	};
 
+	uart2_default: uart2-default-state {
+		cts-pins {
+			pins = "gpio121";
+			function = "qup2";
+			bias-bus-hold;
+		};
+
+		rts-pins {
+			pins = "gpio122";
+			function = "qup2";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		rx-pins {
+			pins = "gpio124";
+			function = "qup2";
+			bias-pull-up;
+		};
+
+		tx-pins {
+			pins = "gpio123";
+			function = "qup2";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	usb0_sbu_default: usb0-sbu-state {
 		oe-n-pins {
 			pins = "gpio101";
-- 
2.39.2

