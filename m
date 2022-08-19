Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF9A59964B
	for <lists+linux-bluetooth@lfdr.de>; Fri, 19 Aug 2022 09:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347042AbiHSHj5 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 19 Aug 2022 03:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346839AbiHSHj4 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 19 Aug 2022 03:39:56 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C08A36171E
        for <linux-bluetooth@vger.kernel.org>; Fri, 19 Aug 2022 00:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660894795; x=1692430795;
  h=from:to:cc:subject:date:message-id;
  bh=MECQO0G3ub3CUJjojc1XN65dx4PlmxnpmCU6dYAVKEo=;
  b=P9y7s0iAcyU09gB/G43j1hqD5BBJJFN1WJvB3iWXA//wwAQ+GpCJCxVW
   56DnvaGysjG/ZpB8kyD8tSO+I1gfJqT8OAnHhCKsYjly77W9Wf4xZ85vY
   O4jg+Slx2y0bWgT2cLlWtvrhuFzUlp8RvojX0nqpc0EaFF/meVmG1Et8l
   EaWisElAUCAoTJc8syFpYYFh/ya2UYiFvuxn42mI0z0kYCpeZwaMWf9ra
   8DfgupTMMB/LbRqak7Qo91cQ9Ez1nN3Ggz78aFy63K9sO2SAGQ+dxghVd
   xXdhNudsjtVCR19NY6Tv187dJT+YoP6qx9lC2mzfUyp+eXHyPuNArdXPr
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="273351051"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
   d="scan'208";a="273351051"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2022 00:39:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
   d="scan'208";a="711248063"
Received: from intel-lenovo-legion-y540-15irh-pg0.iind.intel.com ([10.224.186.95])
  by fmsmga002.fm.intel.com with ESMTP; 19 Aug 2022 00:39:53 -0700
From:   Kiran K <kiran.k@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     ravishankar.srivatsa@intel.com, Kiran K <kiran.k@intel.com>
Subject: [PATCH v1] Bluetooth: btintel: Add support for Magnetor
Date:   Fri, 19 Aug 2022 13:18:15 +0530
Message-Id: <20220819074815.22016-1-kiran.k@intel.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hardware variant for Magnetor core (CNVi) is added.

Signed-off-by: Kiran K <kiran.k@intel.com>
---
 drivers/bluetooth/btintel.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bluetooth/btintel.c b/drivers/bluetooth/btintel.c
index 818681c89db8..37ec17508ff6 100644
--- a/drivers/bluetooth/btintel.c
+++ b/drivers/bluetooth/btintel.c
@@ -449,6 +449,7 @@ static int btintel_version_info_tlv(struct hci_dev *hdev,
 	case 0x17:	/* TyP */
 	case 0x18:	/* Slr */
 	case 0x19:	/* Slr-F */
+	case 0x1b:      /* Mgr */
 		break;
 	default:
 		bt_dev_err(hdev, "Unsupported Intel hardware variant (0x%x)",
@@ -2330,6 +2331,7 @@ static void btintel_set_msft_opcode(struct hci_dev *hdev, u8 hw_variant)
 	case 0x17:
 	case 0x18:
 	case 0x19:
+	case 0x1b:
 		hci_set_msft_opcode(hdev, 0xFC1E);
 		break;
 	default:
@@ -2542,6 +2544,7 @@ static int btintel_setup_combined(struct hci_dev *hdev)
 	case 0x17:
 	case 0x18:
 	case 0x19:
+	case 0x1b:
 		/* Display version information of TLV type */
 		btintel_version_info_tlv(hdev, &ver_tlv);
 
-- 
2.17.1

