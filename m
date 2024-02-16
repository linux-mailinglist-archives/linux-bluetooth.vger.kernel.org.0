Return-Path: <linux-bluetooth+bounces-1934-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A59858714
	for <lists+linux-bluetooth@lfdr.de>; Fri, 16 Feb 2024 21:38:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB1E91C24C40
	for <lists+linux-bluetooth@lfdr.de>; Fri, 16 Feb 2024 20:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D0915098E;
	Fri, 16 Feb 2024 20:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xzHP3Y9o"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CC514A0BB
	for <linux-bluetooth@vger.kernel.org>; Fri, 16 Feb 2024 20:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708115609; cv=none; b=BZWq45Y3+0yjomNnmy3TaRGi/V43C1chRL8D4E5wNesjFZXg3XdsgAHoBCOSorIWJX8PrpPVyFBNWwoOgT1OTgCKNW+iE505JQqE69sPmC3QQHYyNLKvf7Q3e+wCFlnGtOk5nFUOCDXukziVey5Gv56EZq0ZynRdsrMETiDAN04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708115609; c=relaxed/simple;
	bh=wwd3Xij+rOHq/CWdFCeH+2K4nGFWVnX35W8A6dmUUSw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Pnfus3HOSaRcAQTlZXYk6RvxY8VLGWi6ngBcRlKv1gziNRYFppCV3uRcvs14GR602qg63ordn7wcnkusXnwbLVJMBnC8n7/6QEEWDUY5QqXNiBB4ImK9w9CbBA+bzFT2Yj+wNQLC2HUT7XdDS4Anm1gZ5OMS26ZVdzzhZOusmKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xzHP3Y9o; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-411e5f21c0bso20061605e9.0
        for <linux-bluetooth@vger.kernel.org>; Fri, 16 Feb 2024 12:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708115603; x=1708720403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xi8a7IDbsc7NWjITXvW8vzVKHWVwk2jKqzcZASrP8yE=;
        b=xzHP3Y9ofocgeq5RhsS9vy5SmKIlXOnikKLURkiBqIDkswYtPU+ZOHO+xqTxrumgZI
         iSxWmFouzFCfQggfrm5uJyd7JkaAiKoVQaJOv6GsNZGM8ejhlCzZ/NCUinLbKoD9pDYb
         jZm8ggLrbYfCHQbsXkI1VB3m24xFFYfyZXsoJYFIEiK+XqZqNQoTe34/94WGnOdMN8M2
         WazihsqiNR8+jHmA2xrhF/b7dNI8IDamGTm2o8OQ8uIIzE0hSmduvffcLd7m+9ZWswxh
         BHwMqulHu4zPvc8+vi+/8xTrktuKontRPqDR7w8icl12DtdJWM/1qA3Gz+4PIDjFvrkY
         S3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708115603; x=1708720403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xi8a7IDbsc7NWjITXvW8vzVKHWVwk2jKqzcZASrP8yE=;
        b=gOMoc1obF2L40oEuidc25g+47zLrWovy9oyJ5Sfx7aOQB8/NdSkRaW61qO5WVyfwig
         66EydaIvRY1ZnJ7nuFaek6LbPeFTI4h9Mxent6viRwiTzmFT0MYecojLFtha0YhMSMUQ
         cfRwrChalkBbfUAjTH/VQLGznvz2x99Cc7KByZkwR3Ae4IAH2w1MLwvzd2fBK33TBsXA
         cZcKxwKC7iYncBUofPrGFsEaUQnUunKKKfLi/g1ejdfaFEEe8rIysz0gSFLahW4nf3xf
         6JYZqwh+N+SW2AoZN6xdgGbVcptvAza9uIV0kLIVy8SKiv585C6v4DvXgpBDPM+vzpRI
         J/ew==
X-Gm-Message-State: AOJu0YwbBBYxLpZPrRmLW1f4i95XOidgIO4Dq49LoQ9QHnjMoLF4fsue
	bBlGGzetjMODHdP1Tb+6cNyvKQhj6zHr0QF+gL22mLCk1x6ZlfrfoFqN1TEstGg=
X-Google-Smtp-Source: AGHT+IEdNFiS4jqjTMwr9bbhFoBmmcjEmHiM7ik8UO5vPc2X24r/EQeJTolFoj1NizIPC6YHWTEuWQ==
X-Received: by 2002:a05:600c:4f0d:b0:410:7428:1fb5 with SMTP id l13-20020a05600c4f0d00b0041074281fb5mr4348569wmq.27.1708115603697;
        Fri, 16 Feb 2024 12:33:23 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7758:12d:16:5f19])
        by smtp.gmail.com with ESMTPSA id m5-20020a05600c4f4500b0041253d0acd6sm1420528wmq.47.2024.02.16.12.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 12:33:23 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Saravana Kannan <saravanak@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnd Bergmann <arnd@arndb.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lukas Wunner <lukas@wunner.de>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v5 08/18] arm64: dts: qcom: sm8650-qrd: add the Wifi node
Date: Fri, 16 Feb 2024 21:32:05 +0100
Message-Id: <20240216203215.40870-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240216203215.40870-1-brgl@bgdev.pl>
References: <20240216203215.40870-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Neil Armstrong <neil.armstrong@linaro.org>

Describe the ath12k WLAN on-board the WCN7850 module present on the
board.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
[Bartosz:
  - move the pcieport0 node into the .dtsi
  - make regulator naming consistent with existing DT code
  - add commit message]
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 29 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi    | 10 +++++++++
 2 files changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index b07cac2e5bc8..4623c358f634 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -845,6 +845,28 @@ &pcie0 {
 	status = "okay";
 };
 
+&pcieport0 {
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wlan_en>;
+
+		enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_s4i_0p85>;
+		vddio-supply = <&vreg_l15b_1p8>;
+		vddio1p2-supply = <&vreg_l3c_1p2>;
+		vddaon-supply = <&vreg_s2c_0p8>;
+		vdddig-supply = <&vreg_s3c_0p9>;
+		vddrfa1p2-supply = <&vreg_s1c_1p2>;
+		vddrfa1p8-supply = <&vreg_s6c_1p8>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK1>;
+	};
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l1i_0p88>;
 	vdda-pll-supply = <&vreg_l3i_1p2>;
@@ -1139,6 +1161,13 @@ wcd_default: wcd-reset-n-active-state {
 		bias-disable;
 		output-low;
 	};
+
+	wlan_en: wlan-en-state {
+		pins = "gpio16";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
 };
 
 &uart14 {
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index d488b3b3265e..baf4932e460c 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2293,6 +2293,16 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			dma-coherent;
 
 			status = "disabled";
+
+			pcieport0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+
+				bus-range = <0x01 0xff>;
+			};
 		};
 
 		pcie0_phy: phy@1c06000 {
-- 
2.40.1


