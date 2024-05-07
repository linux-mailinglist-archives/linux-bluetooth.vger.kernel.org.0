Return-Path: <linux-bluetooth+bounces-4358-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A183E8BE7A0
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 May 2024 17:43:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 064291F25AAC
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 May 2024 15:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F25416ABE8;
	Tue,  7 May 2024 15:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UUHpvZ9m"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DF91649C8
	for <linux-bluetooth@vger.kernel.org>; Tue,  7 May 2024 15:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715096565; cv=none; b=CWs3tnvAkkPV78DjYnCSr+eUKT0ufPdhb5fxeOULVg45isNq4LgIBGuU7oakypOCvrgl2wQFFELDuZjXF7x4Z3xxVHBtJHA3I5FQ/RWOc+mX02Ik9br9KNS7HSmyPxLK9P9qfg6T9DMBrADyVdZtRYcH3FI4m4Uhkq8k9FfoJjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715096565; c=relaxed/simple;
	bh=TisDvEf1x7jVSiyDy1Z79tKMDesmyKY/WbADEVccy5Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OCAPkfc3mEPJrQrgisKuELQnVDtaY+boC4X9ascx0nE0xDRYXuiIxRnW9zjfPIqZuvYWpJuoxOCFE0yZe2VnrQZLLhZXL2pQNpAHJjjqWb8yKFDwDV68P5QdV8UL3ucEaktOx1XylmabPxW5DWA/wJrv8T4IN9qkVYHvk1zrKZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UUHpvZ9m; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715096563; x=1746632563;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TisDvEf1x7jVSiyDy1Z79tKMDesmyKY/WbADEVccy5Q=;
  b=UUHpvZ9m9Rr8iTQKd74RgeCW01aoi1nx/KZ4n0hITjZh1kUgp7UH/Asr
   U+ajHD7Bh5itJQLlmXzD4ORNleTDVWr0+djD4rdowTKy0oWNfiGSEgXRZ
   4Wv3Ww0kI50i0dZnjDI2PdsuswzblTE2ZN4GrEoi+k51nr3TsOKU3n7Tv
   ba7CiiIM7d3GnZI4nzny9cVGh15haLlk4wmJszj0mECQE2ejBa6OjkBTq
   2Js8OlccMc5/R//Q9UtQypHjR/iqvEgVoZzS0IXjW2eqryYURWW09P9wH
   WhLxTLiXmRwLZEOTcLE0FMjNeNLsK8fjKFjCr5IQiLSlIb06dgVrUIWVr
   Q==;
X-CSE-ConnectionGUID: 7MnnG1lvRJa+AmDZL4Tlhg==
X-CSE-MsgGUID: N+1+bbHgR+yIysxzGFEISA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11026644"
X-IronPort-AV: E=Sophos;i="6.08,142,1712646000"; 
   d="scan'208";a="11026644"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 08:42:43 -0700
X-CSE-ConnectionGUID: wJQlryGqQSOnoEYmCcYa4g==
X-CSE-MsgGUID: Dcf9RrIISdSBGR7zpvZbtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,142,1712646000"; 
   d="scan'208";a="28647367"
Received: from intel-lenovo-legion-y540-15irh-pg0.iind.intel.com ([10.224.186.95])
  by orviesa009.jf.intel.com with ESMTP; 07 May 2024 08:42:39 -0700
From: Kiran K <kiran.k@intel.com>
To: linux-bluetooth@vger.kernel.org
Cc: ravishankar.srivatsa@intel.com,
	chethan.tumkur.narayan@intel.com,
	chandrashekar.devegowda@intel.com,
	helgaas@kernel.org,
	pmenzel@molgen.mpg.de,
	Tedd Ho-Jeong An <tedd.an@intel.com>,
	Kiran K <kiran.k@intel.com>
Subject: [PATCH v2 2/3] Bluetooth: btintel_pcie: Add support for PCIe transport
Date: Tue,  7 May 2024 21:26:57 +0530
Message-Id: <20240507155658.294676-2-kiran.k@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240507155658.294676-1-kiran.k@intel.com>
References: <20240507155658.294676-1-kiran.k@intel.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tedd Ho-Jeong An <tedd.an@intel.com>

Add initial code to support Intel bluetooth devices based on PCIe
transport. Allocate memory for TX & RX buffers, internal structures,
initialize interrupts for TX & RX and PCIe device.

Signed-off-by: Tedd Ho-Jeong An <tedd.an@intel.com>
Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
Suggested-by: Paul Menzel <pmenzel@molgen.mpg.de>
Signed-off-by: Kiran K <kiran.k@intel.com>
---
 drivers/bluetooth/Kconfig        |   12 +
 drivers/bluetooth/Makefile       |    1 +
 drivers/bluetooth/btintel.h      |    2 +-
 drivers/bluetooth/btintel_pcie.c | 1057 ++++++++++++++++++++++++++++++
 drivers/bluetooth/btintel_pcie.h |  425 ++++++++++++
 5 files changed, 1496 insertions(+), 1 deletion(-)
 create mode 100644 drivers/bluetooth/btintel_pcie.c
 create mode 100644 drivers/bluetooth/btintel_pcie.h

diff --git a/drivers/bluetooth/Kconfig b/drivers/bluetooth/Kconfig
index bc211c324206..41851b9a8070 100644
--- a/drivers/bluetooth/Kconfig
+++ b/drivers/bluetooth/Kconfig
@@ -478,5 +478,17 @@ config BT_NXPUART
 	  Say Y here to compile support for NXP Bluetooth UART device into
 	  the kernel, or say M here to compile as a module (btnxpuart).
 
+config BT_INTEL_PCIE
+	tristate "Intel HCI PCIe driver"
+	depends on PCI
+	select BT_INTEL
+	select FW_LOADER
+	default y
+	help
+	  Intel Bluetooth transport driver for PCIe.
+	  This driver is required if you want to use Intel Bluetooth device
+	  with PCIe interface.
 
+	  Say Y here to compiler support for Intel Bluetooth PCIe device into
+	  the kernel or say M to compile it as module (btintel_pcie)
 endmenu
diff --git a/drivers/bluetooth/Makefile b/drivers/bluetooth/Makefile
index 7a5967e9ac48..0730d6684d1a 100644
--- a/drivers/bluetooth/Makefile
+++ b/drivers/bluetooth/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_BT_HCIBTUSB)	+= btusb.o
 obj-$(CONFIG_BT_HCIBTSDIO)	+= btsdio.o
 
 obj-$(CONFIG_BT_INTEL)		+= btintel.o
+obj-$(CONFIG_BT_INTEL_PCIE)	+= btintel_pcie.o btintel.o
 obj-$(CONFIG_BT_ATH3K)		+= ath3k.o
 obj-$(CONFIG_BT_MRVL)		+= btmrvl.o
 obj-$(CONFIG_BT_MRVL_SDIO)	+= btmrvl_sdio.o
