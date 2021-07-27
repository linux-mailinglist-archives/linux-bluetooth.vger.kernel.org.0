Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2170D3D8073
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jul 2021 23:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232047AbhG0VEk (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 27 Jul 2021 17:04:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231368AbhG0VEk (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 27 Jul 2021 17:04:40 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBD8AC061760
        for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jul 2021 14:04:39 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id d69-20020a25e6480000b02904f4a117bd74so133738ybh.17
        for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jul 2021 14:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=383gaVpNqlLkwS7v7dVHihUUC0Gv0oWfLHlkAgvdKtc=;
        b=j1BwDdTCAHvo8p19/DxegI7QQhlKp/5CfyEqSk/JqE0Ah/yrEe9/ujq1YvA9uMUGtT
         s7ZvMK6JhxQABF6gLpPTBTK1Z727kuGPeInai4V0Nff8rznvB5h3jBis9++XNyk8c7Ni
         EJ56pAQ/GP2qf1h/aTtxmNNAvw+7bpHwwWGHFOyrQ7R+3cfKs085fFSTBRZqv8vi24KM
         ZB4LKJZ0K74pNcW3rMuLGf1n2xKa4W85Rxsepq9o411cgbPjiHFtpU6fp/nejCr0j/9q
         1HEE/d1bl77oPgczD5pt5bVTPgBg92XClcqtpWKI8wjPY5DCWhS8M9ARGdraOywJDo+L
         XSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=383gaVpNqlLkwS7v7dVHihUUC0Gv0oWfLHlkAgvdKtc=;
        b=A+wpYkNcN/NG9rmHu1O4TkWf3pSwqaaTFoBkztvoh3wS+9EkjG1MKVfd3GttIy34qE
         /2j37HGCZxPvheTdSWM9H/JxKrghd2BCcdOzbGRvnje7P37vT3PjcSmXfZnfAxWPUmUx
         a9yMoORtElBl86B1lo9aP/wlpCMVUEdNVw2EX6QvjBzozxo1d6f2kwb59yt/PYZXh89e
         c7qy5DVk7w9qWJd4O5xEB7vCdEQ4qysG8mBug03LInn95LS8Y0waxM7Ck8qq6iOlBaFs
         mOSOWAwmZSfEzb9MXIcxYT6c+bLrLZtsTWLEvBzzl0PFPiJOGhprWK1efAzK2eRbpHIf
         syEQ==
X-Gm-Message-State: AOAM530ZOfv38bdcoJolij44lLn1DfvzhQ0vO1E78GpDoT5DIGMe00Sm
        fNdp+pGQNR5FubyvEvz6w+h4S5rxXluobc0cTzHyJYjdLyc4TzPLOyQ41vsBcZQzW1AF7uWN0Hd
        zRfXN21svzDKiJMhcIV1Zj8QDFu8ZOqlLVUAV9rcM0Sj1ZJEJRuhDrwHOqTc1vC8tg4rowVLJ+d
        tXk8RaLsQQ+u8=
X-Google-Smtp-Source: ABdhPJxVdnGte2RRUJ4ePeRr9hD5UMVYaIPxTP1VdrcyDyum2tar+QObrWSDt2chazY4j1MINrjfyFMuPHDOq3op+g==
X-Received: from michaelfsun.mtv.corp.google.com ([2620:15c:202:201:4e82:4fa2:fd10:e771])
 (user=michaelfsun job=sendgmr) by 2002:a25:b993:: with SMTP id
 r19mr35118195ybg.445.1627419878924; Tue, 27 Jul 2021 14:04:38 -0700 (PDT)
Date:   Tue, 27 Jul 2021 14:04:35 -0700
Message-Id: <20210727140425.1.I1ac63dde4853d7b38a018b20b3d6d3d539378df3@changeid>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
Subject: [PATCH] Bluetooth: btusb: Enable MSFT extension for TyphoonPeak,
 GarfieldPeak, and WCN6855 controllers
From:   Michael Sun <michaelfsun@google.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Chethan T N <chethan.tumkur.narayan@intel.com>,
        Michael Sun <michaelfsun@google.com>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Chethan T N <chethan.tumkur.narayan@intel.com>

The Intel TyphoonPeak, GarfieldPeak and Qualcomm WCN6855 Bluetooth
controllers support the Microsoft vendor extension, enable them by
setting VsMsftOpCode accordingly.

Signed-off-by: Chethan T N <chethan.tumkur.narayan@intel.com>
Signed-off-by: Michael Sun <michaelfsun@google.com>
---

 drivers/bluetooth/btusb.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 5f8d9b1628af..b68511b7e07a 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3016,6 +3016,17 @@ static int btusb_setup_intel_newgen(struct hci_dev *hdev)
 	btintel_version_info_tlv(hdev, &version);
 
 finish:
+	/* All Intel new genration controllers support the Microsoft vendor
+	 * extension are using 0xFC1E for VsMsftOpCode.
+	 */
+	switch (INTEL_HW_VARIANT(version.cnvi_bt)) {
+	case 0x17:
+	case 0x18:
+	case 0x19:
+		hci_set_msft_opcode(hdev, 0xFC1E);
+		break;
+	}
+
 	/* Set the event mask for Intel specific vendor events. This enables
 	 * a few extra events that are useful during general operation. It
 	 * does not enable any debugging related events.
@@ -4710,6 +4721,7 @@ static int btusb_probe(struct usb_interface *intf,
 		hdev->set_bdaddr = btusb_set_bdaddr_wcn6855;
 		hdev->cmd_timeout = btusb_qca_cmd_timeout;
 		set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
+		hci_set_msft_opcode(hdev, 0xFD70);
 	}
 
 	if (id->driver_info & BTUSB_AMP) {
-- 
2.32.0.432.gabb21c7263-goog

