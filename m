Return-Path: <linux-bluetooth+bounces-14182-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD815B0C04B
	for <lists+linux-bluetooth@lfdr.de>; Mon, 21 Jul 2025 11:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D0D616CDEB
	for <lists+linux-bluetooth@lfdr.de>; Mon, 21 Jul 2025 09:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C00D28C2D0;
	Mon, 21 Jul 2025 09:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D/TO1xgk"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1F828C5B7
	for <linux-bluetooth@vger.kernel.org>; Mon, 21 Jul 2025 09:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753090106; cv=none; b=AQQz+R4rAEi3+Hr6SvnzKGXsM55CE/bcYX9fgE8615cQZGLVAKWCrNS0s62IEkOgPyz4BM1+3griuFV1+TB84KqVPZI5jx7GzPOAbMAzgRdduY4u2IPnJXESofnKwStKQePeg4pe0Qn2iJz3UmxKgXLruH4ozhws261l1X0ZgFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753090106; c=relaxed/simple;
	bh=NgoLQg+L8FiqZuqaJkXjmDSWPuowQ0s4nTuOO8bu03Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nE7w2nvo3H5VQjGdX5inDgdP9pOHgio5yp4PKjgzJx447jAyDCqLnGQ5H7XBFz+uI/du4KaEvEkf7Sukyqf/GJDpFexFB1s5wGDFGw/mQZmUSMnavcE6A6BZnb7Og+RokkVP4MU0p+JDJiAgHwcjQNpqDMexrr/f4aTc5Vf3No8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D/TO1xgk; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753090105; x=1784626105;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NgoLQg+L8FiqZuqaJkXjmDSWPuowQ0s4nTuOO8bu03Q=;
  b=D/TO1xgkekz47Q9f+8kItjbuZW7N7Ercze9kv3Y8C4LNlNPaZY5AQjGB
   N2JiP8ctLxxf/UvQhoF305ccXeOj9Qw3qNZwxEwr+6QaEoTVgANm2oP3u
   OsCqR39kBAPSK1pZFBz0m6sRUTYhn41oBjYk4baxNKWycvbhm+ytQ9puY
   1vD+nRIccz7NdIzs4Q3dwCCT9hlIUViSUR37nASjUbcCgpaduuSCuy58B
   TyLzw1WHHlEQL023TDbJKi8sZ/VSVBaFPJAbuYxQT1aS07byTQosoC9Ws
   9jNOeLLdzONnmunrrFwv8KQf2BhUG/3WoNDZD5xBeDT5QO0Y6tw6A6sLC
   g==;
X-CSE-ConnectionGUID: ZR9gIq9LSOm9poXdsWGOCg==
X-CSE-MsgGUID: uJjBb6EpTy+o247wBWPiBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="65558535"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="65558535"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 02:28:24 -0700
X-CSE-ConnectionGUID: I6t0Yvn0RIiE+cUAlymVQg==
X-CSE-MsgGUID: TdptltFFQoacte14lCfHOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="182493052"
Received: from unknown (HELO intel-Lenovo-Legion-Y540-15IRH-PG0.iind.intel.com) ([10.224.186.95])
  by fmviesa002.fm.intel.com with ESMTP; 21 Jul 2025 02:28:06 -0700
From: Kiran K <kiran.k@intel.com>
To: linux-bluetooth@vger.kernel.org
Cc: ravishankar.srivatsa@intel.com,
	chethan.tumkur.narayan@intel.com,
	chandrashekar.devegowda@intel.com,
	aluvala.sai.teja@intel.com,
	Kiran K <kiran.k@intel.com>
Subject: [PATCH v3 2/2] Bluetooth: btintel_pcie: Fix Alive Context State Handling
Date: Mon, 21 Jul 2025 15:14:37 +0530
Message-ID: <20250721094437.1163753-2-kiran.k@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250721094437.1163753-1-kiran.k@intel.com>
References: <20250721094437.1163753-1-kiran.k@intel.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The firmware raises an alive interrupt upon sending the HCI_RESET or
BTINTEL_HCI_OP_RESET command. As part of handling the reset command,
firmware initializes the hardware and data path and raises the alive
interrupt. Upon receiving the alive interrupt, the driver must enable
the data path and grant RX buffers to the firmware before sending any
commands.

