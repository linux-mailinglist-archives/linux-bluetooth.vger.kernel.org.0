Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 334B8534DF7
	for <lists+linux-bluetooth@lfdr.de>; Thu, 26 May 2022 13:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347199AbiEZLW0 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 26 May 2022 07:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347108AbiEZLWH (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 26 May 2022 07:22:07 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AD49FD4
        for <linux-bluetooth@vger.kernel.org>; Thu, 26 May 2022 04:21:58 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id b5so1173017plx.10
        for <linux-bluetooth@vger.kernel.org>; Thu, 26 May 2022 04:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mbhrm+CLA8t+9GLitrwDqbWvNobA6cA9mph1bfmQ5TM=;
        b=Eh5SZzypXw0UcbLVvJxJEddJVCDpq4fbOGvVw0aDcbOl/qnNh1h+ixeA/KTpGKUQcG
         dBPTc/oQJc1qiqr9zQP/p0Y332vrzl6B+m0mk1xNHMfsayDZhoHAmZazKHyf7zfNosii
         s/GQYvY47rMleGOVtq4VYaB/N+3qdzRLYu3Es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mbhrm+CLA8t+9GLitrwDqbWvNobA6cA9mph1bfmQ5TM=;
        b=KRzOaawQQsU9skl23bBmCO8ZFNWwomgF2RyzrwPUBiPTOdBswLqucMdm0GfRcdhM8y
         8pwQ9/ttM72dUtnAmL+uMsXOmbE0p53tIwarmbupedZvAMabGYrQitm/QIHiOrXTn2wI
         2xr93paxbhgrf1dvp1g1pa7cX+eqIwiNuMtk3nONbxctDMyQMMRhC0xaKdugUU9DqitK
         LfGpjV9ifqyRh1aq2JXFCvybnmF/0bunErX1zYC5aaPBFHxMYl6eBg+4rFunb4yugx3S
         rT/4QsKTN2RKkckRs8FX4sq4Rb7q6qLk8aiihuBQWGX4sdRfFR8+u0cIXJxESxGv0snl
         M1Lw==
X-Gm-Message-State: AOAM533Ffv3TbJN7VTj8HybBo2VgaU83pt1MFFIlWnKGS5kK4cg6rMsv
        Q/+kpipGzkxRPfXP2XiWXS4M5I6mzOd04A==
X-Google-Smtp-Source: ABdhPJwF4C0Ao0UWmUsX5P87Fr6Ks1ODu7AcLgsB9mdefwx5MTubXNDU0JkVJIylhfSzr17F29Q5lA==
X-Received: by 2002:a17:902:d547:b0:162:306f:ae15 with SMTP id z7-20020a170902d54700b00162306fae15mr16688944plf.154.1653564117245;
        Thu, 26 May 2022 04:21:57 -0700 (PDT)
Received: from localhost (174.71.80.34.bc.googleusercontent.com. [34.80.71.174])
        by smtp.gmail.com with UTF8SMTPSA id i4-20020a655b84000000b003faf4acac63sm1293909pgr.13.2022.05.26.04.21.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 May 2022 04:21:56 -0700 (PDT)
From:   Joseph Hwang <josephsih@chromium.org>
To:     linux-bluetooth@vger.kernel.org, marcel@holtmann.org,
        luiz.dentz@gmail.com, pali@kernel.org
Cc:     chromeos-bluetooth-upstreaming@chromium.org, josephsih@google.com,
        Joseph Hwang <josephsih@chromium.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/5] Bluetooth: btintel: setup vendor_get_prefix and vendor_evt
Date:   Thu, 26 May 2022 19:21:33 +0800
Message-Id: <20220526112135.2486883-2-josephsih@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220526112135.2486883-1-josephsih@chromium.org>
References: <20220526112135.2486883-1-josephsih@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch sets up vendor_get_prefix and vendor_evt in btintel
to surface Intel telemetry events.

Signed-off-by: Joseph Hwang <josephsih@chromium.org>
---

(no changes since v5)

Changes in v5:
- This is a new patch that holds the Intel specifics in the driver.
- This patch sets up vendor_get_ext_prefix and vendor_evt.
- INTEL_PREFIX is defined in little endian for convenience.
- Define intel_ext_prefix to contain Intel prefix and the telemetry
  subcode which will be returned by btintel_get_ext_prefix().
- Remove the unnecessary "void *data" portion and the double space
  from btintel_vendor_evt.
- Remove some unnecessary checking in btintel_vendor_evt.
- As to stripping off the prefix, that was what was done in
  "Series-version: 1". Previous comment about the AOSP function in
  pulling off the prefix header from the skb was "just do a basic
  length check and then move on. The kernel has no interest in this
  data." So that is why the whole skb->data is sent to the user space
  for further handling. This is to be consistent with what AOSP does
  there.

 drivers/bluetooth/btintel.c | 50 +++++++++++++++++++++++++++++++++++++
 drivers/bluetooth/btintel.h | 13 ++++++++++
 2 files changed, 63 insertions(+)

