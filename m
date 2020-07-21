Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 001D22275AA
	for <lists+linux-bluetooth@lfdr.de>; Tue, 21 Jul 2020 04:37:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727991AbgGUChe (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 20 Jul 2020 22:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbgGUChd (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 20 Jul 2020 22:37:33 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A65E7C061794
        for <linux-bluetooth@vger.kernel.org>; Mon, 20 Jul 2020 19:37:33 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id w2so11229545pgg.10
        for <linux-bluetooth@vger.kernel.org>; Mon, 20 Jul 2020 19:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7iFj+VYGc+pNg7a3sKnrHzO0tOtNEDnzb7gZ2GZVQs8=;
        b=noElnCmRRcf07/EwPZXseNlTjLl7oyF5hncD1UoH/a7QU9ljzes9KOXJQPW87AG8oJ
         35HwfsZuhrgIrCJPNU2o0mgDT9nhrM7OHmgQbsUHAPPv6rjVJptumWmlZb5aCkcmG9wp
         UVVRUS3MO+8/cFaXKzHgNabWiaZzRRLLUfogo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7iFj+VYGc+pNg7a3sKnrHzO0tOtNEDnzb7gZ2GZVQs8=;
        b=PCvXLesLasvlawCveoMrQDMlv16r5fJA4wkGsDlm99KxgSIjeinytiOYREg24QVEhC
         BSJ/fCijEPnvpovvRPpqXpCBAmRYMEG7tcy1kPQxXN9WRNy+IayWUTvbYQC8TYnAtaNV
         3/aZunRHELIoJGRfXybstrxg8t7wcgi2QWwGmkBr9xbZ9FV3rb/Uv/aUrZka9ulh1tXx
         WRC/plJpz2xK2Rj8SDnPCxbkZzHzpR32ajl+DMzOwQVSYWxbQm87dDiiB2O34KnPFro5
         Zi1WS47qFHF9GbtmeaNfK3PVmLAyZ9KggowY/XOP5YR0AZwljsHsXvXwoL9H1pOSOzyw
         MAOw==
X-Gm-Message-State: AOAM532nX4hI+8q+WIJIL1NtQMV5U7u5gBqoJctGWTmRIG/aHIAAP4WY
        GIbnGb7ZlTVzym4Qww7auqru3Q==
X-Google-Smtp-Source: ABdhPJybp2k+BYGwk3hoadcZotDg0bccX+mZOYTZdEOKiuC6mz/d1aDLcwfDGdDWCJ1he1lkB8yNGA==
X-Received: by 2002:a63:e017:: with SMTP id e23mr20944311pgh.125.1595299052135;
        Mon, 20 Jul 2020 19:37:32 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com ([2401:fa00:1:b:7220:84ff:fe09:41dc])
        by smtp.gmail.com with ESMTPSA id z6sm17888266pfn.173.2020.07.20.19.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 19:37:31 -0700 (PDT)
From:   Nicolas Boichat <drinkcat@chromium.org>
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Nicolas Boichat <drinkcat@chromium.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] Bluetooth: hci_h5: Set HCI_UART_RESET_ON_INIT to correct flags
Date:   Tue, 21 Jul 2020 10:37:15 +0800
Message-Id: <20200721103652.1.Idbc7eddf1f24f750a8bbcbc8e06743736ae3be31@changeid>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

HCI_UART_RESET_ON_INIT belongs in hdev_flags, not flags.

Fixes: ce945552fde4a09 ("Bluetooth: hci_h5: Add support for serdev enumerated devices")
Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

---

 drivers/bluetooth/hci_h5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_h5.c b/drivers/bluetooth/hci_h5.c
index e60b2e0773db110..e41854e0d79aae2 100644
--- a/drivers/bluetooth/hci_h5.c
+++ b/drivers/bluetooth/hci_h5.c
@@ -793,7 +793,7 @@ static int h5_serdev_probe(struct serdev_device *serdev)
 	if (!h5)
 		return -ENOMEM;
 
-	set_bit(HCI_UART_RESET_ON_INIT, &h5->serdev_hu.flags);
+	set_bit(HCI_UART_RESET_ON_INIT, &h5->serdev_hu.hdev_flags);
 
 	h5->hu = &h5->serdev_hu;
 	h5->serdev_hu.serdev = serdev;
-- 
2.28.0.rc0.105.gf9edc3c819-goog

