Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E72CA1D2582
	for <lists+linux-bluetooth@lfdr.de>; Thu, 14 May 2020 05:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbgENDle (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 13 May 2020 23:41:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725925AbgENDld (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 13 May 2020 23:41:33 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6C16C061A0E
        for <linux-bluetooth@vger.kernel.org>; Wed, 13 May 2020 20:41:33 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id m7so649910plt.5
        for <linux-bluetooth@vger.kernel.org>; Wed, 13 May 2020 20:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dunRtUQhOkfeiGPojwr9OF99juYtTW3dfAP6ok0JFkM=;
        b=f+WFiG8rijupjiQFMwhSaALkaN2XBQzaRS58Js+gmBsAvbBev7My9F8koNJLaMeSeA
         scuLxg0+74K0lVUKWzxdmp4JPv7xE4iwR8fJWWCALpJ17C641wIiy8wNRFYzEcHJWiEb
         Ebr9/0dQ/wVfL5/zVARl943yJOBHrlmqSQ5Is=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dunRtUQhOkfeiGPojwr9OF99juYtTW3dfAP6ok0JFkM=;
        b=tpj+QHZTmeaJNU8vp1hAVS+Oj3a5JIF17x3g0M4BeovZtlr/uJbvN+4gfrrtJnMnej
         lkY4ajlq0dG7MH0MlA8QSQ1tabuH9etH4DEjAuqG1XQTci7wA6LTHzfdx/UJloVEjjRh
         +zxIoqhzpyHV2WlZhgNBa9BWgh1mRJrzCMFeKIAcsrGHd+JN151TxcvoaMnYF7CJO7zq
         8vVFNNxRVvFIxmv/97pP4dwwtDxp3EzJ64PRpJ9ExBmNVn+n0ox++jHyZPGwnPIxnVPh
         oMK65jXMrp/q9rftcHXJCqHOwjBY9I5KruEVAW9knvv1tdvWv7T+A7V5BC4kPaG1G0sW
         Bt7g==
X-Gm-Message-State: AOAM530lYxxnGyMaVgGXg/le1wWwbe8VB8Ozg9y+WwgB0guLhLL1VgWy
        xj0KRARqvIhqL1BvST/MGw/rpZ6FAi4=
X-Google-Smtp-Source: ABdhPJztj5H+NsK5BIiz5Zhcqa3dJ1wM1m5RMU1zf87Ktm0os0rYu3iHqNJCFuy0OUOZtLNEgQes+w==
X-Received: by 2002:a17:902:7584:: with SMTP id j4mr2339985pll.25.1589427693048;
        Wed, 13 May 2020 20:41:33 -0700 (PDT)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id j23sm16496025pjz.13.2020.05.13.20.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 20:41:32 -0700 (PDT)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     linux-bluetooth@vger.kernel.org, bgodavar@codeaurora.org
Cc:     alainm@chromium.org, marcel@holtmann.org, mka@chromium.org,
        chromeos-bluetooth-upstreaming@chromium.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Bluetooth: hci_qca: Enable WBS support for wcn3991
Date:   Wed, 13 May 2020 20:41:25 -0700
Message-Id: <20200513204111.1.I68404fc395a3dbc57c8a89ca02490013e8003a87@changeid>
X-Mailer: git-send-email 2.26.2.761.g0e0b3e54be-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

WCN3991 supports transparent WBS (host encoded mSBC). Add a flag to the
device match data to show WBS is supported.

This requires the matching firmware for WCN3991 in linux-firmware:
        1a8b0dc00f77 (qca: Enable transparent WBS for WCN3991)

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

 drivers/bluetooth/hci_qca.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index b3fd07a6f8127..305976c4dcf42 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -75,6 +75,9 @@ enum qca_flags {
 	QCA_HW_ERROR_EVENT
 };
 
+enum qca_driver_flags {
+	QCA_DRV_WIDEBAND_SPEECH_SUPPORTED = 0x1,
+};
 
 /* HCI_IBS transmit side sleep protocol states */
 enum tx_ibs_states {
@@ -187,10 +190,11 @@ struct qca_vreg {
 	unsigned int load_uA;
 };
 
-struct qca_vreg_data {
+struct qca_device_data {
 	enum qca_btsoc_type soc_type;
 	struct qca_vreg *vregs;
 	size_t num_vregs;
+	uint32_t flags;
 };
 
 /*
@@ -1691,7 +1695,7 @@ static const struct hci_uart_proto qca_proto = {
 	.dequeue	= qca_dequeue,
 };
 
-static const struct qca_vreg_data qca_soc_data_wcn3990 = {
+static const struct qca_device_data qca_soc_data_wcn3990 = {
 	.soc_type = QCA_WCN3990,
 	.vregs = (struct qca_vreg []) {
 		{ "vddio", 15000  },
@@ -1702,7 +1706,7 @@ static const struct qca_vreg_data qca_soc_data_wcn3990 = {
 	.num_vregs = 4,
 };
 
-static const struct qca_vreg_data qca_soc_data_wcn3991 = {
+static const struct qca_device_data qca_soc_data_wcn3991 = {
 	.soc_type = QCA_WCN3991,
 	.vregs = (struct qca_vreg []) {
 		{ "vddio", 15000  },
@@ -1711,9 +1715,10 @@ static const struct qca_vreg_data qca_soc_data_wcn3991 = {
 		{ "vddch0", 450000 },
 	},
 	.num_vregs = 4,
+	.flags = QCA_DRV_WIDEBAND_SPEECH_SUPPORTED,
 };
 
-static const struct qca_vreg_data qca_soc_data_wcn3998 = {
+static const struct qca_device_data qca_soc_data_wcn3998 = {
 	.soc_type = QCA_WCN3998,
 	.vregs = (struct qca_vreg []) {
 		{ "vddio", 10000  },
@@ -1724,7 +1729,7 @@ static const struct qca_vreg_data qca_soc_data_wcn3998 = {
 	.num_vregs = 4,
 };
 
-static const struct qca_vreg_data qca_soc_data_qca6390 = {
+static const struct qca_device_data qca_soc_data_qca6390 = {
 	.soc_type = QCA_QCA6390,
 	.num_vregs = 0,
 };
@@ -1860,7 +1865,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 {
 	struct qca_serdev *qcadev;
 	struct hci_dev *hdev;
-	const struct qca_vreg_data *data;
+	const struct qca_device_data *data;
 	int err;
 	bool power_ctrl_enabled = true;
 
@@ -1948,6 +1953,12 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		hdev->shutdown = qca_power_off;
 	}
 
+	/* Wideband speech support must be set per driver since it can't be
+	 * queried via hci.
+	 */
+	if (data && (data->flags & QCA_DRV_WIDEBAND_SPEECH_SUPPORTED))
+		set_bit(HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED, &hdev->quirks);
+
 	return 0;
 }
 
-- 
2.26.2.761.g0e0b3e54be-goog

