Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 020F94236B2
	for <lists+linux-bluetooth@lfdr.de>; Wed,  6 Oct 2021 05:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233064AbhJFD6B (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 5 Oct 2021 23:58:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237429AbhJFD4o (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 5 Oct 2021 23:56:44 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B995C0617BF
        for <linux-bluetooth@vger.kernel.org>; Tue,  5 Oct 2021 20:54:25 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id n8so4533173lfk.6
        for <linux-bluetooth@vger.kernel.org>; Tue, 05 Oct 2021 20:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lOnAyrBq8epXVQrN/WDXQeiKNCDBNkNLvVnOhj3ua+A=;
        b=EXdBcPTCi9Pbs0BZua/dU4gI91si5Iub0rrfb+BVmheSvGSqXRSQ1kTj9Kqk/o+YSw
         Sp1PzSb7XxDE6ZWrp4WTBqXtYUK5/iu+ZIPqibNy9cycqyaln2LWVHuzozAYV3rtzlq5
         9JDIe22v3Rl6vzgtu8z/JAtQVwEN+sxrE1TnWj64YrQE2kjXFEYtiB6BN+wWrm+JRh2z
         9/9v8A1FYXQ/r87Ky9Q+TyRfQMzrhSFQ1bsbzanHx72oRBfaCXppxWib6kYzeC6exCA9
         QhKWbm+NHDc5HuI/TPTVgPnlLzD9VM/8PG/YDbKoHhCMtKa7spNdHPUdjZwN94pYp1e4
         Xn7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lOnAyrBq8epXVQrN/WDXQeiKNCDBNkNLvVnOhj3ua+A=;
        b=pz1NF7luIod9wF9i8XgIbm+HIu2gS9o4yiYeUi4WYynaetaCCcLMGqAJCoYbTjQeuM
         2BoyWelWonl2jEaXFjqD0OG0NgyumvrBAP+7RyhlKCnauVHrnRvgmlcwmcU6usCZ/2RE
         CQwfGlQNjAN/1dQYvK/Do+kGxY0FzkYAHQKqc7g6aITJEO5SbQ7yqPw+VJjD+JA1o7vY
         aA9l8qN7wKG7zCRnfexdhWMjHHqAMAgHx9ctHqJbTSEg9EaxyK1y1B/w4EwYs5+4wM5o
         k/iVDeTdxn53qnkWyMSBG0GW9AJEK+451nJwwEbDINeo4ydFplxu1fsNcqdO8Y6colwR
         BbCA==
X-Gm-Message-State: AOAM532iPs+8lr0YzovbnNVRLPXwpmGhJwNFXDfLfqF/f+jn5qKdASnN
        HTeH4K1FS1kDVyN78iaHP6q79g==
X-Google-Smtp-Source: ABdhPJytJDOF+lgU658ts6E88pAfppSJZDYauPQN5bzLfv3wFMtv/ZGbgZCMTKCWUMBONI7iO1qyjQ==
X-Received: by 2002:a2e:812:: with SMTP id 18mr26729407lji.497.1633492463509;
        Tue, 05 Oct 2021 20:54:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s4sm2142967lfd.103.2021.10.05.20.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 20:54:23 -0700 (PDT)
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
Subject: [PATCH v1 13/15] arm64: dts: qcom: sdm845-db845c: add second channel to qca power sequencer
Date:   Wed,  6 Oct 2021 06:54:05 +0300
Message-Id: <20211006035407.1147909-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
References: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On DB845c board WiFi/BT chip can use both RF channels/antennas, so add
vddch1-supply property.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index a6a34a959a91..0f3214c60980 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -342,6 +342,12 @@ vreg_l21a_2p95: ldo21 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l23a_3p3: ldo23 {
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l24a_3p075: ldo24 {
 			regulator-min-microvolt = <3088000>;
 			regulator-max-microvolt = <3088000>;
@@ -637,6 +643,7 @@ &qca_pwrseq {
 	vddxo-supply = <&vreg_l7a_1p8>;
 	vddrf-supply = <&vreg_l17a_1p3>;
 	vddch0-supply = <&vreg_l25a_3p3>;
+	vddch1-supply = <&vreg_l23a_3p3>;
 };
 
 &sdhc_2 {
-- 
2.33.0

