Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7B5C4236AD
	for <lists+linux-bluetooth@lfdr.de>; Wed,  6 Oct 2021 05:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237979AbhJFD5g (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 5 Oct 2021 23:57:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237595AbhJFD4b (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 5 Oct 2021 23:56:31 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35A22C0617B0
        for <linux-bluetooth@vger.kernel.org>; Tue,  5 Oct 2021 20:54:24 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id x27so4497012lfa.9
        for <linux-bluetooth@vger.kernel.org>; Tue, 05 Oct 2021 20:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fc0GoKyWHbaDUKZRwzSCHWvKPWvkUL1O7EIfFaZFJjw=;
        b=ek+UBm52N/dNF84c5mtTjMTJvJ5oGZ0lbXTAAjAyV1XvQDUOFH0l/tTMhfVzJAVy1s
         5A9IIqqQjiddD6Xxi2TTAaGdSgVqpk0Rmqtk98pIDkXppBKhslgFJvZPuN4VYjg8Kh/k
         NvN7a6TOOxfaYoA9A7SJwXWmEtuPXBVt4gb8badGbZhlGOA620Gyxh4R+YbZd6q49MOv
         2Qi1wfxZ+XCc8YcurEshmk0YU/rcgY4765nt9Wx5F406K53k2YpQJYrDUJTkWqNBikGf
         xKtKknzKdnRkKPLuVnIzXFOf+W03r/taVjHXCFr1DlAWSxc5MKil96Ym1SLsZZZJqpo+
         ufLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fc0GoKyWHbaDUKZRwzSCHWvKPWvkUL1O7EIfFaZFJjw=;
        b=QuA47KUgISmWpYbxs+YscMMtiyTwvn4uo2t7NGjj3YwQd2IR8bLkWIh8dGXFUpNdH1
         UubYobL43Nh1fMJiIgxyc9kDH/fUskw1Hj4KfQ4+bRDuTkmLTVZx6cwUiXJKg5WsENXa
         bXUcwMvkSsN8RQ7GgD0Tl8Zzudv3qcct+29ewbMqDhDyicc7gjEjX/yE2JMCHPwJNaRi
         GDZd27nMRyD+LN9a3PMu6fWJvlPJOOP3md2DL9NAwEr/248BQpAph/5sUiYz2Mbxm4QC
         6wSwLtDWKnj8QPgF34ylG4/HZRdEhZw/pCXNDfXacoFtK2cAX/6miIj+kd36d7T7Ow3X
         MG4Q==
X-Gm-Message-State: AOAM531B2rrFaASWalkVHuzvi9nrA4aOIbdumE3HtbX7zQt7WkXSoQKz
        Z+iK46stHYxK6qDMKMb8klQxKw==
X-Google-Smtp-Source: ABdhPJwsKWl3H1d1iLra8+QrQS59nd54fvK9Etapf6nvAyz9n7l6E+sLHM/FZUi8R5GtNZVbuy881Q==
X-Received: by 2002:a2e:9893:: with SMTP id b19mr26949222ljj.112.1633492462601;
        Tue, 05 Oct 2021 20:54:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s4sm2142967lfd.103.2021.10.05.20.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 20:54:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH v1 12/15] arm64: dts: qcom: qrb5165-rb5: add bluetooth support
Date:   Wed,  6 Oct 2021 06:54:04 +0300
Message-Id: <20211006035407.1147909-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
References: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Add support for the bluetooth part of the QCA6391 BT+WiFi chip present
on the RB5 board. WiFi is not supported yet, as it requires separate
handling of the PCIe device power.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 50 ++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 8ac96f8e79d4..326330f528fc 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -19,6 +19,7 @@ / {
 
 	aliases {
 		serial0 = &uart12;
+		serial1 = &uart6;
 		sdhc2 = &sdhc_2;
 	};
 
@@ -98,6 +99,25 @@ lt9611_3v3: lt9611-3v3 {
 		regulator-always-on;
 	};
 
+	qca_pwrseq: qca-pwrseq {
+		compatible = "qcom,qca6390-pwrseq";
+
+		#pwrseq-cells = <1>;
+
+		vddaon-supply = <&vreg_s6a_0p95>;
+		vddpmu-supply = <&vreg_s2f_0p95>;
+		vddrfa1-supply = <&vreg_s2f_0p95>;
+		vddrfa2-supply = <&vreg_s8c_1p3>;
+		vddrfa3-supply = <&vreg_s5a_1p9>;
+		vddpcie1-supply = <&vreg_s8c_1p3>;
+		vddpcie2-supply = <&vreg_s5a_1p9>;
+		vddio-supply = <&vreg_s4a_1p8>;
+
+		bt-enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+		wifi-enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
+		swctrl-gpios = <&tlmm 124 GPIO_ACTIVE_HIGH>;
+	};
+
 	thermal-zones {
 		conn-thermal {
 			polling-delay-passive = <0>;
@@ -804,6 +824,26 @@ lt9611_rst_pin: lt9611-rst-pin {
 	};
 };
 
+&qup_uart6_default {
+	ctsrx {
+		pins = "gpio16", "gpio19";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	rts {
+		pins = "gpio17";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	tx {
+		pins = "gpio18";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -1193,6 +1233,16 @@ sdc2_card_det_n: sd-card-det-n {
 	};
 };
 
+&uart6 {
+	status = "okay";
+	bluetooth {
+		compatible = "qcom,qca6390-bt";
+		clocks = <&sleep_clk>;
+
+		bt-pwrseq = <&qca_pwrseq 1>;
+	};
+};
+
 &uart12 {
 	status = "okay";
 };
-- 
2.33.0

