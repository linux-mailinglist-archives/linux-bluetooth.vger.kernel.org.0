Return-Path: <linux-bluetooth+bounces-10806-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE61FA4C733
	for <lists+linux-bluetooth@lfdr.de>; Mon,  3 Mar 2025 17:32:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D525C18887BA
	for <lists+linux-bluetooth@lfdr.de>; Mon,  3 Mar 2025 16:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899E7214A8B;
	Mon,  3 Mar 2025 16:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h7tf2hBl"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FDB2147FC
	for <linux-bluetooth@vger.kernel.org>; Mon,  3 Mar 2025 16:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741019349; cv=none; b=AQL0AaR097cedEDMpef3cA8va5k6OiapY3aXFJdF2oLAwkymYo98iV5YQPo4PR2Im8v0YE8x79DPgxmrhi4Q5mCflOFKiJZ0Vim/mFCJGOwGApCEZGSAGVDcN+NVlj0/eKEhB+NUhfdJwcbUp8wMJ61+mLoJM5hxH0AyQlGXRvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741019349; c=relaxed/simple;
	bh=JZqKp2nci2aHKu9Wv9FYwXSS3E2MY8OWUnRo+G7Zu5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gQlgx5jVeTmCdRKdNVqeusbP4oJQd1eh9hZZp/8YTL5feo2MgLZb6b5gp2EXsKWtf5U78GJoing3ONw+arSCRy11W9zBZ8bfw5bxz9DwukWdgOyF7UcVFJ0TEljvIczUQ7H86ER0q+qZJbb6Aa5hsDPPWc+blm0QLTdWN9jLtMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h7tf2hBl; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741019347; x=1772555347;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JZqKp2nci2aHKu9Wv9FYwXSS3E2MY8OWUnRo+G7Zu5o=;
  b=h7tf2hBlMPcqTFGr0f35EnwexBgjum3E4GMdU1UgJU9FaCGLLrgYbrEp
   H63BXDMZ+B2LkhyxSE0nQ3t2PY3vEwjCNDA1Ww9j4q0w/CU/3yXknCeOV
   jExsJtVpjhV8mjQansal+OsLkBW0UvAdxPyopb9OOklw6Jto+GD8eXO9l
   SiykSqvdet5KGJ79PfVM+7NS8Z/5b6Oe0JlOElER0Qm0pJ0ytHljtckwp
   sJQ/FCIg+ZRnVcnxfSuhhPpGDyUuD/Er1wi/r8YLsEcw8Cv11TSiRaiU0
   kHtmXY14SretXAucRJmMu7TQ/dSXKgPwNfkbfgVn1UI7KpPLvup4txFUX
   Q==;
X-CSE-ConnectionGUID: UrYWOpJzQAioVyPEjvgdjA==
X-CSE-MsgGUID: EQUZ97ZVQeS4YP5Nzfk8Yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41078243"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="41078243"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 08:29:05 -0800
X-CSE-ConnectionGUID: VUn04oE4QFW5oCgfF26fSQ==
X-CSE-MsgGUID: qy8Ljrp3SE6/PmFqogIYxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122207000"
Received: from intel-lenovo-legion-y540-15irh-pg0.iind.intel.com ([10.224.186.95])
  by fmviesa003.fm.intel.com with ESMTP; 03 Mar 2025 08:29:02 -0800
From: Kiran K <kiran.k@intel.com>
To: linux-bluetooth@vger.kernel.org
Cc: ravishankar.srivatsa@intel.com,
	chethan.tumkur.narayan@intel.com,
	chandrashekar.devegowda@intel.com,
	vijay.satija@intel.com,
	Kiran K <kiran.k@intel.com>
Subject: [PATCH v2] Bluetooth: btintel_pcie: Add support for device coredump
Date: Mon,  3 Mar 2025 22:15:27 +0530
Message-ID: <20250303164527.218458-1-kiran.k@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1. Driver registers device coredump callback
2. Dumps firmware traces as part of coredump

Co-developed-by: Vijay Satija <vijay.satija@intel.com>
Signed-off-by: Vijay Satija <vijay.satija@intel.com>
Signed-off-by: Kiran K <kiran.k@intel.com>
---
v1 -> v2:
Fix warnign reported by smatch tool.

 drivers/bluetooth/btintel.h      |   1 -
 drivers/bluetooth/btintel_pcie.c | 259 ++++++++++++++++++++++++++++++-
 drivers/bluetooth/btintel_pcie.h |  38 +++++
 3 files changed, 291 insertions(+), 7 deletions(-)

