Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A09561F0008
	for <lists+linux-bluetooth@lfdr.de>; Fri,  5 Jun 2020 20:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728069AbgFESqX (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 5 Jun 2020 14:46:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726797AbgFESqW (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 5 Jun 2020 14:46:22 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E405DC08C5C3
        for <linux-bluetooth@vger.kernel.org>; Fri,  5 Jun 2020 11:46:20 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id 5so3219920pjd.0
        for <linux-bluetooth@vger.kernel.org>; Fri, 05 Jun 2020 11:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xzOVbo4Aco71PU/Ukq1udSJ0FEHpdtBqqLzyI3E7G9A=;
        b=MvL7qZb6fs7rsR1ij7k/V5w4p5FOsCHmCEo7XjTnxBEk1eyod6+tSyL8cZSpVYR37f
         FtuSU6PaDyo3FnTgOP3+VfCmT6biByw4bsJzZbWkJQAb7v2DII/7TNscgRNvZ/2nr5b9
         ssGhV3xeKxu2q5Ax5PJ5vyE8mDVdMxUUrn7T4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xzOVbo4Aco71PU/Ukq1udSJ0FEHpdtBqqLzyI3E7G9A=;
        b=n8Wt2WfLchFDTuJ6pb7mZoMqv7H24CLTCk6Mqz5jTiNz9YTVE2oqecAK+h5jEPpMR6
         gngacB29Z8pm+fvGMG5nwKZjnFWO0LUsjEESRTwSlX69mir8G3hBn8wg7bnvR913Mpwo
         bwQLJuhBU87/blgLTz15z2RkagyRb2lnZzmTryPsVtX/yKyd+y7UNsLN2y650SRnIP1p
         pq0t43fzLNFov5aG4clRhqYPVbd02L73bWjmXdBjRdfNkqxOj+MiRMKHLGBAtYMI6wf5
         XSf419O+HMShGyGCunRYB+PEugcvJQs55chNm5iqSzGVq9jv/bKG6rHLXd72+6KClQbI
         Ws+Q==
X-Gm-Message-State: AOAM5313FvP0jCQA9QAu/FoK2mBqgCjuBARNeJ8JP1hjDQdEQu0hAB3g
        fr7q4/pea2wdZfJ0ExANcFZ9Kg==
X-Google-Smtp-Source: ABdhPJzqvqsYz+fegJCNiO9PgCOmeeMnoemTQEODcg9N+UqounUz0WT68uaoWaKNXVzwFUki0C9w+w==
X-Received: by 2002:a17:90a:634a:: with SMTP id v10mr4861258pjs.50.1591382780504;
        Fri, 05 Jun 2020 11:46:20 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id n19sm270282pfu.194.2020.06.05.11.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2020 11:46:19 -0700 (PDT)
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
Subject: [PATCH 1/3] Bluetooth: hci_qca: Only remove TX clock vote after TX is completed
Date:   Fri,  5 Jun 2020 11:46:09 -0700
Message-Id: <20200605114552.1.I7bcad9d672455473177ddbc7db08cc1adcdee1dc@changeid>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
In-Reply-To: <20200605184611.252218-1-mka@chromium.org>
References: <20200605184611.252218-1-mka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

qca_suspend() removes the vote for the UART TX clock after
writing an IBS sleep request to the serial buffer. This is
not a good idea since there is no guarantee that the request
has been sent at this point. Instead remove the vote after
successfully entering IBS sleep. This also fixes the issue
of the vote being removed in case of an aborted suspend due
to a failure of entering IBS sleep.

Fixes: 41d5b25fed0a0 ("Bluetooth: hci_qca: add PM support")
Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 drivers/bluetooth/hci_qca.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index ece9f91cc3deb..b1d82d32892e9 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2083,8 +2083,6 @@ static int __maybe_unused qca_suspend(struct device *dev)
 
 		qca->tx_ibs_state = HCI_IBS_TX_ASLEEP;
 		qca->ibs_sent_slps++;
-
-		qca_wq_serial_tx_clock_vote_off(&qca->ws_tx_vote_off);
 		break;
 
 	case HCI_IBS_TX_ASLEEP:
@@ -2112,8 +2110,10 @@ static int __maybe_unused qca_suspend(struct device *dev)
 			qca->rx_ibs_state == HCI_IBS_RX_ASLEEP,
 			msecs_to_jiffies(IBS_BTSOC_TX_IDLE_TIMEOUT_MS));
 
-	if (ret > 0)
+	if (ret > 0) {
+		qca_wq_serial_tx_clock_vote_off(&qca->ws_tx_vote_off);
 		return 0;
+	}
 
 	if (ret == 0)
 		ret = -ETIMEDOUT;
-- 
2.27.0.278.ge193c7cf3a9-goog

