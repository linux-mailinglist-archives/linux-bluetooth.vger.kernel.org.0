Return-Path: <linux-bluetooth+bounces-6037-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A0392B946
	for <lists+linux-bluetooth@lfdr.de>; Tue,  9 Jul 2024 14:21:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44EF01C23A1A
	for <lists+linux-bluetooth@lfdr.de>; Tue,  9 Jul 2024 12:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA99C1684A5;
	Tue,  9 Jul 2024 12:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NnQQW1n6"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D06156243
	for <linux-bluetooth@vger.kernel.org>; Tue,  9 Jul 2024 12:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720527543; cv=none; b=YhErUPOP0pP64Bqhhx9mQdZnaCbJeDQodeWI24kffxt27xLvcAKsObeOzwsBwRMRK91wZ5SYr3c434imMHnYXxLES/CG4SS+CsuVPZaEu8/bJ4kKOMKb7/e3HSo/WFTg869xjZ1biZ99XHjb99/Khc6HCR8PPAJlBBR7SkwrzhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720527543; c=relaxed/simple;
	bh=x+REoia1SPVixROvzFdazwCRh5mhW9XzZbQzMlPar2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bpvV7Grz8NACcmPgGhBi3/Cm1Bkfb+6fmlgeIgCEGhkVZkgHoTmo5p9/XF6IuQXlVSmhFos606hHzENDoRTKJaktfxwBdmwNAg9VdA4IgGGHa5jIZHL3TaWn/cuo9jPTsgIf+LlAoioWfYBSn7nvYZbskyXFiZmRAcEzDGWIf5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NnQQW1n6; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-36796a9b636so3486628f8f.2
        for <linux-bluetooth@vger.kernel.org>; Tue, 09 Jul 2024 05:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720527540; x=1721132340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xo8BvOJHNg5KkElAnqbJxKoNs4vF5XqhPo69/tFmIJc=;
        b=NnQQW1n6lrU1To2/YO9s/SMpDvU8qx3SBKrdmP9Ul5r/30DL+p7S+2xeDgr3WohOdp
         pIKVUE62Gua8ln+HYZPzpB5yGHwSyXB0KB2op3nW6/EDMWmtX+2+BAKWBQhGLi/AdjM/
         xWTsSQjyQwx6ovBk9v1R7fTeoIkgdK0NOQcYpyE/a5ZJr/Dccvy46LVr+jKHobrc1VRt
         ypQMssYDILV/D/rKuHAtjLcaXy+vh5/DrSBR3kKN+Tp1UPtolN/PTPC3NRun7e+Jp13O
         6rsCAuASbw+8wr4HzAigLicXsdL8VCilBbtdF/PJEc6/9rB9uLWR9GneOpFPwWSr1bWQ
         kPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720527540; x=1721132340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xo8BvOJHNg5KkElAnqbJxKoNs4vF5XqhPo69/tFmIJc=;
        b=L7QMolIxBVBiS5i/WqbvTHwpbr5uQZgnme3357HcLK/Zu+KFD1uJ8Fz8EqgmddpUW0
         q10ClqObZCx7cGC6sBTxqKXUXzGbw/CbwIbF9oHDkbRwEAn4h+auAUiIjCPe8KA7xLv3
         2dmk21k0GtOgjzSXY7VLVVJZU8k6mKq5yQZSm4a7IhWWkKpV6+D/U6AIk6Ym+MzQjpWt
         0tD6XfMYcQMcEv6SMl+RWVsDIEn8byAj0zkz5NuvAxOr+bBFsQTmqODhZE52nyhBISsi
         7PGim1F+9Uu7O/OxfqZ3RqF9qwiamMhZ5XllQGm/zNhnOTzEkrlTZ+dEGS5jA3tv6wTQ
         5lqQ==
X-Gm-Message-State: AOJu0YwmyytRLZd5Z1PDPZEbYLAB/U2eIYFzcCNEInsNi78toJ5km7kJ
	ibNEUEZGU4YpMOZBIAP1LlyJYiQBvcOkpLNRNmSdoTvifSA4axhJGEEVJDleBzM=
X-Google-Smtp-Source: AGHT+IHlYFU3VnCeKhs6de8k08lOqiraDKQwIwTkroWp04T47sikkaBz+RY4PASboELzd9n8rzAl5A==
X-Received: by 2002:adf:ee4f:0:b0:367:8a68:e749 with SMTP id ffacd0b85a97d-367cea964ecmr1963236f8f.37.1720527539879;
        Tue, 09 Jul 2024 05:18:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c270:70c:8581:7be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfa06d3sm2390574f8f.75.2024.07.09.05.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 05:18:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Jul 2024 14:18:37 +0200
