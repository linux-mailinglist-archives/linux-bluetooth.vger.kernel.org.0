Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B2D768B592
	for <lists+linux-bluetooth@lfdr.de>; Mon,  6 Feb 2023 07:27:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjBFG1H (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 6 Feb 2023 01:27:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjBFG1G (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 6 Feb 2023 01:27:06 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09E81CDDC
        for <linux-bluetooth@vger.kernel.org>; Sun,  5 Feb 2023 22:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675664825; x=1707200825;
  h=from:to:cc:subject:date:message-id;
  bh=ZcdTdCm+LpnO3ArnSrpJWsiEHj5w5cMt5bvywPX9DN8=;
  b=KJShpHxl0oFEy2HOA9Yl+SbFFRwCUZM6iHJwM2dmRPavqkZzuu2TsHur
   EdfH3jFbAqaN1UObmfkaZxxhJ/LE0I99gL3oL4oeEm/nKecvRkrOTAUY6
   EMpsClZmkcM4JdLhLPcwmTb31noCiMKxeZyZ8Q37WFn8TONXkISTTZUsD
   bKHsqId60Ozvn3s0+5tKGeTqJxtjCNmeo2YrZy+rO4mV5MHZEm/qiCckW
   uk5CZ+qN6CfdeZlvdlbf27LKcnJyZ3SfrWSybCfyFFwpPJrMf2Nv6PlgR
   0WX8L5X10mxKH4ZdgieW32xjXk2v+zHmYOiVE6IZN4MVjSrp2NBELKutz
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="326829404"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="326829404"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 22:26:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="775061864"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="775061864"
Received: from intel-lenovo-legion-y540-15irh-pg0.iind.intel.com ([10.224.186.95])
  by fmsmga002.fm.intel.com with ESMTP; 05 Feb 2023 22:26:57 -0800
From:   Kiran K <kiran.k@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     ravishankar.srivatsa@intel.com, lokendra.singh@intel.com,
        chethan.tumkur.narayan@intel.com, seema.sreemantha@intel.com,
        Kiran K <kiran.k@intel.com>
Subject: [PATCH v1] monitor/intel: Add decoding of PPAG command
Date:   Mon,  6 Feb 2023 12:07:05 +0530
Message-Id: <20230206063705.19909-1-kiran.k@intel.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Add decoding support for Intel Per Platform
Antenna Gain command.

btmon logs:
< HCI Command: Intel Configure Per Platform Antenna Gain (0x3f|0x0219) plen 12
        Mcc: 0x00000000
        Selector: Enable
        Delta: 0x00000000
> HCI Event: Command Complete (0x0e) plen 4
      Intel Configure Per Platform Antenna Gain (0x3f|0x0219) ncmd 1
        Status: Success (0x00)
---
 monitor/intel.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/monitor/intel.c b/monitor/intel.c
index f5e9f5932cf4..4a0f91a70182 100644
--- a/monitor/intel.c
+++ b/monitor/intel.c
@@ -712,6 +712,33 @@ static void read_supported_features_rsp(uint16_t index, const void *data,
 	packet_hexdump(data + 3, size - 3);
 }
 
+static void configure_ppag(uint16_t index, const void *data, uint8_t size)
+{
+	uint32_t mcc = get_le32(data);
+	uint32_t selector = get_le32(data + 4);
+	uint32_t delta = get_le32(data + 8);
+	char *ppag_selector;
+
+	switch (selector) {
+	case 0x00:
+		ppag_selector = "Enable";
+		break;
+	case 0x01:
+		ppag_selector = "Disable";
+		break;
+	case 0x02:
+		ppag_selector = "Test Mode";
+		break;
+	default:
+		ppag_selector = "Unknown";
+		break;
+	}
+
+	print_field("Mcc: 0x%8.8x", mcc);
+	print_field("Selector: %s", ppag_selector);
+	print_field("Delta: 0x%8.8x", delta);
+}
+
 static const struct vendor_ocf vendor_ocf_table[] = {
 	{ 0x001, "Reset",
 			reset_cmd, 8, true,
@@ -777,7 +804,9 @@ static const struct vendor_ocf vendor_ocf_table[] = {
 	{ 0x0a6, "Read Supported Features",
 			read_supported_features_cmd, 1, true,
 			read_supported_features_rsp, 19, true },
-
+	{ 0x0219, "Configure Per Platform Antenna Gain",
+			configure_ppag, 12, true,
+			status_rsp, 1, true},
 	{ }
 };
 
-- 
2.17.1

