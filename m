Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C623A4CAD79
	for <lists+linux-bluetooth@lfdr.de>; Wed,  2 Mar 2022 19:25:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244438AbiCBS0D (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 2 Mar 2022 13:26:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240788AbiCBS0C (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 2 Mar 2022 13:26:02 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A725939F2
        for <linux-bluetooth@vger.kernel.org>; Wed,  2 Mar 2022 10:25:18 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id dr20so5523055ejc.6
        for <linux-bluetooth@vger.kernel.org>; Wed, 02 Mar 2022 10:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zru33MOIq9u6j5okLf6Dq+iG+dSjlj1psboOqbx3Ln8=;
        b=Adyt4zxOk04oIJ+Y/gJBinkf33Hoz0xYu9/G8cP+FDRCLqM4hb2Bvn4XF4xX43pmfr
         xmXrTYN9UmaB0OXxxICbzV9gmpJoQtwiJCMaCiH6orPb5Lh2Vcu0tflFnwPk90CxQ87G
         f3LRTLVHvUjMYWBeYTM0HworoahgmUvv0NYt/yILtjWKJ+vEA46yn0ZztHGxfgMDT2mK
         uya2xo1KfEW32bBq9FPe9fsnEA6WwNTCLsy2vOhD73js0hH8EUpQDCckkFLcCuvC1cD/
         0QsnYrrk2z1QBZ7pFHwu1pC+Eta1oQ8dfZKU9o3TpOAiTPB/SfQkWwqY4sAtcWCpwyiN
         8x4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zru33MOIq9u6j5okLf6Dq+iG+dSjlj1psboOqbx3Ln8=;
        b=0tGoFrJFbIZe2ih0NmtiADF4FPyNhH8kFd6+FwVykR5udckZuuWG/oTRyPDnSxnSXs
         lJ9VS4cA2DJQPnWJ0FUyGrBGqzkGbsdByfy+8JtvGiZuM4bXPnm8Bt5mSh8sGQvNDvI3
         afP3Fcj6S7vG50iW0b6dLPP08Pvx7c1D5G+n8WwdqiEYt2j5j4wkUn0vV/8KPaAmQTpc
         IJnLhYZhupSB/NSL2PEIFf4lkBg9QmSeth7Kc71BbB3JO7jBalSpkHzUSL1ZM4772ddR
         XgERY4fPxXaNTpJCLDn9JAw6trCyv36LaBOk5kEGLm7dcFf7jGg2kfCDNj2pesmcplRP
         s0bg==
X-Gm-Message-State: AOAM530O4wuFBlLI7NunwMvMY11K9SDiAV6GtSbrqxuuTPI/3qqGTZ4f
        cw0SQpAfuyeG6hFNpX7K+Ae46Q==
X-Google-Smtp-Source: ABdhPJwa5yyy5dN0BrPZBSZVSzlqjTHHsdlaU7eir7KpsB4BimR1iMy0VYyo36DjkWerqXUGrGEKTg==
X-Received: by 2002:a17:906:1e0c:b0:6cf:d014:e454 with SMTP id g12-20020a1709061e0c00b006cfd014e454mr24821370ejj.583.1646245517075;
        Wed, 02 Mar 2022 10:25:17 -0800 (PST)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id eo8-20020a1709069b0800b006ce6eef6836sm6569297ejc.131.2022.03.02.10.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 10:25:16 -0800 (PST)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     caleb.connolly@linaro.org, Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH] bluetooth: hci_event: don't print an error on vendor events
Date:   Wed,  2 Mar 2022 18:23:52 +0000
Message-Id: <20220302182352.441352-1-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Since commit 3e54c5890c87 ("Bluetooth: hci_event: Use of a function table to handle HCI events"),
some devices see errors being printed for vendor events, e.g.

[   75.806141] Bluetooth: hci0: setting up wcn399x
[   75.948311] Bluetooth: hci0: unexpected event 0xff length: 14 > 0
[   75.955552] Bluetooth: hci0: QCA Product ID   :0x0000000a
[   75.961369] Bluetooth: hci0: QCA SOC Version  :0x40010214
[   75.967417] Bluetooth: hci0: QCA ROM Version  :0x00000201
[   75.973363] Bluetooth: hci0: QCA Patch Version:0x00000001
[   76.000289] Bluetooth: hci0: QCA controller version 0x02140201
[   76.006727] Bluetooth: hci0: QCA Downloading qca/crbtfw21.tlv
[   76.986850] Bluetooth: hci0: unexpected event 0xff length: 3 > 0
[   77.013574] Bluetooth: hci0: QCA Downloading qca/oneplus6/crnv21.bin
[   77.024302] Bluetooth: hci0: unexpected event 0xff length: 3 > 0
[   77.032681] Bluetooth: hci0: unexpected event 0xff length: 3 > 0
[   77.040674] Bluetooth: hci0: unexpected event 0xff length: 3 > 0
[   77.049251] Bluetooth: hci0: unexpected event 0xff length: 3 > 0
[   77.057997] Bluetooth: hci0: unexpected event 0xff length: 3 > 0
[   77.066320] Bluetooth: hci0: unexpected event 0xff length: 3 > 0
[   77.075065] Bluetooth: hci0: unexpected event 0xff length: 3 > 0
[   77.083073] Bluetooth: hci0: unexpected event 0xff length: 3 > 0
[   77.091250] Bluetooth: hci0: unexpected event 0xff length: 3 > 0
[   77.099417] Bluetooth: hci0: unexpected event 0xff length: 3 > 0
[   77.110166] Bluetooth: hci0: unexpected event 0xff length: 3 > 0
[   77.118672] Bluetooth: hci0: unexpected event 0xff length: 3 > 0
[   77.127449] Bluetooth: hci0: unexpected event 0xff length: 3 > 0
[   77.137190] Bluetooth: hci0: unexpected event 0xff length: 3 > 0
[   77.146192] Bluetooth: hci0: unexpected event 0xff length: 3 > 0
[   77.154242] Bluetooth: hci0: unexpected event 0xff length: 3 > 0
[   77.163183] Bluetooth: hci0: unexpected event 0xff length: 3 > 0
[   77.171202] Bluetooth: hci0: unexpected event 0xff length: 3 > 0
[   77.179364] Bluetooth: hci0: unexpected event 0xff length: 3 > 0
[   77.187259] Bluetooth: hci0: unexpected event 0xff length: 3 > 0
[   77.198451] Bluetooth: hci0: QCA setup on UART is completed

Use the quick-return path in hci_event_func() to avoid printing this
message for vendor events, this reverts to the previous behaviour which
didn't print an error for vendor events.

Fixes: 3e54c5890c87 ("Bluetooth: hci_event: Use of a function table to handle HCI events")
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 net/bluetooth/hci_event.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index fc30f4c03d29..56cc41ea9f31 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -6809,7 +6809,7 @@ static void hci_event_func(struct hci_dev *hdev, u8 event, struct sk_buff *skb,
 	const struct hci_ev *ev = &hci_ev_table[event];
 	void *data;
 
-	if (!ev->func)
+	if (!ev->func || event == HCI_EV_VENDOR)
 		return;
 
 	if (skb->len < ev->min_len) {
-- 
2.35.1