diff --git a/drivers/bluetooth/btintel.c b/drivers/bluetooth/btintel.c
index 818681c89db8..7c39cb7352fd 100644
--- a/drivers/bluetooth/btintel.c
+++ b/drivers/bluetooth/btintel.c
@@ -2404,6 +2404,10 @@ static int btintel_setup_combined(struct hci_dev *hdev)
 	/* Set up the quality report callback for Intel devices */
 	hdev->set_quality_report = btintel_set_quality_report;
 
+	/* Set up the vendor event callbacks for Intel devices */
+	hdev->vendor_get_ext_prefix = btintel_get_ext_prefix;
+	hdev->vendor_evt = btintel_vendor_evt;
+
 	/* For Legacy device, check the HW platform value and size */
 	if (skb->len == sizeof(ver) && skb->data[1] == 0x37) {
 		bt_dev_dbg(hdev, "Read the legacy Intel version information");
@@ -2650,6 +2654,52 @@ void btintel_secure_send_result(struct hci_dev *hdev,
 }
 EXPORT_SYMBOL_GPL(btintel_secure_send_result);
 
+/* INTEL_PREFIX below is defined in little endian. */
+static unsigned char INTEL_PREFIX[] = { 0x87, 0x80 };
+
+/* Define any Intel sub-opcodes here. */
+#define TELEMETRY_CODE		0x03
+static unsigned char INTEL_SUBCODES[] = { TELEMETRY_CODE };
+
+static struct ext_vendor_prefix intel_ext_prefix = {
+	.prefix         = INTEL_PREFIX,
+	.prefix_len     = sizeof(INTEL_PREFIX),
+	.subcodes       = INTEL_SUBCODES,
+	.subcodes_len   = sizeof(INTEL_SUBCODES),
+};
+
+struct ext_vendor_prefix *btintel_get_ext_prefix(struct hci_dev *hdev)
+{
+	return &intel_ext_prefix;
+}
+EXPORT_SYMBOL_GPL(btintel_get_ext_prefix);
+
+/* An Intel vendor event with prefix has the following structure. */
+struct intel_prefix_evt_data {
+	__le16 prefix; /* INTEL_PREFIX */
+	__u8 subcode;
+	__u8 data[];   /* a number of struct intel_tlv subevents */
+} __packed;
+
+void btintel_vendor_evt(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	struct intel_prefix_evt_data *ev;
+
+	if (skb->len < sizeof(struct intel_prefix_evt_data))
+		return;
+
+	if (memcmp(skb->data, INTEL_PREFIX, sizeof(INTEL_PREFIX)))
+		return;
+
+	/* Only interested in the telemetry event for now. */
+	ev = (struct intel_prefix_evt_data *)skb->data;
+	if (ev->subcode == TELEMETRY_CODE) {
+		hdev->hci_recv_quality_report(hdev, skb->data, skb->len,
+					      QUALITY_SPEC_INTEL_TELEMETRY);
+	}
+}
+EXPORT_SYMBOL_GPL(btintel_vendor_evt);
+
 MODULE_AUTHOR("Marcel Holtmann <marcel@holtmann.org>");
 MODULE_DESCRIPTION("Bluetooth support for Intel devices ver " VERSION);
 MODULE_VERSION(VERSION);
diff --git a/drivers/bluetooth/btintel.h b/drivers/bluetooth/btintel.h
index e0060e58573c..040c41f11e91 100644
--- a/drivers/bluetooth/btintel.h
+++ b/drivers/bluetooth/btintel.h
@@ -211,6 +211,8 @@ void btintel_bootup(struct hci_dev *hdev, const void *ptr, unsigned int len);
 void btintel_secure_send_result(struct hci_dev *hdev,
 				const void *ptr, unsigned int len);
 int btintel_set_quality_report(struct hci_dev *hdev, bool enable);
+struct ext_vendor_prefix *btintel_get_ext_prefix(struct hci_dev *hdev);
+void btintel_vendor_evt(struct hci_dev *hdev, struct sk_buff *skb);
 #else
 
 static inline int btintel_check_bdaddr(struct hci_dev *hdev)
@@ -306,4 +308,15 @@ static inline int btintel_set_quality_report(struct hci_dev *hdev, bool enable)
 {
 	return -ENODEV;
 }
+
+static inline struct ext_vendor_prefix *btintel_get_ext_prefix(
+							struct hci_dev *hdev)
+{
+	return NULL;
+}
+
+static inline void btintel_vendor_evt(struct hci_dev *hdev, struct sk_buff *skb)
+{
+}
+
 #endif
-- 
2.36.1.124.g0e6072fb45-goog

