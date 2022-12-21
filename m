Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86A6A653414
	for <lists+linux-bluetooth@lfdr.de>; Wed, 21 Dec 2022 17:33:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233812AbiLUQdb (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 21 Dec 2022 11:33:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233747AbiLUQd3 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 21 Dec 2022 11:33:29 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D5632180B
        for <linux-bluetooth@vger.kernel.org>; Wed, 21 Dec 2022 08:33:24 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id f20so16169318lja.4
        for <linux-bluetooth@vger.kernel.org>; Wed, 21 Dec 2022 08:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYKTBXQj692clZmnUBZb/0OhG5GDW1ZOmKCzRmlI5HU=;
        b=rcrlx8QU636cRDmAc1IWueD8zv/ImH3X9JV8jxzf26/ASpQdSBc68iqk7T7elbPK+C
         UDmyjbl+/I/LkQOL4/XeUrLMAuWXRizkZbGOA4BiqpIhYNSoZNC+fNwoYl/Xmn4bVR/H
         cKElIwKgGDqPEZ8f9fQaNlrUrW5LeVRogsCskfiVrWnbc7PZ4Lg6NVpkIgvKMLzV/wi2
         3RI7mYQfQqX2ufRcNG1JWkmJ/jYW8WD66oKaykFwlX2h4NnAwaO1NVIsWqvAppDr3EBa
         2xX6AA3JNhWYSZmM9Dn2h9DP9puCn++3EHyGYFiGKi8HSiuyNcfhfPadwB7zyVWcOPv+
         iITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYKTBXQj692clZmnUBZb/0OhG5GDW1ZOmKCzRmlI5HU=;
        b=E31/qE72HvP5bgczMVVO4W1eSuFElmpfUeAqAYwMlX23SYVXBbqE5EWYMlWMMengrA
         dz2fQgWLS+Sm28viXIeLrmfW+6sN8Y03k8GUjb4xevnzu5R7XwzOKBZm2AUKUdS6TC2+
         6CiROqQxe/AO3f6QWogQmCW/X3foDOQGqFik7Vdxv7uV2cDjsO4ovWNNqXuaZiMEL1KE
         9ZucTGUKdMLBNYDz+GQ7dJsTr0DmjZfstt3b/gvAm0MaJhxTqwXQcYSADvoa6pFyTuMG
         fUixqMJ2bIIrcyJZeYykFtxZ6w3lVcQqNWIIVQn6zv6OMDibdz8bjgS78ZpaHO4OFkXL
         abBg==
X-Gm-Message-State: AFqh2koUwgPgPidfSvPEcZzogKKT5BZYYJ0QLUiS7SDFBDRHL28h4dc5
        5aahYyRzZZbZSqK3byu6VBerww==
X-Google-Smtp-Source: AMrXdXs3QapjE8xmgWp0PDtBo95Hc2g1XqLaSMhwKgSzMSPHwQ2TtdVfVaZjOv3AhSIzo37T+IbgLw==
X-Received: by 2002:a05:651c:154e:b0:27a:874:cd2d with SMTP id y14-20020a05651c154e00b0027a0874cd2dmr2300650ljp.9.1671640402963;
        Wed, 21 Dec 2022 08:33:22 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a7-20020a2eb547000000b0026daf4fc0f7sm1380147ljn.92.2022.12.21.08.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 08:33:22 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Zijun Hu <zijuhu@codeaurora.org>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
Cc:     Sai Teja Aluvala <quic_saluvala@quicinc.com>,
        Panicker Harish <quic_pharish@quicinc.com>,
        Johan Hovold <johan@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH 2/2] Bluetooth: hci_qca: Fix driver shutdown on closed serdev
Date:   Wed, 21 Dec 2022 17:32:49 +0100
Message-Id: <20221221163249.1058459-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221163249.1058459-1-krzysztof.kozlowski@linaro.org>
References: <20221221163249.1058459-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The driver shutdown callback (which sends EDL_SOC_RESET to the device
over serdev) should not be invoked when HCI device is not open (e.g. if
hci_dev_open_sync() failed), because the serdev and its TTY are not open
either.  Also skip this step if device is powered off
(qca_power_shutdown()).

Fixes: 7e7bbddd029b ("Bluetooth: hci_qca: Fix qca6390 enable failure after warm reboot")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/bluetooth/hci_qca.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 6eddc23e49d9..3325c8be66f8 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2164,10 +2164,17 @@ static void qca_serdev_shutdown(struct device *dev)
 	int timeout = msecs_to_jiffies(CMD_TRANS_TIMEOUT_MS);
 	struct serdev_device *serdev = to_serdev_device(dev);
 	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
+	struct hci_uart *hu = &qcadev->serdev_hu;
+	struct hci_dev *hdev = hu->hdev;
+	struct qca_data *qca = hu->priv;
 	const u8 ibs_wake_cmd[] = { 0xFD };
 	const u8 edl_reset_soc_cmd[] = { 0x01, 0x00, 0xFC, 0x01, 0x05 };
 
 	if (qcadev->btsoc_type == QCA_QCA6390) {
+		if (test_bit(QCA_BT_OFF, &qca->flags) || \
+		    !test_bit(HCI_RUNNING, &hdev->flags))
+			return;
+
 		serdev_device_write_flush(serdev);
 		ret = serdev_device_write_buf(serdev, ibs_wake_cmd,
 					      sizeof(ibs_wake_cmd));
-- 
2.34.1

