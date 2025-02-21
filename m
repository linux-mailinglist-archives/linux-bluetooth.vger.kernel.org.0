Return-Path: <linux-bluetooth+bounces-10567-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF40A3F793
	for <lists+linux-bluetooth@lfdr.de>; Fri, 21 Feb 2025 15:44:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CB1716DBE8
	for <lists+linux-bluetooth@lfdr.de>; Fri, 21 Feb 2025 14:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB5120F083;
	Fri, 21 Feb 2025 14:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fMNcdnAo"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA1920F091
	for <linux-bluetooth@vger.kernel.org>; Fri, 21 Feb 2025 14:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740148984; cv=none; b=o0zfhmm/1c6vwMPuzjgbmPp2jLKIFryesD8GqYTds6A/sfg6g+wSlZ9bqqzLcDvG/z5AvzOFYK3/2D4NBm64fVlfx39KDXvdh0mnY0goe59heYq9yCyP/4+xI7qO4L5a2OP5dRD/JcACCT8HvIEPbT4xnLKtGtVShGzz9yCeTYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740148984; c=relaxed/simple;
	bh=Arpj/YusBACWVMK6K9ISzx/qZW1SDTO/u+wsUSCDZJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nPPXWkTtj3PH0P1gsdfGup/vq7z2ExqZ3EUCYbQxIz6mJkt0SKt4OjSfnFxEfP2DWFOvkJ0n7EX87TgPp0dkN3wmalW6PQUKCVJNmQzGaL8SHAc7qu9E+D7mN0wpDQ8YNa7jqq9HqbffPfJBNjHLLPi/DpunMvNJejm8O4k0XeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fMNcdnAo; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740148982; x=1771684982;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Arpj/YusBACWVMK6K9ISzx/qZW1SDTO/u+wsUSCDZJU=;
  b=fMNcdnAoWTQUK08QLvRvsK9D/O2GLmFU2gPu6dv0obkJermvt6UUF100
   wG7D9xmKy4QZwhzU7UskA95Il/GcpwyaZA+G2TJNVi0yJFa+6W2Zmy4IB
   40wNjVpHJrhb1olK1PeI9c7Rvf0SEA2Qic1HUEU4nF1X5b3Dnfh8nki12
   ZP8+vwOZud4cbFTjWA849ghMCC0qEqLBNaWHkBo+FubjZZRcGBMls1yf2
   2wA6htikEcM6q/vLXBRb/OxV1/Pp7cGiJKZQBpqeFk5YykhiHTktLW2ZN
   NDEYhif9wg/ARwvYLE6K5w44NOyx6/3tWDAZ3BTIAX1i3Gpv2vNJyO0RX
   w==;
X-CSE-ConnectionGUID: oBHUmqjrS9aQspTL5dDIXg==
X-CSE-MsgGUID: jtUjA6pESN2phPoJNSRBRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="40159817"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="40159817"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 06:43:02 -0800
X-CSE-ConnectionGUID: W7Ly2DKOTz6YMWOXooY7DA==
X-CSE-MsgGUID: Ejh5oEJYQ4+ffpqaaL+tEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="115914715"
Received: from intel-lenovo-legion-y540-15irh-pg0.iind.intel.com ([10.224.186.95])
  by fmviesa010.fm.intel.com with ESMTP; 21 Feb 2025 06:43:00 -0800
From: Kiran K <kiran.k@intel.com>
To: linux-bluetooth@vger.kernel.org
Cc: ravishankar.srivatsa@intel.com,
	chethan.tumkur.narayan@intel.com,
	chandrashekar.devegowda@intel.com,
	vijay.satija@intel.com,
	Kiran K <kiran.k@intel.com>
Subject: [PATCH v2 2/4] Bluetooth: btintel_pcie: Read hardware exception data
Date: Fri, 21 Feb 2025 20:12:43 +0530
Message-ID: <20250221144245.1012686-2-kiran.k@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250221144245.1012686-1-kiran.k@intel.com>
References: <20250221144245.1012686-1-kiran.k@intel.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On hardware error, controller writes hardware error event and optional
vendor specific hci events in device memory in TLV format and raises
MSIX interrupt. Driver reads the device memory and passes the events to
the stack for further processing.