diff --git a/drivers/bluetooth/btintel.h b/drivers/bluetooth/btintel.h
index 4c21e69887a3..19530ea14905 100644
--- a/drivers/bluetooth/btintel.h
+++ b/drivers/bluetooth/btintel.h
@@ -190,7 +190,6 @@ enum {
 struct btintel_data {
 	DECLARE_BITMAP(flags, __INTEL_NUM_FLAGS);
 	int (*acpi_reset_method)(struct hci_dev *hdev);
-	u32	cnvi_top;
 };
 
 #define btintel_set_flag(hdev, nr)					\
diff --git a/drivers/bluetooth/btintel_pcie.c b/drivers/bluetooth/btintel_pcie.c
index e8307eeb971f..a499bad58b53 100644
--- a/drivers/bluetooth/btintel_pcie.c
+++ b/drivers/bluetooth/btintel_pcie.c
@@ -59,6 +59,8 @@ MODULE_DEVICE_TABLE(pci, btintel_pcie_table);
 
 #define BTINTEL_PCIE_MAGIC_NUM	0xA5A5A5A5
 
+#define BTINTEL_PCIE_TRIGGER_REASON_USER_TRIGGER	0x17A2
+
 /* Alive interrupt context */
 enum {
 	BTINTEL_PCIE_ROM,
@@ -375,6 +377,25 @@ static void btintel_pcie_mac_init(struct btintel_pcie_data *data)
 	btintel_pcie_wr_reg32(data, BTINTEL_PCIE_CSR_FUNC_CTRL_REG, reg);
 }
 
+static int btintel_pcie_add_dmp_data(struct hci_dev *hdev, const void *data, int size)
+{
+	struct sk_buff *skb;
+	int err;
+
+	skb = alloc_skb(size, GFP_ATOMIC);
+	if (!skb)
+		return -ENOMEM;
+
+	skb_put_data(skb, data, size);
+	err = hci_devcd_append(hdev, skb);
+	if (err) {
+		bt_dev_err(hdev, "Failed to append data in the coredump");
+		return err;
+	}
+
+	return 0;
+}
+
 static int btintel_pcie_get_mac_access(struct btintel_pcie_data *data)
 {
 	u32 reg;
@@ -419,6 +440,194 @@ static void btintel_pcie_release_mac_access(struct btintel_pcie_data *data)
 	btintel_pcie_wr_reg32(data, BTINTEL_PCIE_CSR_FUNC_CTRL_REG, reg);
 }
 
+static void btintel_pcie_copy_tlv(struct sk_buff *skb, enum btintel_pcie_tlv_type type,
+				  void *data, int size)
+{
+	struct intel_tlv *tlv;
+
+	tlv = skb_put(skb, sizeof(*tlv) + size);
+	tlv->type = type;
+	tlv->len = size;
+	memcpy(tlv->val, data, tlv->len);
+}
+
+static int btintel_pcie_read_dram_buffers(struct btintel_pcie_data *data)
+{
+	u32 offset, prev_size, wr_ptr_status, dump_size, i;
+	struct btintel_pcie_dbgc *dbgc = &data->dbgc;
+	u8 buf_idx, dump_time_len, fw_build;
+	struct hci_dev *hdev = data->hdev;
+	struct intel_tlv *tlv;
+	struct timespec64 now;
+	struct sk_buff *skb;
+	struct tm tm_now;
+	char buf[256];
+	u16 hdr_len;
+	int ret;
+
+	wr_ptr_status = btintel_pcie_rd_dev_mem(data, BTINTEL_PCIE_DBGC_CUR_DBGBUFF_STATUS);
+	offset = wr_ptr_status & BTINTEL_PCIE_DBG_OFFSET_BIT_MASK;
+
+	buf_idx = BTINTEL_PCIE_DBGC_DBG_BUF_IDX(wr_ptr_status);
+	if (buf_idx > dbgc->count) {
+		bt_dev_warn(hdev, "Buffer index is invalid");
+		return -EINVAL;
+	}
+
+	prev_size = buf_idx * BTINTEL_PCIE_DBGC_BUFFER_SIZE;
+	if (prev_size + offset >= prev_size)
+		data->dmp_hdr.write_ptr = prev_size + offset;
+	else
+		return -EINVAL;
+
+	ktime_get_real_ts64(&now);
+	time64_to_tm(now.tv_sec, 0, &tm_now);
+	dump_time_len = snprintf(buf, sizeof(buf), "Dump Time: %02d-%02d-%04ld %02d:%02d:%02d",
+				 tm_now.tm_mday, tm_now.tm_mon + 1, tm_now.tm_year + 1900,
+				 tm_now.tm_hour, tm_now.tm_min, tm_now.tm_sec);
+
+	fw_build = snprintf(buf + dump_time_len, sizeof(buf) - dump_time_len,
+			    "Firmware Timestamp: Year %u WW %02u buildtype %u build %u",
+			    2000 + (data->dmp_hdr.fw_timestamp >> 8),
+			    data->dmp_hdr.fw_timestamp & 0xff, data->dmp_hdr.fw_build_type,
+			    data->dmp_hdr.fw_build_num);
+
+	hdr_len = sizeof(*tlv) + sizeof(data->dmp_hdr.cnvi_bt) +
+		  sizeof(*tlv) + sizeof(data->dmp_hdr.write_ptr) +
+		  sizeof(*tlv) + sizeof(data->dmp_hdr.wrap_ctr) +
+		  sizeof(*tlv) + sizeof(data->dmp_hdr.trigger_reason) +
+		  sizeof(*tlv) + sizeof(data->dmp_hdr.fw_git_sha1) +
+		  sizeof(*tlv) + sizeof(data->dmp_hdr.cnvr_top) +
+		  sizeof(*tlv) + sizeof(data->dmp_hdr.cnvi_top) +
+		  sizeof(*tlv) + dump_time_len +
+		  sizeof(*tlv) + fw_build;
+
+	dump_size = hdr_len + sizeof(hdr_len);
+
+	skb = alloc_skb(dump_size, GFP_KERNEL);
+	if (!skb)
+		return -ENOMEM;
+
+	/* Add debug buffers data length to dump size */
+	dump_size += BTINTEL_PCIE_DBGC_BUFFER_SIZE * dbgc->count;
+
+	ret = hci_devcd_init(hdev, dump_size);
+	if (ret) {
+		bt_dev_err(hdev, "Failed to init devcoredump, err %d", ret);
+		kfree_skb(skb);
+		return ret;
+	}
+
+	skb_put_data(skb, &hdr_len, sizeof(hdr_len));
+
+	btintel_pcie_copy_tlv(skb, BTINTEL_CNVI_BT, &data->dmp_hdr.cnvi_bt,
+			      sizeof(data->dmp_hdr.cnvi_bt));
+
+	btintel_pcie_copy_tlv(skb, BTINTEL_WRITE_PTR, &data->dmp_hdr.write_ptr,
+			      sizeof(data->dmp_hdr.write_ptr));
+
+	data->dmp_hdr.wrap_ctr = btintel_pcie_rd_dev_mem(data,
+							 BTINTEL_PCIE_DBGC_DBGBUFF_WRAP_ARND);
+
+	btintel_pcie_copy_tlv(skb, BTINTEL_WRAP_CTR, &data->dmp_hdr.wrap_ctr,
+			      sizeof(data->dmp_hdr.wrap_ctr));
+
+	btintel_pcie_copy_tlv(skb, BTINTEL_TRIGGER_REASON, &data->dmp_hdr.trigger_reason,
+			      sizeof(data->dmp_hdr.trigger_reason));
+
+	btintel_pcie_copy_tlv(skb, BTINTEL_FW_SHA, &data->dmp_hdr.fw_git_sha1,
+			      sizeof(data->dmp_hdr.fw_git_sha1));
+
+	btintel_pcie_copy_tlv(skb, BTINTEL_CNVR_TOP, &data->dmp_hdr.cnvr_top,
+			      sizeof(data->dmp_hdr.cnvr_top));
+
+	btintel_pcie_copy_tlv(skb, BTINTEL_CNVI_TOP, &data->dmp_hdr.cnvi_top,
+			      sizeof(data->dmp_hdr.cnvi_top));
+
+	btintel_pcie_copy_tlv(skb, BTINTEL_DUMP_TIME, buf, dump_time_len);
+
+	btintel_pcie_copy_tlv(skb, BTINTEL_FW_BUILD, buf + dump_time_len, fw_build);
+
+	ret = hci_devcd_append(hdev, skb);
+	if (ret)
+		goto exit_err;
+
+	for (i = 0; i < dbgc->count; i++) {
+		ret = btintel_pcie_add_dmp_data(hdev, dbgc->bufs[i].data,
+						BTINTEL_PCIE_DBGC_BUFFER_SIZE);
+		if (ret)
+			break;
+	}
+
+exit_err:
+	hci_devcd_complete(hdev);
+	return ret;
+}
+
+static void btintel_pcie_dump_traces(struct hci_dev *hdev)
+{
+	struct btintel_pcie_data *data = hci_get_drvdata(hdev);
+	int ret = 0;
+
+	ret = btintel_pcie_get_mac_access(data);
+	if (ret) {
+		bt_dev_err(hdev, "Failed to get mac access: (%d)", ret);
+		return;
+	}
+
+	ret = btintel_pcie_read_dram_buffers(data);
+
+	btintel_pcie_release_mac_access(data);
+
+	if (ret)
+		bt_dev_err(hdev, "Failed to dump traces: (%d)", ret);
+}
+
+static void btintel_pcie_dump_hdr(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	struct btintel_pcie_data *data = hci_get_drvdata(hdev);
+	u16 len = skb->len;
+	u16 *hdrlen_ptr;
+	char buf[80];
+
+	hdrlen_ptr = skb_put_zero(skb, sizeof(len));
+
+	snprintf(buf, sizeof(buf), "Controller Name: 0x%X\n",
+		 INTEL_HW_VARIANT(data->dmp_hdr.cnvi_bt));
+	skb_put_data(skb, buf, strlen(buf));
+
+	snprintf(buf, sizeof(buf), "Firmware Build Number: %u\n",
+		 data->dmp_hdr.fw_build_num);
+	skb_put_data(skb, buf, strlen(buf));
+
+	snprintf(buf, sizeof(buf), "Driver: %s\n", data->dmp_hdr.driver_name);
+	skb_put_data(skb, buf, strlen(buf));
+
+	snprintf(buf, sizeof(buf), "Vendor: Intel\n");
+	skb_put_data(skb, buf, strlen(buf));
+
+	*hdrlen_ptr = skb->len - len;
+}
+
+static void btintel_pcie_dump_notify(struct hci_dev *hdev, int state)
+{
+	struct btintel_pcie_data *data = hci_get_drvdata(hdev);
+
+	switch (state) {
+	case HCI_DEVCOREDUMP_IDLE:
+		data->dmp_hdr.state = HCI_DEVCOREDUMP_IDLE;
+		break;
+	case HCI_DEVCOREDUMP_ACTIVE:
+		data->dmp_hdr.state = HCI_DEVCOREDUMP_ACTIVE;
+		break;
+	case HCI_DEVCOREDUMP_TIMEOUT:
+	case HCI_DEVCOREDUMP_ABORT:
+	case HCI_DEVCOREDUMP_DONE:
+		data->dmp_hdr.state = HCI_DEVCOREDUMP_IDLE;
+		break;
+	}
+}
+
 /* This function enables BT function by setting BTINTEL_PCIE_CSR_FUNC_CTRL_MAC_INIT bit in
  * BTINTEL_PCIE_CSR_FUNC_CTRL_REG register and wait for MSI-X with
  * BTINTEL_PCIE_MSIX_HW_INT_CAUSES_GP0.
@@ -883,7 +1092,6 @@ static int btintel_pcie_recv_frame(struct btintel_pcie_data *data,
 
 static void btintel_pcie_read_hwexp(struct btintel_pcie_data *data)
 {
-	struct btintel_data *intel_data = hci_get_priv(data->hdev);
 	int len, err, offset, pending;
 	struct sk_buff *skb;
 	u8 *buf, prefix[64];
@@ -898,11 +1106,11 @@ static void btintel_pcie_read_hwexp(struct btintel_pcie_data *data)
 
 	struct tlv *tlv;
 
-	switch (intel_data->cnvi_top & 0xfff) {
+	switch (data->dmp_hdr.cnvi_top & 0xfff) {
 	case BTINTEL_CNVI_BLAZARI:
 	case BTINTEL_CNVI_BLAZARIW:
 		/* only from step B0 onwards */
-		if (INTEL_CNVX_TOP_STEP(intel_data->cnvi_top) != 0x01)
+		if (INTEL_CNVX_TOP_STEP(data->dmp_hdr.cnvi_top) != 0x01)
 			return;
 		len = BTINTEL_PCIE_BLZR_HWEXP_SIZE; /* exception data length */
 		addr = BTINTEL_PCIE_BLZR_HWEXP_DMP_ADDR;
@@ -912,7 +1120,7 @@ static void btintel_pcie_read_hwexp(struct btintel_pcie_data *data)
 		addr = BTINTEL_PCIE_SCP_HWEXP_DMP_ADDR;
 	break;
 	default:
-		bt_dev_err(data->hdev, "Unsupported cnvi 0x%8.8x", intel_data->cnvi_top);
+		bt_dev_err(data->hdev, "Unsupported cnvi 0x%8.8x", data->dmp_hdr.cnvi_top);
 		return;
 	}
 
