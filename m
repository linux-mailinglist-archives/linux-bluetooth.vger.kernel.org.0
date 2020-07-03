Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18FFE2134B1
	for <lists+linux-bluetooth@lfdr.de>; Fri,  3 Jul 2020 09:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbgGCHLT (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 3 Jul 2020 03:11:19 -0400
Received: from mga07.intel.com ([134.134.136.100]:29061 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725764AbgGCHLT (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 3 Jul 2020 03:11:19 -0400
IronPort-SDR: kV7g+7yR5b1Ph+nsc7G+vHiJkhdUMpExrqUsGE/s8CeSx23tgbEvmaIP6eCzzjXG83b678XBkl
 f8zIZFKe7zAw==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="212125521"
X-IronPort-AV: E=Sophos;i="5.75,307,1589266800"; 
   d="scan'208";a="212125521"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2020 00:11:19 -0700
IronPort-SDR: Jv9y9nhdsF2SrtzKh7MlbV1Ueaf7Yt9R7lBDyTDfSQ6MKamup2bC8xfXblW4o/Up476WH64rbH
 2KKkKTSOUruA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,307,1589266800"; 
   d="scan'208";a="426212126"
Received: from unknown (HELO intel-Lenovo-Legion-Y540-15IRH-PG0.iind.intel.com) ([10.224.186.95])
  by orsmga004.jf.intel.com with ESMTP; 03 Jul 2020 00:11:16 -0700
From:   Kiran K <kiran.k@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     ravishankar.srivatsa@intel.com, chethan.tumkur.narayan@intel.com,
        kiraank@gmail.com, Kiran K <kiran.k@intel.com>,
        Amit K Bag <amit.k.bag@intel.com>,
        Raghuram Hegde <raghuram.hegde@intel.com>
Subject: [PATCH v2 4/5] Bluetooth: btintel: Define tlv structure for new generation Controllers
Date:   Fri,  3 Jul 2020 12:42:11 +0530
Message-Id: <20200703071212.17046-4-kiran.k@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703071212.17046-1-kiran.k@intel.com>
References: <20200703071212.17046-1-kiran.k@intel.com>
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Define structure used for reading controller information and
to downloading firmware in tlv format used for new generation
Intel controllers

Signed-off-by: Kiran K <kiran.k@intel.com>
Signed-off-by: Amit K Bag <amit.k.bag@intel.com>
Signed-off-by: Raghuram Hegde <raghuram.hegde@intel.com>
Reviewed-by: Chethan T N <chethan.tumkur.narayan@intel.com>
Reviewed-by: Sathish Narasimman <Sathish.Narasimman@intel.com>
Reviewed-by: Srivatsa Ravishankar <ravishankar.srivatsa@intel.com>
---

Changes in v2: None
Changes in v1:
- Add tlv structure definition


 drivers/bluetooth/btintel.h | 85 +++++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/drivers/bluetooth/btintel.h b/drivers/bluetooth/btintel.h
index 0865d2d4aca7..20007da6b9bd 100644
--- a/drivers/bluetooth/btintel.h
+++ b/drivers/bluetooth/btintel.h
@@ -6,6 +6,90 @@
  *  Copyright (C) 2015  Intel Corporation
  */
 
+/* List of tlv type */
+enum {
+	INTEL_TLV_CNVI_TOP = 0x10,
+	INTEL_TLV_CNVR_TOP,
+	INTEL_TLV_CNVI_BT,
+	INTEL_TLV_CNVR_BT,
+	INTEL_TLV_CNVI_OTP,
+	INTEL_TLV_CNVR_OTP,
+	INTEL_TLV_DEV_REV_ID,
+	INTEL_TLV_USB_VENDOR_ID,
+	INTEL_TLV_USB_PRODUCT_ID,
+	INTEL_TLV_PCIE_VENDOR_ID,
+	INTEL_TLV_PCIE_DEVICE_ID,
+	INTEL_TLV_PCIE_SUBSYSTEM_ID,
+	INTEL_TLV_IMAGE_TYPE,
+	INTEL_TLV_TIME_STAMP,
+	INTEL_TLV_BUILD_TYPE,
+	INTEL_TLV_BUILD_NUM,
+	INTEL_TLV_FW_BUILD_PRODUCT,
+	INTEL_TLV_FW_BUILD_HW,
+	INTEL_TLV_FW_STEP,
+	INTEL_TLV_BT_SPEC,
+	INTEL_TLV_MFG_NAME,
+	INTEL_TLV_HCI_REV,
+	INTEL_TLV_LMP_SUBVER,
+	INTEL_TLV_OTP_PATCH_VER,
+	INTEL_TLV_SECURE_BOOT,
+	INTEL_TLV_KEY_FROM_HDR,
+	INTEL_TLV_OTP_LOCK,
+	INTEL_TLV_API_LOCK,
+	INTEL_TLV_DEBUG_LOCK,
+	INTEL_TLV_MIN_FW,
+	INTEL_TLV_LIMITED_CCE,
+	INTEL_TLV_SBE_TYPE,
+	INTEL_TLV_OTP_BDADDR,
+	INTEL_TLV_UNLOCKED_STATE
+};
+
+struct intel_tlv {
+	u8 type;
+	u8 len;
+	u8 val[0];
+} __packed;
+
+struct intel_version_tlv {
+	u8	 status;
+	u32	 cnvi_top;
+	u32	 cnvr_top;
+	u32	 cnvi_bt;
+	u32	 cnvr_bt;
+	u16	 cnvi_otp;
+	u16	 cnvr_otp;
+	u16	 dev_rev_id;
+	u16	 usb_vid;
+	u16	 usb_pid;
+	u16	 pcie_vendor_id;
+	u16	 pcie_dev_id;
+	u16	 pcie_subsys_id;
+	u8	 img_type;
+	u16	 timestamp;
+	u8	 build_type;
+	u32	 build_num;
+	u8	 fw_build_prod;
+	u8	 fw_build_hw;
+	u8	 fw_build_step;
+	u8	 bt_spec_ver;
+	u16	 mfg_name;
+	u16	 hci_rev;
+	u16	 lmp_sub_ver;
+	u8	 otp_patch_ver;
+	u8	 secure_boot;
+	u8	 key_from_hdr;
+	u8	 otp_lock;
+	u8	 api_lock;
+	u8	 debug_lock;
+	u8	 min_fw_build_nn;
+	u8	 min_fw_build_cw;
+	u8	 min_fw_build_yy;
+	u8	 limited_cce;
+	u8	 sbe_type;
+	bdaddr_t otp_bd_addr;
+	u8	 unlocked_state;
+} __packed;
+
 struct intel_version {
 	u8 status;
 	u8 hw_platform;
@@ -70,6 +154,7 @@ struct btintel_version {
 	bool is_tlv_supported;
 	union {
 		struct intel_version intel_version; /* legacy version */
+		struct intel_version_tlv intel_version_tlv;
 	};
 } __packed;
 
-- 
2.17.1

