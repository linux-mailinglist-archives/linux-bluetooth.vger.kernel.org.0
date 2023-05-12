Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C25C7009A7
	for <lists+linux-bluetooth@lfdr.de>; Fri, 12 May 2023 15:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241373AbjELN7F (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 12 May 2023 09:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241357AbjELN67 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 12 May 2023 09:58:59 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E793311B6A
        for <linux-bluetooth@vger.kernel.org>; Fri, 12 May 2023 06:58:54 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9659e9bbff5so1830081266b.1
        for <linux-bluetooth@vger.kernel.org>; Fri, 12 May 2023 06:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1683899933; x=1686491933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EurCSfvr992X/6Gy0O7JYm3XtzvDHOqQWEeqxrS+tkg=;
        b=MpFaid4LrmkmpMNIiLRoMm4TkTXzDi5yrI72zQiY/CTDBf6wZnkRzw0ebnE5kU2nC3
         CTssnKiroIDezyQIpPCbfqsGVRqgBdNf4IiKZ4JDlecqbg3ibhQsYKR9HT05PBGMu6oZ
         inazl50xNH67x74+4QDxhGVet6+ez4HZLIhoJ8wZyt8sgLH2Nyn8Fs7ZmL4oMhha3jgH
         S8Pxw9mH5FdIqai1pv0/GwGdfzurB93XD32hA/xJBPsnb2sii0rq4yrvxq2K/dyO/yhb
         IqzdIzGovHN+Y46gBxWjdNT63uqVIHP9Jyg9ZG1t4kGqSgRqh0/Vjq5VIoKxS5xhKnOC
         uVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683899933; x=1686491933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EurCSfvr992X/6Gy0O7JYm3XtzvDHOqQWEeqxrS+tkg=;
        b=DcP2mrab9J+DrJrEjljfc1KWp3+eV+oV459KMPSQJGeQSfaTmXF+8iCPJi174wHNcp
         FH+WK+4ZTXlIH4DvGi7dZkATBirwzqz0QKe2CVraAzvY48GS0QlsNjtkwgbyHkzhEWIC
         rejc/nsH2/G3SfzZIn7M1h0w5rUpvp923K0SlSoATgjS69/KUoLG4pIuyV3Bk6H/CF4V
         UEsMaFXqbNYc5iwtOZPgsAimtU9tzgke+lJNq8z5/XcBGqz7jI0xY/unvAcLmCLrkRwl
         np4gSNyLTp4Mbte3k0SK5sVM3G6lNJpe1QInn2ub/n1xvYGFI1KpjfXYNZ08P2juuuaF
         ZJLA==
X-Gm-Message-State: AC+VfDy+ZMRMk5xygsX1WZnAYvhhjndEkJGuao13YsIQRIgavljphECH
        z7mJoJcnwfqeWq0NFmpJAGRMXQ==
X-Google-Smtp-Source: ACHHUZ5UEyM3P4D5ZDQEYMfCru5M45wxzGFfzUZ3l9Wr66ILwFSWfRSSpyyWy7RFttpKOGFK+/FqlA==
X-Received: by 2002:a17:907:6088:b0:949:cb6a:b6f7 with SMTP id ht8-20020a170907608800b00949cb6ab6f7mr24594424ejc.56.1683899933449;
        Fri, 12 May 2023 06:58:53 -0700 (PDT)
Received: from [172.16.240.113] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id mc27-20020a170906eb5b00b00966330021e9sm5399061ejb.47.2023.05.12.06.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 06:58:53 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 12 May 2023 15:58:23 +0200
Subject: [PATCH v2 1/4] dt-bindings: net: qualcomm: Add WCN3988
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230421-fp4-bluetooth-v2-1-3de840d5483e@fairphone.com>
References: <20230421-fp4-bluetooth-v2-0-3de840d5483e@fairphone.com>
In-Reply-To: <20230421-fp4-bluetooth-v2-0-3de840d5483e@fairphone.com>
To:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Add the compatible for the Bluetooth part of the Qualcomm WCN3988
chipset.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
index 68f78b90d23a..7a53e05ae50d 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - qcom,qca6174-bt
       - qcom,qca9377-bt
+      - qcom,wcn3988-bt
       - qcom,wcn3990-bt
       - qcom,wcn3991-bt
       - qcom,wcn3998-bt
@@ -106,6 +107,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,wcn3988-bt
               - qcom,wcn3990-bt
               - qcom,wcn3991-bt
               - qcom,wcn3998-bt

-- 
2.40.1

