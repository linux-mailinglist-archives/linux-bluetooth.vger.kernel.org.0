Return-Path: <linux-bluetooth+bounces-10114-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5F5A24DE3
	for <lists+linux-bluetooth@lfdr.de>; Sun,  2 Feb 2025 13:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D615163F45
	for <lists+linux-bluetooth@lfdr.de>; Sun,  2 Feb 2025 12:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C9D71D7994;
	Sun,  2 Feb 2025 12:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XjvaC8a3"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36E11DA2F6
	for <linux-bluetooth@vger.kernel.org>; Sun,  2 Feb 2025 12:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738498576; cv=none; b=Y77OLt4gTxS1zzGXASZjl4NOYF5hHom7LM/Y9oLI88kz4jw/XjKcig4nVtAFMQMmoCQRFyhSkR4BbjjfQ3j+xlHrm/yFHS9thxC6aZw2Pw7QUgIoLu8YyjFtxG2MC6OcN3a2F4g0jDDoRNlWMXTm4DAAuQzi4L+2mJFFmrjY0XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738498576; c=relaxed/simple;
	bh=bnFY74SBqBhj50zQ7HIO+wjy7JugjwXGjrF/pgpBgeg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X21gNz93tcIRaQvWobSYqLfCeI+tl3ijZp96020tDr2a0apNcUTzyV0h/pP2Zw70x1fmi01pNyVkNQM5sfGMS3P+N84du4QrU6WYmRHJ/yXW9VSFjtZnowv8hc5OsY+geDBvPJKfmHoxpTQOnW+DhfAp4PW+fZmS5LcF7ETtUPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XjvaC8a3; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5401ab97206so3331547e87.3
        for <linux-bluetooth@vger.kernel.org>; Sun, 02 Feb 2025 04:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738498573; x=1739103373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dl2JKZ1IRhnp1wS++WB7EWKXLLWje8GjFlU5tMr+N/Y=;
        b=XjvaC8a3b7IQdAv80RLwNFFNTb5XKUaatkgybRxWxxAjl3DJHysQcAJjKppWdcDgiX
         0daQFehyX80f3o/qfsW5SXEv7F1ajfpafUEN68CYsXlRilLnIRVVAFEBWRj+J3/KXX71
         2jGBXi4NzVQX+e+12L/ztq89yCfAFtxSwZqKFwHzFRBVwJxY5qWTLQWnPaqSqWDSXD/8
         IYV166HnLbhAar5T0ZuRfU9L1fQwpAnv5ZNSNKpoujnqinpnsYDd97kc9WJoCTClWs70
         m6G7/uLLMdq/GRn2KHVB2tYKVhxSjxDbYeSnWpNmFsdVnK1N5KolavBOE3dl7ENA6uX3
         qtHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738498573; x=1739103373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dl2JKZ1IRhnp1wS++WB7EWKXLLWje8GjFlU5tMr+N/Y=;
        b=wJlnAOvA9jl1YpYba8wvWD2tx2vL4fKaI7LcauK2hDTJ9+/9wb0aDg+p3eOHlfXrIQ
         4e04Pb2F8XjVtDWBATQjuc2RJV7Z2PWOo2cn69cwKZx3dzIdBEtgFCO0hOQmal57tDzZ
         5H7RJvwTZCVnTWzrskglACbkCHN8Oy1JZ2bPFKyoBvIk+q3uni0Oe1r0/bfK+TGwXsL3
         L5ngWaGJeG5m4CDSCAWfDGXiOKmr/P/4jybJYnGjPlH1OIgZlb4z4xJvCI4LTEoUcGmU
         4FzLIg1+v4QE8hQ630NaVcgTxR90Ouw8Pi7DgyTRt7+HAGNAZ2hLW53l1PdrI3QDlxdW
         0yjQ==
X-Gm-Message-State: AOJu0Yzs1rI9SD8kriIk1K75KZomYKq4paZ86ZLFtv5yJEjLgM2AVsZo
	T1GFqUB396hURAkD9EmjVY5fkgE+MT8r0AdQr0D/hhfVmhO5O0VbCnbGZnYZsog=
X-Gm-Gg: ASbGncsffau2AvMfDeATqvPhCUpOUcI5/23eJ2XQqgMPbP8mTc3WK4Z1lKUn/5c63hg
	XcUWAuHZlq0mh0A6dmwBR/2h54K9yPh2rAolJ/uvcKjBeHH0B6LtfKmLRsuctE2wBoCDSSAzIQN
	usxOq3VmvNNiwT7qGi2Xn+elm+qjF2LsOfd7QbH/pjUFwuR4rfS9pmJs68X/ZWmYIPe5bT60r32
	VfFcYQBmZjqxwdf+6SiW79EWsPgV5IktJ3YpXO8Gbibo8m4QbOFDBas+nG3zy0vaujAhI3MWNOF
	VnUAKkrtteS9flnUBBdE2Go=
