Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64BD64236B9
	for <lists+linux-bluetooth@lfdr.de>; Wed,  6 Oct 2021 05:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237543AbhJFD6S (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 5 Oct 2021 23:58:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237831AbhJFD5I (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 5 Oct 2021 23:57:08 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C443FC0613A6
        for <linux-bluetooth@vger.kernel.org>; Tue,  5 Oct 2021 20:54:25 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id m3so4629133lfu.2
        for <linux-bluetooth@vger.kernel.org>; Tue, 05 Oct 2021 20:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cntTQV+8xT1gaPRWwmEttMqurpErGQCflfEN/t0ShBw=;
        b=nI8QFgOb018OHBusf4YC2JeMjW54+ysmQEB8kR7Xsem1gHesZm4WMMnTqiCIMiIJic
         WI7/wxQI+UPOYHBu3IM8HVi9QtbP9cW2z7Dw6JKWTuCV4ApU9PGZzJrmoVoO8ohQJUx2
         ofFLe3i5sE2uwNgAtXM+eSdn8y8WAry7pokGo4W4zYARZ5um+aTBPwVaXMYetwnPHqnt
         EukYtJv6K7yZzw+gQsNKLblw67yWlUpB+YUL310GiTZMoiBbS2CMLfTpElLBXjmOdr5n
         Qg+qq3q8Cw/VMVHNvozcdAKgFGZYFF40fyNeJ64thfSGSgOSto4way/p2ww9JO/ImxaM
         5Lww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cntTQV+8xT1gaPRWwmEttMqurpErGQCflfEN/t0ShBw=;
        b=CXY1kRBrLQc9qWrynfkpmUV6e6uhsX7OpLS9If2W2roVKSryI7nkuCfrCH5KAAgC50
         BO+WBAfaLq422ME+Dz6Gu/kW2LCKjTTvFqriVCZIN9csH2fS2e1NIN+xrxhkdIUnApWP
         EDkxbPYjWiKZwZvFdXC9XV5h78N23eZcah9TOgTpm7Wdy322MywCnDgQ08Tl3SI7vzEE
         /hHoo6E0R8vWp07O2uYK3bgopyIdoGcU/HWkuZabj3r0IjxqYBNWKiHM3La62aoWps+T
         8X8YOEvFYIFUkxEb/Q5FkVwYBypb34BFmsMonWWUwt7+8MbnDCFyeEc8gHjhBLqAvOlP
         oJDg==
X-Gm-Message-State: AOAM530+Eknu5Q2Li4bda4/Wjn4qchvlAxH8QOVxankv8BUCzZ/kAu4r
        duE06s+KT5JKfWZgCT3SzDNFtQ==
X-Google-Smtp-Source: ABdhPJxsUvRGDiX/+G1NjVUXp066qhnPQIzeN7/ovvdbZrBswOTRoBoS6GwOzADjXLYmhRy7xOhHcw==
X-Received: by 2002:ac2:59d0:: with SMTP id x16mr7310130lfn.107.1633492464220;
        Tue, 05 Oct 2021 20:54:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s4sm2142967lfd.103.2021.10.05.20.54.23
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
Subject: [PATCH v1 14/15] WIP: PCI: qcom: use pwrseq to power up bus devices
Date:   Wed,  6 Oct 2021 06:54:06 +0300
Message-Id: <20211006035407.1147909-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
References: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Use bus-pwrseq device tree node to power up the devices on the bus. This
is to be rewritten with the proper code parsing the device tree and
powering up individual devices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 8a7a300163e5..f398283912c7 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -23,6 +23,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
+#include <linux/pwrseq/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
@@ -1467,6 +1468,7 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 	struct pcie_port *pp;
 	struct dw_pcie *pci;
 	struct qcom_pcie *pcie;
+	struct pwrseq *pwrseq;
 	int ret;
 
 	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
@@ -1520,6 +1522,17 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 
 	pp->ops = &qcom_pcie_dw_ops;
 
+	pwrseq = devm_pwrseq_get(dev, "bus");
+	if (IS_ERR(pwrseq)) {
+		ret = PTR_ERR(pwrseq);
+		goto err_pm_runtime_put;
+	}
+	if (pwrseq) {
+		ret = pwrseq_full_power_on(pwrseq);
+		if (ret)
+			goto err_pm_runtime_put;
+	}
+
 	ret = phy_init(pcie->phy);
 	if (ret) {
 		pm_runtime_disable(&pdev->dev);
-- 
2.33.0

