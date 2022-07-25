Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F03458076D
	for <lists+linux-bluetooth@lfdr.de>; Tue, 26 Jul 2022 00:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237230AbiGYWe1 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 25 Jul 2022 18:34:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237198AbiGYWeZ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 25 Jul 2022 18:34:25 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 832D825C6D
        for <linux-bluetooth@vger.kernel.org>; Mon, 25 Jul 2022 15:34:24 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id q5-20020a17090a7a8500b001f0253f5aa3so6402365pjf.4
        for <linux-bluetooth@vger.kernel.org>; Mon, 25 Jul 2022 15:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=oSpcjGYkcXcod89ksW5flXGeS3wxnAvOkS8CIPgpDQU=;
        b=Gis5dLtYV581itcud3CuHdoEL5SoJJAr2ZN+c7OaJkHgxIY1MxuyCp/WcQlDJPKeX4
         RTj26kDWYUT3UDbFlBJJjcSesg7V6cE2gKtifdaQs5yb1Eslcj7+ulsmpLnluT1rm+Vd
         7F7FS71MQUWsgrMHXLX4tnBsDuCB+EocRFDFBzXUSIFGwv5OSuqYtyjNPSbkEUmkgmka
         ut2jrk2qf32nT+Ink98zM5sHTYt0VvJgWm11f5Qv18c9RRgXnDNfXyCF1yF0SlFAlGix
         AlsAMI2zaasnBFJS5XIzC0n+VebT3KGUKkNgImCdPnrTVwYmYOe67RVREbXrZn4FVzJ5
         H91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=oSpcjGYkcXcod89ksW5flXGeS3wxnAvOkS8CIPgpDQU=;
        b=NxLjomUu921RAwNimcJ+htVwMwhfHKuROTC3Cj9izWgWJ201GrcWN+KQGQVnx2DSfR
         Wkl2dXiQjU/EREwzu2s35gBa+mymWuLvxVNFK/VPOlcdDvAQV3VY609loBTjAMkxYkmL
         SP4HtZjMIXmxoGREjhlMLYYXkxQcwykH0GoEnnL3Q3TFGGiz6j6Aa5j9A+UxRMrzjdI6
         RBCJEhsr9vmLgVwh3+hfjq27STKWo++wfcUJsQRpTvWH7+61fxuqByOUJuw0ahnRqmLM
         RLcskr2CWkXZlA1Vh8+M5a6UshdOm6XQN+ZBJRG7mIbVzgtrgF6dh23kusSvpLkzxSAm
         tkRQ==
X-Gm-Message-State: AJIora/Pns8Oggef2VcbhiAdo0DOf1O0DLrcg2xtgSdlX0c5BQLOjcrG
        Ek6Bk5HCBL9Y2zCoqNls3fWzSw3+WQv19KqpV9dMvA==
X-Google-Smtp-Source: AGRyM1vaCq/FkY5ExJrkEYFhAl6BGKDqJIZqy11HorsmSvgSz23CfntiiixB1F93QFwP5fvvzR6Q5ErIeQcrUVT2ObVbKw==
X-Received: from abps.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:9b4])
 (user=abhishekpandit job=sendgmr) by 2002:a17:902:ebcb:b0:168:e3ba:4b5a with
 SMTP id p11-20020a170902ebcb00b00168e3ba4b5amr13929563plg.11.1658788464025;
 Mon, 25 Jul 2022 15:34:24 -0700 (PDT)
Date:   Mon, 25 Jul 2022 15:34:21 -0700
Message-Id: <20220725153415.v2.1.Ia18502557c4ba9ba7cd2d1da2bae3aeb71b37e4e@changeid>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
Subject: [PATCH v2] Bluetooth: Always set event mask on suspend
From:   Abhishek Pandit-Subedi <abhishekpandit@google.com>
To:     luiz.dentz@gmail.com, linux-bluetooth@vger.kernel.org
Cc:     Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        stable@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

When suspending, always set the event mask once disconnects are
successful. Otherwise, if wakeup is disallowed, the event mask is not
set before suspend continues and can result in an early wakeup.

Fixes: 182ee45da083 ("Bluetooth: hci_sync: Rework hci_suspend_notifier")
Cc: stable@vger.kernel.org
Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---
Observed on ChromeOS as follows:

< HCI Command: Disconnect (0x01|0x0006) plen 3
        Handle: 256
        Reason: Remote Device Terminated due to Power Off (0x15)
> HCI Event: Command Status (0x0f) plen 4
      Disconnect (0x01|0x0006) ncmd 1
        Status: Success (0x00)
@ MGMT Event: Device Disconnected (0x000c) plen 8
        BR/EDR Address: 04:52:C7:C3:65:B5 (Bose Corporation)
        Reason: Connection terminated by local host for suspend (0x05)
@ MGMT Event: Controller Suspended (0x002d) plen 1
        Suspend state: Disconnected and not scanning (1)
> HCI Event: Disconnect Complete (0x05) plen 4
        Status: Success (0x00)
        Handle: 256
        Reason: Connection Terminated By Local Host (0x16)

The expectation is that we should see Set Event Mask before completing
the suspend so that the `Disconnect Complete` doesn't wake us up.


Changes in v2:
- Added fixes tag and cc stable

 net/bluetooth/hci_sync.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index 148ce629a59f..e6d804b82b67 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -5297,6 +5297,9 @@ int hci_suspend_sync(struct hci_dev *hdev)
 		return err;
 	}
 
+	/* Update event mask so only the allowed event can wakeup the host */
+	hci_set_event_mask_sync(hdev);
+
 	/* Only configure accept list if disconnect succeeded and wake
 	 * isn't being prevented.
 	 */
@@ -5308,9 +5311,6 @@ int hci_suspend_sync(struct hci_dev *hdev)
 	/* Unpause to take care of updating scanning params */
 	hdev->scanning_paused = false;
 
-	/* Update event mask so only the allowed event can wakeup the host */
-	hci_set_event_mask_sync(hdev);
-
 	/* Enable event filter for paired devices */
 	hci_update_event_filter_sync(hdev);
 
-- 
2.37.1.359.gd136c6c3e2-goog