X-Google-Smtp-Source: AGHT+IGuBcOzQL927cB5FV4/ZuTsXXAU3wO7PgScQvvImNPVGOdUn38v0cBF4Hvx3gUbQcbfzEj1LA==
X-Received: by 2002:ac2:4e08:0:b0:53e:350a:72a0 with SMTP id 2adb3069b0e04-543e4c3c390mr5333833e87.51.1738498572765;
        Sun, 02 Feb 2025 04:16:12 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb0a4esm950663e87.114.2025.02.02.04.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 04:16:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Feb 2025 14:16:00 +0200
Subject: [PATCH v3 4/6] arm64: dts: qcom: qcm2290: fix (some) of QUP
 interconnects
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-rb1-bt-v3-4-6797a4467ced@linaro.org>
References: <20250202-rb1-bt-v3-0-6797a4467ced@linaro.org>
In-Reply-To: <20250202-rb1-bt-v3-0-6797a4467ced@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4082;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bnFY74SBqBhj50zQ7HIO+wjy7JugjwXGjrF/pgpBgeg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnn2IBBLPEdQCC3ksfcheS8J9refVsucnZOUYFO
 K7LsNfa9eKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ59iAQAKCRCLPIo+Aiko
 1eElB/0SrSwPCWoZipLwTZBl5iMAVtXzwAS1zuxbnoBHv1w2dV4fGQ0i9ZjaGAi/Sgln+/0WNy5
 BMNHiBd/Tel+OkzyAhlo1IEhfA3lP5LScEymb1Zmfk9zs9cgdajCH4XM7rtmVV0ozJVqgoz778g
 JAfvDDfbdtBGrw4BMvmAZWNGCN6yw5uprlhmlmPj+wFgvwiKwtYnzFJ6svx1hEesxbSX9Ef0B1F
 AuV12GuNiEhEaxVeIEhQFIIsUYPFvCrsNsRZojRT47xkVHXsQyV74XBbCXr0UYZmv/SK7XCBtjI
 GEltn0XJ+KdGTI5TWiVNpOYMlRejSDdLynXT7NHaIGNdNhY5
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

While adding interconnect support for the QCM2290 platform some of them
got the c&p error, rogue MASTER_APPSS_PROC for the config_noc
interconnect. Turn that into SLAVE_QUP_0 as expected.

Fixes: 5b970ff0193d ("arm64: dts: qcom: qcm2290: Hook up interconnects")
Reported-by: Konrad Dybcio <konradybcio@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index f0746123e594d5ce5cc314c956eaca11556a9211..6e3e57dd02612f3568f07f1e198028413f463c69 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -1073,7 +1073,7 @@ spi0: spi@4a80000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
 						 &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 						<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
-						 &config_noc MASTER_APPSS_PROC RPM_ALWAYS_TAG>;
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
 				interconnect-names = "qup-core",
 						     "qup-config";
 				#address-cells = <1>;
@@ -1092,7 +1092,7 @@ uart0: serial@4a80000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
 						 &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 						<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
-						 &config_noc MASTER_APPSS_PROC RPM_ALWAYS_TAG>;
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
 				interconnect-names = "qup-core",
 						     "qup-config";
 				status = "disabled";
@@ -1137,7 +1137,7 @@ spi1: spi@4a84000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
 						 &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 						<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
-						 &config_noc MASTER_APPSS_PROC RPM_ALWAYS_TAG>;
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
 				interconnect-names = "qup-core",
 						     "qup-config";
 				#address-cells = <1>;
@@ -1184,7 +1184,7 @@ spi2: spi@4a88000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
 						 &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 						<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
-						 &config_noc MASTER_APPSS_PROC RPM_ALWAYS_TAG>;
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
 				interconnect-names = "qup-core",
 						     "qup-config";
 				#address-cells = <1>;
@@ -1231,7 +1231,7 @@ spi3: spi@4a8c000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
 						 &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 						<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
-						 &config_noc MASTER_APPSS_PROC RPM_ALWAYS_TAG>;
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
 				interconnect-names = "qup-core",
 						     "qup-config";
 				#address-cells = <1>;
@@ -1278,7 +1278,7 @@ spi4: spi@4a90000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
 						 &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 						<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
-						 &config_noc MASTER_APPSS_PROC RPM_ALWAYS_TAG>;
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
 				interconnect-names = "qup-core",
 						     "qup-config";
 				#address-cells = <1>;
@@ -1297,7 +1297,7 @@ uart4: serial@4a90000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
 						 &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 						<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
-						 &config_noc MASTER_APPSS_PROC RPM_ALWAYS_TAG>;
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
 				interconnect-names = "qup-core",
 						     "qup-config";
 				status = "disabled";
@@ -1342,7 +1342,7 @@ spi5: spi@4a94000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
 						 &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 						<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
-						 &config_noc MASTER_APPSS_PROC RPM_ALWAYS_TAG>;
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
 				interconnect-names = "qup-core",
 						     "qup-config";
 				#address-cells = <1>;

-- 
2.39.5


