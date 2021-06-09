Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0C183A12D8
	for <lists+linux-bluetooth@lfdr.de>; Wed,  9 Jun 2021 13:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238681AbhFILia (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 9 Jun 2021 07:38:30 -0400
Received: from mga11.intel.com ([192.55.52.93]:22756 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238318AbhFILi3 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 9 Jun 2021 07:38:29 -0400
IronPort-SDR: mY2GXBeeG1dy1XMPTiVCd1SOVy/vh9kW9gQLJmwont/D4MQo8k5NR9w5gacmQiHMOngGaTNGhw
 kPar0a0FA9yA==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="202029977"
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; 
   d="scan'208";a="202029977"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2021 04:36:35 -0700
IronPort-SDR: GA2Z9SPQD5NvK1zXBrmQl4o4Ra/I5KXeAXeoTeHMG6C+FH2/Mc6mDvJoBlSPJSCmFVOE1E8vON
 1uwVsClOK2+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; 
   d="scan'208";a="440813903"
Received: from intel-lenovo-legion-y540-15irh-pg0.iind.intel.com ([10.224.186.95])
  by orsmga007.jf.intel.com with ESMTP; 09 Jun 2021 04:36:33 -0700
From:   Kiran K <kiran.k@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     tedd.an@intel.com, luiz.von.dentz@intel.com,
        chethan.tumkur.narayan@intel.com, ravishankar.srivatsa@intel.com,
        Kiran K <kiran.k@intel.com>
Subject: [PATCH v1] Bluetooth: btintel: Support Digital(N) + RF(N-1) combination
Date:   Wed,  9 Jun 2021 17:10:29 +0530
Message-Id: <20210609114029.1656-1-kiran.k@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

New generation Intel controllers(N) need to support RF from (N-1)
generation. Since PID comes from OTP present in RF module,
*setup* function gets mapped to BTUSB_INTEL_NEW instead of
BTUSB_INTEL_NEWGEN. This patch checks generation of CNVi in
*setup* of BTUSB_INTEL_NEW and maps callbacks to BTUSB_INTEL_NEWGEN
if new generation controller is found and attempts *setup* of
BTUSB_INTEL_NEWGEN.

Signed-off-by: Kiran K <kiran.k@intel.com>
Reviewed-by: Chethan T N <chethan.tumkur.narayan@intel.com>
Reviewed-by: Srivatsa Ravishankar <ravishankar.srivatsa@intel.com>
---
 drivers/bluetooth/btintel.c | 119 ++++++++++++++++++++++++++++++++++++
 drivers/bluetooth/btintel.h |  10 +++
 drivers/bluetooth/btusb.c   |  45 +++++++++++++-
 net/bluetooth/hci_core.c    |   5 +-
 4 files changed, 177 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btintel.c b/drivers/bluetooth/btintel.c
index e44b6993cf91..1d9ecc481f14 100644
--- a/drivers/bluetooth/btintel.c
+++ b/drivers/bluetooth/btintel.c
@@ -483,6 +483,85 @@ int btintel_version_info_tlv(struct hci_dev *hdev, struct intel_version_tlv *ver
 }
 EXPORT_SYMBOL_GPL(btintel_version_info_tlv);
 
+void btintel_parse_version_tlv(struct hci_dev *hdev, struct sk_buff *skb,
+			       struct intel_version_tlv *version)
+{
+	/* Consume Command Complete Status field */
+	skb_pull(skb, sizeof(__u8));
+
+	/* Event parameters contatin multiple TLVs. Read each of them
+	 * and only keep the required data. Also, it use existing legacy
+	 * version field like hw_platform, hw_variant, and fw_variant
+	 * to keep the existing setup flow
+	 */
+	while (skb->len) {
+		struct intel_tlv *tlv;
+
+		tlv = (struct intel_tlv *)skb->data;
+		switch (tlv->type) {
+		case INTEL_TLV_CNVI_TOP:
+			version->cnvi_top = get_unaligned_le32(tlv->val);
+			break;
+		case INTEL_TLV_CNVR_TOP:
+			version->cnvr_top = get_unaligned_le32(tlv->val);
+			break;
+		case INTEL_TLV_CNVI_BT:
+			version->cnvi_bt = get_unaligned_le32(tlv->val);
+			break;
+		case INTEL_TLV_CNVR_BT:
+			version->cnvr_bt = get_unaligned_le32(tlv->val);
+			break;
+		case INTEL_TLV_DEV_REV_ID:
+			version->dev_rev_id = get_unaligned_le16(tlv->val);
+			break;
+		case INTEL_TLV_IMAGE_TYPE:
+			version->img_type = tlv->val[0];
+			break;
+		case INTEL_TLV_TIME_STAMP:
+			version->timestamp = get_unaligned_le16(tlv->val);
+			break;
+		case INTEL_TLV_BUILD_TYPE:
+			version->build_type = tlv->val[0];
+			break;
+		case INTEL_TLV_BUILD_NUM:
+			version->build_num = get_unaligned_le32(tlv->val);
+			break;
+		case INTEL_TLV_SECURE_BOOT:
+			version->secure_boot = tlv->val[0];
+			break;
+		case INTEL_TLV_OTP_LOCK:
+			version->otp_lock = tlv->val[0];
+			break;
+		case INTEL_TLV_API_LOCK:
+			version->api_lock = tlv->val[0];
+			break;
+		case INTEL_TLV_DEBUG_LOCK:
+			version->debug_lock = tlv->val[0];
+			break;
+		case INTEL_TLV_MIN_FW:
+			version->min_fw_build_nn = tlv->val[0];
+			version->min_fw_build_cw = tlv->val[1];
+			version->min_fw_build_yy = tlv->val[2];
+			break;
+		case INTEL_TLV_LIMITED_CCE:
+			version->limited_cce = tlv->val[0];
+			break;
+		case INTEL_TLV_SBE_TYPE:
+			version->sbe_type = tlv->val[0];
+			break;
+		case INTEL_TLV_OTP_BDADDR:
+			memcpy(&version->otp_bd_addr, tlv->val, tlv->len);
+			break;
+		default:
+			/* Ignore rest of information */
+			break;
+		}
+		/* consume the current tlv and move to next*/
+		skb_pull(skb, tlv->len + sizeof(*tlv));
+	}
+}
+EXPORT_SYMBOL_GPL(btintel_parse_version_tlv);
+
 int btintel_read_version_tlv(struct hci_dev *hdev, struct intel_version_tlv *version)
 {
 	struct sk_buff *skb;
@@ -595,6 +674,46 @@ int btintel_read_version_tlv(struct hci_dev *hdev, struct intel_version_tlv *ver
 }
 EXPORT_SYMBOL_GPL(btintel_read_version_tlv);
 
+int btintel_generic_read_version(struct hci_dev *hdev,
+				 struct intel_version_tlv *ver_tlv,
+				 struct intel_version *ver, bool *is_tlv)
+{
+	struct sk_buff *skb;
+	const u8 param[1] = { 0xFF };
+
+	skb = __hci_cmd_sync(hdev, 0xfc05, 1, param, HCI_CMD_TIMEOUT);
+	if (IS_ERR(skb)) {
+		bt_dev_err(hdev, "Reading Intel version information failed (%ld)",
+			   PTR_ERR(skb));
+		return PTR_ERR(skb);
+	}
+
+	if (skb->data[0]) {
+		bt_dev_err(hdev, "Intel Read Version command failed (%02x)",
+			   skb->data[0]);
+		kfree_skb(skb);
+		return -EIO;
+	}
+
+	if (skb->len < sizeof(struct intel_version))
+		return -EILSEQ;
+
+	if (skb->len == sizeof(struct intel_version) &&
+	    skb->data[1] == 0x37)
+		*is_tlv = false;
+	else
+		*is_tlv = true;
+
+	if (*is_tlv)
+		btintel_parse_version_tlv(hdev, skb, ver_tlv);
+	else
+		memcpy(ver, skb->data, sizeof(*ver));
+
+	kfree_skb(skb);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(btintel_generic_read_version);
+
 /* ------- REGMAP IBT SUPPORT ------- */
 
 #define IBT_REG_MODE_8BIT  0x00
diff --git a/drivers/bluetooth/btintel.h b/drivers/bluetooth/btintel.h
index d184064a5e7c..366cb746f9c4 100644
--- a/drivers/bluetooth/btintel.h
+++ b/drivers/bluetooth/btintel.h
@@ -175,6 +175,10 @@ int btintel_read_debug_features(struct hci_dev *hdev,
 				struct intel_debug_features *features);
 int btintel_set_debug_features(struct hci_dev *hdev,
 			       const struct intel_debug_features *features);
+int btintel_generic_read_version(struct hci_dev *hdev,
+				 struct intel_version_tlv *ver_tlv,
+				 struct intel_version *ver,
+				 bool *is_tlv);
 #else
 
 static inline int btintel_check_bdaddr(struct hci_dev *hdev)
@@ -307,4 +311,10 @@ static inline int btintel_set_debug_features(struct hci_dev *hdev,
 	return -EOPNOTSUPP;
 }
 
+static int btintel_generic_read_version(struct hci_dev *hdev,
+					struct intel_version_tlv *ver_tlv,
+					struct intel_version *ver, bool *is_tlv)
+{
+	return -EOPNOTSUPP;
+}
 #endif
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index a9855a2dd561..15d91aae52cc 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -583,6 +583,9 @@ struct btusb_data {
 	unsigned cmd_timeout_cnt;
 };
 
+static int btusb_setup_intel_newgen(struct hci_dev *hdev);
+static int btusb_shutdown_intel_new(struct hci_dev *hdev);
+
 static void btusb_intel_cmd_timeout(struct hci_dev *hdev)
 {
 	struct btusb_data *data = hci_get_drvdata(hdev);
@@ -2842,6 +2845,18 @@ static int btusb_intel_boot(struct hci_dev *hdev, u32 boot_addr)
 	return err;
 }
 
+static bool btintel_is_newgen_controller(struct hci_dev *hdev, u32 cnvi)
+{
+	switch (cnvi & 0xFFF) {
+	case 0x400: /* Slr */
+	case 0x401: /* Slr-F */
+	case 0x410: /* TyP */
+	case 0x810: /* Mgr */
+		return true;
+	}
+	return false;
+}
+
 static int btusb_setup_intel_new(struct hci_dev *hdev)
 {
 	struct btusb_data *data = hci_get_drvdata(hdev);
@@ -2851,6 +2866,8 @@ static int btusb_setup_intel_new(struct hci_dev *hdev)
 	char ddcname[64];
 	int err;
 	struct intel_debug_features features;
+	struct intel_version_tlv ver_tlv;
+	bool is_tlv;
 
 	BT_DBG("%s", hdev->name);
 
@@ -2864,12 +2881,38 @@ static int btusb_setup_intel_new(struct hci_dev *hdev)
 	 * is in bootloader mode or if it already has operational firmware
 	 * loaded.
 	 */
-	err = btintel_read_version(hdev, &ver);
+	err = btintel_generic_read_version(hdev, &ver_tlv, &ver, &is_tlv);
 	if (err) {
 		bt_dev_err(hdev, "Intel Read version failed (%d)", err);
 		btintel_reset_to_bootloader(hdev);
 		return err;
 	}
+	if (is_tlv) {
+		/* We got TLV data. Check for new generation CNVi. If present,
+		 * then map the callbacks to BTUSB_INTEL_NEWGEN and attempt
+		 * setup function again
+		 */
+		if (btintel_is_newgen_controller(hdev, ver_tlv.cnvi_top)) {
+			hdev->send = btusb_send_frame_intel;
+			hdev->setup = btusb_setup_intel_newgen;
+			hdev->shutdown = btusb_shutdown_intel_new;
+			hdev->hw_error = btintel_hw_error;
+			hdev->set_diag = btintel_set_diag;
+			hdev->set_bdaddr = btintel_set_bdaddr;
+			hdev->cmd_timeout = btusb_intel_cmd_timeout;
+			return -EAGAIN;
+		}
+
+		/* we need to read legacy version here to minimize the changes
+		 * and keep the esixiting flow
+		 */
+		err = btintel_read_version(hdev, &ver);
+		if (err) {
+			bt_dev_err(hdev, "Intel Read version failed (%d)", err);
+			btintel_reset_to_bootloader(hdev);
+			return err;
+		}
+	}
 
 	err = btintel_version_info(hdev, &ver);
 	if (err)
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 1eb7ffd0dd29..8e407bad0e31 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -1496,8 +1496,11 @@ static int hci_dev_do_open(struct hci_dev *hdev)
 
 		hci_sock_dev_event(hdev, HCI_DEV_SETUP);
 
-		if (hdev->setup)
+		if (hdev->setup) {
 			ret = hdev->setup(hdev);
+			if (ret && ret == -EAGAIN)
+				ret = hdev->setup(hdev);
+		}
 
 		/* The transport driver can set the quirk to mark the
 		 * BD_ADDR invalid before creating the HCI device or in
-- 
2.17.1