diff --git a/drivers/bluetooth/btintel.h b/drivers/bluetooth/btintel.h
index 1462a57420a0..5d4685b5c1fa 100644
--- a/drivers/bluetooth/btintel.h
+++ b/drivers/bluetooth/btintel.h
@@ -209,7 +209,7 @@ struct btintel_data {
 #define btintel_wait_on_flag_timeout(hdev, nr, m, to)			\
 		wait_on_bit_timeout(btintel_get_flag(hdev), (nr), m, to)
 
-#if IS_ENABLED(CONFIG_BT_INTEL)
+#if IS_ENABLED(CONFIG_BT_INTEL) || IS_ENABLED(CONFIG_BT_INTEL_PCIE)
 
 int btintel_check_bdaddr(struct hci_dev *hdev);
 int btintel_enter_mfg(struct hci_dev *hdev);
diff --git a/drivers/bluetooth/btintel_pcie.c b/drivers/bluetooth/btintel_pcie.c
new file mode 100644
index 000000000000..911bb50d7ce7
--- /dev/null
+++ b/drivers/bluetooth/btintel_pcie.c
@@ -0,0 +1,1057 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *
+ *  Bluetooth support for Intel PCIe devices
+ *
+ *  Copyright (C) 2024  Intel Corporation
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/firmware.h>
+#include <linux/pci.h>
+#include <linux/wait.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+
+#include <asm/unaligned.h>
+
+#include <net/bluetooth/bluetooth.h>
+#include <net/bluetooth/hci_core.h>
+
+#include "btintel.h"
+#include "btintel_pcie.h"
+
+#define VERSION "0.1"
+
+#define BTINTEL_PCI_DEVICE(dev, subdev)	\
+	.vendor = PCI_VENDOR_ID_INTEL,	\
+	.device = (dev),		\
+	.subvendor = PCI_ANY_ID,	\
+	.subdevice = (subdev),		\
+	.driver_data = 0
+
+#define POLL_INTERVAL_US	10
+
+/* Intel Bluetooth PCIe device id table */
+static const struct pci_device_id btintel_pcie_table[] = {
+	{ BTINTEL_PCI_DEVICE(0xA876, PCI_ANY_ID) },
+	{ 0 }
+};
+MODULE_DEVICE_TABLE(pci, btintel_pcie_table);
+
+/* Intel PCIe uses 4 bytes of HCI type instead of 1 byte BT SIG HCI type */
+#define BTINTEL_PCIE_HCI_TYPE_LEN	4
+#define BTINTEL_PCIE_HCI_ACL_PKT	0x00000002
+#define BTINTEL_PCIE_HCI_SCO_PKT	0x00000003
+#define BTINTEL_PCIE_HCI_EVT_PKT	0x00000004
+
+static inline void ipc_print_ia_ring(struct hci_dev *hdev, struct ia *ia,
+				     u16 queue_num)
+{
+	bt_dev_dbg(hdev, "IA: %s: tr-h:%02u  tr-t:%02u  cr-h:%02u  cr-t:%02u",
+		   queue_num == BTINTEL_PCIE_TXQ_NUM ? "TXQ" : "RXQ",
+		   ia->tr_hia[queue_num], ia->tr_tia[queue_num],
+		   ia->cr_hia[queue_num], ia->cr_tia[queue_num]);
+}
+
+static inline void ipc_print_urbd1(struct hci_dev *hdev, struct urbd1 *urbd1,
+				   u16 index)
+{
+	bt_dev_dbg(hdev, "RXQ:urbd1(%u) frbd_tag:%u status: 0x%x fixed:0x%x",
+		   index, urbd1->frbd_tag, urbd1->status, urbd1->fixed);
+}
+
+static int btintel_pcie_poll_bit(struct btintel_pcie_data *data, u32 offset,
+				 u32 bits, u32 mask, int timeout_us)
+{
+	int t = 0;
+	u32 reg;
+
+	do {
+		reg = btintel_pcie_rd_reg32(data, offset);
+
+		if ((reg & mask) == (bits & mask))
+			return t;
+		udelay(POLL_INTERVAL_US);
+		t += POLL_INTERVAL_US;
+	} while (t < timeout_us);
+
+	return -ETIMEDOUT;
+}
+
+static struct btintel_pcie_data *btintel_pcie_get_data(struct msix_entry *entry)
+{
+	u8 queue = entry->entry;
+	struct msix_entry *entries = entry - queue;
+
+	return container_of(entries, struct btintel_pcie_data, msix_entries[0]);
+}
+
+/* Set the doorbell for RXQ to notify the device that @index (actually index-1)
+ * is available to receive the data
+ */
+static void btintel_pcie_set_rx_db(struct btintel_pcie_data *data, u16 index)
+{
+	u32 val;
+
+	val = index;
+	val |= (BTINTEL_PCIE_RX_DB_VEC << 16);
+
+	btintel_pcie_wr_reg32(data, BTINTEL_PCIE_CSR_HBUS_TARG_WRPTR, val);
+}
+
+/* Update the FRBD (free buffer descriptor) with the @frbd_index and the
+ * DMA address of the free buffer.
+ */
+static void btintel_pcie_prepare_rx(struct rxq *rxq, u16 frbd_index)
+{
+	struct data_buf *buf;
+	struct frbd *frbd;
+
+	/* Get the buffer of the FRBD for DMA */
+	buf = &rxq->bufs[frbd_index];
+
+	frbd = &rxq->frbds[frbd_index];
+	memset(frbd, 0, sizeof(*frbd));
+
+	/* Update FRBD */
+	frbd->tag = frbd_index;
+	frbd->addr = buf->data_p_addr;
+}
+
+static int btintel_pcie_submit_rx(struct btintel_pcie_data *data)
+{
+	u16 frbd_index;
+	struct rxq *rxq = &data->rxq;
+
+	frbd_index = data->ia.tr_hia[BTINTEL_PCIE_RXQ_NUM];
+
+	if (frbd_index > rxq->count)
+		return -ERANGE;
+
+	/* Prepare for RX submit. It updates the FRBD with the address of DMA
+	 * buffer
+	 */
+	btintel_pcie_prepare_rx(rxq, frbd_index);
+
+	frbd_index = (frbd_index + 1) % rxq->count;
+	data->ia.tr_hia[BTINTEL_PCIE_RXQ_NUM] = frbd_index;
+	ipc_print_ia_ring(data->hdev, &data->ia, BTINTEL_PCIE_RXQ_NUM);
+
+	/* Set the doorbell to notify the device */
+	btintel_pcie_set_rx_db(data, frbd_index);
+
+	return 0;
+}
+
+static int btintel_pcie_start_rx(struct btintel_pcie_data *data)
+{
+	int i, ret;
+
+	for (i = 0; i < BTINTEL_PCIE_RX_MAX_QUEUE; i++) {
+		ret = btintel_pcie_submit_rx(data);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void btintel_pcie_reset_ia(struct btintel_pcie_data *data)
+{
+	memset(data->ia.tr_hia, 0, sizeof(u16) * BTINTEL_PCIE_NUM_QUEUES);
+	memset(data->ia.tr_tia, 0, sizeof(u16) * BTINTEL_PCIE_NUM_QUEUES);
+	memset(data->ia.cr_hia, 0, sizeof(u16) * BTINTEL_PCIE_NUM_QUEUES);
+	memset(data->ia.cr_tia, 0, sizeof(u16) * BTINTEL_PCIE_NUM_QUEUES);
+}
+
+static void btintel_pcie_reset_bt(struct btintel_pcie_data *data)
+{
+	btintel_pcie_wr_reg32(data, BTINTEL_PCIE_CSR_FUNC_CTRL_REG,
+			      BTINTEL_PCIE_CSR_FUNC_CTRL_SW_RESET);
+}
+
+/* This function enables BT function by setting BTINTEL_PCIE_CSR_FUNC_CTRL_MAC_INIT bit in
+ * BTINTEL_PCIE_CSR_FUNC_CTRL_REG register and wait for MSI-X with
+ * BTINTEL_PCIE_MSIX_HW_INT_CAUSES_GP0.
+ * Then the host reads firmware version from BTINTEL_CSR_F2D_MBX and the boot stage
+ * from BTINTEL_PCIE_CSR_BOOT_STAGE_REG.
+ */
+static int btintel_pcie_enable_bt(struct btintel_pcie_data *data)
+{
+	int err;
+	u32 reg;
+
+	data->gp0_received = false;
+
+	/* Update the DMA address of CI struct to CSR */
+	btintel_pcie_wr_reg32(data, BTINTEL_PCIE_CSR_CI_ADDR_LSB_REG,
+			      data->ci_p_addr & 0xffffffff);
+	btintel_pcie_wr_reg32(data, BTINTEL_PCIE_CSR_CI_ADDR_MSB_REG,
+			      data->ci_p_addr >> 32);
+
+	/* Reset the cached value of boot stage. it is updated by the MSI-X
+	 * gp0 interrupt handler.
+	 */
+	data->boot_stage_cache = 0x0;
+
+	/* Set MAC_INIT bit to start primary bootloader */
+	reg = btintel_pcie_rd_reg32(data, BTINTEL_PCIE_CSR_FUNC_CTRL_REG);
+
+	btintel_pcie_set_reg_bits(data, BTINTEL_PCIE_CSR_FUNC_CTRL_REG,
+				  BTINTEL_PCIE_CSR_FUNC_CTRL_MAC_INIT);
+
+	/* Wait until MAC_ACCESS is granted */
+	err = btintel_pcie_poll_bit(data, BTINTEL_PCIE_CSR_FUNC_CTRL_REG,
+				    BTINTEL_PCIE_CSR_FUNC_CTRL_MAC_ACCESS_STS,
+				    BTINTEL_PCIE_CSR_FUNC_CTRL_MAC_ACCESS_STS,
+				    BTINTEL_DEFAULT_MAC_ACCESS_TIMEOUT_US);
+	if (err < 0)
+		return -ENODEV;
+
+	/* MAC is ready. Enable BT FUNC */
+	btintel_pcie_set_reg_bits(data, BTINTEL_PCIE_CSR_FUNC_CTRL_REG,
+				  BTINTEL_PCIE_CSR_FUNC_CTRL_FUNC_ENA |
+				  BTINTEL_PCIE_CSR_FUNC_CTRL_FUNC_INIT);
+
+	reg = btintel_pcie_rd_reg32(data, BTINTEL_PCIE_CSR_FUNC_CTRL_REG);
+
+	/* wait for interrupt from the device after booting up to primary
+	 * bootloader.
+	 */
+	err = wait_event_timeout(data->gp0_wait_q, data->gp0_received,
+				 msecs_to_jiffies(BTINTEL_DEFAULT_INTR_TIMEOUT));
+	if (!err)
+		return -ETIME;
+
+	/* Check cached boot stage is BTINTEL_PCIE_CSR_BOOT_STAGE_ROM(BIT(0)) */
+	if (~data->boot_stage_cache & BTINTEL_PCIE_CSR_BOOT_STAGE_ROM)
+		return -ENODEV;
+
+	return 0;
+}
+
+/* This function handles the MSI-X interrupt for gp0 cause (bit 0 in
+ * BTINTEL_PCIE_CSR_MSIX_HW_INT_CAUSES) which is sent for boot stage and image response.
+ */
+static void btintel_pcie_msix_gp0_handler(struct btintel_pcie_data *data)
+{
+	u32 reg;
+
+	/* This interrupt is for three different causes and it is not easy to
+	 * know what causes the interrupt. So, it compares each register value
+	 * with cached value and update it before it wake up the queue.
+	 */
+	reg = btintel_pcie_rd_reg32(data, BTINTEL_PCIE_CSR_BOOT_STAGE_REG);
+	if (reg != data->boot_stage_cache)
+		data->boot_stage_cache = reg;
+
+	reg = btintel_pcie_rd_reg32(data, BTINTEL_PCIE_CSR_IMG_RESPONSE_REG);
+	if (reg != data->img_resp_cache)
+		data->img_resp_cache = reg;
+
+	data->gp0_received = true;
+
+	/* If the boot stage is OP or IML, reset IA and start RX again */
+	if (data->boot_stage_cache & BTINTEL_PCIE_CSR_BOOT_STAGE_OPFW ||
+	    data->boot_stage_cache & BTINTEL_PCIE_CSR_BOOT_STAGE_IML) {
+		btintel_pcie_reset_ia(data);
+		btintel_pcie_start_rx(data);
+	}
+
+	wake_up(&data->gp0_wait_q);
+}
+
+/* This function handles the MSX-X interrupt for rx queue 0 which is for TX
+ */
+static void btintel_pcie_msix_tx_handle(struct btintel_pcie_data *data)
+{
+	u16 cr_tia, cr_hia;
+	struct txq *txq;
+	struct urbd0 *urbd0;
+
+	cr_tia = data->ia.cr_tia[BTINTEL_PCIE_TXQ_NUM];
+	cr_hia = data->ia.cr_hia[BTINTEL_PCIE_TXQ_NUM];
+
+	if (cr_tia == cr_hia)
+		return;
+
+	txq = &data->txq;
+
+	while (cr_tia != cr_hia) {
+		data->tx_wait_done = true;
+		wake_up(&data->tx_wait_q);
+
+		urbd0 = &txq->urbd0s[cr_tia];
+
+		if (urbd0->tfd_index > txq->count)
+			return;
+
+		cr_tia = (cr_tia + 1) % txq->count;
+		data->ia.cr_tia[BTINTEL_PCIE_TXQ_NUM] = cr_tia;
+		ipc_print_ia_ring(data->hdev, &data->ia, BTINTEL_PCIE_TXQ_NUM);
+	}
+}
+
+/* Process the received rx data
+ * It check the frame header to identify the data type and create skb
+ * and calling HCI API
+ */
+static int btintel_pcie_hci_recv_frame(struct btintel_pcie_data *data,
+				       struct sk_buff *skb)
+{
+	int ret;
+	u8 pkt_type;
+	u16 plen;
+	u32 pcie_pkt_type;
+	struct sk_buff *new_skb;
+	void *pdata;
+	struct hci_dev *hdev = data->hdev;
+
+	spin_lock(&data->hci_rx_lock);
+
+	/* The first 4 bytes indicates the Intel PCIe specific packet type */
+	pdata = skb_pull_data(skb, BTINTEL_PCIE_HCI_TYPE_LEN);
+	if (!data) {
+		bt_dev_err(hdev, "Corrupted packet received");
+		ret = -EILSEQ;
+		goto exit_error;
+	}
+
+	pcie_pkt_type = get_unaligned_le32(pdata);
+
+	switch (pcie_pkt_type) {
+	case BTINTEL_PCIE_HCI_ACL_PKT:
+		if (skb->len >= HCI_ACL_HDR_SIZE) {
+			plen = HCI_ACL_HDR_SIZE + __le16_to_cpu(hci_acl_hdr(skb)->dlen);
+			pkt_type = HCI_ACLDATA_PKT;
+		} else {
+			bt_dev_err(hdev, "ACL packet is too short");
+			ret = -EILSEQ;
+			goto exit_error;
+		}
+		break;
+
+	case BTINTEL_PCIE_HCI_SCO_PKT:
+		if (skb->len >= HCI_SCO_HDR_SIZE) {
+			plen = HCI_SCO_HDR_SIZE + hci_sco_hdr(skb)->dlen;
+			pkt_type = HCI_SCODATA_PKT;
+		} else {
+			bt_dev_err(hdev, "SCO packet is too short");
+			ret = -EILSEQ;
+			goto exit_error;
+		}
+		break;
+
+	case BTINTEL_PCIE_HCI_EVT_PKT:
+		if (skb->len >= HCI_EVENT_HDR_SIZE) {
+			plen = HCI_EVENT_HDR_SIZE + hci_event_hdr(skb)->plen;
+			pkt_type = HCI_EVENT_PKT;
+		} else {
+			bt_dev_err(hdev, "Event packet is too short");
+			ret = -EILSEQ;
+			goto exit_error;
+		}
+		break;
+	default:
+		bt_dev_err(hdev, "Invalid packet type received: 0x%4.4x",
+			   pcie_pkt_type);
+		ret = -EINVAL;
+		goto exit_error;
+	}
+
+	if (skb->len < plen) {
+		bt_dev_err(hdev, "Received corrupted packet. type: 0x%2.2x",
+			   pkt_type);
+		ret = -EILSEQ;
+		goto exit_error;
+	}
+
+	bt_dev_dbg(hdev, "pkt_type: 0x%2.2x len: %u", pkt_type, plen);
+
+	new_skb = bt_skb_alloc(plen, GFP_ATOMIC);
+	if (!new_skb) {
+		bt_dev_err(hdev, "Failed to allocate memory for skb of len: %u",
+			   skb->len);
+		ret = -ENOMEM;
+		goto exit_error;
+	}
+
+	hci_skb_pkt_type(new_skb) = pkt_type;
+	skb_put_data(new_skb, skb->data, plen);
+	hdev->stat.byte_rx += plen;
+
+	if (pcie_pkt_type == BTINTEL_PCIE_HCI_EVT_PKT)
+		ret = btintel_recv_event(hdev, new_skb);
+	else
+		ret = hci_recv_frame(hdev, new_skb);
+
+exit_error:
+	if (ret)
+		hdev->stat.err_rx++;
+
+	spin_unlock(&data->hci_rx_lock);
+
+	return ret;
+}
+
+static void btintel_pcie_rx_work(struct work_struct *work)
+{
+	struct btintel_pcie_data *data = container_of(work,
+					struct btintel_pcie_data, rx_work);
+	struct sk_buff *skb;
+	int err;
+	struct hci_dev *hdev = data->hdev;
+
+	/* Process the sk_buf in queue and send to the HCI layer */
+	while ((skb = skb_dequeue(&data->rx_skb_q))) {
+		err = btintel_pcie_hci_recv_frame(data, skb);
+		if (err)
+			bt_dev_err(hdev, "Failed to send received frame: %d",
+				   err);
+		kfree_skb(skb);
+	}
+}
+
+/* create sk_buff with data and save it to queue and start RX work */
+static int btintel_pcie_submit_rx_work(struct btintel_pcie_data *data, u8 status,
+				       void *buf)
+{
+	int ret, len;
+	struct rfh_hdr *rfh_hdr;
+	struct sk_buff *skb;
+
+	rfh_hdr = buf;
+
+	len = rfh_hdr->packet_len;
+	if (len <= 0) {
+		ret = -EINVAL;
+		goto resubmit;
+	}
+
+	/* Remove RFH header */
+	buf += sizeof(*rfh_hdr);
+
+	skb = alloc_skb(len, GFP_ATOMIC);
+	if (!skb) {
+		ret = -ENOMEM;
+		goto resubmit;
+	}
+
+	skb_put_data(skb, buf, len);
+	skb_queue_tail(&data->rx_skb_q, skb);
+	queue_work(data->workqueue, &data->rx_work);
+
+resubmit:
+	ret = btintel_pcie_submit_rx(data);
+
+	return ret;
+}
+
+/* Handles the MSI-X interrupt for rx queue 1 which is for RX */
+static void btintel_pcie_msix_rx_handle(struct btintel_pcie_data *data)
+{
+	u16 cr_hia, cr_tia;
+	struct rxq *rxq;
+	struct urbd1 *urbd1;
+	struct frbd *frbd;
+	struct data_buf *buf;
+	int ret;
+	struct hci_dev *hdev = data->hdev;
+
+	cr_hia = data->ia.cr_hia[BTINTEL_PCIE_RXQ_NUM];
+	cr_tia = data->ia.cr_tia[BTINTEL_PCIE_RXQ_NUM];
+
+	bt_dev_dbg(hdev, "RXQ: cr_hia: %u  cr_tia: %u", cr_hia, cr_tia);
+
+	/* Check CR_TIA and CR_HIA for change */
+	if (cr_tia == cr_hia) {
+		bt_dev_warn(hdev, "RXQ: no new CD found");
+		return;
+	}
+
+	rxq = &data->rxq;
+
+	/* The firmware sends multiple CD in a single MSI-X and it needs to
+	 * process all received CDs in this interrupt.
+	 */
+	while (cr_tia != cr_hia) {
+		urbd1 = &rxq->urbd1s[cr_tia];
+		ipc_print_urbd1(data->hdev, urbd1, cr_tia);
+
+		frbd = &rxq->frbds[urbd1->frbd_tag];
+
+		buf = &rxq->bufs[urbd1->frbd_tag];
+		if (!buf) {
+			bt_dev_err(hdev, "RXQ: failed to get the DMA buffer for %d",
+				   urbd1->frbd_tag);
+			return;
+		}
+
+		ret = btintel_pcie_submit_rx_work(data, urbd1->status,
+						  buf->data);
+		if (ret) {
+			bt_dev_err(hdev, "RXQ: failed to submit rx request");
+			return;
+		}
+
+		cr_tia = (cr_tia + 1) % rxq->count;
+		data->ia.cr_tia[BTINTEL_PCIE_RXQ_NUM] = cr_tia;
+		ipc_print_ia_ring(data->hdev, &data->ia, BTINTEL_PCIE_RXQ_NUM);
+	}
+}
+
+static irqreturn_t btintel_pcie_msix_isr(int irq, void *data)
+{
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t btintel_pcie_irq_msix_handler(int irq, void *dev_id)
+{
+	struct msix_entry *entry = dev_id;
+	struct btintel_pcie_data *data = btintel_pcie_get_data(entry);
+	u32 intr_fh, intr_hw;
+
+	spin_lock(&data->irq_lock);
+	intr_fh = btintel_pcie_rd_reg32(data, BTINTEL_PCIE_CSR_MSIX_FH_INT_CAUSES);
+	intr_hw = btintel_pcie_rd_reg32(data, BTINTEL_PCIE_CSR_MSIX_HW_INT_CAUSES);
+
+	/* Clear causes registers to avoid being handling the same cause */
+	btintel_pcie_wr_reg32(data, BTINTEL_PCIE_CSR_MSIX_FH_INT_CAUSES, intr_fh);
+	btintel_pcie_wr_reg32(data, BTINTEL_PCIE_CSR_MSIX_HW_INT_CAUSES, intr_hw);
+	spin_unlock(&data->irq_lock);
+
+	if (unlikely(!(intr_fh | intr_hw))) {
+		/* Ignore interrupt, inta == 0 */
+		return IRQ_NONE;
+	}
+
+	/* This interrupt is triggered by the firmware after updating
+	 * boot_stage register and image_response register
+	 */
+	if (intr_hw & BTINTEL_PCIE_MSIX_HW_INT_CAUSES_GP0)
+		btintel_pcie_msix_gp0_handler(data);
+
+	/* For TX */
+	if (intr_fh & BTINTEL_PCIE_MSIX_FH_INT_CAUSES_0)
+		btintel_pcie_msix_tx_handle(data);
+
+	/* For RX */
+	if (intr_fh & BTINTEL_PCIE_MSIX_FH_INT_CAUSES_1)
+		btintel_pcie_msix_rx_handle(data);
+
+	/*
+	 * Before sending the interrupt the HW disables it to prevent a nested
+	 * interrupt. This is done by writing 1 to the corresponding bit in
+	 * the mask register. After handling the interrupt, it should be
+	 * re-enabled by clearing this bit. This register is defined as write 1
+	 * clear (W1C) register, meaning that it's cleared by writing 1
+	 * to the bit.
+	 */
+	btintel_pcie_wr_reg32(data, BTINTEL_PCIE_CSR_MSIX_AUTOMASK_ST,
+			      BIT(entry->entry));
+
+	return IRQ_HANDLED;
+}
+
+/* This function requests the irq for MSI-X and registers the handlers per irq.
+ * Currently, it requests only 1 irq for all interrupt causes.
+ */
+static int btintel_pcie_setup_irq(struct btintel_pcie_data *data)
+{
+	int err;
+	int num_irqs, i;
+
+	for (i = 0; i < BTINTEL_PCIE_MSIX_VEC_MAX; i++)
+		data->msix_entries[i].entry = i;
+
+	num_irqs = pci_alloc_irq_vectors(data->pdev, BTINTEL_PCIE_MSIX_VEC_MIN,
+					 BTINTEL_PCIE_MSIX_VEC_MAX, PCI_IRQ_MSIX);
+	if (num_irqs < 0)
+		return num_irqs;
+
+	data->alloc_vecs = num_irqs;
+	data->msix_enabled = 1;
+	data->def_irq = 0;
+
+	/* setup irq handler */
+	for (i = 0; i < data->alloc_vecs; i++) {
+		struct msix_entry *msix_entry;
+
+		msix_entry = &data->msix_entries[i];
+		msix_entry->vector = pci_irq_vector(data->pdev, i);
+
+		err = devm_request_threaded_irq(&data->pdev->dev,
+						msix_entry->vector,
+						btintel_pcie_msix_isr,
+						btintel_pcie_irq_msix_handler,
+						IRQF_SHARED,
+						KBUILD_MODNAME,
+						msix_entry);
+		if (err) {
+			pci_free_irq_vectors(data->pdev);
+			data->alloc_vecs = 0;
+			return err;
+		}
+	}
+	return 0;
+}
+
+struct btintel_pcie_causes_list {
+	u32 cause;
+	u32 mask_reg;
+	u8 cause_num;
+};
+
+struct btintel_pcie_causes_list causes_list[] = {
+	{ BTINTEL_PCIE_MSIX_FH_INT_CAUSES_0,	BTINTEL_PCIE_CSR_MSIX_FH_INT_MASK,	0x00 },
+	{ BTINTEL_PCIE_MSIX_FH_INT_CAUSES_1,	BTINTEL_PCIE_CSR_MSIX_FH_INT_MASK,	0x01 },
+	{ BTINTEL_PCIE_MSIX_HW_INT_CAUSES_GP0, BTINTEL_PCIE_CSR_MSIX_HW_INT_MASK,	0x20 },
+};
+
+/* This function configures the interrupt masks for both HW_INT_CAUSES and
+ * FH_INT_CAUSES which are meaningful to us.
+ *
+ * After resetting BT function via PCIE FLR or FUNC_CTRL reset, the driver
+ * need to call this function again to configure since the masks
+ * are reset to 0xFFFFFFFF after reset.
+ */
+static void btintel_pcie_config_msix(struct btintel_pcie_data *data)
+{
+	int i;
+	int val = data->def_irq | BTINTEL_PCIE_MSIX_NON_AUTO_CLEAR_CAUSE;
+
+	/* Set Non Auto Clear Cause */
+	for (i = 0; i < ARRAY_SIZE(causes_list); i++) {
+		btintel_pcie_wr_reg8(data,
+				     BTINTEL_PCIE_CSR_MSIX_IVAR(causes_list[i].cause_num),
+				     val);
+		btintel_pcie_clr_reg_bits(data,
+					  causes_list[i].mask_reg,
+					  causes_list[i].cause);
+	}
+
+	/* Save the initial interrupt mask */
+	data->fh_init_mask = ~btintel_pcie_rd_reg32(data, BTINTEL_PCIE_CSR_MSIX_FH_INT_MASK);
+	data->hw_init_mask = ~btintel_pcie_rd_reg32(data, BTINTEL_PCIE_CSR_MSIX_HW_INT_MASK);
+}
+
+static int btintel_pcie_config_pcie(struct pci_dev *pdev,
+				    struct btintel_pcie_data *data)
+{
+	int err;
+
+	err = pcim_enable_device(pdev);
+	if (err)
+		return err;
+
+	pci_set_master(pdev);
+
+	err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+	if (err) {
+		err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+		if (err)
+			return err;
+	}
+
+	err = pcim_iomap_regions(pdev, BIT(0), KBUILD_MODNAME);
+	if (err)
+		return err;
+
+	data->base_addr = pcim_iomap_table(pdev)[0];
+	if (!data->base_addr)
+		return -ENODEV;
+
+	err = btintel_pcie_setup_irq(data);
+	if (err)
+		return err;
+
+	/* Configure MSI-X with causes list */
+	btintel_pcie_config_msix(data);
+
+	return 0;
+}
+
+static void btintel_pcie_init_ci(struct btintel_pcie_data *data,
+				 struct ctx_info *ci)
+{
+	ci->version = 0x1;
+	ci->size = sizeof(*ci);
+	ci->config = 0x0000;
+	ci->addr_cr_hia = data->ia.cr_hia_p_addr;
+	ci->addr_tr_tia = data->ia.tr_tia_p_addr;
+	ci->addr_cr_tia = data->ia.cr_tia_p_addr;
+	ci->addr_tr_hia = data->ia.tr_hia_p_addr;
+	ci->num_cr_ia = BTINTEL_PCIE_NUM_QUEUES;
+	ci->num_tr_ia = BTINTEL_PCIE_NUM_QUEUES;
+	ci->addr_urbdq0 = data->txq.urbd0s_p_addr;
+	ci->addr_tfdq = data->txq.tfds_p_addr;
+	ci->num_tfdq = data->txq.count;
+	ci->num_urbdq0 = data->txq.count;
+	ci->tfdq_db_vec = BTINTEL_PCIE_TXQ_NUM;
+	ci->urbdq0_db_vec = BTINTEL_PCIE_TXQ_NUM;
+	ci->rbd_size = BTINTEL_PCIE_RBD_SIZE_4K;
+	ci->addr_frbdq = data->rxq.frbds_p_addr;
+	ci->num_frbdq = data->rxq.count;
+	ci->frbdq_db_vec = BTINTEL_PCIE_RXQ_NUM;
+	ci->addr_urbdq1 = data->rxq.urbd1s_p_addr;
+	ci->num_urbdq1 = data->rxq.count;
+	ci->urbdq_db_vec = BTINTEL_PCIE_RXQ_NUM;
+}
+
+static void btintel_pcie_free_txq_bufs(struct btintel_pcie_data *data,
+				       struct txq *txq)
+{
+	/* Free data buffers first */
+	dma_free_coherent(&data->pdev->dev, txq->count * BTINTEL_PCIE_BUFFER_SIZE,
+			  txq->buf_v_addr, txq->buf_p_addr);
+	kfree(txq->bufs);
+}
+
+static int btintel_pcie_setup_txq_bufs(struct btintel_pcie_data *data,
+				       struct txq *txq)
+{
+	int i;
+	struct data_buf *buf;
+
+	/* Allocate the same number of buffers as the descriptor */
+	txq->bufs = kmalloc_array(txq->count, sizeof(*buf), GFP_KERNEL);
+	if (!txq->bufs)
+		return -ENOMEM;
+
+	/* Allocate full chunk of data buffer for DMA first and do indexing and
+	 * initialization next, so it can be freed easily
+	 */
+	txq->buf_v_addr = dma_alloc_coherent(&data->pdev->dev,
+					     txq->count * BTINTEL_PCIE_BUFFER_SIZE,
+					     &txq->buf_p_addr,
+					     GFP_KERNEL | __GFP_NOWARN);
+	if (!txq->buf_v_addr) {
+		kfree(txq->bufs);
+		return -ENOMEM;
+	}
+	memset(txq->buf_v_addr, 0, txq->count * BTINTEL_PCIE_BUFFER_SIZE);
+
+	/* Setup the allocated DMA buffer to bufs. Each data_buf should
+	 * have virtual address and physical address
+	 */
+	for (i = 0; i < txq->count; i++) {
+		buf = &txq->bufs[i];
+		buf->data_p_addr = txq->buf_p_addr + (i * BTINTEL_PCIE_BUFFER_SIZE);
+		buf->data = txq->buf_v_addr + (i * BTINTEL_PCIE_BUFFER_SIZE);
+	}
+
+	return 0;
+}
+
+static void btintel_pcie_free_rxq_bufs(struct btintel_pcie_data *data,
+				       struct rxq *rxq)
+{
+	/* Free data buffers first */
+	dma_free_coherent(&data->pdev->dev, rxq->count * BTINTEL_PCIE_BUFFER_SIZE,
+			  rxq->buf_v_addr, rxq->buf_p_addr);
+	kfree(rxq->bufs);
+}
+
+static int btintel_pcie_setup_rxq_bufs(struct btintel_pcie_data *data,
+				       struct rxq *rxq)
+{
+	int i;
+	struct data_buf *buf;
+
+	/* Allocate the same number of buffers as the descriptor */
+	rxq->bufs = kmalloc_array(rxq->count, sizeof(*buf), GFP_KERNEL);
+	if (!rxq->bufs)
+		return -ENOMEM;
+
+	/* Allocate full chunk of data buffer for DMA first and do indexing and
+	 * initialization next, so it can be freed easily
+	 */
+	rxq->buf_v_addr = dma_alloc_coherent(&data->pdev->dev,
+					     rxq->count * BTINTEL_PCIE_BUFFER_SIZE,
+					     &rxq->buf_p_addr,
+					     GFP_KERNEL | __GFP_NOWARN);
+	if (!rxq->buf_v_addr) {
+		kfree(rxq->bufs);
+		return -ENOMEM;
+	}
+	memset(rxq->buf_v_addr, 0, rxq->count * BTINTEL_PCIE_BUFFER_SIZE);
+
+	/* Setup the allocated DMA buffer to bufs. Each data_buf should
+	 * have virtual address and physical address
+	 */
+	for (i = 0; i < rxq->count; i++) {
+		buf = &rxq->bufs[i];
+		buf->data_p_addr = rxq->buf_p_addr + (i * BTINTEL_PCIE_BUFFER_SIZE);
+		buf->data = rxq->buf_v_addr + (i * BTINTEL_PCIE_BUFFER_SIZE);
+	}
+
+	return 0;
+}
+
+static void btintel_pcie_setup_ia(struct btintel_pcie_data *data,
+				  dma_addr_t p_addr, void *v_addr,
+				  struct ia *ia)
+{
+	/* TR Head Index Array */
+	ia->tr_hia_p_addr = p_addr;
+	ia->tr_hia = v_addr;
+
+	/* TR Tail Index Array */
+	ia->tr_tia_p_addr = p_addr + sizeof(u16) * BTINTEL_PCIE_NUM_QUEUES;
+	ia->tr_tia = v_addr + sizeof(u16) * BTINTEL_PCIE_NUM_QUEUES;
+
+	/* CR Head index Array */
+	ia->cr_hia_p_addr = p_addr + (sizeof(u16) * BTINTEL_PCIE_NUM_QUEUES * 2);
+	ia->cr_hia = v_addr + (sizeof(u16) * BTINTEL_PCIE_NUM_QUEUES * 2);
+
+	/* CR Tail Index Array */
+	ia->cr_tia_p_addr = p_addr + (sizeof(u16) * BTINTEL_PCIE_NUM_QUEUES * 3);
+	ia->cr_tia = v_addr + (sizeof(u16) * BTINTEL_PCIE_NUM_QUEUES * 3);
+}
+
+static void btintel_pcie_free(struct btintel_pcie_data *data)
+{
+	btintel_pcie_free_rxq_bufs(data, &data->rxq);
+	btintel_pcie_free_txq_bufs(data, &data->txq);
+
+	dma_pool_free(data->dma_pool, data->dma_v_addr, data->dma_p_addr);
+	dma_pool_destroy(data->dma_pool);
+}
+
+/* Allocate tx and rx queues, any related data structures and buffers.
+ */
+static int btintel_pcie_alloc(struct btintel_pcie_data *data)
+{
+	int err = 0;
+	size_t total;
+	dma_addr_t p_addr;
+	void *v_addr;
+
+	/* Allocate the chunk of DMA memory for descriptors, index array, and
+	 * context information, instead of allocating individually.
+	 * The DMA memory for data buffer is allocated while setting up the
+	 * each queue.
+	 *
+	 * Total size is sum of the following
+	 *  + size of TFD * Number of descriptors in queue
+	 *  + size of URBD0 * Number of descriptors in queue
+	 *  + size of FRBD * Number of descriptors in queue
+	 *  + size of URBD1 * Number of descriptors in queue
+	 *  + size of index * Number of queues(2) * type of index array(4)
+	 *  + size of context information
+	 */
+	total = (sizeof(struct tfd) + sizeof(struct urbd0) + sizeof(struct frbd)
+		+ sizeof(struct urbd1)) * BTINTEL_DESCS_COUNT;
+
+	/* Add the sum of size of index array and size of ci struct */
+	total += (sizeof(u16) * BTINTEL_PCIE_NUM_QUEUES * 4) + sizeof(struct ctx_info);
+
+	/* Allocate DMA Pool */
+	data->dma_pool = dma_pool_create(KBUILD_MODNAME, &data->pdev->dev,
+					 total, BTINTEL_PCIE_DMA_POOL_ALIGNMENT, 0);
+	if (!data->dma_pool) {
+		err = -ENOMEM;
+		goto exit_error;
+	}
+
+	v_addr = dma_pool_zalloc(data->dma_pool, GFP_KERNEL | __GFP_NOWARN,
+				 &p_addr);
+	if (!v_addr) {
+		dma_pool_destroy(data->dma_pool);
+		err = -ENOMEM;
+		goto exit_error;
+	}
+
+	data->dma_p_addr = p_addr;
+	data->dma_v_addr = v_addr;
+
+	/* Setup descriptor count */
+	data->txq.count = BTINTEL_DESCS_COUNT;
+	data->rxq.count = BTINTEL_DESCS_COUNT;
+
+	/* Setup tfds */
+	data->txq.tfds_p_addr = p_addr;
+	data->txq.tfds = v_addr;
+
+	p_addr += (sizeof(struct tfd) * BTINTEL_DESCS_COUNT);
+	v_addr += (sizeof(struct tfd) * BTINTEL_DESCS_COUNT);
+
+	/* Setup urbd0 */
+	data->txq.urbd0s_p_addr = p_addr;
+	data->txq.urbd0s = v_addr;
+
+	p_addr += (sizeof(struct urbd0) * BTINTEL_DESCS_COUNT);
+	v_addr += (sizeof(struct urbd0) * BTINTEL_DESCS_COUNT);
+
+	/* Setup FRBD*/
+	data->rxq.frbds_p_addr = p_addr;
+	data->rxq.frbds = v_addr;
+
+	p_addr += (sizeof(struct frbd) * BTINTEL_DESCS_COUNT);
+	v_addr += (sizeof(struct frbd) * BTINTEL_DESCS_COUNT);
+
+	/* Setup urbd1 */
+	data->rxq.urbd1s_p_addr = p_addr;
+	data->rxq.urbd1s = v_addr;
+
+	p_addr += (sizeof(struct urbd1) * BTINTEL_DESCS_COUNT);
+	v_addr += (sizeof(struct urbd1) * BTINTEL_DESCS_COUNT);
+
+	/* Setup data buffers for txq */
+	err = btintel_pcie_setup_txq_bufs(data, &data->txq);
+	if (err)
+		goto exit_error_pool;
+
+	/* Setup data buffers for rxq */
+	err = btintel_pcie_setup_rxq_bufs(data, &data->rxq);
+	if (err)
+		goto exit_error_txq;
+
+	/* Setup Index Array */
+	btintel_pcie_setup_ia(data, p_addr, v_addr, &data->ia);
+
+	/* Setup Context Information */
+	p_addr += sizeof(u16) * BTINTEL_PCIE_NUM_QUEUES * 4;
+	v_addr += sizeof(u16) * BTINTEL_PCIE_NUM_QUEUES * 4;
+
+	data->ci = v_addr;
+	data->ci_p_addr = p_addr;
+
+	/* Initialize the CI */
+	btintel_pcie_init_ci(data, data->ci);
+
+	return 0;
+
+exit_error_txq:
+	btintel_pcie_free_txq_bufs(data, &data->txq);
+exit_error_pool:
+	dma_pool_free(data->dma_pool, data->dma_v_addr, data->dma_p_addr);
+	dma_pool_destroy(data->dma_pool);
+exit_error:
+	return err;
+}
+
+static void btintel_pcie_release_hdev(struct btintel_pcie_data *data)
+{
+	/* TODO: Unregister and release hdev */
+}
+
+static int btintel_pcie_setup_hdev(struct btintel_pcie_data *data)
+{
+	/* TODO: initialize hdev and assign the callbacks to hdev */
+	return -ENODEV;
+}
+
+static int btintel_pcie_probe(struct pci_dev *pdev,
+			      const struct pci_device_id *ent)
+{
+	int err;
+	struct btintel_pcie_data *data;
+
+	if (!pdev)
+		return -ENODEV;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->pdev = pdev;
+
+	spin_lock_init(&data->irq_lock);
+	spin_lock_init(&data->hci_rx_lock);
+
+	init_waitqueue_head(&data->gp0_wait_q);
+	data->gp0_received = false;
+
+	init_waitqueue_head(&data->tx_wait_q);
+	data->tx_wait_done = false;
+
+	data->workqueue = alloc_ordered_workqueue(KBUILD_MODNAME, WQ_HIGHPRI);
+	if (!data->workqueue)
+		return -ENOMEM;
+
+	skb_queue_head_init(&data->rx_skb_q);
+	INIT_WORK(&data->rx_work, btintel_pcie_rx_work);
+
+	data->boot_stage_cache = 0x00;
+	data->img_resp_cache = 0x00;
+
+	err = btintel_pcie_config_pcie(pdev, data);
+	if (err)
+		goto exit_error;
+
+	pci_set_drvdata(pdev, data);
+
+	err = btintel_pcie_alloc(data);
+	if (err)
+		goto exit_error;
+
+	err = btintel_pcie_enable_bt(data);
+	if (err)
+		goto exit_error;
+
+	/* CNV information (CNVi and CNVr) is in CSR */
+	data->cnvi = btintel_pcie_rd_reg32(data, BTINTEL_PCIE_CSR_HW_REV_REG);
+
+	data->cnvr = btintel_pcie_rd_reg32(data, BTINTEL_PCIE_CSR_RF_ID_REG);
+
+	err = btintel_pcie_start_rx(data);
+	if (err)
+		goto exit_error;
+
+	err = btintel_pcie_setup_hdev(data);
+	if (err)
+		goto exit_error;
+
+	bt_dev_dbg(data->hdev, "cnvi: 0x%8.8x cnvr: 0x%8.8x", data->cnvi,
+		   data->cnvr);
+	return 0;
+
+exit_error:
+	/* reset device before exit */
+	btintel_pcie_reset_bt(data);
+
+	pci_clear_master(pdev);
+
+	pci_set_drvdata(pdev, NULL);
+
+	return err;
+}
+
+static void btintel_pcie_remove(struct pci_dev *pdev)
+{
+	struct btintel_pcie_data *data;
+
+	data = pci_get_drvdata(pdev);
+
+	btintel_pcie_reset_bt(data);
+
+	pci_free_irq_vectors(pdev);
+
+	btintel_pcie_release_hdev(data);
+
+	flush_work(&data->rx_work);
+
+	destroy_workqueue(data->workqueue);
+
+	btintel_pcie_free(data);
+
+	pci_clear_master(pdev);
+
+	pci_set_drvdata(pdev, NULL);
+}
+
+static struct pci_driver btintel_pcie_driver = {
+	.name = KBUILD_MODNAME,
+	.id_table = btintel_pcie_table,
+	.probe = btintel_pcie_probe,
+	.remove = btintel_pcie_remove,
+};
+module_pci_driver(btintel_pcie_driver);
+
+MODULE_AUTHOR("Tedd Ho-Jeong An <tedd.an@intel.com>");
+MODULE_DESCRIPTION("Intel Bluetooth PCIe transport driver ver " VERSION);
+MODULE_VERSION(VERSION);
+MODULE_LICENSE("GPL");
diff --git a/drivers/bluetooth/btintel_pcie.h b/drivers/bluetooth/btintel_pcie.h
new file mode 100644
index 000000000000..f925dfb23cfc
--- /dev/null
+++ b/drivers/bluetooth/btintel_pcie.h
@@ -0,0 +1,425 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *
+ *  Bluetooth support for Intel PCIe devices
+ *
+ *  Copyright (C) 2024  Intel Corporation
+ */
+
+/* Control and Status Register(BTINTEL_PCIE_CSR) */
+#define BTINTEL_PCIE_CSR_BASE			(0x000)
+#define BTINTEL_PCIE_CSR_FUNC_CTRL_REG		(BTINTEL_PCIE_CSR_BASE + 0x024)
+#define BTINTEL_PCIE_CSR_HW_REV_REG		(BTINTEL_PCIE_CSR_BASE + 0x028)
+#define BTINTEL_PCIE_CSR_RF_ID_REG		(BTINTEL_PCIE_CSR_BASE + 0x09C)
+#define BTINTEL_PCIE_CSR_BOOT_STAGE_REG		(BTINTEL_PCIE_CSR_BASE + 0x108)
+#define BTINTEL_PCIE_CSR_CI_ADDR_LSB_REG	(BTINTEL_PCIE_CSR_BASE + 0x118)
+#define BTINTEL_PCIE_CSR_CI_ADDR_MSB_REG	(BTINTEL_PCIE_CSR_BASE + 0x11C)
+#define BTINTEL_PCIE_CSR_IMG_RESPONSE_REG	(BTINTEL_PCIE_CSR_BASE + 0x12C)
+#define BTINTEL_PCIE_CSR_HBUS_TARG_WRPTR	(BTINTEL_PCIE_CSR_BASE + 0x460)
+
+/* BTINTEL_PCIE_CSR Function Control Register */
+#define BTINTEL_PCIE_CSR_FUNC_CTRL_FUNC_ENA		(BIT(0))
+#define BTINTEL_PCIE_CSR_FUNC_CTRL_MAC_INIT		(BIT(6))
+#define BTINTEL_PCIE_CSR_FUNC_CTRL_FUNC_INIT		(BIT(7))
+#define BTINTEL_PCIE_CSR_FUNC_CTRL_MAC_ACCESS_STS	(BIT(20))
+#define BTINTEL_PCIE_CSR_FUNC_CTRL_SW_RESET		(BIT(31))
+
+/* Value for BTINTEL_PCIE_CSR_BOOT_STAGE register */
+#define BTINTEL_PCIE_CSR_BOOT_STAGE_ROM		(BIT(0))
+#define BTINTEL_PCIE_CSR_BOOT_STAGE_IML		(BIT(1))
+#define BTINTEL_PCIE_CSR_BOOT_STAGE_OPFW		(BIT(2))
+#define BTINTEL_PCIE_CSR_BOOT_STAGE_ROM_LOCKDOWN	(BIT(10))
+#define BTINTEL_PCIE_CSR_BOOT_STAGE_IML_LOCKDOWN	(BIT(11))
+#define BTINTEL_PCIE_CSR_BOOT_STAGE_MAC_ACCESS_ON	(BIT(16))
+#define BTINTEL_PCIE_CSR_BOOT_STAGE_ALIVE		(BIT(23))
+
+/* Registers for MSI-X */
+#define BTINTEL_PCIE_CSR_MSIX_BASE		(0x2000)
+#define BTINTEL_PCIE_CSR_MSIX_FH_INT_CAUSES	(BTINTEL_PCIE_CSR_MSIX_BASE + 0x0800)
+#define BTINTEL_PCIE_CSR_MSIX_FH_INT_MASK	(BTINTEL_PCIE_CSR_MSIX_BASE + 0x0804)
+#define BTINTEL_PCIE_CSR_MSIX_HW_INT_CAUSES	(BTINTEL_PCIE_CSR_MSIX_BASE + 0x0808)
+#define BTINTEL_PCIE_CSR_MSIX_HW_INT_MASK	(BTINTEL_PCIE_CSR_MSIX_BASE + 0x080C)
+#define BTINTEL_PCIE_CSR_MSIX_AUTOMASK_ST	(BTINTEL_PCIE_CSR_MSIX_BASE + 0x0810)
+#define BTINTEL_PCIE_CSR_MSIX_AUTOMASK_EN	(BTINTEL_PCIE_CSR_MSIX_BASE + 0x0814)
+#define BTINTEL_PCIE_CSR_MSIX_IVAR_BASE		(BTINTEL_PCIE_CSR_MSIX_BASE + 0x0880)
+#define BTINTEL_PCIE_CSR_MSIX_IVAR(cause)	(BTINTEL_PCIE_CSR_MSIX_IVAR_BASE + (cause))
+
+/* Causes for the FH register interrupts */
+enum msix_fh_int_causes {
+	BTINTEL_PCIE_MSIX_FH_INT_CAUSES_0	= BIT(0),	/* cause 0 */
+	BTINTEL_PCIE_MSIX_FH_INT_CAUSES_1	= BIT(1),	/* cause 1 */
+};
+
+/* Causes for the HW register interrupts */
+enum msix_hw_int_causes {
+	BTINTEL_PCIE_MSIX_HW_INT_CAUSES_GP0	= BIT(0),	/* cause 32 */
+};
+
+#define BTINTEL_PCIE_MSIX_NON_AUTO_CLEAR_CAUSE	BIT(7)
+
+/* Minimum and Maximum number of MSI-X Vector
+ * Intel Bluetooth PCIe support only 1 vector
+ */
+#define BTINTEL_PCIE_MSIX_VEC_MAX	1
+#define BTINTEL_PCIE_MSIX_VEC_MIN	1
+
+/* Default poll time for MAC access during init */
+#define BTINTEL_DEFAULT_MAC_ACCESS_TIMEOUT_US	200000
+
+/* Default interrupt timeout in msec */
+#define BTINTEL_DEFAULT_INTR_TIMEOUT	3000
+
+/* The number of descriptors in TX/RX queues */
+#define BTINTEL_DESCS_COUNT	16
+
+/* Number of Queue for TX and RX
+ * It indicates the index of the IA(Index Array)
+ */
+enum {
+	BTINTEL_PCIE_TXQ_NUM = 0,
+	BTINTEL_PCIE_RXQ_NUM = 1,
+	BTINTEL_PCIE_NUM_QUEUES = 2,
+};
+
+/* The size of DMA buffer for TX and RX in bytes */
+#define BTINTEL_PCIE_BUFFER_SIZE	4096
+
+/* DMA allocation alignment */
+#define BTINTEL_PCIE_DMA_POOL_ALIGNMENT	256
+
+/* Number of pending RX requests for downlink */
+#define BTINTEL_PCIE_RX_MAX_QUEUE	6
+
+/* Doorbell vector for FRBD */
+#define BTINTEL_PCIE_RX_DB_VEC	513
+
+/* RBD buffer size mapping */
+#define BTINTEL_PCIE_RBD_SIZE_4K	0x04
+
+/*
+ * Struct for Context Information (v2)
+ *
+ * All members are write-only for host and read-only for device.
+ *
+ * @version: Version of context information
+ * @size: Size of context information
+ * @config: Config with which host wants peripheral to execute
+ *	Subset of capability register published by device
+ * @addr_tr_hia: Address of TR Head Index Array
+ * @addr_tr_tia: Address of TR Tail Index Array
+ * @addr_cr_hia: Address of CR Head Index Array
+ * @addr_cr_tia: Address of CR Tail Index Array
+ * @num_tr_ia: Number of entries in TR Index Arrays
+ * @num_cr_ia: Number of entries in CR Index Arrays
+ * @rbd_siz: RBD Size { 0x4=4K }
+ * @addr_tfdq: Address of TFD Queue(tx)
+ * @addr_urbdq0: Address of URBD Queue(tx)
+ * @num_tfdq: Number of TFD in TFD Queue(tx)
+ * @num_urbdq0: Number of URBD in URBD Queue(tx)
+ * @tfdq_db_vec: Queue number of TFD
+ * @urbdq0_db_vec: Queue number of URBD
+ * @addr_frbdq: Address of FRBD Queue(rx)
+ * @addr_urbdq1: Address of URBD Queue(rx)
+ * @num_frbdq: Number of FRBD in FRBD Queue(rx)
+ * @frbdq_db_vec: Queue number of FRBD
+ * @num_urbdq1: Number of URBD in URBD Queue(rx)
+ * @urbdq_db_vec: Queue number of URBDQ1
+ * @tr_msi_vec: Transfer Ring MSI-X Vector
+ * @cr_msi_vec: Completion Ring MSI-X Vector
+ * @dbgc_addr: DBGC first fragment address
+ * @dbgc_size: DBGC buffer size
+ * @early_enable: Enarly debug enable
+ * @dbg_output_mode: Debug output mode
+ *	Bit[4] DBGC O/P { 0=SRAM, 1=DRAM(not relevant for NPK) }
+ *	Bit[5] DBGC I/P { 0=BDBG, 1=DBGI }
+ *	Bits[6:7] DBGI O/P(relevant if bit[5] = 1)
+ *	 0=BT DBGC, 1=WiFi DBGC, 2=NPK }
+ * @dbg_preset: Debug preset
+ * @ext_addr: Address of context information extension
+ * @ext_size: Size of context information part
+ *
+ * Total 38 DWords
+ */
+struct ctx_info {
+	u16	version;
+	u16	size;
+	u32	config;
+	u32	reserved_dw02;
+	u32	reserved_dw03;
+	u64	addr_tr_hia;
+	u64	addr_tr_tia;
+	u64	addr_cr_hia;
+	u64	addr_cr_tia;
+	u16	num_tr_ia;
+	u16	num_cr_ia;
+	u32	rbd_size:4,
+		reserved_dw13:28;
+	u64	addr_tfdq;
+	u64	addr_urbdq0;
+	u16	num_tfdq;
+	u16	num_urbdq0;
+	u16	tfdq_db_vec;
+	u16	urbdq0_db_vec;
+	u64	addr_frbdq;
+	u64	addr_urbdq1;
+	u16	num_frbdq;
+	u16	frbdq_db_vec;
+	u16	num_urbdq1;
+	u16	urbdq_db_vec;
+	u16	tr_msi_vec;
+	u16	cr_msi_vec;
+	u32	reserved_dw27;
+	u64	dbgc_addr;
+	u32	dbgc_size;
+	u32	early_enable:1,
+		reserved_dw31:3,
+		dbg_output_mode:4,
+		dbg_preset:8,
+		reserved2_dw31:16;
+	u64	ext_addr;
+	u32	ext_size;
+	u32	test_param;
+	u32	reserved_dw36;
+	u32	reserved_dw37;
+} __packed;
+
+/* Transfer Descriptor for TX
+ * @type: Not in use. Set to 0x0
+ * @size: Size of data in the buffer
+ * @addr: DMA Address of buffer
+ */
+struct tfd {
+	u8	type;
+	u16	size;
+	u8	reserved;
+	u64	addr;
+	u32	reserved1;
+} __packed;
+
+/* URB Descriptor for TX
+ * @tfd_index: Index of TFD in TFDQ + 1
+ * @num_txq: Queue index of TFD Queue
+ * @cmpl_count: Completion count. Always 0x01
+ * @immediate_cmpl: Immediate completion flag: Always 0x01
+ */
+struct urbd0 {
+	u32	tfd_index:16,
+		num_txq:8,
+		cmpl_count:4,
+		reserved:3,
+		immediate_cmpl:1;
+} __packed;
+
+/* FRB Descriptor for RX
+ * @tag: RX buffer tag (index of RX buffer queue)
+ * @addr: Address of buffer
+ */
+struct frbd {
+	u32	tag:16,
+		reserved:16;
+	u32	reserved2;
+	u64	addr;
+} __packed;
+
+/* URB Descriptor for RX
+ * @frbd_tag: Tag from FRBD
+ * @status: Status
+ */
+struct urbd1 {
+	u32	frbd_tag:16,
+		status:1,
+		reserved:14,
+		fixed:1;
+} __packed;
+
+/* RFH header in RX packet
+ * @packet_len: Length of the data in the buffer
+ * @rxq: RX Queue number
+ * @cmd_id: Command ID. Not in Use
+ */
+struct rfh_hdr {
+	u64	packet_len:16,
+		rxq:6,
+		reserved:10,
+		cmd_id:16,
+		reserved1:16;
+} __packed;
+
+/* Internal data buffer
+ * @data: pointer to the data buffer
+ * @p_addr: physical address of data buffer
+ */
+struct data_buf {
+	u8		*data;
+	dma_addr_t	data_p_addr;
+};
+
+/* Index Array */
+struct ia {
+	dma_addr_t	tr_hia_p_addr;
+	u16		*tr_hia;
+	dma_addr_t	tr_tia_p_addr;
+	u16		*tr_tia;
+	dma_addr_t	cr_hia_p_addr;
+	u16		*cr_hia;
+	dma_addr_t	cr_tia_p_addr;
+	u16		*cr_tia;
+};
+
+/* Structure for TX Queue
+ * @count: Number of descriptors
+ * @tfds: Array of TFD
+ * @urbd0s: Array of URBD0
+ * @buf: Array of data_buf structure
+ */
+struct txq {
+	u16		count;
+
+	dma_addr_t	tfds_p_addr;
+	struct tfd	*tfds;
+
+	dma_addr_t	urbd0s_p_addr;
+	struct urbd0	*urbd0s;
+
+	dma_addr_t	buf_p_addr;
+	void		*buf_v_addr;
+	struct data_buf	*bufs;
+};
+
+/* Structure for RX Queue
+ * @count: Number of descriptors
+ * @frbds: Array of FRBD
+ * @urbd1s: Array of URBD1
+ * @buf: Array of data_buf structure
+ */
+struct rxq {
+	u16		count;
+
+	dma_addr_t	frbds_p_addr;
+	struct frbd	*frbds;
+
+	dma_addr_t	urbd1s_p_addr;
+	struct urbd1	*urbd1s;
+
+	dma_addr_t	buf_p_addr;
+	void		*buf_v_addr;
+	struct data_buf	*bufs;
+};
+
+/* struct btintel_pcie_data
+ * @pdev: pci device
+ * @hdev: hdev device
+ * @flags: driver state
+ * @irq_lock: spinlock for MSI-X
+ * @hci_rx_lock: spinlock for HCI RX flow
+ * @base_addr: pci base address (from BAR)
+ * @msix_entries: array of MSI-X entries
+ * @msix_enabled: true if MSI-X is enabled;
+ * @alloc_vecs: number of interrupt vectors allocated
+ * @def_irq: default irq for all causes
+ * @fh_init_mask: initial unmasked rxq causes
+ * @hw_init_mask: initial unmaksed hw causes
+ * @boot_stage_cache: cached value of boot stage register
+ * @img_resp_cache: cached value of image response register
+ * @cnvi: CNVi register value
+ * @cnvr: CNVr register value
+ * @gp0_received: condition for gp0 interrupt
+ * @gp0_wait_q: wait_q for gp0 interrupt
+ * @tx_wait_done: condition for tx interrupt
+ * @tx_wait_q: wait_q for tx interrupt
+ * @workqueue: workqueue for RX work
+ * @rx_skb_q: SKB queue for RX packet
+ * @rx_work: RX work struct to process the RX packet in @rx_skb_q
+ * @dma_pool: DMA pool for descriptors, index array and ci
+ * @dma_p_addr: DMA address for pool
+ * @dma_v_addr: address of pool
+ * @ci_p_addr: DMA address for CI struct
+ * @ci: CI struct
+ * @ia: Index Array struct
+ * @txq: TX Queue struct
+ * @rxq: RX Queue struct
+ */
+struct btintel_pcie_data {
+	struct pci_dev	*pdev;
+	struct hci_dev	*hdev;
+
+	unsigned long	flags;
+	/* lock used in MSI-X interrupt */
+	spinlock_t	irq_lock;
+	/* lock to serialize rx events */
+	spinlock_t	hci_rx_lock;
+
+	void __iomem	*base_addr;
+
+	struct msix_entry	msix_entries[BTINTEL_PCIE_MSIX_VEC_MAX];
+	bool	msix_enabled;
+	u32	alloc_vecs;
+	u32	def_irq;
+
+	u32	fh_init_mask;
+	u32	hw_init_mask;
+
+	u32	boot_stage_cache;
+	u32	img_resp_cache;
+
+	u32	cnvi;
+	u32	cnvr;
+
+	bool	gp0_received;
+	wait_queue_head_t	gp0_wait_q;
+
+	bool	tx_wait_done;
+	wait_queue_head_t	tx_wait_q;
+
+	struct workqueue_struct	*workqueue;
+	struct sk_buff_head	rx_skb_q;
+	struct work_struct	rx_work;
+
+	struct dma_pool	*dma_pool;
+	dma_addr_t	dma_p_addr;
+	void		*dma_v_addr;
+
+	dma_addr_t	ci_p_addr;
+	struct ctx_info	*ci;
+	struct ia	ia;
+	struct txq	txq;
+	struct rxq	rxq;
+};
+
+static inline u32 btintel_pcie_rd_reg32(struct btintel_pcie_data *data,
+					u32 offset)
+{
+	return ioread32(data->base_addr + offset);
+}
+
+static inline void btintel_pcie_wr_reg8(struct btintel_pcie_data *data,
+					u32 offset, u8 val)
+{
+	iowrite8(val, data->base_addr + offset);
+}
+
+static inline void btintel_pcie_wr_reg32(struct btintel_pcie_data *data,
+					 u32 offset, u32 val)
+{
+	iowrite32(val, data->base_addr + offset);
+}
+
+static inline void btintel_pcie_set_reg_bits(struct btintel_pcie_data *data,
+					     u32 offset, u32 bits)
+{
+	u32 r;
+
+	r = ioread32(data->base_addr + offset);
+	r |= bits;
+	iowrite32(r, data->base_addr + offset);
+}
+
+static inline void btintel_pcie_clr_reg_bits(struct btintel_pcie_data *data,
+					     u32 offset, u32 bits)
+{
+	u32 r;
+
+	r = ioread32(data->base_addr + offset);
+	r &= ~bits;
+	iowrite32(r, data->base_addr + offset);
+}
-- 
2.40.1