@@ -1017,6 +1225,11 @@ static void btintel_pcie_rx_work(struct work_struct *work)
 		clear_bit(BTINTEL_PCIE_HWEXP_INPROGRESS, &data->flags);
 	}
 
+	if (test_bit(BTINTEL_PCIE_COREDUMP_INPROGRESS, &data->flags)) {
+		btintel_pcie_dump_traces(data->hdev);
+		clear_bit(BTINTEL_PCIE_COREDUMP_INPROGRESS, &data->flags);
+	}
+
 	/* Process the sk_buf in queue and send to the HCI layer */
 	while ((skb = skb_dequeue(&data->rx_skb_q))) {
 		err = btintel_pcie_recv_frame(data, skb);
@@ -1702,7 +1915,7 @@ static void btintel_pcie_release_hdev(struct btintel_pcie_data *data)
 
 static int btintel_pcie_setup_internal(struct hci_dev *hdev)
 {
-	struct btintel_data *data = hci_get_priv(hdev);
+	struct btintel_pcie_data *data = hci_get_drvdata(hdev);
 	const u8 param[1] = { 0xFF };
 	struct intel_version_tlv ver_tlv;
 	struct sk_buff *skb;
@@ -1741,7 +1954,6 @@ static int btintel_pcie_setup_internal(struct hci_dev *hdev)
 		goto exit_error;
 	}
 
-	data->cnvi_top = ver_tlv.cnvi_top;
 	switch (INTEL_HW_PLATFORM(ver_tlv.cnvi_bt)) {
 	case 0x37:
 		break;
@@ -1787,6 +1999,23 @@ static int btintel_pcie_setup_internal(struct hci_dev *hdev)
 		break;
 	}
 
+	data->dmp_hdr.cnvi_top = ver_tlv.cnvi_top;
+	data->dmp_hdr.cnvr_top = ver_tlv.cnvr_top;
+	data->dmp_hdr.fw_timestamp = ver_tlv.timestamp;
+	data->dmp_hdr.fw_build_type = ver_tlv.build_type;
+	data->dmp_hdr.fw_build_num = ver_tlv.build_num;
+	data->dmp_hdr.cnvi_bt = ver_tlv.cnvi_bt;
+
+	if (ver_tlv.img_type == 0x02 || ver_tlv.img_type == 0x03)
+		data->dmp_hdr.fw_git_sha1 = ver_tlv.git_sha1;
+
+	err = hci_devcd_register(hdev, btintel_pcie_dump_traces, btintel_pcie_dump_hdr,
+				 btintel_pcie_dump_notify);
+	if (err) {
+		bt_dev_err(hdev, "Failed to register coredump (%d)", err);
+		goto exit_error;
+	}
+
 	btintel_print_fseq_info(hdev);
 exit_error:
 	kfree_skb(skb);
@@ -1851,6 +2080,7 @@ static int btintel_pcie_setup_hdev(struct btintel_pcie_data *data)
 		goto exit_error;
 	}
 
