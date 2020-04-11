Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4B9A1A54D0
	for <lists+linux-bluetooth@lfdr.de>; Sun, 12 Apr 2020 01:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728748AbgDKXHt (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 11 Apr 2020 19:07:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:44072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728740AbgDKXHt (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 11 Apr 2020 19:07:49 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9DFC52173E;
        Sat, 11 Apr 2020 23:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586646469;
        bh=S6TKNCCtj26VouFt79OMxAj/QJCUGWiEe3uRGuZdZhk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TFtCaI+Y1MasLkRxaLAbhRzWfeZAxyYm4mvPOAPgCYnDZupxQLqsmyh/D8Kr3K/Pd
         +pjmkp7T7aaegKF8QYREAh+04KJHlBCCBH6TmeAnWSfmp5m3F4SlZAHJIeOjT1NDCk
         7Th3X1+wXP0SxnNFLp4rRacNMVzCxuA+G+NkbSi0=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Rocky Liao <rjliao@codeaurora.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Sasha Levin <sashal@kernel.org>,
        linux-bluetooth@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 036/121] Bluetooth: btqca: Fix the NVM baudrate tag offcet for wcn3991
Date:   Sat, 11 Apr 2020 19:05:41 -0400
Message-Id: <20200411230706.23855-36-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200411230706.23855-1-sashal@kernel.org>
References: <20200411230706.23855-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Rocky Liao <rjliao@codeaurora.org>

[ Upstream commit b63882549b2bf2979cb1506bdf783edf8b45c613 ]

The baudrate set byte of wcn3991 in the NVM tag is byte 1, not byte 2.
This patch will set correct byte for wcn3991.

Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/bluetooth/btqca.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index ec69e5dd7bd3e..a16845c0751d3 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -139,7 +139,7 @@ int qca_send_pre_shutdown_cmd(struct hci_dev *hdev)
 EXPORT_SYMBOL_GPL(qca_send_pre_shutdown_cmd);
 
 static void qca_tlv_check_data(struct qca_fw_config *config,
-				const struct firmware *fw)
+		const struct firmware *fw, enum qca_btsoc_type soc_type)
 {
 	const u8 *data;
 	u32 type_len;
@@ -148,6 +148,7 @@ static void qca_tlv_check_data(struct qca_fw_config *config,
 	struct tlv_type_hdr *tlv;
 	struct tlv_type_patch *tlv_patch;
 	struct tlv_type_nvm *tlv_nvm;
+	uint8_t nvm_baud_rate = config->user_baud_rate;
 
 	tlv = (struct tlv_type_hdr *)fw->data;
 
@@ -216,7 +217,10 @@ static void qca_tlv_check_data(struct qca_fw_config *config,
 				tlv_nvm->data[0] |= 0x80;
 
 				/* UART Baud Rate */
-				tlv_nvm->data[2] = config->user_baud_rate;
+				if (soc_type == QCA_WCN3991)
+					tlv_nvm->data[1] = nvm_baud_rate;
+				else
+					tlv_nvm->data[2] = nvm_baud_rate;
 
 				break;
 
@@ -354,7 +358,7 @@ static int qca_download_firmware(struct hci_dev *hdev,
 		return ret;
 	}
 
-	qca_tlv_check_data(config, fw);
+	qca_tlv_check_data(config, fw, soc_type);
 
 	segment = fw->data;
 	remain = fw->size;
-- 
2.20.1

