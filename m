Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5B091F5FB2
	for <lists+linux-bluetooth@lfdr.de>; Thu, 11 Jun 2020 03:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbgFKByF (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 10 Jun 2020 21:54:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726508AbgFKByE (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 10 Jun 2020 21:54:04 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94003C08C5C4
        for <linux-bluetooth@vger.kernel.org>; Wed, 10 Jun 2020 18:54:04 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id i12so1592496pju.3
        for <linux-bluetooth@vger.kernel.org>; Wed, 10 Jun 2020 18:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YeNSbkNZdz3UbDAq71dC4QETLSzCwObNDb/ZTU7KYpw=;
        b=a7jVBd3hCZ19FEnc7qi+cVMxFYFf1JeFjV78BrHVBioQuynMLoW65YnsQ2L8URbTCh
         dzN1oF+HlLtzojDsVmi2NIlE6YNxhzUgWX5r6LHEeGAeYXZ9Fjl1NJ6bgRowMNa1TQHy
         1mcQupHAKBJCcpt1tDvQDfTJSWKVhR3zIhgxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YeNSbkNZdz3UbDAq71dC4QETLSzCwObNDb/ZTU7KYpw=;
        b=F2k+pSLVDKGwg+TQXdfYQVSPZFzRUobTKX1PazJf0axvfm5hkIa8pVR2nNuNozqi4R
         xqGvbiN820DRPk4sfXCB5D1tw6Wz0Y3aaxwXGp9MV3ICInzVWTd5JOwR7mDUP+Ydfz/9
         7kzIfhNFFxX5T3NVHyhCJjZo8hepcA9ROHTnJoRh4wjWSIX9vUEPuxLZwpdhPbliMNiF
         Vm8onihll52j3YZf4D0j4ZJOQ8MsG81pn7Zo4bwM+NkupjLb8RLDW6haJJ5kSehZdhCg
         eMotaLmZ8OX4g1793QZK5zyblowa8QMzBh7FxcCp4sjRCK32SSzu6S2VnUYZ68lRUEmu
         iFaA==
X-Gm-Message-State: AOAM530y9XdQEsEb1VvA2gD4Pj4MsZhcWFhA2gu2NW7Nb20ncxfEELGd
        wkkbmAm1BK1i05rxYk9WOqZ614Fx9aE=
X-Google-Smtp-Source: ABdhPJyQ0PcHB0iCZQspTboInbpc7xgj3WxD4rgaVgP/Trqg3JM+eHRga3w2hzppB+O7T33cf1Z46g==
X-Received: by 2002:a17:902:a515:: with SMTP id s21mr5315672plq.334.1591840444165;
        Wed, 10 Jun 2020 18:54:04 -0700 (PDT)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id b191sm998661pga.13.2020.06.10.18.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 18:54:03 -0700 (PDT)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     marcel@holtman.org, linux-bluetooth@vger.kernel.org
Cc:     alainm@chromium.org, chromeos-bluetooth-upstreaming@chromium.org,
        mka@chromium.org, dianders@chromium.org, linux-pm@vger.kernel.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] Bluetooth: btmrvl_sdio: Set parent dev to hdev
Date:   Wed, 10 Jun 2020 18:53:53 -0700
Message-Id: <20200610185214.1.I01cfe07344286bc26109a3eba1f5582d307309ee@changeid>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
In-Reply-To: <20200611015355.186666-1-abhishekpandit@chromium.org>
References: <20200611015355.186666-1-abhishekpandit@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Set the correct parent dev when registering hdev. This allows userspace
tools to find the parent device (for example, to set the power/wakeup
property).

Before this change, the path was /sys/devices/virtual/bluetooth/hci0
and after this change, it looks more like:
/sys/bus/mmc/devices/mmc1:0001/mmc1:0001:2/bluetooth/hci0

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/bluetooth/btmrvl_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btmrvl_main.c b/drivers/bluetooth/btmrvl_main.c
index 708ad21683eb31..47e450903af423 100644
--- a/drivers/bluetooth/btmrvl_main.c
+++ b/drivers/bluetooth/btmrvl_main.c
@@ -669,6 +669,7 @@ static int btmrvl_service_main_thread(void *data)
 int btmrvl_register_hdev(struct btmrvl_private *priv)
 {
 	struct hci_dev *hdev = NULL;
+	struct btmrvl_sdio_card *card = priv->btmrvl_dev.card;
 	int ret;
 
 	hdev = hci_alloc_dev();
@@ -687,6 +688,7 @@ int btmrvl_register_hdev(struct btmrvl_private *priv)
 	hdev->send  = btmrvl_send_frame;
 	hdev->setup = btmrvl_setup;
 	hdev->set_bdaddr = btmrvl_set_bdaddr;
+	SET_HCIDEV_DEV(hdev, &card->func->dev);
 
 	hdev->dev_type = priv->btmrvl_dev.dev_type;
 
-- 
2.27.0.278.ge193c7cf3a9-goog