Co-developed-by: Vijay Satija <vijay.satija@intel.com>
Signed-off-by: Vijay Satija <vijay.satija@intel.com>
Signed-off-by: Kiran K <kiran.k@intel.com>
---
v1 --> v2:
- Add comments for the delay added in MAC for target acess
- Add comment for having a seperate work item to read exception events
- Add hci interface name while logging expception event in dmesg.

 drivers/bluetooth/btintel.h      |   1 +
 drivers/bluetooth/btintel_pcie.c | 226 ++++++++++++++++++++++++++++++-
 drivers/bluetooth/btintel_pcie.h |  23 ++++
 3 files changed, 249 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btintel.h b/drivers/bluetooth/btintel.h
index 19530ea14905..4c21e69887a3 100644
--- a/drivers/bluetooth/btintel.h
+++ b/drivers/bluetooth/btintel.h
@@ -190,6 +190,7 @@ enum {
 struct btintel_data {
 	DECLARE_BITMAP(flags, __INTEL_NUM_FLAGS);
 	int (*acpi_reset_method)(struct hci_dev *hdev);
+	u32	cnvi_top;
 };
 
 #define btintel_set_flag(hdev, nr)					\
diff --git a/drivers/bluetooth/btintel_pcie.c b/drivers/bluetooth/btintel_pcie.c
index 11e2b805c7cc..f93ddd2fdb01 100644
--- a/drivers/bluetooth/btintel_pcie.c
+++ b/drivers/bluetooth/btintel_pcie.c
@@ -51,6 +51,14 @@ MODULE_DEVICE_TABLE(pci, btintel_pcie_table);
 
  #define BTINTEL_PCIE_MAGIC_NUM    0xA5A5A5A5
 
+#define BTINTEL_PCIE_BLZR_HWEXP_SIZE		1024
+#define BTINTEL_PCIE_BLZR_HWEXP_DMP_ADDR	0xB00A7C00
+
+#define BTINTEL_PCIE_SCP_HWEXP_SIZE		4096
+#define BTINTEL_PCIE_SCP_HWEXP_DMP_ADDR		0xB030F800
+
+#define BTINTEL_PCIE_MAGIC_NUM	0xA5A5A5A5
+
 /* Alive interrupt context */
 enum {
 	BTINTEL_PCIE_ROM,
@@ -353,6 +361,64 @@ static int btintel_pcie_reset_bt(struct btintel_pcie_data *data)
 	return reg == 0 ? 0 : -ENODEV;
 }
 
+static void btintel_pcie_mac_init(struct btintel_pcie_data *data)
+{
+	u32 reg;
+
+	/* Set MAC_INIT bit to start primary bootloader */
+	reg = btintel_pcie_rd_reg32(data, BTINTEL_PCIE_CSR_FUNC_CTRL_REG);
+	reg &= ~(BTINTEL_PCIE_CSR_FUNC_CTRL_FUNC_INIT |
+			BTINTEL_PCIE_CSR_FUNC_CTRL_BUS_MASTER_DISCON |
+			BTINTEL_PCIE_CSR_FUNC_CTRL_SW_RESET);
+	reg |= (BTINTEL_PCIE_CSR_FUNC_CTRL_FUNC_ENA |
+			BTINTEL_PCIE_CSR_FUNC_CTRL_MAC_INIT);
+	btintel_pcie_wr_reg32(data, BTINTEL_PCIE_CSR_FUNC_CTRL_REG, reg);
+}
+
+static int btintel_pcie_get_mac_access(struct btintel_pcie_data *data)
+{
+	u32 reg;
+	int retry = 15;
+
+	reg = btintel_pcie_rd_reg32(data, BTINTEL_PCIE_CSR_FUNC_CTRL_REG);
+
+	reg |= BTINTEL_PCIE_CSR_FUNC_CTRL_STOP_MAC_ACCESS_DIS;
+	reg |= BTINTEL_PCIE_CSR_FUNC_CTRL_XTAL_CLK_REQ;
+	if ((reg & BTINTEL_PCIE_CSR_FUNC_CTRL_MAC_ACCESS_STS) == 0)
+		reg |= BTINTEL_PCIE_CSR_FUNC_CTRL_MAC_ACCESS_REQ;
+
+	btintel_pcie_wr_reg32(data, BTINTEL_PCIE_CSR_FUNC_CTRL_REG, reg);
+
+	do {
+		reg = btintel_pcie_rd_reg32(data, BTINTEL_PCIE_CSR_FUNC_CTRL_REG);
+		if (reg & BTINTEL_PCIE_CSR_FUNC_CTRL_MAC_ACCESS_STS)
+			return 0;
+		/* Need delay here for Target Access harwdware to settle down*/
+		usleep_range(1000, 1200);
+
+	} while (--retry > 0);
+
+	return -ETIME;
+}
+
+static void btintel_pcie_release_mac_access(struct btintel_pcie_data *data)
+{
+	u32 reg;
+
+	reg = btintel_pcie_rd_reg32(data, BTINTEL_PCIE_CSR_FUNC_CTRL_REG);
+
+	if (reg & BTINTEL_PCIE_CSR_FUNC_CTRL_MAC_ACCESS_REQ)
+		reg &= ~BTINTEL_PCIE_CSR_FUNC_CTRL_MAC_ACCESS_REQ;
+
+	if (reg & BTINTEL_PCIE_CSR_FUNC_CTRL_STOP_MAC_ACCESS_DIS)
+		reg &= ~BTINTEL_PCIE_CSR_FUNC_CTRL_STOP_MAC_ACCESS_DIS;
+
+	if (reg & BTINTEL_PCIE_CSR_FUNC_CTRL_XTAL_CLK_REQ)
+		reg &= ~BTINTEL_PCIE_CSR_FUNC_CTRL_XTAL_CLK_REQ;
+
+	btintel_pcie_wr_reg32(data, BTINTEL_PCIE_CSR_FUNC_CTRL_REG, reg);
+}
+
 /* This function enables BT function by setting BTINTEL_PCIE_CSR_FUNC_CTRL_MAC_INIT bit in
  * BTINTEL_PCIE_CSR_FUNC_CTRL_REG register and wait for MSI-X with
  * BTINTEL_PCIE_MSIX_HW_INT_CAUSES_GP0.
@@ -473,6 +539,140 @@ static inline char *btintel_pcie_alivectxt_state2str(u32 alive_intr_ctxt)
 	}
 }
 
+static int btintel_pcie_read_device_mem(struct btintel_pcie_data *data,
+					void *buf, u32 dev_addr, int len)
+{
+	int err;
+	u32 *val = buf;
+
+	/* Get device mac access */
+	err = btintel_pcie_get_mac_access(data);
+	if (err) {
+		bt_dev_err(data->hdev, "Failed to get mac access %d", err);
+		return err;
+	}
+
+	for (; len > 0; len -= 4, dev_addr += 4, val++)
+		*val = btintel_pcie_rd_dev_mem(data, dev_addr);
+
+	btintel_pcie_release_mac_access(data);
+
+	return 0;
+}
+
+static void btintel_pcie_dump_hwexp(struct btintel_pcie_data *data)
+{
+	struct btintel_data *intel_data = hci_get_priv(data->hdev);
+	int len, err, offset, pending;
+	struct sk_buff *skb;
+	u8 *buf, prefix[64];
+	u32 addr, val;
+
+	struct tlv {
+		u8	type;
+		u16	len;
+		u8	val[];
+	} __packed;
+
+	struct tlv *tlv;
+
+	switch (intel_data->cnvi_top & 0xfff) {
+	case BTINTEL_CNVI_BLAZARI:
+	case BTINTEL_CNVI_BLAZARIW:
+		/* only from step B0 onwards */
+		if (INTEL_CNVX_TOP_STEP(intel_data->cnvi_top) != 0x01)
+			return;
+		len = BTINTEL_PCIE_BLZR_HWEXP_SIZE; /* exception data length */
+		addr = BTINTEL_PCIE_BLZR_HWEXP_DMP_ADDR;
+	break;
+	case BTINTEL_CNVI_SCP:
+		len = BTINTEL_PCIE_SCP_HWEXP_SIZE;
+		addr = BTINTEL_PCIE_SCP_HWEXP_DMP_ADDR;
+	break;
+	default:
+		bt_dev_err(data->hdev, "Unsupported cnvi 0x%8.8x", intel_data->cnvi_top);
+		return;
+	}
+
+	buf = kzalloc(len, GFP_KERNEL);
+	if (!buf)
+		goto exit_on_error;
+
+	btintel_pcie_mac_init(data);
+
+	err = btintel_pcie_read_device_mem(data, buf, addr, len);
+	if (err)
+		goto exit_on_error;
+
+	val = get_unaligned_le32(buf);
+	if (val != BTINTEL_PCIE_MAGIC_NUM) {
+		bt_dev_err(data->hdev, "Invalid exception dump signature: 0x%8.8x",
+			   val);
+		goto exit_on_error;
+	}
+
+	snprintf(prefix, sizeof(prefix), "Bluetooth: %s: ", bt_dev_name(data->hdev));
+
+	offset = 4;
+	do {
+		pending = len - offset;
+		if (pending < sizeof(*tlv))
+			break;
+		tlv = (struct tlv *)(buf + offset);
+
+		/* If type == 0, then there are no more TLVs to be parsed */
+		if (!tlv->type) {
+			bt_dev_dbg(data->hdev, "Invalid TLV type 0");
+			break;
+		}
+		tlv->len = le16_to_cpu((__force __le16)tlv->len);
+		offset += sizeof(*tlv);
+		pending = len - offset;
+		if (tlv->len > pending)
+			break;
+
+		offset += tlv->len;
+
+		 /* Only TLVs of type == 1 are HCI events, no need to process other
+		  * TLVs
+		  */
+		if (tlv->type != 1)
+			continue;
+
+		bt_dev_dbg(data->hdev, "TLV packet length: %u", tlv->len);
+		if (tlv->len > HCI_MAX_EVENT_SIZE)
+			break;
+		skb = bt_skb_alloc(tlv->len, GFP_KERNEL);
+		if (!skb)
+			goto exit_on_error;
+		hci_skb_pkt_type(skb) = HCI_EVENT_PKT;
+		skb_put_data(skb, tlv->val, tlv->len);
+
+		/* copy Intel specific pcie packet type */
+		val = BTINTEL_PCIE_HCI_EVT_PKT;
+		memcpy(skb_push(skb, BTINTEL_PCIE_HCI_TYPE_LEN), &val,
+		       BTINTEL_PCIE_HCI_TYPE_LEN);
+
+		print_hex_dump(KERN_DEBUG, prefix, DUMP_PREFIX_OFFSET, 16, 1,
+			       tlv->val, tlv->len, false);
+
+		skb_queue_tail(&data->rx_skb_q, skb);
+		queue_work(data->workqueue, &data->rx_work);
+	} while (offset < len);
+
+exit_on_error:
+	kfree(buf);
+}
+
+static void btintel_pcie_hwexp_work(struct work_struct *work)
+{
+	struct btintel_pcie_data *data = container_of(work,
+					struct btintel_pcie_data, hwexp_work);
+	btintel_pcie_dump_hwexp(data);
+
+	clear_bit(BTINTEL_PCIE_HWEXP_INPROGRESS, &data->flags);
+}
+
 /* This function handles the MSI-X interrupt for gp0 cause (bit 0 in
  * BTINTEL_PCIE_CSR_MSIX_HW_INT_CAUSES) which is sent for boot stage and image response.
  */