+	data->dmp_hdr.driver_name = KBUILD_MODNAME;
 	return 0;
 
 exit_error:
@@ -1963,11 +2193,28 @@ static void btintel_pcie_remove(struct pci_dev *pdev)
 	pci_set_drvdata(pdev, NULL);
 }
 
+#ifdef CONFIG_DEV_COREDUMP
+static void btintel_pcie_coredump(struct device *dev)
+{
+	struct  pci_dev *pdev = to_pci_dev(dev);
+	struct btintel_pcie_data *data = pci_get_drvdata(pdev);
+
+	if (test_and_set_bit(BTINTEL_PCIE_COREDUMP_INPROGRESS, &data->flags))
+		return;
+
+	data->dmp_hdr.trigger_reason  = BTINTEL_PCIE_TRIGGER_REASON_USER_TRIGGER;
+	queue_work(data->workqueue, &data->rx_work);
+}
+#endif
+
 static struct pci_driver btintel_pcie_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = btintel_pcie_table,
 	.probe = btintel_pcie_probe,
 	.remove = btintel_pcie_remove,
+#ifdef CONFIG_DEV_COREDUMP
+	.driver.coredump = btintel_pcie_coredump
+#endif
 };
 module_pci_driver(btintel_pcie_driver);
 
diff --git a/drivers/bluetooth/btintel_pcie.h b/drivers/bluetooth/btintel_pcie.h
index d17808ebe725..873178019cad 100644
--- a/drivers/bluetooth/btintel_pcie.h
+++ b/drivers/bluetooth/btintel_pcie.h
@@ -56,6 +56,15 @@
 #define BTINTEL_PCIE_CSR_MSIX_IVAR_BASE		(BTINTEL_PCIE_CSR_MSIX_BASE + 0x0880)
 #define BTINTEL_PCIE_CSR_MSIX_IVAR(cause)	(BTINTEL_PCIE_CSR_MSIX_IVAR_BASE + (cause))
 
