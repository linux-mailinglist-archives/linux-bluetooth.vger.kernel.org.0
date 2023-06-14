Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 481CF72B081
	for <lists+linux-bluetooth@lfdr.de>; Sun, 11 Jun 2023 08:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbjFKGcc (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 11 Jun 2023 02:32:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjFKGcb (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 11 Jun 2023 02:32:31 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A88D1BB
        for <linux-bluetooth@vger.kernel.org>; Sat, 10 Jun 2023 23:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686465150; x=1718001150;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LYLV6D1VFLwweqklqDXcdR5hfYMTe0iUhYzVtVQa/rs=;
  b=K0fOKPA9Ski02veLYnT+Pz0PIQMdMkALwYBZ9AFF5kpqhBEo2b3uzBaN
   N4YVBznstGJX3jsvUy7hkz8ZhP1F3LbDr0qcSzCarc8DrtDITZN9bqGOV
   bPzKQfutYv7KFKcDd0LAwof3FnRsKltdOpUlC2jifZJVzH9vH4ltY1MRN
   m/FCjxfPKq9Gk2XubHixxw9BzbT+In9RHLVRmMXf//5Z8UWFVwkmfksQj
   u7tMnCxB8E1TAEdLF0tUUD9V5Vcuh/1Er1lOHXfzEp7ymSxSAJLM2FmXO
   UUOs12EJhV0SGRbPevfdifXGFhZrFviCPWQna1wjc/eLsJ3w8ih0PkmjJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="360317229"
X-IronPort-AV: E=Sophos;i="6.00,234,1681196400"; 
   d="scan'208";a="360317229"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 23:32:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="885035336"
X-IronPort-AV: E=Sophos;i="6.00,234,1681196400"; 
   d="scan'208";a="885035336"
Received: from intel-lenovo-legion-y540-15irh-pg0.iind.intel.com ([10.224.186.95])
  by orsmga005.jf.intel.com with ESMTP; 10 Jun 2023 23:32:28 -0700
From:   Kiran K <kiran.k@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     ravishankar.srivatsa@intel.com, chethan.tumkur.nayaran@intel.com,
        Kiran K <kiran.k@intel.com>
Subject: [RESEND v3] Bluetooth: btintel: Add support to reset bluetooth via ACPI DSM
Date:   Sun, 11 Jun 2023 12:13:42 +0530
Message-Id: <20230611064342.1587278-1-kiran.k@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

New Intel platforms supports reset of Bluetooth device  via ACPI DSM
methods. The legacy reset mechanism via GPIO will be deprecated in
future. This patch checks the platform support for reset methods and if
supported uses the same instead of legacy GPIO toggling method.

ACPI firmware supports two types of reset method based on NIC card.
(Discrete or Integrated).

1. VSEC Type - Vendor Specific Extended Capability. Here  BT_EN and
   BT_IF_SELECT lines are driven by a register in PCH cluster. This
   interface is supported on discrete BT solution.

2. WDISABLE2 - In this soluton, W_DISABLE2 pin in M.2 is connected to
   physical GPIO from PCH. The DSM interface shall toggle this to recover
   from  error.

Signed-off-by: Kiran K <kiran.k@intel.com>
---
 drivers/bluetooth/btintel.c | 121 ++++++++++++++++++++++++++++++++++++
 drivers/bluetooth/btintel.h |   2 +
 drivers/bluetooth/btusb.c   |  16 +++++
 3 files changed, 139 insertions(+)

diff --git a/drivers/bluetooth/btintel.c b/drivers/bluetooth/btintel.c
index d9349ba48281..dd1e48808ee2 100644
--- a/drivers/bluetooth/btintel.c
+++ b/drivers/bluetooth/btintel.c
@@ -10,6 +10,7 @@
 #include <linux/firmware.h>
 #include <linux/regmap.h>
 #include <linux/acpi.h>
+#include <acpi/acpi_bus.h>
 #include <asm/unaligned.h>
 
 #include <net/bluetooth/bluetooth.h>
@@ -27,6 +28,11 @@
 
 #define BTINTEL_PPAG_NAME   "PPAG"
 
+enum {
+	DSM_SET_WDISABLE2_DELAY = 1,
+	DSM_SET_RESET_METHOD = 3,
+};
+
 /* structure to store the PPAG data read from ACPI table */
 struct btintel_ppag {
 	u32	domain;
@@ -49,6 +55,10 @@ static struct {
 	u32        fw_build_num;
 } coredump_info;
 
+static const guid_t btintel_guid_dsm =
+	GUID_INIT(0xaa10f4e0, 0x81ac, 0x4233,
+		  0xab, 0xf6, 0x3b, 0x2a, 0xc5, 0x0e, 0x28, 0xd9);
+
 int btintel_check_bdaddr(struct hci_dev *hdev)
 {
 	struct hci_rp_read_bd_addr *bda;
@@ -2444,6 +2454,116 @@ static void btintel_set_ppag(struct hci_dev *hdev, struct intel_version_tlv *ver
 	kfree_skb(skb);
 }
 
+static int btintel_acpi_reset_method(struct hci_dev *hdev)
+{
+	int ret = 0;
+	acpi_status status;
+	union acpi_object *p, *ref;
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+
+	status = acpi_evaluate_object(ACPI_HANDLE(GET_HCIDEV_DEV(hdev)), "_PRR", NULL, &buffer);
+	if (ACPI_FAILURE(status)) {
+		bt_dev_err(hdev, "Failed to run _PRR method");
+		ret = -ENODEV;
+		return ret;
+	}
+	p = buffer.pointer;
+
+	if (p->package.count != 1 || p->type != ACPI_TYPE_PACKAGE) {
+		bt_dev_err(hdev, "Invalid arguments");
+		ret = -EINVAL;
+		goto exit_on_error;
+	}
+
+	ref = &p->package.elements[0];
+	if (ref->type != ACPI_TYPE_LOCAL_REFERENCE) {
+		bt_dev_err(hdev, "Invalid object type: 0x%x", ref->type);
+		ret = -EINVAL;
+		goto exit_on_error;
+	}
+
+	status = acpi_evaluate_object(ref->reference.handle, "_RST", NULL, NULL);
+	if (ACPI_FAILURE(status)) {
+		bt_dev_err(hdev, "Failed to run_RST method");
+		ret = -ENODEV;
+		goto exit_on_error;
+	}
+
+exit_on_error:
+	kfree(buffer.pointer);
+	return ret;
+}
+
+static void btintel_set_dsm_reset_method(struct hci_dev *hdev,
+					 struct intel_version_tlv *ver_tlv)
+{
+	struct btintel_data *data = hci_get_priv(hdev);
+	acpi_handle handle = ACPI_HANDLE(GET_HCIDEV_DEV(hdev));
+	u8 reset_payload[4] = {0x01, 0x00, 0x01, 0x00};
+	union acpi_object *obj, argv4;
+	enum {
+		RESET_TYPE_WDISABLE2,
+		RESET_TYPE_VSEC
+	};
+
+	handle = ACPI_HANDLE(GET_HCIDEV_DEV(hdev));
+
+	if (!handle) {
+		bt_dev_dbg(hdev, "No support for bluetooth device in ACPI firmware");
+		return;
+	}
+
+	if (!acpi_has_method(handle, "_PRR")) {
+		bt_dev_err(hdev, "No support for _PRR ACPI method");
+		return;
+	}
+
+	switch (ver_tlv->cnvi_top & 0xfff) {
+	case 0x910: /* GalePeak2 */
+		reset_payload[2] = RESET_TYPE_VSEC;
+		break;
+	default:
+		/* WDISABLE2 is the default reset method */
+		reset_payload[2] = RESET_TYPE_WDISABLE2;
+
+		if (!acpi_check_dsm(handle, &btintel_guid_dsm, 0,
+				    BIT(DSM_SET_WDISABLE2_DELAY))) {
+			bt_dev_err(hdev, "No dsm support to set reset delay");
+			return;
+		}
+		argv4.integer.type = ACPI_TYPE_INTEGER;
+		/* delay required to toggle BT power */
+		argv4.integer.value = 160;
+		obj = acpi_evaluate_dsm(handle, &btintel_guid_dsm, 0,
+					DSM_SET_WDISABLE2_DELAY, &argv4);
+		if (!obj) {
+			bt_dev_err(hdev, "Failed to call dsm to set reset delay");
+			return;
+		}
+		ACPI_FREE(obj);
+	}
+
+	bt_dev_info(hdev, "DSM reset method type: 0x%02x", reset_payload[2]);
+
+	if (!acpi_check_dsm(handle, &btintel_guid_dsm, 0,
+			    DSM_SET_RESET_METHOD)) {
+		bt_dev_warn(hdev, "No support for dsm to set reset method");
+		return;
+	}
+	argv4.buffer.type = ACPI_TYPE_BUFFER;
+	argv4.buffer.length = sizeof(reset_payload);
+	argv4.buffer.pointer = reset_payload;
+
+	obj = acpi_evaluate_dsm(handle, &btintel_guid_dsm, 0,
+				DSM_SET_RESET_METHOD, &argv4);
+	if (!obj) {
+		bt_dev_err(hdev, "Failed to call dsm to set reset method");
+		return;
+	}
+	ACPI_FREE(obj);
+	data->acpi_reset_method = btintel_acpi_reset_method;
+}
+
 static int btintel_bootloader_setup_tlv(struct hci_dev *hdev,
 					struct intel_version_tlv *ver)
 {
@@ -2757,6 +2877,7 @@ static int btintel_setup_combined(struct hci_dev *hdev)
 		/* Setup MSFT Extension support */
 		btintel_set_msft_opcode(hdev,
 					INTEL_HW_VARIANT(ver_tlv.cnvi_bt));
+		btintel_set_dsm_reset_method(hdev, &ver_tlv);
 
 		err = btintel_bootloader_setup_tlv(hdev, &ver_tlv);
 		btintel_register_devcoredump_support(hdev);
diff --git a/drivers/bluetooth/btintel.h b/drivers/bluetooth/btintel.h
index d6a1dc8d8a82..7fd29ef038bd 100644
--- a/drivers/bluetooth/btintel.h
+++ b/drivers/bluetooth/btintel.h
@@ -166,12 +166,14 @@ enum {
 	INTEL_BROKEN_SHUTDOWN_LED,
 	INTEL_ROM_LEGACY,
 	INTEL_ROM_LEGACY_NO_WBS_SUPPORT,
+	INTEL_ACPI_RESET_ACTIVE,
 
 	__INTEL_NUM_FLAGS,
 };
 
 struct btintel_data {
 	DECLARE_BITMAP(flags, __INTEL_NUM_FLAGS);
+	int (*acpi_reset_method)(struct hci_dev *hdev);
 };
 
 #define btintel_set_flag(hdev, nr)					\
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 8776e0f93c73..c6ac63fdecfa 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -857,10 +857,26 @@ static void btusb_intel_cmd_timeout(struct hci_dev *hdev)
 {
 	struct btusb_data *data = hci_get_drvdata(hdev);
 	struct gpio_desc *reset_gpio = data->reset_gpio;
+	struct btintel_data *intel_data = hci_get_priv(hdev);
 
 	if (++data->cmd_timeout_cnt < 5)
 		return;
 
+	if (intel_data->acpi_reset_method) {
+		if (test_and_set_bit(INTEL_ACPI_RESET_ACTIVE, intel_data->flags)) {
+			bt_dev_err(hdev, "acpi: last reset failed ? Not resetting again");
+			return;
+		}
+
+		bt_dev_err(hdev, "Initiating acpi reset method");
+		/* If ACPI reset method fails, lets try with legacy GPIO
+		 * toggling
+		 */
+		if (!intel_data->acpi_reset_method(hdev)) {
+			return;
+		}
+	}
+
 	if (!reset_gpio) {
 		btusb_reset(hdev);
 		return;
-- 
2.25.1