Subject: [PATCH v3 6/6] arm64: dts: qcom: sm8650-qrd: use the PMU to power
 up bluetooth
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-hci_qca_refactor-v3-6-5f48ca001fed@linaro.org>
References: <20240709-hci_qca_refactor-v3-0-5f48ca001fed@linaro.org>
In-Reply-To: <20240709-hci_qca_refactor-v3-0-5f48ca001fed@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1973;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=kdQldVCRGhnIPxVPu3DpUjVdb4CujtCOUfjhf5GMlEY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmjSqqrGtnMnAwMYYIYS3zS2YrAF26znEBpNGGj
 DaLl2ycXvaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZo0qqgAKCRARpy6gFHHX
 csZFD/4mFXxIGvpO9UdR4a8zv+U66aV35atlSCS46BTY4R9DAA2wbTBOmuuEpgoXXIGFgF0+x3s
 Auiizip378OXGWWE34jpq1bstjoFf0anC/YhjiQFAiycAWmUdRjlOyGeTYdAk/qFmOitnvEe3ag
 oBLLy3CiJKSnsxl8Twwp50kQFsULpw/3A/Aj54aviu1awBYHC+Ht9I8vxecLXbn7ZDDFH7+nQTY
 ylHAhmhcIkg6VonJk9XSgv2xNEJPcZcmdb9x9FlM7e1zz8HVqto6E17vgdWsAL6O0NAu+D78awD
 xqjjDKamHNEVfsUp7plAmsPNPl9xUe8NQcQgPihRQlrL4wuhkeFncM85sVKL9sYHPgBy7poG88p
 DD1AraUu51VWNULs7gPZ9pDqB5l2S9TddeOlvG2hBDEyeFvAh06d3M2X8epMXNyicRJ9aZ2G7iG
 Cdb0LeqMuTe6GZlq2Ukey+djfoEIqtRNKEIiL0XLw9PLP9uEm1Pu8IwSKsTDja+wYUh/dxAgRIY
 yk1f/R/nPikrXOKIs7Ad1FsTn3hMG7Sm7hqAn7fa4jnP4Kg3foFBpKwlmOXc28tYF9bcStt6ZY5
 wgFgjK+7YeLAbIWm7DYAWEuQWpUc1ZyDNlbzNu0HG0XbfqtK/zImkEH7qVrahTYPBXhE05AWqHg
 J4deYfbuLPfa9Vg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Change the HW model in sm8650-qrd.dts to a one closer to reality - where
the WLAN and Bluetooth modules of the WCN7850 are powered by the PMU
inside the package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index b0d7927b708f..8ca0d28eba9b 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -208,13 +208,10 @@ wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
 		pinctrl-names = "default";
-		pinctrl-0 = <&wlan_en>;
+		pinctrl-0 = <&wlan_en>, <&bt_default>;
 
 		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
-		/*
-		 * TODO Add bt-enable-gpios once the Bluetooth driver is
-		 * converted to using the power sequencer.
-		 */
+		bt-enable-gpios = <&tlmm 17 GPIO_ACTIVE_HIGH>;
 
 		vdd-supply = <&vreg_s4i_0p85>;
 		vddio-supply = <&vreg_l15b_1p8>;
@@ -1255,22 +1252,15 @@ &uart14 {
 	bluetooth {
 		compatible = "qcom,wcn7850-bt";
 
-		clocks = <&rpmhcc RPMH_RF_CLK1>;
-
-		vddio-supply = <&vreg_l3c_1p2>;
-		vddaon-supply = <&vreg_l15b_1p8>;
-		vdddig-supply = <&vreg_s3c_0p9>;
-		vddrfa0p8-supply = <&vreg_s3c_0p9>;
-		vddrfa1p2-supply = <&vreg_s1c_1p2>;
-		vddrfa1p9-supply = <&vreg_s6c_1p8>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
 
 		max-speed = <3200000>;
-
-		enable-gpios = <&tlmm 17 GPIO_ACTIVE_HIGH>;
-		swctrl-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
-
-		pinctrl-0 = <&bt_default>;
-		pinctrl-names = "default";
 	};
 };
 

-- 
2.43.0