The alive context maintained in the driver must be updated before
sending BTINTEL_HCI_OP_RESET or HCI_OP_RESET to prevent a potential race
condition where the context is also updated in the threaded IRQ.

The issue was observed in a stress reboot usecase (1/25) using "sudo
reboot" command where the firmware download was failing as the driver
was not granting RX buffer to firmware due to race condition.

Bluetooth: hci0: API lock is disabled
Bluetooth: hci0: Debug lock is disabled
Bluetooth: hci0: Minimum firmware build 1 week 10 2014
Bluetooth: hci0: Bootloader timestamp 2023.43 buildtype 1 build 11631
Bluetooth: hci0: Found device firmware: intel/ibt-00a0-00a1-iml.sfi
Bluetooth: hci0: Boot Address: 0xb0301000
Bluetooth: hci0: Firmware Version: 167-12.25
Bluetooth: hci0: Waiting for firmware download to complete
Bluetooth: hci0: Firmware loaded in 99902 usecs
Bluetooth: hci0: Alive context: fw_dl old_boot_stage: 0xa0db0003
           new_boot_stage: 0xa0db0003
Bluetooth: hci0: sent cmd: 0xfc01 alive context changed:
           fw_dl  ->  intel_reset1
Bluetooth: hci0: Waiting for device to boot
Bluetooth: hci0: Device boot timeout
Bluetooth: hci0: Firmware download retry count: 1

Fixes: 05c200c8f029 ("Bluetooth: btintel_pcie: Add handshake between driver and firmware")
Signed-off-by: Kiran K <kiran.k@intel.com>
Signed-off-by: Sai Teja Aluvala <aluvala.sai.teja@intel.com>
---
changes in v3:
- Move wait_event_timeout() for alive interrupt inside btintel_pcie_send_sync()

changes in v2:
- Address review comments

 drivers/bluetooth/btintel_pcie.c | 117 ++++++++++++++++---------------
 1 file changed, 62 insertions(+), 55 deletions(-)