@@ -794,6 +994,20 @@ static int btintel_pcie_recv_frame(struct btintel_pcie_data *data,
 	return ret;
 }
 
+static void btintel_pcie_msix_hw_exp_handler(struct btintel_pcie_data *data)
+{
+	bt_dev_err(data->hdev, "Received hw exception interrupt");
+	if (test_and_set_bit(BTINTEL_PCIE_HWEXP_INPROGRESS, &data->flags))
+		return;
+	/* Unlike usb products, there will be no hardware event sent by
+	 * controller on exception. Instead, controller writes the hardware error
+	 * event along with optional debug events in devie memory and halts. Driver
+	 * shall read the events from device memory, construct skbs and push
+	 * to rx_work item for further processing.
+	 */
+	queue_work(data->workqueue, &data->hwexp_work);
+}
+
 static void btintel_pcie_rx_work(struct work_struct *work)
 {
 	struct btintel_pcie_data *data = container_of(work,
@@ -920,6 +1134,10 @@ static irqreturn_t btintel_pcie_irq_msix_handler(int irq, void *dev_id)
 		return IRQ_NONE;
 	}
 
+	/* This interrupt is raised when there is an hardware exception */
+	if (intr_hw & BTINTEL_PCIE_MSIX_HW_INT_CAUSES_HWEXP)
+		btintel_pcie_msix_hw_exp_handler(data);
+
 	/* This interrupt is triggered by the firmware after updating
 	 * boot_stage register and image_response register
 	 */
@@ -1000,7 +1218,8 @@ struct btintel_pcie_causes_list {
 static struct btintel_pcie_causes_list causes_list[] = {
 	{ BTINTEL_PCIE_MSIX_FH_INT_CAUSES_0,	BTINTEL_PCIE_CSR_MSIX_FH_INT_MASK,	0x00 },
 	{ BTINTEL_PCIE_MSIX_FH_INT_CAUSES_1,	BTINTEL_PCIE_CSR_MSIX_FH_INT_MASK,	0x01 },
-	{ BTINTEL_PCIE_MSIX_HW_INT_CAUSES_GP0, BTINTEL_PCIE_CSR_MSIX_HW_INT_MASK,	0x20 },
+	{ BTINTEL_PCIE_MSIX_HW_INT_CAUSES_GP0,  BTINTEL_PCIE_CSR_MSIX_HW_INT_MASK,	0x20 },
+	{ BTINTEL_PCIE_MSIX_HW_INT_CAUSES_HWEXP, BTINTEL_PCIE_CSR_MSIX_HW_INT_MASK,	0x23 },
 };
 
 /* This function configures the interrupt masks for both HW_INT_CAUSES and
@@ -1482,6 +1701,7 @@ static void btintel_pcie_release_hdev(struct btintel_pcie_data *data)
 
 static int btintel_pcie_setup_internal(struct hci_dev *hdev)
 {
+	struct btintel_data *data = hci_get_priv(hdev);
 	const u8 param[1] = { 0xFF };
 	struct intel_version_tlv ver_tlv;
 	struct sk_buff *skb;
@@ -1520,6 +1740,7 @@ static int btintel_pcie_setup_internal(struct hci_dev *hdev)
 		goto exit_error;
 	}
 
+	data->cnvi_top = ver_tlv.cnvi_top;
 	switch (INTEL_HW_PLATFORM(ver_tlv.cnvi_bt)) {
 	case 0x37:
 		break;
@@ -1667,6 +1888,8 @@ static int btintel_pcie_probe(struct pci_dev *pdev,
 	skb_queue_head_init(&data->rx_skb_q);
 	INIT_WORK(&data->rx_work, btintel_pcie_rx_work);
 
+	INIT_WORK(&data->hwexp_work, btintel_pcie_hwexp_work);
+
 	data->boot_stage_cache = 0x00;
 	data->img_resp_cache = 0x00;
 
@@ -1731,6 +1954,7 @@ static void btintel_pcie_remove(struct pci_dev *pdev)
 	btintel_pcie_release_hdev(data);
 
 	flush_work(&data->rx_work);
+	flush_work(&data->hwexp_work);
 
 	destroy_workqueue(data->workqueue);
 
diff --git a/drivers/bluetooth/btintel_pcie.h b/drivers/bluetooth/btintel_pcie.h
index b9d32393002b..98902fd4fc96 100644
--- a/drivers/bluetooth/btintel_pcie.h
+++ b/drivers/bluetooth/btintel_pcie.h
@@ -16,6 +16,8 @@
 #define BTINTEL_PCIE_CSR_CI_ADDR_LSB_REG	(BTINTEL_PCIE_CSR_BASE + 0x118)
 #define BTINTEL_PCIE_CSR_CI_ADDR_MSB_REG	(BTINTEL_PCIE_CSR_BASE + 0x11C)
 #define BTINTEL_PCIE_CSR_IMG_RESPONSE_REG	(BTINTEL_PCIE_CSR_BASE + 0x12C)
+#define BTINTEL_PCIE_PRPH_DEV_ADDR_REG		(BTINTEL_PCIE_CSR_BASE + 0x440)
+#define BTINTEL_PCIE_PRPH_DEV_RD_REG		(BTINTEL_PCIE_CSR_BASE + 0x458)
 #define BTINTEL_PCIE_CSR_HBUS_TARG_WRPTR	(BTINTEL_PCIE_CSR_BASE + 0x460)
 
 /* BTINTEL_PCIE_CSR Function Control Register */
@@ -23,6 +25,12 @@
 #define BTINTEL_PCIE_CSR_FUNC_CTRL_MAC_INIT		(BIT(6))
 #define BTINTEL_PCIE_CSR_FUNC_CTRL_FUNC_INIT		(BIT(7))
 #define BTINTEL_PCIE_CSR_FUNC_CTRL_MAC_ACCESS_STS	(BIT(20))
+
+#define BTINTEL_PCIE_CSR_FUNC_CTRL_MAC_ACCESS_REQ	(BIT(21))
+/* Stop MAC Access disconnection request */
+#define BTINTEL_PCIE_CSR_FUNC_CTRL_STOP_MAC_ACCESS_DIS	(BIT(22))
+#define BTINTEL_PCIE_CSR_FUNC_CTRL_XTAL_CLK_REQ		(BIT(23))
+
 #define BTINTEL_PCIE_CSR_FUNC_CTRL_BUS_MASTER_STS	(BIT(28))
 #define BTINTEL_PCIE_CSR_FUNC_CTRL_BUS_MASTER_DISCON	(BIT(29))
 #define BTINTEL_PCIE_CSR_FUNC_CTRL_SW_RESET		(BIT(31))
@@ -72,6 +80,7 @@ enum msix_fh_int_causes {
 /* Causes for the HW register interrupts */
 enum msix_hw_int_causes {
 	BTINTEL_PCIE_MSIX_HW_INT_CAUSES_GP0	= BIT(0),	/* cause 32 */
+	BTINTEL_PCIE_MSIX_HW_INT_CAUSES_HWEXP	= BIT(3),	/* cause 35 */
 };
 
 /* PCIe device states
@@ -84,6 +93,11 @@ enum {
 	BTINTEL_PCIE_STATE_D3_HOT = 2,
 	BTINTEL_PCIE_STATE_D3_COLD = 3,
 };
+
+enum {
+	BTINTEL_PCIE_HWEXP_INPROGRESS,
+};
+
 #define BTINTEL_PCIE_MSIX_NON_AUTO_CLEAR_CAUSE	BIT(7)
 
 /* Minimum and Maximum number of MSI-X Vector
@@ -437,6 +451,7 @@ struct btintel_pcie_data {
 	struct rxq	rxq;
 	u32	alive_intr_ctxt;
 	struct btintel_pcie_dbgc	dbgc;
+	struct work_struct	hwexp_work;
 };
 
 static inline u32 btintel_pcie_rd_reg32(struct btintel_pcie_data *data,
@@ -476,3 +491,11 @@ static inline void btintel_pcie_clr_reg_bits(struct btintel_pcie_data *data,
 	r &= ~bits;
 	iowrite32(r, data->base_addr + offset);
 }
+
+static inline u32 btintel_pcie_rd_dev_mem(struct btintel_pcie_data *data,
+					  u32 addr)
+{
+	btintel_pcie_wr_reg32(data, BTINTEL_PCIE_PRPH_DEV_ADDR_REG, addr);
+	return btintel_pcie_rd_reg32(data, BTINTEL_PCIE_PRPH_DEV_RD_REG);
+}
+
-- 
2.43.0


