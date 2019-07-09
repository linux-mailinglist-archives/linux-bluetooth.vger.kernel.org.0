Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E09B63DF5
	for <lists+linux-bluetooth@lfdr.de>; Wed, 10 Jul 2019 00:45:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbfGIWo5 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 9 Jul 2019 18:44:57 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45012 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726444AbfGIWo5 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 9 Jul 2019 18:44:57 -0400
Received: by mail-pf1-f196.google.com with SMTP id t16so61809pfe.11
        for <linux-bluetooth@vger.kernel.org>; Tue, 09 Jul 2019 15:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2++8kmTPSBim/17wm8OKb43OQONku9XruGFez+yoMy8=;
        b=IGxDlhtA0rk17ny2oMehDYxSbbEUNvRjifMiyrQHGnm5Ft/uA8dsSXj0tfDQbJlK8K
         DMNcdybvnutiDfbBnNwziOIXYumgMDFamkEHkRH6TiycSM4LOpPp9rOSx351kNlqHJtl
         ev4QMeGzPrGskxZQt8AZZ1+UJ/fucMchslmwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2++8kmTPSBim/17wm8OKb43OQONku9XruGFez+yoMy8=;
        b=Gn68yYsN01iMCEWxAQxGRFcXRGPKKV65TbLMe9pjtahvlRD6M8XuuKmAjkK+b8vGoi
         89mlt9/EyTCnqNkHV2Z8m8Ag3MMwKX+fZPVEHzdl3ojThLaZVWRlick09uaTIr2eof6+
         AHIYV57MhFP1713/7izqVqioC1uE9gOfSb+nG5AeiWVXokGCNd6WT4HLlqVKWmfCi5Fy
         M545xdQryFzZACGsuzloPEBZet07FWPQutzYOWIiXAQxFijN8M0U8WGmgDDrEtapEhwn
         lRlD9JMIFe3Ox9cNIsIrFFvHmCNNHD7q5G1laAtFfk27xhloahDNX8GY6GwXBvx4fuUW
         Uujw==
X-Gm-Message-State: APjAAAXytcCgEi31OUEE9BPD5drl2MTXLH0lHncyg+tHzDvvs/jaVLEO
        q+mNDYOpwn1gFHBRHUHUz4CdcA==
X-Google-Smtp-Source: APXvYqweGIO+xwVwNtySVzz0Thmws8/bASkdoAmXF5RIUG9Xxp8Mr4SIuVxhowhl3Ya2+1wqJ7VzFg==
X-Received: by 2002:a63:69c1:: with SMTP id e184mr32133850pgc.198.1562712296336;
        Tue, 09 Jul 2019 15:44:56 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id j5sm130069pfi.104.2019.07.09.15.44.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 15:44:55 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        Harish Bandi <c-hbandi@codeaurora.org>,
        Rocky Liao <rjliao@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH] Bluetooth: btqca: Add a short delay before downloading the NVM
Date:   Tue,  9 Jul 2019 15:44:50 -0700
Message-Id: <20190709224450.187737-1-mka@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On WCN3990 downloading the NVM sometimes fails with a "TLV response
size mismatch" error:

[  174.949955] Bluetooth: btqca.c:qca_download_firmware() hci0: QCA Downloading qca/crnv21.bin
[  174.958718] Bluetooth: btqca.c:qca_tlv_send_segment() hci0: QCA TLV response size mismatch

It seems the controller needs a short time after downloading the
firmware before it is ready for the NVM. A delay as short as 1 ms
seems sufficient, make it 10 ms just in case. No event is received
during the delay, hence we don't just silently drop an extra event.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
I'm only guessing why the delay is needed, maybe QCA folks can shed
more light on this.

I didn't see this error when testing 2faa3f15fa2f ("Bluetooth: hci_qca:
wcn3990: Drop baudrate change vendor event") and 32646db8cc28
("Bluetooth: btqca: inject command complete event during fw download")
intensively a few months ago. My guess is that some changes in the kernel
(I test with a 4.19 kernel with regular -stable merges) altered the
timing, which made this issue visible.
---
 drivers/bluetooth/btqca.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 8b33128dccee..c59ca5782b63 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -388,6 +388,9 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		return err;
 	}
 
+	/* Give the controller some time to get ready to receive the NVM */
+	msleep(10);
+
 	/* Download NVM configuration */
 	config.type = TLV_TYPE_NVM;
 	if (firmware_name)
-- 
2.22.0.410.gd8fdbe21b5-goog

