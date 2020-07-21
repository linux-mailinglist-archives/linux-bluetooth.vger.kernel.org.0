Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8EC72275AC
	for <lists+linux-bluetooth@lfdr.de>; Tue, 21 Jul 2020 04:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728307AbgGUChh (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 20 Jul 2020 22:37:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbgGUChg (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 20 Jul 2020 22:37:36 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6689AC0619D5
        for <linux-bluetooth@vger.kernel.org>; Mon, 20 Jul 2020 19:37:36 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id a9so828236pjd.3
        for <linux-bluetooth@vger.kernel.org>; Mon, 20 Jul 2020 19:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TY8XfCON4S0JDepfGrFgWfYRJOwnBuFe9fcLJ+y+GUE=;
        b=MT9XwQvk7j9jaVTNDu33PSB3paK7rMOToCBADL8lAhj8gfTegZZY0dRfXMdKpbwIsl
         WT2qUkCmWI5WetdDngau1iznOVAqPUFe3M1Pbnsy34yKF3EDeLkJcL1uG1E1EZs5d1jr
         6GJgb8m8HGh1IC//kNuLNntIXuRVewVb4EtGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TY8XfCON4S0JDepfGrFgWfYRJOwnBuFe9fcLJ+y+GUE=;
        b=eVp5m+16+SVN6QgMC/v1rEcK3780PIdCI0/wHuFQ0AYLNSS3OZ+foMUNjnqiTgcaDS
         felMw4bBPkIB9ivAw387FeoLyd1X8k43pCf663Q3kJ+i19lvhm/0PUwmR7OEHxgFTsuA
         TQZGrFqCt58LPhWjjYE2uKbCsbWu1tUYnRmHTWekHLQcU4CBwnp+S16VXYntvIQ4y+k/
         ThRqw4P9wMsKzE+NQL6Eb4eZI0nPQ6/8M9Zsxcmu2WxnIxeNhiqlXk6gCVFDSsvW5HM3
         LlehwIxGVfzWEEzaBoJbotleZdAVaK7g7eXYjXSN42K67eieBPmM5vIfodlUWd/wfF+2
         p1Ww==
X-Gm-Message-State: AOAM531yNhGdvDkMO64zclw3lW6IN3r7WXoQj6Wdqk/AndrrNqTl2lXE
        iFfpOot7ek4TK/qUnK9+tCMTWQ==
X-Google-Smtp-Source: ABdhPJwifeShuy9aax97sR/LrIOKU8AKLyOW/DZJQT86QH8j0OfGEcNJxiqcAH9HAEPFwoFMNFLi9A==
X-Received: by 2002:a17:902:547:: with SMTP id 65mr20764059plf.256.1595299055940;
        Mon, 20 Jul 2020 19:37:35 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com ([2401:fa00:1:b:7220:84ff:fe09:41dc])
        by smtp.gmail.com with ESMTPSA id z6sm17888266pfn.173.2020.07.20.19.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 19:37:35 -0700 (PDT)
From:   Nicolas Boichat <drinkcat@chromium.org>
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Nicolas Boichat <drinkcat@chromium.org>,
        Ian Molton <ian@mnementh.co.uk>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Bluetooth: hci_serdev: Only unregister device if it was registered
Date:   Tue, 21 Jul 2020 10:37:16 +0800
Message-Id: <20200721103652.2.I8a2fdad30d42399fa5afc15d66b460d1738c3946@changeid>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
In-Reply-To: <20200721103652.1.Idbc7eddf1f24f750a8bbcbc8e06743736ae3be31@changeid>
References: <20200721103652.1.Idbc7eddf1f24f750a8bbcbc8e06743736ae3be31@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

We should not call hci_unregister_dev if the device was not
successfully registered.

Fixes: c34dc3bfa7642fd ("Bluetooth: hci_serdev: Introduce hci_uart_unregister_device()")
Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

---

 drivers/bluetooth/hci_serdev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_serdev.c b/drivers/bluetooth/hci_serdev.c
index 599855e4c57c13d..7b233312e723fb2 100644
--- a/drivers/bluetooth/hci_serdev.c
+++ b/drivers/bluetooth/hci_serdev.c
@@ -355,7 +355,8 @@ void hci_uart_unregister_device(struct hci_uart *hu)
 	struct hci_dev *hdev = hu->hdev;
 
 	clear_bit(HCI_UART_PROTO_READY, &hu->flags);
-	hci_unregister_dev(hdev);
+	if (test_bit(HCI_UART_REGISTERED, &hu->flags))
+		hci_unregister_dev(hdev);
 	hci_free_dev(hdev);
 
 	cancel_work_sync(&hu->write_work);
-- 
2.28.0.rc0.105.gf9edc3c819-goog

