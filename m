Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 775851F000C
	for <lists+linux-bluetooth@lfdr.de>; Fri,  5 Jun 2020 20:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728181AbgFESqc (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 5 Jun 2020 14:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728124AbgFESq0 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 5 Jun 2020 14:46:26 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67163C08C5C3
        for <linux-bluetooth@vger.kernel.org>; Fri,  5 Jun 2020 11:46:25 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id h185so5394209pfg.2
        for <linux-bluetooth@vger.kernel.org>; Fri, 05 Jun 2020 11:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JhzYHKvdQtmn/u3Ni8ya8R48LHH3rdnvSdBrewLu5k4=;
        b=i41lqYocUx3+ZNZY/212s2DaUIWl1vrB9Z7fj0qpcDJHUaBBHP2o+yVISBfn0Y4sEj
         nDzwq5keH/rr1fCEJvwXBjXi2Kd5/ZpAJbxkmlutS4lqhpRenwXmTphYNPY9D2MmISP5
         FUboCT6imy55vB3+dm6v9nobWuokqvNJ2Zr/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JhzYHKvdQtmn/u3Ni8ya8R48LHH3rdnvSdBrewLu5k4=;
        b=Y9LdRzjys4gSpJUzDfy01GOGhUkmj3T2NBeQX3KLOz512p6JsNRynK5MbGJ5Iho3/I
         aDGHOnPhLOb6GCK6dZxN8jCaFlUe/iv0Mlr3Xm3MoeNrauu6N9g1VK2bZ42wNyufAc4D
         mytQGYiN+oipvbEh13Frii2JNY2pXYxEE7PvFRD2bJ29myoTgepKol/58163EES2Envi
         EXLvTxPHgsNg2LJx60IZ9/JdVPEcjejTa8VMlH2RKgWxIUvtlKAB+ncxNs1NWAFPoplU
         BnC3yeYmt1QwX0jKN87MYP3xc3oVG0wYAfcJ7Z0S1bFNojxK95P3UGOeU2UG6nfL8UBC
         waUQ==
X-Gm-Message-State: AOAM530sEyM7dmWV3udntvV4p6fVjdH3C5HSlmHRVwuuLL63lwPC+IGx
        L3EEh5BSc46kxWHDGW1uuSuwKQ==
X-Google-Smtp-Source: ABdhPJwelWUinwmWNJnCRScNIf8pUY19AIVEka6dRO9dLs0VBOstGXsHxxpRO9qaapucx7H5cAxKng==
X-Received: by 2002:aa7:85da:: with SMTP id z26mr10736885pfn.13.1591382784923;
        Fri, 05 Jun 2020 11:46:24 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id n189sm282147pfn.108.2020.06.05.11.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2020 11:46:24 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org,
        Rocky Liao <rjliao@codeaurora.org>,
        Zijun Hu <zijuhu@codeaurora.org>, linux-kernel@vger.kernel.org,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        Claire Chang <tientzu@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH 3/3] Bluetooth: hci_qca: Refactor error handling in qca_suspend()
Date:   Fri,  5 Jun 2020 11:46:11 -0700
Message-Id: <20200605114552.3.Ib9b5e6e81ea31cdc964cd0562ef4985a6c6c5154@changeid>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
In-Reply-To: <20200605184611.252218-1-mka@chromium.org>
References: <20200605184611.252218-1-mka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

If waiting for IBS sleep times out jump to the error handler, this is
easier to read than multiple 'if' branches and a fall through to the
error handler.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 drivers/bluetooth/hci_qca.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 90ffd8ca1fb0d..cf76f128e9834 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2109,18 +2109,16 @@ static int __maybe_unused qca_suspend(struct device *dev)
 	/* Wait for HCI_IBS_SLEEP_IND sent by device to indicate its Tx is going
 	 * to sleep, so that the packet does not wake the system later.
 	 */
-
 	ret = wait_event_interruptible_timeout(qca->suspend_wait_q,
 			qca->rx_ibs_state == HCI_IBS_RX_ASLEEP,
 			msecs_to_jiffies(IBS_BTSOC_TX_IDLE_TIMEOUT_MS));
-
-	if (ret > 0) {
-		qca_wq_serial_tx_clock_vote_off(&qca->ws_tx_vote_off);
-		return 0;
+	if (ret == 0) {
+		ret = -ETIMEDOUT;
+		goto error;
 	}
 
-	if (ret == 0)
-		ret = -ETIMEDOUT;
+	qca_wq_serial_tx_clock_vote_off(&qca->ws_tx_vote_off);
+	return 0;
 
 error:
 	clear_bit(QCA_SUSPENDING, &qca->flags);
-- 
2.27.0.278.ge193c7cf3a9-goog