diff --git a/drivers/bluetooth/btintel_pcie.c b/drivers/bluetooth/btintel_pcie.c
index a17c438784ae..6e7bbbd35279 100644
--- a/drivers/bluetooth/btintel_pcie.c
+++ b/drivers/bluetooth/btintel_pcie.c
@@ -118,6 +118,28 @@ struct btintel_pcie_removal {
 static LIST_HEAD(btintel_pcie_recovery_list);
 static DEFINE_SPINLOCK(btintel_pcie_recovery_lock);
 
+static inline char *btintel_pcie_alivectxt_state2str(u32 alive_intr_ctxt)
+{
+	switch (alive_intr_ctxt) {
+	case BTINTEL_PCIE_ROM:
+		return "rom";
+	case BTINTEL_PCIE_FW_DL:
+		return "fw_dl";
+	case BTINTEL_PCIE_D0:
+		return "d0";
+	case BTINTEL_PCIE_D3:
+		return "d3";
+	case BTINTEL_PCIE_HCI_RESET:
+		return "hci_reset";
+	case BTINTEL_PCIE_INTEL_HCI_RESET1:
+		return "intel_reset1";
+	case BTINTEL_PCIE_INTEL_HCI_RESET2:
+		return "intel_reset2";
+	default:
+		return "unknown";
+	}
+}
+
 /* This function initializes the memory for DBGC buffers and formats the
  * DBGC fragment which consists header info and DBGC buffer's LSB, MSB and
  * size as the payload
@@ -318,10 +340,14 @@ static inline void btintel_pcie_dump_debug_registers(struct hci_dev *hdev)
 }
 
 static int btintel_pcie_send_sync(struct btintel_pcie_data *data,
-				  struct sk_buff *skb)
+				  struct sk_buff *skb, u32 pkt_type, u16 opcode)
 {
 	int ret;
 	u16 tfd_index;
+	u32 old_ctxt;
+	bool wait_on_alive = false;
+	struct hci_dev *hdev = data->hdev;
+
 	struct txq *txq = &data->txq;
 
 	tfd_index = data->ia.tr_hia[BTINTEL_PCIE_TXQ_NUM];
@@ -329,6 +355,26 @@ static int btintel_pcie_send_sync(struct btintel_pcie_data *data,
 	if (tfd_index > txq->count)
 		return -ERANGE;
 
+	/* Firmware raises alive interrupt on HCI_OP_RESET or
+	 * BTINTEL_HCI_OP_RESET
+	 */
+	wait_on_alive = (pkt_type == BTINTEL_PCIE_HCI_CMD_PKT &&
+		(opcode == BTINTEL_HCI_OP_RESET || opcode == HCI_OP_RESET));
+
+	if (wait_on_alive) {
+		data->gp0_received = false;
+		old_ctxt = data->alive_intr_ctxt;
+		data->alive_intr_ctxt =
+			(opcode == BTINTEL_HCI_OP_RESET ? BTINTEL_PCIE_INTEL_HCI_RESET1 :
+				BTINTEL_PCIE_HCI_RESET);
+		bt_dev_dbg(data->hdev, "sending cmd: 0x%4.4x alive context changed: %s  ->  %s",
+			   opcode, btintel_pcie_alivectxt_state2str(old_ctxt),
+			   btintel_pcie_alivectxt_state2str(data->alive_intr_ctxt));
+	}
+
+	memcpy(skb_push(skb, BTINTEL_PCIE_HCI_TYPE_LEN), &pkt_type,
+	       BTINTEL_PCIE_HCI_TYPE_LEN);
+
 	/* Prepare for TX. It updates the TFD with the length of data and
 	 * address of the DMA buffer, and copy the data to the DMA buffer
 	 */
@@ -347,11 +393,24 @@ static int btintel_pcie_send_sync(struct btintel_pcie_data *data,
 	ret = wait_event_timeout(data->tx_wait_q, data->tx_wait_done,
 				 msecs_to_jiffies(BTINTEL_PCIE_TX_WAIT_TIMEOUT_MS));
 	if (!ret) {
-		bt_dev_err(data->hdev, "tx completion timeout");
+		bt_dev_err(data->hdev, "Timeout (%u ms) on tx completion",
+			   BTINTEL_PCIE_TX_WAIT_TIMEOUT_MS);
 		btintel_pcie_dump_debug_registers(data->hdev);
 		return -ETIME;
 	}
 
+	if (wait_on_alive) {
+		ret = wait_event_timeout(data->gp0_wait_q,
+					 data->gp0_received,
+					 msecs_to_jiffies(BTINTEL_DEFAULT_INTR_TIMEOUT_MS));
+		if (!ret) {
+			hdev->stat.err_tx++;
+			bt_dev_err(hdev, "Timeout (%u ms)  on alive interrupt, alive context: %s",
+				   BTINTEL_DEFAULT_INTR_TIMEOUT_MS,
+				   btintel_pcie_alivectxt_state2str(data->alive_intr_ctxt));
+			return  -ETIME;
+		}
+	}
 	return 0;
 }
 
@@ -830,28 +889,6 @@ static void btintel_pcie_wr_sleep_cntrl(struct btintel_pcie_data *data,
 	btintel_pcie_wr_reg32(data, BTINTEL_PCIE_CSR_IPC_SLEEP_CTL_REG, dxstate);
 }
 
-static inline char *btintel_pcie_alivectxt_state2str(u32 alive_intr_ctxt)
-{
-	switch (alive_intr_ctxt) {
-	case BTINTEL_PCIE_ROM:
-		return "rom";
-	case BTINTEL_PCIE_FW_DL:
-		return "fw_dl";
-	case BTINTEL_PCIE_D0:
-		return "d0";
-	case BTINTEL_PCIE_D3:
-		return "d3";
-	case BTINTEL_PCIE_HCI_RESET:
-		return "hci_reset";
-	case BTINTEL_PCIE_INTEL_HCI_RESET1:
-		return "intel_reset1";
-	case BTINTEL_PCIE_INTEL_HCI_RESET2:
-		return "intel_reset2";
-	default:
-		return "unknown";
-	}
-}
-
 static int btintel_pcie_read_device_mem(struct btintel_pcie_data *data,
 					void *buf, u32 dev_addr, int len)
 {
@@ -1951,7 +1988,6 @@ static int btintel_pcie_send_frame(struct hci_dev *hdev,
 	__u16 opcode = ~0;
 	int ret;
 	u32 type;
-	u32 old_ctxt;
 
 	if (test_bit(BTINTEL_PCIE_CORE_HALTED, &data->flags))
 		return -ENODEV;
@@ -1988,12 +2024,6 @@ static int btintel_pcie_send_frame(struct hci_dev *hdev,
 				btintel_pcie_inject_cmd_complete(hdev, opcode);
 		}
 
-		/* Firmware raises alive interrupt on HCI_OP_RESET or
-		 * BTINTEL_HCI_OP_RESET
-		 */
-		if (opcode == HCI_OP_RESET || opcode == BTINTEL_HCI_OP_RESET)
-			data->gp0_received = false;
-
 		hdev->stat.cmd_tx++;
 		break;
 	case HCI_ACLDATA_PKT:
@@ -2011,37 +2041,14 @@ static int btintel_pcie_send_frame(struct hci_dev *hdev,
 		bt_dev_err(hdev, "Unknown HCI packet type");
 		return -EILSEQ;
 	}
-	memcpy(skb_push(skb, BTINTEL_PCIE_HCI_TYPE_LEN), &type,
-	       BTINTEL_PCIE_HCI_TYPE_LEN);
 
-	ret = btintel_pcie_send_sync(data, skb);
+	ret = btintel_pcie_send_sync(data, skb, type, opcode);
 	if (ret) {
 		hdev->stat.err_tx++;
 		bt_dev_err(hdev, "Failed to send frame (%d)", ret);
 		goto exit_error;
 	}
 
-	if (type == BTINTEL_PCIE_HCI_CMD_PKT &&
-	    (opcode == HCI_OP_RESET || opcode == BTINTEL_HCI_OP_RESET)) {
-		old_ctxt = data->alive_intr_ctxt;
-		data->alive_intr_ctxt =
-			(opcode == BTINTEL_HCI_OP_RESET ? BTINTEL_PCIE_INTEL_HCI_RESET1 :
-				BTINTEL_PCIE_HCI_RESET);
-		bt_dev_dbg(data->hdev, "sent cmd: 0x%4.4x alive context changed: %s  ->  %s",
-			   opcode, btintel_pcie_alivectxt_state2str(old_ctxt),
-			   btintel_pcie_alivectxt_state2str(data->alive_intr_ctxt));
-		ret = wait_event_timeout(data->gp0_wait_q,
-					 data->gp0_received,
-					 msecs_to_jiffies(BTINTEL_DEFAULT_INTR_TIMEOUT_MS));
-		if (!ret) {
-			hdev->stat.err_tx++;
-			bt_dev_err(hdev, "Timeout on alive interrupt (%u ms). Alive context: %s",
-				   BTINTEL_DEFAULT_INTR_TIMEOUT_MS,
-				   btintel_pcie_alivectxt_state2str(data->alive_intr_ctxt));
-			ret = -ETIME;
-			goto exit_error;
-		}
-	}
 	hdev->stat.byte_tx += skb->len;
 	kfree_skb(skb);
 
-- 
2.43.0


