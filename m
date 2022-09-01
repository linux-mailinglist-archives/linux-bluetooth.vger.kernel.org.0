Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDD1F5A89A7
	for <lists+linux-bluetooth@lfdr.de>; Thu,  1 Sep 2022 01:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbiHaX7o (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 31 Aug 2022 19:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbiHaX7n (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 31 Aug 2022 19:59:43 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF732F2C9D
        for <linux-bluetooth@vger.kernel.org>; Wed, 31 Aug 2022 16:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661990381; x=1693526381;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g57sxFhXzJrzY0Gv8u3zMfMvR5OY/zQrQ9RNiULVqnc=;
  b=XmudQUpGEUrxEkF8j3HlQs9lzwdH6ghyf2sIiVgPSP55BF+jBiEzATR7
   +b1pJCzj0D+dnpPW3OxYeh0tjVGorJrG95PNUmrq1KlJPaGpl+HnbnpqO
   x9j4coHRqzWBgR3jzFjrnGzeo5V3WhRu1svcfvKMIAJm+qpZUAdZDwf+E
   XkfLDkp34CJ7GJJR9LU3vu/XuCFGX5ixMwWMHR6WMK3QKq0CITqZLckeN
   ewl8k/oCCLIHIU+SzSeQ3N62hEBjntrLHU61qmpRSEa3Ec1TkwXSztTaU
   H8I9b0V6+jOHCdnjOHLA0oObk4j0jwCYVKUhYMX+Qc326nxebjn7NefUe
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="357295538"
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; 
   d="scan'208";a="357295538"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2022 16:59:40 -0700
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; 
   d="scan'208";a="563228023"
Received: from sbhatia4-mobl2.amr.corp.intel.com (HELO bgi1-mobl2.attlocal.net) ([10.213.189.113])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2022 16:59:40 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     marcel@holtmann.org, luiz.dentz@gmail.com, brian.gix@intel.com
Subject: [PATCH BlueZ v4 1/2] lib: Add mgmt opcodes and events for Mesh
Date:   Wed, 31 Aug 2022 16:59:31 -0700
Message-Id: <20220831235932.290032-2-brian.gix@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831235932.290032-1-brian.gix@intel.com>
References: <20220831235932.290032-1-brian.gix@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

---
 lib/mgmt.h | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/lib/mgmt.h b/lib/mgmt.h
index 430bd0ef6..79b77d31a 100644
--- a/lib/mgmt.h
+++ b/lib/mgmt.h
@@ -760,6 +760,38 @@ struct mgmt_cp_add_adv_patterns_monitor_rssi {
 	struct mgmt_adv_pattern patterns[0];
 } __packed;
 
+#define MGMT_OP_SET_MESH_RECEIVER		0x0057
+struct mgmt_cp_set_mesh {
+	uint8_t enable;
+	uint16_t window;
+	uint16_t period;
+	uint8_t num_ad_types;
+	uint8_t ad_types[];
+} __packed;
+
+#define MGMT_OP_MESH_READ_FEATURES	0x0058
+struct mgmt_rp_mesh_read_features {
+	uint16_t index;
+	uint8_t max_handles;
+	uint8_t used_handles;
+	uint8_t handles[];
+} __packed;
+
+#define MGMT_OP_MESH_SEND		0x0059
+struct mgmt_cp_mesh_send {
+	struct mgmt_addr_info addr;
+	uint64_t instant;
+	uint16_t delay;
+	uint8_t cnt;
+	uint8_t adv_data_len;
+	uint8_t adv_data[];
+} __packed;
+
+#define MGMT_OP_MESH_SEND_CANCEL	0x005A
+struct mgmt_cp_mesh_send_cancel {
+	uint8_t handle;
+} __packed;
+
 #define MGMT_EV_CMD_COMPLETE		0x0001
 struct mgmt_ev_cmd_complete {
 	uint16_t opcode;
@@ -1035,6 +1067,21 @@ struct mgmt_ev_adv_monitor_device_lost {
 	struct mgmt_addr_info addr;
 } __packed;
 
+#define MGMT_EV_MESH_DEVICE_FOUND	0x0031
+struct mgmt_ev_mesh_device_found {
+	struct mgmt_addr_info addr;
+	int8_t rssi;
+	uint64_t instant;
+	uint32_t flags;
+	uint16_t eir_len;
+	uint8_t	eir[];
+} __packed;
+
+#define MGMT_EV_MESH_PACKET_CMPLT		0x0032
+struct mgmt_ev_mesh_pkt_cmplt {
+	uint8_t	handle;
+} __packed;
+
 static const char *mgmt_op[] = {
 	"<0x0000>",
 	"Read Version",
-- 
2.37.2

