Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6EAF850F
	for <lists+linux-bluetooth@lfdr.de>; Tue, 12 Nov 2019 01:20:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727239AbfKLAUE (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 11 Nov 2019 19:20:04 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38265 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727222AbfKLAUD (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 11 Nov 2019 19:20:03 -0500
Received: by mail-pg1-f196.google.com with SMTP id 15so10587737pgh.5
        for <linux-bluetooth@vger.kernel.org>; Mon, 11 Nov 2019 16:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JHJkzninaEtOyameVUdA9keEfY/C9TTgTXRicsa2Xt0=;
        b=k26X6ZXw6ris/hiRTOFqgwaSgTym9xQB0dF4oe0NtiSe78Zqp48G6D88LwbqFgKbD3
         2LMDIiU2fTcYQL35L/CmkEUV20ll7RC2uc2TyGrnRcbNtzcLrrzk+XAa4fJaxrl5uUtN
         UJkJVkQj8WLUk1YyGyELo9c5neu1on72Ul01k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JHJkzninaEtOyameVUdA9keEfY/C9TTgTXRicsa2Xt0=;
        b=Bfbqo1xOZLCnl0R/+WKj/wU16wCwSw4jBnTaXAXpMkJCHC7ElyjcAEuF1yh5CWFTEh
         imkiuEa++IcRSC8FwJejrOkrxuw6sSbDmEMmwam723QC74ek5XQOY/MLxp6t6NBeOyi9
         VwZF21/Db7jZaJYu+LZTDZLBo3cuJpucDOkL9xxRgjY4chR+aDQxldeQ8qmSHN6C7nGZ
         NMQ/PJaUrVvhdNyCODEVyF999yzZzv2nOi/WOvYIUVLFUIbsPd8QJQVk4Q00od5OhD/R
         iE/HwVPQCpi8aUG+ubt3fGxYTtIJ81E/pNxWD8ar/wECNmjx7MAb+d43+rGe0j8dg8+2
         BJ+Q==
X-Gm-Message-State: APjAAAXbkl2+cb0A+ozfS2In3kreVdjl7izNnUTSJTT/mZPU25Tfi7XD
        7+VcZsElLWsF0P0nX3bwKsw4jQ==
X-Google-Smtp-Source: APXvYqzXgt1Ptv1DckYEmfEaQGAyyTuY7FSY3az/0jmgctYbwAsbktOUIUfSCQ+s2Gfd2tfJOnp+9w==
X-Received: by 2002:a65:6145:: with SMTP id o5mr30910464pgv.38.1573518002861;
        Mon, 11 Nov 2019 16:20:02 -0800 (PST)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id h23sm8430898pgg.58.2019.11.11.16.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 16:20:02 -0800 (PST)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-bluetooth@vger.kernel.org, dianders@chromium.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] Bluetooth: btbcm: Support pcm configuration
Date:   Mon, 11 Nov 2019 16:19:47 -0800
Message-Id: <20191112001949.136377-3-abhishekpandit@chromium.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191112001949.136377-1-abhishekpandit@chromium.org>
References: <20191112001949.136377-1-abhishekpandit@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Add BCM vendor specific command to configure PCM parameters. The new
vendor opcode allows us to set the sco routing, the pcm interface rate,
and a few other pcm specific options (frame sync, sync mode, and clock
mode). See broadcom-bluetooth.txt in Documentation for more information
about valid values for those settings.

Here is an example trace where this opcode was used to configure
a BCM4354:

        < HCI Command: Vendor (0x3f|0x001c) plen 5
                01 02 00 01 01
        > HCI Event: Command Complete (0x0e) plen 4
        Vendor (0x3f|0x001c) ncmd 1
                Status: Success (0x00)

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

Changes in v3: None
Changes in v2: None

 drivers/bluetooth/btbcm.c | 18 ++++++++++++++++++
 drivers/bluetooth/btbcm.h |  8 ++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
index 2d2e6d862068..d22a2025f7e1 100644
--- a/drivers/bluetooth/btbcm.c
+++ b/drivers/bluetooth/btbcm.c
@@ -105,6 +105,24 @@ int btbcm_set_bdaddr(struct hci_dev *hdev, const bdaddr_t *bdaddr)
 }
 EXPORT_SYMBOL_GPL(btbcm_set_bdaddr);
 
+int btbcm_set_pcm_int_params(struct hci_dev *hdev,
+			     const struct bcm_set_pcm_int_params *int_params)
+{
+	struct sk_buff *skb;
+	int err;
+
+	skb = __hci_cmd_sync(hdev, 0xfc1c, 5, int_params, HCI_INIT_TIMEOUT);
+	if (IS_ERR(skb)) {
+		err = PTR_ERR(skb);
+		bt_dev_err(hdev, "BCM: Set PCM int params failed (%d)", err);
+		return err;
+	}
+	kfree_skb(skb);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(btbcm_set_pcm_int_params);
+
 int btbcm_patchram(struct hci_dev *hdev, const struct firmware *fw)
 {
 	const struct hci_command_hdr *cmd;
diff --git a/drivers/bluetooth/btbcm.h b/drivers/bluetooth/btbcm.h
index d204be8a84bf..bf9d86924787 100644
--- a/drivers/bluetooth/btbcm.h
+++ b/drivers/bluetooth/btbcm.h
@@ -54,6 +54,8 @@ struct bcm_set_pcm_format_params {
 int btbcm_check_bdaddr(struct hci_dev *hdev);
 int btbcm_set_bdaddr(struct hci_dev *hdev, const bdaddr_t *bdaddr);
 int btbcm_patchram(struct hci_dev *hdev, const struct firmware *fw);
+int btbcm_set_pcm_int_params(struct hci_dev *hdev,
+			     const struct bcm_set_pcm_int_params *int_params);
 
 int btbcm_setup_patchram(struct hci_dev *hdev);
 int btbcm_setup_apple(struct hci_dev *hdev);
@@ -74,6 +76,12 @@ static inline int btbcm_set_bdaddr(struct hci_dev *hdev, const bdaddr_t *bdaddr)
 	return -EOPNOTSUPP;
 }
 
+int btbcm_set_pcm_int_params(struct hci_dev *hdev,
+			     const struct bcm_set_pcm_int_params *int_params)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline int btbcm_patchram(struct hci_dev *hdev, const struct firmware *fw)
 {
 	return -EOPNOTSUPP;
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

