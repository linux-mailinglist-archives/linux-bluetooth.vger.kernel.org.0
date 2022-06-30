Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96F3D561A9D
	for <lists+linux-bluetooth@lfdr.de>; Thu, 30 Jun 2022 14:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234989AbiF3MqL (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 30 Jun 2022 08:46:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234866AbiF3MqK (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 30 Jun 2022 08:46:10 -0400
Received: from smtp11.infineon.com (smtp11.infineon.com [IPv6:2a00:18f0:1e00:4::5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7532722508;
        Thu, 30 Jun 2022 05:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1656593170; x=1688129170;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=67vzM6SR05ZdBlDwgz1V5O8K+EJDsuVgPxu1GJpnSoI=;
  b=bAPjonGKif1+RD9eVxkzeh7qJQS7PhkKw7tCZRgaVEhjEgaFbMHkF7is
   vWjB1mjv+C3UzI/RJU/XEvTerMWwCBn9ttKNNF81EaB5OZm8DC6eZ0ZGG
   0kazukCf8ophWWs4Ct12SyGfyg8bwuOWUQbTgtYT+gqJ+sohSmGsoqDgC
   M=;
X-SBRS: None
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="304013064"
X-IronPort-AV: E=Sophos;i="5.92,234,1650924000"; 
   d="scan'208";a="304013064"
Received: from unknown (HELO mucxv001.muc.infineon.com) ([172.23.11.16])
  by smtp11.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2022 14:46:08 +0200
Received: from MUCSE814.infineon.com (MUCSE814.infineon.com [172.23.29.40])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mucxv001.muc.infineon.com (Postfix) with ESMTPS;
        Thu, 30 Jun 2022 14:46:07 +0200 (CEST)
Received: from MUCSE807.infineon.com (172.23.29.33) by MUCSE814.infineon.com
 (172.23.29.40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Thu, 30 Jun
 2022 14:46:07 +0200
Received: from ISCNPF0RJXQS.infineon.com (172.23.8.247) by
 MUCSE807.infineon.com (172.23.29.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Thu, 30 Jun 2022 14:46:05 +0200
From:   Hakan Jansson <hakan.jansson@infineon.com>
CC:     Hakan Jansson <hakan.jansson@infineon.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        "Paolo Abeni" <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        "Luiz Augusto von Dentz" <luiz.dentz@gmail.com>,
        <linux-bluetooth@vger.kernel.org>
Subject: [PATCH v2 1/5] dt-bindings: net: broadcom-bluetooth: Add CYW55572 DT binding
Date:   Thu, 30 Jun 2022 14:45:20 +0200
Message-ID: <e3f949c067ad07a1dd34247efc49f3d913c4f7c6.1656583541.git.hakan.jansson@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656583541.git.hakan.jansson@infineon.com>
References: <cover.1656583541.git.hakan.jansson@infineon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.23.8.247]
X-ClientProxiedBy: MUCSE824.infineon.com (172.23.29.55) To
 MUCSE807.infineon.com (172.23.29.33)
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

CYW55572 is a Wi-Fi + Bluetooth combo device from Infineon.
Extend the binding with its DT compatible.

Signed-off-by: Hakan Jansson <hakan.jansson@infineon.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
V1 -> V2:
  - No changes, submitted as part of updated patch series

 Documentation/devicetree/bindings/net/broadcom-bluetooth.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/broadcom-bluetooth.yaml b/Documentation/devicetree/bindings/net/broadcom-bluetooth.yaml
index df59575840fe..71fe9b17f8f1 100644
--- a/Documentation/devicetree/bindings/net/broadcom-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/broadcom-bluetooth.yaml
@@ -24,6 +24,7 @@ properties:
       - brcm,bcm43540-bt
       - brcm,bcm4335a0
       - brcm,bcm4349-bt
+      - infineon,cyw55572-bt
 
   shutdown-gpios:
     maxItems: 1
-- 
2.25.1

