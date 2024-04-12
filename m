Return-Path: <linux-bluetooth+bounces-3508-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0628A2811
	for <lists+linux-bluetooth@lfdr.de>; Fri, 12 Apr 2024 09:31:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A8B81F255FE
	for <lists+linux-bluetooth@lfdr.de>; Fri, 12 Apr 2024 07:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336C850246;
	Fri, 12 Apr 2024 07:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nrTSTFLS"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C676D4D9FB
	for <linux-bluetooth@vger.kernel.org>; Fri, 12 Apr 2024 07:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712907060; cv=none; b=lsxkcY0iT5P1IuOijLk3LTJQoMvCEWegFoqqUiZX7VUDNYZOyvGa9Lfs0ulL3wsnaDEZPVaw+jKDV+Mn4uIcduxq2uo04+D8Q+I76XSVw+vG2AfGmzBPq5sFNOG8G5IDS6KMbONKGXvHltTfH68q+mivmxxbW2Iq6qzEAett7Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712907060; c=relaxed/simple;
	bh=clcr3xGmXi1MoiTyiIsmemwtcBLWhlp8yw47o22GM7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AKZCEssX9uhCqkNbVqy1GSCu4lb0aGejG0cSDf0nDuol+68z3Vtqc+0Vh7HZV+PIZUaMwUGT5AI9ZW7Q9d1THBonv6HfArHDty/KV/11rZDbPbNmAQc3mpzn1nidaKGY1QPe5mt1flGupQYKR6GGmcQNlcPDY16JA3/PeXr4ypQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nrTSTFLS; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5a4f7a648dbso355199eaf.3
        for <linux-bluetooth@vger.kernel.org>; Fri, 12 Apr 2024 00:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712907058; x=1713511858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPVvWMAJiQ9bH1Vh3FBxv8RA77e8O4OnA04Edjj3+7c=;
        b=nrTSTFLSXJYc94FEiiZhOfF6C6+3DcL3LVtyjMAlyaM06SH8dgUTR8Y01OV2Y4jLnU
         Zpq389Ffupn6c2rSE/+xHoA/RH4bYoICheVULOr7MPzIk/veTjPvPJYkP79iiQ4httYo
         Ys83cZURfHsyZjPMplU7/pL0VtKkHqkw0RTcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712907058; x=1713511858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPVvWMAJiQ9bH1Vh3FBxv8RA77e8O4OnA04Edjj3+7c=;
        b=NHxMk4YQ2+jOVXhS6lSJHcRaXezmbkubW9OyTcUudJU7HiS4Jt7ROXHZwPmlUpblWj
         eFcikksQoI95UL5QKZpH8xWrcw39dwNMP4IPkHIoKx52nBVBaKG6lvbmJHUvGS15JzoR
         ipFoGDV7iR9S9YduQ7lBeoNiWPmxW1cgqZTi81lJKhEMu1GUAVWAwY2ste+ddXpsbiob
         pfHdBuea5+FDqkzluqEMeDYNpYBJyC4KCp+INDVf4lw+UnAjMpYc9XPjsV5NWNGqe5py
         ewcXM9ARmHsd1M1UglnIGb1KNKUYnzqe51O6w4Y1RZGT7/o2vXfdzz2UWw6p7ZRBjefr
         hFGw==
X-Forwarded-Encrypted: i=1; AJvYcCUDjn3deOjHNHSSHp3FQLJdukXNmZVcHuWMcu0DuOes0wdaoVHgkpKM/JBCLnDyr7z1h1lLmPgtHQvp6nXinkLZ5hdHRerYP2uwohYsV0DO
X-Gm-Message-State: AOJu0Yx2hm05WyPDclvkR8lL1ZbtE9B0l/kHGehtx340QVp8/pOpZRu9
	L4adXWTb1NQyP3/j+new9olubNhJm1Xsy4NCxEP2F6yOnzLm2gMAKcJVNG07uA==
X-Google-Smtp-Source: AGHT+IHbqeFZC+Q0e8Ic2lEtKsE2fsonI92D1nvKY+dlmohGFGapjLW9bPiT6QlzY3Dyk6ly/4CfLw==
X-Received: by 2002:a05:6358:6b0c:b0:186:431:d9d6 with SMTP id y12-20020a0563586b0c00b001860431d9d6mr1648558rwg.17.1712907057809;
        Fri, 12 Apr 2024 00:30:57 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:e3c8:6e1:dcfa:3e8c])
        by smtp.gmail.com with ESMTPSA id d6-20020a637346000000b005d3bae243bbsm2149609pgn.4.2024.04.12.00.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 00:30:57 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: net: bluetooth: Add MediaTek MT7921S SDIO Bluetooth
Date: Fri, 12 Apr 2024 15:30:42 +0800
Message-ID: <20240412073046.1192744-2-wenst@chromium.org>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
In-Reply-To: <20240412073046.1192744-1-wenst@chromium.org>
References: <20240412073046.1192744-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MediaTek MT7921S is a WiFi/Bluetooth combo chip that works over
SDIO. WiFi and Bluetooth are separate SDIO functions within the chip.
While the Bluetooth SDIO function is fully discoverable, the chip has
a pin that can reset just the Bluetooth core, as opposed to the full
chip. This should be described in the device tree.

Add a device tree binding for the Bluetooth SDIO function of the MT7921S
specifically to document the reset line. This binding is based on the MMC
controller binding, which specifies one device node per SDIO function.

Cc: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Expand description and commit message to clearly state that WiFi and
  Bluetooth are separate SDIO functions, and that each function should
  be a separate device node, as specified by the MMC binding.
- Change 'additionalProperties' to 'unevaluatedProperties'
- Add missing separating new line
- s/ot/to/

Angelo's reviewed-by was not picked up due to the above changes.

Changes since v1:
- Reworded descriptions
- Moved binding maintainer section before description
- Added missing reference to bluetooth-controller.yaml
- Added missing GPIO header to example
---
 .../bluetooth/mediatek,mt7921s-bluetooth.yaml | 55 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml

diff --git a/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml
new file mode 100644
index 000000000000..67ff7caad599
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/bluetooth/mediatek,mt7921s-bluetooth.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT7921S Bluetooth
+
+maintainers:
+  - Sean Wang <sean.wang@mediatek.com>
+
+description:
+  MT7921S is an SDIO-attached dual-radio WiFi+Bluetooth Combo chip; each
+  function is its own SDIO function on a shared SDIO interface. The chip
+  has two dedicated reset lines, one for each function core.
+  This binding only covers the Bluetooth SDIO function, with one device
+  node describing only this SDIO function.
+
+allOf:
+  - $ref: bluetooth-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt7921s-bluetooth
+
+  reg:
+    const: 2
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      An active-low reset line for the Bluetooth core; on typical M.2
+      key E modules this is the W_DISABLE2# pin.
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    mmc {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        bluetooth@2 {
+            compatible = "mediatek,mt7921s-bluetooth";
+            reg = <2>;
+            reset-gpios = <&pio 8 GPIO_ACTIVE_LOW>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 88981d9f3958..218bc2a21207 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13818,6 +13818,7 @@ M:	Sean Wang <sean.wang@mediatek.com>
 L:	linux-bluetooth@vger.kernel.org
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml
 F:	Documentation/devicetree/bindings/net/mediatek-bluetooth.txt
 F:	drivers/bluetooth/btmtkuart.c
 
-- 
2.44.0.683.g7961c838ac-goog


