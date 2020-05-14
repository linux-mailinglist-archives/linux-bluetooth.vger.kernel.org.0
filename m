Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 572CA1D3EC7
	for <lists+linux-bluetooth@lfdr.de>; Thu, 14 May 2020 22:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727938AbgENUON (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 14 May 2020 16:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726035AbgENUOM (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 14 May 2020 16:14:12 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB120C061A0E
        for <linux-bluetooth@vger.kernel.org>; Thu, 14 May 2020 13:14:11 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id w65so1839920pfc.12
        for <linux-bluetooth@vger.kernel.org>; Thu, 14 May 2020 13:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EJ2/s9c4x/GRQ86qgnYEX7vyrjQPUH1/Y15C1WKzHao=;
        b=kMwWd2NostkcBQxxD2U1/OTKQgmVqcW4Xy3QDrqqUrjfnNW+bzK2kNLTAzDZKICpL0
         uPtTD0Ecm07LUzRt2kHXnGDt06sdSYHkOVOjn7lgtW2iuYxRr7ZrlGcWtip9LUz7HkLo
         Cip0q6hUfXhLmYD46xfj/SzniXQe9UjMYqFVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EJ2/s9c4x/GRQ86qgnYEX7vyrjQPUH1/Y15C1WKzHao=;
        b=NBVPNrR6OboMNvtygrbexBWQbl18AZBe5szsxUW4xe+EyGHnITKzifswmmS9fYppDq
         f8xM4Q2GPGMqu5LBjtztK3grnduxEqQQkIcV0GXBajn5CjuQWB4YEaZBBLwVZ5zXv20s
         Wrk/LBOTTnQhDaYt6ccwxrjT4DMx7lVl5n0sQ5i5s++E3nALOIGg96CmhZ3KlkTeWmXu
         hJ/r4acshMg0NNEb337zXMLXQgUxeqSh0KUgAQdAZL0rmjtuQq8qpHzW6xXgODEBr00V
         uCTi2aoVC/KNFGP/XAjJQTnzvVXk/DKGlPxGcqHhOdan6+NYFyyU6Q0kFRkiwRZL+8fJ
         3hiA==
X-Gm-Message-State: AOAM5325UwHdR/hYFZIDWfT7YkkeFIWM80a3zsV+XfD0Xt+wmRVnbx1v
        HyKgh1uzcPiDIk/eWd98MOMjGLE/MG8=
X-Google-Smtp-Source: ABdhPJyPB7gYBmXgUcIuK1YP0CJLnYLlD09/RV0gTyEYarKT7RL1tBbHatRlmAwznWOixjiH6xH/CA==
X-Received: by 2002:a63:ad0b:: with SMTP id g11mr5570990pgf.275.1589487251084;
        Thu, 14 May 2020 13:14:11 -0700 (PDT)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id b8sm18482276pjz.51.2020.05.14.13.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 13:14:10 -0700 (PDT)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     linux-bluetooth@vger.kernel.org, bgodavar@codeaurora.org
Cc:     alainm@chromium.org, marcel@holtmann.org, mka@chromium.org,
        chromeos-bluetooth-upstreaming@chromium.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] Bluetooth: hci_qca: Enable WBS support for wcn3991
Date:   Thu, 14 May 2020 13:14:04 -0700
Message-Id: <20200514131338.v2.1.I68404fc395a3dbc57c8a89ca02490013e8003a87@changeid>
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

Changes in v2:
- Rename struct to qca_capabilities and fix enum naming

 drivers/bluetooth/hci_qca.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index b3fd07a6f8127..96799644f0933 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -75,6 +75,9 @@ enum qca_flags {
 	QCA_HW_ERROR_EVENT
 };
 
+enum qca_capabilities {
+	QCA_CAP_WIDEBAND_SPEECH_SUPPORTED = BIT(0),
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
+	uint32_t capabilities;
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
+	.capabilities = QCA_CAP_WIDEBAND_SPEECH_SUPPORTED,
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
+	if (data && (data->capabilities & QCA_CAP_WIDEBAND_SPEECH_SUPPORTED))
+		set_bit(HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED, &hdev->quirks);
+
 	return 0;
 }
 
-- 
2.26.2.761.g0e0b3e54be-goog

