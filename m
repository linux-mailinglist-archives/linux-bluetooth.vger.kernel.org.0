Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 328EE73704A
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jun 2023 17:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233287AbjFTPUL (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 20 Jun 2023 11:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233750AbjFTPTx (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 20 Jun 2023 11:19:53 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A105A12C
        for <linux-bluetooth@vger.kernel.org>; Tue, 20 Jun 2023 08:19:49 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f86fbe5e4fso3311653e87.2
        for <linux-bluetooth@vger.kernel.org>; Tue, 20 Jun 2023 08:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687274385; x=1689866385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p40Myde1fQD0UIg2pdHi3GBfZvAX9ZMU2rMN96RSnz4=;
        b=VSRrMFVzm/tx2+tgs2b4f0TfMWuYR3WoPN5QYWDSkc57hO4M2TqfzIGSC6Fh3KDw+9
         FLmbhgaqQYm2JPlLDFDyHfL1zdyTnKPECn/fwVAD3NMIRlMEDxJo63B7Mmjr0gylLqAk
         BAz5rMcZ7xImS8HPaEYZcrMahkzysVugY8M2gCT+97DChTgK3p1a/W8XB/zaApuqgsxO
         7k3BYpIr7G8G0Po7c7E2laloyjTo8cootFClULrM7V3rW6gT1M9x8WTbei8n5BsuQvgu
         msuz731EToSmMI4M/g1uq8u5B5TV0iv5TRX2FaVMD20Zd69nY2BEWQ4WzGs0reCuDOvg
         grWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687274385; x=1689866385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p40Myde1fQD0UIg2pdHi3GBfZvAX9ZMU2rMN96RSnz4=;
        b=hZ5YjFOV1ddASQj40YJGZoV7Lf4y7Mul1D5iC2j52pTNV6UoqLbALIqVKxSuSUOySo
         xzSu+2WHGbDaXjpCoEMVy03A4o8+KxUHrtM2AGNvQr4saqz2Rf6fJBzL4XAz0QKbAsLt
         N7emNiEw9VyP8flKtoL/bWWjV01lIjIAtiWOnKCZCPQ+K4bW6BuaMp4hHg2E6DPF3Y7R
         2qcQQS2zdSm+voCEpMBs2u2NbipaNbEpMrf9EqNk1ynUni1TKID23HBmgvCT1QlLkLYO
         rTaRJysFQekL1PwvAP2WDGLfY8yZjFfKQFb10LF2WOK850wm3b6Yh7ckWOe54SJuPN7g
         JJOg==
X-Gm-Message-State: AC+VfDxEQzXyjLGhJNxD9D11/5t3VS/vPV54/CoILQp+5XCGFzv18/7b
        wcTiv6tV527TQVyYOxfSV5Ki4w==
X-Google-Smtp-Source: ACHHUZ6RxrplvWpSP7VbXbCbvL7neIz92yh4McApWcsTpRoLERfQlJKoITO+aNX5plLeHzFdWqKEtg==
X-Received: by 2002:a19:6702:0:b0:4f8:770d:6d7d with SMTP id b2-20020a196702000000b004f8770d6d7dmr2526971lfc.6.1687274385376;
        Tue, 20 Jun 2023 08:19:45 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id x23-20020a05600c21d700b003f427687ba7sm2518659wmj.41.2023.06.20.08.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 08:19:45 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 20 Jun 2023 17:19:39 +0200
Subject: [PATCH 4/4] arm64: dts: qcom: sm8550-qrd: add bluetooth support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230620-topic-sm8550-upstream-bt-v1-4-4728564f8872@linaro.org>
References: <20230620-topic-sm8550-upstream-bt-v1-0-4728564f8872@linaro.org>
In-Reply-To: <20230620-topic-sm8550-upstream-bt-v1-0-4728564f8872@linaro.org>
To:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        Rocky Liao <rjliao@codeaurora.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1926;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=iuWV9Gxv674pEfpCf7eMGZhLUcpDiyM3q/JmNOeS3JU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkkcOKO49c819U+yoUkl35AaT8tcGr+8GX71phwray
 VPP+SsSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJHDigAKCRB33NvayMhJ0bHuD/
 40xu1H6nRY7N1Zg0Kd7N9u1eCPUqKqATg+pxuDEwcgP56uQ/znYyJZgny2ON/DAk+nKn4SKWJ+pXp8
 PZ/XH1Few0oNPvudL+WnFDfN2UiKqcAaMDNtrBCNNK1J5Ibg+Z9iUtfFCnS6M+HPXJk0hbFZLtVTPp
 11toSYOuMJVTLmk7CF/Y1qKlLY14RR2I+g1CJWloAebyk8//BT6cIOjuOrkUAHq5JaSSqTFLfr9CNb
 NijJ/TGHqhkx+WZoNQTFMRsiaGUNwPmeLvXXT3/QHEVmHSePBXao5yA35xv1n9fLOLYNBaXfGp+tFT
 Ifdb75J/duHHRyni7OnNrfQbXSfePSwwHlY1LCPztqCjPHvkt/Spoe9+CC+eKEEIsWYBlBrzuwFmYe
 aJVNuDBpWJI30+qs0ltmryJNDOu6ENJ6vmyBgCBKHVvvjTkEbPcmgU+j9DAD0gb4aDN34blkH33MiW
 0qPX4Muc7lXXqSiihb7w28sG4Ns9oylHzkLeMrlbTWJssKVny/kN0T5TjuSiT4QIrnwqlWEU4brhHf
 uT2p5xgCwUr6/Al4MChMI94NF9rYHAgh9FHs+qa3QV97zp3H4VY+SMFvfXqhlUz00vd3sp7mSJqMDs
 BpgvuZ1HO/L9OchmUWN/PdDN9KPl2MAaUqBH44Yn2KPijZEEZYyEyZ1SGpIQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Enable the WCN7850 bluetooth over the UART14 link.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 43 +++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index ec4feee6837d..5191fdbe72cb 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -22,6 +22,7 @@ / {
 
 	aliases {
 		serial0 = &uart7;
+		serial1 = &uart14;
 	};
 
 	wcd938x: audio-codec {
@@ -691,6 +692,10 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/sm8550/adsp.mbn",
 			"qcom/sm8550/adsp_dtb.mbn";
@@ -768,6 +773,21 @@ wcd_tx: codec@0,3 {
 &tlmm {
 	gpio-reserved-ranges = <32 8>;
 
+	bt_default: bt-default-state {
+		bt-en-pins {
+			pins = "gpio81";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		sw-ctrl-pins {
+			pins = "gpio82";
+			function = "gpio";
+			bias-pull-down;
+		};
+	};
+
 	sde_dsi_active: sde-dsi-active-state {
 		pins = "gpio133";
 		function = "gpio";
@@ -809,6 +829,29 @@ &uart7 {
 	status = "okay";
 };
 
+&uart14 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+
+		vddio-supply = <&vreg_l15b_1p8>;
+		vddaon-supply = <&vreg_s4e_0p95>;
+		vdddig-supply = <&vreg_s4e_0p95>;
+		vddrfa0p8-supply = <&vreg_s4e_0p95>;
+		vddrfa1p2-supply = <&vreg_s4g_1p25>;
+		vddrfa1p9-supply = <&vreg_s6g_1p86>;
+
+		max-speed = <3200000>;
+
+		enable-gpios = <&tlmm 81 GPIO_ACTIVE_HIGH>;
+		swctrl-gpios = <&tlmm 82 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&bt_default>;
+		pinctrl-names = "default";
+	};
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
 	vcc-supply = <&vreg_l17b_2p5>;

-- 
2.34.1

