Return-Path: <linux-bluetooth+bounces-2728-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D2D88A72E
	for <lists+linux-bluetooth@lfdr.de>; Mon, 25 Mar 2024 16:43:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65D281C3DC79
	for <lists+linux-bluetooth@lfdr.de>; Mon, 25 Mar 2024 15:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A98D14A61D;
	Mon, 25 Mar 2024 13:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="te5fwP3n"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F0C142652
	for <linux-bluetooth@vger.kernel.org>; Mon, 25 Mar 2024 13:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711372629; cv=none; b=S7fOjKZBepOAPiceJ2JJeUT4J4V0c2ofETi4Txuy0KGOmq5YDhjiPDIi+NmHt5oHoVKiIZJBbbs6z84RmmTNUlFGq7/7mNH7he2f+d3a9mDdg+JFIE3/4RXum4bvh/uppJfE9FQ2ntY0WxCyKDxYNrB8d8EWHsav78aWkMOCmJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711372629; c=relaxed/simple;
	bh=5+IC9NWduGMYDJwoz+M/P/TbE3TVb3XsldeZYp6QjIw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H5GoUNr5vz0ewKIAhQChXyHahccyaC6xLEzWbOs3a0riaUHmQvU2h6qT6MgKP7FFmGAbPTBSf9pWD/d1CNm4LaBgkhOUd0m9+HcuRf2tgSvnPpwGHno4vN42VkcLlroBdMCF8v0EwQhQrQKca+GlaoC+gLImFau9xs3Rshq9gMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=te5fwP3n; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d46dd8b0b8so56885211fa.2
        for <linux-bluetooth@vger.kernel.org>; Mon, 25 Mar 2024 06:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711372625; x=1711977425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=waqbyPBy7PW/+wkBLTlsUUO+Lqndku73jazDU1uKB3A=;
        b=te5fwP3nxqu1LtXMzimVk2xRDWG3qPuSArGJCi4MO5HGoR/gRY2KFQb8BUUpJdCo3M
         Exi4kw55lcjMKE0OQN4CldHhZqtIbf3vJ9J9sFKJF5tUTRBK/sSC0PF5JQ/+E5VTw5jt
         27DwZrtQI9yXw9jc5R6QdbMyvqt/ULTsbKk3B2rgkDjIEQSTsKJGTIB8i/Rxyq6BN9FP
         6m6XnmYz6T/OwacH8a1FPIi1iofz9fC6smSShOzmgLt3SN9ahUaUl2F6+z2HPReEASAS
         22+Zqqn7CjID0cLlWfuqf7u+HSs/LVfKJgDO+lShzFCJgU6eSXx8ujW7rB19k4S1Sdap
         8kAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711372625; x=1711977425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=waqbyPBy7PW/+wkBLTlsUUO+Lqndku73jazDU1uKB3A=;
        b=CguDrj+h37mAJ/WMT3Ek+wnytPSyAeo0MG3/FiUMAjaYZCIDZ2ixOtlHakJPexAq1Y
         C2evD8zyg++ODCSK1bqc1qsFAR+lb/NnRkhFX+KbAO3fn/7eNct8SNE+Tzyjc4jo3Qm3
         4oB0NVKqALldWSI8v1k3QGz3ZQO7cKDuuZhvxxR2wP+KDipoeR4Ci9Rp3jaFED2iGDFb
         kueuk1zHJp7mY2GVKWg16r3X6524Bp5rMjcDOIqtf68eY8hhg61dH7f9UVBC9zF912hP
         SoCa64U9JItO29J1PDF23VpHhR+7p2BCcbMG5K6KhbSEqgep2XRRHUuDJGeoP9KFNj6W
         RTZA==
X-Gm-Message-State: AOJu0Yzy/Nmg0/Omz2/1YtjGiGLdKtfAkTti6MWn3pKCFKt7Rq+LapVO
	XBrJT083IM2viar+VQliCRihdDn6yc1IoskWPF0QdIgkN1lA4cE7u2+9B/oM03c=
X-Google-Smtp-Source: AGHT+IFgiUDvmg0zWPchJA4PbJqaWP5kuvnAdsXU3LI0ZosAYxjZT9VquQ4Zw59uesAhsuP/btzmyw==
X-Received: by 2002:a2e:a443:0:b0:2d4:9201:d4ff with SMTP id v3-20020a2ea443000000b002d49201d4ffmr4712403ljn.5.1711372624633;
        Mon, 25 Mar 2024 06:17:04 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:861d:8b72:a859:4ce9])
        by smtp.gmail.com with ESMTPSA id p11-20020a056000018b00b0033e75e5f280sm9485245wrx.113.2024.03.25.06.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 06:17:03 -0700 (PDT)
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
Subject: [PATCH v6 05/16] dt-bindings: net: wireless: describe the ath12k PCI module
Date: Mon, 25 Mar 2024 14:16:13 +0100
Message-Id: <20240325131624.26023-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325131624.26023-1-brgl@bgdev.pl>
References: <20240325131624.26023-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add device-tree bindings for the ATH12K module found in the WCN7850
package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../bindings/net/wireless/qcom,ath12k.yaml    | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
new file mode 100644
index 000000000000..c0aad4815953
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2024 Linaro Limited
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies ath12k wireless devices (PCIe)
+
+maintainers:
+  - Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+  - Jeff Johnson <quic_jjohnson@quicinc.com>
+  - Kalle Valo <kvalo@kernel.org>
+
+description:
+  Qualcomm Technologies IEEE 802.11ax PCIe devices.
+
+properties:
+  compatible:
+    enum:
+      - pci17cb,1107  # WCN7850
+
+  reg:
+    maxItems: 1
+
+  vddaon-supply:
+    description: VDD_AON supply regulator handle
+
+  vddwlcx-supply:
+    description: VDD_WLCX supply regulator handle
+
+  vddwlmx-supply:
+    description: VDD_WLMX supply regulator handle
+
+  vddrfacmn-supply:
+    description: VDD_RFA_CMN supply regulator handle
+
+  vddrfa0p8-supply:
+    description: VDD_RFA_0P8 supply regulator handle
+
+  vddrfa1p2-supply:
+    description: VDD_RFA_1P2 supply regulator handle
+
+  vddrfa1p8-supply:
+    description: VDD_RFA_1P8 supply regulator handle
+
+  vddpcie0p9-supply:
+    description: VDD_PCIE_0P9 supply regulator handle
+
+  vddpcie1p8-supply:
+    description: VDD_PCIE_1P8 supply regulator handle
+
+required:
+  - compatible
+  - reg
+  - vddaon-supply
+  - vddwlcx-supply
+  - vddwlmx-supply
+  - vddrfacmn-supply
+  - vddrfa0p8-supply
+  - vddrfa1p2-supply
+  - vddrfa1p8-supply
+  - vddpcie0p9-supply
+  - vddpcie1p8-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/gpio/gpio.h>
+    pcie {
+        #address-cells = <3>;
+        #size-cells = <2>;
+
+        pcie@0 {
+            device_type = "pci";
+            reg = <0x0 0x0 0x0 0x0 0x0>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            ranges;
+
+            bus-range = <0x01 0xff>;
+
+            wifi@0 {
+                compatible = "pci17cb,1107";
+                reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+                vddaon-supply = <&vreg_pmu_aon_0p59>;
+                vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+                vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+                vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+                vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+                vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+                vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+                vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+                vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+            };
+        };
+    };
-- 
2.40.1


