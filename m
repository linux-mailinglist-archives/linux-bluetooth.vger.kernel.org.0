Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48AC042B0F5
	for <lists+linux-bluetooth@lfdr.de>; Wed, 13 Oct 2021 02:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235064AbhJMA2f (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 12 Oct 2021 20:28:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235711AbhJMA2e (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 12 Oct 2021 20:28:34 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2C64C061570
        for <linux-bluetooth@vger.kernel.org>; Tue, 12 Oct 2021 17:26:31 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id c4so633609pls.6
        for <linux-bluetooth@vger.kernel.org>; Tue, 12 Oct 2021 17:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UGhmKmYEG7dNxuDS9gE9w1PekTf42y/sgJzG1UlihKc=;
        b=I7vmLRl27ahOBwq/me65wGVGCSMiAiNjIDefZjCmRLwD++Cbu9dAHkMl1XaT+XNnqg
         lT5fp0zjH3IfzZew8u3QjpBvCMoXmuN7H6v2PY8pyCzji9EGRh8YUN9ZkR6KUKTU2s4H
         tEluQknAGuDGMUWUHEgdLAhUnO+lO3/48NQhX5EQo4ESZ/+sAywQGwtykswf7gmiPCc3
         xaWO3jhpH6/ajtYvORAulksuDuLdL/MbPGOJ+3guF486ir6lCwLqgkb8JMGvtWjtN0GT
         fUa3rftfeeQoTF4P9S0GQoKtzLxfSHDLUnMYSPhxvmbDtrrpmddDHoe37BjV3TbQ+zWK
         eyqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UGhmKmYEG7dNxuDS9gE9w1PekTf42y/sgJzG1UlihKc=;
        b=SRloKCpzxveTYeZ+HuSiiMVQL7Qg7XOnXT8Oo2yUYEepNOkCEFqvD6l8mBsLbBmNER
         LzKChYiUeh1X7xKtetO5yOWvSohflyMMkYK+q9z6dRhhR4stXk6UmLSX/CDZk2bOKcpT
         m1HbU1OINnBa7ASVQxRbvHosufI8ppMPDuG30rheqXvmWgief/ghUsSvEHfcwye35u2h
         814p/9rbbECTM+J/Fa/0hrB0qYvH4ACEjdpw5fAG27vP8rVfaCILwSuYXr/8ORrrvhfD
         elaWZaXkwoLkYYYUMxdy2RiRU6zGivyho9KiCDvNV0LtQz5vcPaiUHiEmmxCliNDJ0wa
         Jffg==
X-Gm-Message-State: AOAM533RExL8UyOvlv2rrrXRugYsj1wmhOwNre0L4/FPhCO6JnhShinH
        ugR1Dui1lRXoRvnZEUbmQnY5cfiUpv8=
X-Google-Smtp-Source: ABdhPJyKO3ExtHxnaq9ZZ9T5YfD89C+QMpULUHcvOQx8fT8X3hHia5iARZVyMlY+9jFbcuhclRuerg==
X-Received: by 2002:a17:90a:16:: with SMTP id 22mr9923050pja.25.1634084791108;
        Tue, 12 Oct 2021 17:26:31 -0700 (PDT)
Received: from localhost.localdomain (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id gf23sm4147419pjb.26.2021.10.12.17.26.30
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 17:26:30 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [RFC BlueZ] monitor: Add packet definitions for MSFT extension
Date:   Tue, 12 Oct 2021 17:26:27 -0700
Message-Id: <20211013002627.2661081-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This adds proper packet definitions for command and response of MSFT
extension.
---
 monitor/msft.h | 125 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/monitor/msft.h b/monitor/msft.h
index a268f4bc7..e0e48c3de 100644
--- a/monitor/msft.h
+++ b/monitor/msft.h
@@ -24,6 +24,131 @@
 
 #include <stdint.h>
 
+#define MSFT_SUBCMD_READ_SUPPORTED_FEATURES	0x00
+
+struct msft_cmd_read_supported_features {
+	uint8_t subcmd;
+};
+
+struct msft_rsp_read_supported_features {
+	uint8_t  status;
+	uint8_t  subcmd;
+	uint8_t  features[8];
+	uint8_t  evt_prefix_len;
+	uint8_t  evt_prefix[];
+};
+
+#define MSFT_SUBCMD_MONITOR_RSSI		0x01
+
+struct msft_cmd_monitor_rssi {
+	uint8_t  subcmd;
+	uint16_t handle;
+	int8_t   rssi_high;
+	int8_t   rssi_low;
+	uint8_t  rssi_low_interval;
+	uint8_t  rssi_period;
+};
+
+struct msft_rsp_monitor_rssi {
+	uint8_t  status;
+	uint8_t  subcmd;
+};
+
+#define MSFT_SUBCMD_CANCEL_MONITOR_RSSI		0x02
+
+struct msft_cmd_cancel_monitor_rssi {
+	uint8_t  subcmd;
+	uint16_t handle;
+};
+
+struct msft_rsp_cancel_monitor_rssi {
+	uint8_t  status;
+	uint8_t  subcmd;
+};
+
+#define MSFT_SUBCMD_LE_MONITOR_ADV		0x03
+
+struct msft_le_monitor_pattern {
+	uint8_t  len;
+	uint8_t  type;
+	uint8_t  start;
+	uint8_t  data[];
+};
+
+struct msft_le_monitor_adv_pattern_type {
+	uint8_t num_patterns;
+	struct msft_le_monitor_pattern data[];
+};
+
+struct msft_le_monitor_adv_uuid_type {
+	uint8_t  type;
+	union {
+		uint16_t u16;
+		uint32_t u32;
+		uint8_t  u128[8];
+	} value;
+};
+
+struct msft_le_monitor_adv_irk_type {
+	uint8_t  irk[8];
+	uint8_t  addr_type;
+	uint8_t  addr[6];
+};
+
+struct msft_cmd_le_monitor_adv {
+	uint8_t  subcmd;
+	int8_t   rssi_low;
+	int8_t   rssi_high;
+	uint8_t  rssi_low_interval;
+	uint8_t  rssi_period;
+	uint8_t  type;
+	uint8_t  data[];
+};
+
+struct msft_rsp_le_monitor_adv {
+	uint8_t  status;
+	uint8_t  subcmd;
+	uint8_t  handle;
+};
+
+#define MSFT_SUBCMD_LE_CANCEL_MONITOR_ADV	0x04
+
+struct msft_cmd_le_cancel_monitor_adv {
+	uint8_t  subcmd;
+	uint8_t  handle;
+};
+
+struct msft_rsp_le_cancel_monitor_adv {
+	uint8_t  status;
+	uint8_t  subcmd;
+};
+
+#define MSFT_SUBCMD_LE_MONITOR_ADV_ENABLE	0x05
+
+struct msft_cmd_le_monitor_adv_enable {
+	uint8_t  subcmd;
+	uint8_t  enable;
+};
+
+struct msft_rsp_le_monitor_adv_enable {
+	uint8_t  status;
+	uint8_t  subcmd;
+};
+
+#define MSFT_SUBCMD_READ_ABS_RSSI		0x06
+
+struct msft_cmd_read_abs_rssi {
+	uint8_t  subcmd;
+	uint16_t handle;
+};
+
+struct msft_rsp_read_abs_rssi {
+	uint8_t  status;
+	uint8_t  subcmd;
+	uint16_t handle;
+	uint8_t  rssi;
+};
+
 struct vendor_ocf;
 struct vendor_evt;
 
-- 
2.31.1