+/* IOSF Debug Register */
+#define BTINTEL_PCIE_DBGC_BASE_ADDR			(0xf3800300)
+#define BTINTEL_PCIE_DBGC_CUR_DBGBUFF_STATUS		(BTINTEL_PCIE_DBGC_BASE_ADDR + 0x1C)
+#define BTINTEL_PCIE_DBGC_DBGBUFF_WRAP_ARND		(BTINTEL_PCIE_DBGC_BASE_ADDR + 0x2C)
+
+#define BTINTEL_PCIE_DBG_IDX_BIT_MASK		0x0F
+#define BTINTEL_PCIE_DBGC_DBG_BUF_IDX(data)	(((data) >> 24) & BTINTEL_PCIE_DBG_IDX_BIT_MASK)
+#define BTINTEL_PCIE_DBG_OFFSET_BIT_MASK	0xFFFFFF
+
 /* The DRAM buffer count, each buffer size, and
  * fragment buffer size
  */
@@ -97,6 +106,19 @@ enum {
 enum {
 	BTINTEL_PCIE_CORE_HALTED,
 	BTINTEL_PCIE_HWEXP_INPROGRESS,
+	BTINTEL_PCIE_COREDUMP_INPROGRESS
+};
+
+enum btintel_pcie_tlv_type {
+	BTINTEL_CNVI_BT,
+	BTINTEL_WRITE_PTR,
+	BTINTEL_WRAP_CTR,
+	BTINTEL_TRIGGER_REASON,
+	BTINTEL_FW_SHA,
+	BTINTEL_CNVR_TOP,
+	BTINTEL_CNVI_TOP,
+	BTINTEL_DUMP_TIME,
+	BTINTEL_FW_BUILD,
 };
 
 #define BTINTEL_PCIE_MSIX_NON_AUTO_CLEAR_CAUSE	BIT(7)
@@ -371,6 +393,21 @@ struct btintel_pcie_dbgc {
 	struct data_buf *bufs;
 };
 
+struct btintel_pcie_dump_header {
+	const char	*driver_name;
+	u32		cnvi_top;
+	u32		cnvr_top;
+	u16		fw_timestamp;
+	u8		fw_build_type;
+	u32		fw_build_num;
+	u32		fw_git_sha1;
+	u32		cnvi_bt;
+	u32		write_ptr;
+	u32		wrap_ctr;
+	u16		trigger_reason;
+	int		state;
+};
+
 /* struct btintel_pcie_data
  * @pdev: pci device
  * @hdev: hdev device
@@ -452,6 +489,7 @@ struct btintel_pcie_data {
 	struct rxq	rxq;
 	u32	alive_intr_ctxt;
 	struct btintel_pcie_dbgc	dbgc;
+	struct btintel_pcie_dump_header dmp_hdr;
 };
 
 static inline u32 btintel_pcie_rd_reg32(struct btintel_pcie_data *data,
-- 
2.43.0


