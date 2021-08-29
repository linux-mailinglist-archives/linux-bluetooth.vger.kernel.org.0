Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFE553FABA3
	for <lists+linux-bluetooth@lfdr.de>; Sun, 29 Aug 2021 15:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235592AbhH2NOR (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 29 Aug 2021 09:14:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235565AbhH2NOO (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 29 Aug 2021 09:14:14 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0E61C06129D
        for <linux-bluetooth@vger.kernel.org>; Sun, 29 Aug 2021 06:13:21 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id q21so20692482ljj.6
        for <linux-bluetooth@vger.kernel.org>; Sun, 29 Aug 2021 06:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DZOpdA3eYjpudg4OpQFFkH8jLHw3BxsNdxzTMff7kgw=;
        b=JYgvhRh/XMbWSmh2hHQ6low2HT/EK5Db15j4xEn196MVYAmhicQUPTkqK33Ygf5yJV
         rIzHsKI+Z3ckWJRnIUe8dzDewGj8MNiCcN3JIyjVk8xGm0jTD/fexByf4nfLDCRojILy
         /oSMgUZwtgSQTDfCyHKl3j2WvWHGMsledNkCtgxqqMzm9IvPQvg4CFrG2Jlfglgj36iX
         PooxcxfGHTuPO6c6gyEHfNmzBVsimJZLJTGHu6co+MuRlWDTVLxi4vVmD0a2oxg5N+8h
         2NOSABtA1NVG0Xv+u7omjq/8kK4obaak3LZh0U+Pdzi6pCOqwezV15LMpV08KYXIqDFE
         T49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DZOpdA3eYjpudg4OpQFFkH8jLHw3BxsNdxzTMff7kgw=;
        b=lmTdF8orR68cH4fytdXwSbNqZRp7HOxn7Cyjeg/XNEE+nx02s8IsYR62EYPRkAGuNY
         7Y1pGZgfOP+mwdBsjtgKMknUQR7SUjUtIq8gz+wTlAnNyekzM/UkdsvINXMeq/uJWk+C
         UgZ8Ea+1491Nl35JJ3BdY4VbocF6ldeuBJb0dyomiD7iyvhwqK5RwscuSYMpM9DWeIli
         YnZiBMmrnEZYvTAfxLvOaxZXAJ61N4S6scAIetoI84Xxobbs3PEMDIWxRwV34yQIdVtx
         9QyQotvU/cX8pVLHr2O4btFcp4nOosJxC9b546/5EtsLHBKrFXDFpnhVyJo/vkOMVDw6
         yT0g==
X-Gm-Message-State: AOAM532a615uWCh/433BPXa55b6lI46LBGeULQMjYGlTDFFS3kzlm5rV
        lNDxE8E3Ci5gOz+4Sdc0QYTJ1A==
X-Google-Smtp-Source: ABdhPJwN0RnHneAiBvwIuepF2POuNFYC+7soqzPBkiEXgB5t1sLpCiFezga+nEjbYoWJ71ExIPe4Iw==
X-Received: by 2002:a2e:b605:: with SMTP id r5mr16548450ljn.283.1630242800140;
        Sun, 29 Aug 2021 06:13:20 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x13sm712503lfq.262.2021.08.29.06.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 06:13:19 -0700 (PDT)
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
Subject: [RFC v2 13/13] WIP: arm64: dts: qcom: qrb5165-rb5: add bus-pwrseq property to pcie0
Date:   Sun, 29 Aug 2021 16:13:05 +0300
Message-Id: <20210829131305.534417-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210829131305.534417-1-dmitry.baryshkov@linaro.org>
References: <20210829131305.534417-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 326330f528fc..0c347cb6f8e0 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -689,6 +689,7 @@ wifi-therm@1 {
 
 &pcie0 {
 	status = "okay";
+	bus-pwrseq = <&qca_pwrseq 0>;
 };
 
 &pcie0_phy {
-- 
2.33.0

